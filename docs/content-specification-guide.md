# 🎯 Kadro (KPSS Ekosistemi) — İçerik Üretim & Veri Formatları Kılavuzu

Bu belge, **Kadro** uygulaması için başka bir yapay zeka ajanı, ekip üyesi veya içerik yazarı tarafından soru ve etkileşimli içerik üretilirken uyulması gereken **birebir veri şemalarını, kanonik çoklu sınav taksonomisini (`exam_scopes` / `sub_branch`), resmi konu adlarını, JSON ve Supabase SQL şablonlarını** içerir.

---

## 📌 1. Temel İçerik Kuralları

1. **Özgün İçerik Zorunluluğu:** ÖSYM'nin çıkmış soruları teliflidir; birebir kopyalanmaz. ÖSYM'nin soru sorma stili, kazanımları ve çeldirici kurguları analiz edilerek **%100 özgün** sorular üretilir.
2. **"ÖSYM Çeldirici Tuzağı" (UWorld Modeli):** Her çoktan seçmeli soruda `distractor_trap` alanı **zorunludur**. Adayın en çok düşebileceği yanıltıcı şık deşifre edilir ve neden doğru sanıldığı net bir dille izah edilir *(mevzuat, Fıkıh/Kelam, Hukuk, İktisat ve Eğitim Bilimleri dahil tüm sınav türlerinde geçerlidir)*.
3. **Resmi Konu Adı & Kapsam (`exam_scopes`) Eşleşmesi:** Üretilen soruların `lesson` ve `topic` alanları uygulamadaki `CurriculumRegistry` tanımıyla **harfi harfine aynı** olmalıdır. Ortak dersler (`Tarih`, `Coğrafya`, `Vatandaşlık`, `Güncel Bilgiler`, `Türkçe`, `Matematik & Geometri`) sınavlar arasında kanonik isimle paylaşılırken `exam_scopes` ile filtrelenir; alana özgü dersler çakışmasız kanonik ön ek taşır (`DHBT-1 Temel Din Bilgisi`, `DHBT-2 Alan Bilgisi`, `Eğitim Bilimleri & TYMM`, `Eğitim Mevzuatı`, `ÖABT <Branş>`, `Alan Hukuk`, `Alan İktisat` vb.).

---

## 🌐 1.B Çoklu KPSS Kapsam Alanları (`exam_scopes`, `sub_branch`, Varyantlar)

Yeni eklenen soru ve içeriklerde aşağıdaki metadata alanları desteklenir (varsayılanı geriye dönük uyumlu olarak `["lisans_gk"]` şeklindedir):
- `exam_scopes` (`string[]`): Örn. `["lisans_gk", "lisans_gygk", "onlisans_gygk", "ortaogretim_gygk"]`, `["dhbt_lisans", "dhbt_onlisans"]`, `["ekpss_lisans"]`, `["meb_ags"]`, `["meb_ags_oabt_tarih"]`, `["a_grubu_p48"]`.
- `sub_branch` (`string?`): İsteğe bağlı alt dal/branş kodu (`"oabt_sinif_ogretmenligi"`, `"dhbt_onlisans"`, `"a_grubu_hukuk"` vb.).
- `education_level` (`string?`): `"lisans"` | `"onlisans"` | `"ortaogretim"`.
- `disability_variant` (`string?`): `"genel"` | `"gorme"` | `"isitme1"` | `"zihinsel"`.
- `source_variant` (`string?`): `"standard"` | `"simplified"` (`İşitme-1` / `Zihinsel` erişilebilir sade metin varyantı).

---

## 📚 2. Resmi Ders ve Konu İsimleri Referans Tablosu

Uygulamanın `lib/features/lessons/data/kpss_lessons.dart` dosyasındaki resmi konu listesidir:

| Ders (`lesson`) | Sınav Ağırlığı | Geçerli Konu Adları (`topic`) |
|---|---|---|
| **Tarih** | 27 Soru (En Kritik) | 1. `İslamiyet Öncesi Türk Tarihi`<br>2. `İlk Türk-İslam Devletleri`<br>3. `Osmanlı Kültür ve Uygarlığı`<br>4. `Osmanlı Dağılma Dönemi`<br>5. `Kurtuluş Savaşı Hazırlık ve Cepheler`<br>6. `Atatürk İlke ve İnkılapları`<br>7. `Çağdaş Türk ve Dünya Tarihi` |
| **Coğrafya** | 18 Soru | 1. `Türkiye'nin Coğrafi Konumu`<br>2. `Türkiye'nin Yer Şekilleri ve İklimi`<br>3. `Türkiye'de Nüfus ve Yerleşme`<br>4. `Türkiye'de Tarım ve Hayvancılık`<br>5. `Madenler ve Enerji Kaynakları`<br>6. `Sanayi, Ticaret ve Ulaşım` |
| **Vatandaşlık** | 9 Soru | 1. `Temel Hukuk Kavramları`<br>2. `1982 Anayasası ve Temel İlkeler`<br>3. `Temel Hak ve Ödevler`<br>4. `Yasama, Yürütme ve Yargı`<br>5. `İdare Hukuku`<br>6. `Uluslararası Kuruluşlar` |
| **Güncel Bilgiler** | 6 Soru | 1. `Türkiye ve Dünya Gündemi`<br>2. `Kültür, Sanat ve Edebiyat`<br>3. `Bilim ve Teknoloji Gelişmeleri`<br>4. `Spor ve Olimpiyatlar`<br>5. `UNESCO Miras Listesi`<br>6. `Önemli Günler ve Zirveler` |

---

## 🧩 3. Veri Türü 1: 5 Şıklı Çoktan Seçmeli Sorular (`multiple_choice`)

Uygulamanın ana motorudur. Konu testlerinde, 65 dakikalık 60 soruluk Genel Kültür denemelerinde ve Yanlış Defteri'nde kullanılır.

### A) JSON Formatı (Yerel Havuz: `assets/data/questions/sample_questions.json`)
```json
[
  {
    "id": "tar_001",
    "lesson": "Tarih",
    "topic": "İlk Türk-İslam Devletleri",
    "difficulty": "medium",
    "text": "Karahanlılar döneminde Yusuf Has Hacip tarafından kaleme alınan ve Türk-İslam edebiyatının ilk siyasetname örneği kabul edilen eser aşağıdakilerden hangisidir?",
    "options": [
      "Divanü Lügatit-Türk",
      "Kutadgu Bilig",
      "Atabetül-Hakayık",
      "Divan-ı Hikmet",
      "Muhakemetül-Lügateyn"
    ],
    "correctIndex": 1,
    "explanation": "Kutadgu Bilig (Mutluluk Veren Bilgi), Yusuf Has Hacip tarafından 1069 yılında Doğu Karahanlı hükümdarı Tabgaç Buğra Han'a sunulan ilk Türk-İslam siyasetnamesidir.",
    "distractor_trap": "ÖSYM 'Divanü Lügatit-Türk' şıkkını en güçlü çeldirici olarak koyar. Çünkü o eser de Karahanlılar dönemindedir fakat Kaşgarlı Mahmut tarafından yazılmış ilk Türkçe sözlük ve ansiklopedidir; siyasetname değildir."
  }
]
```

#### Alan Kuralları:
- `id`: Benzersiz metin (`tar_001`, `cog_042`, `vat_015`, `gun_003` vb.).
- `lesson`: Seçili `exam_scopes` kapsamına ait `CurriculumRegistry` kanonik ders adlarından biri (B Grubu Genel Kültür için: `Tarih`, `Coğrafya`, `Vatandaşlık`, `Güncel Bilgiler`).
- `topic`: İlgili dersin resmi konu adlarından biri (Bkz. Bölüm 2).
- `difficulty`: `'easy'` (1), `'medium'` (2), `'hard'` (3).
- `text`: Soru kökü. Varsa öncüller (I., II., III.) satır atlamalı (`\n`) yazılır.
- `options`: Tam olarak **5 şık** içeren dizi.
- `correctIndex`: Doğru şıkkın 0 tabanlı indeksi (`0: A`, `1: B`, `2: C`, `3: D`, `4: E`).
- `explanation`: Doğru cevabın bilimsel ve akılda kalıcı açıklaması.
- `distractor_trap`: **ÖSYM Çeldirici Tuzağı analizi.** Adayın neden en yakın yanlış şıkka gidebileceği ve o yanılgının mantığı.

---

### B) Supabase SQL Formatı (`public.questions` Tablosu)
Soruları doğrudan canlı Supabase veritabanına `INSERT` etmek için SQL formatı:

```sql
insert into public.questions (
  lesson, 
  topic, 
  question_type, 
  difficulty, 
  prompt_text, 
  interaction_data, 
  explanation, 
  distractor_trap
) values (
  'Tarih',
  'İlk Türk-İslam Devletleri',
  'multiple_choice',
  2,
  'Karahanlılar döneminde Yusuf Has Hacip tarafından kaleme alınan ve Türk-İslam edebiyatının ilk siyasetname örneği kabul edilen eser aşağıdakilerden hangisidir?',
  '{"options": ["Divanü Lügatit-Türk", "Kutadgu Bilig", "Atabetül-Hakayık", "Divan-ı Hikmet", "Muhakemetül-Lügateyn"], "correctIndex": 1}'::jsonb,
  'Kutadgu Bilig (Mutluluk Veren Bilgi), Yusuf Has Hacip tarafından 1069 yılında Tabgaç Buğra Han''a sunulan ilk Türk-İslam siyasetnamesidir.',
  'ÖSYM ''Divanü Lügatit-Türk'' şıkkını en güçlü çeldirici olarak koyar. Çünkü o eser ilk sözlüktür; ilk siyasetname ise Kutadgu Bilig''dir.'
);
```

---

## ⚡ 4. Veri Türü 2: "60 Saniyede Pençe" Doğru / Yanlış Soruları (`true_false`)

Uygulamanın refleks ve hızlı tekrar mini oyunu (`TrueFalseBlitzScreen`) için kullanılır.

### A) JSON Formatı
```json
[
  {
    "id": "tf_tar_001",
    "lesson": "Tarih",
    "topic": "Kurtuluş Savaşı Hazırlık ve Cepheler",
    "prompt_text": "Lozan Barış Antlaşması ile Boğazlar Komisyonu tamamen kaldırılmıştır.",
    "isTrue": false,
    "explanation": "Boğazlar Komisyonu Lozan Antlaşması'nda kaldırılmamış, aksine Türk başkanlığında uluslararası bir komisyon olarak devam etmiştir. Komisyonun tamamen kaldırılması ve egemenliğin Türkiye'ye geçmesi 1936 Montrö Boğazlar Sözleşmesi ile gerçekleşmiştir."
  },
  {
    "id": "tf_vat_002",
    "lesson": "Vatandaşlık",
    "topic": "Yasama, Yürütme ve Yargı",
    "prompt_text": "1982 Anayasası'na göre Olağanüstü Hal (OHAL) ilan etme yetkisi doğrudan Cumhurbaşkanına aittir.",
    "isTrue": true,
    "explanation": "2017 anayasa değişikliği ile Bakanlar Kurulu kaldırılmış, en fazla 6 aylık süreyle OHAL ilan etme yetkisi doğrudan Cumhurbaşkanına verilmiştir."
  }
]
```

### B) Supabase SQL Formatı
```sql
insert into public.questions (
  lesson, 
  topic, 
  question_type, 
  difficulty, 
  prompt_text, 
  interaction_data, 
  explanation
) values (
  'Tarih',
  'Kurtuluş Savaşı Hazırlık ve Cepheler',
  'true_false',
  2,
  'Lozan Barış Antlaşması ile Boğazlar Komisyonu tamamen kaldırılmıştır.',
  '{"isTrue": false}'::jsonb,
  'Boğazlar Komisyonu Lozan''da değil, 1936 Montrö Boğazlar Sözleşmesi ile kaldırılmıştır.'
);
```

---

## 🧩 5. Veri Türü 3: "Kavram Eşleştirme Tahtası" (`matching`)

Quizlet Match tarzı 4'e 4 interaktif tahta oyunudur (`ConceptMatchScreen`).

### A) JSON Formatı
Her sette **tam olarak 4 adet çift** (`pairs`) olmalıdır. Sol taraf terim/yer, sağ taraf açıklama/eşleşen kavramdır.

```json
[
  {
    "id": "match_cog_001",
    "lesson": "Coğrafya",
    "topic": "Madenler ve Enerji Kaynakları",
    "prompt_text": "Maden çıkarım merkezlerini ilgili maden türüyle eşleştirin.",
    "pairs": [
      { "left": "Divriği & Hekimhan", "right": "Demir" },
      { "left": "Murgul & Küre", "right": "Bakır" },
      { "left": "Seydişehir & Mortaş", "right": "Boksit (Alüminyum)" },
      { "left": "Kırka & Bigadiç", "right": "Bor" }
    ],
    "explanation": "Divriği/Hekimhan demir, Murgul/Küre bakır, Seydişehir boksit, Kırka/Bigadiç ise dünya rezervlerinin çoğuna sahip olduğumuz bor madeni sahalarıdır."
  }
]
```

### B) Supabase SQL Formatı
```sql
insert into public.questions (
  lesson, 
  topic, 
  question_type, 
  difficulty, 
  prompt_text, 
  interaction_data, 
  explanation
) values (
  'Coğrafya',
  'Madenler ve Enerji Kaynakları',
  'matching',
  2,
  'Maden çıkarım merkezlerini ilgili maden türüyle eşleştirin.',
  '{"pairs": [{"left": "Divriği & Hekimhan", "right": "Demir"}, {"left": "Murgul & Küre", "right": "Bakır"}, {"left": "Seydişehir & Mortaş", "right": "Boksit (Alüminyum)"}, {"left": "Kırka & Bigadiç", "right": "Bor"}]}'::jsonb,
  'Divriği/Hekimhan demir, Murgul/Küre bakır, Seydişehir boksit, Kırka/Bigadiç bor çıkarım merkezidir.'
);
```

---

## 🗂️ 6. Veri Türü 4: Hap Bilgi Kartları (`flashcards`)

Ön yüzünde soru veya kavram, arka yüzünde akılda kalıcı hap bilgi yer alan kartlardır (`FlashcardsScreen`).

### JSON Formatı (`lib/features/flashcards/data/sample_flashcards.dart`)
```json
[
  {
    "id": "fc_vat_001",
    "lesson": "Vatandaşlık",
    "topic": "Temel Hukuk Kavramları",
    "frontText": "Hak Ehliyeti ile Fiil Ehliyeti arasındaki temel fark nedir?",
    "backText": "Hak Ehliyeti: Sağ ve tam doğumla başlar, pasiftir (hak sahibi olabilme).\nFiil Ehliyeti: Ayırt etme gücü, erginlik ve kısıtlı olmamayı gerektirir, aktiftir (kendi işlemiyle borç altına girebilme)."
  },
  {
    "id": "fc_tar_002",
    "lesson": "Tarih",
    "topic": "Osmanlı Kültür ve Uygarlığı",
    "frontText": "Osmanlı'da 'Miri Arazi' türleri nelerdir?",
    "backText": "1. Dirlik (Has, Zeamet, Tımar)\n2. Paşmaklık (Padişah kadınları/kızları)\n3. Ocaklık (Kale muhafızları/tersane)\n4. Malikane (Üstün hizmet gösterenler)\n5. Yurtluk (Sınır boyu gazileri)\n6. Mukataa (Geliri doğrudan hazineye giden)"
  }
]
```

---

## 🤖 7. Soru Üretici Yapay Zekaya (Agent'a) Verilecek Prompt Şablonu

Başka bir yapay zekaya (ChatGPT, Claude, Gemini veya ayrı bir agent) toplu soru ürettirirken **aşağıdaki istemi doğrudan kopyalayıp verebilirsin:**

```text
ROL VE GÖREV:
Sen uzman bir KPSS Lisans Genel Kültür (Tarih, Coğrafya, Vatandaşlık, Güncel Bilgiler) soru yazarı ve ÖSYM soru hazırlama komisyonu uzmanısın.
Kadro mobil uygulaması için 5 şıklı, pedagojik açıklamalı ve ÖSYM çeldirici tuzakları içeren özgün sorular üreteceksin.

KESİN KURALLAR:
1. Asla ÖSYM'nin çıkmış sorularını birebir kopyalama; benzer mantıkta, aynı kazanımı ölçen %100 özgün sorular yaz.
2. `lesson` alanı yalnızca hedef sınava ait `CurriculumRegistry` kanonik ders adlarından biri olmalıdır (Örn. B Grubu GK için `'Tarih'`, `'Coğrafya'`, `'Vatandaşlık'`, `'Güncel Bilgiler'`; diğer türler için `'DHBT-1 Temel Din Bilgisi'`, `'Alan Hukuk'`, `'ÖABT Sınıf Öğretmenliği'` vb.).
3. 'topic' alanı yalnızca resmi müfredat konusunu içermelidir (Örn: 'İslamiyet Öncesi Türk Tarihi', 'Türkiye''nin Coğrafi Konumu', '1982 Anayasası ve Temel İlkeler', 'UNESCO Miras Listesi').
4. 'options' tam 5 seçenekli olmalıdır.
5. 'distractor_trap' (UWorld Modeli): Adayın sınavda düşebileceği en tehlikeli yanıltıcı şıkkı belirt ve adayın zihnindeki hangi ön yargı veya eksik bilgi yüzünden o tuzağa düştüğünü deşifre et.
6. Çıktıyı SADECE geçerli bir JSON dizisi (Array) olarak ver, ekstra açıklama veya markdown metni ekleme.

ÇIKTI JSON ŞABLONU:
[
  {
    "id": "tar_kpss_001",
    "lesson": "Tarih",
    "topic": "İslamiyet Öncesi Türk Tarihi",
    "difficulty": "medium",
    "text": "Soru kökü ve varsa öncüller...",
    "options": [
      "A şıkkı metni",
      "B şıkkı metni",
      "C şıkkı metni",
      "D şıkkı metni",
      "E şıkkı metni"
    ],
    "correctIndex": 0,
    "explanation": "Doğru şıkkın net, kanıtlı ve öğretici açıklaması...",
    "distractor_trap": "ÖSYM adayın X ile Y kavramını karıştırma eğilimini bildiği için C şıkkını güçlü bir çeldirici olarak yerleştirmiştir. Oysa ki..."
  }
]
```

---

## 🚀 8. Üretilen Verilerin Uygulamaya Aktarılması

Toplu sorular üretildiğinde iki şekilde sisteme yüklenebilir:
1. **Toplu Supabase SQL:** Bölüm 3-B formatındaki SQL çıktıları Supabase Dashboard SQL Editor'e yapıştırılarak tek seferde buluta aktarılır.
2. **Yerel JSON:** Üretilen JSON dizisi `assets/data/questions/sample_questions.json` dosyasına eklenir. Uygulama otomatik olarak bu dosyayı tanır.
