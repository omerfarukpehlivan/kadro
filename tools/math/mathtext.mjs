// Matematik metni yardımcıları — TASK-172 ortak sözleşmesinin (docs/parity_fixtures/math_text.json)
// Node referans uygulaması. Mobil (lib/core/utils/math_text.dart) ve Web (src/domain/math-text.ts)
// aynı davranışı birebir uygular.

/**
 * Metni yazı ve matematik parçalarına böler.
 * @returns {{type:'text'|'math', value:string, display?:boolean}[]}
 */
export function parseMathSegments(input) {
  const out = [];
  let buf = "";
  const pushText = (s) => {
    if (!s) return;
    const last = out[out.length - 1];
    if (last && last.type === "text") last.value += s;
    else out.push({ type: "text", value: s });
  };
  let i = 0;
  const n = input.length;
  while (i < n) {
    const ch = input[i];
    if (ch === "\\" && input[i + 1] === "$") {
      buf += "$";
      i += 2;
      continue;
    }
    if (ch === "$") {
      const display = input[i + 1] === "$";
      const open = display ? 2 : 1;
      const close = findClose(input, i + open, display);
      if (close > i + open) {
        const body = input.slice(i + open, close);
        if (body.trim().length > 0 && !body.includes("\n")) {
          pushText(buf);
          buf = "";
          out.push({ type: "math", value: body, display });
          i = close + open;
          continue;
        }
      }
      // Kapanmayan, boş veya satır sonu içeren matematik: yazı olarak bırak.
      buf += display ? "$$" : "$";
      i += open;
      continue;
    }
    buf += ch;
    i++;
  }
  pushText(buf);
  return out;
}

function findClose(s, from, display) {
  for (let j = from; j < s.length; j++) {
    if (s[j] === "\\") {
      j++;
      continue;
    }
    if (s[j] === "$") {
      if (!display) return j;
      if (s[j + 1] === "$") return j;
    }
  }
  return -1;
}

const LEGACY_ARROW_MATH =
  /\$\s*(→|←|\\rightarrow|\\Rightarrow|\\to|\\leftarrow|\\Leftarrow)\s*\$/g;

function cleanPlain(text) {
  return text
    .replace(/\\(rightarrow|Rightarrow|to)\b/g, " → ")
    .replace(/&rarr;|-->|->/g, " → ")
    .replace(/\\(leftarrow|Leftarrow)\b/g, " ← ")
    .replace(/&larr;|<--|<-/g, " ← ")
    .replace(/\*\*(.+?)\*\*/g, "$1")
    .replace(/__(.+?)__/g, "$1")
    .replace(/\*\*/g, "")
    .replace(/\*"(.+?)"\*/g, '"$1"')
    .replace(/\*([^*\n]+)\*/g, "$1")
    .replace(/\\"/g, '"')
    .replace(/"{2,}/g, '"')
    .replace(/'{2,}/g, "'");
}

/**
 * Soru metni temizleyicisi (mobil Question.cleanText ve web cleanQuestionText ile aynı).
 * Matematik parçaları olduğu gibi korunur ve `$...$` / `$$...$$` ayraçlarıyla geri yazılır.
 */
export function cleanQuestionText(raw) {
  if (!raw) return raw;
  let text = raw.replace(/\r/g, "");
  text = text.replace(LEGACY_ARROW_MATH, (_, a) =>
    a === "←" || /left/i.test(a) ? " ← " : " → "
  );
  // Kaçışlı doları ayrıştırmada kaybetmemek için geçici işarete çevir.
  const ESC = "\u0000";
  const segs = parseMathSegments(text.replace(/\\\$/g, ESC));
  // Kaçışlı "\n" yalnızca yazı parçalarında satır sonuna çevrilir; matematikte \neq, \notin
  // gibi komutlar bozulmasın.
  const joined = segs
    .map((s) =>
      s.type === "math"
        ? s.display
          ? `$$${s.value}$$`
          : `$${s.value}$`
        : cleanPlain(s.value.replace(/\\n/g, "\n"))
    )
    .join("");
  return joined
    .split("\n")
    .map((line) => line.replace(/[ \t]{2,}/g, " ").trim())
    .join("\n")
    .trim()
    .replace(/\u0000/g, "\\$");
}

/** Matematik parçalarındaki `\komut` adlarını döndürür (ör. "frac", "sqrt"). */
export function latexCommandsIn(math) {
  const cmds = [];
  const re = /\\([a-zA-Z]+|.)/g;
  let m;
  while ((m = re.exec(math))) cmds.push(m[1]);
  return cmds;
}

/** Süslü parantez dengesini (kaçışlılar hariç) denetler. */
export function bracesBalanced(math) {
  let depth = 0;
  for (let i = 0; i < math.length; i++) {
    const c = math[i];
    if (c === "\\") {
      i++;
      continue;
    }
    if (c === "{") depth++;
    else if (c === "}") {
      depth--;
      if (depth < 0) return false;
    }
  }
  return depth === 0;
}
