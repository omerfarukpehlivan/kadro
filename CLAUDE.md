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
- Python kurulu değil; yardımcı betikler Node ile yazılır (`node` v26).
- Supabase MCP salt okuma (`read_only=true`) ve yalnızca `kadroDB` projesine bağlı; şema değişikliği `docs/supabase_migrations/` altında migration olarak yazılır.
