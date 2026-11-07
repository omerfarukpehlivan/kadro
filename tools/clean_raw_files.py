import glob
import json
import os
import re

def clean_str(s: str) -> str:
    if not s or not isinstance(s, str):
        return s

    # 1. LaTeX okları
    s = re.sub(r'\$(\\rightarrow|\\Rightarrow|\\to)\$', ' → ', s)
    s = re.sub(r'\\(rightarrow|Rightarrow|to)\b', ' → ', s)
    s = s.replace('&rarr;', ' → ')
    s = re.sub(r'\s*-->\s*', ' → ', s)
    s = re.sub(r'\s*->\s*', ' → ', s)

    # 2. LaTeX sol okları
    s = re.sub(r'\$(\\leftarrow|\\Leftarrow)\$', ' ← ', s)
    s = re.sub(r'\\(leftarrow|Leftarrow)\b', ' ← ', s)
    s = s.replace('&larr;', ' ← ')
    s = re.sub(r'\s*<--\s*', ' ← ', s)
    s = re.sub(r'\s*<-\s*', ' ← ', s)

    # 3. LaTeX inline math dolar işaretleri
    s = re.sub(r'\$([^$]+)\$', r'\1', s)

    # 4. Markdown kalın ve altı çizili
    s = re.sub(r'\*\*(.+?)\*\*', r'\1', s)
    s = re.sub(r'__(.+?)__', r'\1', s)
    s = s.replace('**', '')

    # 5. Markdown italik ve tırnak
    s = re.sub(r'\*"(.+?)"\*', r'"\1"', s)
    s = re.sub(r'\*([^*\n]+)\*', r'\1', s)

    # 6. Çift tırnak kalıntıları
    s = s.replace('\\"', '"')
    s = re.sub(r'"{2,}', '"', s)

    # 7. Fazla boşlukları temizle
    lines = s.split('\n')
    lines = [re.sub(r'[ \t]{2,}', ' ', l).strip() for l in lines]
    s = '\n'.join(lines).strip()
    return s

def clean_json_file(path: str):
    if not os.path.exists(path):
        print(f"File not found: {path}, skipping.")
        return
    print(f"Cleaning JSON: {path}")
    with open(path, 'r', encoding='utf-8') as f:
        data = json.load(f)

    def walk(obj):
        if isinstance(obj, dict):
            for k, v in obj.items():
                if isinstance(v, str):
                    obj[k] = clean_str(v)
                else:
                    walk(v)
        elif isinstance(obj, list):
            for i in range(len(obj)):
                if isinstance(obj[i], str):
                    obj[i] = clean_str(obj[i])
                else:
                    walk(obj[i])

    walk(data)

    with open(path, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=2)
    print(f"Cleaned JSON successfully: {path}")

def clean_sql_files():
    files = sorted(glob.glob('docs/soru_havuzu/tarih/*.sql'))
    for sql_file in files:
        with open(sql_file, 'r', encoding='utf-8') as f:
            lines = f.readlines()

        new_lines = []
        for line in lines:
            if line.strip().startswith('--'):
                new_lines.append(line)
                continue

            l = line
            # $\rightarrow$ ve \rightarrow temizliği
            l = re.sub(r'\$(\\rightarrow|\\Rightarrow|\\to)\$', ' → ', l)
            l = re.sub(r'\\(rightarrow|Rightarrow|to)\b', ' → ', l)
            # Başıboş veya sarmallı ** temizliği
            l = re.sub(r'\*\*([^\*\r\n]+)\*\*', r'\1', l)
            l = l.replace('**', '')
            # Tırnak kalıntıları (SQL tek tırnak kaçışlarına dokunmadan)
            l = re.sub(r'""+', '"', l)

            new_lines.append(l)

        with open(sql_file, 'w', encoding='utf-8') as f:
            f.writelines(new_lines)
        print(f"Cleaned SQL: {sql_file}")

if __name__ == '__main__':
    clean_json_file('assets/data/questions/sample_questions.json')
    clean_sql_files()
    print("All files cleaned successfully!")
