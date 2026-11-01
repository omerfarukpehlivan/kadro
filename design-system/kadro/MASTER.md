# Kadro Design System — Master Source of Truth (`ui-ux-pro-max`)

> **LOGIC:** When building or refactoring any screen or widget in **Kadro**, check `design-system/kadro/pages/[page-name].md` first.
> If that file exists, its rules **override** this Master file.
> If not, strictly follow the brand design tokens, component specs, and rules below.

---

**Project:** Kadro (`com.omer.kadro`)
**Category:** Adult Professional EdTech — KPSS Lisans Genel Kültür Hazırlık (Tarih, Coğrafya, Vatandaşlık, Güncel Bilgiler)
**Design Paradigm:** Modern Academic Bento + Gamified Progress + Subtle Micro-Interactions
**Stack:** Flutter 3.x + Material 3 (`flex_color_scheme`, `google_fonts`, `lucide_icons_flutter`, `flutter_animate`, `fl_chart`)

---

## 1. Brand Identity & Color Palette

Kadro uses **Academic Royal Indigo** (trust, focus, deep memory retention) paired with **Achievement Amber Gold** (streaks, daily goals, PRO badge, motivation) and **Emerald Success** (correct answers, net score growth).

> **CRITICAL FLUTTER RULE:** Raw `Color(0xFF...)` definitions are **ONLY** allowed inside `lib/app/theme.dart` (`AppTheme`). All screens and widgets **MUST** read colors dynamically from `Theme.of(context).colorScheme`.

### Semantic Color Tokens (`AppTheme` -> `ColorScheme`)

| Role | Light Hex | Dark Hex | Flutter `ColorScheme` Token | Usage |
|------|-----------|----------|-----------------------------|-------|
| **Primary (Academic Indigo)** | `#4F46E5` | `#818CF8` | `colorScheme.primary` | Primary CTAs, active nav indicator, progress bars, focused borders |
| **Primary Container** | `#E0E7FF` | `#312E81` | `colorScheme.primaryContainer` | Hero cards, highlighted icon badges, selected option backgrounds |
| **Secondary (Deep Slate)** | `#0F172A` | `#94A3B8` | `colorScheme.secondary` | Secondary actions, topic chips, subtle accents |
| **Secondary Container** | `#F1F5F9` | `#1E293B` | `colorScheme.secondaryContainer` | Bento card surfaces, unselected pills |
| **Tertiary (Achievement Amber)** | `#D97706` | `#FBBF24` | `colorScheme.tertiary` | Daily goal flame/streak, Kadro PRO crown, exam timer warning, badges |
| **Tertiary Container** | `#FEF3C7` | `#78350F` | `colorScheme.tertiaryContainer` | Streak badge background, curriculum weight pill (`%45 · En Yüksek Ağırlık`) |
| **Error / Destructive** | `#DC2626` | `#F87171` | `colorScheme.error` | Wrong option feedback, mistake counter, critical timer (`< 5 min`) |
| **Surface / Background** | `#F8FAFC` | `#0B0F19` | `colorScheme.surface` | Clean slate page background (replaces default purple-tinted M3 surface) |

---

## 2. Typography System (`google_fonts`)

Kadro pairs **Plus Jakarta Sans** (geometric, authoritative, modern EdTech display/headings) with **Inter** (high-legibility UI & long-form KPSS exam question reading).

- **Heading / Display / Title Styles (`display*`, `headline*`, `title*`):** `GoogleFonts.plusJakartaSans` (`FontWeight.w700` / `FontWeight.w600`)
- **Body / Label Styles (`body*`, `label*`):** `GoogleFonts.inter` (`FontWeight.w400` / `FontWeight.w500` / `FontWeight.w600`)
- **Numeric Alignment:** Timer badges and stat counters should remain crisp and scannable.

---

## 3. Iconography Discipline (`lucide_icons_flutter`)

- **Standard Icon Set:** Prefer `LucideIcons` (`package:lucide_icons_flutter/lucide_icons.dart`) across navigation, headers, study cards, and analytics to replace generic default Android `Icons.*` and achieve a unified linear aesthetic (similar to Linear, Duolingo, Notion).
- **No Emojis as UI Icons:** Never use raw text emojis (`🔥`, `👑`, `📚`) where a vector icon (`LucideIcons.flame`, `LucideIcons.crown`, `LucideIcons.bookOpen`) belongs.

---

## 4. Layout, Geometry & Bento Grid Rules

| Token | Value | Flutter Implementation |
|-------|-------|------------------------|
| **Screen Padding** | `16px` | `EdgeInsets.all(16)` |
| **Card Border Radius** | `16px` | `BorderRadius.circular(16)` (configured globally via `FlexSubThemesData`) |
| **Button / Input Radius** | `12px` | `BorderRadius.circular(12)` |
| **Card Border** | `1px subtle` | ` outlineVariant` thin border, `elevation: 0` or `0.5` (no heavy muddy drop shadows) |
| **AppTopBar** | Surface-blended | Uses `colorScheme.surface` with centered/clean brand typography — **NEVER** `colorScheme.inversePrimary`! |

### Home Screen Pattern: Bento Grid + Hero Goal Card
- **Hero Daily Goal Card:** Prominent top card showing daily question progress (`solved / goal soru`), percentage badge, and animated progress bar.
- **2x2 Bento Study Grid:** The 4 core study modes (`Konu testi`, `Bilgi kartları`, `Yanlış defteri`, `Deneme sınavı`) are displayed in a responsive 2-column Bento layout (or structured feature cards with icon containers) rather than plain flat `ListTile` rows.

---

## 5. Motion & Micro-Interactions (`flutter_animate`)

- **Staggered Entrance:** Screen cards and list items use subtle fade + vertical slide (`fadeIn(duration: 250.ms).slideY(begin: 0.05, end: 0)`).
- **Keep Animations Fast & Test-Safe:**
  - Total animation durations **MUST NOT** exceed `300ms` so `tester.pumpAndSettle()` in `flutter test` completes rapidly without timeouts.
  - **NEVER** use infinite looping animations (`.repeat()`) on screens tested with `pumpAndSettle()`, as infinite animations cause `pumpAndSettle()` to time out!

---

## 6. Visual Analytics (`fl_chart`)

- **StatsScreen (`lib/features/stats/presentation/stats_screen.dart`):**
  - Combines the 3 summary KPI cards (`Çözülen soru`, `Doğru oranı`, `En zayıf ders`) with a **Lesson Performance BarChart (`fl_chart`)** showing accuracy across the 4 KPSS Genel Kültür lessons (`TAR`, `COĞ`, `VAT`, `GÜN`).
  - Uses short axis codes (`TAR`, `COĞ`, `VAT`, `GÜN`) on the chart's X-axis so full lesson names (`Tarih`, `Coğrafya`, `Vatandaşlık`, `Güncel Bilgiler`) do not collide with widget text finders in unit/widget tests.

---

## 7. Pre-Delivery Verification Checklist

Before completing any UI task:
- [ ] Zero raw `Color(0xFF...)` or `Colors.*` outside `lib/app/theme.dart`
- [ ] Zero raw `fontSize:` outside `lib/app/theme.dart`
- [ ] No infinite `.repeat()` animations that break `pumpAndSettle()`
- [ ] `dart format lib test` -> 0 changes needed
- [ ] `flutter analyze` -> `No issues found!`
- [ ] `flutter test` -> All tests pass (`0` failures)
