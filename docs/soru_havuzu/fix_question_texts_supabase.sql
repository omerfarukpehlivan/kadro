-- ==============================================================================
-- Kadro KPSS: public.questions Metin Sanitizasyonu (TASK-76)
-- Soru havuzundaki LaTeX ($\rightarrow$, arrow), Markdown (**...**) ve
-- gereksiz tırnak kalıntılarını temizleyen güvenli SQL UPDATE komutları.
-- Supabase Dashboard -> SQL Editor üzerinden tek seferde çalıştırılabilir.
-- ==============================================================================

-- 1. prompt_text (Soru Kökü) Temizliği
UPDATE public.questions
SET prompt_text = regexp_replace(
  regexp_replace(
    regexp_replace(
      regexp_replace(
        regexp_replace(
          regexp_replace(
            regexp_replace(
              prompt_text,
              '\$(\\rightarrow|\\Rightarrow|\\to)\$', ' → ', 'g'
            ),
            '\\(rightarrow|Rightarrow|to)\b', ' → ', 'g'
          ),
          '-->|->|&rarr;', ' → ', 'g'
        ),
        '\$(\\leftarrow|\\Leftarrow)\$', ' ← ', 'g'
      ),
      '\\(leftarrow|Leftarrow)\b|<--|<-|&larr;', ' ← ', 'g'
    ),
    '\*\*([^\*]+)\*\*', '\1', 'g'
  ),
  '__([^_]+)__', '\1', 'g'
)
WHERE prompt_text ~ '(\\rightarrow|\\Rightarrow|\\to|->|\*\*|__)';

-- 2. explanation (Çözüm Açıklaması) Temizliği
UPDATE public.questions
SET explanation = regexp_replace(
  regexp_replace(
    regexp_replace(
      regexp_replace(
        regexp_replace(
          regexp_replace(
            regexp_replace(
              explanation,
              '\$(\\rightarrow|\\Rightarrow|\\to)\$', ' → ', 'g'
            ),
            '\\(rightarrow|Rightarrow|to)\b', ' → ', 'g'
          ),
          '-->|->|&rarr;', ' → ', 'g'
        ),
        '\$(\\leftarrow|\\Leftarrow)\$', ' ← ', 'g'
      ),
      '\\(leftarrow|Leftarrow)\b|<--|<-|&larr;', ' ← ', 'g'
    ),
    '\*\*([^\*]+)\*\*', '\1', 'g'
  ),
  '__([^_]+)__', '\1', 'g'
)
WHERE explanation ~ '(\\rightarrow|\\Rightarrow|\\to|->|\*\*|__)';

-- 3. distractor_trap (ÖSYM Çeldirici Tuzağı) Temizliği
UPDATE public.questions
SET distractor_trap = regexp_replace(
  regexp_replace(
    regexp_replace(
      regexp_replace(
        regexp_replace(
          regexp_replace(
            regexp_replace(
              distractor_trap,
              '\$(\\rightarrow|\\Rightarrow|\\to)\$', ' → ', 'g'
            ),
            '\\(rightarrow|Rightarrow|to)\b', ' → ', 'g'
          ),
          '-->|->|&rarr;', ' → ', 'g'
        ),
        '\$(\\leftarrow|\\Leftarrow)\$', ' ← ', 'g'
      ),
      '\\(leftarrow|Leftarrow)\b|<--|<-|&larr;', ' ← ', 'g'
    ),
    '\*\*([^\*]+)\*\*', '\1', 'g'
  ),
  '__([^_]+)__', '\1', 'g'
)
WHERE distractor_trap IS NOT NULL AND distractor_trap ~ '(\\rightarrow|\\Rightarrow|\\to|->|\*\*|__)';

-- 4. interaction_data (JSONB Seçenekler) Temizliği
UPDATE public.questions
SET interaction_data = jsonb_set(
  interaction_data,
  '{options}',
  (
    SELECT jsonb_agg(
      to_jsonb(
        regexp_replace(
          regexp_replace(
            opt.value#>>'{}',
            '\$(\\rightarrow|\\Rightarrow|\\to)\$|\\(rightarrow|Rightarrow|to)\b|-->|->|&rarr;',
            ' → ',
            'g'
          ),
          '\*\*([^\*]+)\*\*',
          '\1',
          'g'
        )
      )
    )
    FROM jsonb_array_elements(interaction_data->'options') AS opt
  )
)
WHERE interaction_data ? 'options'
  AND interaction_data::text ~ '(\\rightarrow|\\Rightarrow|\\to|->|\*\*)';

-- 5. Başıboş kalan ** ve çift tırnak temizlikleri
UPDATE public.questions
SET prompt_text = replace(replace(prompt_text, '**', ''), '""', '"')
WHERE prompt_text LIKE '%**%' OR prompt_text LIKE '%""%';

UPDATE public.questions
SET explanation = replace(replace(explanation, '**', ''), '""', '"')
WHERE explanation LIKE '%**%' OR explanation LIKE '%""%';

UPDATE public.questions
SET distractor_trap = replace(replace(distractor_trap, '**', ''), '""', '"')
WHERE distractor_trap IS NOT NULL AND (distractor_trap LIKE '%**%' OR distractor_trap LIKE '%""%');
