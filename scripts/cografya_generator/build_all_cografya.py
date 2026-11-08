# -*- coding: utf-8 -*-
"""
KPSS Coğrafya — Master Builder & SQL Exporter
Tüm 6 coğrafya konusunu derler, doğrular, tekli ve birleşik SQL dosyalarını üretir,
Masaüstü ve proje reposuna kaydeder, sample_questions.json dosyasını günceller.
"""

import os
import sys
import json
from pathlib import Path

# Yerel modülleri dahil et
CURRENT_DIR = Path(__file__).resolve().parent
sys.path.insert(0, str(CURRENT_DIR))

if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8', errors='replace')
if hasattr(sys.stderr, 'reconfigure'):
    sys.stderr.reconfigure(encoding='utf-8', errors='replace')

import sql_helper as sh
import topic_01_cografi_konum as t1
import topic_02_yer_sekilleri_ve_iklim as t2
import topic_03_nufus_ve_yerlesme as t3
import topic_04_tarim_ve_hayvancilik as t4
import topic_05_madenler_ve_enerji as t5
import topic_06_sanayi_ticaret_ve_ulasim as t6

TOPICS = [
    {
        "filename": "01_turkiyenin_cografi_konumu.sql",
        "topic_name": "Türkiye'nin Coğrafi Konumu",
        "questions": t1.questions,
        "title": "Konu 1: Türkiye'nin Coğrafi Konumu"
    },
    {
        "filename": "02_turkiyenin_yer_sekilleri_ve_iklimi.sql",
        "topic_name": "Türkiye'nin Yer Şekilleri ve İklimi",
        "questions": t2.questions,
        "title": "Konu 2: Türkiye'nin Yer Şekilleri ve İklimi"
    },
    {
        "filename": "03_turkiyede_nufus_ve_yerlesme.sql",
        "topic_name": "Türkiye'de Nüfus ve Yerleşme",
        "questions": t3.questions,
        "title": "Konu 3: Türkiye'de Nüfus ve Yerleşme"
    },
    {
        "filename": "04_turkiyede_tarim_ve_hayvancilik.sql",
        "topic_name": "Türkiye'de Tarım ve Hayvancılık",
        "questions": t4.questions,
        "title": "Konu 4: Türkiye'de Tarım ve Hayvancılık"
    },
    {
        "filename": "05_madenler_ve_enerji_kaynaklari.sql",
        "topic_name": "Madenler ve Enerji Kaynakları",
        "questions": t5.questions,
        "title": "Konu 5: Madenler ve Enerji Kaynakları"
    },
    {
        "filename": "06_sanayi_ticaret_ve_ulasim.sql",
        "topic_name": "Sanayi, Ticaret ve Ulaşım",
        "questions": t6.questions,
        "title": "Konu 6: Sanayi, Ticaret ve Ulaşım"
    }
]

DEST_DIRS = [
    Path(r"C:\Users\omere\Desktop\kpss-cografya-sql"),
    Path(r"d:\projelerim\gunisigi\docs\soru_havuzu\cografya"),
    Path(r"C:\projelerim\gunisigi\docs\soru_havuzu\cografya"),
]

SAMPLE_QUESTIONS_PATHS = [
    Path(r"d:\projelerim\gunisigi\assets\data\questions\sample_questions.json"),
    Path(r"C:\projelerim\gunisigi\assets\data\questions\sample_questions.json"),
]

def map_difficulty_to_str(diff_int: int) -> str:
    if diff_int == 1:
        return "easy"
    elif diff_int == 3:
        return "hard"
    return "medium"

def build():
    print("=" * 60)
    print("🌍 KPSS COĞRAFYA — MASTER BUILDER BAŞLATILIYOR")
    print("=" * 60)

    # Hedef dizinleri oluştur
    for d in DEST_DIRS:
        d.mkdir(parents=True, exist_ok=True)
        print(f" Hedef Dizin Hazır: {d}")

    total_questions = 0
    all_questions_list = []
    topic_sql_contents = {}

    for t_idx, topic in enumerate(TOPICS, 1):
        qs = topic["questions"]
        q_count = len(qs)
        total_questions += q_count
        all_questions_list.extend(qs)
        print(f"\n[{t_idx}/6] Doğrulanıyor: {topic['title']} ({q_count} Soru)...")

        # Soruları tek tek valide et
        for idx, q in enumerate(qs, 1):
            sh.validate_question(q, idx)

        # SQL içeriğini üret
        sql_lines = [
            f"-- =============================================================",
            f"-- KPSS COĞRAFYA — {topic['title'].upper()}",
            f"-- Toplam Soru: {q_count} (Zorluk: 10 Kolay, 20 Orta, 10 Zor)",
            f"-- Standart: Özgün İçerik + Açıklama + ÖSYM Çeldirici Tuzağı",
            f"-- =============================================================",
            f"BEGIN;\n"
        ]

        for idx, q in enumerate(qs, 1):
            sql_lines.append(f"-- Soru #{idx:02d} (Zorluk: {q['difficulty']})")
            sql_lines.append(sh.question_to_sql_insert(q))
            sql_lines.append("")

        sql_lines.append("COMMIT;\n")
        full_sql = "\n".join(sql_lines)
        topic_sql_contents[topic["filename"]] = full_sql

        # Bireysel SQL dosyasını hedef klasörlere yaz
        for d in DEST_DIRS:
            dest_file = d / topic["filename"]
            with open(dest_file, "w", encoding="utf-8") as f:
                f.write(full_sql)

        print(f"  ✓ {topic['filename']} başarıyla üretildi ({len(full_sql.encode('utf-8'))} bayt).")

    # -------------------------------------------------------------
    # 00_tum_cografya_sorulari_tek_dosya.sql Üret
    # -------------------------------------------------------------
    print("\n📦 BİRLEŞİK MASTER SQL DOSYASI OLUŞTURULUYOR...")
    master_sql_lines = [
        "-- =============================================================",
        "-- KADRO KPSS LİSANS GENEL KÜLTÜR — TÜM COĞRAFYA SORULARI (MASTER)",
        f"-- Toplam: 6 Konu x 40 Soru = {total_questions} Özgün Soru",
        "-- Hedef Tablo: public.questions (Supabase)",
        "-- UWorld Modeli: prompt_text, options, correctIndex, explanation, distractor_trap",
        "-- =============================================================",
        "BEGIN;\n"
    ]

    for topic in TOPICS:
        master_sql_lines.append(f"\n-- -------------------------------------------------------------")
        master_sql_lines.append(f"-- {topic['title'].upper()}")
        master_sql_lines.append(f"-- -------------------------------------------------------------\n")
        for idx, q in enumerate(topic["questions"], 1):
            master_sql_lines.append(sh.question_to_sql_insert(q))
            master_sql_lines.append("")

    master_sql_lines.append("COMMIT;\n")
    master_sql = "\n".join(master_sql_lines)

    for d in DEST_DIRS:
        dest_file = d / "00_tum_cografya_sorulari_tek_dosya.sql"
        with open(dest_file, "w", encoding="utf-8") as f:
            f.write(master_sql)
    print(f"  ✓ 00_tum_cografya_sorulari_tek_dosya.sql başarıyla üretildi ({len(master_sql.encode('utf-8'))} bayt).")

    # -------------------------------------------------------------
    # README_KURULUM.md Masaüstüne ve Docs'a Yaz
    # -------------------------------------------------------------
    readme_content = f"""# 🌍 Kadro KPSS Coğrafya Soru Havuzu — Supabase SQL Kurulum Rehberi

Bu klasör, **Kadro: KPSS Lisans Genel Kültür** uygulaması için hazırlanan **{total_questions} adet %100 özgün, pedagojik açıklamalı ve 'ÖSYM Çeldirici Tuzağı' (UWorld modeli)** içeren Coğrafya sorularının Supabase veritabanına aktarılması için hazırlanmış SQL dosyalarını içerir.

---

## 📊 Soru Havuzu İstatistikleri ve Konu Dağılımı

| Dosya Adı | Konu | Kolay (Z1) | Orta (Z2) | Zor (Z3) | Toplam |
|:---|:---|:---:|:---:|:---:|:---:|
| `01_turkiyenin_cografi_konumu.sql` | Türkiye'nin Coğrafi Konumu | 10 | 20 | 10 | **40** |
| `02_turkiyenin_yer_sekilleri_ve_iklimi.sql` | Türkiye'nin Yer Şekilleri ve İklimi | 10 | 20 | 10 | **40** |
| `03_turkiyede_nufus_ve_yerlesme.sql` | Türkiye'de Nüfus ve Yerleşme | 10 | 20 | 10 | **40** |
| `04_turkiyede_tarim_ve_hayvancilik.sql` | Türkiye'de Tarım ve Hayvancılık | 10 | 20 | 10 | **40** |
| `05_madenler_ve_enerji_kaynaklari.sql` | Madenler ve Enerji Kaynakları | 10 | 20 | 10 | **40** |
| `06_sanayi_ticaret_ve_ulasim.sql` | Sanayi, Ticaret ve Ulaşım | 10 | 20 | 10 | **40** |
| **00_tum_cografya_sorulari_tek_dosya.sql** | **TÜM COĞRAFYA (BİRLEŞİK)** | **60** | **120** | **60** | **{total_questions}** |

---

## 🚀 Supabase'e Yükleme Adımları (Tek Tıkla Kurulum)

### Yöntem A: Tüm Soruları Tek Seferde Yükleme (Önerilen)
1. **Supabase Dashboard**'unuza (`https://supabase.com/dashboard`) gidin ve projenizi açın.
2. Sol menüden **"SQL Editor"** sekmesine tıklayın.
3. **"New Query"** butonuna basarak boş bir SQL editörü açın.
4. Bu klasördeki `00_tum_cografya_sorulari_tek_dosya.sql` dosyasının içeriğini kopyalayıp editöre yapıştırın.
5. Sağ alttaki yeşil **"RUN"** butonuna tıklayın.
6. Birkaç saniye içinde **"Success. No rows returned"** mesajını göreceksiniz. Tüm 240 soru veritabanınıza başarıyla eklenmiş olacaktır!

### Yöntem B: Konu Konu Parça Parça Yükleme
- İsterseniz `01_...sql` dosyasından başlayarak sırasıyla her konuyu ayrı birer query olarak çalıştırabilirsiniz.
- Her dosya kendi içinde `BEGIN;` ve `COMMIT;` transaction bloklarıyla koruma altındadır; işlem yarıda kalırsa rollback yapılır, veri bozulmaz.

---

## 🛡️ Soru Kalitesi ve Pedagojik Standartlar
1. **Telif Garantisi:** Soruların tamamı KPSS müfredatı ve kaynak dokümanlar analiz edilerek sıfırdan özgün olarak yazılmıştır; ÖSYM'nin çıkmış sorularının birebir kopyası değildir.
2. **"⚠️ ÖSYM Çeldirici Tuzağı" (UWorld Modeli):** Her soruda, adayın sınav anında en çok çelişkiye düşebileceği şıkkın neden yanıltıcı olduğu ve neden doğru sanıldığı psikolojik ve kavramsal olarak analiz edilmiştir.
3. **Zorluk Seviyesi:** Her konu 4 dengeli testten (1 Isınma, 2 Standart ÖSYM Ayarı, 1 Kurtlar Sofrası / Net Sıçratan) oluşur.
"""

    for d in DEST_DIRS:
        readme_file = d / "README_KURULUM.md"
        with open(readme_file, "w", encoding="utf-8") as f:
            f.write(readme_content)
    print("  ✓ README_KURULUM.md rehberi başarıyla oluşturuldu.")

    # -------------------------------------------------------------
    # sample_questions.json Güncellemesi (Offline Fallback & Testler)
    # -------------------------------------------------------------
    print("\n📱 SAMPLE_QUESTIONS.JSON GÜNCELLENİYOR...")
    for json_path in SAMPLE_QUESTIONS_PATHS:
        if not json_path.exists():
            print(f"  ! Dosya bulunamadı: {json_path}")
            continue

        with open(json_path, "r", encoding="utf-8") as f:
            existing_data = json.load(f)

        # Coğrafya dışındaki dersleri koru (Tarih, Vatandaşlık, Güncel Bilgiler)
        non_cografya = [x for x in existing_data if x.get("lesson") != "Coğrafya"]
        print(f"  -> Mevcut Coğrafya dışı sorular korundu: {len(non_cografya)} adet")

        # Yeni 240 Coğrafya sorusunu ekle
        new_cografya_json = []
        for i, q in enumerate(all_questions_list, 1):
            item = {
                "id": f"cografya_{i:03d}",
                "lesson": q["lesson"],
                "topic": q["topic"],
                "text": q["prompt_text"],
                "options": q["options"],
                "correctIndex": q["correctIndex"],
                "explanation": q["explanation"],
                "difficulty": map_difficulty_to_str(q["difficulty"]),
                "distractor_trap": q["distractor_trap"]
            }
            new_cografya_json.append(item)

        combined_data = non_cografya + new_cografya_json
        with open(json_path, "w", encoding="utf-8") as f:
            json.dump(combined_data, f, ensure_ascii=False, indent=2)

        print(f"  ✓ {json_path} güncellendi: Toplam {len(combined_data)} soru (Coğrafya: {len(new_cografya_json)} adet).")

    print("\n" + "=" * 60)
    print(f"🎉 TÜM İŞLEMLER BAŞARIYLA TAMAMLANDI! TOPLAM {total_questions} SORU HAZIR!")
    print("=" * 60)

if __name__ == "__main__":
    build()
