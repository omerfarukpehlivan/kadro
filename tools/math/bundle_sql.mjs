/**
 * Matematik & Geometri soru havuzundaki 14 konu SQL dosyasını
 * Supabase SQL Editor'de tek seferde çalıştırılacak tek bir dosyada birleştirir.
 *
 * Kullanım: node tools/math/bundle_sql.mjs
 */

import { readdirSync, readFileSync, writeFileSync } from "node:fs";
import { join } from "node:path";

const SQL_DIR = "docs/soru_havuzu/matematik/sql";
const OUT_FILE = "docs/soru_havuzu/matematik/00_tum_matematik_sorulari_tek_dosya.sql";

const files = readdirSync(SQL_DIR)
  .filter((name) => /^\d{2}_.*\.sql$/.test(name))
  .sort();

if (files.length === 0) {
  console.error("HATA: sql/ klasöründe konu SQL dosyası bulunamadı. Önce compile_questions.mjs çalıştırın.");
  process.exit(1);
}

const sections = files.map((name) => {
  const content = readFileSync(join(SQL_DIR, name), "utf8").trim();
  return `-- >>> ${name}\n${content}`;
});
const body = sections.join("\n\n");
const questionCount = (body.match(/^\s*-- mat-\d{2}-\d{3}/gm) || []).length;

const header = [
  "-- ==========================================================================",
  `-- KADRO SORU HAVUZU · Matematik & Geometri · TÜMÜ TEK DOSYA (${questionCount} soru)`,
  `-- Birleştirilen dosya sayısı: ${files.length} · Üretici: tools/math/bundle_sql.mjs`,
  "-- Önkoşul: docs/supabase_migrations/12_math_figures.sql (Supabase'de uygulanmış olmalı)",
  "-- İdempotent: tüm kayıtlar sabit UUID v5 ile upsert edilir (on conflict do update).",
  "-- ==========================================================================",
  "",
  "begin;",
  "",
].join("\n");

const footer = "\n\ncommit;\n";
const output = header + body + footer;

writeFileSync(OUT_FILE, output, "utf8");
const kb = (Buffer.byteLength(output, "utf8") / 1024).toFixed(1);
console.log(`✓ Tek dosya SQL üretildi → ${OUT_FILE} (${files.length} dosya, ${kb} KB)`);
