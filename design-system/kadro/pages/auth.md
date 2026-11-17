# Auth Page Overrides (`AuthScreen`)

> **PROJECT:** Kadro  
> **Base Source:** `design-system/kadro/MASTER.md` + `ui-ux-pro-max` (`--page auth`)  
> **Page Type:** Authentication & Guest Showcase  

> ⚠️ **IMPORTANT:** Rules in this file **override** `design-system/kadro/MASTER.md` only for `AuthScreen` (`lib/features/auth/presentation/auth_screen.dart`).

---

## Page-Specific Rules

### Layout Overrides

- **Max Width:** `1200px` Split-Pane Showcase (`flex: 6` Kadro Studio Benefits + Guest Tools | `flex: 5` Auth Form) at `>= 960px`; `720px` single-column on Mobile/Tablet

### Typography & Color Overrides

- **Legal Footer Contrast (`color-contrast`):** Legal consent prose (`Kullanım Koşulları`, `Gizlilik Politikası`) MUST use `colorScheme.onSurfaceVariant` (`>= 6.8:1`), never `colorScheme.outline` (`2.99:1`)

### Form & Accessibility Overrides (`ui-ux-pro-max` §1 & §8)

- **`accessible-authentication` & `autofill-support`:** Wrap form fields in `AutofillGroup` and declare explicit `autofillHints` (`AutofillHints.name`, `AutofillHints.email`/`AutofillHints.username`, `AutofillHints.password`/`AutofillHints.newPassword`) so Web browsers and iOS/Android password managers autofill seamlessly
- **`password-toggle`:** Include an accessible show/hide visibility toggle button (`PhosphorIconsRegular.eye` / `eyeSlash`) on password fields with descriptive Turkish tooltips/labels
- **`touch-target-size`:** Ensure inline text action controls (`Şifremi Unuttum?`, legal links) meet comfortable hit areas without collapsing to `< 40px` height on touchscreens
- **Controller Lifecycle (`flutter.csv` #38):** Modal forms (e.g., Password Reset) MUST encapsulate and cleanly `dispose()` their `TextEditingController`

---

## Recommendations (`ui-ux-pro-max`)

- Keep paste enabled on all password/email inputs (WCAG 2.2 Minimum AA)
- Always show explicit loading state inside CTA button while request is in flight (`disabled` + spinner)
