#!/usr/bin/env node
/**
 * Kadro Konu Anlatımı Markdown -> JSONB / SQL Dönüştürücü ve Doğrulayıcı (TASK-169)
 *
 * Kullanım:
 *   node tools/konu_anlatimi_to_sql.mjs            -> Tüm konuları doğrular ve SQL üretir
 *   node tools/konu_anlatimi_to_sql.mjs --check    -> Yalnızca doğrular (hata varsa çıkış kodu 1)
 *   node tools/konu_anlatimi_to_sql.mjs --file docs/konu_anlatimi/tarih/01_islamiyet_oncesi_turk_tarihi.md
 */
import { existsSync, mkdirSync, readdirSync, readFileSync, statSync, writeFileSync } from "node:fs";
import { basename, dirname, join, relative, resolve } from "node:path";
import { pathToFileURL } from "node:url";

const ROOT = resolve(dirname(new URL(import.meta.url).pathname.replace(/^\/([A-Za-z]:)/, "$1")), "..");
const DEFAULT_INPUT_DIR = join(ROOT, "docs", "konu_anlatimi");
const DEFAULT_OUTPUT_DIR = join(ROOT, "docs", "supabase_migrations", "konu_anlatimi");
const KPSS_LESSONS_PATH = join(ROOT, "lib", "features", "lessons", "data", "kpss_lessons.dart");

const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;
const HTML_TAG_RE = /<\/?[a-z][a-z0-9-]*(?:\s[^>]*)?>/i;
const MD_LINK_RE = /!?\[[^\]]*\]\([^)]+\)/;
const RAW_URL_RE = /\bhttps?:\/\/\S+/i;
const EMOJI_RE = /[\u{1F300}-\u{1FAFF}\u{2600}-\u{27BF}]/u;

const CALLOUT_DIRECTIVES = {
  ":::bilgi": "info",
  ":::kodlama": "mnemonic",
  ":::tuzak": "trap",
  ":::ornek": "example",
};

/**
 * Türkçe metni ASCII slug biçimine dönüştürür (id üretimi için).
 */
export function slugifyTr(raw) {
  return String(raw ?? "")
    .trim()
    .replace(/İ/g, "i")
    .replace(/I/g, "i")
    .replace(/ı/g, "i")
    .replace(/Ş/g, "s")
    .replace(/ş/g, "s")
    .replace(/Ğ/g, "g")
    .replace(/ğ/g, "g")
    .replace(/Ü/g, "u")
    .replace(/ü/g, "u")
    .replace(/Ö/g, "o")
    .replace(/ö/g, "o")
    .replace(/Ç/g, "c")
    .replace(/ç/g, "c")
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "_")
    .replace(/^_+|_+$/g, "");
}

/**
 * `lib/features/lessons/data/kpss_lessons.dart` içinden kanonik ders ve konu
 * adlarını (`Map<lessonName, string[] topics>`) ayrıştırır.
 */
export function loadCanonicalCurriculum(lessonsFilePath = KPSS_LESSONS_PATH) {
  const source = readFileSync(lessonsFilePath, "utf8");
  const curriculum = new Map();

  const lessonBlockRe = /Lesson\(\s*id:\s*'([^']+)',\s*name:\s*'([^']+)'[\s\S]*?topics:\s*\[([\s\S]*?)\]\s*,?\s*\)/g;
  let match;
  while ((match = lessonBlockRe.exec(source)) !== null) {
    const lessonName = unescapeDartString(match[2]);
    const topicsRaw = match[3];
    const topics = [];
    const topicItemRe = /'((?:\\'|[^'])*)'/g;
    let topicMatch;
    while ((topicMatch = topicItemRe.exec(topicsRaw)) !== null) {
      topics.push(unescapeDartString(topicMatch[1]));
    }
    curriculum.set(lessonName, topics);
  }
  return curriculum;
}

function unescapeDartString(raw) {
  return raw.replace(/\\'/g, "'").replace(/\\\\/g, "\\");
}

/**
 * YAML benzeri ön bilgi (`--- ... ---`) bloğunu ayrıştırır.
 */
export function parseFrontmatter(content) {
  const normalized = content.replace(/\r\n/g, "\n");
  const match = /^---\n([\s\S]*?)\n---\n([\s\S]*)$/.exec(normalized);
  if (!match) {
    return { meta: {}, body: normalized, hasFrontmatter: false };
  }

  const rawMeta = match[1];
  const body = match[2];
  const meta = {};
  let currentListKey = null;

  for (const rawLine of rawMeta.split("\n")) {
    const line = rawLine.trimEnd();
    if (!line.trim() || line.trim().startsWith("#")) continue;

    const listItemMatch = /^\s*-\s+(.*)$/.exec(line);
    if (listItemMatch && currentListKey) {
      if (!Array.isArray(meta[currentListKey])) meta[currentListKey] = [];
      meta[currentListKey].push(stripQuotes(listItemMatch[1].trim()));
      continue;
    }

    const kvMatch = /^([A-Za-z0-9_]+)\s*:\s*(.*)$/.exec(line.trim());
    if (!kvMatch) continue;
    const key = kvMatch[1];
    const val = kvMatch[2].trim();
    currentListKey = null;

    if (!val) {
      meta[key] = [];
      currentListKey = key;
    } else if (val.startsWith("[") && val.endsWith("]")) {
      const inner = val.slice(1, -1).trim();
      meta[key] = inner
        ? inner.split(",").map((s) => stripQuotes(s.trim())).filter(Boolean)
        : [];
    } else if (val === "true") {
      meta[key] = true;
    } else if (val === "false") {
      meta[key] = false;
    } else if (/^\d+$/.test(val)) {
      meta[key] = Number.parseInt(val, 10);
    } else {
      meta[key] = stripQuotes(val);
    }
  }

  return { meta, body, hasFrontmatter: true };
}

function stripQuotes(s) {
  if ((s.startsWith('"') && s.endsWith('"')) || (s.startsWith("'") && s.endsWith("'"))) {
    return s.slice(1, -1);
  }
  return s;
}

/**
 * Bir bölümdeki blokların okunabilir kelime sayısını hesaplar (`ceil(kelime / 180)` için).
 */
export function countWordsInBlocks(blocks) {
  let words = 0;
  const countStr = (str) => {
    const cleaned = String(str ?? "").replace(/[*_`]/g, " ").trim();
    if (!cleaned) return 0;
    return cleaned.split(/\s+/).filter(Boolean).length;
  };

  for (const block of blocks) {
    switch (block.type) {
      case "heading":
      case "paragraph":
      case "callout":
        words += countStr(block.text);
        break;
      case "bullets":
      case "key_points":
        for (const item of block.items ?? []) words += countStr(item);
        break;
      case "table":
        for (const h of block.headers ?? []) words += countStr(h);
        for (const row of block.rows ?? []) {
          for (const cell of row) words += countStr(cell);
        }
        break;
      case "timeline":
        for (const item of block.items ?? []) {
          words += countStr(item.label) + countStr(item.text);
        }
        break;
      default:
        break;
    }
  }
  return words;
}

function deriveSummaryFromBlocks(blocks) {
  for (const b of blocks) {
    if (b.type === "paragraph" && b.text) {
      const plain = b.text.replace(/\*\*/g, "").replace(/\*/g, "").trim();
      const sentences = plain.match(/[^.!?]+[.!?]+/g);
      if (sentences && sentences.length > 0) {
        return sentences.slice(0, 2).join(" ").trim();
      }
      return plain.slice(0, 180).trim();
    }
  }
  return "";
}

/**
 * Tek bir Markdown bölüm gövdesini `blocks` JSON dizisine ayrıştırır.
 */
export function parseSectionBlocks(sectionBody, sectionLabel = "Bölüm") {
  const lines = sectionBody.replace(/\r\n/g, "\n").split("\n");
  const blocks = [];
  const parseErrors = [];

  let i = 0;
  while (i < lines.length) {
    const rawLine = lines[i];
    const trimmed = rawLine.trim();

    if (!trimmed) {
      i += 1;
      continue;
    }

    // İzin dışı başlık seviyeleri (#, ##, ####...) kontrolü
    if (/^#{1,6}\s+/.test(trimmed) && !trimmed.startsWith("### ")) {
      parseErrors.push(`${sectionLabel}: Yalnızca '### Başlık' alt başlıkları desteklenir ("${trimmed.slice(0, 40)}").`);
      i += 1;
      continue;
    }

    if (trimmed.startsWith("### ")) {
      blocks.push({ type: "heading", text: trimmed.slice(4).trim() });
      i += 1;
      continue;
    }

    // Yönerge blokları (:::tablo, :::zaman, :::bilgi, :::kodlama, :::tuzak, :::ornek, :::akilda-kalsin, :::kontrol)
    if (trimmed.startsWith(":::")) {
      const directive = trimmed.split(/\s+/)[0];
      const innerLines = [];
      let closed = false;
      i += 1;
      while (i < lines.length) {
        if (lines[i].trim() === ":::") {
          closed = true;
          i += 1;
          break;
        }
        innerLines.push(lines[i]);
        i += 1;
      }
      if (!closed) {
        parseErrors.push(`${sectionLabel}: "${directive}" bloğu ':::' ile kapatılmamış.`);
        break;
      }

      const innerText = innerLines.join("\n").trim();

      if (directive in CALLOUT_DIRECTIVES) {
        if (!innerText) {
          parseErrors.push(`${sectionLabel}: "${directive}" bloğu boş olamaz.`);
        } else {
          blocks.push({
            type: "callout",
            kind: CALLOUT_DIRECTIVES[directive],
            text: innerLines.map((l) => l.trim()).filter(Boolean).join(" "),
          });
        }
        continue;
      }

      if (directive === ":::tablo") {
        const tableLines = innerLines.map((l) => l.trim()).filter(Boolean);
        if (tableLines.length < 2) {
          parseErrors.push(`${sectionLabel}: ':::tablo' bloğu başlık ve en az bir veri satırı içermelidir.`);
          continue;
        }
        const splitRow = (rowLine) =>
          rowLine
            .replace(/^\|/, "")
            .replace(/\|$/, "")
            .split("|")
            .map((c) => c.trim());

        const headers = splitRow(tableLines[0]);
        const rows = [];
        for (let r = 1; r < tableLines.length; r += 1) {
          const line = tableLines[r];
          if (/^\|?[\s:-]+(?:\|[\s:-]+)*\|?$/.test(line)) continue; // Ayırıcı satır
          rows.push(splitRow(line));
        }
        blocks.push({ type: "table", headers, rows });
        continue;
      }

      if (directive === ":::zaman") {
        const items = [];
        for (const line of innerLines) {
          const clean = line.trim();
          if (!clean) continue;
          const pipeIdx = clean.indexOf("|");
          if (pipeIdx === -1) {
            parseErrors.push(`${sectionLabel}: ':::zaman' satırı 'YIL | olay' biçiminde olmalıdır ("${clean}").`);
          } else {
            items.push({
              label: clean.slice(0, pipeIdx).trim(),
              text: clean.slice(pipeIdx + 1).trim(),
            });
          }
        }
        blocks.push({ type: "timeline", items });
        continue;
      }

      if (directive === ":::akilda-kalsin") {
        const items = [];
        for (const line of innerLines) {
          const clean = line.trim();
          if (!clean) continue;
          if (/^\s{2,}[-*]\s+/.test(line)) {
            parseErrors.push(`${sectionLabel}: İç içe liste desteklenmez.`);
          }
          items.push(clean.replace(/^[-*]\s+/, "").trim());
        }
        blocks.push({ type: "key_points", items });
        continue;
      }

      if (directive === ":::kontrol") {
        const questionIds = innerLines
          .map((l) => l.trim())
          .filter(Boolean);
        blocks.push({ type: "check_questions", question_ids: questionIds });
        continue;
      }

      parseErrors.push(`${sectionLabel}: Bilinmeyen yönerge blok türü "${directive}".`);
      continue;
    }

    // Madde işaretli liste (- madde)
    if (/^-\s+/.test(trimmed)) {
      const items = [];
      while (i < lines.length) {
        const curRaw = lines[i];
        const curTrimmed = curRaw.trim();
        if (!curTrimmed) break;
        if (/^\s{2,}[-*]\s+/.test(curRaw)) {
          parseErrors.push(`${sectionLabel}: İç içe liste desteklenmez ("${curTrimmed}").`);
          i += 1;
          continue;
        }
        if (!/^-\s+/.test(curTrimmed)) break;
        items.push(curTrimmed.replace(/^-\s+/, "").trim());
        i += 1;
      }
      blocks.push({ type: "bullets", items });
      continue;
    }

    // Düz paragraf (ardışık metin satırlarını birleştir)
    const paraLines = [];
    while (i < lines.length) {
      const cur = lines[i].trim();
      if (!cur || cur.startsWith("#") || cur.startsWith(":::") || /^-\s+/.test(cur)) {
        break;
      }
      paraLines.push(cur);
      i += 1;
    }
    if (paraLines.length > 0) {
      blocks.push({ type: "paragraph", text: paraLines.join(" ") });
    }
  }

  return { blocks, parseErrors };
}

/**
 * Bir `.md` konu anlatımı dosyasının tamamını ayrıştırır ve `TopicLessonUnit`
 * nesneleri listesine dönüştürür.
 */
export function parseTopicMarkdown(markdownContent, sourceFileName = "topic.md") {
  const { meta, body, hasFrontmatter } = parseFrontmatter(markdownContent);
  const errors = [];
  const warnings = [];

  if (!hasFrontmatter) {
    errors.push(`${sourceFileName}: Dosya başında YAML ön bilgisi (--- ... ---) bulunmalıdır.`);
  }

  const lesson = String(meta.lesson ?? "").trim();
  const topic = String(meta.topic ?? "").trim();
  const examScopes = Array.isArray(meta.exam_scopes) && meta.exam_scopes.length > 0
    ? meta.exam_scopes
    : ["b_grubu_gk"];
  const contentVersion = typeof meta.content_version === "number" ? meta.content_version : 1;
  const isPublished = typeof meta.is_published === "boolean" ? meta.is_published : true;

  const lines = body.replace(/\r\n/g, "\n").split("\n");
  const sections = [];
  let currentTitle = null;
  let currentLines = [];

  for (const line of lines) {
    const h2Match = /^##\s+(.+)$/.exec(line.trim());
    if (h2Match) {
      if (currentTitle !== null) {
        sections.push({ title: currentTitle, body: currentLines.join("\n") });
      }
      currentTitle = h2Match[1].trim();
      currentLines = [];
    } else if (currentTitle !== null) {
      currentLines.push(line);
    } else if (line.trim()) {
      errors.push(`${sourceFileName}: İlk '## Bölüm ...' başlığından önce serbest metin bulunamaz.`);
    }
  }
  if (currentTitle !== null) {
    sections.push({ title: currentTitle, body: currentLines.join("\n") });
  }

  const lessonSlug = slugifyTr(lesson);
  const topicSlug = slugifyTr(topic);
  const units = [];

  for (let idx = 0; idx < sections.length; idx += 1) {
    const unitOrder = idx + 1;
    const sec = sections[idx];
    const { blocks, parseErrors } = parseSectionBlocks(sec.body, `Bölüm ${unitOrder}`);
    errors.push(...parseErrors);

    const wordCount = countWordsInBlocks(blocks);
    const estimatedMinutes = Math.max(1, Math.ceil(wordCount / 180));
    const unitNumPadded = String(unitOrder).padStart(2, "0");

    units.push({
      id: `${lessonSlug}.${topicSlug}.${unitNumPadded}`,
      lesson,
      topic,
      unit_order: unitOrder,
      title: sec.title,
      summary: deriveSummaryFromBlocks(blocks),
      estimated_minutes: estimatedMinutes,
      word_count: wordCount,
      blocks,
      exam_scopes: examScopes,
      content_version: contentVersion,
      is_published: isPublished,
    });
  }

  return { meta, units, errors, warnings };
}

function collectTextStringsForFormatCheck(block) {
  const texts = [];
  if (block.text) texts.push(block.text);
  if (Array.isArray(block.items)) {
    for (const item of block.items) {
      if (typeof item === "string") texts.push(item);
      else if (item && typeof item === "object") {
        if (item.label) texts.push(item.label);
        if (item.text) texts.push(item.text);
      }
    }
  }
  if (Array.isArray(block.headers)) texts.push(...block.headers);
  if (Array.isArray(block.rows)) {
    for (const row of block.rows) texts.push(...row);
  }
  return texts;
}

/**
 * Ayrıştırılmış konu anlatımı ünitelerini `FORMAT.md` ve `TASK-169` kurallarına
 * göre doğrular.
 */
export function validateParsedTopic(parsed, canonicalCurriculum, sourceName = "topic.md") {
  const errors = [...parsed.errors];
  const warnings = [...parsed.warnings];
  const { meta, units } = parsed;

  const lesson = String(meta.lesson ?? "").trim();
  const topic = String(meta.topic ?? "").trim();

  if (!lesson) {
    errors.push(`${sourceName}: Ön bilgide 'lesson' alanı zorunludur.`);
  } else if (!canonicalCurriculum.has(lesson)) {
    errors.push(
      `${sourceName}: Geçersiz lesson "${lesson}". Kanonik adlar: ${[...canonicalCurriculum.keys()].join(", ")}.`,
    );
  } else {
    const validTopics = canonicalCurriculum.get(lesson);
    if (!topic) {
      errors.push(`${sourceName}: Ön bilgide 'topic' alanı zorunludur.`);
    } else if (!validTopics.includes(topic)) {
      errors.push(
        `${sourceName}: "${lesson}" dersi için geçersiz topic "${topic}". Beklenenler: ${validTopics.join(", ")}.`,
      );
    }
  }

  if (units.length < 3 || units.length > 8) {
    errors.push(`${sourceName}: Konu başına 3–8 bölüm olmalıdır (mevcut: ${units.length}).`);
  }

  let totalMnemonicCount = 0;

  for (const unit of units) {
    const label = `${sourceName} [Bölüm ${unit.unit_order}]`;
    const blocks = unit.blocks;

    if (unit.word_count < 600 || unit.word_count > 1400) {
      warnings.push(
        `${label}: Kelime sayısı önerilen 600–1.400 aralığının dışında (${unit.word_count} kelime).`,
      );
    }

    const trapCount = blocks.filter((b) => b.type === "callout" && b.kind === "trap").length;
    if (trapCount < 1) {
      errors.push(`${label}: Her bölümde en az 1 ':::tuzak' bloğu bulunmalıdır.`);
    }

    totalMnemonicCount += blocks.filter(
      (b) => b.type === "callout" && b.kind === "mnemonic",
    ).length;

    const keyPointsIndices = [];
    const checkIndices = [];
    blocks.forEach((b, idx) => {
      if (b.type === "key_points") keyPointsIndices.push(idx);
      if (b.type === "check_questions") checkIndices.push(idx);
    });

    if (keyPointsIndices.length !== 1) {
      errors.push(`${label}: Her bölümde tam 1 adet ':::akilda-kalsin' bloğu olmalıdır.`);
    } else {
      const kpIdx = keyPointsIndices[0];
      const kpBlock = blocks[kpIdx];
      if (kpBlock.items.length < 3 || kpBlock.items.length > 5) {
        errors.push(
          `${label}: ':::akilda-kalsin' bloğu 3–5 madde içermelidir (mevcut: ${kpBlock.items.length}).`,
        );
      }
      if (kpIdx < blocks.length - 2) {
        errors.push(`${label}: ':::akilda-kalsin' bölümü sonunda yer almalıdır.`);
      }
    }

    if (checkIndices.length !== 1) {
      errors.push(`${label}: Her bölümün sonunda 1 adet ':::kontrol' bloğu bulunmalıdır.`);
    } else {
      const chkIdx = checkIndices[0];
      if (chkIdx !== blocks.length - 1) {
        errors.push(`${label}: ':::kontrol' bloğu bölümün en son bloğu olmalıdır.`);
      }
      const chkBlock = blocks[chkIdx];
      for (const qid of chkBlock.question_ids) {
        if (!UUID_RE.test(qid)) {
          errors.push(`${label}: Geçersiz kontrol soru UUID'si: "${qid}".`);
        }
      }
    }

    for (const block of blocks) {
      if (block.type === "table") {
        if (block.headers.length > 5) {
          errors.push(`${label}: Tabloda en çok 5 sütun olabilir (mevcut: ${block.headers.length}).`);
        }
        if (block.rows.length > 10) {
          errors.push(`${label}: Tabloda en çok 10 satır olabilir (mevcut: ${block.rows.length}).`);
        }
        for (const row of block.rows) {
          if (row.length !== block.headers.length) {
            errors.push(`${label}: Tablo satır sütun sayısı (${row.length}) başlıkla (${block.headers.length}) eşleşmiyor.`);
          }
        }
      }

      for (const text of collectTextStringsForFormatCheck(block)) {
        if (HTML_TAG_RE.test(text)) {
          errors.push(`${label}: HTML etiketi kullanılamaz ("${text.slice(0, 60)}").`);
        }
        if (MD_LINK_RE.test(text) || RAW_URL_RE.test(text)) {
          errors.push(`${label}: Link veya görsel sözdizimi kullanılamaz ("${text.slice(0, 60)}").`);
        }
        if (EMOJI_RE.test(text)) {
          errors.push(`${label}: Emoji kullanılamaz ("${text.slice(0, 60)}").`);
        }
      }
    }
  }

  if (units.length > 0 && totalMnemonicCount < 1) {
    errors.push(`${sourceName}: Konu genelinde en az 1 adet ':::kodlama' bloğu bulunmalıdır.`);
  }

  return { errors, warnings };
}

function sqlEscape(str) {
  return `'${String(str ?? "").replace(/'/g, "''")}'`;
}

function sqlTextArray(arr) {
  const escaped = arr.map((item) => `"${String(item).replace(/"/g, '\\"')}"`);
  return `'{${escaped.join(",")}}'::text[]`;
}

/**
 * Doğrulanmış ünite listesini idempotent PostgreSQL `INSERT ... ON CONFLICT (id) DO UPDATE`
 * migration metnine çevirir.
 */
export function generateSqlForUnits(units, sourceRelativePath) {
  const header = [
    "-- =============================================================================",
    `-- 📖 KADRO KONU ANLATIMI — ${units[0]?.lesson ?? ""} · ${units[0]?.topic ?? ""}`,
    `-- Kaynak: ${sourceRelativePath}`,
    "-- Üreten: tools/konu_anlatimi_to_sql.mjs (TASK-169)",
    "-- Not: Tamamen idempotenttir (on conflict (id) do update).",
    "-- =============================================================================",
    "",
    "begin;",
    "",
  ];

  const statements = units.map((unit) => {
    const blocksJson = JSON.stringify(unit.blocks, null, 2);
    return [
      "insert into public.topic_lesson_units (",
      "  id,",
      "  lesson,",
      "  topic,",
      "  unit_order,",
      "  title,",
      "  summary,",
      "  estimated_minutes,",
      "  blocks,",
      "  exam_scopes,",
      "  content_version,",
      "  is_published,",
      "  updated_at",
      ") values (",
      `  ${sqlEscape(unit.id)},`,
      `  ${sqlEscape(unit.lesson)},`,
      `  ${sqlEscape(unit.topic)},`,
      `  ${unit.unit_order},`,
      `  ${sqlEscape(unit.title)},`,
      `  ${sqlEscape(unit.summary)},`,
      `  ${unit.estimated_minutes},`,
      `  ${sqlEscape(blocksJson)}::jsonb,`,
      `  ${sqlTextArray(unit.exam_scopes)},`,
      `  ${unit.content_version},`,
      `  ${unit.is_published ? "true" : "false"},`,
      "  timezone('utc'::text, now())",
      ") on conflict (id) do update set",
      "  lesson = excluded.lesson,",
      "  topic = excluded.topic,",
      "  unit_order = excluded.unit_order,",
      "  title = excluded.title,",
      "  summary = excluded.summary,",
      "  estimated_minutes = excluded.estimated_minutes,",
      "  blocks = excluded.blocks,",
      "  exam_scopes = excluded.exam_scopes,",
      "  content_version = excluded.content_version,",
      "  is_published = excluded.is_published,",
      "  updated_at = excluded.updated_at;",
      "",
    ].join("\n");
  });

  return [...header, ...statements, "commit;", ""].join("\n");
}

function listTopicMarkdownFiles(inputDir) {
  const files = [];
  if (!existsSync(inputDir)) return files;

  for (const entry of readdirSync(inputDir).sort()) {
    const full = join(inputDir, entry);
    if (!statSync(full).isDirectory()) continue;
    for (const file of readdirSync(full).sort()) {
      if (file.endsWith(".md") && file.toUpperCase() !== "FORMAT.MD") {
        files.push(join(full, file));
      }
    }
  }
  return files;
}

function resolveOutputSqlPath(mdPath, outputDir) {
  const lessonDirName = basename(dirname(mdPath));
  const fileBase = basename(mdPath, ".md");
  const numMatch = /^(\d+)/.exec(fileBase);
  const suffix = numMatch ? numMatch[1] : fileBase;
  return join(outputDir, `${lessonDirName}_${suffix}.sql`);
}

function runCli() {
  const args = process.argv.slice(2);
  const checkOnly = args.includes("--check");
  const fileIdx = args.indexOf("--file");
  const singleFile = fileIdx >= 0 ? resolve(ROOT, args[fileIdx + 1]) : null;

  const files = singleFile ? [singleFile] : listTopicMarkdownFiles(DEFAULT_INPUT_DIR);
  if (files.length === 0) {
    console.error("İşlenecek konu anlatımı .md dosyası bulunamadı.");
    process.exit(1);
  }

  const curriculum = loadCanonicalCurriculum();
  let totalErrors = 0;

  if (!checkOnly && !existsSync(DEFAULT_OUTPUT_DIR)) {
    mkdirSync(DEFAULT_OUTPUT_DIR, { recursive: true });
  }

  for (const filePath of files) {
    const relPath = relative(ROOT, filePath).split("\\").join("/");
    const content = readFileSync(filePath, "utf8");
    const parsed = parseTopicMarkdown(content, relPath);
    const { errors, warnings } = validateParsedTopic(parsed, curriculum, relPath);

    for (const w of warnings) {
      console.warn(`[UYARI] ${w}`);
    }
    for (const e of errors) {
      console.error(`[HATA] ${e}`);
    }

    totalErrors += errors.length;

    if (errors.length === 0) {
      console.log(
        `[OK] ${relPath} -> ${parsed.units.length} bölüm doğrulandı (${parsed.units.map((u) => `${u.word_count}k/${u.estimated_minutes}dk`).join(", ")}).`,
      );
      if (!checkOnly) {
        const sqlOutPath = resolveOutputSqlPath(filePath, DEFAULT_OUTPUT_DIR);
        const sqlContent = generateSqlForUnits(parsed.units, relPath);
        writeFileSync(sqlOutPath, sqlContent, "utf8");
        console.log(`     SQL yazıldı: ${relative(ROOT, sqlOutPath).split("\\").join("/")}`);
      }
    }
  }

  if (totalErrors > 0) {
    console.error(`\nToplam ${totalErrors} hata bulundu.`);
    process.exit(1);
  }
}

const isMain = process.argv[1] && import.meta.url === pathToFileURL(resolve(process.argv[1])).href;
if (isMain) {
  runCli();
}
