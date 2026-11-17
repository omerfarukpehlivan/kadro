# Profile Page Overrides (`ProfileScreen`, `CandidateHeroCard`, `ProfileMetricsCard`)

> **PROJECT:** Kadro  
> **Base Source:** `design-system/kadro/MASTER.md` + `ui-ux-pro-max` (`--page profile`)  
> **Page Type:** Settings, Account & Target Preferences  

> ⚠️ **IMPORTANT:** Rules in this file **override** `design-system/kadro/MASTER.md` only for `ProfileScreen` and its sub-widgets.

---

## Page-Specific Rules

### Layout Overrides

- **Max Width:** `1240px` Two-Column Settings Layout when Profile content width `>= 880px` (Left `flex: 5` Identity Hero + Metrics + Achievement Showcase | Right `flex: 6` Cloud Account + PRO Banner + Goal/Exam Settings + App Preferences + Legal/KVKK); `720px` single-column on Mobile/Tablet and narrow Desktop windows with Sidebar
- **Scroll Behavior:** Wrap vertical scroll surfaces in `Scrollbar` on Desktop/Web

### Data & Multi-Exam Consistency Overrides

- **Dynamic Target Exam Row (`Hedef sınav`):** Keep `'Hedef sınav'` in `ListTile.title` (full width) and render `prefs.examSelection.displayTitle` in primary-colored `ListTile.subtitle` so long exam titles never squeeze `'Hedef sınav'` vertically on compact screens (`360px`) or narrow columns; open `TargetExamSelectorBottomSheet.showSelection(...)` on tap
- **Clean Identity Hero (`CandidateHeroCard`):** Display identity, active exam subtitle, score/daily targets, and `Hedefi Düzenle` CTA without repeating the HomeScreen countdown strip

### Contrast & Motion Overrides

- **High-Contrast Text (`color-contrast`):** Replace `colorScheme.outline` (`2.99:1`) and `colorScheme.secondary` (`3.39:1`) text instances in `CandidateHeroCard` and `ProfileMetricsCard` with `colorScheme.onSurfaceVariant` / `colorScheme.onSecondaryContainer`
- **Reduced Motion & High Readability:** Support `MediaQuery.disableAnimationsOf(context)` and expose `highReadabilityMode` toggle cleanly

---

## Recommendations (`ui-ux-pro-max`)

- Separate destructive account deletion (`Hesabımı ve Verilerimi Sil`, `colorScheme.error`) clearly at the bottom of Legal & Privacy card with explicit confirmation dialog (`destructive-nav-separation` / `confirmation-dialogs`)
- Keep all modal settings pickers (`Günlük Hedef`, `Tema`, `Soru Çözüm Modu`) keyboard-accessible with `Esc` dismiss
