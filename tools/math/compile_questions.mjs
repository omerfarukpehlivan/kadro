#!/usr/bin/env node
/**
 * Kadro Soru Derleyicisi — TASK-172
 * Markdown soru dosyalarını doğrular, şekilleri SVG'ye çizer ve Supabase'e yüklenecek
 * idempotent SQL üretir (aynı dosya iki kez çalıştırılırsa soru çiftlenmez, güncellenir).
 *
 * Kullanım:
 *   node tools/math/compile_questions.mjs                 → docs/soru_havuzu/matematik/*.md derlenir
 *   node tools/math/compile_questions.mjs --check         → yalnızca doğrulama (hata varsa çıkış kodu 1)
 *   node tools/math/compile_questions.mjs --file <yol.md> → tek dosya
 *   node tools/math/compile_questions.mjs --dir <klasör>  → başka bir ders klasörü
 *   node tools/math/compile_questions.mjs --preview       → ayrıca _onizleme.html (KaTeX + şekiller)
 *
 * Biçim: docs/soru_havuzu/matematik/FORMAT.md
 */
import { createHash } from "node:crypto";
import { existsSync, mkdirSync, readFileSync, readdirSync, writeFileSync } from "node:fs";
import { basename, dirname, join, relative, resolve } from "node:path";
import { fileURLToPath, pathToFileURL } from "node:url";

import { loadCanonicalCurriculum, parseFrontmatter } from "../konu_anlatimi_to_sql.mjs";
import { evalExpr, nearlyEqual } from "./expr.mjs";
import { renderFigure } from "./figure.mjs";
import { lintMathText } from "./latex_lint.mjs";
import { cleanQuestionText, parseMathSegments } from "./mathtext.mjs";
import { optionValue } from "./option_value.mjs";

const ROOT = resolve(dirname(fileURLToPath(import.meta.url)), "..", "..");
const DEFAULT_DIR = join(ROOT, "docs", "soru_havuzu", "matematik");

/** Soru kimliklerinden deterministik UUID üreten ad alanı (değiştirilmemeli!). */
const QUESTION_NAMESPACE = "8a3f4c2e-91b7-4d6a-b5e0-3c7d9f1a2b64";
const OPTION_LETTERS = ["A", "B", "C", "D", "E"];

// ---------------------------------------------------------------------------
/** RFC 4122 sürüm 5 (SHA-1) UUID. */
export function uuidV5(name, namespace = QUESTION_NAMESPACE) {
  const ns = Buffer.from(namespace.replace(/-/g, ""), "hex");
  const hash = createHash("sha1").update(Buffer.concat([ns, Buffer.from(name, "utf8")])).digest();
  const b = hash.subarray(0, 16);
  b[6] = (b[6] & 0x0f) | 0x50;
  b[8] = (b[8] & 0x3f) | 0x80;
  const h = b.toString("hex");
  return `${h.slice(0, 8)}-${h.slice(8, 12)}-${h.slice(12, 16)}-${h.slice(16, 20)}-${h.slice(20)}`;
}

// ---------------------------------------------------------------------------
let katex = null;
/** kadro-web'de KaTeX kuruluysa her matematik parçasını gerçekten render ederek denetler. */
async function loadKatex() {
  const p = join(ROOT, "..", "kadro-web", "node_modules", "katex", "dist", "katex.mjs");
  if (!existsSync(p)) return null;
  try {
    return (await import(pathToFileURL(p).href)).default;
  } catch {
    return null;
  }
}
function katexErrors(raw, where) {
  if (!katex || !raw) return [];
  const errors = [];
  for (const seg of parseMathSegments(raw.replace(/\\\$/g, "\u0000"))) {
    if (seg.type !== "math") continue;
    try {
      katex.renderToString(seg.value, { throwOnError: true, displayMode: seg.display, strict: "error" });
    } catch (e) {
      errors.push(`${where}: KaTeX hatası (${String(e.message).replace(/^KaTeX parse error: /, "")}) → $${seg.value}$`);
    }
  }
  return errors;
}

// ---------------------------------------------------------------------------
const SECTION_RE = /^\*\*(Soru|Şekil|Şıklar|Açıklama|Çeldirici Tuzağı):\*\*\s*$/;
const FIELD_RE = /^-\s*(zorluk|dogru|doğru|dogrulama|doğrulama|degerler|değerler)\s*:\s*(.*)$/;

/** Bir Markdown soru dosyasını ayrıştırıp doğrular. */
export function parseQuestionFile(content, { fileName, curriculum }) {
  const errors = [];
  const warnings = [];
  const { meta, body, hasFrontmatter } = parseFrontmatter(content);
  if (!hasFrontmatter) errors.push(`${fileName}: ön bilgi (--- ders/konu/kod/kapsam ---) eksik`);
  const lesson = meta.ders;
  const topic = meta.konu;
  const code = meta.kod;
  const scopes = Array.isArray(meta.kapsam) ? meta.kapsam : meta.kapsam ? [meta.kapsam] : [];
  const fileNo = /^(\d{2})_/.exec(fileName)?.[1];

  if (!lesson) errors.push(`${fileName}: "ders" eksik`);
  if (!topic) errors.push(`${fileName}: "konu" eksik`);
  if (!code || !/^[a-z]{2,6}$/.test(code)) errors.push(`${fileName}: "kod" 2-6 küçük harf olmalı (ör. mat)`);
  if (!scopes.length) errors.push(`${fileName}: "kapsam" eksik (ör. [lisans_gygk, b_grubu_gygk])`);
  if (!fileNo) errors.push(`${fileName}: dosya adı NN_konu.md biçiminde olmalı`);
  if (lesson && curriculum) {
    const topics = curriculum.get(lesson);
    if (!topics) errors.push(`${fileName}: kanonik olmayan ders adı "${lesson}"`);
    else if (topic && !topics.includes(topic))
      errors.push(`${fileName}: "${topic}" bu dersin kanonik konusu değil. Geçerli konular: ${topics.join(" | ")}`);
  }

  const questions = [];
  const blocks = body.split(/^### +/m).slice(1);
  if (!blocks.length) errors.push(`${fileName}: hiç soru yok (her soru "### ${code ?? "mat"}-${fileNo ?? "NN"}-001" başlığıyla başlar)`);

  for (const block of blocks) {
    const lines = block.replace(/\r/g, "").split("\n");
    const key = lines[0].trim();
    const where = `${fileName} › ${key}`;
    const q = { key, fields: {}, sections: {}, errors: [], warnings: [] };
    const idRe = new RegExp(`^${code}-${fileNo}-(\\d{3})$`);
    if (!idRe.test(key)) q.errors.push(`${where}: kimlik "${code}-${fileNo}-NNN" biçiminde olmalı`);

    let current = null;
    let inFence = false;
    for (const line of lines.slice(1)) {
      if (!inFence) {
        const sm = SECTION_RE.exec(line.trim());
        if (sm) {
          current = sm[1];
          if (q.sections[current] !== undefined) q.errors.push(`${where}: "${current}" bölümü iki kez yazılmış`);
          q.sections[current] = "";
          continue;
        }
        const fm = current === null ? FIELD_RE.exec(line.trim()) : null;
        if (fm) {
          const k = fm[1].normalize("NFD").replace(/[̀-ͯ]/g, "").replace("ı", "i");
          q.fields[k] = fm[2].trim();
          continue;
        }
      }
      if (/^```/.test(line.trim())) inFence = !inFence;
      if (current) q.sections[current] += line + "\n";
      else if (line.trim() && !/^---+$/.test(line.trim())) q.errors.push(`${where}: tanınmayan satır → "${line.trim().slice(0, 50)}"`);
    }
    for (const k of Object.keys(q.sections)) q.sections[k] = q.sections[k].trim();
    validateQuestion(q, where);
    questions.push(q);
  }

  for (const q of questions) {
    errors.push(...q.errors);
    warnings.push(...q.warnings);
  }
  return { meta: { lesson, topic, code, scopes, fileNo }, questions, errors, warnings };
}

function validateQuestion(q, where) {
  const E = (m) => q.errors.push(`${where}: ${m}`);
  const W = (m) => q.warnings.push(`${where}: ${m}`);
  const f = q.fields;
  const s = q.sections;

  // Zorluk ve doğru şık
  q.difficulty = Number(f.zorluk);
  if (![1, 2, 3].includes(q.difficulty)) E(`zorluk 1, 2 veya 3 olmalı (yazılan: "${f.zorluk ?? ""}")`);
  q.correctIndex = OPTION_LETTERS.indexOf((f.dogru ?? "").toUpperCase());
  if (q.correctIndex < 0) E(`dogru A-E harflerinden biri olmalı (yazılan: "${f.dogru ?? ""}")`);

  // Bölümler
  for (const name of ["Soru", "Şıklar", "Açıklama", "Çeldirici Tuzağı"]) {
    if (!s[name]) E(`"**${name}:**" bölümü eksik veya boş`);
  }
  q.prompt = cleanQuestionText(s.Soru ?? "");
  q.explanation = cleanQuestionText(s["Açıklama"] ?? "");
  q.trap = cleanQuestionText(s["Çeldirici Tuzağı"] ?? "");

  // Şıklar
  q.options = [];
  if (s["Şıklar"]) {
    const optLines = s["Şıklar"].split("\n").map((l) => l.trim()).filter(Boolean);
    for (const [i, line] of optLines.entries()) {
      const m = /^([A-E])\)\s*(.+)$/.exec(line);
      if (!m) {
        E(`şık satırı "A) ..." biçiminde olmalı → "${line.slice(0, 40)}"`);
        continue;
      }
      if (m[1] !== OPTION_LETTERS[i]) E(`şıklar A'dan E'ye sırayla yazılmalı (${i + 1}. satır "${m[1]})")`);
      q.options.push(cleanQuestionText(m[2]));
    }
    if (q.options.length !== 5) E(`tam 5 şık olmalı (bulunan: ${q.options.length})`);
    const norm = q.options.map((o) => o.replace(/\s+/g, "").toLowerCase());
    if (new Set(norm).size !== norm.length) E("aynı metne sahip iki şık var");
  }

  // Metin uzunlukları ve içerik kuralları
  if (q.prompt && q.prompt.length < 15) E("soru metni çok kısa");
  if (q.explanation && q.explanation.length < 60) E("açıklama çok kısa (çözüm adımlarını yazın)");
  if (q.trap && q.trap.length < 40) E("çeldirici tuzağı çok kısa");
  if (q.trap && !/(^|[^A-Za-zÇĞİÖŞÜçğıöşü])[A-E](\)|\s+şıkk|\s+seçene|['’])/.test(q.trap))
    W("çeldirici tuzağı yanlış şıkkı harfiyle anmıyor (ör. \"B şıkkı\")");
  if (q.correctIndex >= 0 && q.trap) {
    const letter = OPTION_LETTERS[q.correctIndex];
    if (new RegExp(`(^|[^A-Za-zÇĞİÖŞÜçğıöşü])${letter}\\s+şıkkı(nı|na)?\\s+(seçen|işaretleyen)`).test(q.trap))
      W(`çeldirici tuzağı doğru şıkkı (${letter}) yanlış seçilmiş gibi anlatıyor olabilir`);
  }
  const allText = [q.prompt, q.explanation, q.trap, ...q.options].join("\n");
  if (/!\[|<img|https?:\/\//i.test(allText)) E("resim bağlantısı veya URL kullanılamaz; şekiller **Şekil:** bölümünde tarif edilir");
  if (/[\u{1F300}-\u{1FAFF}]/u.test(allText)) E("emoji kullanılamaz");
  if (/ÖSYM\s*\d{4}|\b(19|20)\d{2}\s*KPSS/i.test(q.prompt)) E("soru metni çıkmış soru/yıl atfı içeremez (özgün içerik kuralı)");

  // LaTeX denetimi
  const lintTargets = [
    ["soru", s.Soru],
    ["açıklama", s["Açıklama"]],
    ["tuzak", s["Çeldirici Tuzağı"]],
    ...q.options.map((o, i) => [`${OPTION_LETTERS[i]} şıkkı`, o]),
  ];
  for (const [label, text] of lintTargets) {
    for (const e of lintMathText(text ?? "", label)) E(e);
    for (const e of katexErrors(text ?? "", label)) E(e);
  }

  // Şekil
  q.figureSvg = null;
  if (s["Şekil"] !== undefined) {
    const fence = /^```(?:json)?\s*\n([\s\S]*?)\n```$/.exec(s["Şekil"]);
    if (!fence) E("**Şekil:** bölümü ```json ... ``` bloğu olmalı");
    else {
      try {
        q.figureSpec = JSON.parse(fence[1]);
        q.figureSvg = renderFigure(q.figureSpec);
      } catch (e) {
        E(`şekil çizilemedi → ${e.message}`);
      }
    }
  }
  if (/şekil(de|deki)|grafik(te|teki)|tablo(da|daki)/i.test(q.prompt) && s["Şekil"] === undefined)
    W("soru bir şekle/grafiğe/tabloya atıf yapıyor ama **Şekil:** bölümü yok");

  // Sayısal doğrulama
  const dog = f.dogrulama;
  q.verified = false;
  if (dog === undefined) {
    E('"- dogrulama:" alanı eksik (sayısal cevapta ifade, sözel cevapta "yok" yazın)');
    return;
  }
  const auto = q.options.map(optionValue);
  const autoCount = auto.filter((v) => v !== null).length;
  let values = null;
  if (f.degerler !== undefined) {
    const parts = f.degerler.split("|").map((p) => p.trim());
    if (parts.length !== 5) E(`degerler "|" ile ayrılmış 5 ifade olmalı (bulunan: ${parts.length})`);
    else {
      try {
        values = parts.map((p) => evalExpr(p));
      } catch (e) {
        E(`degerler hesaplanamadı → ${e.message}`);
      }
    }
    if (values) {
      values.forEach((v, i) => {
        if (auto[i] !== null && !nearlyEqual(auto[i], v, 1e-6))
          E(`degerler'deki ${OPTION_LETTERS[i]} değeri (${v}) şık metninin değeriyle (${auto[i]}) uyuşmuyor`);
      });
    }
  } else if (autoCount === 5) {
    values = auto;
  }

  if (values) {
    for (let i = 0; i < 5; i++)
      for (let j = i + 1; j < 5; j++)
        if (nearlyEqual(values[i], values[j], 1e-6))
          E(`${OPTION_LETTERS[i]} ve ${OPTION_LETTERS[j]} şıkları sayısal olarak eşit (${values[i]})`);
  }

  if (/^yok\b/i.test(dog)) {
    if (autoCount === 5) E('şıkların hepsi sayı; "dogrulama: yok" yerine cevabı hesaplayan ifade yazın');
    if (f.degerler !== undefined) E('"dogrulama: yok" iken degerler yazılmaz');
    return;
  }
  if (!values) {
    E("şıklar sayıya çevrilemedi; \"- degerler: v1 | v2 | v3 | v4 | v5\" alanını yazın");
    return;
  }
  let expected;
  try {
    expected = evalExpr(dog);
  } catch (e) {
    E(`dogrulama ifadesi hesaplanamadı → ${e.message}`);
    return;
  }
  if (!Number.isFinite(expected)) {
    E(`dogrulama sonucu sayı değil (${expected})`);
    return;
  }
  const matches = values.map((v, i) => (nearlyEqual(v, expected, 1e-6) ? i : -1)).filter((i) => i >= 0);
  if (!matches.length) E(`dogrulama sonucu ${round(expected)} hiçbir şıkla eşleşmiyor (şıklar: ${values.map(round).join(", ")})`);
  else if (q.correctIndex >= 0 && !matches.includes(q.correctIndex))
    E(`CEVAP ANAHTARI HATALI: dogrulama ${round(expected)} = ${OPTION_LETTERS[matches[0]]} şıkkı, ama dogru: ${OPTION_LETTERS[q.correctIndex]}`);
  else q.verified = true;
}

const round = (v) => Math.round(v * 1e6) / 1e6;

// ---------------------------------------------------------------------------
const sqlStr = (v) => (v === null || v === undefined ? "null" : `'${String(v).replace(/'/g, "''")}'`);

export function buildSql(parsed, sourceRel) {
  const { meta, questions } = parsed;
  const rows = questions.map((q) => {
    const id = uuidV5(q.key);
    const interaction = JSON.stringify({ options: q.options, correctIndex: q.correctIndex });
    const scopes = `array[${meta.scopes.map(sqlStr).join(", ")}]::text[]`;
    return (
      `  -- ${q.key}${q.figureSvg ? " · şekilli" : ""}${q.verified ? " · doğrulandı" : ""}\n` +
      `  (${sqlStr(id)}::uuid, ${sqlStr(meta.lesson)}, ${sqlStr(meta.topic)}, 'multiple_choice', ${q.difficulty},\n` +
      `   ${sqlStr(q.prompt)},\n` +
      `   ${sqlStr(interaction)}::jsonb,\n` +
      `   ${sqlStr(q.explanation)},\n` +
      `   ${sqlStr(q.trap)},\n` +
      `   ${scopes}, null, ${sqlStr(q.figureSvg)}, true)`
    );
  });
  return (
    `-- ==========================================================================\n` +
    `-- KADRO SORU HAVUZU · ${meta.lesson} · ${meta.topic} (${questions.length} soru)\n` +
    `-- Kaynak: ${sourceRel} · Üretici: tools/math/compile_questions.mjs (elle düzenlemeyin)\n` +
    `-- Önkoşul: docs/supabase_migrations/12_math_figures.sql\n` +
    `-- İdempotent: soru kimlikleri sabit UUID'dir; dosya tekrar çalıştırılırsa sorular güncellenir.\n` +
    `-- ==========================================================================\n\n` +
    `insert into public.questions (\n  id, lesson, topic, question_type, difficulty, prompt_text, interaction_data,\n` +
    `  explanation, distractor_trap, exam_scopes, education_level, figure_svg, is_active\n) values\n` +
    rows.join(",\n") +
    `\non conflict (id) do update set\n` +
    `  lesson = excluded.lesson, topic = excluded.topic, question_type = excluded.question_type,\n` +
    `  difficulty = excluded.difficulty, prompt_text = excluded.prompt_text,\n` +
    `  interaction_data = excluded.interaction_data, explanation = excluded.explanation,\n` +
    `  distractor_trap = excluded.distractor_trap, exam_scopes = excluded.exam_scopes,\n` +
    `  education_level = excluded.education_level, figure_svg = excluded.figure_svg, is_active = true;\n`
  );
}

// ---------------------------------------------------------------------------
function escHtml(s) {
  return String(s).replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
}

export function buildPreview(all) {
  const cards = all
    .flatMap(({ parsed }) =>
      parsed.questions.map((q) => {
        const opts = q.options
          .map(
            (o, i) =>
              `<li class="${i === q.correctIndex ? "ok" : ""}"><b>${OPTION_LETTERS[i]})</b> <span class="m">${escHtml(o)}</span></li>`
          )
          .join("");
        return `<article><header><code>${escHtml(q.key)}</code> · ${escHtml(parsed.meta.topic)} · zorluk ${q.difficulty}
${q.verified ? '<span class="tag ok">doğrulandı</span>' : '<span class="tag">sözel</span>'}
${q.errors.length ? `<span class="tag err">${q.errors.length} hata</span>` : ""}</header>
<p class="m">${escHtml(q.prompt)}</p>${q.figureSvg ? `<div class="fig">${q.figureSvg}</div>` : ""}
<ol>${opts}</ol><details><summary>Açıklama ve tuzak</summary><p class="m">${escHtml(q.explanation)}</p>
<p class="m trap">${escHtml(q.trap)}</p></details>${q.errors.map((e) => `<p class="err">${escHtml(e)}</p>`).join("")}</article>`;
      })
    )
    .join("\n");
  return `<!doctype html><html lang="tr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>Soru Önizleme</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.16.22/dist/katex.min.css">
<script defer src="https://cdn.jsdelivr.net/npm/katex@0.16.22/dist/katex.min.js"></script>
<script defer src="https://cdn.jsdelivr.net/npm/katex@0.16.22/dist/contrib/auto-render.min.js"></script>
<style>
:root{--bg:#f6f7fb;--card:#fff;--fg:#1b1f2e;--muted:#667;--ok:#0e9f6e;--err:#c0392b;--line:#dde1ec}
:root[data-theme=dark]{--bg:#11131a;--card:#1b1e28;--fg:#e8eaf2;--muted:#99a;--line:#2c3040}
body{margin:0;background:var(--bg);color:var(--fg);font:15px/1.6 "DM Sans",system-ui,sans-serif}
main{max-width:760px;margin:0 auto;padding:16px}
article{background:var(--card);border:1px solid var(--line);border-radius:16px;padding:16px;margin:0 0 16px}
header{font-size:13px;color:var(--muted)} p.m{white-space:pre-line} ol{list-style:none;padding:0}
li{padding:8px 12px;border:1px solid var(--line);border-radius:12px;margin:6px 0} li.ok{border-color:var(--ok)}
.fig{color:var(--fg);overflow-x:auto;margin:8px 0}.fig svg{max-width:100%;height:auto}
.tag{border:1px solid var(--line);border-radius:8px;padding:0 6px;margin-left:6px}.tag.ok{color:var(--ok)}.tag.err,.err{color:var(--err)}
.trap{border-left:3px solid #e28400;padding-left:10px} button{position:fixed;top:12px;right:12px}
</style></head><body><button onclick="document.documentElement.dataset.theme=document.documentElement.dataset.theme==='dark'?'':'dark'">Tema</button>
<main><h1>Soru önizleme</h1>${cards}</main>
<script>addEventListener("DOMContentLoaded",()=>renderMathInElement(document.body,{delimiters:[{left:"$$",right:"$$",display:true},{left:"$",right:"$",display:false}],ignoredClasses:["fig"],throwOnError:false}))</script>
</body></html>`;
}

// ---------------------------------------------------------------------------
export async function compileAll({ dir = DEFAULT_DIR, file = null, check = false, preview = false } = {}) {
  katex = await loadKatex();
  const curriculum = loadCanonicalCurriculum();
  const files = file
    ? [resolve(file)]
    : readdirSync(dir)
        .filter((n) => /^\d{2}_.+\.md$/.test(n)) // yalnızca NN_konu.md; FORMAT, prompt, rapor atlanır
        .sort()
        .map((n) => join(dir, n));
  const outDir = join(file ? dirname(resolve(file)) : dir, "sql");
  const all = [];
  const errors = [];
  const warnings = [];
  const seenIds = new Map();
  const seenPrompts = new Map();

  for (const path of files) {
    const fileName = basename(path);
    const parsed = parseQuestionFile(readFileSync(path, "utf8"), { fileName, curriculum });
    errors.push(...parsed.errors);
    warnings.push(...parsed.warnings);
    for (const q of parsed.questions) {
      if (seenIds.has(q.key)) errors.push(`${fileName} › ${q.key}: kimlik ${seenIds.get(q.key)} dosyasında da var`);
      seenIds.set(q.key, fileName);
      const norm = q.prompt.replace(/\s+/g, " ").toLowerCase();
      if (norm && seenPrompts.has(norm)) errors.push(`${fileName} › ${q.key}: aynı soru metni ${seenPrompts.get(norm)} ile tekrar ediyor`);
      seenPrompts.set(norm, q.key);
    }
    all.push({ path, parsed });
  }

  const stats = { files: all.length, questions: 0, verified: 0, figures: 0, difficulty: { 1: 0, 2: 0, 3: 0 }, answers: { A: 0, B: 0, C: 0, D: 0, E: 0 } };
  for (const { parsed } of all) {
    for (const q of parsed.questions) {
      stats.questions++;
      if (q.verified) stats.verified++;
      if (q.figureSvg) stats.figures++;
      if (stats.difficulty[q.difficulty] !== undefined) stats.difficulty[q.difficulty]++;
      if (q.correctIndex >= 0) stats.answers[OPTION_LETTERS[q.correctIndex]]++;
    }
  }

  if (!check && errors.length === 0) {
    mkdirSync(outDir, { recursive: true });
    for (const { path, parsed } of all) {
      const rel = relative(ROOT, path).replace(/\\/g, "/");
      writeFileSync(join(outDir, basename(path).replace(/\.md$/, ".sql")), buildSql(parsed, rel));
    }
  }
  if (preview) writeFileSync(join(file ? dirname(resolve(file)) : dir, "_onizleme.html"), buildPreview(all));
  return { errors, warnings, stats, outDir, katexChecked: Boolean(katex) };
}

// ---------------------------------------------------------------------------
const isMain = process.argv[1] && import.meta.url === pathToFileURL(resolve(process.argv[1])).href;
if (isMain) {
  const args = process.argv.slice(2);
  const opt = (name) => {
    const i = args.indexOf(name);
    return i >= 0 ? args[i + 1] : null;
  };
  const res = await compileAll({
    dir: opt("--dir") ? resolve(opt("--dir")) : DEFAULT_DIR,
    file: opt("--file"),
    check: args.includes("--check"),
    preview: args.includes("--preview"),
  });
  const { stats } = res;
  for (const w of res.warnings) console.log(`UYARI  ${w}`);
  for (const e of res.errors) console.log(`HATA   ${e}`);
  const pct = (n) => (stats.questions ? Math.round((n / stats.questions) * 100) : 0);
  console.log(
    `\n${stats.files} dosya · ${stats.questions} soru · ${stats.verified} sayısal doğrulandı · ${stats.figures} şekilli\n` +
      `zorluk 1/2/3: ${stats.difficulty[1]}/${stats.difficulty[2]}/${stats.difficulty[3]} (%${pct(stats.difficulty[1])}/%${pct(stats.difficulty[2])}/%${pct(stats.difficulty[3])}) · ` +
      `doğru şık dağılımı A-E: ${Object.values(stats.answers).join("/")}\n` +
      `KaTeX render denetimi: ${res.katexChecked ? "açık" : "kapalı (../kadro-web/node_modules/katex bulunamadı)"}`
  );
  if (res.errors.length) {
    console.log(`\n✗ ${res.errors.length} hata — SQL üretilmedi.`);
    process.exit(1);
  }
  console.log(args.includes("--check") ? "\n✓ Doğrulama başarılı." : `\n✓ SQL yazıldı → ${relative(ROOT, res.outDir)}`);
}
