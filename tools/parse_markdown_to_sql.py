"""
Kadro Soru Havuzu Markdown -> Supabase SQL Dönüştürücü Script
docs/soru_havuzu/ altındaki markdown soru dosyalarını okur ve
Supabase 'public.questions' tablosuna aktarılabilecek hazır .sql dosyasını üretir.
TASK-76 kapsamında LaTeX, Markdown ve çift tırnak temizliği entegre edilmiştir.
"""

import json
import os
import re
import sys

def clean_str(s: str) -> str:
    if not s or not isinstance(s, str):
        return s

    s = re.sub(r'\$(\\rightarrow|\\Rightarrow|\\to)\$', ' → ', s)
    s = re.sub(r'\\(rightarrow|Rightarrow|to)\b', ' → ', s)
    s = s.replace('&rarr;', ' → ')
    s = re.sub(r'\s*-->\s*', ' → ', s)
    s = re.sub(r'\s*->\s*', ' → ', s)

    s = re.sub(r'\$(\\leftarrow|\\Leftarrow)\$', ' ← ', s)
    s = re.sub(r'\\(leftarrow|Leftarrow)\b', ' ← ', s)
    s = s.replace('&larr;', ' ← ')
    s = re.sub(r'\s*<--\s*', ' ← ', s)
    s = re.sub(r'\s*<-\s*', ' ← ', s)

    s = re.sub(r'\$([^$]+)\$', r'\1', s)
    s = re.sub(r'\*\*(.+?)\*\*', r'\1', s)
    s = re.sub(r'__(.+?)__', r'\1', s)
    s = s.replace('**', '')

    s = re.sub(r'\*"(.+?)"\*', r'"\1"', s)
    s = re.sub(r'\*([^*\n]+)\*', r'\1', s)

    s = s.replace('\\"', '"')
    s = re.sub(r'"{2,}', '"', s)

    lines = s.split('\n')
    lines = [re.sub(r'[ \t]{2,}', ' ', l).strip() for l in lines]
    return '\n'.join(lines).strip()

def parse_markdown_questions(md_file_path):
    with open(md_file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    question_blocks = re.split(r'\n(?=### Soru\s+)', content)
    questions = []

    for block in question_blocks:
        if not block.strip().startswith('### Soru'):
            continue

        q_id_match = re.search(r'### Soru\s+([a-zA-Z0-9_-]+)', block)
        lesson_match = re.search(r'-\s*\*\*Ders:\*\*\s*(.+)', block)
        topic_match = re.search(r'-\s*\*\*Konu:\*\*\s*(.+)', block)
        diff_match = re.search(r'-\s*\*\*Zorluk:\*\*\s*(.+)', block)

        correct_idx_match = re.search(r'\*\*Doğru Cevap:\*\*\s*[A-E]\s*\(İndeks:\s*([0-4])\)', block)
        if not correct_idx_match:
            correct_idx_match = re.search(r'\*\*Doğru Cevap:\*\*\s*([A-E])', block)
            if correct_idx_match:
                char_to_idx = {'A': 0, 'B': 1, 'C': 2, 'D': 3, 'E': 4}
                correct_idx = char_to_idx[correct_idx_match.group(1)]
            else:
                correct_idx = None
        else:
            correct_idx = int(correct_idx_match.group(1))

        exp_match = re.search(r'\*\*Açıklama:\*\*\s*\n(.*?)\n\s*\*\*⚠️ ÖSYM Çeldirici Tuzağı:\*\*', block, re.DOTALL)
        trap_match = re.search(r'\*\*⚠️ ÖSYM Çeldirici Tuzağı:\*\*\s*\n(.*?)(?=\n---|\Z)', block, re.DOTALL)

        q_body_match = re.search(r'\*\*Soru Metni:\*\*\s*\n(.*?)\n\s*\*\*Doğru Cevap:\*\*', block, re.DOTALL)
        if not q_body_match:
            continue

        q_body = q_body_match.group(1).strip()
        
        options_matches = re.findall(r'-\s*\*\*([A-E])\)\*\*\s*(.+)', q_body)
        if len(options_matches) != 5:
            options_matches = re.findall(r'-\s*\[?([A-E])\]?[:\.\)]\s*(.+)', q_body)

        options = [clean_str(opt[1].strip()) for opt in options_matches]

        split_point = re.search(r'\n-\s*\*\*A\)\*\*', q_body)
        if not split_point:
            split_point = re.search(r'\n-\s*\[?A\]?[:\.\)]', q_body)
            
        prompt_text = q_body[:split_point.start()].strip() if split_point else q_body

        if q_id_match and prompt_text and len(options) == 5 and correct_idx is not None:
            diff_str = (diff_match.group(1).strip() if diff_match else 'medium').lower()
            diff_num = 1 if 'easy' in diff_str else (3 if 'hard' in diff_str else 2)

            q_obj = {
                'id': q_id_match.group(1).strip(),
                'lesson': lesson_match.group(1).strip() if lesson_match else 'Tarih',
                'topic': topic_match.group(1).strip() if topic_match else 'Genel',
                'difficulty': diff_num,
                'prompt_text': clean_str(prompt_text),
                'options': options,
                'correctIndex': correct_idx,
                'explanation': clean_str(exp_match.group(1).strip()) if exp_match else '',
                'distractor_trap': clean_str(trap_match.group(1).strip()) if trap_match else ''
            }
            questions.append(q_obj)
        else:
            print(f"Uyarı: Blok tam çözümlenemedi -> {q_id_match.group(1) if q_id_match else 'Bilinmeyen'}")

    return questions

def generate_sql(questions, output_sql_path):
    sql_statements = []
    sql_statements.append("-- ==========================================================================")
    sql_statements.append(f"-- KADRO SORU HAVUZU SUPABASE SQL MIGRATION ({len(questions)} Soru)")
    sql_statements.append("-- ==========================================================================\n")

    for q in questions:
        interaction_json = json.dumps({
            "options": q['options'],
            "correctIndex": q['correctIndex']
        }, ensure_ascii=False).replace("'", "''")

        prompt_esc = q['prompt_text'].replace("'", "''")
        exp_esc = q['explanation'].replace("'", "''")
        trap_esc = q['distractor_trap'].replace("'", "''")

        stmt = f"""insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  '{q['lesson']}',
  '{q['topic']}',
  'multiple_choice',
  {q['difficulty']},
  '{prompt_esc}',
  '{interaction_json}'::jsonb,
  '{exp_esc}',
  '{trap_esc}'
);"""
        sql_statements.append(stmt)

    with open(output_sql_path, 'w', encoding='utf-8') as f:
        f.write("\n\n".join(sql_statements))
    
    print(f"Basariyla {len(questions)} soru SQL olarak kaydedildi: {output_sql_path}")

if __name__ == '__main__':
    md_path = 'docs/soru_havuzu/tarih/01_islamiyet_oncesi_turk_tarihi.md'
    sql_path = 'docs/soru_havuzu/tarih/01_islamiyet_oncesi_turk_tarihi.sql'
    qs = parse_markdown_questions(md_path)
    print(f"Ayristirilan Gecerli Soru Sayisi: {len(qs)}")
    if qs:
        generate_sql(qs, sql_path)
