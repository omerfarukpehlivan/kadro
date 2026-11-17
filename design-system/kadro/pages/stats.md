# Stats Page Overrides (`StatsScreen`, `QuizHistoryScreen`, `QuizSessionDetailScreen`)

> **PROJECT:** Kadro  
> **Base Source:** `design-system/kadro/MASTER.md` + `ui-ux-pro-max` (`--page stats`)  
> **Page Type:** Analytics Dashboard & Performance Charts  

> ⚠️ **IMPORTANT:** Rules in this file **override** `design-system/kadro/MASTER.md` only for `StatsScreen`, `QuizHistoryScreen`, and `QuizSessionDetailScreen`.

---

## Page-Specific Rules

### Layout Overrides

- **Max Width:** `1240px` 2-Column Analytical Grid on Desktop (`>= 1024px`: `flex: 7` BarChart + Mastery Heatmap | `flex: 5` Achievements + Weekly League + Session Archive); `920px` for `QuizHistoryScreen` and `QuizSessionDetailScreen`
- **Grid Metrics Row:** Top KPI row uses equal-height cards via `IntrinsicHeight` on Desktop and responsive 2-column grid on Mobile

### Typography & Color Overrides

- **WCAG 4.5:1 Strict Ink Enforcement (`color-contrast`):**
  - Never render numeric stats, rank numbers, or subtle labels using low-contrast `colorScheme.outline` (`2.99:1`), `colorScheme.secondary` (`3.39:1`), or `colorScheme.tertiary` (`2.79:1`) directly on light `surface`
  - Always use `colorScheme.onSecondaryContainer` (`9.77:1`), `colorScheme.onTertiaryContainer` (`8.66:1`), `colorScheme.primary` (`7.64:1`), or `colorScheme.onSurfaceVariant` (`6.87:1`) on text

### Chart & Data Rules (`ui-ux-pro-max` §10)

- **`tooltip-on-interact`:** `BarChart` MUST keep `BarTouchData(enabled: true)` with readable tooltip showing lesson name, accuracy `%`, and solved count on hover (Web) or tap (Mobile)
- **`axis-labels`:** Display Y-axis percentage ticks (`%0`, `%50`, `%100`) alongside horizontal lesson abbreviations
- **`empty-data-state` & `screen-reader-summary`:** Show helpful empty-data guidance caption when `totalSolved == 0` and provide a descriptive `Semantics` summary above/around the chart
- **`truncation-strategy`:** Provide `Tooltip` wrappers on truncated achievement badge tiles

---

## Recommendations (`ui-ux-pro-max`)

- Handle async errors gracefully in `_LeaderboardCard` (`snapshot.hasError`) with an explicit retry button rather than silent empty fallback
- Maintain `Scrollbar` on desktop scrollable stats, history, and session-detail views
