// Güvenli matematik ifadesi değerlendirici (eval kullanmaz) — TASK-172.
// Soru derleyicisi `dogrulama:` alanını bununla hesaplayıp doğru şıkkın değeriyle karşılaştırır;
// şekil çizici de fonksiyon grafiklerinde kullanır.
//
// Desteklenenler: sayılar (12, 3.5, 1e3), + - * / ^ (sağdan birleşir), % (mod), tekli -,
// parantez, sabitler (pi, e), değişkenler (vars ile verilir) ve fonksiyonlar:
// sqrt, cbrt, root(n, x), abs, floor, ceil, round, min, max, log (10 tabanı), ln, log2,
// sin, cos, tan (derece), fact, C(n, r), P(n, r), gcd, lcm.

const FUNCS = {
  sqrt: (x) => Math.sqrt(x),
  cbrt: (x) => Math.cbrt(x),
  root: (n, x) => (x < 0 && n % 2 === 1 ? -Math.pow(-x, 1 / n) : Math.pow(x, 1 / n)),
  abs: Math.abs,
  floor: Math.floor,
  ceil: Math.ceil,
  round: Math.round,
  min: Math.min,
  max: Math.max,
  log: Math.log10,
  ln: Math.log,
  log2: Math.log2,
  sin: (d) => Math.sin((d * Math.PI) / 180),
  cos: (d) => Math.cos((d * Math.PI) / 180),
  tan: (d) => Math.tan((d * Math.PI) / 180),
  fact: (n) => {
    if (!Number.isInteger(n) || n < 0 || n > 170) throw new Error(`fact(${n}) tanımsız`);
    let r = 1;
    for (let i = 2; i <= n; i++) r *= i;
    return r;
  },
  C: (n, r) => FUNCS.fact(n) / (FUNCS.fact(r) * FUNCS.fact(n - r)),
  P: (n, r) => FUNCS.fact(n) / FUNCS.fact(n - r),
  gcd: (a, b) => {
    a = Math.abs(a);
    b = Math.abs(b);
    while (b) [a, b] = [b, a % b];
    return a;
  },
  lcm: (a, b) => Math.abs(a * b) / FUNCS.gcd(a, b),
};
const CONSTS = { pi: Math.PI, e: Math.E };

function tokenize(src) {
  const tokens = [];
  const re = /\s*(?:(\d+(?:\.\d+)?(?:e[+-]?\d+)?)|([A-Za-z_][A-Za-z_0-9]*)|(\*\*|[-+*/^%(),]))/gy;
  let m;
  let last = 0;
  while (last < src.length) {
    re.lastIndex = last;
    m = re.exec(src);
    if (!m) {
      if (/^\s*$/.test(src.slice(last))) break;
      throw new Error(`Geçersiz karakter: "${src.slice(last, last + 8)}"`);
    }
    last = re.lastIndex;
    if (m[1] !== undefined) tokens.push({ t: "num", v: parseFloat(m[1]) });
    else if (m[2] !== undefined) tokens.push({ t: "id", v: m[2] });
    else tokens.push({ t: "op", v: m[3] === "**" ? "^" : m[3] });
  }
  return tokens;
}

/** İfadeyi ayrıştırıp bir değerlendirme fonksiyonu döndürür: (vars) => number */
export function compileExpr(src) {
  const tokens = tokenize(src);
  let pos = 0;
  const peek = () => tokens[pos];
  const eat = (v) => {
    const t = tokens[pos];
    if (!t || t.v !== v) throw new Error(`"${v}" bekleniyordu`);
    pos++;
  };

  // ifade := terim (('+'|'-') terim)*
  function parseExpr() {
    let node = parseTerm();
    while (peek() && (peek().v === "+" || peek().v === "-")) {
      const op = tokens[pos++].v;
      const rhs = parseTerm();
      const lhs = node;
      node = op === "+" ? (v) => lhs(v) + rhs(v) : (v) => lhs(v) - rhs(v);
    }
    return node;
  }
  // terim := üs (('*'|'/'|'%') üs | örtük çarpım)*
  function parseTerm() {
    let node = parseUnary();
    for (;;) {
      const t = peek();
      if (t && (t.v === "*" || t.v === "/" || t.v === "%")) {
        pos++;
        const rhs = parseUnary();
        const lhs = node;
        node =
          t.v === "*"
            ? (v) => lhs(v) * rhs(v)
            : t.v === "/"
              ? (v) => lhs(v) / rhs(v)
              : (v) => lhs(v) % rhs(v);
      } else if (t && (t.t === "num" || t.t === "id" || t.v === "(")) {
        // Örtük çarpım: 2x, 3(x+1), 2pi
        const rhs = parseUnary();
        const lhs = node;
        node = (v) => lhs(v) * rhs(v);
      } else break;
    }
    return node;
  }
  function parseUnary() {
    const t = peek();
    if (t && t.v === "-") {
      pos++;
      const inner = parseUnary();
      return (v) => -inner(v);
    }
    if (t && t.v === "+") {
      pos++;
      return parseUnary();
    }
    return parsePow();
  }
  function parsePow() {
    const base = parseAtom();
    const t = peek();
    if (t && t.v === "^") {
      pos++;
      const exp = parseUnary(); // sağdan birleşir: 2^3^2 = 2^9
      return (v) => Math.pow(base(v), exp(v));
    }
    return base;
  }
  function parseAtom() {
    const t = tokens[pos++];
    if (!t) throw new Error("İfade erken bitti");
    if (t.t === "num") return () => t.v;
    if (t.v === "(") {
      const inner = parseExpr();
      eat(")");
      return inner;
    }
    if (t.t === "id") {
      if (peek() && peek().v === "(") {
        const fn = FUNCS[t.v];
        if (!fn) throw new Error(`Bilinmeyen fonksiyon: ${t.v}`);
        pos++;
        const args = [];
        if (peek() && peek().v !== ")") {
          args.push(parseExpr());
          while (peek() && peek().v === ",") {
            pos++;
            args.push(parseExpr());
          }
        }
        eat(")");
        return (v) => fn(...args.map((a) => a(v)));
      }
      if (t.v in CONSTS) return () => CONSTS[t.v];
      return (v) => {
        if (!v || !(t.v in v)) throw new Error(`Tanımsız değişken: ${t.v}`);
        return v[t.v];
      };
    }
    throw new Error(`Beklenmeyen simge: ${t.v}`);
  }

  const root = parseExpr();
  if (pos !== tokens.length) throw new Error(`Fazla simge: "${tokens[pos].v}"`);
  return root;
}

export function evalExpr(src, vars = {}) {
  return compileExpr(src)(vars);
}

/** İki sayının sayısal olarak eşit olup olmadığını (bağıl tolerans) denetler. */
export function nearlyEqual(a, b, tol = 1e-9) {
  if (!Number.isFinite(a) || !Number.isFinite(b)) return false;
  return Math.abs(a - b) <= tol * Math.max(1, Math.abs(a), Math.abs(b));
}
