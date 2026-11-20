# 🎯 Kadro: KPSS Ekosistemi — Claude Code Talimatları

Bu proje, Flutter + Supabase (PostgreSQL + Auth + RLS) mimarisiyle geliştirilen ticari KPSS/MEB-AGS hazırlık uygulamasının **Mobil & Tablet** istemcisidir (`com.omer.kadro`). Web istemcisi ayrı depodadır: `../kadro-web` (Next.js).

## 📜 Proje Kuralları (Tek Kaynak)
Tüm mimari, UI, paket ve **Mobil ↔ Web eşleniklik** kuralları `GEMINI.md` içindedir ve Gemini ile Claude aynı dosyayı okur. Kuralları burada tekrar yazma; değişiklik gerekiyorsa `GEMINI.md`'yi güncelle.

@GEMINI.md

## 📌 Güncel Durum
- **Görevler & eşleniklik durumu (kesin kaynak):** `docs/task-board.md`. Önce tablo ve kurallar bölümünü oku; 6.500 satırlık dosyanın tamamını değil, yalnızca ilgili `TASK` paketini oku.
- **Son oturum devri:** `docs/session_handoff_for_claude.md` (özet niteliğinde; task board ile çelişirse task board geçerlidir).

## 🛠️ Doğrulama Komutları (`.agents/skills/flutter-verify/SKILL.md`)
- **Format:** `dart format <değişen .dart dosyaları>`
- **Analiz (0 hata zorunlu):** `flutter analyze`
- **Test — yalnızca etkilenenler:** `node tools/affected_tests.mjs --run`
- **Tüm paket (~1,5 dk):** yalnızca commit/PR öncesinde veya `pubspec.yaml`/`assets/` değişince → `flutter test` (uzun sürerse arka planda, çıktı dosyaya)
- **Eşleniklik:** Ortak iş kuralı (puan, net, kota, Leitner) değişirse `docs/parity_fixtures/*.json` güncellenir; `test/parity_fixtures_test.dart` ve web'de `npm run test:parity` yeşil olmalı.

## ⚙️ Ortam Notları
- Yardımcı betikler Node ile yazılır (`node` v26). Python yalnızca graphify için var: python.org Python 3.12 + `uv` (`uv tool install graphifyy`); `graphify` komutu `~/.local/bin` altında.
- **Claude masaüstü uygulaması içinden `%APPDATA%`'ya kurulum yapma:** Paketli uygulama olduğu için bu yazımlar `AppData\Local\Packages\Claude_*\LocalCache` sanal klasörüne gider ve dışarıda çalışmaz. Ayrıca Akıllı Uygulama Denetimi açık: imzasız Python/DLL'ler engellenir. Yeni araç kurulumlarını kullanıcıya kendi terminalinde (cmd sözdizimi) çalıştıracağı komutlar olarak ver.
- Supabase MCP salt okuma (`read_only=true`) ve yalnızca `kadroDB` projesine bağlı; şema değişikliği `docs/supabase_migrations/` altında migration olarak yazılır.

## graphify

This project has a knowledge graph at graphify-out/ with god nodes, community structure, and cross-file relationships.

Rules:
- When graphify-out/graph.json exists, run `graphify query "<question>"` before your first grep, search or source-file read for a codebase question, and put this rule in every subagent prompt that explores code. Read raw files only for lines the graph or an earlier read already located. Use `graphify path "<A>" "<B>"` for relationships and `graphify explain "<concept>"` for focused concepts. When the answer is under a Markdown heading, `graphify section "<heading>"` prints that section's text, so the .md need not be opened. These return a scoped subgraph, usually much smaller than GRAPH_REPORT.md or raw grep output.
- If graphify-out/wiki/index.md exists, use it for broad navigation instead of raw source browsing.
- Read graphify-out/GRAPH_REPORT.md only for broad architecture review or when query/path/explain do not surface enough context.
- After modifying code, run `graphify update .` to keep the graph current (AST-only, no API cost).
- At the start of a task, if `graphify-out/graph.json` is older than the latest change under `lib/` or `test/` (e.g. the user or Gemini edited code since), run `graphify update .` first (~30 s) so the graph is not stale. Quick check: `find lib test -name '*.dart' -newer graphify-out/graph.json | head -1` — any output means stale.
- In this repo `graphify-out/` is git-ignored (local, rebuildable); do not commit it. Project hooks are intentionally not installed.
