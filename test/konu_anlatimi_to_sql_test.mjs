import { describe, it } from "node:test";
import assert from "node:assert/strict";

import {
  generateSqlForUnits,
  loadCanonicalCurriculum,
  parseTopicMarkdown,
  validateParsedTopic,
} from "../tools/konu_anlatimi_to_sql.mjs";

const CURRICULUM = loadCanonicalCurriculum();

/**
 * Geçerli, tüm FORMAT.md kurallarını sağlayan 3 bölümlük örnek Markdown üretir.
 */
function makeValidMarkdown({
  lesson = "Tarih",
  topic = "İslamiyet Öncesi Türk Tarihi",
  extraSection1 = "",
  section1Tuzak = ":::tuzak\nÖSYM çeldirici tuzağı açıklamasıdır.\n:::",
  section1Kodlama = ":::kodlama\n**A**kılda tutma kodlaması örneği.\n:::",
  section1Akilda = [
    "- İlk önemli madde burada yer alır.",
    "- İkinci önemli madde burada yer alır.",
    "- Üçüncü önemli madde burada yer alır.",
  ].join("\n"),
  section1Kontrol = ":::kontrol\n:::",
  sectionCount = 3,
} = {}) {
  const sections = [];
  for (let i = 1; i <= sectionCount; i++) {
    if (i === 1) {
      sections.push(`## Bölüm 1: Giriş ve Temel Kavramlar

Bu paragraf **kalın** ve *italik* biçimlendirmeyi test etmek için yazılmıştır. İkinci cümle de burada yer alır.

### Alt Başlık Örneği

- Birinci liste maddesi
- İkinci liste maddesi

:::tablo
| Kavram | Açıklama |
|---|---|
| Kurgan | Oda biçiminde mezar |
| Balbal | Taş heykel |
:::

:::zaman
MÖ 220 | Asya Hun Devleti'nin kuruluşu
552 | I. Göktürk Devleti'nin kuruluşu
:::

:::bilgi
Bu bir bilgi kutusudur.
:::

${section1Kodlama}

${section1Tuzak}

:::ornek
Örnek soru kurgusu burada yer alır.
:::

${extraSection1}

:::akilda-kalsin
${section1Akilda}
:::

${section1Kontrol}`);
    } else {
      sections.push(`## Bölüm ${i}: Gelişme Bölümü ${i}

Bölüm ${i} için açıklayıcı paragraf metni burada yer alır. İkinci cümle özet için eklenmiştir.

:::tuzak
Bölüm ${i} için çeldirici tuzağı açıklaması.
:::

:::akilda-kalsin
- Bölüm ${i} birinci özet maddesi.
- Bölüm ${i} ikinci özet maddesi.
- Bölüm ${i} üçüncü özet maddesi.
:::

:::kontrol
:::`);
    }
  }

  return `---
lesson: ${lesson}
topic: ${topic}
exam_scopes: [lisans_gygk, onlisans]
content_version: 1
---

${sections.join("\n\n")}
`;
}

describe("konu_anlatimi_to_sql.mjs — Ayrıştırma ve SQL Üretimi", () => {
  it("örnek Markdown'ı beklenen blocks JSON yapısına ve idempotent SQL'e dönüştürür", () => {
    const md = makeValidMarkdown();
    const parsed = parseTopicMarkdown(md, "01_test.md");
    const { errors } = validateParsedTopic(parsed, CURRICULUM, "01_test.md");

    assert.deepEqual(errors, []);
    assert.equal(parsed.units.length, 3);

    const u1 = parsed.units[0];
    assert.equal(u1.id, "tarih.islamiyet_oncesi_turk_tarihi.01");
    assert.equal(u1.lesson, "Tarih");
    assert.equal(u1.topic, "İslamiyet Öncesi Türk Tarihi");
    assert.equal(u1.unit_order, 1);
    assert.equal(u1.title, "Bölüm 1: Giriş ve Temel Kavramlar");
    assert.ok(u1.estimated_minutes >= 1);

    const blockTypes = u1.blocks.map((b) => b.type);
    assert.deepEqual(blockTypes, [
      "paragraph",
      "heading",
      "bullets",
      "table",
      "timeline",
      "callout",
      "callout",
      "callout",
      "callout",
      "key_points",
      "check_questions",
    ]);

    assert.deepEqual(u1.blocks[1], {
      type: "heading",
      text: "Alt Başlık Örneği",
    });
    assert.deepEqual(u1.blocks[2], {
      type: "bullets",
      items: ["Birinci liste maddesi", "İkinci liste maddesi"],
    });
    assert.deepEqual(u1.blocks[3], {
      type: "table",
      headers: ["Kavram", "Açıklama"],
      rows: [
        ["Kurgan", "Oda biçiminde mezar"],
        ["Balbal", "Taş heykel"],
      ],
    });
    assert.deepEqual(u1.blocks[4], {
      type: "timeline",
      items: [
        { label: "MÖ 220", text: "Asya Hun Devleti'nin kuruluşu" },
        { label: "552", text: "I. Göktürk Devleti'nin kuruluşu" },
      ],
    });
    assert.equal(u1.blocks[5].kind, "info");
    assert.equal(u1.blocks[6].kind, "mnemonic");
    assert.equal(u1.blocks[7].kind, "trap");
    assert.equal(u1.blocks[8].kind, "example");
    assert.equal(u1.blocks[9].items.length, 3);
    assert.deepEqual(u1.blocks[10], {
      type: "check_questions",
      question_ids: [],
    });

    const sql = generateSqlForUnits(parsed.units, "docs/konu_anlatimi/tarih/01_test.md");
    assert.match(sql, /insert into public\.topic_lesson_units/);
    assert.match(sql, /on conflict \(id\) do update set/);
    assert.match(sql, /'tarih\.islamiyet_oncesi_turk_tarihi\.01'/);
    assert.match(sql, /'\{"lisans_gygk","onlisans"\}'::text\[\]/);
  });

  it("kontrol bloğundaki geçerli UUID'leri question_ids dizisine aktarır", () => {
    const uuid1 = "11111111-2222-4333-8444-555555555555";
    const uuid2 = "aaaaaaaa-bbbb-4ccc-8ddd-eeeeeeeeeeee";
    const md = makeValidMarkdown({
      section1Kontrol: `:::kontrol\n${uuid1}\n${uuid2}\n:::`,
    });
    const parsed = parseTopicMarkdown(md, "01_test.md");
    const { errors } = validateParsedTopic(parsed, CURRICULUM, "01_test.md");

    assert.deepEqual(errors, []);
    const checkBlock = parsed.units[0].blocks.find((b) => b.type === "check_questions");
    assert.deepEqual(checkBlock.question_ids, [uuid1, uuid2]);
  });
});

describe("konu_anlatimi_to_sql.mjs — Kural İhlalleri", () => {
  it("kanonik olmayan lesson veya topic adlarını reddeder", () => {
    const mdBadLesson = makeValidMarkdown({ lesson: "Fizik" });
    const res1 = validateParsedTopic(parseTopicMarkdown(mdBadLesson), CURRICULUM);
    assert.ok(res1.errors.some((e) => e.includes('Geçersiz lesson "Fizik"')));

    const mdBadTopic = makeValidMarkdown({
      lesson: "Tarih",
      topic: "Bilinmeyen Konu",
    });
    const res2 = validateParsedTopic(parseTopicMarkdown(mdBadTopic), CURRICULUM);
    assert.ok(res2.errors.some((e) => e.includes('geçersiz topic "Bilinmeyen Konu"')));
  });

  it("bölüm sayısı 3'ten az veya 8'den fazla olduğunda hata verir", () => {
    const mdFew = makeValidMarkdown({ sectionCount: 2 });
    const resFew = validateParsedTopic(parseTopicMarkdown(mdFew), CURRICULUM);
    assert.ok(resFew.errors.some((e) => e.includes("3–8 bölüm olmalıdır (mevcut: 2)")));

    const mdMany = makeValidMarkdown({ sectionCount: 9 });
    const resMany = validateParsedTopic(parseTopicMarkdown(mdMany), CURRICULUM);
    assert.ok(resMany.errors.some((e) => e.includes("3–8 bölüm olmalıdır (mevcut: 9)")));
  });

  it("her bölümde en az bir :::tuzak bloğu zorunluluğunu denetler", () => {
    const md = makeValidMarkdown({ section1Tuzak: "" });
    const res = validateParsedTopic(parseTopicMarkdown(md), CURRICULUM);
    assert.ok(res.errors.some((e) => e.includes("en az 1 ':::tuzak' bloğu")));
  });

  it(":::akilda-kalsin eksikse veya 3-5 madde dışındaysa hata verir", () => {
    const mdShort = makeValidMarkdown({
      section1Akilda: "- Yalnızca tek madde\n- İkinci madde",
    });
    const resShort = validateParsedTopic(parseTopicMarkdown(mdShort), CURRICULUM);
    assert.ok(resShort.errors.some((e) => e.includes("3–5 madde içermelidir")));

    const mdMissing = makeValidMarkdown({ section1Akilda: "" }).replace(
      ":::akilda-kalsin\n\n:::",
      "",
    );
    const resMissing = validateParsedTopic(parseTopicMarkdown(mdMissing), CURRICULUM);
    assert.ok(resMissing.errors.some((e) => e.includes("tam 1 adet ':::akilda-kalsin'")));
  });

  it(":::kontrol bloğu eksikse hata verir", () => {
    const md = makeValidMarkdown({ section1Kontrol: "" });
    const res = validateParsedTopic(parseTopicMarkdown(md), CURRICULUM);
    assert.ok(res.errors.some((e) => e.includes("1 adet ':::kontrol' bloğu")));
  });

  it("tüm konu boyunca en az bir :::kodlama bloğu zorunluluğunu denetler", () => {
    const md = makeValidMarkdown({ section1Kodlama: "" });
    const res = validateParsedTopic(parseTopicMarkdown(md), CURRICULUM);
    assert.ok(res.errors.some((e) => e.includes("en az 1 adet ':::kodlama' bloğu")));
  });

  it("HTML etiketi, Markdown link/görsel ve emoji kullanımını yasaklar", () => {
    const mdHtml = makeValidMarkdown({ extraSection1: "Burada <b>yasak</b> HTML var." });
    assert.ok(
      validateParsedTopic(parseTopicMarkdown(mdHtml), CURRICULUM).errors.some((e) =>
        e.includes("HTML etiketi kullanılamaz"),
      ),
    );

    const mdLink = makeValidMarkdown({ extraSection1: "Bakınız [site](https://example.com)." });
    assert.ok(
      validateParsedTopic(parseTopicMarkdown(mdLink), CURRICULUM).errors.some((e) =>
        e.includes("Link veya görsel sözdizimi kullanılamaz"),
      ),
    );

    const mdEmoji = makeValidMarkdown({ extraSection1: "Yasak emoji 🎯 burada." });
    assert.ok(
      validateParsedTopic(parseTopicMarkdown(mdEmoji), CURRICULUM).errors.some((e) =>
        e.includes("Emoji kullanılamaz"),
      ),
    );
  });

  it("tablo 5 sütun veya 10 satır sınırını aşarsa hata verir", () => {
    const mdCols = makeValidMarkdown({
      extraSection1: `:::tablo
| C1 | C2 | C3 | C4 | C5 | C6 |
|---|---|---|---|---|---|
| 1 | 2 | 3 | 4 | 5 | 6 |
:::`,
    });
    assert.ok(
      validateParsedTopic(parseTopicMarkdown(mdCols), CURRICULUM).errors.some((e) =>
        e.includes("Tabloda en çok 5 sütun olabilir"),
      ),
    );

    const rows11 = Array.from({ length: 11 }, (_, idx) => `| A${idx} | B${idx} |`).join("\n");
    const mdRows = makeValidMarkdown({
      extraSection1: `:::tablo
| Sütun 1 | Sütun 2 |
|---|---|
${rows11}
:::`,
    });
    assert.ok(
      validateParsedTopic(parseTopicMarkdown(mdRows), CURRICULUM).errors.some((e) =>
        e.includes("Tabloda en çok 10 satır olabilir"),
      ),
    );
  });

  it(":::kontrol bloğunda geçersiz UUID varsa hata verir", () => {
    const md = makeValidMarkdown({
      section1Kontrol: ":::kontrol\ngecersiz-id-123\n:::",
    });
    const res = validateParsedTopic(parseTopicMarkdown(md), CURRICULUM);
    assert.ok(res.errors.some((e) => e.includes("Geçersiz kontrol soru UUID'si")));
  });
});
