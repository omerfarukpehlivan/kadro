#!/usr/bin/env node
// Kaynak ön tarama betiği (kaynak_inceleme_plani.md, Aşama A).
//
// Kullanım:
//   node kaynak_tara.mjs --ders kpss-gy-turkce <dosya-veya-klasör> [...] [--json cikti.json]
//
// Her PDF/DOCX/TXT için şunları raporlar:
//   - metin katmanı (sayfa başına karakter), köken izleri (Zone.Identifier + gömülü URL'ler),
//   - en büyük yıl ve eskilik işaretleri, konu eşleşmesi (konu_anahtar_kelimeleri.json),
//   - soru yapısı (soru sayısı, şık harfleri, cevap anahtarı).
// Bu betik KARAR VERMEZ; yalnızca Aşama B (insan incelemesi) için ön bilgi üretir.
//
// Gereken araçlar: pdftotext ve pdfinfo (Git Bash /mingw64/bin), unzip (docx için).

import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import zlib from 'node:zlib';
import { execFileSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';

const here = path.dirname(fileURLToPath(import.meta.url));
const keywordMap = JSON.parse(fs.readFileSync(path.join(here, 'konu_anahtar_kelimeleri.json'), 'utf8'));

// ---- argümanlar ----
const args = process.argv.slice(2);
let ders = null;
let jsonOut = null;
const inputs = [];
for (let i = 0; i < args.length; i++) {
  if (args[i] === '--ders') ders = args[++i];
  else if (args[i] === '--json') jsonOut = args[++i];
  else inputs.push(args[i]);
}
if (!ders || inputs.length === 0) {
  console.error('Kullanım: node kaynak_tara.mjs --ders <ders-anahtarı> <dosya|klasör> [...] [--json cikti.json]');
  console.error('Dersler: ' + Object.keys(keywordMap.dersler).join(', '));
  process.exit(1);
}
const dersMap = keywordMap.dersler[ders];
if (!dersMap) {
  console.error(`Bilinmeyen ders "${ders}". konu_anahtar_kelimeleri.json içine ekleyin.`);
  process.exit(1);
}

const files = [];
for (const p of inputs) {
  const st = fs.statSync(p);
  if (st.isDirectory()) {
    for (const e of fs.readdirSync(p, { withFileTypes: true })) {
      if (e.isFile() && /\.(pdf|docx|txt)$/i.test(e.name)) files.push(path.join(p, e.name));
    }
  } else files.push(p);
}

// ---- yardımcılar ----
const lower = (s) => s.toLocaleLowerCase('tr');
const escapeRe = (s) => s.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
// Kelime başı eşleşmesi: "kök" kelimesi "gökkök" içinde değil, "kökü", "kökler" içinde sayılır.
const wordStart = (kw) => new RegExp(`(^|[^a-zçğıöşüâîû])${escapeRe(kw)}`, 'gu');
const countMatches = (text, kw) => (text.match(wordStart(kw)) || []).length;

// Git Bash'teki pdftotext/unzip Unicode (ör. "ò", "ş") içeren Windows yollarını açamayabiliyor.
// Bu yüzden dosya önce ASCII adlı geçici bir kopyaya alınır.
function withAsciiCopy(file, fn) {
  if (/^[\x20-\x7e]*$/.test(file)) return fn(file);
  const tmp = path.join(os.tmpdir(), `kaynak_tara_${process.pid}_${Date.now()}${path.extname(file).toLowerCase()}`);
  fs.copyFileSync(file, tmp);
  try {
    return fn(tmp);
  } finally {
    fs.rmSync(tmp, { force: true });
  }
}

function extractText(file) {
  return withAsciiCopy(file, (p) => extractTextRaw(p));
}

function extractTextRaw(file) {
  const ext = path.extname(file).toLowerCase();
  if (ext === '.pdf') {
    const text = execFileSync('pdftotext', ['-enc', 'UTF-8', '-layout', file, '-'], {
      stdio: ['ignore', 'pipe', 'ignore'],
      encoding: 'utf8',
      maxBuffer: 256 * 1024 * 1024,
    });
    // pdftotext sayfaları form feed (\f) ile ayırır; pdfinfo gerektirmeden sayfa sayısı.
    const pages = text.split('\f').filter((p) => p.trim().length > 0).length || null;
    return { text, pages };
  }
  if (ext === '.docx') {
    const xml = execFileSync('unzip', ['-p', file, 'word/document.xml'], {
      encoding: 'utf8',
      maxBuffer: 256 * 1024 * 1024,
    });
    const text = xml
      .replace(/<\/w:p>/g, '\n')
      .replace(/<[^>]+>/g, '')
      .replace(/&amp;/g, '&').replace(/&lt;/g, '<').replace(/&gt;/g, '>').replace(/&quot;/g, '"').replace(/&apos;/g, "'");
    return { text, pages: null };
  }
  return { text: fs.readFileSync(file, 'utf8'), pages: null };
}

function zoneIdentifier(file) {
  try {
    const z = fs.readFileSync(file + ':Zone.Identifier', 'utf8');
    const get = (k) => (z.match(new RegExp(`^${k}=(.*)$`, 'm')) || [])[1]?.trim() || null;
    const referrer = get('ReferrerUrl');
    const host = get('HostUrl');
    const domain = (u) => { try { return new URL(u).hostname; } catch { return null; } };
    return { referrer, domain: domain(referrer) || domain(host) };
  } catch {
    return null;
  }
}

const urlRe = /(https?:\/\/[^\s)<>\]"']{4,120}|www\.[a-z0-9.-]{3,60}|[a-z0-9-]{3,40}\.(?:com|net|org|gov\.tr|com\.tr|edu\.tr|digital|tk)\b)/gi;
const urlIgnore = /(w3\.org|adobe\.com|purl\.org|pdf-tools\.com|reportlab|openxmlformats|microsoft\.com|iptc\.org|npes\.org|aiim\.org|iec\.ch|verisign|linotype|ams\.org|xfa\.org|omnibus-type|k-type|wikipedia\.org\/wiki\/mit)/i;
const publisherRe = /(yargı yayın|yargiyayinevi|pegem|yediiklim|benim hocam|data yayın|hocakafası|karekök|isem|kitapsec|nkitap|yadi\.sk|tarihsavar|anla kazan|indeks akademi|editör yayın|editoryayinevi|uzman kariyer|akıllı adam|marsis)/gi;

function embeddedTraces(file, text) {
  const hits = new Map();
  const add = (t) => { t = t.toLowerCase(); if (!urlIgnore.test(t)) hits.set(t, (hits.get(t) || 0) + 1); };
  for (const m of text.matchAll(urlRe)) add(m[0]);
  if (file.toLowerCase().endsWith('.pdf')) {
    const buf = fs.readFileSync(file);
    const s = buf.toString('latin1');
    for (const m of s.matchAll(urlRe)) add(m[0]);
    let idx = 0;
    while ((idx = s.indexOf('stream', idx)) !== -1) {
      let start = idx + 6;
      if (s[start] === '\r') start++;
      if (s[start] === '\n') start++;
      const end = s.indexOf('endstream', start);
      if (end === -1) break;
      try {
        const out = zlib.inflateSync(buf.subarray(start, end)).toString('latin1');
        for (const m of out.matchAll(urlRe)) add(m[0]);
      } catch { /* sıkıştırılmamış veya farklı filtre */ }
      idx = end + 9;
    }
  }
  const publishers = new Set([...lower(text).matchAll(publisherRe)].map((m) => m[0]));
  return {
    urls: [...hits.entries()].sort((a, b) => b[1] - a[1]).slice(0, 6).map(([u, n]) => `${u} (${n})`),
    publishers: [...publishers],
  };
}

function topicCoverage(textLower) {
  const result = [];
  for (const [topic, kws] of Object.entries(dersMap.konular)) {
    const n = kws.reduce((s, kw) => s + countMatches(textLower, kw), 0);
    result.push({ topic, hits: n });
  }
  const out = [];
  for (const [label, kws] of Object.entries(dersMap.outOfScope || {})) {
    const n = kws.reduce((s, kw) => s + countMatches(textLower, kw), 0);
    if (n > 0) out.push({ label, hits: n });
  }
  const total = result.reduce((s, r) => s + r.hits, 0);
  const outTotal = out.reduce((s, r) => s + r.hits, 0);
  return {
    topics: result.map((r) => ({ ...r, pct: total ? Math.round((r.hits / total) * 100) : 0 })),
    covered: result.filter((r) => r.hits >= 3).length,
    totalTopics: result.length,
    outOfScope: out,
    outOfScopeRatio: total + outTotal ? Math.round((outTotal / (total + outTotal)) * 100) : 0,
  };
}

// Kopyalanabilirlik: Metin katmanı olsa bile bozuk font eşlemesi yüzünden kopyalanan metin anlamsız
// çıkabilir (ör. "kpss" yerine "SV V"). Türkçenin en sık kelimelerinin oranı bunu yakalar:
// düzgün Türkçe metinde bu oran genelde %6-15, bozuk metinde ~%0'dır.
const COMMON_TR = new Set(['ve', 'bir', 'bu', 'ile', 'için', 'da', 'de', 'olarak', 'olan', 'hangisi', 'aşağıdakilerden', 'gibi', 'en', 'daha', 'çok', 'ne', 'veya', 'ki', 'her', 'ise', 'kadar', 'sonra', 'önce', 'tarafından', 'yer', 'değildir', 'olur']);
function readability(textLower) {
  const tokens = textLower.match(/[a-zçğıöşüâîû]+/gu) || [];
  if (tokens.length < 50) return { tokens: tokens.length, commonPct: null, ok: false };
  const common = tokens.filter((t) => COMMON_TR.has(t)).length;
  const commonPct = Math.round((common / tokens.length) * 1000) / 10;
  return { tokens: tokens.length, commonPct, ok: commonPct >= 2 };
}

function staleness(text, textLower) {
  const years = [...text.matchAll(/\b(19[5-9]\d|20[0-3]\d)\b/g)].map((m) => Number(m[1]));
  const markers = keywordMap.eskilikIsaretleri
    .map((e) => ({ ...e, n: countMatches(textLower, e.ifade) }))
    .filter((e) => e.n > 0)
    .map((e) => `${e.ifade} ×${e.n} (${e.not})`);
  return { maxYear: years.length ? Math.max(...years) : null, markers };
}

function questionStructure(text) {
  // Soru başı: satır başında "12." / "12)" / "12-" ve ardından metin.
  const qStarts = text.match(/^\s{0,6}\d{1,3}\s?[.)-]\s+\S/gm) || [];
  // Şıklar: satırda veya satır başında "A)" ... "E)".
  const opt = {};
  for (const L of ['A', 'B', 'C', 'D', 'E']) {
    opt[L] = (text.match(new RegExp(`(^|\\s)${L}\\s?\\)`, 'gm')) || []).length;
  }
  const hasE = opt.E > 0 && opt.E >= opt.A * 0.6;
  const answerKey =
    /cevap\s*anahtar/i.test(text) ||
    (text.match(/\b\d{1,3}\s?[-.)]\s?[A-E]\b/g) || []).length >= 10;
  // İki sütunlu düzende soru numarası satır başında olmayabilir; "A)" sayısı daha güvenilir bir tahmin.
  return { questionLike: Math.max(qStarts.length, opt.A), options: opt, fiveChoice: hasE, answerKey };
}

// ---- tarama ----
const rows = [];
for (const file of files) {
  const row = { dosya: path.basename(file) };
  try {
    const { text, pages } = extractText(file);
    const chars = text.replace(/\s+/g, '').length;
    const textLower = lower(text);
    row.sayfa = pages;
    row.karakter = chars;
    row.sayfaBasinaKarakter = pages ? Math.round(chars / pages) : null;
    // 100 karakter/sayfa: az yazılı slaytlar geçer, görüntü ağırlıklı (harita, taranmış) sayfalar kalır.
    row.metinKatmani = pages ? chars / pages >= 100 : chars >= 500;
    row.okunabilirlik = readability(textLower);
    // Kopyalanabilir = metin var VE kopyalanan metin anlamlı Türkçe.
    row.kopyalanabilir = row.metinKatmani && row.okunabilirlik.ok;
    row.koken = zoneIdentifier(file);
    row.izler = embeddedTraces(file, text);
    row.eskilik = staleness(text, textLower);
    row.konu = topicCoverage(textLower);
    row.soru = questionStructure(text);
  } catch (e) {
    row.hata = String(e.message || e).split('\n')[0];
  }
  rows.push(row);
}

// ---- çıktı ----
const yn = (b) => (b ? 'evet' : 'HAYIR');
console.log(`# Ön tarama · ders: ${ders} · hedef sınav: ${dersMap.hedefSinav} · ${new Date().toISOString().slice(0, 10)}\n`);
for (const r of rows) {
  console.log(`## ${r.dosya}`);
  if (r.hata) { console.log(`- ⚠️ Hata: ${r.hata}\n`); continue; }
  console.log(
    r.kopyalanabilir
      ? `- ✅ Kopyalanabilir (sık kelime oranı %${r.okunabilirlik.commonPct})`
      : `- ❌ KOPYALANAMAZ: ${!r.metinKatmani ? 'metin katmanı yok (taranmış görüntü)' : `metin bozuk, sık kelime oranı %${r.okunabilirlik.commonPct ?? 0}`} → kullanılmaz`,
  );
  console.log(
    `- Metin katmanı: ${yn(r.metinKatmani)} (` +
      (r.sayfa ? `${r.sayfa} sayfa, ~${r.sayfaBasinaKarakter} karakter/sayfa)` : `toplam ~${r.karakter} karakter)`),
  );
  console.log(`- Köken: ${r.koken ? `${r.koken.domain} ← ${r.koken.referrer}` : 'Zone.Identifier yok'}`);
  if (r.izler.urls.length) console.log(`- Gömülü URL'ler: ${r.izler.urls.join(', ')}`);
  if (r.izler.publishers.length) console.log(`- ⚠️ Yayınevi/ticari iz: ${r.izler.publishers.join(', ')}`);
  console.log(`- En büyük yıl: ${r.eskilik.maxYear ?? '—'}${r.eskilik.markers.length ? ` · ⚠️ Eskilik: ${r.eskilik.markers.join('; ')}` : ''}`);
  console.log(`- Soru yapısı: ~${r.soru.questionLike} soru benzeri satır · şıklar A-E: ${Object.values(r.soru.options).join('/')} · 5 şık: ${yn(r.soru.fiveChoice)} · cevap anahtarı: ${yn(r.soru.answerKey)}`);
  console.log(`- Konu kapsamı: ${r.konu.covered}/${r.konu.totalTopics} konu (≥3 eşleşme) · kapsam dışı oranı %${r.konu.outOfScopeRatio}`);
  for (const t of r.konu.topics) console.log(`  - ${t.topic}: ${t.hits} (%${t.pct})`);
  for (const o of r.konu.outOfScope) console.log(`  - ⚠️ Kapsam dışı · ${o.label}: ${o.hits}`);
  console.log('');
}
if (jsonOut) {
  fs.mkdirSync(path.dirname(jsonOut), { recursive: true });
  fs.writeFileSync(jsonOut, JSON.stringify({ ders, hedefSinav: dersMap.hedefSinav, tarih: new Date().toISOString().slice(0, 10), sonuclar: rows }, null, 2));
  console.log(`JSON yazıldı: ${jsonOut}`);
}
