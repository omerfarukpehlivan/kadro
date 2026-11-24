// Matematik şekil çizici — TASK-172.
// Bir şekil tarifini (JSON) tema uyumlu, güvenli bir SVG'ye çevirir. Çizgiler ve yazılar
// `currentColor` kullanır: mobilde SvgTheme(currentColor), web'de CSS `color` ile temaya uyar.
// Tarif biçimi: docs/soru_havuzu/matematik/FORMAT.md §4.

import { readFileSync } from "node:fs";

import { compileExpr } from "./expr.mjs";

const FONT = "DM Sans, Arial, sans-serif";
const FS = 14; // yazı boyutu (px)
const SW = 1.8; // çizgi kalınlığı
const PAD = 30;

// ---------------------------------------------------------------------------
// Güvenlik: yalnızca bu etiket ve öznitelikler üretilebilir. Kural tek kaynaktan okunur
// (docs/parity_fixtures/math_text.json → figureSvg); mobil, web ve DB CHECK aynı kuralı uygular.
const FIGURE_RULES = JSON.parse(
  readFileSync(new URL("../../docs/parity_fixtures/math_text.json", import.meta.url), "utf8")
).figureSvg;
export const SAFE_SVG_TAGS = FIGURE_RULES.allowedTags;
export const SAFE_SVG_ATTRS = FIGURE_RULES.allowedAttributes;
export const MAX_SVG_LENGTH = FIGURE_RULES.maxLength;

/** SVG'nin yalnızca izinli etiket ve öznitelikler içerdiğini doğrular. */
export function isSafeFigureSvg(svg) {
  if (typeof svg !== "string" || svg.length === 0 || svg.length > MAX_SVG_LENGTH) return false;
  if (!svg.startsWith("<svg ")) return false;
  const lower = svg.toLowerCase();
  if (FIGURE_RULES.forbiddenPatterns.some((p) => lower.includes(p))) return false;
  const tagRe = /<\/?([a-zA-Z][a-zA-Z0-9-]*)([^>]*)>/g;
  let m;
  let rest = svg;
  while ((m = tagRe.exec(svg))) {
    if (!SAFE_SVG_TAGS.includes(m[1])) return false;
    const attrRe = /([a-zA-Z_:][-a-zA-Z0-9_:.]*)\s*=\s*"[^"]*"/g;
    let a;
    const attrs = m[2];
    while ((a = attrRe.exec(attrs))) {
      if (!SAFE_SVG_ATTRS.includes(a[1])) return false;
    }
    // Öznitelik dışında kalan anlamlı içerik olmamalı (tırnaksız öznitelik vb.)
    const leftover = attrs.replace(attrRe, "").replace(/\s|\//g, "");
    if (leftover.length > 0) return false;
  }
  rest = svg.replace(tagRe, "");
  return !/[<>]/.test(rest);
}

// ---------------------------------------------------------------------------
const esc = (s) =>
  String(s).replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;");
const f = (n) => (Math.round(n * 10) / 10).toString();
const textW = (s, size = FS) => [...String(s)].length * size * 0.58;

// Yazıların kapladığı alan izlenir; tuval, kenara taşan etiketleri kesmeyecek kadar genişletilir.
let textBox = null;
function trackText(x, y, s, anchor, size) {
  if (!textBox) return;
  const w = textW(s, size);
  const x0 = anchor === "start" ? x : anchor === "end" ? x - w : x - w / 2;
  textBox.minX = Math.min(textBox.minX, x0);
  textBox.maxX = Math.max(textBox.maxX, x0 + w);
  textBox.minY = Math.min(textBox.minY, y - size * 0.6);
  textBox.maxY = Math.max(textBox.maxY, y + size * 0.6);
}

function text(x, y, s, { anchor = "middle", size = FS, weight, italic } = {}) {
  trackText(x, y, s, anchor, size);
  const attrs = [
    `x="${f(x)}"`,
    `y="${f(y + size * 0.35)}"`,
    `fill="currentColor"`,
    `stroke="none"`,
    `text-anchor="${anchor}"`,
  ];
  if (size !== FS) attrs.push(`font-size="${size}"`);
  if (weight) attrs.push(`font-weight="${weight}"`);
  if (italic) attrs.push(`font-style="italic"`);
  return `<text ${attrs.join(" ")}>${esc(s)}</text>`;
}
const line = (x1, y1, x2, y2, extra = "") =>
  `<line x1="${f(x1)}" y1="${f(y1)}" x2="${f(x2)}" y2="${f(y2)}"${extra}/>`;

function wrapSvg(w, h, body) {
  // Taşan yazılar için tuvali genişlet; içeriği translate ile kaydır (negatif viewBox kullanılmaz).
  const tb = textBox ?? { minX: 0, minY: 0, maxX: w, maxY: h };
  const dx = Math.max(0, Math.ceil(4 - tb.minX));
  const dy = Math.max(0, Math.ceil(4 - tb.minY));
  const W = Math.max(w, tb.maxX + 4) + dx;
  const H = Math.max(h, tb.maxY + 4) + dy;
  const inner = dx || dy ? `<g transform="translate(${dx} ${dy})">${body}</g>` : body;
  return (
    `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 ${f(W)} ${f(H)}" width="${f(W)}" height="${f(H)}" ` +
    `fill="none" stroke="currentColor" stroke-width="${SW}" stroke-linecap="round" stroke-linejoin="round" ` +
    `font-family="${FONT}" font-size="${FS}">${inner}</svg>`
  );
}

// ---------------------------------------------------------------------------
// Geometri / koordinat düzlemi
function renderGeometry(spec) {
  const pts = { ...(spec.points || {}) };
  for (const [k, v] of Object.entries(pts)) {
    if (!Array.isArray(v) || v.length !== 2 || !v.every(Number.isFinite))
      throw new Error(`Nokta "${k}" [x, y] biçiminde olmalı`);
  }
  const P = (ref) => {
    if (Array.isArray(ref)) return ref;
    if (!(ref in pts)) throw new Error(`Tanımsız nokta: ${ref}`);
    return pts[ref];
  };
  const shapes = spec.shapes || [];
  const fns = (spec.functions || []).map((fn) => ({ ...fn, f: compileExpr(fn.expr) }));

  // Sınırlar
  let xs = [];
  let ys = [];
  Object.values(pts).forEach(([x, y]) => (xs.push(x), ys.push(y)));
  for (const s of shapes) {
    if (s.type === "circle") {
      const c = P(s.center);
      const r = s.radius ?? Math.hypot(P(s.through)[0] - c[0], P(s.through)[1] - c[1]);
      xs.push(c[0] - r, c[0] + r);
      ys.push(c[1] - r, c[1] + r);
    }
  }
  if (spec.axes) {
    xs.push(...spec.axes.x);
    ys.push(...spec.axes.y);
  }
  for (const fn of fns) {
    const [a, b] = fn.domain;
    for (let i = 0; i <= 200; i++) {
      const x = a + ((b - a) * i) / 200;
      const y = fn.f({ x });
      if (Number.isFinite(y) && (!spec.axes || (y >= spec.axes.y[0] && y <= spec.axes.y[1]))) {
        xs.push(x);
        ys.push(y);
      }
    }
  }
  if (xs.length === 0) throw new Error("Geometri şeklinde nokta yok");
  const minX = Math.min(...xs), maxX = Math.max(...xs);
  const minY = Math.min(...ys), maxY = Math.max(...ys);
  const spanX = Math.max(maxX - minX, 1e-6), spanY = Math.max(maxY - minY, 1e-6);
  const maxW = spec.width ?? 340, maxH = spec.height ?? 260;
  const scale = Math.min((maxW - 2 * PAD) / spanX, (maxH - 2 * PAD) / spanY);
  const W = spanX * scale + 2 * PAD;
  const H = spanY * scale + 2 * PAD;
  const X = (x) => PAD + (x - minX) * scale;
  const Y = (y) => PAD + (maxY - y) * scale;
  const S = (p) => [X(p[0]), Y(p[1])];

  // Nokta etiketleri için merkez (etiketler merkezden dışarı yazılır)
  const cx = Object.values(pts).reduce((a, p) => a + p[0], 0) / Math.max(1, Object.keys(pts).length);
  const cy = Object.values(pts).reduce((a, p) => a + p[1], 0) / Math.max(1, Object.keys(pts).length);

  const out = [];

  // Eksenler ve ızgara
  if (spec.axes) {
    const ax = spec.axes;
    const step = ax.step ?? 1;
    if (ax.grid) {
      const g = [];
      for (let x = Math.ceil(ax.x[0] / step) * step; x <= ax.x[1] + 1e-9; x += step)
        g.push(line(X(x), Y(ax.y[0]), X(x), Y(ax.y[1])));
      for (let y = Math.ceil(ax.y[0] / step) * step; y <= ax.y[1] + 1e-9; y += step)
        g.push(line(X(ax.x[0]), Y(y), X(ax.x[1]), Y(y)));
      out.push(`<g stroke-width="0.6" stroke-opacity="0.25">${g.join("")}</g>`);
    }
    const y0 = Math.min(Math.max(0, ax.y[0]), ax.y[1]);
    const x0 = Math.min(Math.max(0, ax.x[0]), ax.x[1]);
    out.push(line(X(ax.x[0]) - 6, Y(y0), X(ax.x[1]) + 10, Y(y0)));
    out.push(line(X(x0), Y(ax.y[0]) + 6, X(x0), Y(ax.y[1]) - 10));
    // ok uçları
    out.push(`<path d="M${f(X(ax.x[1]) + 10)} ${f(Y(y0))} l-7 -4 m7 4 l-7 4"/>`);
    out.push(`<path d="M${f(X(x0))} ${f(Y(ax.y[1]) - 10)} l-4 7 m4 -7 l4 7"/>`);
    out.push(text(X(ax.x[1]) + 14, Y(y0) + 12, ax.xLabel ?? "x", { anchor: "end", italic: true }));
    out.push(text(X(x0) + 12, Y(ax.y[1]) - 12, ax.yLabel ?? "y", { anchor: "start", italic: true }));
    if (ax.labels !== false) {
      const t = [];
      for (let x = Math.ceil(ax.x[0] / step) * step; x <= ax.x[1] + 1e-9; x += step) {
        if (Math.abs(x) < 1e-9) continue;
        t.push(line(X(x), Y(y0) - 3, X(x), Y(y0) + 3));
        t.push(text(X(x), Y(y0) + 14, fmtNum(x), { size: 11 }));
      }
      for (let y = Math.ceil(ax.y[0] / step) * step; y <= ax.y[1] + 1e-9; y += step) {
        if (Math.abs(y) < 1e-9) continue;
        t.push(line(X(x0) - 3, Y(y), X(x0) + 3, Y(y)));
        t.push(text(X(x0) - 6, Y(y), fmtNum(y), { size: 11, anchor: "end" }));
      }
      if (ax.x[0] < 0 && ax.y[0] < 0) t.push(text(X(x0) - 8, Y(y0) + 12, "O", { size: 11, anchor: "end" }));
      out.push(`<g stroke-width="1.2">${t.join("")}</g>`);
    }
  }

  // Fonksiyon grafikleri
  for (const fn of fns) {
    const [a, b] = fn.domain;
    let d = "";
    let pen = false;
    for (let i = 0; i <= 240; i++) {
      const x = a + ((b - a) * i) / 240;
      const y = fn.f({ x });
      const inside = Number.isFinite(y) && (!spec.axes || (y >= spec.axes.y[0] - 1e-9 && y <= spec.axes.y[1] + 1e-9));
      if (!inside) {
        pen = false;
        continue;
      }
      d += `${pen ? "L" : "M"}${f(X(x))} ${f(Y(y))}`;
      pen = true;
    }
    out.push(`<path d="${d}" stroke-width="2.2"${fn.dashed ? ' stroke-dasharray="6 5"' : ""}/>`);
    if (fn.label) {
      // Etiket, grafiğin görünen son noktasına yazılır (eksen sınırı dışına taşmaz).
      let lx = fn.labelAt ?? b;
      const visible = (x) => {
        const y = fn.f({ x });
        return Number.isFinite(y) && (!spec.axes || (y >= spec.axes.y[0] && y <= spec.axes.y[1]));
      };
      for (let k = 0; k <= 240 && !visible(lx); k++) lx = (fn.labelAt ?? b) - ((b - a) * k) / 240;
      if (visible(lx)) out.push(text(X(lx) + 6, Y(fn.f({ x: lx })) - 10, fn.label, { anchor: "start", italic: true }));
    }
  }

  // Şekiller
  for (const s of shapes) {
    const dash = s.dashed ? ' stroke-dasharray="6 5"' : "";
    switch (s.type) {
      case "polygon": {
        const ps = s.points.map((r) => S(P(r)));
        const fill = s.fill ? ` fill="currentColor" fill-opacity="${s.fillOpacity ?? 0.12}"` : "";
        out.push(`<polygon points="${ps.map(([x, y]) => `${f(x)},${f(y)}`).join(" ")}"${fill}${dash}/>`);
        break;
      }
      case "segment": {
        const [x1, y1] = S(P(s.from));
        const [x2, y2] = S(P(s.to));
        out.push(line(x1, y1, x2, y2, dash));
        if (s.ticks) out.push(ticks(x1, y1, x2, y2, s.ticks));
        if (s.label) out.push(segLabel(x1, y1, x2, y2, s.label, S([cx, cy]), s.labelSide));
        break;
      }
      case "circle": {
        const c = P(s.center);
        const r = s.radius ?? Math.hypot(P(s.through)[0] - c[0], P(s.through)[1] - c[1]);
        const fill = s.fill ? ` fill="currentColor" fill-opacity="${s.fillOpacity ?? 0.12}"` : "";
        out.push(`<circle cx="${f(X(c[0]))}" cy="${f(Y(c[1]))}" r="${f(r * scale)}"${fill}${dash}/>`);
        break;
      }
      case "sector": {
        // Merkez, başlangıç ve bitiş noktası; saat yönünün tersine çizilir.
        const c = P(s.center);
        const a = P(s.from), b = P(s.to);
        const r = Math.hypot(a[0] - c[0], a[1] - c[1]);
        const t1 = Math.atan2(a[1] - c[1], a[0] - c[0]);
        let t2 = Math.atan2(b[1] - c[1], b[0] - c[0]);
        if (t2 <= t1) t2 += 2 * Math.PI;
        const large = t2 - t1 > Math.PI ? 1 : 0;
        const [sx, sy] = S([c[0] + r * Math.cos(t1), c[1] + r * Math.sin(t1)]);
        const [ex, ey] = S([c[0] + r * Math.cos(t2), c[1] + r * Math.sin(t2)]);
        const [ccx, ccy] = S(c);
        const R = r * scale;
        out.push(
          `<path d="M${f(ccx)} ${f(ccy)} L${f(sx)} ${f(sy)} A${f(R)} ${f(R)} 0 ${large} 0 ${f(ex)} ${f(ey)} Z" fill="currentColor" fill-opacity="${s.fillOpacity ?? 0.15}"/>`
        );
        break;
      }
      case "angle": {
        out.push(angleMark(S(P(s.vertex)), S(P(s.from)), S(P(s.to)), s));
        break;
      }
      case "label": {
        const [x, y] = S(P(s.at));
        out.push(text(x + (s.dx ?? 0), y + (s.dy ?? 0), s.text, { size: s.size ?? FS }));
        break;
      }
      default:
        throw new Error(`Bilinmeyen geometri öğesi: ${s.type}`);
    }
  }

  // Nokta işaretleri ve adları
  const hidden = new Set(spec.hideLabels || []);
  const dots = new Set(spec.dots || []);
  for (const [name, p] of Object.entries(pts)) {
    const [x, y] = S(p);
    if (dots.has(name)) out.push(`<circle cx="${f(x)}" cy="${f(y)}" r="3" fill="currentColor" stroke="none"/>`);
    if (spec.pointLabels === false || hidden.has(name)) continue;
    let dx = p[0] - cx, dy = p[1] - cy;
    const len = Math.hypot(dx, dy) || 1;
    dx /= len;
    dy /= len;
    if (len < 1e-6) dy = 1;
    const pos = spec.labelPos?.[name];
    if (pos) {
      if (!LABEL_DIRS[pos]) throw new Error(`labelPos.${name} geçersiz (kullanılabilir: ${Object.keys(LABEL_DIRS).join(", ")})`);
      [dx, dy] = LABEL_DIRS[pos];
    }
    out.push(text(x + dx * 14, y - dy * 14, name, { weight: 600 }));
  }

  return wrapSvg(W, H, out.join(""));
}

/** Nokta adının noktaya göre yönü (matematik ekseni: y yukarı). */
const LABEL_DIRS = {
  top: [0, 1],
  bottom: [0, -1],
  left: [-1, 0],
  right: [1, 0],
  tl: [-0.75, 0.75],
  tr: [0.75, 0.75],
  bl: [-0.75, -0.75],
  br: [0.75, -0.75],
};

function fmtNum(n) {
  return Number.isInteger(n) ? String(n) : String(Math.round(n * 100) / 100).replace(".", ",");
}

function ticks(x1, y1, x2, y2, count) {
  const mx = (x1 + x2) / 2, my = (y1 + y2) / 2;
  const len = Math.hypot(x2 - x1, y2 - y1) || 1;
  const ux = (x2 - x1) / len, uy = (y2 - y1) / len;
  const nx = -uy, ny = ux;
  const parts = [];
  for (let i = 0; i < count; i++) {
    const o = (i - (count - 1) / 2) * 5;
    const px = mx + ux * o, py = my + uy * o;
    parts.push(line(px - nx * 6, py - ny * 6, px + nx * 6, py + ny * 6));
  }
  return parts.join("");
}

function segLabel(x1, y1, x2, y2, label, [cx, cy], side) {
  const mx = (x1 + x2) / 2, my = (y1 + y2) / 2;
  const len = Math.hypot(x2 - x1, y2 - y1) || 1;
  let nx = -(y2 - y1) / len, ny = (x2 - x1) / len;
  // Etiketi şeklin dışına doğru yaz (merkezden uzaklaşan normal)
  if ((mx - cx) * nx + (my - cy) * ny < 0) (nx = -nx), (ny = -ny);
  if (side === "in") (nx = -nx), (ny = -ny);
  const off = 12 + textW(label, 13) * 0.25 * Math.abs(nx);
  return text(mx + nx * off, my + ny * off, label, { size: 13 });
}

function angleMark([vx, vy], [ax, ay], [bx, by], s) {
  const a1 = Math.atan2(ay - vy, ax - vx);
  const a2 = Math.atan2(by - vy, bx - vx);
  let diff = a2 - a1;
  while (diff <= -Math.PI) diff += 2 * Math.PI;
  while (diff > Math.PI) diff -= 2 * Math.PI;
  const r = s.radius ?? 20;
  const parts = [];
  if (s.right) {
    const k = 11;
    const u = [Math.cos(a1), Math.sin(a1)], w = [Math.cos(a1 + diff), Math.sin(a1 + diff)];
    const p1 = [vx + u[0] * k, vy + u[1] * k];
    const p2 = [vx + (u[0] + w[0]) * k, vy + (u[1] + w[1]) * k];
    const p3 = [vx + w[0] * k, vy + w[1] * k];
    parts.push(`<polyline points="${f(p1[0])},${f(p1[1])} ${f(p2[0])},${f(p2[1])} ${f(p3[0])},${f(p3[1])}" stroke-width="1.4"/>`);
  } else {
    const sx = vx + r * Math.cos(a1), sy = vy + r * Math.sin(a1);
    const ex = vx + r * Math.cos(a1 + diff), ey = vy + r * Math.sin(a1 + diff);
    const sweep = diff > 0 ? 1 : 0;
    const fill = s.fill ? ` fill="currentColor" fill-opacity="0.15"` : "";
    parts.push(`<path d="M${f(vx)} ${f(vy)} L${f(sx)} ${f(sy)} A${f(r)} ${f(r)} 0 0 ${sweep} ${f(ex)} ${f(ey)} Z" stroke="none"${fill}/>`);
    parts.push(`<path d="M${f(sx)} ${f(sy)} A${f(r)} ${f(r)} 0 0 ${sweep} ${f(ex)} ${f(ey)}" stroke-width="1.4"/>`);
    if (s.double) {
      const r2 = r + 4;
      const sx2 = vx + r2 * Math.cos(a1), sy2 = vy + r2 * Math.sin(a1);
      const ex2 = vx + r2 * Math.cos(a1 + diff), ey2 = vy + r2 * Math.sin(a1 + diff);
      parts.push(`<path d="M${f(sx2)} ${f(sy2)} A${f(r2)} ${f(r2)} 0 0 ${sweep} ${f(ex2)} ${f(ey2)}" stroke-width="1.4"/>`);
    }
  }
  if (s.label) {
    const mid = a1 + diff / 2;
    const lr = (s.right ? 16 : r) + (s.double ? 8 : 4) + 4 + textW(s.label, 12) * 0.35;
    parts.push(text(vx + lr * Math.cos(mid), vy + lr * Math.sin(mid), s.label, { size: 12 }));
  }
  return parts.join("");
}

// ---------------------------------------------------------------------------
// Grafik ve tablo türleri
function niceStep(max) {
  const raw = max / 5;
  const p = Math.pow(10, Math.floor(Math.log10(raw)));
  for (const m of [1, 2, 2.5, 5, 10]) if (raw <= m * p) return m * p;
  return 10 * p;
}

function chartFrame(spec, maxValue) {
  const yStep = spec.yStep ?? niceStep(maxValue);
  const yMax = spec.yMax ?? Math.ceil(maxValue / yStep) * yStep;
  const n = spec.categories.length;
  const left = 46, right = 16, top = spec.title ? 50 : spec.yLabel ? 32 : 18, bottom = 40;
  const plotW = Math.max(220, n * (spec.kind === "bar" ? 52 : 48));
  const plotH = 170;
  const W = left + plotW + right, H = top + plotH + bottom;
  const Y = (v) => top + plotH - (v / yMax) * plotH;
  const out = [];
  if (spec.title) out.push(text(W / 2, 14, spec.title, { weight: 600 }));
  const grid = [];
  for (let v = 0; v <= yMax + 1e-9; v += yStep) {
    grid.push(line(left, Y(v), left + plotW, Y(v)));
    out.push(text(left - 6, Y(v), fmtNum(v), { size: 11, anchor: "end" }));
  }
  out.push(`<g stroke-width="0.6" stroke-opacity="0.3">${grid.join("")}</g>`);
  out.push(line(left, top - 4, left, top + plotH));
  out.push(line(left, top + plotH, left + plotW, top + plotH));
  if (spec.yLabel) out.push(text(left - 6, top - 16, spec.yLabel, { size: 11, anchor: "start" }));
  if (spec.xLabel) out.push(text(left + plotW, H - 6, spec.xLabel, { size: 11, anchor: "end" }));
  return { W, H, left, top, plotW, plotH, Y, out, n };
}

function renderBar(spec) {
  if (spec.values.length !== spec.categories.length) throw new Error("Çubuk grafikte categories ve values aynı uzunlukta olmalı");
  const fr = chartFrame(spec, Math.max(...spec.values));
  const slot = fr.plotW / fr.n;
  const bw = Math.min(34, slot * 0.6);
  spec.categories.forEach((c, i) => {
    const v = spec.values[i];
    const x = fr.left + slot * i + (slot - bw) / 2;
    const y = fr.Y(v);
    fr.out.push(`<rect x="${f(x)}" y="${f(y)}" width="${f(bw)}" height="${f(fr.top + fr.plotH - y)}" fill="currentColor" fill-opacity="0.22"/>`);
    if (spec.valueLabels !== false) fr.out.push(text(x + bw / 2, y - 9, fmtNum(v), { size: 11 }));
    fr.out.push(text(x + bw / 2, fr.top + fr.plotH + 14, c, { size: 12 }));
  });
  return wrapSvg(fr.W, fr.H, fr.out.join(""));
}

const DASHES = ["", ' stroke-dasharray="7 5"', ' stroke-dasharray="2 4"', ' stroke-dasharray="10 4 2 4"'];
function renderLine(spec) {
  const all = spec.series.flatMap((s) => s.values);
  const fr = chartFrame(spec, Math.max(...all));
  const slot = fr.plotW / fr.n;
  const X = (i) => fr.left + slot * i + slot / 2;
  spec.categories.forEach((c, i) => fr.out.push(text(X(i), fr.top + fr.plotH + 14, c, { size: 12 })));
  spec.series.forEach((s, si) => {
    if (s.values.length !== fr.n) throw new Error(`Seri "${s.name}" değer sayısı kategorilerle uyuşmuyor`);
    const pts = s.values.map((v, i) => `${f(X(i))},${f(fr.Y(v))}`).join(" ");
    fr.out.push(`<polyline points="${pts}" stroke-width="2.2"${DASHES[si % DASHES.length]}/>`);
    s.values.forEach((v, i) => fr.out.push(`<circle cx="${f(X(i))}" cy="${f(fr.Y(v))}" r="3" fill="currentColor" stroke="none"/>`));
  });
  if (spec.series.length > 1) {
    let lx = fr.left;
    const ly = fr.H - 10;
    spec.series.forEach((s, si) => {
      fr.out.push(line(lx, ly, lx + 22, ly, DASHES[si % DASHES.length]));
      fr.out.push(text(lx + 26, ly, s.name, { size: 11, anchor: "start" }));
      lx += 34 + textW(s.name, 11);
    });
  }
  return wrapSvg(fr.W, fr.H + (spec.series.length > 1 ? 8 : 0), fr.out.join(""));
}

function renderPie(spec) {
  const total = spec.slices.reduce((a, s) => a + s.value, 0);
  if (!(total > 0)) throw new Error("Pasta grafikte toplam değer pozitif olmalı");
  const R = 85, cx = R + 10, cy = (spec.title ? 34 : 14) + R;
  const W = 2 * R + 20, H = cy + R + 14;
  const out = [];
  if (spec.title) out.push(text(cx, 14, spec.title, { weight: 600 }));
  let a = -Math.PI / 2;
  spec.slices.forEach((s, i) => {
    const sweep = (s.value / total) * 2 * Math.PI;
    const a2 = a + sweep;
    const x1 = cx + R * Math.cos(a), y1 = cy + R * Math.sin(a);
    const x2 = cx + R * Math.cos(a2), y2 = cy + R * Math.sin(a2);
    const op = [0.08, 0.3, 0.16, 0.42, 0.24, 0.5, 0.12, 0.36][i % 8];
    out.push(
      `<path d="M${f(cx)} ${f(cy)} L${f(x1)} ${f(y1)} A${R} ${R} 0 ${sweep > Math.PI ? 1 : 0} 1 ${f(x2)} ${f(y2)} Z" fill="currentColor" fill-opacity="${op}"/>`
    );
    // Etiketler dilimin dışına, kısa bir kılavuz çizgiyle yazılır (dar dilimlerde taşmaz).
    const mid = a + sweep / 2;
    const cos = Math.cos(mid), sin = Math.sin(mid);
    const pct = (s.value / total) * 100;
    const sub =
      spec.show === "degree" ? `${fmtNum(Math.round((s.value / total) * 3600) / 10)}°` : spec.show === "value" ? fmtNum(s.value) : spec.show === "none" ? "" : `%${fmtNum(Math.round(pct * 10) / 10)}`;
    out.push(line(cx + (R - 6) * cos, cy + (R - 6) * sin, cx + (R + 8) * cos, cy + (R + 8) * sin, ' stroke-width="1"'));
    const anchor = cos > 0.25 ? "start" : cos < -0.25 ? "end" : "middle";
    const lx = cx + (R + 12) * cos, ly = cy + (R + 12) * sin + (anchor === "middle" ? Math.sign(sin) * 6 : 0);
    out.push(text(lx, ly, sub ? `${s.label} (${sub})` : s.label, { size: 12, anchor }));
    a = a2;
  });
  return wrapSvg(W, H, out.join(""));
}

function renderTable(spec) {
  const cols = spec.headers.length;
  spec.rows.forEach((r, i) => {
    if (r.length !== cols) throw new Error(`Tablo satırı ${i + 1} sütun sayısı başlıkla uyuşmuyor`);
  });
  const all = [spec.headers, ...spec.rows];
  const colW = Array.from({ length: cols }, (_, c) => Math.max(...all.map((r) => textW(r[c], 13))) + 24);
  const rowH = 30;
  const W = colW.reduce((a, b) => a + b, 0) + 2, H = rowH * all.length + 2;
  const out = [`<rect x="1" y="1" width="${f(W - 2)}" height="${f(rowH)}" fill="currentColor" fill-opacity="0.1" stroke="none"/>`];
  out.push(`<rect x="1" y="1" width="${f(W - 2)}" height="${f(H - 2)}" stroke-width="1.4"/>`);
  for (let r = 1; r < all.length; r++) out.push(line(1, 1 + r * rowH, W - 1, 1 + r * rowH, ' stroke-width="1"'));
  let x = 1;
  colW.forEach((w, c) => {
    if (c > 0) out.push(line(x, 1, x, H - 1, ' stroke-width="1"'));
    all.forEach((row, r) => out.push(text(x + w / 2, 1 + r * rowH + rowH / 2, row[c], { size: 13, weight: r === 0 ? 600 : undefined })));
    x += w;
  });
  return wrapSvg(W, H, out.join(""));
}

function renderVenn(spec) {
  const n = spec.sets.length;
  if (n !== 2 && n !== 3) throw new Error("Venn şeması 2 veya 3 küme içermeli");
  const r = 70;
  const centers =
    n === 2
      ? [[115, 105], [205, 105]]
      : [[120, 100], [200, 100], [160, 165]];
  const W = 320, H = n === 2 ? 210 : 270;
  const out = [`<rect x="4" y="4" width="${W - 8}" height="${H - 8}" rx="6" stroke-width="1.4"/>`];
  if (spec.universe) out.push(text(18, 20, spec.universe, { anchor: "start", weight: 600 }));
  centers.forEach(([x, y], i) => {
    out.push(`<circle cx="${x}" cy="${y}" r="${r}" fill="currentColor" fill-opacity="0.06"/>`);
    const lx = n === 2 ? (i === 0 ? x - 52 : x + 52) : i === 2 ? x : i === 0 ? x - 58 : x + 58;
    const ly = n === 2 ? y - 74 : i === 2 ? y + 80 : y - 62;
    out.push(text(lx, ly, spec.sets[i], { weight: 600 }));
  });
  const reg = spec.regions || {};
  const pos2 = { A: [80, 105], B: [240, 105], AB: [160, 105], out: [W - 26, H - 20] };
  const pos3 = { A: [92, 82], B: [228, 82], C: [160, 200], AB: [160, 72], AC: [118, 142], BC: [202, 142], ABC: [160, 118], out: [W - 26, H - 20] };
  const pos = n === 2 ? pos2 : pos3;
  for (const [k, v] of Object.entries(reg)) {
    if (!(k in pos)) throw new Error(`Venn bölgesi tanımsız: ${k} (kullanılabilir: ${Object.keys(pos).join(", ")})`);
    out.push(text(pos[k][0], pos[k][1], v, { size: 13 }));
  }
  return wrapSvg(W, H, out.join(""));
}

function renderNumberLine(spec) {
  const { min, max } = spec;
  if (!(max > min)) throw new Error("Sayı doğrusunda max, min'den büyük olmalı");
  const step = spec.step ?? 1;
  const W = Math.max(300, ((max - min) / step) * 34 + 60), H = 64;
  const X = (v) => 30 + ((v - min) / (max - min)) * (W - 60);
  const yL = 30, L = 12, R = W - 8;
  // Boş (hariç) uçların içinden çizgi geçmesin diye çizgiler o noktalarda kesilir.
  const holes = [];
  for (const it of spec.intervals || []) {
    if (it.from !== undefined && it.fromOpen) holes.push(X(it.from));
    if (it.to !== undefined && it.toOpen) holes.push(X(it.to));
  }
  for (const p of spec.points || []) if (p.open) holes.push(X(p.at));
  const seg = (x1, x2, extra = "") => {
    const parts = [];
    let start = x1;
    for (const h of [...holes].sort((a, b) => a - b)) {
      if (h - 5.5 > start && h - 5.5 < x2) parts.push(line(start, yL, h - 5.5, yL, extra));
      if (h + 5.5 > start && h - 5.5 < x2) start = Math.max(start, h + 5.5);
    }
    if (start < x2) parts.push(line(start, yL, x2, yL, extra));
    return parts.join("");
  };
  const out = [seg(L, R), `<path d="M${f(R)} ${yL} l-8 -4 m8 4 l-8 4"/>`, `<path d="M${L} ${yL} l8 -4 m-8 4 l8 4"/>`];
  const dots = [];
  for (const it of spec.intervals || []) {
    // from/to yazılmazsa aralık o yönde sonsuza uzanır (−∞ / +∞)
    const a = it.from === undefined ? L + 2 : X(it.from);
    const b = it.to === undefined ? R - 2 : X(it.to);
    out.push(seg(a, b, ' stroke-width="5" stroke-opacity="0.55"'));
    if (it.from !== undefined) dots.push([X(it.from), it.fromOpen]);
    if (it.to !== undefined) dots.push([X(it.to), it.toOpen]);
  }
  if (spec.ticks !== false) {
    for (let v = min; v <= max + 1e-9; v += step) {
      const x = X(v);
      if (!holes.some((h) => Math.abs(h - x) < 1)) out.push(line(x, yL - 5, x, yL + 5, ' stroke-width="1.2"'));
      if (spec.tickLabels !== false) out.push(text(x, yL + 18, fmtNum(v), { size: 11 }));
    }
  }
  for (const p of spec.points || []) {
    dots.push([X(p.at), p.open]);
    if (p.label) out.push(text(X(p.at), yL - 18, p.label, { size: 13, italic: true }));
  }
  for (const [x, open] of dots)
    out.push(open ? `<circle cx="${f(x)}" cy="${yL}" r="5" stroke-width="1.8"/>` : `<circle cx="${f(x)}" cy="${yL}" r="5" fill="currentColor" stroke="none"/>`);
  return wrapSvg(W, H, out.join(""));
}

function renderFlow(spec) {
  const G = spec.grid ?? 80; // ızgara birimi (px)
  const nodes = new Map();
  for (const nd of spec.nodes) {
    const w = Math.max(nd.shape === "circle" ? 34 : 56, textW(nd.text ?? "", 14) + 20);
    nodes.set(nd.id, { ...nd, x: nd.at[0] * G, y: nd.at[1] * G, w, h: 34 });
  }
  const xs = [...nodes.values()].flatMap((n) => [n.x - n.w / 2, n.x + n.w / 2]);
  const ys = [...nodes.values()].flatMap((n) => [n.y - n.h / 2, n.y + n.h / 2]);
  const ox = 16 - Math.min(...xs), oy = 16 - Math.min(...ys);
  const W = Math.max(...xs) - Math.min(...xs) + 32, H = Math.max(...ys) - Math.min(...ys) + 32;
  const out = [];
  for (const e of spec.edges || []) {
    const a = nodes.get(e.from), b = nodes.get(e.to);
    if (!a || !b) throw new Error(`Bağlantıda tanımsız kutu: ${e.from} → ${e.to}`);
    const [x1, y1] = edgePoint(a, b, ox, oy), [x2, y2] = edgePoint(b, a, ox, oy);
    out.push(line(x1, y1, x2, y2, ' stroke-width="1.4"'));
    const ang = Math.atan2(y2 - y1, x2 - x1);
    out.push(`<path d="M${f(x2)} ${f(y2)} L${f(x2 - 8 * Math.cos(ang - 0.4))} ${f(y2 - 8 * Math.sin(ang - 0.4))} M${f(x2)} ${f(y2)} L${f(x2 - 8 * Math.cos(ang + 0.4))} ${f(y2 - 8 * Math.sin(ang + 0.4))}" stroke-width="1.4"/>`);
    if (e.label) {
      // Etiket, okun normali yönünde ve yazı genişliği kadar dışarı kaydırılır (çizgiyle çakışmaz).
      const len = Math.hypot(x2 - x1, y2 - y1) || 1;
      const nx = -(y2 - y1) / len, ny = (x2 - x1) / len;
      const off = 9 + Math.abs(nx) * textW(e.label, 12) * 0.5;
      out.push(text((x1 + x2) / 2 + nx * off, (y1 + y2) / 2 + ny * off, e.label, { size: 12 }));
    }
  }
  for (const n of nodes.values()) {
    const x = n.x + ox, y = n.y + oy;
    if (n.shape === "circle") out.push(`<circle cx="${f(x)}" cy="${f(y)}" r="${f(Math.max(17, n.w / 2))}" fill="currentColor" fill-opacity="0.06"/>`);
    else out.push(`<rect x="${f(x - n.w / 2)}" y="${f(y - n.h / 2)}" width="${f(n.w)}" height="${f(n.h)}" rx="6" fill="currentColor" fill-opacity="0.06"/>`);
    if (n.text) out.push(text(x, y, n.text, { size: 14, weight: 600 }));
  }
  return wrapSvg(W, H, out.join(""));
}

function edgePoint(a, b, ox, oy) {
  const ax = a.x + ox, ay = a.y + oy, bx = b.x + ox, by = b.y + oy;
  const dx = bx - ax, dy = by - ay;
  if (a.shape === "circle") {
    const r = Math.max(17, a.w / 2), len = Math.hypot(dx, dy) || 1;
    return [ax + (dx / len) * r, ay + (dy / len) * r];
  }
  const sx = dx === 0 ? Infinity : a.w / 2 / Math.abs(dx);
  const sy = dy === 0 ? Infinity : a.h / 2 / Math.abs(dy);
  const s = Math.min(sx, sy);
  return [ax + dx * s, ay + dy * s];
}

// ---------------------------------------------------------------------------
const RENDERERS = {
  geometry: renderGeometry,
  bar: renderBar,
  line: renderLine,
  pie: renderPie,
  table: renderTable,
  venn: renderVenn,
  numberline: renderNumberLine,
  flow: renderFlow,
};
export const FIGURE_KINDS = Object.keys(RENDERERS);

/** Şekil tarifini SVG'ye çevirir; hatalı tarifte açıklayıcı Error fırlatır. */
export function renderFigure(spec) {
  if (!spec || typeof spec !== "object") throw new Error("Şekil tarifi bir JSON nesnesi olmalı");
  const r = RENDERERS[spec.kind];
  if (!r) throw new Error(`Bilinmeyen şekil türü "${spec.kind}" (kullanılabilir: ${FIGURE_KINDS.join(", ")})`);
  const texts = JSON.stringify(spec);
  if (texts.includes("$")) throw new Error("Şekil yazılarında LaTeX ($) kullanılamaz; ², √, π, ° gibi karakterler kullanın");
  textBox = { minX: Infinity, minY: Infinity, maxX: -Infinity, maxY: -Infinity };
  let svg;
  try {
    svg = r(spec);
  } finally {
    textBox = null;
  }
  if (!isSafeFigureSvg(svg)) throw new Error("Üretilen SVG güvenlik denetiminden geçemedi");
  return svg;
}
