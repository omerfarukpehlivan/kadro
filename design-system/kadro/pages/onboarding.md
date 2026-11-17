# Onboarding Page Overrides (`OnboardingScreen`)

> **PROJECT:** Kadro  
> **Base Source:** `design-system/kadro/MASTER.md` + `ui-ux-pro-max` (`--page onboarding`)  
> **Page Type:** 3-Step Guided Setup Wizard  

> ⚠️ **IMPORTANT:** Rules in this file **override** `design-system/kadro/MASTER.md` only for `OnboardingScreen` (`lib/features/onboarding/presentation/onboarding_screen.dart`).

---

## Page-Specific Rules

### Layout Overrides

- **Max Width (`container-width`):** Constrain BOTH step indicator header, scrollable step body (with `Scrollbar`), and sticky bottom CTA footer within `ResponsiveContentWrapper(maxWidth: 820)` so desktop Web (`1440px`) stays balanced and readable instead of stretching edge-to-edge
- **Readable Text Measure:** Keep subtitles and exam descriptions under `65–75` characters per line via centered container constraint

### Navigation & Progress Overrides (`ui-ux-pro-max` §8 & §9)

- **`multi-step-progress`:** Always preserve step counter (`Adım X / 3`) + `LinearProgressIndicator` + `Geri` button on Steps 2 and 3
- **`TugrulAvatar` Help Consistency:** Maintain step-contextual mood (`exam`, `practice`, `coach`) clickable to open `TugrulTipsSheet`

---

## Recommendations (`ui-ux-pro-max`)

- Preserve `PopScope(canPop: !widget.isMandatory)` when opened as initial mandatory gate
- Keep tactile card states unambiguous across exam selection, daily pace cards, and priority subject selection
