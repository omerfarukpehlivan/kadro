# Paywall Page Overrides (`PaywallScreen`)

> **PROJECT:** Kadro  
> **Base Source:** `design-system/kadro/MASTER.md` + `ui-ux-pro-max` (`--page paywall`)  
> **Page Type:** Subscription Plans & Entitlement Sync  

> ⚠️ **IMPORTANT:** Rules in this file **override** `design-system/kadro/MASTER.md` only for `PaywallScreen` (`lib/features/profile/presentation/paywall_screen.dart`).

---

## Page-Specific Rules

### Layout Overrides

- **Max Width:** `1040px` Two-Column Split (`flex: 6` Plan Cards | `flex: 5` Benefits & CTA Stack) at `>= 900px`; `720px` single-column on Mobile
- **Scroll Behavior:** Wrap main vertical `ListView` inside `Scrollbar` on Desktop/Web

### Typography & Color Overrides

- Popular/Selected subscription tier highlights with `colorScheme.primary` border (`1.5px`) + tactile `3px` lip and blended `primaryContainer` tint; `PRO` crown badges use `tertiaryContainer` + `onTertiaryContainer` (`7.73:1`)

### Platform & Compliance Rules

- Web environment hides mobile-only offline download benefit row when `OfflineDownloadService.isSupported` is `false` and hides unsupported rewarded ad buttons cleanly (`AdService.isRewardedAdSupported`)
- Never grant client-side PRO status without verified purchase or backend entitlement sync

---

## Recommendations (`ui-ux-pro-max`)

- Keep pricing aligned using `FontFeature.tabularFigures()`
- Keep restore/sync action accessible below primary CTA with clear loading indicator
