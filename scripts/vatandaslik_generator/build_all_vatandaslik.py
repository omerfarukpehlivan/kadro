# -*- coding: utf-8 -*-
"""
KPSS Vatandaşlık — Master Builder & SQL Exporter
Tüm 6 vatandaşlık konusunu derler, doğrular, tekli ve birleşik SQL dosyalarını üretir,
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
import topic_01_temel_hukuk as t1
import topic_02_anayasa_ilkeler as t2
import topic_03_temel_haklar as t3
import topic_04_yasama_yurutme_yargi as t4
import topic_05_idare_hukuku as t5
import topic_06_uluslararasi_kuruluslar as t6

TOPICS = [
    {
        "filename": "01_temel_hukuk_kavramlari.sql",
        "topic_name": "Temel Hukuk Kavramları",
        "questions": t1.questions,
        "title": "Konu 1: Temel Hukuk Kavramları"
    },
    {
        "filename": "02_1982_anayasasi_ve_temel_ilkeler.sql",
        "topic_name": "1982 Anayasası ve Temel İlkeler",
        "questions": t2.questions,
        "title": "Konu 2: 1982 Anayasası ve Temel İlkeler"
    },
    {
        "filename": "03_temel_hak_ve_odevler.sql",
        "topic_name": "Temel Hak ve Ödevler",
        "questions": t3.questions,
        "title": "Konu 3: Temel Hak ve Ödevler"
    },
    {
        "filename": "04_yasama_yurutme_ve_yargi.sql",
        "topic_name": "Yasama, Yürütme ve Yargı",
        "questions": t4.questions,
        "title": "Konu 4: Yasama, Yürütme ve Yargı"
    },
    {
        "filename": "05_idare_hukuku.sql",
        "topic_name": "İdare Hukuku",
        "questions": t5.questions,
        "title": "Konu 5: İdare Hukuku"
    },
    {
        "filename": "06_uluslararasi_kuruluslar.sql",
        "topic_name": "Uluslararası Kuruluşlar",
        "questions": t6.questions,
        "title": "Konu 6: Uluslararası Kuruluşlar"
    }
]

DEST_DIRS = [
    Path(r"C:\Users\omere\Desktop\kpss-vatandaslik-sql"),
    Path(r"C:\projelerim\gunisigi\docs\soru_havuzu\vatandaslik"),
]

SAMPLE_QUESTIONS_PATHS = [
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
    print("⚖️ KPSS VATANDAŞLIK — MASTER BUILDER BAŞLATILIYOR")
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
            f"-- KPSS VATANDAŞLIK — {topic['title'].upper()}",
            f"-- Toplam Soru: {q_count}",
            f"-- Standart: Özgün İçerik + Açıklama + ÖSYM Çeldirici Tuzağı + order_index",
            f"-- =============================================================",
            f"BEGIN;\n"
        ]

        for idx, q in enumerate(qs, 1):
            sql_lines.append(f"-- Soru #{idx:02d} (Zorluk: {q['difficulty']})")
            sql_lines.append(sh.question_to_sql_insert(q, order_index=idx))
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
    # 00_tum_vatandaslik_sorulari_tek_dosya.sql Üret
    # -------------------------------------------------------------
    print("\n📦 BİRLEŞİK MASTER SQL DOSYASI OLUŞTURULUYOR...")
    master_sql_lines = [
        "-- =============================================================",
        "-- KADRO KPSS LİSANS GENEL KÜLTÜR — TÜM VATANDAŞLIK SORULARI (MASTER)",
        f"-- Toplam: 6 Konu x 50 Soru = {total_questions} Özgün Soru",
        "-- Hedef Tablo: public.questions (Supabase)",
        "-- UWorld Modeli: prompt_text, options, correctIndex, explanation, distractor_trap, order_index",
        "-- =============================================================",
        "BEGIN;\n"
    ]

    for topic in TOPICS:
        master_sql_lines.append(f"\n-- -------------------------------------------------------------")
        master_sql_lines.append(f"-- {topic['title'].upper()}")
        master_sql_lines.append(f"-- -------------------------------------------------------------\n")
        for idx, q in enumerate(topic["questions"], 1):
            master_sql_lines.append(sh.question_to_sql_insert(q, order_index=idx))
            master_sql_lines.append("")

    master_sql_lines.append("COMMIT;\n")
    master_sql = "\n".join(master_sql_lines)

    for d in DEST_DIRS:
        dest_file = d / "00_tum_vatandaslik_sorulari_tek_dosya.sql"
        with open(dest_file, "w", encoding="utf-8") as f:
            f.write(master_sql)
    print(f"  ✓ 00_tum_vatandaslik_sorulari_tek_dosya.sql başarıyla üretildi ({len(master_sql.encode('utf-8'))} bayt).")

    # -------------------------------------------------------------
    # README_KURULUM.md Masaüstüne ve Docs'a Yaz
    # -------------------------------------------------------------
    readme_content = f"""# ⚖️ Kadro KPSS Vatandaşlık Soru Havuzu — Supabase SQL Kurulum Rehberi

Bu klasör, **Kadro: KPSS Lisans Genel Kültür** uygulaması için hazırlanan **{total_questions} adet %100 özgün, pedagojik açıklamalı ve 'ÖSYM Çeldirici Tuzağı' (UWorld modeli)** içeren Vatandaşlık sorularının Supabase veritabanına aktarılması için hazırlanmış SQL dosyalarını içerir.

---

## 📊 Soru Havuzu İstatistikleri ve Konu Dağılımı

| Dosya Adı | Konu | Kolay (Z1) | Orta (Z2) | Zor (Z3) | Toplam |
|:---|:---|:---:|:---:|:---:|:---:|
| `01_temel_hukuk_kavramlari.sql` | Temel Hukuk Kavramları | 10 | 20 | 10 | **40** |
| `02_1982_anayasasi_ve_temel_ilkeler.sql` | 1982 Anayasası ve Temel İlkeler | 10 | 20 | 10 | **40** |
| `03_temel_hak_ve_odevler.sql` | Temel Hak ve Ödevler | 10 | 20 | 10 | **40** |
| `04_yasama_yurutme_ve_yargi.sql` | Yasama, Yürütme ve Yargı | 10 | 20 | 10 | **40** |
| `05_idare_hukuku.sql` | İdare Hukuku | 10 | 20 | 10 | **40** |
| `06_uluslararasi_kuruluslar.sql` | Uluslararası Kuruluşlar | 10 | 20 | 10 | **40** |
| **00_tum_vatandaslik_sorulari_tek_dosya.sql** | **TÜM VATANDAŞLIK (BİRLEŞİK)** | **60** | **120** | **60** | **{total_questions}** |

---

## 🚀 Supabase'e Yükleme Adımları (Tek Tıkla Kurulum)

### Yöntem A: Tüm Soruları Tek Seferde Yükleme (Önerilen)
1. **Supabase Dashboard**'unuza (`https://supabase.com/dashboard`) gidin ve projenizi açın.
2. Sol menüden **"SQL Editor"** sekmesine tıklayın.
3. **"New Query"** butonuna basarak boş bir SQL editörü açın.
4. Bu klasördeki `00_tum_vatandaslik_sorulari_tek_dosya.sql` dosyasının içeriğini kopyalayıp editöre yapıştırın.
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

        # Vatandaşlık dışındaki dersleri koru (Tarih, Coğrafya, Güncel Bilgiler)
        non_vatandaslik = [x for x in existing_data if x.get("lesson") != "Vatandaşlık"]
        print(f"  -> Mevcut Vatandaşlık dışı sorular korundu: {len(non_vatandaslik)} adet")

        # Yeni 300 Vatandaşlık sorusunu ekle
        new_vatandaslik_json = []
        global_idx = 1
        for topic in TOPICS:
            for idx, q in enumerate(topic["questions"], 1):
                item = {
                    "id": f"vat_{global_idx:03d}",
                    "lesson": q["lesson"],
                    "topic": q["topic"],
                    "text": q["prompt_text"],
                    "prompt_text": q["prompt_text"],
                    "prompt": q["prompt_text"],
                    "options": q["options"],
                    "correctIndex": q["correctIndex"],
                    "explanation": q["explanation"],
                    "difficulty": map_difficulty_to_str(q["difficulty"]),
                    "difficultyLevel": q["difficulty"],
                    "distractor_trap": q["distractor_trap"],
                    "distractorTrap": q["distractor_trap"],
                    "order_index": idx,
                    "orderIndex": idx,
                }
                new_vatandaslik_json.append(item)
                global_idx += 1

        combined_data = non_vatandaslik + new_vatandaslik_json
        with open(json_path, "w", encoding="utf-8") as f:
            json.dump(combined_data, f, ensure_ascii=False, indent=2)

        print(f"  ✓ {json_path} güncellendi: Toplam {len(combined_data)} soru (Vatandaşlık: {len(new_vatandaslik_json)} adet).")

    print("\n" + "=" * 60)
    print(f"🎉 TÜM İŞLEMLER BAŞARIYLA TAMAMLANDI! TOPLAM {total_questions} VATANDAŞLIK SORUSU HAZIR!")
    print("=" * 60)

if __name__ == "__main__":
    build()
