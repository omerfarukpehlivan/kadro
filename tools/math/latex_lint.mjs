// LaTeX yazım denetimi — TASK-172.
// Soru derleyicisi (compile_questions.mjs) ve konu anlatımı dönüştürücüsü
// (konu_anlatimi_to_sql.mjs) aynı kuralı kullanır. İzinli komutlar tek kaynaktan okunur:
// docs/parity_fixtures/math_text.json → latexCommands + latexSymbols (iki platformda da
// render testi yapılan liste).

import { readFileSync } from "node:fs";

import { bracesBalanced, latexCommandsIn, parseMathSegments } from "./mathtext.mjs";

const FIXTURE = JSON.parse(
  readFileSync(new URL("../../docs/parity_fixtures/math_text.json", import.meta.url), "utf8")
);
export const ALLOWED_LATEX_COMMANDS = new Set([...FIXTURE.latexCommands, ...FIXTURE.latexSymbols]);

/** Metindeki matematik yazımını denetler; hata iletilerini döndürür. */
export function lintMathText(raw, where) {
  const errors = [];
  if (!raw) return errors;
  const segs = parseMathSegments(raw.replace(/\\\$/g, "\u0000"));
  for (const seg of segs) {
    if (seg.type === "text") {
      if (seg.value.includes("$")) errors.push(`${where}: kapanmamış veya boş $ var (para birimi için \\$ yazın)`);
      if (/\\[a-zA-Z]+|\^\{|_\{/.test(seg.value))
        errors.push(`${where}: LaTeX komutu $...$ dışında kalmış → "${seg.value.trim().slice(0, 40)}"`);
      continue;
    }
    const m = seg.value;
    if (!bracesBalanced(m)) errors.push(`${where}: süslü parantezler dengesiz → $${m}$`);
    for (const cmd of latexCommandsIn(m)) {
      if (!ALLOWED_LATEX_COMMANDS.has(cmd)) errors.push(`${where}: izin verilmeyen LaTeX komutu \\${cmd} → $${m}$`);
    }
    if (/\\\\/.test(m)) errors.push(`${where}: matematik içinde satır kırma (\\\\) kullanılamaz`);
    if (/[ğüşıöçĞÜŞİÖÇ]/.test(m.replace(/\\(text|mathrm)\{[^}]*\}/g, "")))
      errors.push(`${where}: Türkçe harf $...$ içinde; sözcükleri matematiğin dışına yazın → $${m}$`);
  }
  return errors;
}
