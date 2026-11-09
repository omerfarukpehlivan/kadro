# -*- coding: utf-8 -*-
"""
KPSS Tarih — Master Builder & SQL Exporter
Tüm 7 Tarih konusundaki 620 soruyu derler, doğrular, order_index (1..N) atar,
00_tum_tarih_sorulari_tek_dosya.sql üretir, sample_questions.json dosyasını günceller.
"""

import os
import sys
import json
import re
from pathlib import Path

if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8', errors='replace')
if hasattr(sys.stderr, 'reconfigure'):
    sys.stderr.reconfigure(encoding='utf-8', errors='replace')

BASE_DIR = Path(r"C:\projelerim\gunisigi")
DOCS_TARIH_DIR = BASE_DIR / "docs" / "soru_havuzu" / "tarih"
SAMPLE_QUESTIONS_PATH = BASE_DIR / "assets" / "data" / "questions" / "sample_questions.json"

TOPIC_CONFIGS = [
    {
        "topic": "İslamiyet Öncesi Türk Tarihi",
        "prefix": "tar_top1",
        "files": [
            "01_islamiyet_oncesi_turk_tarihi.sql",
            "01_islamiyet_oncesi_turk_tarihi_ek.sql",
        ]
    },
    {
        "topic": "İlk Türk-İslam Devletleri",
        "prefix": "tar_top2",
        "files": [
            "02_ilk_turk_islam_devletleri.sql",
            "02_ilk_turk_islam_devletleri_ek.sql",
        ]
    },
    {
        "topic": "Osmanlı Kültür ve Uygarlığı",
        "prefix": "tar_top3",
        "files": [
            "03_osmanli_kultur_ve_uygarligi.sql",
            "03_osmanli_kultur_ve_uygarligi_ek.sql",
            "03_osmanli_kultur_ve_uygarligi_ek2.sql",
        ]
    },
    {
        "topic": "Osmanlı Dağılma Dönemi",
        "prefix": "tar_top4",
        "files": [
            "04_osmanli_dagilma_donemi.sql",
            "04_osmanli_dagilma_donemi_ek.sql",
            "04_osmanli_dagilma_donemi_ek2.sql",
        ]
    },
    {
        "topic": "Kurtuluş Savaşı Hazırlık ve Cepheler",
        "prefix": "tar_top5",
        "files": [
            "05_kurtulus_savasi_hazirlik_ve_cepheler.sql",
            "05_kurtulus_savasi_hazirlik_ve_cepheler_ek.sql",
        ]
    },
    {
        "topic": "Atatürk İlke ve İnkılapları",
        "prefix": "tar_top6",
        "files": [
            "06_ataturk_ilke_ve_inkilaplari.sql",
            "06_ataturk_ilke_ve_inkilaplari_ek.sql",
        ]
    },
    {
        "topic": "Çağdaş Türk ve Dünya Tarihi",
        "prefix": "tar_top7",
        "files": [
            "07_cagdas_turk_ve_dunya_tarihi.sql",
            "07_cagdas_turk_ve_dunya_tarihi_ek.sql",
        ]
    },
]

def escape_sql_str(text: str) -> str:
    if text is None:
        return ''
    return text.replace("'", "''")

def parse_sql_file(fpath):
    with open(fpath, "r", encoding="utf-8", errors="ignore") as fp:
        content = fp.read()
    
    questions = []
    inserts = re.split(r"insert\s+into\s+public\.questions\s*\([^)]*\)\s*values\s*\(", content, flags=re.IGNORECASE)
    
    for ins in inserts[1:]:
        idx_end = ins.rfind(");")
        val_block = ins[:idx_end].strip() if idx_end != -1 else ins.strip()
        
        m = re.match(r"^\s*'([^']+)'\s*,\s*'([^']+)'\s*,\s*'([^']+)'\s*,\s*([0-9]+)\s*,\s*", val_block)
        if not m:
            continue
        lesson = m.group(1)
        topic = m.group(2)
        q_type = m.group(3)
        diff = int(m.group(4))
        rest = val_block[m.end():]
        
        idx_json = rest.find("'{\"options\"")
        if idx_json == -1:
            idx_json = rest.find("'{\"options")
        
        prompt_raw = rest[:idx_json].strip()
        if prompt_raw.endswith(","):
            prompt_raw = prompt_raw[:-1].strip()
        if prompt_raw.startswith("'") and prompt_raw.endswith("'"):
            prompt_text = prompt_raw[1:-1].replace("''", "'")
        else:
            prompt_text = prompt_raw.replace("''", "'")
            
        rest_after_prompt = rest[idx_json:]
        idx_json_end = rest_after_prompt.find("'::jsonb")
        json_str = rest_after_prompt[1:idx_json_end].replace("''", "'")
        interaction_data = json.loads(json_str)
        
        rest_after_json = rest_after_prompt[idx_json_end + len("'::jsonb"):].strip()
        if rest_after_json.startswith(","):
            rest_after_json = rest_after_json[1:].strip()
            
        m_expl = re.match(r"^'((?:[^']|'')*)'\s*,\s*'((?:[^']|'')*)'\s*$", rest_after_json, re.DOTALL)
        if m_expl:
            explanation = m_expl.group(1).replace("''", "'")
            distractor_trap = m_expl.group(2).replace("''", "'")
        else:
            explanation = "Açıklama"
            distractor_trap = ""
            
        questions.append({
            "lesson": lesson,
            "topic": topic,
            "question_type": q_type,
            "difficulty": diff,
            "prompt_text": prompt_text,
            "options": interaction_data["options"],
            "correctIndex": interaction_data["correctIndex"],
            "explanation": explanation,
            "distractor_trap": distractor_trap,
        })
    return questions

def question_to_sql_insert_with_order(q: dict, order_index: int) -> str:
    lesson = escape_sql_str(q['lesson'])
    topic = escape_sql_str(q['topic'])
    q_type = escape_sql_str(q.get('question_type', 'multiple_choice'))
    diff = int(q.get('difficulty', 2))
    prompt = escape_sql_str(q['prompt_text'].strip())
    
    interaction_data = {
        "options": q['options'],
        "correctIndex": q['correctIndex']
    }
    interaction_json = escape_sql_str(json.dumps(interaction_data, ensure_ascii=False))
    explanation = escape_sql_str(q['explanation'].strip())
    distractor_trap = escape_sql_str(q['distractor_trap'].strip())
    
    sql = f"""insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  '{lesson}',
  '{topic}',
  '{q_type}',
  {diff},
  '{prompt}',
  '{interaction_json}'::jsonb,
  '{explanation}',
  '{distractor_trap}',
  {order_index}
);"""
    return sql

def main():
    print("=" * 70)
    print("KADRO KPSS LİSANS GENEL KÜLTÜR — TARİH SORU STANDARTLAŞTIRMA (TASK-84)")
    print("=" * 70)
    
    all_tarih_questions = []
    topic_questions_map = {}
    
    for cfg in TOPIC_CONFIGS:
        t_name = cfg["topic"]
        prefix = cfg["prefix"]
        topic_qs = []
        for fname in cfg["files"]:
            fpath = DOCS_TARIH_DIR / fname
            qs = parse_sql_file(fpath)
            topic_qs.extend(qs)
        
        print(f"\n📖 Konu: {t_name} — Okunan Soru Sayısı: {len(topic_qs)}")
        
        # Assign order_index and id
        for idx, q in enumerate(topic_qs, 1):
            q["orderIndex"] = idx
            q["order_index"] = idx
            q["id"] = f"{prefix}_{idx:03d}"
            # Validate
            assert len(q["options"]) == 5, f"{q['id']} şık sayısı 5 değil!"
            assert 0 <= q["correctIndex"] <= 4, f"{q['id']} doğru şık geçersiz!"
            assert q["prompt_text"], f"{q['id']} soru metni boş!"
            assert q["explanation"], f"{q['id']} açıklama boş!"
        
        topic_questions_map[t_name] = topic_qs
        all_tarih_questions.extend(topic_qs)
        
        # Write back updated single files if needed or master file
        print(f"  ✓ {t_name} için {len(topic_qs)} soru order_index (1..{len(topic_qs)}) ile numaralandırıldı.")

    print(f"\n🎯 Toplam Tarih Sorusu: {len(all_tarih_questions)}")
    assert len(all_tarih_questions) == 620, f"Beklenen 620 soru, bulunan: {len(all_tarih_questions)}"
    
    # -----------------------------------------------------------------
    # 1. 00_tum_tarih_sorulari_tek_dosya.sql Üret
    # -----------------------------------------------------------------
    master_sql_path = DOCS_TARIH_DIR / "00_tum_tarih_sorulari_tek_dosya.sql"
    master_lines = [
        "-- =============================================================",
        "-- KADRO KPSS LİSANS GENEL KÜLTÜR — TÜM TARİH SORULARI (MASTER)",
        f"-- Toplam: 7 Konu x Değişen Test Sayısı = {len(all_tarih_questions)} Özgün Soru",
        "-- Hedef Tablo: public.questions (Supabase)",
        "-- UWorld Modeli: prompt_text, options, correctIndex, explanation, distractor_trap, order_index",
        "-- =============================================================",
        "BEGIN;\n"
    ]
    
    for cfg in TOPIC_CONFIGS:
        t_name = cfg["topic"]
        qs = topic_questions_map[t_name]
        master_lines.append(f"\n-- -------------------------------------------------------------")
        master_lines.append(f"-- {t_name.upper()} ({len(qs)} SORU)")
        master_lines.append(f"-- -------------------------------------------------------------\n")
        
        for idx, q in enumerate(qs, 1):
            master_lines.append(f"-- Soru #{idx:03d} (Zorluk: {q['difficulty']})")
            master_lines.append(question_to_sql_insert_with_order(q, idx))
            master_lines.append("")
            
    master_lines.append("COMMIT;\n")
    master_sql_content = "\n".join(master_lines)
    
    with open(master_sql_path, "w", encoding="utf-8") as f:
        f.write(master_sql_content)
    print(f"\n✓ 00_tum_tarih_sorulari_tek_dosya.sql yazıldı ({len(master_sql_content.encode('utf-8'))} bayt).")
    
    # -----------------------------------------------------------------
    # 2. sample_questions.json Güncelle (Offline-First Entegrasyonu)
    # -----------------------------------------------------------------
    print("\n📦 sample_questions.json GÜNCELLENİYOR...")
    with open(SAMPLE_QUESTIONS_PATH, "r", encoding="utf-8") as f:
        existing_sample = json.load(f)
    
    # Filter out old Tarih placeholder questions
    non_tarih_questions = [q for q in existing_sample if q.get("lesson") != "Tarih"]
    print(f"  Mevcut diğer ders soruları: {len(non_tarih_questions)} (Coğrafya, Vatandaşlık, Güncel)")
    
    # Prepare Tarih questions for sample_questions.json format
    # Match the schema used by Question.fromJson:
    # {
    #   "id": ..., "lesson": "Tarih", "topic": ..., "prompt": ...,
    #   "options": [...], "correctIndex": ..., "explanation": ...,
    #   "difficultyLevel": ..., "distractor_trap": ..., "order_index": ...
    # }
    formatted_tarih_for_json = []
    for q in all_tarih_questions:
        formatted_tarih_for_json.append({
            "id": q["id"],
            "lesson": "Tarih",
            "topic": q["topic"],
            "text": q["prompt_text"],
            "prompt_text": q["prompt_text"],
            "prompt": q["prompt_text"],
            "options": q["options"],
            "correctIndex": q["correctIndex"],
            "explanation": q["explanation"],
            "difficultyLevel": q["difficulty"],
            "difficulty": "orta" if q["difficulty"] == 2 else ("kolay" if q["difficulty"] == 1 else "zor"),
            "distractor_trap": q["distractor_trap"],
            "distractorTrap": q["distractor_trap"],
            "order_index": q["order_index"],
            "orderIndex": q["order_index"],
        })
        
    combined_questions = non_tarih_questions + formatted_tarih_for_json
    print(f"  Yeni toplam soru sayısı: {len(combined_questions)} (Eski: {len(existing_sample)})")
    
    with open(SAMPLE_QUESTIONS_PATH, "w", encoding="utf-8") as f:
        json.dump(combined_questions, f, ensure_ascii=False, indent=2)
        
    print(f"✓ sample_questions.json başarıyla güncellendi!")

if __name__ == "__main__":
    main()
