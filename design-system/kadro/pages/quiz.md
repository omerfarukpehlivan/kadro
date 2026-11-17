# Quiz Page Overrides (`QuizScreen`, `OptionTile`, `QuizResultScreen`)

> **PROJECT:** Kadro  
> **Base Source:** `design-system/kadro/MASTER.md` + `ui-ux-pro-max` (`--page quiz`)  
> **Page Type:** Interactive Exam & Distractor Analysis Workspace  

> ⚠️ **IMPORTANT:** Rules in this file **override** `design-system/kadro/MASTER.md` only for `QuizScreen`, `OptionTile`, and `QuizResultScreen`.

---

## Page-Specific Rules

### Layout Overrides

- **Max Width:** Odaklı, tek parçalı çalışma alanı (`920px` Desktop / `>= 900px`, harita/grafikli sorularda görsel + şıklar yan yana `1140px`; `720px` Mobile/Tablet). Sabit sağ analiz/optik panel kaldırılmıştır; masaüstünde soru metni, 5 şık ve aksiyon butonu tek bakışta, dikey scroll gerektirmeksizin görünür.
- **Scroll Behavior:** Tüm soru ve şıklar tek ekrana sığacak kompakt dikey ritim (`ListView` + `Scrollbar` güvenlik korumalı fallback).
- **On-Demand Soru Paleti (Popup):** Optik form ve soru gezinti paleti ekranda sürekli yer kaplamaz; AppBar'daki buton, Meta Bar'daki "Soru X / Y" hapı veya `G / O / F2` kısayoluyla modal popup (masaüstünde 560px merkezî dialog, mobilde bottom sheet) olarak açılır.
- **Çözüm & Çeldirici Gösterimi:** Soru çözülürken boş çözüm placeholder'ı bulunmaz. Yalnızca Öğrenme modunda şık onaylandıktan sonra aksiyon butonunun altında `_ExplanationCard` eklenir (böylece "Sonraki Soru" butonu yerinden kaymaz); Sınav modunda ise açıklama sınav sonrasına kadar gizli kalır.

### Typography & Color Overrides

- **High Readability (E-KPSS Mode):** Dynamically scales question & options via `MediaQuery` `textScaler` (`1.2x`) and strengthens outlines to `2.0px`
- **Desktop Web Copyability:** Wrap question stem, solution explanation, and distractor trap text in `SelectionArea` so candidates can copy legal/history references

### Component & Interaction Overrides

- **`OptionTile` Keyboard Focus (`focus-states` / `focus-appearance`):** Visible `2.0px` focus ring MUST remain visible in **all** interactive option states (`normal` AND `selected` in Exam Mode)
- **Touch & Gesture Parity (`hover-vs-tap` + `gesture-alternative`):** Option elimination (strikethrough) cannot rely solely on desktop right-click or hover — provide an always-discoverable accessible eliminate control when answering
- **Screen Reader Semantics (`flutter.csv` #43):** Group option letter, option text, eliminated state, and answer state inside `Semantics(button: true, selected: ...)`

---

## Recommendations (`ui-ux-pro-max`)

- Keyboard shortcuts (`A–E / 1–5`, `Shift+1–5`, `Enter`, `F`, `F1/?`) active on Web/Desktop without stealing focus from modals
- Avoid layout-shifting hover transforms; keep tactile `3px` lip steady while shifting border/surface tint smoothly (`120ms`, disabled when `MediaQuery.disableAnimationsOf(context)` is true)
