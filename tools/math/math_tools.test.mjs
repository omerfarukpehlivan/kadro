// TASK-172 matematik araçları testleri. Çalıştırma: node --test tools/math/
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { test } from "node:test";
import { fileURLToPath } from "node:url";

import { buildSql, compileAll, parseQuestionFile, uuidV5 } from "./compile_questions.mjs";
import { lintMathText } from "./latex_lint.mjs";
import { evalExpr, nearlyEqual } from "./expr.mjs";
import { FIGURE_KINDS, isSafeFigureSvg, renderFigure } from "./figure.mjs";
import { cleanQuestionText, latexCommandsIn, parseMathSegments } from "./mathtext.mjs";
import { optionValue } from "./option_value.mjs";
import { loadCanonicalCurriculum } from "../konu_anlatimi_to_sql.mjs";

const ROOT = join(dirname(fileURLToPath(import.meta.url)), "..", "..");
const fixture = JSON.parse(readFileSync(join(ROOT, "docs", "parity_fixtures", "math_text.json"), "utf8"));
const curriculum = loadCanonicalCurriculum();

test("ortak sözleşme: cleanCases", () => {
  for (const c of fixture.cleanCases) {
    assert.equal(cleanQuestionText(c.input), c.expected, c.description);
    assert.equal(cleanQuestionText(c.expected), c.expected, `${c.description} (idempotent)`);
  }
});

test("ortak sözleşme: segmentCases", () => {
  for (const c of fixture.segmentCases) {
    const got = parseMathSegments(c.input).map((s) => (s.type === "math" ? s : { type: s.type, value: s.value }));
    assert.deepEqual(got, c.expected, c.description);
  }
});

test("expr: işlem önceliği, örtük çarpım ve fonksiyonlar", () => {
  assert.equal(evalExpr("2 + 3 * 4"), 14);
  assert.equal(evalExpr("2^3^2"), 512);
  assert.equal(evalExpr("-2^2"), -4);
  assert.equal(evalExpr("2x + 1", { x: 4 }), 9);
  assert.equal(evalExpr("3(2+1)"), 9);
  assert.ok(nearlyEqual(evalExpr("5sqrt(3) + 2"), 5 * Math.sqrt(3) + 2));
  assert.equal(evalExpr("root(3, -27)"), -3);
  assert.equal(evalExpr("C(5, 2) + P(4, 2) + fact(4)"), 10 + 12 + 24);
  assert.equal(evalExpr("gcd(12, 18) * lcm(4, 6)"), 6 * 12);
  assert.ok(nearlyEqual(evalExpr("sin(30)"), 0.5));
  assert.equal(evalExpr("17 % 5"), 2);
  assert.throws(() => evalExpr("2 +"), /erken bitti/);
  assert.throws(() => evalExpr("foo(2)"), /Bilinmeyen fonksiyon/);
  assert.throws(() => evalExpr("y + 1"), /Tanımsız değişken/);
  assert.throws(() => evalExpr("process.exit()"), /Geçersiz karakter/);
});

test("optionValue: düz ve LaTeX şıklar sayıya çevrilir", () => {
  const cases = [
    ["12", 12],
    ["-3", -3],
    ["3,5", 3.5],
    ["1.250", 1250],
    ["%25", 25],
    ["48 km", 48],
    ["120°", 120],
    ["$\\frac{3}{4}$", 0.75],
    ["$-\\dfrac{1}{2}$", -0.5],
    ["$2\\frac{1}{3}$", 2 + 1 / 3],
    ["$5\\sqrt{3}+2$", 5 * Math.sqrt(3) + 2],
    ["$\\sqrt[3]{4}$", Math.cbrt(4)],
    ["$2^{-3}$", 0.125],
    ["$3{,}5$", 3.5],
    ["$4\\pi$", 4 * Math.PI],
    ["$x = 7$", 7],
    ["$12$ cm", 12],
    ["$3 \\cdot 2^{2}$", 12],
  ];
  for (const [input, expected] of cases) {
    const v = optionValue(input);
    assert.ok(v !== null && nearlyEqual(v, expected), `${input} → ${v} (beklenen ${expected})`);
  }
  for (const input of ["Yalnız I", "$a<b<c$", "$x+y$", "I ve II", "3 saat 20 dakika", "$\\{1, 2\\}$", "$|x-3| \\le 5$"]) {
    assert.equal(optionValue(input), null, input);
  }
});

const SAMPLE_SPECS = {
  geometry: {
    kind: "geometry",
    points: { A: [0, 0], B: [4, 0], C: [4, 3], O: [2, 1.5] },
    shapes: [
      { type: "polygon", points: ["A", "B", "C"], fill: true },
      { type: "segment", from: "A", to: "C", label: "5", ticks: 2, dashed: true },
      { type: "circle", center: "O", radius: 1 },
      { type: "sector", center: "A", from: "B", to: "C" },
      { type: "angle", vertex: "B", from: "A", to: "C", right: true },
      { type: "angle", vertex: "A", from: "B", to: "C", label: "α", double: true },
      { type: "label", at: [2, -0.5], text: "4 cm" },
    ],
    dots: ["O"],
    labelPos: { O: "right" },
  },
  bar: { kind: "bar", categories: ["A", "B"], values: [3, 7], title: "Başlık", yLabel: "Adet" },
  line: { kind: "line", categories: ["1", "2", "3"], series: [{ name: "x", values: [1, 2, 3] }, { name: "y", values: [3, 1, 2] }] },
  pie: { kind: "pie", slices: [{ label: "a", value: 1 }, { label: "b", value: 3 }], show: "percent" },
  table: { kind: "table", headers: ["x", "f(x)"], rows: [["1", "3"], ["2", "5"]] },
  venn: { kind: "venn", sets: ["A", "B", "C"], regions: { ABC: "2", out: "1" } },
  numberline: { kind: "numberline", min: -2, max: 3, intervals: [{ from: -1, fromOpen: true }], points: [{ at: 2, open: true, label: "a" }] },
  flow: { kind: "flow", nodes: [{ id: "a", text: "x", at: [0, 0], shape: "circle" }, { id: "b", text: "2x", at: [2, 0] }], edges: [{ from: "a", to: "b", label: "×2" }] },
};

test("figure: her şekil türü güvenli SVG üretir", () => {
  assert.deepEqual(Object.keys(SAMPLE_SPECS).sort(), [...FIGURE_KINDS].sort());
  for (const [kind, spec] of Object.entries(SAMPLE_SPECS)) {
    const svg = renderFigure(spec);
    assert.ok(isSafeFigureSvg(svg), kind);
    assert.match(svg, /^<svg xmlns="http:\/\/www\.w3\.org\/2000\/svg" viewBox="0 0 [\d.]+ [\d.]+"/, kind);
    assert.ok(!/dominant-baseline|#[0-9a-f]{3,6}\b|rgb\(/i.test(svg), `${kind}: sabit renk veya desteklenmeyen öznitelik`);
  }
  const fn = renderFigure({ kind: "geometry", axes: { x: [-3, 3], y: [-1, 9], grid: true }, points: {}, functions: [{ expr: "x^2", domain: [-3, 3], label: "f" }] });
  assert.ok(isSafeFigureSvg(fn));
});

test("figure: hatalı tarifler açıklayıcı hata verir", () => {
  assert.throws(() => renderFigure({ kind: "uzay" }), /Bilinmeyen şekil türü/);
  assert.throws(() => renderFigure({ kind: "geometry", points: { A: [0, 0] }, shapes: [{ type: "segment", from: "A", to: "Z" }] }), /Tanımsız nokta: Z/);
  assert.throws(() => renderFigure({ kind: "bar", categories: ["a"], values: [1, 2] }), /aynı uzunlukta/);
  assert.throws(() => renderFigure({ kind: "table", headers: ["a", "b"], rows: [["1"]] }), /sütun sayısı/);
  assert.throws(() => renderFigure({ kind: "venn", sets: ["A", "B"], regions: { ABC: "1" } }), /Venn bölgesi tanımsız/);
  assert.throws(() => renderFigure({ kind: "bar", categories: ["$x$"], values: [1] }), /LaTeX/);
  assert.throws(() => renderFigure({ kind: "geometry", points: { A: [0, 0], B: [1, 1] }, labelPos: { A: "yukarı" } }), /labelPos/);
});

test("ortak sözleşme: her izinli komut bir render örneğinde geçer ve örnekler lint'ten geçer", () => {
  const used = new Set(fixture.latexRenderSamples.flatMap((s) => latexCommandsIn(s)));
  for (const cmd of fixture.latexCommands) assert.ok(used.has(cmd), `\\${cmd} için render örneği yok`);
  for (const sample of fixture.latexRenderSamples) assert.deepEqual(lintMathText(`$${sample}$`, "örnek"), [], sample);
});

test("ortak sözleşme: figureSvg güvenlik vakaları", () => {
  for (const c of fixture.figureSvg.cases) assert.equal(isSafeFigureSvg(c.svg), c.safe, c.description);
});

test("figure: güvenlik denetimi zararlı SVG'yi reddeder", () => {
  const ok = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 10 10"><circle cx="5" cy="5" r="2"/></svg>';
  assert.ok(isSafeFigureSvg(ok));
  for (const bad of [
    '<svg xmlns="http://www.w3.org/2000/svg"><script>alert(1)</script></svg>',
    '<svg xmlns="http://www.w3.org/2000/svg" onload="alert(1)"></svg>',
    '<svg xmlns="http://www.w3.org/2000/svg"><image href="https://x"/></svg>',
    '<svg xmlns="http://www.w3.org/2000/svg"><a href="javascript:alert(1)"><text>x</text></a></svg>',
    '<svg xmlns="http://www.w3.org/2000/svg"><foreignObject></foreignObject></svg>',
    '<svg xmlns="http://www.w3.org/2000/svg" style="background:url(x)"></svg>',
    '<?xml version="1.0"?><svg xmlns="http://www.w3.org/2000/svg"></svg>',
    "<div></div>",
  ]) {
    assert.equal(isSafeFigureSvg(bad), false, bad);
  }
});

test("uuidV5: RFC 4122 test vektörü ve kararlılık", () => {
  assert.equal(uuidV5("www.example.com", "6ba7b810-9dad-11d1-80b4-00c04fd430c8"), "2ed6657d-e927-568b-95e1-2665a8aea6a2");
  assert.equal(uuidV5("mat-05-001"), uuidV5("mat-05-001"));
  assert.notEqual(uuidV5("mat-05-001"), uuidV5("mat-05-002"));
});

test("lintMathText: yazım hatalarını yakalar", () => {
  assert.deepEqual(lintMathText("$\\sqrt{2}$ ve 5 \\$", "soru"), []);
  assert.match(lintMathText("$x + 1 kaçtır?", "soru")[0], /kapanmamış/);
  assert.match(lintMathText("\\frac{1}{2} kaçtır?", "soru")[0], /dışında/);
  assert.match(lintMathText("$\\begin{matrix}1\\end{matrix}$", "soru")[0], /izin verilmeyen/);
  assert.match(lintMathText("$\\frac{1}{2$", "soru")[0], /dengesiz/);
  assert.match(lintMathText("$x \\text{ kişi} + ğ$", "soru")[0], /Türkçe harf/);
});

const header = "---\nders: Matematik & Geometri\nkonu: Üslü ve Köklü İfadeler\nkod: mat\nkapsam: [lisans_gygk, b_grubu_gygk]\n---\n\n";
const question = (fields, options = ["2", "3", "4", "6", "8"]) =>
  `### mat-05-001\n${fields}\n\n**Soru:**\n$2^{3} - 2$ işleminin sonucu kaçtır?\n\n**Şıklar:**\n${options
    .map((o, i) => `${"ABCDE"[i]}) ${o}`)
    .join("\n")}\n\n**Açıklama:**\n$2^{3}=8$ olduğundan $8-2=6$ bulunur. Üslü ifade önce hesaplanır, sonra çıkarma yapılır.\n\n**Çeldirici Tuzağı:**\nC şıkkı (4), üssü çarpım sanıp $2 \\cdot 3 - 2$ hesaplayan adayı yakalar.\n`;
const parse = (content, fileName = "05_uslu.md") => parseQuestionFile(content, { fileName, curriculum });

test("derleyici: geçerli soru doğrulanır ve SQL üretir", () => {
  const r = parse(header + question("- zorluk: 1\n- dogru: D\n- dogrulama: 2^3 - 2"));
  assert.deepEqual(r.errors, []);
  assert.equal(r.questions[0].verified, true);
  const sql = buildSql(r, "x.md");
  assert.match(sql, /on conflict \(id\) do update set/);
  assert.match(sql, new RegExp(uuidV5("mat-05-001")));
  assert.match(sql, /'\{"options":\["2","3","4","6","8"\],"correctIndex":3\}'::jsonb/);
  assert.match(sql, /array\['lisans_gygk', 'b_grubu_gygk'\]::text\[\]/);
});

test("derleyici: yanlış cevap anahtarını yakalar", () => {
  const r = parse(header + question("- zorluk: 1\n- dogru: C\n- dogrulama: 2^3 - 2"));
  assert.ok(r.errors.some((e) => /CEVAP ANAHTARI HATALI/.test(e)), r.errors.join("\n"));
});

test("derleyici: sayısal olarak eşit şıkları yakalar", () => {
  const r = parse(header + question("- zorluk: 1\n- dogru: D\n- dogrulama: 6", ["2", "$\\frac{12}{2}$", "4", "6", "8"]));
  assert.ok(r.errors.some((e) => /sayısal olarak eşit/.test(e)), r.errors.join("\n"));
});

test("derleyici: sayısal şıkta 'dogrulama: yok' kabul edilmez", () => {
  const r = parse(header + question("- zorluk: 1\n- dogru: D\n- dogrulama: yok"));
  assert.ok(r.errors.some((e) => /dogrulama: yok/.test(e)), r.errors.join("\n"));
});

test("derleyici: degerler şık metniyle çelişirse yakalar", () => {
  const r = parse(header + question("- zorluk: 1\n- dogru: D\n- dogrulama: 6\n- degerler: 2 | 3 | 4 | 6 | 9"));
  assert.ok(r.errors.some((e) => /E değeri/.test(e)), r.errors.join("\n"));
});

test("derleyici: eksik alan, kanonik olmayan konu ve kimlik biçimi", () => {
  const bad = header.replace("Üslü ve Köklü İfadeler", "Üsler") + question("- zorluk: 5\n- dogru: F").replace("mat-05-001", "mat-5-1");
  const r = parse(bad);
  const all = r.errors.join("\n");
  assert.match(all, /kanonik konusu değil/);
  assert.match(all, /zorluk 1, 2 veya 3/);
  assert.match(all, /dogru A-E/);
  assert.match(all, /kimlik/);
  assert.match(all, /dogrulama:" alanı eksik/);
});

test("derleyici: örnek soru klasörü hatasız derlenir", async () => {
  const res = await compileAll({ dir: join(ROOT, "docs", "soru_havuzu", "matematik", "ornek"), check: true });
  assert.deepEqual(res.errors, []);
  assert.ok(res.stats.questions >= 8);
  assert.ok(res.stats.figures >= 5);
});

test("konu anlatımı: :::sekil bloğu SVG'ye çizilir, hatalı tarif hata verir", async () => {
  const { parseSectionBlocks } = await import("../konu_anlatimi_to_sql.mjs");
  const ok = parseSectionBlocks(
    ':::sekil Şekil 1. Dik üçgen\n{"kind":"geometry","points":{"A":[0,0],"B":[4,0],"C":[4,3]},"shapes":[{"type":"polygon","points":["A","B","C"]}]}\n:::',
    "Bölüm"
  );
  assert.deepEqual(ok.parseErrors, []);
  assert.equal(ok.blocks[0].type, "figure");
  assert.equal(ok.blocks[0].caption, "Şekil 1. Dik üçgen");
  assert.ok(isSafeFigureSvg(ok.blocks[0].svg));
  const bad = parseSectionBlocks(':::sekil\n{"kind":"uzay"}\n:::', "Bölüm");
  assert.match(bad.parseErrors.join("\n"), /:::sekil' çizilemedi/);
});
