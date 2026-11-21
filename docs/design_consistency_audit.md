# Tasarım Tutarlılığı Denetimi — Mobil (`lib/`)

> Tarih: 2026-11-22 · Kapsam: `lib/` (147 Dart dosyası) · Referans: `GEMINI.md` UI bölümü, `design-system/kadro/MASTER.md`, `design-system/kadro/aiSlopless.md`
> Kural: davranış değişmez, paket eklenmez, `*.g.dart` ve ortak sözleşme (Supabase / iş kuralları) dokunulmaz.

## Özet

| Kontrol | Sonuç |
| --- | --- |
| `Icons.*` / `LucideIcons.*` | ✅ Hiç yok (tamamı `phosphor_flutter`) |
| `.animate().fadeIn().slideY()` liste girişleri | ✅ Hiç yok |
| `Card(` / `ElevatedButton` / ham `DropdownButton` | ✅ Hiç yok |
| Sabit `Color(0xFF..)` / `fontSize` (widget katmanı) | ⚠️ Yalnızca `CustomPainter` tuvalleri ve harita içerik verisinde (bkz. P4 — bilinçli istisna) |
| Elle yazılmış rozet (`Container` + küçük padding + `Text`) | ❌ 58 yer (`KadroBadge` yerine) → 51 dönüştürüldü, 7 bilinçli bırakıldı |
| Kopyalanmış kart iskeleti | ❌ 5 diyagram kartı aynı çerçeve/başlık/büyüt diyaloğunu kopyalıyor → ortak `DiagramCardShell` |
| Bulanık gölge (`blurRadius > 0`) | ❌ 1 yer (`KadroDropdown` açılır menüsü) |
| Ham `TextStyle(...)` (tema dışı yazı stili) | ❌ 7 yer (feature ekranları) |
| Dekoratif emoji / glif (UI metni) | ❌ 2 yer (`quiz_result_screen.dart`) |

Öncelik anlamı: **P1** = açık kural ihlali · **P2** = paylaşılan bileşen yerine elle yazılmış/kopyalanmış UI · **P3** = standart dışı ölçüler, `_buildX()` yardımcıları · **P4** = bilinçli istisna / sonraya bırakılan.

## Bulgular

| # | Öncelik | Dosya:Satır | Bulgu | Önerilen düzeltme | Durum |
| --- | --- | --- | --- | --- | --- |
| 1 | P1 | `lib/shared/widgets/kadro_dropdown.dart:214` | Açılır menü `BoxShadow(blurRadius: 16, offset: (0,6))` — MASTER.md bulanık drop-shadow'u yasaklıyor | Keskin `Offset(0,3)`, `blurRadius: 0` alt dudak | ✅ |
| 2 | P1 | `lib/features/map_practice/presentation/map_challenge_screen.dart:459, 715, 813, 904` | Ham `TextStyle(fontWeight, color)` — `textTheme` yerine varsayılan stil | `textTheme.labelLarge/titleSmall?.copyWith(...)` | ✅ |
| 3 | P1 | `lib/features/map_practice/presentation/map_practice_hub_screen.dart:587` | Ham `TextStyle` rozet metni | `KadroBadge` | ✅ |
| 4 | P1 | `lib/features/quiz/presentation/quiz_result_screen.dart:1260, 1280` | Ham `TextStyle(fontWeight: w700)` | `textTheme.labelLarge?.copyWith(...)` | ✅ |
| 5 | P1 | `lib/features/quiz/presentation/quiz_result_screen.dart:299` | `'✓ Günlük Görev Tamamlandı'` metin içinde dekoratif glif | `KadroBadge(icon: PhosphorIconsBold.check)` | ✅ |
| 6 | P1 | `lib/features/quiz/presentation/quiz_result_screen.dart:1229` | `'... tamamladın! 🎉'` dekoratif emoji | Emoji kaldırıldı | ✅ |
| 7 | P2 | `lib/features/quiz/presentation/quiz_result_screen.dart:1086` | `_GuestSaveWarningDialog` elle yazılmış `Dialog` (20px, kenarlıksız) | `KadroConfirmDialog` | ✅ |
| 8 | P2 | `lib/shared/widgets/{climate_chart,geo_diagram,population_pyramid,sun_diagram,turkey_map}/*_card.dart` | 5 kart aynı çerçeveyi (`Container`+`BoxDecoration` = elle `TactileCard`), aynı başlık rozeti + "Büyüt" düğmesi, aynı `_buildStatBadge` ve aynı yakınlaştırma diyaloğunu kopyalıyor (~1.345 satır) | Ortak `DiagramCardShell` + `DiagramStatBadge` + `showDiagramZoomDialog` (`lib/shared/widgets/diagram_card_shell.dart`) | ✅ |
| 9 | P2 | `lib/features/stats/presentation/stats_screen.dart:135` | Elle `ChoiceChip` filtre şeridi | `KadroFilterChips(wrap: true)` | ✅ |
| 10 | P2 | `lib/features/score_calculator/presentation/kpss_score_calculator_screen.dart:399` | Elle `ChoiceChip` şeridi (AGS-P1/P2/P3) | `KadroFilterChips` | ✅ |
| 11 | P2 | `lib/features/current_affairs/presentation/current_affairs_screen.dart:339` | Elle yatay kaydırmalı ay çipleri | `KadroFilterChips` | ✅ |
| 12 | P2 | `lib/features/planner/presentation/study_planner_screen.dart:784, 804` | Elle ders / süre `ChoiceChip` şeritleri | `KadroFilterChips(wrap: true)` | ✅ |
| 13 | P2 | `lib/features/map_practice/presentation/map_practice_hub_screen.dart:115` | `_buildModeTile`: `InkWell`+`Container`+`Border.all` = elle kart | `TactileCard` tabanlı `_ModeTile` widget'ı | ✅ |
| 14 | P2 | Elle yazılmış rozetler (`Container(padding: symmetric(h ≤ 12, v ≤ 6), BoxDecoration, child: Text/Row)`) — aşağıdaki **Ek A** listesi | 58 yer; her biri farklı padding (6–12 / 2–6), radius (6/8/10/12/999) ve yazı ağırlığı | `KadroBadge` (ton veya `backgroundColor/foregroundColor/borderColor`; ikon ayrı renkteyse yeni geriye uyumlu `iconColor`) | ✅ 51 · 🚫 7 (bkz. Ek A) |
| 15 | P3 | `exams_screen.dart:469`, `practice_hub_screen.dart:498, 832, 919` | `BorderRadius.circular(11)` — ölçek dışı değer | `12` | ✅ |
| 16 | P3 | `quiz_screen.dart:1563`, `option_tile.dart:151` | `circular(9)` | `8` | ✅ |
| 17 | P3 | `onboarding_screen.dart:1373`, `tugrul_avatar.dart:355` | `circular(7)` | `8` | ✅ |
| 18 | P3 | `lesson_topics_screen.dart:297`, `quiz_history_screen.dart:196` | `circular(18)` — kart için standart dışı | `16` | ✅ |
| 19 | P3 | `map_challenge_screen.dart:161` | `_buildStatItem` yardımcı metodu | `_StatItem` `StatelessWidget` | ✅ |
| 20 | P3 | `climate_chart.dart:76`, `*_card.dart` `_buildStatBadge` | `_buildX()` yardımcıları | `_LegendItem` / ortak `DiagramStatBadge` | ✅ |
| 21 | P3 | `map_practice_hub_screen.dart:552` | `_buildCategoryCard` yardımcı metodu | `_CategoryCard` `StatelessWidget` | ✅ |
| 22 | P3 | `topic_tests_screen.dart:251` | `_buildTestCard` yardımcı metodu | Sonraki tur (state'e bağlı, büyük) | ⏭️ |
| 23 | P3 | `onboarding_screen.dart:135, 165, 323, 430, 625, 679` | Büyük `_buildX()` iskelet yardımcıları (state'e sıkı bağlı) | Sonraki tur — ayrı widget'lara bölme riskli, davranış testleri gerekiyor | ⏭️ |
| 24 | P3 | `quiz_result_screen.dart:230`, `quiz_screen.dart:1359, 1378`, `exam_target_picker_view.dart:196` | `_buildX()` yardımcıları | Sonraki tur | ⏭️ |
| 25 | P3 | `current_affairs_card.dart`, `exams_screen.dart`, `home_screen.dart`, `practice_hub_screen.dart`, `quiz_screen.dart` … (bkz. **Ek B**) | `Container`+`Border.all`+`circular(10/12)` iç kutular — bir kısmı kart, bir kısmı iç bilgi kutusu | Kart olanlar `TactileCard`'a; iç kutular için ortak `KadroInfoPanel` değerlendirilmeli | ⏭️ |
| 26 | P4 | `lib/shared/widgets/*/…_painter.dart`, `climate_chart.dart`, `turkey_map.dart` | `Color(0xFF..)`, `Colors.*`, `fontSize` | **Bilinçli istisna:** MASTER.md §"Bilimsel Çizimler Korunur" — `CustomPainter` tuvalleri `TextTheme` alamaz; dokunulmadı | 🚫 |
| 27 | P4 | `lib/features/quiz/data/models/question.dart:505…`, `lib/features/map_practice/data/map_practice_data.dart` (11 yer) | Harita vurgu renkleri `Color(0xFF..)` veri katmanında | İçerik verisi (il boyama paleti); ileride `TurkeyMapPalette` sabitlerine taşınabilir | ⏭️ |
| 28 | P4 | `geo_diagram_painter.dart:169, 715`, `sun_diagram_painter.dart:163, 290, 376`, `population_pyramid_painter.dart:36, 45` | Tuval etiketlerinde `⚡ ☀️ ★ ♂ ♀` glifleri | Bilimsel çizim istisnası (bkz. #26); test beklentileri de bu etiketleri kullanıyor | 🚫 |
| 29 | P4 | `sample_flashcards.dart`, `true_false_item.dart`, `map_practice_data.dart` | `⚠️ ÖSYM Çeldirici Tuzağı` içerik metinleri | İçerik sözleşmesi (`distractorTrap`) — UI emojisi değil | 🚫 |

Ek değişiklikler: `KadroBadge`'e geriye uyumlu `iconColor` parametresi eklendi (nötr rozette altın alev gibi ikon ve metin renginin ayrıldığı durumlar için). Yeni ortak bileşenler `test/shared_components_standardization_test.dart` içinde test edildi. Metinden kaldırılan glifler nedeniyle `test/quiz_result_test.dart` beklentileri güncellendi (`'✓ '`, `' 🎉'`, `' →'`).

Durum: ✅ düzeltildi · ⏭️ sonraki tur · 🚫 bilinçli istisna

## Ek A — Elle yazılmış rozetler (Bulgu #14)

Tarama: `Container(` + `padding: EdgeInsets.symmetric(horizontal ≤ 12, vertical ≤ 6)` + `BoxDecoration` + `child: Text|Row`. Satır numaraları denetim anındaki (değişiklik öncesi) konumlardır. Dönüşümde varsayılan `KadroBadge` ölçüsü (`8×3` dolgu, `8px` köşe, `labelSmall w700`, tek satır) uygulanır; renkler aynen korunur.

**✅ `KadroBadge`'e dönüştürülen 51 yer** (yollar `lib/features/` altında)

| Dosya | Satırlar |
| --- | --- |
| `current_affairs/presentation/current_affairs_screen.dart` | 296 |
| `current_affairs/presentation/widgets/current_affairs_card.dart` | 86, 211 |
| `exams/presentation/exams_screen.dart` | 499, 538, 552, 588 |
| `flashcards/presentation/flashcards_screen.dart` | 885, 907 |
| `games/presentation/concept_match_screen.dart` | 288 |
| `games/presentation/true_false_blitz_screen.dart` | 370, 408, 446, 508 |
| `home/presentation/home_screen.dart` | 249 |
| `lessons/presentation/lessons_screen.dart` | 180, 322, 442 |
| `lessons/presentation/lesson_topics_screen.dart` | 572, 601, 630, 648 |
| `lessons/presentation/topic_tests_screen.dart` | 298, 315, 340 |
| `map_practice/presentation/map_challenge_screen.dart` | 449, 883 |
| `map_practice/presentation/map_practice_hub_screen.dart` | 285, 448, 579 |
| `mistakes/presentation/mistakes_screen.dart` | 633, 649 |
| `onboarding/presentation/onboarding_screen.dart` | 232, 1264, 1364 |
| `planner/presentation/study_planner_screen.dart` | 381, 413 |
| `planner/presentation/widgets/auto_study_program_modal.dart` | 356, 553 |
| `planner/presentation/widgets/home_daily_plan_card.dart` | 68, 97, 119 |
| `practice/presentation/practice_hub_screen.dart` | 400, 655, 942 |
| `profile/presentation/paywall_screen.dart` | 113, 210 |
| `profile/presentation/widgets/candidate_hero_card.dart` | 109 |
| `quiz/presentation/quiz_screen.dart` | 1134 |
| `reports/presentation/admin_reports_screen.dart` | 109 |
| `score_calculator/presentation/kpss_score_calculator_screen.dart` | 631 |
| `stats/presentation/quiz_history_screen.dart` | 97 |
| `stats/presentation/quiz_session_detail_screen.dart` | 94 |
| `stats/presentation/stats_screen.dart` | 358, 652, 911 |

(`map_practice_hub_screen.dart:570` bir ikon zemini kutusuydu, rozet değil; `_CategoryCard` içinde `12px` köşeye çekildi.)

**🚫 Bilinçli olarak bırakılan 7 yer** (rozet değil: sayaç / HUD / metrik ya da paylaşım görseli)

| Dosya:Satır | Neden |
| --- | --- |
| `home/presentation/home_screen.dart:352` | Günlük hedef yüzdesi metrik hapı (`labelLarge` + tabular rakam) |
| `quiz/presentation/quiz_result_screen.dart:724` | Büyük başarı yüzdesi metrik hapı |
| `quiz/presentation/quiz_screen.dart:1222` | Soru sayacı HUD'u (`bodyMedium` + tabular rakam) |
| `quiz/presentation/quiz_screen.dart:1328` | Görsel üstü `scrim` "Büyüt" bindirmesi |
| `quiz/presentation/quiz_screen.dart:1669` | Sınav sayacı (kritik durum + ek süre, iki metin) |
| `quiz/presentation/widgets/victory_story_card.dart:149` | Hikâye paylaşım görseli — ayrı, büyük ölçekli kompozisyon |
| `reports/presentation/admin_reports_screen.dart:135` | Tam genişlikte bildirim nedeni satırı (bilgi kutusu) |

## Ek B — `Border.all` içeren elle kutu/kart yoğunluğu (Bulgu #25)

`map_challenge_screen.dart` 8 · `home_screen.dart` 6 · `quiz_screen.dart` 5 · `exams_screen.dart` 5 · `onboarding_screen.dart` 4 · `victory_story_card.dart` 3 · `quiz_result_screen.dart` 3 · `practice_hub_screen.dart` 3 · `auto_study_program_modal.dart` 3 · `lessons_screen.dart` 3 · `true_false_blitz_screen.dart` 3 · diğer 18 dosyada 1–2.

## Önerilen standart ölçek

- **Radius:** 16 kart · 14 buton / seçenek · 12 iç kutu / ikon zemini · 8 rozet · 6 küçük etiket · 999 hap (pill). (`11`, `9`, `7`, `18`, `14.5` kullanılmaz; `TactileCard` iç kırpması kendisi yapar.)
- **Kenarlık:** kartta `1.5px` + `3px` keskin alt dudak (`TactileCard`); rozet/iç kutuda `1px`.
- **Gölge:** her yerde `blurRadius: 0`.
