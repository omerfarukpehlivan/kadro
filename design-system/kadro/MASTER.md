# Kadro Design System — Master Source of Truth (`ui-ux-pro-max`)

> **LOGIC:** When building or refactoring any screen or widget in **Kadro**, check `design-system/kadro/pages/[page-name].md` first.
> If that file exists, its rules **override** this Master file.
> If not, strictly follow the brand design tokens, Mascot Coach specs, Tactile Gamified UI rules, and checklist below.

---

**Project:** Kadro (`com.omer.kadro`)
**Category:** Adult Gamified EdTech — KPSS Lisans Genel Kültür Hazırlık (Tarih, Coğrafya, Vatandaşlık, Güncel Bilgiler)
**Design Paradigm:** Duolingo / Brilliant Style **"Tactile & Gamified"** + **Live Mascot Coach ("Kadro Koçu" — Anadolu Kartalı)**
**Stack:** Flutter 3.x + Material 3 (`flex_color_scheme`, `google_fonts`, `lucide_icons_flutter`, `flutter_animate`, `fl_chart`)

---

## 1. Brand Mascot & Persona: "Kadro Koçu" (Anadolu Kartalı)

Kadro's brand identity centers on **Kadro Koçu**, a charismatic, sharp-eyed **Anatolian Eagle (Anadolu Kartalı)** mentor who guides KPSS candidates with determination, wisdom, and Seljuk/Anatolian heritage pride.

### Mascot Moods & Asset Paths (`lib/shared/widgets/mascot_coach_banner.dart`)

| Mood (`MascotMood`) | Asset Path | Screen Usage | Persona & Speech Bubble Tone |
|---------------------|------------|--------------|------------------------------|
| `MascotMood.coach` | `assets/images/mascot/tugrul_coach.png` | `HomeScreen`, `LessonsScreen` | Encouraging mentor: *"Hedefe pençe atma vakti! Bugün hangi dersten net topluyoruz?"* |
| `MascotMood.victory` | `assets/images/mascot/tugrul_victory.png` | `QuizResultScreen`, `StatsScreen` | Proud celebrator holding trophy: *"Harika uçuş! Her çözdüğün test seni kadroya bir adım yaklaştırıyor."* |
| `MascotMood.detective` | `assets/images/mascot/tugrul_detective.png` | `MistakesScreen`, `FlashcardsScreen` | Analytical scholar with glasses/magnifier: *"Hiçbir yanlış gözümden kaçmaz! Eksikleri birlikte kapatalım."* |
| `MascotMood.pro` | `assets/images/mascot/tugrul_pro.png` | `PaywallScreen`, `ProfileScreen` | Royal eagle with gold crown & cape: *"Kadro PRO ile kanatlarını tam aç, günlük sınırları ortadan kaldır!"* |

> **Test Resilience Rule:** Every `Image.asset(...)` displaying Tuğrul **MUST** include an `errorBuilder` fallback (rendering a styled `Icon(LucideIcons.award)` or `LucideIcons.graduationCap` inside a circular badge) so isolated widget tests never fail on asset decoding.

---

## 2. Color Palette (Academic Royal Indigo + Anatolian Gold + Emerald)

> **CRITICAL FLUTTER RULE:** Raw `Color(0xFF...)` definitions are **ONLY** allowed inside `lib/app/theme.dart` (`AppTheme`). All screens and widgets **MUST** read colors dynamically from `Theme.of(context).colorScheme`.

| Role | Light Hex | Dark Hex | Flutter `ColorScheme` Token | Usage |
|------|-----------|----------|-----------------------------|-------|
| **Primary (Royal Indigo)** | `#4F46E5` | `#818CF8` | `colorScheme.primary` | Primary CTAs, tactile active borders, progress bars |
| **Primary Container** | `#E0E7FF` | `#312E81` | `colorScheme.primaryContainer` | Mascot speech bubble accents, selected tiles, hero card surface |
| **Secondary (Deep Slate)** | `#0F172A` | `#94A3B8` | `colorScheme.secondary` | Secondary actions, topic pills |
| **Secondary Container** | `#F1F5F9` | `#1E293B` | `colorScheme.secondaryContainer` | Tactile card icon wells, neutral badges |
| **Tertiary (Anatolian Gold / Streak Amber)** | `#D97706` | `#FBBF24` | `colorScheme.tertiary` | Daily goal flame/streak, Kadro Koçu PRO crown, exam timer warning |
| **Tertiary Container** | `#FEF3C7` | `#78350F` | `colorScheme.tertiaryContainer` | Streak pill background, `%45 · En Yüksek Ağırlık` badge |
| **Error / Destructive** | `#DC2626` | `#F87171` | `colorScheme.error` | Wrong option feedback, mistake counter, critical timer (`< 5 min`) |
| **Surface / Background** | `#F8FAFC` | `#0B0F19` | `colorScheme.surface` | Clean slate page background |

---

## 3. "Tactile & Gamified" UI Geometry (Duolingo / Brilliant Feel)

Instead of flat, lifeless default Material cards, Kadro uses **Tactile Cards** with crisp borders and a subtle 3D bottom lip:
- **Tactile Container Style:**
  - `borderRadius: BorderRadius.circular(18)`
  - Top/Left/Right border: `1.5px` (`colorScheme.outlineVariant` or `colorScheme.primary.withAlpha(80)`)
  - Bottom 3D lip shadow: `BoxShadow(color: colorScheme.outlineVariant, offset: const Offset(0, 3), blurRadius: 0)` (creates the signature Duolingo/Brilliant 3D pressable card depth without muddy blur!).
- **Speech Bubble (`MascotCoachBanner`):**
  - Displays Kadro Koçu's avatar on the left (`68x68` rounded badge) and a speech-bubble container on the right with a small title badge (`'KADRO KOÇU'`) and motivating message.
- **Gamified Top Stats Strip / Streak Pill:**
  - `AppTopBar` and `HomeScreen` feature gamified pill badges (`LucideIcons.flame` for daily target progress, `LucideIcons.crown` for PRO status).

---

## 4. Typography System (`google_fonts`)

- **Heading / Display / Title Styles (`display*`, `headline*`, `title*`):** `GoogleFonts.plusJakartaSans` (`FontWeight.w700` / `FontWeight.w800` for chunky, confident gamified headings).
- **Body / Label Styles (`body*`, `label*`):** `GoogleFonts.inter` (`FontWeight.w400` / `FontWeight.w600`).
- **Test Environment Guard:** In `AppTheme._buildTextTheme`, always check `if (Platform.environment.containsKey('FLUTTER_TEST')) return base;` so `flutter test` never triggers external HTTP font fetches.

---

## 5. Motion & Micro-Interactions (`flutter_animate`)

- **Entrance Choreography:** Mascot banners and tactile cards enter with `fadeIn(duration: 200.ms).slideY(begin: 0.04, end: 0, duration: 200.ms)`.
- **Test Safety:** Never exceed `250ms` and **NEVER** use infinite `.repeat()` animations (which cause `pumpAndSettle()` in `flutter test` to time out).

---

## 6. Pre-Delivery Verification Checklist

- [ ] Zero raw `Color(0xFF...)` or `Colors.*` outside `lib/app/theme.dart`
- [ ] Zero raw `fontSize:` outside `lib/app/theme.dart`
- [ ] All existing widget test texts (`'Hoş geldin'`, `'0 / 30 soru'`, `'Konu testi'`, `'Tarih'`, `'Kadro'` vb.) preserved
- [ ] `dart format lib test` -> 0 changes needed
- [ ] `flutter analyze` -> `No issues found!`
- [ ] `flutter test` -> All tests pass (`0` failures)
