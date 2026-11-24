-- ==========================================================================
-- 12 · Matematik şekilleri (TASK-172)
-- Sorulara tema uyumlu SVG şekil alanı ekler. Şekiller elle yazılmaz; JSON tariften
-- tools/math/compile_questions.mjs ile üretilir (docs/soru_havuzu/matematik/FORMAT.md).
--
-- SVG kuralları (mobil flutter_svg ve web aynı kuralı uygular):
--   * Renk yok: çizgi/yazı `currentColor`, dolgular `fill-opacity` ile → açık/koyu temaya uyar.
--   * Yalnızca svg, g, path, line, polyline, polygon, circle, rect, text etiketleri.
--   * Betik, bağlantı, dış kaynak, olay özniteliği ve stil yasak (aşağıdaki CHECK).
-- Uygulama: Supabase SQL Editor'da bir kez çalıştırın; tekrar çalıştırmak güvenlidir.
-- ==========================================================================

alter table public.questions
  add column if not exists figure_svg text;

comment on column public.questions.figure_svg is
  'TASK-172: Soru şekli (güvenli, currentColor kullanan SVG). tools/math/compile_questions.mjs üretir; elle düzenlemeyin.';

alter table public.questions
  drop constraint if exists questions_figure_svg_safe;

alter table public.questions
  add constraint questions_figure_svg_safe check (
    figure_svg is null
    or (
      length(figure_svg) <= 60000
      and figure_svg like '<svg %'
      and figure_svg !~* '(<script|<foreignobject|<image|<use|<style|<a[[:space:]>]|<iframe|<!|<\?|&#|javascript:|data:|url\(|href[[:space:]]*=|[[:space:]]on[a-z]+[[:space:]]*=)'
    )
  );

-- --------------------------------------------------------------------------
-- Konu anlatımında artık $...$ matematik olarak çizilir. Daha önce yayımlanan iki
-- kimya formülü, eğik matematik harfi yerine dik yazılsın diye \mathrm{} içine alınır
-- (kaynak .md ve konu_anlatimi/cografya_02.sql, cografya_04.sql ile aynı içerik).
-- JSON metninde ters bölü \\ olarak saklanır.
update public.topic_lesson_units
   set blocks = replace(blocks::text, '($Fe_2O_3$)',    '($\\mathrm{Fe_2O_3}$)')::jsonb,
       updated_at = now()
 where blocks::text like '%($Fe_2O_3$)%';

update public.topic_lesson_units
   set blocks = replace(blocks::text, 'zehirli $H_2S$ gazı', 'zehirli $\\mathrm{H_2S}$ gazı')::jsonb,
       updated_at = now()
 where blocks::text like '%zehirli $H_2S$ gazı%';

-- Doğrulama (beklenen: figure_svg | text | YES)
-- select column_name, data_type, is_nullable from information_schema.columns
--  where table_schema = 'public' and table_name = 'questions' and column_name = 'figure_svg';
