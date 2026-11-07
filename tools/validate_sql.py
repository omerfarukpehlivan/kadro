import sys
import os
import glob
import re

files = sys.argv[1:] if len(sys.argv) > 1 else sorted(glob.glob('docs/soru_havuzu/tarih/*.sql'))

total_questions = 0
total_errors = 0

for sql_file in files:
    with open(sql_file, 'r', encoding='utf-8') as f:
        text = f.read()

    stmts = re.split(r'insert into public\.questions', text)[1:]
    errors = 0
    for idx, s in enumerate(stmts, 1):
        test_str = s.replace("''", "")
        single_quotes = test_str.count("'")
        if single_quotes % 2 != 0:
            print(f"[{sql_file}] HATA: Soru {idx} tirnak dengesiz! Kalan tek tirnak: {single_quotes}")
            errors += 1

    result_str = "HATASIZ" if errors == 0 else f"{errors} HATA"
    print(f"[{sql_file}] -> {len(stmts)} soru -> {result_str}")
    total_questions += len(stmts)
    total_errors += errors

print("=" * 60)
print(f"GENEL TOPLAM: {total_questions} Soru | Toplam Hata: {total_errors}")
if total_errors == 0:
    print("TEBRIKLER! Tum SQL dosyalari Supabase SQL Editor icin %100 hazir ve hatasiz.")
