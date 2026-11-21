# Onboarding Page Overrides (`OnboardingScreen`)

> **PROJECT:** Kadro  
> **Base Source:** `design-system/kadro/MASTER.md` + `ui-ux-pro-max` (`--page onboarding`)  
> **Page Type:** 3-Step Guided Setup Wizard  

> ⚠️ **IMPORTANT:** Rules in this file **override** `design-system/kadro/MASTER.md` only for `OnboardingScreen` (`lib/features/onboarding/presentation/onboarding_screen.dart`).

---

## Page-Specific Rules

### Layout Overrides

- **Desktop / Wide Web (`>= 960px` via `ResponsiveBreakpoints.usesSplitPane`):**
  - Use a centered **2-Column SaaS Setup Studio** (`ResponsiveContentWrapper(maxWidth: 1180)`):
    - **Left Rail (`flex: 4`):** Persistent interactive 3-step stepper (`_SidebarStepTile` with live selected summaries) + **Live Program Blueprint & Tuğrul Advisory** card (`Kalan gün`, `Tahmini tamamlama`, quick-apply recommendation).
    - **Right Workspace Card (`flex: 7`):** Single focused `TactileCard` with progress bar (`Adım X / 3`), bold `Outfit` title, **2-column `ResponsiveGrid`** for Daily Pace cards and Priority Focus Lessons, and a right-aligned natural-width Web action footer (`Geri` left, `Devam Et` / `Programımı Kur ve Başla` right).
- **Mobile / Narrow Tablet (`< 960px`):**
  - Constrain header, scrollable body (`Scrollbar`), and docked footer within `ResponsiveContentWrapper(maxWidth: 720)` for balanced single-column mobile UX.
- **Readable Text Measure:** Keep subtitles and exam descriptions comfortable via card column sizing.

### Navigation & Progress Overrides (`ui-ux-pro-max` §8 & §9)

- **`express-onboarding` + Prominent Skip:** On mandatory first launch (`isMandatory: true`), present a **1-Step Express Setup** (Exam Selector + smart default pace/focus) with a prominently placed top-right **`Şimdilik Atla`** button (`onboarding_skip_button`) visible immediately above the fold on both Desktop and Mobile, plus an optional `'Süre ve hedefi de özelleştir'` trigger to expand into the full 3-step studio.
- **`multi-step-progress`:** When customizing (`isMandatory: false` or expanded), preserve step counter (`Adım X / 3`) + `LinearProgressIndicator` + `Geri` button on Steps 2 and 3.
- **`TugrulAvatar` Help Consistency:** Maintain step-contextual mood (`exam`, `practice`, `coach`) clickable to open `TugrulTipsSheet`.

---

## Recommendations (`ui-ux-pro-max`)

- Preserve `PopScope(canPop: !widget.isMandatory)` when opened as initial mandatory gate
- Keep tactile card states unambiguous across exam selection, daily pace cards, and priority subject selection
