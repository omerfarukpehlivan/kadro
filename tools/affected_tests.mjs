#!/usr/bin/env node
// Değişen Dart dosyalarından etkilenen test dosyalarını bulur ve (istenirse) yalnızca onları çalıştırır.
//
// Nasıl çalışır:
//   1. Değişen dosyalar: `git diff --name-only <base>` + takip edilmeyen yeni dosyalar (varsayılan base: HEAD).
//   2. `lib/` ve `test/` içindeki tüm import'lardan (package:kadro/... ve göreli) ters bağımlılık grafiği kurulur.
//   3. Değişen bir lib dosyasını doğrudan veya dolaylı import eden her test seçilir; değişen test dosyaları da eklenir.
//   4. `pubspec.yaml`, `assets/` veya `test/` altındaki yardımcı (test olmayan) dosyalar değiştiyse tüm testler seçilir.
//
// Kullanım:
//   node tools/affected_tests.mjs            -> etkilenen test dosyalarını listeler
//   node tools/affected_tests.mjs --run      -> yalnızca onları `flutter test` ile çalıştırır
//   node tools/affected_tests.mjs --base master --run   -> master'dan bu yana değişenler
//   node tools/affected_tests.mjs --files lib/a.dart,lib/b.dart   -> verilen dosyalara göre
//
// Angular/Web Karşılığı: `nx affected:test` / `jest --changedSince=main`.
import { execSync, spawnSync } from "node:child_process";
import { existsSync, readdirSync, readFileSync, statSync } from "node:fs";
import { dirname, join, posix, relative, resolve } from "node:path";

const root = resolve(dirname(new URL(import.meta.url).pathname.replace(/^\/([A-Za-z]:)/, "$1")), "..");
const args = process.argv.slice(2);
const run = args.includes("--run");
const baseIndex = args.indexOf("--base");
const base = baseIndex >= 0 ? args[baseIndex + 1] : "HEAD";
const filesIndex = args.indexOf("--files");
const manualFiles = filesIndex >= 0 ? args[filesIndex + 1].split(",") : null;
const packageName = /^name:\s*(\S+)/m.exec(readFileSync(join(root, "pubspec.yaml"), "utf8"))[1];

const toPosix = (p) => p.split("\\").join("/");

function listDartFiles(dir) {
  const out = [];
  const walk = (d) => {
    for (const entry of readdirSync(d)) {
      const full = join(d, entry);
      if (statSync(full).isDirectory()) walk(full);
      else if (entry.endsWith(".dart")) out.push(toPosix(relative(root, full)));
    }
  };
  if (existsSync(join(root, dir))) walk(join(root, dir));
  return out;
}

function changedFiles() {
  if (manualFiles) return manualFiles.map(toPosix);
  const git = (cmd) =>
    execSync(cmd, { cwd: root, encoding: "utf8", stdio: ["ignore", "pipe", "ignore"] }).split(/\r?\n/).filter(Boolean);
  return [
    ...new Set([
      ...git(`git diff --name-only ${base}`),
      ...git("git ls-files --others --exclude-standard"),
    ]),
  ].map(toPosix);
}

const importRe = /^\s*(?:import|export|part)\s+['"]([^'"]+)['"]/gm;

function resolveImport(fromFile, spec) {
  if (spec.startsWith(`package:${packageName}/`)) {
    return `lib/${spec.slice(`package:${packageName}/`.length)}`;
  }
  if (spec.startsWith("package:") || spec.startsWith("dart:")) return null;
  return posix.normalize(posix.join(posix.dirname(fromFile), spec));
}

const libFiles = listDartFiles("lib");
const testDir = listDartFiles("test");
const testFiles = testDir.filter((f) => f.endsWith("_test.dart"));

// ters bağımlılık: dosya -> onu import eden dosyalar
const importedBy = new Map();
for (const file of [...libFiles, ...testDir]) {
  const src = readFileSync(join(root, file), "utf8");
  for (const m of src.matchAll(importRe)) {
    const target = resolveImport(file, m[1]);
    if (!target) continue;
    if (!importedBy.has(target)) importedBy.set(target, new Set());
    importedBy.get(target).add(file);
  }
}

const changed = changedFiles();
const runAll = changed.some(
  (f) =>
    f === "pubspec.yaml" ||
    f === "pubspec.lock" ||
    f.startsWith("assets/") ||
    (f.startsWith("test/") && f.endsWith(".dart") && !f.endsWith("_test.dart"))
);

let selected;
if (runAll) {
  selected = testFiles;
} else {
  // Varsayılan (hızlı): değişen dosyadan en fazla MAX_HOPS import adımı yukarı çık ve
  // her şeyi import eden "merkez" dosyaların (router, kabuk, main) üzerinden geçme;
  // aksi halde tek bir yardımcı değişikliği neredeyse tüm testleri seçer.
  // `--deep`: tam geçişli zincir (commit/PR öncesi tam kontrol için).
  const deep = args.includes("--deep");
  const MAX_HOPS = 2;
  const HUBS = new Set(["lib/main.dart", "lib/app/router.dart", "lib/app/app_shell.dart"]);
  const changedDart = changed.filter((f) => f.endsWith(".dart"));
  const affected = new Set();
  let frontier = changedDart.map((f) => [f, 0]);
  while (frontier.length) {
    const [f, hops] = frontier.pop();
    if (affected.has(f)) continue;
    affected.add(f);
    if (!deep && (hops >= MAX_HOPS || (HUBS.has(f) && !changedDart.includes(f)))) continue;
    for (const dep of importedBy.get(f) ?? []) frontier.push([dep, hops + 1]);
  }
  selected = testFiles.filter((t) => affected.has(t));
}

if (!run) {
  console.log(
    runAll
      ? `# pubspec/asset/test yardımcısı değişti -> tüm testler (${selected.length})`
      : `# ${changed.length} değişen dosya -> ${selected.length}/${testFiles.length} test dosyası`
  );
  for (const t of selected) console.log(t);
  process.exit(0);
}

if (selected.length === 0) {
  console.log("Etkilenen test yok; flutter test atlandı.");
  process.exit(0);
}
console.log(`flutter test ${selected.length}/${testFiles.length} dosya...`);
const result = spawnSync("flutter", ["test", ...selected], {
  cwd: root,
  stdio: "inherit",
  shell: process.platform === "win32",
});
process.exit(result.status ?? 1);
