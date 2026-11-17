# Dashboard Page Overrides (`HomeScreen`)

> **PROJECT:** Kadro  
> **Base Source:** `design-system/kadro/MASTER.md` + `ui-ux-pro-max` (`--page dashboard`)  
> **Page Type:** Dashboard / Study Cockpit  

> ⚠️ **IMPORTANT:** Rules in this file **override** `design-system/kadro/MASTER.md` only for `HomeScreen` (`lib/features/home/presentation/home_screen.dart`). All other design tokens remain governed by `MASTER.md`.

---

## Page-Specific Rules

### Layout Overrides

- **Max Width:** `1240px` (`ResponsiveContentWrapper`) on Desktop (`>= 1024px`), `720px` on Tablet/Phone
- **Desktop Bento Split:** Two-column cockpit (`flex: 7` Hero + Weak Lesson Radar + Daily Plan | `flex: 5` Exam Countdown / Pomodoro + Smart Reminders), `20px` horizontal gutter
- **Scroll Behavior:** Wrap vertical scroll content in `Scrollbar` on Desktop/Web

### Spacing Overrides

- **Content Density:** Balanced EdTech Cockpit (`AppSpacing.gapMd = 16px` section rhythm, zero vertical crowding)

### Typography & Color Overrides

- Use `FontFeature.tabularFigures()` on daily question counters, streaks, and percentages
- Use `colorScheme.onSurfaceVariant` (never low-contrast `colorScheme.outline`) on secondary status labels and reminder dates

### Component & Accessibility Overrides

- Top-bar daily goal indicator MUST display today's daily count (`dailySolvedCount / dailyGoal`) consistently across `AppTopBar` (mobile), `DesktopTopUtilityBar` (desktop), and `KadroSidebar`
- Interactive hero badges and `TugrulAvatar` coach tips trigger must expose button semantics, pointer cursor on Web, and keyboard focus highlight

---

## Recommendations (`ui-ux-pro-max`)

- **Navigation / Help (`WCAG 2.2 A Consistent Help`):** `TugrulAvatar` help sheet must be accessible on both mobile top bar and desktop utility bar
- **Fold Protection:** Keep daily hero status + next task CTA visible above the fold on `390x844` and `1440x900`
