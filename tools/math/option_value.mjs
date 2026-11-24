// Şık metnini sayıya çevirme — TASK-172.
// Derleyici, sayısal şıkların değerini kendisi hesaplayıp `dogrulama` ifadesiyle karşılaştırır;
// böylece yanlış işaretlenmiş cevap anahtarı veya birbirine eşit iki şık yayına çıkamaz.
//
// Desteklenen biçimler:
//   12 · -3 · 3,5 · 1.250 (binlik) · %25 · 48 km · 120°   (düz yazı, sayı + birim)
//   $\frac{3}{4}$ · $2\frac{1}{3}$ (tam sayılı kesir) · $5\sqrt{3}+2$ · $\sqrt[3]{4}$
//   $2^{-3}$ · $3{,}5$ · $4\pi$ · $x = 7$ (eşitliğin sağ tarafı) · $12$ cm
// Çevrilemeyen şık (değişken, küme, sözel ifade…) için null döner.

import { evalExpr } from "./expr.mjs";
import { parseMathSegments } from "./mathtext.mjs";

const PLAIN_NUMBER = /^\s*(%)?\s*([-−]?)\s*(\d{1,3}(?:\.\d{3})+|\d+)(?:,(\d+))?\s*([^\d=+*/^()<>,.$\\]*)$/u;

/** Bir LaTeX matematik parçasını expr.mjs ifadesine çevirir; desteklenmeyen yapıda hata fırlatır. */
export function latexToExpr(src) {
  let s = src.replace(/−/g, "-").replace(/\\[dt]frac/g, "\\frac").trim();
  // "x = 7" → "7"
  const eq = s.split("=");
  if (eq.length === 2 && /^\s*[a-zA-Z]\s*$/.test(eq[0])) s = eq[1].trim();
  else if (eq.length > 1) throw new Error("eşitlik");
  return convert(s);
}

function convert(str) {
  let out = "";
  let i = 0;
  const readGroup = () => {
    while (str[i] === " ") i++;
    if (str[i] === "{") {
      let depth = 1;
      let j = i + 1;
      for (; j < str.length && depth; j++) {
        if (str[j] === "\\") {
          j++;
          continue;
        }
        if (str[j] === "{") depth++;
        else if (str[j] === "}") depth--;
      }
      if (depth) throw new Error("süslü parantez");
      const inner = str.slice(i + 1, j - 1);
      i = j;
      return convert(inner);
    }
    if (/\d/.test(str[i] ?? "")) return str[i++];
    if (str[i] === "\\") {
      const m = /^\\([a-zA-Z]+)/.exec(str.slice(i));
      if (m && m[1] === "pi") {
        i += m[0].length;
        return "pi";
      }
    }
    throw new Error("grup");
  };

  while (i < str.length) {
    const ch = str[i];
    if (ch === " ") {
      i++;
      continue;
    }
    if (ch === "\\") {
      const m = /^\\([a-zA-Z]+|.)/.exec(str.slice(i));
      i += m[0].length;
      switch (m[1]) {
        case "frac": {
          const a = readGroup();
          const b = readGroup();
          const frac = `((${a})/(${b}))`;
          const whole = /(\d+(?:\.\d+)?)$/.exec(out);
          // Tam sayılı kesir: 2\frac{1}{3} = 2 + 1/3
          if (whole) out = `${out.slice(0, out.length - whole[1].length)}(${whole[1]}+${frac})`;
          else out += frac;
          break;
        }
        case "sqrt": {
          let n = null;
          if (str[i] === "[") {
            const j = str.indexOf("]", i);
            if (j < 0) throw new Error("kök derecesi");
            n = convert(str.slice(i + 1, j));
            i = j + 1;
          }
          const a = readGroup();
          out += n ? `root(${n},${a})` : `sqrt(${a})`;
          break;
        }
        case "cdot":
        case "times":
          out += "*";
          break;
        case "div":
          out += "/";
          break;
        case "pi":
          out += "pi";
          break;
        case "left":
        case "right":
        case ",":
        case ";":
        case "!":
        case " ":
        case "quad":
          break;
        default:
          throw new Error(`komut \\${m[1]}`);
      }
      continue;
    }
    if (ch === "{") {
      if (str.startsWith("{,}", i)) {
        out += ".";
        i += 3;
        continue;
      }
      out += `(${readGroup()})`;
      continue;
    }
    if (ch === "^") {
      i++;
      out += `^(${readGroup()})`;
      continue;
    }
    if (/\d/.test(ch)) {
      out += ch;
      i++;
      continue;
    }
    if (ch === "," && /\d$/.test(out) && /\d/.test(str[i + 1] ?? "")) {
      out += ".";
      i++;
      continue;
    }
    if (ch === "." && /\d$/.test(out) && /^\d{3}(?!\d)/.test(str.slice(i + 1))) {
      i++; // binlik ayırıcı
      continue;
    }
    if ("+-()".includes(ch)) {
      out += ch;
      i++;
      continue;
    }
    throw new Error(`karakter "${ch}"`);
  }
  if (!out) throw new Error("boş");
  return out;
}

/**
 * Şık metninin sayısal değerini döndürür; sayıya çevrilemiyorsa null.
 * @param {string} option temizlenmiş şık metni
 */
export function optionValue(option) {
  const text = option.trim();
  if (!text.includes("$")) {
    const m = PLAIN_NUMBER.exec(text);
    if (!m) return null;
    const intPart = m[3].replace(/\./g, "");
    const v = Number(`${intPart}${m[4] ? "." + m[4] : ""}`);
    return m[2] ? -v : v;
  }
  const segs = parseMathSegments(text);
  const maths = segs.filter((s) => s.type === "math");
  if (maths.length !== 1) return null;
  // Matematik dışındaki yazı yalnızca birim olabilir (rakam veya işlem içermez)
  for (const s of segs) {
    if (s.type === "text" && /[\d=+*/^()<>]/.test(s.value)) return null;
  }
  try {
    const v = evalExpr(latexToExpr(maths[0].value));
    return Number.isFinite(v) ? v : null;
  } catch {
    return null;
  }
}
