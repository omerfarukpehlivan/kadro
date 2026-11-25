-- ==========================================================================
-- KADRO SORU HAVUZU · Matematik & Geometri · Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik (40 soru)
-- Kaynak: docs/soru_havuzu/matematik/09_kumeler_baginti_fonksiyon_ve_moduler_aritmetik.md · Üretici: tools/math/compile_questions.mjs (elle düzenlemeyin)
-- Önkoşul: docs/supabase_migrations/12_math_figures.sql
-- İdempotent: soru kimlikleri sabit UUID'dir; dosya tekrar çalıştırılırsa sorular güncellenir.
-- ==========================================================================

insert into public.questions (
  id, lesson, topic, question_type, difficulty, prompt_text, interaction_data,
  explanation, distractor_trap, exam_scopes, education_level, figure_svg, is_active
) values
  -- mat-09-001 · doğrulandı
  ('1b85ac11-ffa3-50d2-ac06-71020d37d2cd'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 1,
   '$$A = \{1, 2, 3, 4, 5, 6\}$$
kümesinin alt kümelerinin kaç tanesinde $1$ elemanı bulunur ancak $2$ elemanı bulunmaz?',
   '{"options":["16","15","24","32","64"],"correctIndex":0}'::jsonb,
   'Alt kümede $1$''in bulunması ve $2$''nin bulunmaması kesin olduğu için karar vereceğimiz elemanlar geriye kalan $\{3, 4, 5, 6\}$ kümesinin $4$ elemanıdır. Bu $4$ elemanla oluşturulabilecek her alt kümeye $1$ eklendiğinde istenen koşulu sağlayan $2^4 = 16$ tane alt küme elde edilir.',
   'D şıkkı (32), yalnızca bir eleman için şart varmış gibi $2^5 = 32$ hesaplayan adayı; B şıkkı (15) ise öz alt küme sorusu sanıp $1$ çıkaranları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-002 · şekilli · doğrulandı
  ('d9a71e6b-44c0-5133-b0d4-1b8d0488d11d'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   'Şekildeki Venn şemasında her bölgedeki eleman sayısı verilmiştir. Evrensel küme $s(E) = 28$ olduğuna göre $s(A \setminus B)$ kaçtır?',
   '{"options":["6","7","8","10","12"],"correctIndex":2}'::jsonb,
   'Venn şemasındaki tüm ayrık bölgelerin eleman sayıları toplamı evrensel kümeyi verir: $(x + 2) + 4 + (2x - 1) + 5 = 28 \Rightarrow 3x + 10 = 28 \Rightarrow 3x = 18 \Rightarrow x = 6$. $A \setminus B$ bölgesi yalnızca $A$''ya ait bölge olduğundan $s(A \setminus B) = x + 2 = 6 + 2 = 8$ bulunur.',
   'A şıkkı (6), $x = 6$ değerini bulduktan sonra $x + 2$ yerine $x$''i işaretleyen; E şıkkı (12) ise $s(A \setminus B)$ yerine $s(A) = 8 + 4 = 12$''yi seçen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 210" width="320" height="210" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><rect x="4" y="4" width="312" height="202" rx="6" stroke-width="1.4"/><text x="18" y="24.9" fill="currentColor" stroke="none" text-anchor="start" font-weight="600">E</text><circle cx="115" cy="105" r="70" fill="currentColor" fill-opacity="0.06"/><text x="63" y="35.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="205" cy="105" r="70" fill="currentColor" fill-opacity="0.06"/><text x="257" y="35.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="80" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">x + 2</text><text x="160" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4</text><text x="240" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">2x − 1</text><text x="294" y="194.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">5</text></svg>', true),
  -- mat-09-003 · doğrulandı
  ('b5447dd6-9c94-5a77-8631-b4108f597520'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   '$32$ kişilik bir sınıfta İngilizce bilenlerin sayısı, Almanca bilenlerin sayısının $2$ katıdır. Bu sınıfta her iki dili de bilen $5$ kişi, iki dili de bilmeyen $4$ kişi vardır.
Buna göre bu sınıfta yalnızca İngilizce bilen kaç kişi vardır?',
   '{"options":["11","14","16","17","22"],"correctIndex":3}'::jsonb,
   'İki dili de bilmeyen $4$ kişi çıkarılırsa en az bir dil bilenlerin sayısı $s(I \cup A) = 32 - 4 = 28$ olur. Almanca bilenlere $x$ denirse İngilizce bilenler $2x$ olur. Birleşim formülü yazılır: $s(I \cup A) = s(I) + s(A) - s(I \cap A) \Rightarrow 28 = 2x + x - 5 \Rightarrow 3x = 33 \Rightarrow x = 11$. İngilizce bilenler $2 \cdot 11 = 22$ kişidir; bunların $5$''i Almanca da bildiği için yalnızca İngilizce bilen $22 - 5 = 17$ kişi bulunur.',
   'E şıkkı (22), İngilizce bilenlerin tamamını ($2x = 22$) bulup kesişimdeki $5$ kişiyi çıkarmayı unutan adayı yakalar. Soru "yalnızca İngilizce" bilenleri sormaktadır.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-004 · şekilli · doğrulandı
  ('07e7b370-a5aa-5d7d-97c7-861c02054ee0'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 3,
   'Şekildeki üç kümeli Venn şemasında her bölgeye ait eleman sayısı yazılmıştır. $s(A \cup B) = 19$ olduğuna göre $s(E)$ kaçtır?',
   '{"options":["25","26","27","28","29"],"correctIndex":4}'::jsonb,
   '$A \cup B$ kümesi $A$ veya $B$ çemberlerinin içinde kalan tüm bölgeleri kapsar: $s(A \cup B) = 5 + 4 + 3 + 2 + 1 + x = 15 + x$. Verilen $15 + x = 19$ eşitliğinden $x = 4$ bulunur. Evrensel küme $E$, şemadaki tüm bölgelerin toplamıdır: $s(E) = 19 + 6 + 4 = 29$ olur.',
   'B şıkkı (26), $A \cup B$''yi hesaplarken $C$ ile ortak olan $AC$ ($2$) ve $BC$ ($1$) bölgelerini dışarıda bırakıp $x$''i $7$ bularak sonraki toplamda hata yapan veya dıştaki $4$''ü eklemeyi unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 270" width="320" height="270" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><rect x="4" y="4" width="312" height="262" rx="6" stroke-width="1.4"/><text x="18" y="24.9" fill="currentColor" stroke="none" text-anchor="start" font-weight="600">E</text><circle cx="120" cy="100" r="70" fill="currentColor" fill-opacity="0.06"/><text x="62" y="42.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="200" cy="100" r="70" fill="currentColor" fill-opacity="0.06"/><text x="258" y="42.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><circle cx="160" cy="165" r="70" fill="currentColor" fill-opacity="0.06"/><text x="160" y="249.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="92" y="86.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">5</text><text x="228" y="86.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4</text><text x="160" y="204.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6</text><text x="160" y="76.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">3</text><text x="118" y="146.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">2</text><text x="202" y="146.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">1</text><text x="160" y="122.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">x</text><text x="294" y="254.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4</text></svg>', true),
  -- mat-09-005 · doğrulandı
  ('7599b060-a926-5aa6-bc54-f104605cd8a7'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 1,
   'Gerçel sayılar kümesinde tanımlı $f$ fonksiyonu için
$$f(2x - 3) = 4x + 5$$
eşitliği verilmektedir.
Buna göre $f(5)$ değeri kaçtır?',
   '{"options":["17","21","23","25","29"],"correctIndex":1}'::jsonb,
   'Parantez içinin $5$ olması için $2x - 3 = 5 \Rightarrow 2x = 8 \Rightarrow x = 4$ yazılmalıdır. Sağ tarafta $x = 4$ yerine konursa $f(5) = 4 \cdot 4 + 5 = 16 + 5 = 21$ bulunur.',
   'D şıkkı (25), $2x - 3 = 5$ eşitliğini çözmeden doğrudan $x$ yerine $5$ yazarak $4 \cdot 5 + 5 = 25$ hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-006 · doğrulandı
  ('908c3935-ac0a-539e-b0b5-87e621269f66'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   'Gerçel sayılarda tanımlı $f(x) = 3x - 2$ ve $g(x) = x^2 + 1$ fonksiyonları için
$$(f \circ g)(2) - (g \circ f)(1)$$
işleminin sonucu kaçtır?',
   '{"options":["11","9","7","5","3"],"correctIndex":0}'::jsonb,
   'Bileşke işlemlerinde içten dışa doğru gidilir:
$(f \circ g)(2) = f(g(2))$. Önce $g(2) = 2^2 + 1 = 5$, sonra $f(5) = 3 \cdot 5 - 2 = 13$.
$(g \circ f)(1) = g(f(1))$. Önce $f(1) = 3 \cdot 1 - 2 = 1$, sonra $g(1) = 1^2 + 1 = 2$.
Fark $13 - 2 = 11$ bulunur.',
   'C şıkkı (7) veya B şıkkı (9), bileşke sırasını karıştırıp $(f \circ g)(2)$ yerine $g(f(2)) = 4^2 + 1 = 17$ ya da çıkarma işleminde değerleri ters sırada alan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-007 · doğrulandı
  ('3921fc20-7003-55ff-bfb9-280f61226d58'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   'Uygun tanım kümesinde bire bir ve örten olan
$$f(x) = \dfrac{3x + 1}{x - 2}$$
fonksiyonu için $f^{-1}(4)$ değeri kaçtır?',
   '{"options":["$\\dfrac{13}{2}$","7","9","$-7$","$\\dfrac{7}{3}$"],"correctIndex":2}'::jsonb,
   '$f^{-1}(4) = a$ demek $f(a) = 4$ demektir. Denklem yazılırsa $\dfrac{3a + 1}{a - 2} = 4 \Rightarrow 3a + 1 = 4a - 8 \Rightarrow a = 9$ bulunur. (Kısa yoldan $f^{-1}(x) = \dfrac{2x + 1}{x - 3}$ yazılarak $x = 4$ için $\dfrac{9}{1} = 9$ da elde edilir.)',
   'A şıkkı ($\frac{13}{2}$), ters fonksiyon yerine doğrudan $f(4) = \dfrac{3 \cdot 4 + 1}{4 - 2} = \dfrac{13}{2}$ değerini hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-008 · şekilli · doğrulandı
  ('7dcdcced-0789-5020-9659-8bc23c26facf'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 3,
   'Şekildeki dik koordinat düzleminde $y = f(x)$ doğrusal fonksiyonunun grafiği $A(0, 3)$ ve $B(4, 0)$ noktalarından geçmektedir.
Buna göre $f(8) + f^{-1}(6)$ toplamı kaçtır?',
   '{"options":["$-1$","$-3$","$-5$","$-7$","1"],"correctIndex":3}'::jsonb,
   'Doğru eksenleri $(4, 0)$ ve $(0, 3)$ noktalarında kestiğinden denklemi $\dfrac{x}{4} + \dfrac{y}{3} = 1 \Rightarrow y = f(x) = 3 - \dfrac{3}{4}x$ olur.
$x = 8$ için $f(8) = 3 - \dfrac{3}{4} \cdot 8 = 3 - 6 = -3$ bulunur.
$f^{-1}(6) = k$ için $f(k) = 6 \Rightarrow 3 - \dfrac{3}{4}k = 6 \Rightarrow -\dfrac{3}{4}k = 3 \Rightarrow k = -4$ bulunur.
Toplam $-3 + (-4) = -7$''dir.',
   'A şıkkı ($-1$), $f^{-1}(6)$ yerine $f(6) = -\frac{3}{2}$ hesaplayan ya da $f^{-1}(6)$ adımında işaret hatası yaparak $k = +4$ alıp $-3 + 4 = 1$ (E şıkkı) bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 288.6 260" width="288.6" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><g stroke-width="0.6" stroke-opacity="0.25"><line x1="30" y1="230" x2="30" y2="30"/><line x1="58.6" y1="230" x2="58.6" y2="30"/><line x1="87.1" y1="230" x2="87.1" y2="30"/><line x1="115.7" y1="230" x2="115.7" y2="30"/><line x1="144.3" y1="230" x2="144.3" y2="30"/><line x1="172.9" y1="230" x2="172.9" y2="30"/><line x1="201.4" y1="230" x2="201.4" y2="30"/><line x1="230" y1="230" x2="230" y2="30"/><line x1="258.6" y1="230" x2="258.6" y2="30"/><line x1="30" y1="230" x2="258.6" y2="230"/><line x1="30" y1="201.4" x2="258.6" y2="201.4"/><line x1="30" y1="172.9" x2="258.6" y2="172.9"/><line x1="30" y1="144.3" x2="258.6" y2="144.3"/><line x1="30" y1="115.7" x2="258.6" y2="115.7"/><line x1="30" y1="87.1" x2="258.6" y2="87.1"/><line x1="30" y1="58.6" x2="258.6" y2="58.6"/><line x1="30" y1="30" x2="258.6" y2="30"/></g><line x1="24" y1="172.9" x2="268.6" y2="172.9"/><line x1="87.1" y1="236" x2="87.1" y2="20"/><path d="M268.6 172.9 l-7 -4 m7 4 l-7 4"/><path d="M87.1 20 l-4 7 m4 -7 l4 7"/><text x="272.6" y="189.8" fill="currentColor" stroke="none" text-anchor="end" font-style="italic">x</text><text x="99.1" y="22.9" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">y</text><g stroke-width="1.2"><line x1="30" y1="169.9" x2="30" y2="175.9"/><text x="30" y="190.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-2</text><line x1="58.6" y1="169.9" x2="58.6" y2="175.9"/><text x="58.6" y="190.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-1</text><line x1="115.7" y1="169.9" x2="115.7" y2="175.9"/><text x="115.7" y="190.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">1</text><line x1="144.3" y1="169.9" x2="144.3" y2="175.9"/><text x="144.3" y="190.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">2</text><line x1="172.9" y1="169.9" x2="172.9" y2="175.9"/><text x="172.9" y="190.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">3</text><line x1="201.4" y1="169.9" x2="201.4" y2="175.9"/><text x="201.4" y="190.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">4</text><line x1="230" y1="169.9" x2="230" y2="175.9"/><text x="230" y="190.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">5</text><line x1="258.6" y1="169.9" x2="258.6" y2="175.9"/><text x="258.6" y="190.7" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">6</text><line x1="84.1" y1="230" x2="90.1" y2="230"/><text x="81.1" y="233.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">-2</text><line x1="84.1" y1="201.4" x2="90.1" y2="201.4"/><text x="81.1" y="205.3" fill="currentColor" stroke="none" text-anchor="end" font-size="11">-1</text><line x1="84.1" y1="144.3" x2="90.1" y2="144.3"/><text x="81.1" y="148.1" fill="currentColor" stroke="none" text-anchor="end" font-size="11">1</text><line x1="84.1" y1="115.7" x2="90.1" y2="115.7"/><text x="81.1" y="119.6" fill="currentColor" stroke="none" text-anchor="end" font-size="11">2</text><line x1="84.1" y1="87.1" x2="90.1" y2="87.1"/><text x="81.1" y="91" fill="currentColor" stroke="none" text-anchor="end" font-size="11">3</text><line x1="84.1" y1="58.6" x2="90.1" y2="58.6"/><text x="81.1" y="62.4" fill="currentColor" stroke="none" text-anchor="end" font-size="11">4</text><line x1="84.1" y1="30" x2="90.1" y2="30"/><text x="81.1" y="33.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">5</text><text x="79.1" y="188.7" fill="currentColor" stroke="none" text-anchor="end" font-size="11">O</text></g><path d="M30 44.3L31 45L31.9 45.7L32.9 46.4L33.8 47.1L34.8 47.9L35.7 48.6L36.7 49.3L37.6 50L38.6 50.7L39.5 51.4L40.5 52.1L41.4 52.9L42.4 53.6L43.3 54.3L44.3 55L45.2 55.7L46.2 56.4L47.1 57.1L48.1 57.9L49 58.6L50 59.3L51 60L51.9 60.7L52.9 61.4L53.8 62.1L54.8 62.9L55.7 63.6L56.7 64.3L57.6 65L58.6 65.7L59.5 66.4L60.5 67.1L61.4 67.9L62.4 68.6L63.3 69.3L64.3 70L65.2 70.7L66.2 71.4L67.1 72.1L68.1 72.9L69 73.6L70 74.3L71 75L71.9 75.7L72.9 76.4L73.8 77.1L74.8 77.9L75.7 78.6L76.7 79.3L77.6 80L78.6 80.7L79.5 81.4L80.5 82.1L81.4 82.9L82.4 83.6L83.3 84.3L84.3 85L85.2 85.7L86.2 86.4L87.1 87.1L88.1 87.9L89 88.6L90 89.3L91 90L91.9 90.7L92.9 91.4L93.8 92.1L94.8 92.9L95.7 93.6L96.7 94.3L97.6 95L98.6 95.7L99.5 96.4L100.5 97.1L101.4 97.9L102.4 98.6L103.3 99.3L104.3 100L105.2 100.7L106.2 101.4L107.1 102.1L108.1 102.9L109 103.6L110 104.3L111 105L111.9 105.7L112.9 106.4L113.8 107.1L114.8 107.9L115.7 108.6L116.7 109.3L117.6 110L118.6 110.7L119.5 111.4L120.5 112.1L121.4 112.9L122.4 113.6L123.3 114.3L124.3 115L125.2 115.7L126.2 116.4L127.1 117.1L128.1 117.9L129 118.6L130 119.3L131 120L131.9 120.7L132.9 121.4L133.8 122.1L134.8 122.9L135.7 123.6L136.7 124.3L137.6 125L138.6 125.7L139.5 126.4L140.5 127.1L141.4 127.9L142.4 128.6L143.3 129.3L144.3 130L145.2 130.7L146.2 131.4L147.1 132.1L148.1 132.9L149 133.6L150 134.3L151 135L151.9 135.7L152.9 136.4L153.8 137.1L154.8 137.9L155.7 138.6L156.7 139.3L157.6 140L158.6 140.7L159.5 141.4L160.5 142.1L161.4 142.9L162.4 143.6L163.3 144.3L164.3 145L165.2 145.7L166.2 146.4L167.1 147.1L168.1 147.9L169 148.6L170 149.3L171 150L171.9 150.7L172.9 151.4L173.8 152.1L174.8 152.9L175.7 153.6L176.7 154.3L177.6 155L178.6 155.7L179.5 156.4L180.5 157.1L181.4 157.9L182.4 158.6L183.3 159.3L184.3 160L185.2 160.7L186.2 161.4L187.1 162.1L188.1 162.9L189 163.6L190 164.3L191 165L191.9 165.7L192.9 166.4L193.8 167.1L194.8 167.9L195.7 168.6L196.7 169.3L197.6 170L198.6 170.7L199.5 171.4L200.5 172.1L201.4 172.9L202.4 173.6L203.3 174.3L204.3 175L205.2 175.7L206.2 176.4L207.1 177.1L208.1 177.9L209 178.6L210 179.3L211 180L211.9 180.7L212.9 181.4L213.8 182.1L214.8 182.9L215.7 183.6L216.7 184.3L217.6 185L218.6 185.7L219.5 186.4L220.5 187.1L221.4 187.9L222.4 188.6L223.3 189.3L224.3 190L225.2 190.7L226.2 191.4L227.1 192.1L228.1 192.9L229 193.6L230 194.3L231 195L231.9 195.7L232.9 196.4L233.8 197.1L234.8 197.9L235.7 198.6L236.7 199.3L237.6 200L238.6 200.7L239.5 201.4L240.5 202.1L241.4 202.9L242.4 203.6L243.3 204.3L244.3 205L245.2 205.7L246.2 206.4L247.1 207.1L248.1 207.9L249 208.6L250 209.3L251 210L251.9 210.7L252.9 211.4L253.8 212.1L254.8 212.9L255.7 213.6L256.7 214.3L257.6 215L258.6 215.7" stroke-width="2.2"/><text x="56" y="54.2" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">f</text><circle cx="87.1" cy="87.1" r="3" fill="currentColor" stroke="none"/><text x="97.6" y="81.5" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="201.4" cy="172.9" r="3" fill="currentColor" stroke="none"/><text x="211.9" y="167.3" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text></svg>', true),
  -- mat-09-009 · doğrulandı
  ('bddcdd4d-2388-5955-a080-f1a68169333b'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 1,
   'Şu an saat $14{:}00$''ı göstermektedir.
Buna göre $100$ saat sonra saat kaçı gösterir?',
   '{"options":["16:00","18:00","19:00","20:00","22:00"],"correctIndex":1}'::jsonb,
   'Bir gün $24$ saat olduğundan saat $24$''ün katlarında aynı değeri gösterir. $100$ sayısının $24$ ile bölümünden kalan $100 = 24 \cdot 4 + 4$''tür. Şu anki saat olan $14{:}00$''a $4$ saat eklendiğinde saat $18{:}00$ bulunur.',
   'D şıkkı (20:00), mod $24$ yerine yanlış bölme yapıp kalanı $6$ sanan veya $14$''ten geriye giderek farklı bir saate ulaşan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-010 · doğrulandı
  ('e54a6215-c677-5de3-ba27-0e636c82f185'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   '$$2^{53}$$
sayısının $7$ ile bölümünden kalan kaçtır?',
   '{"options":["1","2","3","5","4"],"correctIndex":4}'::jsonb,
   '$2$''nin kuvvetlerinin $7$ ile bölümünden kalanlar incelenir:
$2^1 \equiv 2$ (mod $7$),
$2^2 \equiv 4$ (mod $7$),
$2^3 = 8 \equiv 1$ (mod $7$).
Kalan $1$ olduğu için periyot $3$''tür. Üs olan $53$, periyot $3$''e bölünür: $53 = 3 \cdot 17 + 2$. Dolayısıyla $2^{53} \equiv 2^2 = 4$ (mod $7$) bulunur.',
   'B şıkkı (2), periyodu $3$ almak yerine üs $53$''ü doğrudan bölen $7$''ye bölerek $53 = 7 \cdot 7 + 4$ (ya da mod $6$ alıp $2^5 = 32 \equiv 4$ yerine yanlış kalan) üzerinden hesap yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-011 · doğrulandı
  ('da848379-4428-518c-8054-4d4fde2e7f8f'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 1,
   '$A$ ve $B$ iki küme olmak üzere $s(A \setminus B) = 7$, $s(B \setminus A) = 9$ ve $s(A \cup B) = 21$''dir.
Buna göre $s(A \cap B)$ kaçtır?',
   '{"options":["2","4","5","7","16"],"correctIndex":2}'::jsonb,
   '$A \cup B$ kümesi üç ayrık bölgenin birleşimidir: $s(A \cup B) = s(A \setminus B) + s(A \cap B) + s(B \setminus A)$. Verilenler yerine konursa $21 = 7 + s(A \cap B) + 9 \Rightarrow s(A \cap B) = 21 - 16 = 5$ bulunur.',
   'E şıkkı (16), $A \setminus B$ ile $B \setminus A$''nın toplamını ($7 + 9 = 16$) bulup $21$''den çıkarmayı unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-012 · doğrulandı
  ('0b45e078-247a-5d6b-8df8-eaa44222dc8e'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 1,
   '$$A = \{1, 2, 3, 4, 5\} \quad \text{ve} \quad B = \{3, 4, 5, 6, 7\}$$
kümeleri verilmektedir.
Buna göre $A$ kümesinin alt kümelerinden kaç tanesi aynı zamanda $B$ kümesinin alt kümesi değildir?',
   '{"options":["8","16","23","24","25"],"correctIndex":3}'::jsonb,
   '$A$ kümesinin tüm alt kümelerinin sayısı $2^5 = 32$''dir. Hem $A$''nın hem de $B$''nin alt kümesi olan kümeler, yalnızca kesişim kümesi $A \cap B = \{3, 4, 5\}$''in alt kümeleridir ve sayısı $2^3 = 8$''dir. Dolayısıyla $B$''nin alt kümesi olmayan $A$ alt kümelerinin sayısı $32 - 8 = 24$ bulunur.',
   'A şıkkı ($8$), kesişim kümesinin alt küme sayısını bulup tümünden çıkarmayan; C şıkkı ($23$) ise boş kümeyi çıkarıp $2^5 - 1 - 8$ hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-013 · şekilli · doğrulandı
  ('b5e7755a-8f04-58bb-a9f4-878220265298'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   'Şekildeki Venn şemasında $26$ kişilik bir topluluğun A ve B etkinliklerine katılım sayıları gösterilmiştir.
Buna göre B etkinliğine katılan toplam kişi sayısı $s(B)$ kaçtır?',
   '{"options":["11","17","13","15","20"],"correctIndex":1}'::jsonb,
   'Tüm bölgelerin eleman sayıları toplamı evrensel kümeyi ($26$) verir: $x + 6 + (x + 4) + 2 = 26 \Rightarrow 2x + 12 = 26 \Rightarrow 2x = 14 \Rightarrow x = 7$. B kümesi hem yalnızca B ($x + 4 = 11$) hem de kesişim ($6$) bölgesini kapsadığından $s(B) = 11 + 6 = 17$ bulunur.',
   'A şıkkı (11), $s(B)$ yerine yalnızca B''ye katılanları ($s(B \setminus A) = 7 + 4 = 11$) işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 210" width="320" height="210" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><rect x="4" y="4" width="312" height="202" rx="6" stroke-width="1.4"/><text x="18" y="24.9" fill="currentColor" stroke="none" text-anchor="start" font-weight="600">E</text><circle cx="115" cy="105" r="70" fill="currentColor" fill-opacity="0.06"/><text x="63" y="35.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="205" cy="105" r="70" fill="currentColor" fill-opacity="0.06"/><text x="257" y="35.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="80" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">x</text><text x="160" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6</text><text x="240" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">x + 4</text><text x="294" y="194.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">2</text></svg>', true),
  -- mat-09-014 · doğrulandı
  ('97c88a89-4f1d-553f-b601-b9e4a7ba302b'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   '$1$''den $80$''e kadar olan doğal sayılar içinde $3$''ün katı olanların kümesi $A$, $5$''in katı olanların kümesi $B$''dir.
Buna göre $s(A \setminus B)$ kaçtır?',
   '{"options":["16","18","20","21","26"],"correctIndex":3}'::jsonb,
   '$1$ ile $80$ arasında $3$''ün katı olan $\lfloor 80 \div 3 \rfloor = 26$ tane sayı vardır ($s(A) = 26$). $A \cap B$ kümesi hem $3$''ün hem $5$''in katı yani $15$''in katı olan sayılardır: $\lfloor 80 \div 15 \rfloor = 5$ tane. $A \setminus B$, $A$''da olup $B$''de olmayanlar olduğundan $s(A \setminus B) = 26 - 5 = 21$ bulunur.',
   'E şıkkı (26), tüm $A$ kümesinin eleman sayısını bulup kesişimdeki $15$''in katlarını çıkarmayı unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-015 · doğrulandı
  ('cdc70e34-d150-5392-995a-d90364aad605'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 1,
   'Gerçel sayılarda tanımlı
$$f(x) = (a - 2)x + b + 3$$
fonksiyonu birim fonksiyon olduğuna göre $a \cdot b$ çarpımı kaçtır?',
   '{"options":["$-9$","$-6$","$0$","$6$","$9$"],"correctIndex":0}'::jsonb,
   'Birim fonksiyon her $x$ için $f(x) = x$ (yani $1 \cdot x + 0$) biçimindedir. Katsayılar eşitlenirse $a - 2 = 1 \Rightarrow a = 3$ ve sabit terim $b + 3 = 0 \Rightarrow b = -3$ bulunur. Çarpım $a \cdot b = 3 \cdot (-3) = -9$''dur.',
   'B şıkkı ($-6$), birim fonksiyonu sabit fonksiyonla ($f(x) = c$, $a - 2 = 0$) karıştırıp $a = 2$ alan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-016 · doğrulandı
  ('ef405e96-06b7-5da9-b255-509a1423bd72'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   'Gerçel sayılar kümesinde tanımlı $f$ parçalı fonksiyonu için
$x < 3$ iken $f(x) = 2x + 1$,
$x \ge 3$ iken $f(x) = x^2 - 4$
kuralları geçerlidir.
Buna göre $f(1) + f(4)$ toplamı kaçtır?',
   '{"options":["1","9","12","15","18"],"correctIndex":3}'::jsonb,
   '$1 < 3$ olduğundan $f(1)$ için ilk kural uygulanır: $f(1) = 2 \cdot 1 + 1 = 3$.
$4 \ge 3$ olduğundan $f(4)$ için ikinci kural uygulanır: $f(4) = 4^2 - 4 = 12$.
Toplam $f(1) + f(4) = 3 + 12 = 15$ bulunur.',
   'C şıkkı (12), $f(1)$''i hesaplarken ikinci kuralı kullanıp $1^2 - 4 = -3$ veya $f(1)$''i toplamaya katmayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-017 · şekilli · doğrulandı
  ('aa988cb8-4a02-5dea-b747-52f36f9bf2f5'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   'Şekildeki dik koordinat düzleminde grafiği verilen $f(x) = a(x^2 - 4)$ parabolü $A(-2, 0)$, $B(2, 0)$ ve $C(0, -4)$ noktalarından geçmektedir.
Buna göre $(f \circ f)(1)$ değeri kaçtır?',
   '{"options":["$-3$","$0$","$5$","$9$","$12$"],"correctIndex":2}'::jsonb,
   '$C(0, -4)$ noktası denklemde yerine konursa $f(0) = a(0 - 4) = -4 \Rightarrow a = 1$ bulunur; yani $f(x) = x^2 - 4$''tür. İstenen bileşke değerde önce $f(1) = 1^2 - 4 = -3$ hesaplanır, ardından $f(-3) = (-3)^2 - 4 = 9 - 4 = 5$ bulunur.',
   'A şıkkı ($-3$), yalnızca $f(1) = -3$''ü bulup ikinci kez $f$''ye uygulamayı unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 228 340" width="228" height="340" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><g stroke-width="0.6" stroke-opacity="0.25"><line x1="30" y1="310" x2="30" y2="30"/><line x1="58" y1="310" x2="58" y2="30"/><line x1="86" y1="310" x2="86" y2="30"/><line x1="114" y1="310" x2="114" y2="30"/><line x1="142" y1="310" x2="142" y2="30"/><line x1="170" y1="310" x2="170" y2="30"/><line x1="198" y1="310" x2="198" y2="30"/><line x1="30" y1="310" x2="198" y2="310"/><line x1="30" y1="282" x2="198" y2="282"/><line x1="30" y1="254" x2="198" y2="254"/><line x1="30" y1="226" x2="198" y2="226"/><line x1="30" y1="198" x2="198" y2="198"/><line x1="30" y1="170" x2="198" y2="170"/><line x1="30" y1="142" x2="198" y2="142"/><line x1="30" y1="114" x2="198" y2="114"/><line x1="30" y1="86" x2="198" y2="86"/><line x1="30" y1="58" x2="198" y2="58"/><line x1="30" y1="30" x2="198" y2="30"/></g><line x1="24" y1="170" x2="208" y2="170"/><line x1="114" y1="316" x2="114" y2="20"/><path d="M208 170 l-7 -4 m7 4 l-7 4"/><path d="M114 20 l-4 7 m4 -7 l4 7"/><text x="212" y="186.9" fill="currentColor" stroke="none" text-anchor="end" font-style="italic">x</text><text x="126" y="22.9" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">y</text><g stroke-width="1.2"><line x1="30" y1="167" x2="30" y2="173"/><text x="30" y="187.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-3</text><line x1="58" y1="167" x2="58" y2="173"/><text x="58" y="187.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-2</text><line x1="86" y1="167" x2="86" y2="173"/><text x="86" y="187.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-1</text><line x1="142" y1="167" x2="142" y2="173"/><text x="142" y="187.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">1</text><line x1="170" y1="167" x2="170" y2="173"/><text x="170" y="187.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">2</text><line x1="198" y1="167" x2="198" y2="173"/><text x="198" y="187.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">3</text><line x1="111" y1="310" x2="117" y2="310"/><text x="108" y="313.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">-5</text><line x1="111" y1="282" x2="117" y2="282"/><text x="108" y="285.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">-4</text><line x1="111" y1="254" x2="117" y2="254"/><text x="108" y="257.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">-3</text><line x1="111" y1="226" x2="117" y2="226"/><text x="108" y="229.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">-2</text><line x1="111" y1="198" x2="117" y2="198"/><text x="108" y="201.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">-1</text><line x1="111" y1="142" x2="117" y2="142"/><text x="108" y="145.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">1</text><line x1="111" y1="114" x2="117" y2="114"/><text x="108" y="117.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">2</text><line x1="111" y1="86" x2="117" y2="86"/><text x="108" y="89.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">3</text><line x1="111" y1="58" x2="117" y2="58"/><text x="108" y="61.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">4</text><line x1="111" y1="30" x2="117" y2="30"/><text x="108" y="33.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">5</text><text x="106" y="185.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">O</text></g><path d="M32.8 46.5L33.5 50.4L34.2 54.3L34.8 58.1L35.5 62L36.2 65.7L36.9 69.5L37.5 73.2L38.2 76.9L38.9 80.5L39.6 84.1L40.2 87.7L40.9 91.3L41.6 94.8L42.3 98.3L42.9 101.7L43.6 105.1L44.3 108.5L45 111.9L45.7 115.2L46.3 118.5L47 121.7L47.7 124.9L48.4 128.1L49 131.3L49.7 134.4L50.4 137.5L51.1 140.6L51.7 143.6L52.4 146.6L53.1 149.5L53.8 152.5L54.5 155.4L55.1 158.2L55.8 161.1L56.5 163.9L57.2 166.6L57.8 169.3L58.5 172L59.2 174.7L59.9 177.3L60.5 179.9L61.2 182.5L61.9 185L62.6 187.5L63.3 190L63.9 192.5L64.6 194.9L65.3 197.2L66 199.6L66.6 201.9L67.3 204.1L68 206.4L68.7 208.6L69.3 210.8L70 212.9L70.7 215L71.4 217.1L72 219.1L72.7 221.2L73.4 223.1L74.1 225.1L74.8 227L75.4 228.9L76.1 230.7L76.8 232.5L77.5 234.3L78.1 236.1L78.8 237.8L79.5 239.5L80.2 241.1L80.8 242.7L81.5 244.3L82.2 245.9L82.9 247.4L83.6 248.9L84.2 250.3L84.9 251.8L85.6 253.2L86.3 254.5L86.9 255.8L87.6 257.1L88.3 258.4L89 259.6L89.6 260.8L90.3 262L91 263.1L91.7 264.2L92.3 265.3L93 266.3L93.7 267.3L94.4 268.2L95.1 269.2L95.7 270.1L96.4 270.9L97.1 271.8L97.8 272.6L98.4 273.3L99.1 274.1L99.8 274.8L100.5 275.5L101.1 276.1L101.8 276.7L102.5 277.3L103.2 277.8L103.9 278.3L104.5 278.8L105.2 279.2L105.9 279.6L106.6 280L107.2 280.4L107.9 280.7L108.6 281L109.3 281.2L109.9 281.4L110.6 281.6L111.3 281.7L112 281.9L112.6 281.9L113.3 282L114 282L114.7 282L115.4 281.9L116 281.9L116.7 281.7L117.4 281.6L118.1 281.4L118.7 281.2L119.4 281L120.1 280.7L120.8 280.4L121.4 280L122.1 279.6L122.8 279.2L123.5 278.8L124.2 278.3L124.8 277.8L125.5 277.3L126.2 276.7L126.9 276.1L127.5 275.5L128.2 274.8L128.9 274.1L129.6 273.3L130.2 272.6L130.9 271.8L131.6 270.9L132.3 270.1L132.9 269.2L133.6 268.2L134.3 267.3L135 266.3L135.7 265.3L136.3 264.2L137 263.1L137.7 262L138.4 260.8L139 259.6L139.7 258.4L140.4 257.1L141.1 255.8L141.7 254.5L142.4 253.2L143.1 251.8L143.8 250.3L144.5 248.9L145.1 247.4L145.8 245.9L146.5 244.3L147.2 242.7L147.8 241.1L148.5 239.5L149.2 237.8L149.9 236.1L150.5 234.3L151.2 232.5L151.9 230.7L152.6 228.9L153.2 227L153.9 225.1L154.6 223.1L155.3 221.2L156 219.1L156.6 217.1L157.3 215L158 212.9L158.7 210.8L159.3 208.6L160 206.4L160.7 204.1L161.4 201.9L162 199.6L162.7 197.2L163.4 194.9L164.1 192.5L164.8 190L165.4 187.5L166.1 185L166.8 182.5L167.5 179.9L168.1 177.3L168.8 174.7L169.5 172L170.2 169.3L170.8 166.6L171.5 163.9L172.2 161.1L172.9 158.2L173.5 155.4L174.2 152.5L174.9 149.5L175.6 146.6L176.3 143.6L176.9 140.6L177.6 137.5L178.3 134.4L179 131.3L179.6 128.1L180.3 124.9L181 121.7L181.7 118.5L182.3 115.2L183 111.9L183.7 108.5L184.4 105.1L185 101.7L185.7 98.3L186.4 94.8L187.1 91.3L187.8 87.7L188.4 84.1L189.1 80.5L189.8 76.9L190.5 73.2L191.1 69.5L191.8 65.7L192.5 62L193.2 58.1L193.8 54.3L194.5 50.4L195.2 46.5" stroke-width="2.2"/><text x="195.6" y="72.8" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">f</text><circle cx="58" cy="170" r="3" fill="currentColor" stroke="none"/><text x="47.5" y="164.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="170" cy="170" r="3" fill="currentColor" stroke="none"/><text x="180.5" y="164.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><circle cx="114" cy="282" r="3" fill="currentColor" stroke="none"/><text x="124.5" y="297.4" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text></svg>', true),
  -- mat-09-018 · doğrulandı
  ('fa7f7084-f1c7-5387-94f2-a127a1c575de'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   'Gerçel sayılarda tanımlı fonksiyonlar için $(f \circ g)(x) = 6x - 5$ ve $g(x) = 2x + 1$ eşitlikleri veriliyor.
Buna göre $f(7)$ değeri kaçtır?',
   '{"options":["7","13","15","37","85"],"correctIndex":1}'::jsonb,
   '$(f \circ g)(x) = f(g(x)) = 6x - 5$ olduğundan $f(2x + 1) = 6x - 5$ yazılır. Parantez içinin $7$ olması için $2x + 1 = 7 \Rightarrow 2x = 6 \Rightarrow x = 3$ konur. Buradan $f(7) = 6 \cdot 3 - 5 = 18 - 5 = 13$ bulunur.',
   'D şıkkı (37), $2x + 1 = 7$ çözmeden doğrudan $x = 7$ yazarak $6 \cdot 7 - 5 = 37$ hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-019 · doğrulandı
  ('1783d377-068b-5142-9352-4eed7ea8801e'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 3,
   'Gerçel sayılar kümesinde tanımlı $f$ fonksiyonu her $x$ gerçel sayısı için
$$f(x) + 2f(-x) = 3x + 9$$
eşitliğini sağlamaktadır.
Buna göre $f(2)$ değeri kaçtır?',
   '{"options":["$-9$","$-1$","$3$","$9$","$-3$"],"correctIndex":4}'::jsonb,
   'Denklemde sırasıyla $x = 2$ ve $x = -2$ yazılır:
$x = 2$ için $f(2) + 2f(-2) = 3(2) + 9 = 15$.
$x = -2$ için $f(-2) + 2f(2) = 3(-2) + 9 = 3$.
İkinci denklem $-2$ ile çarpılıp birinci denklemle toplanırsa $(f(2) + 2f(-2)) + (-2f(-2) - 4f(2)) = 15 - 6 \Rightarrow -3f(2) = 9 \Rightarrow f(2) = -3$ bulunur.',
   'D şıkkı (9), denklem sistemini çözerken $f(2)$ yerine $f(-2) = 9$ değerini bulan ya da $-3f(2) = 9$ adımında işareti unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-020 · doğrulandı
  ('542df0c6-892f-5313-a632-d27fcf52d0f4'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 1,
   '$A = \{0, 1, 2, 3, 4\}$ kümesi üzerinde $\Delta$ ve $\circ$ işlemleri her $a, b \in A$ için:
- $a \Delta b$: "$a + b$ toplamının $5$ ile bölümünden kalan"
- $a \circ b$: "$a \cdot b$ çarpımının $5$ ile bölümünden kalan"
biçiminde tanımlanıyor.
Buna göre $(4 \Delta 3) \circ (4 \Delta 4)$ işleminin sonucu kaçtır?',
   '{"options":["0","1","2","3","4"],"correctIndex":1}'::jsonb,
   'Parantez içindeki modüler toplama işlemleri ayrı ayrı hesaplanır:
- $4 + 3 = 7$ olduğundan $4 \Delta 3 = 2$ (mod $5$),
- $4 + 4 = 8$ olduğundan $4 \Delta 4 = 3$ (mod $5$).
Ardından çarpma işlemi uygulanır: $2 \cdot 3 = 6$ olup $5$ ile bölümünden kalan $1$ bulunur.',
   'D şıkkı ($3$) veya C şıkkı ($2$), mod $5$ yerine kalanları farklı bir modda hesaplayan veya parantezlerdeki $\Delta$ işlemi yerine çarpma yapan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-021
  ('c36a1f31-b684-5611-a4e1-09398d324173'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   '`KADROKADROKADRO...` biçiminde harfleri belirli bir düzende tekrar eden dizinin baştan $138$. sıradaki harfi aşağıdakilerden hangisidir?',
   '{"options":["K","A","R","D","O"],"correctIndex":3}'::jsonb,
   'Tekrar eden blok `KADRO` olup $5$ harften oluşmaktadır. $138$ sayısı blok uzunluğu olan $5$''e bölünür: $138 = 5 \cdot 27 + 3$. Kalan $3$ olduğundan bloğun $3$. harfi olan D harfi bulunur ($1$: K, $2$: A, $3$: D, $4$: R, $5$: O).',
   'C şıkkı (R) veya B şıkkı (A), sıfır tabanlı indeksleme gibi kayma yapıp $2$. veya $4$. harfi seçen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-022 · doğrulandı
  ('b977b127-7d12-5741-b320-08922034be01'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 3,
   '$$3^{40} + 4^{25}$$
toplamının $5$ ile bölümünden kalan kaçtır?',
   '{"options":["0","1","2","3","4"],"correctIndex":0}'::jsonb,
   'İki terimin $5$ ile bölümünden kalanlar ayrı ayrı bulunur:
$3$''ün kuvvetleri mod $5$''te $3^1 \equiv 3$, $3^2 \equiv 4$, $3^3 \equiv 2$, $3^4 \equiv 1$ olarak $4$''lük periyoda sahiptir. $40$ sayısı $4$''ün tam katı olduğundan $3^{40} \equiv 1$ (mod $5$) olur.
$4 \equiv -1$ (mod $5$) olduğundan $4^{25} \equiv (-1)^{25} = -1 \equiv 4$ (mod $5$) olur.
İki kalanın toplamı $1 + 4 = 5 \equiv 0$ (mod $5$) bulunur.',
   'C şıkkı (2), $4 \equiv -1$ yerine $4$''ün tüm kuvvetlerinin kalanını $4$ veya $1$ sanıp $1 + 1 = 2$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-023
  ('eb329407-54ea-5fa6-ac08-975bc9d9f0f7'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 1,
   '$A$ ve $B$ iki küme olmak üzere $s(A \setminus B) = 4$, $s(B \setminus A) = 7$ ve $s(A \cup B) = 15$''tir.
Buna göre,
I. $s(A \cap B) = 4$''tür.
II. $s(A) + s(B) = 15$''tir.
III. $A$ ve $B$ ayrık kümeler değildir.
ifadelerinden hangileri doğrudur?',
   '{"options":["Yalnız I","Yalnız II","I ve III","I ve II","I, II ve III"],"correctIndex":2}'::jsonb,
   'Birleşim kümesi üç ayrık bölgeden oluşur: $s(A \cup B) = s(A \setminus B) + s(A \cap B) + s(B \setminus A)$.
Buradan $15 = 4 + s(A \cap B) + 7 \Rightarrow s(A \cap B) = 4$ bulunur (I doğru). Kesişim kümesi boş olmadığından $A$ ve $B$ ayrık kümeler değildir (III doğru). Diğer yandan $s(A) = 4 + 4 = 8$ ve $s(B) = 7 + 4 = 11$ olduğundan $s(A) + s(B) = 19 \neq 15$''tir (II yanlış).',
   'E şıkkı (I, II ve III), $s(A) + s(B)$ toplamını $s(A \cup B)$ ile özdeş sanıp kesişim elemanlarını ikinci kez eklemeyi unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-024 · şekilli · doğrulandı
  ('c7a28dd4-8943-5ffa-a59a-4121a56c97ef'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   'Şekildeki Venn şemasında ayrık bölgelerin eleman sayıları verilmiştir. Evrensel küme $s(E) = 42$ olduğuna göre $s(B)$ kaçtır?',
   '{"options":["8","11","17","22","24"],"correctIndex":2}'::jsonb,
   'Evrensel kümenin eleman sayısı şemadaki dört ayrık bölgenin toplamına eşittir:
$$2x + 6 + (x + 3) + 9 = 42 \Rightarrow 3x + 18 = 42 \Rightarrow 3x = 24 \Rightarrow x = 8$$
$B$ kümesi $A \cap B$ ile $B \setminus A$ bölgelerinden oluştuğundan $s(B) = 6 + (8 + 3) = 6 + 11 = 17$ bulunur.',
   'B şıkkı ($11$), $x = 8$''i doğru bulduktan sonra $s(B)$ yerine yalnızca $s(B \setminus A) = x + 3 = 11$ bölgesini alan; A şıkkı ($8$) ise doğrudan $x$''i işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 210" width="320" height="210" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><rect x="4" y="4" width="312" height="202" rx="6" stroke-width="1.4"/><text x="18" y="24.9" fill="currentColor" stroke="none" text-anchor="start" font-weight="600">E</text><circle cx="115" cy="105" r="70" fill="currentColor" fill-opacity="0.06"/><text x="63" y="35.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="205" cy="105" r="70" fill="currentColor" fill-opacity="0.06"/><text x="257" y="35.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="80" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">2x</text><text x="160" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6</text><text x="240" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">x + 3</text><text x="294" y="194.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">9</text></svg>', true),
  -- mat-09-025 · doğrulandı
  ('954f15ef-83e6-5176-bdbc-4b9204475132'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   '$A$, $B$ ve $C$ kümeleri için $s(B) > 1$, $s(A \times B) = 28$, $s(C \times B) = 35$ ve $s(A \cap C) = 1$ veriliyor.
Buna göre $s((A \cup C) \times B)$ kaçtır?',
   '{"options":["35","42","49","54","56"],"correctIndex":4}'::jsonb,
   '$s(A \times B) = s(A) \cdot s(B) = 28$ ve $s(C \times B) = s(C) \cdot s(B) = 35$ olduğundan $s(B)$ hem $28$''i hem de $35$''i bölen $1$''den büyük tam sayı olmalıdır: $\text{EBOB}(28, 35) = 7 \Rightarrow s(B) = 7$.
Buradan $s(A) = \dfrac{28}{7} = 4$ ve $s(C) = \dfrac{35}{7} = 5$ bulunur.
$s(A \cup C) = s(A) + s(C) - s(A \cap C) = 4 + 5 - 1 = 8$ olduğundan $s((A \cup C) \times B) = 8 \cdot 7 = 56$ elde edilir.',
   'B şıkkı ($42$) veya C şıkkı ($49$), $s(A \cap C) = 1$ ortak elemanını çıkarırken veya $s(B) = 7$ çarpanını uygularken işlem hatası yapan; ya da $63$ ($9 \cdot 7$) doğrultusunda ortak elemanı unutarak yanılgıya düşen adayları hedefler.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-026
  ('8f658295-f24a-5784-b035-14205650b9e7'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 1,
   'Gerçel sayılarda tanımlı $f(x) = 3x - 2$ fonksiyonu verilmektedir.
Buna göre $f(2x + 1)$ ifadesinin $f(x)$ türünden eşiti aşağıdakilerden hangisidir?',
   '{"options":["$2f(x) + 5$","$2f(x) + 1$","$2f(x) - 1$","$3f(x) + 5$","$2f(x) + 3$"],"correctIndex":0}'::jsonb,
   'Verilen tanımdan $3x = f(x) + 2$ çekilir. İstenen ifade açıldığında:
$$f(2x + 1) = 3(2x + 1) - 2 = 6x + 3 - 2 = 2(3x) + 1$$
Burada $3x = f(x) + 2$ yerine yazılırsa $2(f(x) + 2) + 1 = 2f(x) + 5$ elde edilir.',
   'B şıkkı ($2f(x) + 1$), yalnızca $6x$''i $2f(x)$ yerine koyup $3x = f(x) + 2$ eşitliğindeki $+2$ sabitini çarpmayı unutan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-027 · şekilli · doğrulandı
  ('66b65ffd-8ca3-5f37-babd-300a9b3ed359'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   '$38$ öğrencinin bulunduğu bir sınıfta İngilizce (İ), Almanca (A) ve Fransızca (F) dillerini bilenlerin dağılımı aşağıdaki Venn şemasında verilmiştir.
Buna göre bu sınıfta bu üç dilden en az ikisini bilen toplam kaç öğrenci vardır?',
   '{"options":["12","14","15","16","19"],"correctIndex":1}'::jsonb,
   'Tüm bölgelerin toplamı $38$''i vermelidir:
$$8 + 6 + 7 + 4 + 3 + 2 + x + 3 = 38 \Rightarrow 33 + x = 38 \Rightarrow x = 5$$
En az iki dil bilen öğrenciler ikişerli kesişim bölgeleri ile üçlü kesişim bölgesinde yer alır: $4 + 3 + 2 + x = 4 + 3 + 2 + 5 = 14$ kişi bulunur.',
   'E şıkkı ($19$), $x = 5$''i doğru bulduktan sonra "en az iki dil" yerine dıştaki $3$ kişiyi veya yalnızca tek dil bilen bir bölgeyi yanlışlıkla toplama dahil edenleri; A şıkkı ($12$) ise üçlü kesişimi saymayanları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 270" width="320" height="270" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><rect x="4" y="4" width="312" height="262" rx="6" stroke-width="1.4"/><text x="18" y="24.9" fill="currentColor" stroke="none" text-anchor="start" font-weight="600">E</text><circle cx="120" cy="100" r="70" fill="currentColor" fill-opacity="0.06"/><text x="62" y="42.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">İ</text><circle cx="200" cy="100" r="70" fill="currentColor" fill-opacity="0.06"/><text x="258" y="42.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="160" cy="165" r="70" fill="currentColor" fill-opacity="0.06"/><text x="160" y="249.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">F</text><text x="92" y="86.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">8</text><text x="228" y="86.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6</text><text x="160" y="204.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">7</text><text x="160" y="76.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4</text><text x="118" y="146.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">3</text><text x="202" y="146.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">2</text><text x="160" y="122.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">x</text><text x="294" y="254.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">3</text></svg>', true),
  -- mat-09-028 · doğrulandı
  ('e995dd6b-9655-5fbe-adcf-7c5d8b45b6dc'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   'Gerçel sayılarda tanımlı $f$ doğrusal bir fonksiyon olup $f(2) = 7$ ve $f(5) = 19$ eşitliklerini sağlamaktadır.
Buna göre $f(8)$ değeri kaçtır?',
   '{"options":["23","25","27","31","35"],"correctIndex":3}'::jsonb,
   'Doğrusal fonksiyon $f(x) = ax + b$ biçimindedir. Tanım kümesindeki değişime oranla değer artışı sabittir:
$$a = \frac{f(5) - f(2)}{5 - 2} = \frac{19 - 7}{3} = 4$$
$x = 5$''ten $x = 8$''e $3$ birimlik artış olduğunda fonksiyon değeri $3 \cdot 4 = 12$ artar: $f(8) = 19 + 12 = 31$ bulunur.',
   'C şıkkı ($27$), $x$''in $5$''ten $8$''e $3$ birim artmasını gözden kaçırıp sabit artış miktarı olan $12$''yi değil $8$''i ekleyen adayı; E şıkkı ($35$) ise bir adım fazla ekleyenleri yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-029 · doğrulandı
  ('28538e76-877c-5172-a56c-0484e89d1f83'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 3,
   'Gerçel sayılarda tanımlı $f$ ve bire bir örten $g$ fonksiyonları için
$$f(2x - 1) = 4x + 5$$
$$g^{-1}(x + 2) = 3x - 4$$
eşitlikleri veriliyor.
Buna göre $(f \circ g)(5)$ değeri kaçtır?',
   '{"options":["17","19","21","23","25"],"correctIndex":0}'::jsonb,
   'Önce $g(5)$ değeri bulunur. $g^{-1}(x + 2) = 3x - 4 \Leftrightarrow g(3x - 4) = x + 2$ olduğundan parantez içini $5$''e eşitleyen $x$ aranır: $3x - 4 = 5 \Rightarrow 3x = 9 \Rightarrow x = 3$. Buradan $g(5) = 3 + 2 = 5$ elde edilir.
Şimdi $(f \circ g)(5) = f(g(5)) = f(5)$ hesaplanır. $f(2x - 1) = 4x + 5$ eşitliğinde $2x - 1 = 5 \Rightarrow x = 3$ konursa $f(5) = 4(3) + 5 = 17$ bulunur.',
   'E şıkkı ($25$), $f(5)$''i hesaplarken $2x - 1 = 5$ denklemini çözmeden doğrudan $x = 5$ koyarak $4 \cdot 5 + 5 = 25$ yazan; B şıkkı ($19$) ise $g^{-1}$ ters dönüşümünde $x + 2$ yerine doğrudan $5 + 2$ koyan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-030 · doğrulandı
  ('e88cac3f-a981-581b-8309-a8f6fb749296'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 1,
   'Bir deney sayacı $0$''dan $23$''e kadar tam saatleri göstermekte, $23$''ten bir saat sonra tekrar $0$''a dönmektedir. Sayaç şu an $15$''i gösterdiğine göre $100$ saat sonra kaçı gösterir?',
   '{"options":["11","13","15","17","19"],"correctIndex":4}'::jsonb,
   'Sayaç $24$ saatte bir aynı değere döndüğünden $100$ sayısı $24$''e bölünür: $100 = 24 \cdot 4 + 4$, kalan $4$''tür. Şu an $15$''te bulunan sayaca $4$ saat eklenirse $15 + 4 = 19$ bulunur.',
   'A şıkkı ($11$), $4$ saati eklemek yerine $15$''ten $4$ çıkararak $11$ bulan; C şıkkı ($15$) ise $100$''ü yanlışlıkla $24$''ün değil $25$''in tam katı sanan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-031 · doğrulandı
  ('6a8a92a6-f201-527d-98f1-0c3246364288'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   'Gerçel sayılarda tanımlı $f$ ve $g$ fonksiyonları için
$$(f + g)(x) = 3x + 5 \quad \text{ve} \quad (f - g)(x) = x - 3$$
eşitlikleri verilmektedir.
Buna göre $(f \cdot g)(2)$ değeri kaçtır?',
   '{"options":["11","18","24","30","36"],"correctIndex":3}'::jsonb,
   'Verilen her iki eşitlikte de $x = 2$ yazılır:
- $f(2) + g(2) = 3(2) + 5 = 11$
- $f(2) - g(2) = 2 - 3 = -1$
Bu iki denklem taraf tarafa toplanırsa $2f(2) = 10 \Rightarrow f(2) = 5$ bulunur. Buradan $g(2) = 11 - 5 = 6$ olur. Çarpımları $(f \cdot g)(2) = f(2) \cdot g(2) = 5 \cdot 6 = 30$''dur.',
   'A şıkkı ($11$), $f(2) = 5$ ve $g(2) = 6$ değerlerini bulduktan sonra çarpım yerine $f(2) + g(2)$ toplamını işaretleyen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-032 · şekilli · doğrulandı
  ('6cc578eb-4481-55a1-91b6-1d172d383e44'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 1,
   'Şekildeki Venn şemasında ayrık bölgelerdeki eleman sayıları verilmiştir. Evrensel küme $s(E) = 32$ olduğuna göre $s(A \cap B)$ kaçtır?',
   '{"options":["4","5","6","7","8"],"correctIndex":3}'::jsonb,
   'Şemadaki dört ayrık bölgenin toplamı evrensel küme eleman sayısına eşittir:
$$12 + x + 9 + 4 = 32 \Rightarrow 25 + x = 32 \Rightarrow x = 7$$
Buna göre $s(A \cap B) = 7$''dir.',
   'A şıkkı ($4$) veya B şıkkı ($5$), toplama yaparken dıştaki $4$ elemanını hesaba katmayıp çıkarma hatası yapan veya $x$ yerine başka bir bölgeyi seçen adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 210" width="320" height="210" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><rect x="4" y="4" width="312" height="202" rx="6" stroke-width="1.4"/><text x="18" y="24.9" fill="currentColor" stroke="none" text-anchor="start" font-weight="600">E</text><circle cx="115" cy="105" r="70" fill="currentColor" fill-opacity="0.06"/><text x="63" y="35.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="205" cy="105" r="70" fill="currentColor" fill-opacity="0.06"/><text x="257" y="35.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="80" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">12</text><text x="160" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">x</text><text x="240" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">9</text><text x="294" y="194.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4</text></svg>', true),
  -- mat-09-033
  ('df1fdc3d-d507-5818-bf18-1605888afe75'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   'Gerçel sayılarda tanımlı $f$ çift fonksiyon, $g$ ise tek fonksiyon olup $f(3) = 4$ ve $g(-2) = 5$ verilmektedir.
Buna göre,
I. $f(-3) + g(2) = 9$
II. $h(x) = f(x) \cdot g(x)$ tek fonksiyondur.
III. $f(-3) \cdot g(2) = -20$
ifadelerinden hangileri doğrudur?',
   '{"options":["Yalnız I","Yalnız II","I ve II","I ve III","II ve III"],"correctIndex":4}'::jsonb,
   '$f$ çift fonksiyon olduğu için $f(-3) = f(3) = 4$''tür. $g$ tek fonksiyon olduğu için $g(-2) = -g(2) = 5 \Rightarrow g(2) = -5$ bulunur.
- I: $f(-3) + g(2) = 4 + (-5) = -1 \neq 9$ (yanlış).
- II: $h(-x) = f(-x) \cdot g(-x) = f(x) \cdot (-g(x)) = -h(x)$ olduğundan $h$ tek fonksiyondur (doğru).
- III: $f(-3) \cdot g(2) = 4 \cdot (-5) = -20$ (doğru).',
   'C şıkkı (I ve II), tek fonksiyonda $g(-2) = 5$ iken $g(2)$''yi işaret değiştirmeden $+5$ sanıp $4 + 5 = 9$ bulan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-034 · doğrulandı
  ('5e38d73a-402d-59f4-a7b6-ad08a2b7efab'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 3,
   'Pozitif tam sayılarda tanımlı bir $f$ fonksiyonu her $n$ pozitif tam sayısı için
$$f(n + 1) = f(n) + 2n$$
eşitliğini sağlamaktadır. $f(1) = 3$ olduğuna göre $f(10)$ değeri kaçtır?',
   '{"options":["83","93","95","103","113"],"correctIndex":1}'::jsonb,
   '$n = 1, 2, \ldots, 9$ için eşitlik alt alta yazılıp taraf tarafa toplanır (teleskopik toplam):
$$f(2) - f(1) = 2 \cdot 1$$
$$f(3) - f(2) = 2 \cdot 2$$
$$f(10) - f(9) = 2 \cdot 9$$
Taraf tarafa toplandığında aradaki terimler birbirini götürür ve $f(10) - f(1) = 2(1 + 2 + \cdots + 9)$ elde edilir. $1$''den $9$''a kadar toplam $\dfrac{9 \cdot 10}{2} = 45$ olduğundan $f(10) - 3 = 2 \cdot 45 = 90 \Rightarrow f(10) = 93$ bulunur.',
   'D şıkkı ($103$) veya E şıkkı ($113$), teleskopik toplamın son teriminde $n = 9$ yerine $n = 10$ alarak $1$''den $10$''a kadar ($55 \cdot 2 = 110 \Rightarrow 113$) toplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-035 · doğrulandı
  ('10e67399-7b40-51a1-b0df-972258e9a61c'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 3,
   'Bir $A$ kümesinin eleman sayısı $2$ artırıldığında alt küme sayısı $384$ artmaktadır. $s(B) = 8$ ve $s(A \cup B) = 11$ olduğuna göre $s(A \times (A \cap B))$ kaçtır?',
   '{"options":["14","18","21","24","28"],"correctIndex":4}'::jsonb,
   '$s(A) = n$ olsun. Eleman sayısı $2$ artırıldığında alt küme sayısı farkı:
$$2^{n + 2} - 2^n = 384 \Rightarrow 2^n(4 - 1) = 384 \Rightarrow 3 \cdot 2^n = 384 \Rightarrow 2^n = 128 \Rightarrow n = 7$$
Böylece $s(A) = 7$ bulunur. Birleşim formülünden $11 = 7 + 8 - s(A \cap B) \Rightarrow s(A \cap B) = 4$ elde edilir. Sonuç olarak $s(A \times (A \cap B)) = s(A) \cdot s(A \cap B) = 7 \cdot 4 = 28$''dir.',
   'C şıkkı ($21$) veya D şıkkı ($24$), $2^n = 128$ değerinden $n = 6$ gibi üs hatası yapan ya da Kartezyen çarpım eleman sayısında toplama yaparak yanlış sonuca ulaşan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, null, true),
  -- mat-09-036 · şekilli · doğrulandı
  ('a360ce06-1390-5857-a62e-55fa84a52205'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 1,
   'Şekildeki Venn şemasında ayrık bölgelerin eleman sayıları verilmiştir. Evrensel küme $s(E) = 36$ olduğuna göre $s(A) + s(B)$ toplamı kaçtır?',
   '{"options":["30","38","32","36","44"],"correctIndex":1}'::jsonb,
   'Tüm ayrık bölgelerin toplamı $36$ olmalıdır: $10 + x + 12 + 6 = 36 \Rightarrow 28 + x = 36 \Rightarrow x = 8$.
Buradan $s(A) = 10 + 8 = 18$ ve $s(B) = 12 + 8 = 20$ bulunur. Toplam $s(A) + s(B) = 18 + 20 = 38$''dir.',
   'A şıkkı ($30$), $s(A) + s(B)$ yerine $s(A \cup B) = 36 - 6 = 30$ değerini işaretleyen (kesişimdeki $x = 8$''i ikinci kez saymayı unutan) adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 210" width="320" height="210" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><rect x="4" y="4" width="312" height="202" rx="6" stroke-width="1.4"/><text x="18" y="24.9" fill="currentColor" stroke="none" text-anchor="start" font-weight="600">E</text><circle cx="115" cy="105" r="70" fill="currentColor" fill-opacity="0.06"/><text x="63" y="35.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="205" cy="105" r="70" fill="currentColor" fill-opacity="0.06"/><text x="257" y="35.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><text x="80" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">10</text><text x="160" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">x</text><text x="240" y="109.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">12</text><text x="294" y="194.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6</text></svg>', true),
  -- mat-09-037 · şekilli · doğrulandı
  ('b1d8a53a-0e11-592b-a5da-fd4f675fbf8f'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   'Şekildeki dik koordinat düzleminde $y = f(x)$ doğrusal fonksiyonunun grafiği $A(-3, 0)$ ve $B(0, 6)$ noktalarından geçmektedir.
Buna göre $f(4) + f^{-1}(2)$ toplamı kaçtır?',
   '{"options":["12","10","14","16","18"],"correctIndex":0}'::jsonb,
   'Eksenleri $(-3, 0)$ ve $(0, 6)$ noktalarında kesen doğrunun denklemi $\dfrac{x}{-3} + \dfrac{y}{6} = 1 \Rightarrow y = 2x + 6$''dır; yani $f(x) = 2x + 6$.
- $f(4) = 2 \cdot 4 + 6 = 14$.
- $f^{-1}(2) = a \Leftrightarrow 2a + 6 = 2 \Rightarrow 2a = -4 \Rightarrow a = -2$.
Toplam $14 + (-2) = 12$ bulunur.',
   'D şıkkı ($16$), $2a + 6 = 2$ denkleminden $a = -2$ yerine $+2$ alıp $14 + 2 = 16$ hesaplayan adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 237.8 260" width="237.8" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><g stroke-width="0.6" stroke-opacity="0.25"><line x1="30" y1="230" x2="30" y2="30"/><line x1="74.4" y1="230" x2="74.4" y2="30"/><line x1="118.9" y1="230" x2="118.9" y2="30"/><line x1="163.3" y1="230" x2="163.3" y2="30"/><line x1="207.8" y1="230" x2="207.8" y2="30"/><line x1="30" y1="207.8" x2="207.8" y2="207.8"/><line x1="30" y1="163.3" x2="207.8" y2="163.3"/><line x1="30" y1="118.9" x2="207.8" y2="118.9"/><line x1="30" y1="74.4" x2="207.8" y2="74.4"/><line x1="30" y1="30" x2="207.8" y2="30"/></g><line x1="24" y1="207.8" x2="217.8" y2="207.8"/><line x1="118.9" y1="236" x2="118.9" y2="20"/><path d="M217.8 207.8 l-7 -4 m7 4 l-7 4"/><path d="M118.9 20 l-4 7 m4 -7 l4 7"/><text x="221.8" y="224.7" fill="currentColor" stroke="none" text-anchor="end" font-style="italic">x</text><text x="130.9" y="22.9" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">y</text><g stroke-width="1.2"><line x1="30" y1="204.8" x2="30" y2="210.8"/><text x="30" y="225.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-4</text><line x1="74.4" y1="204.8" x2="74.4" y2="210.8"/><text x="74.4" y="225.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-2</text><line x1="163.3" y1="204.8" x2="163.3" y2="210.8"/><text x="163.3" y="225.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">2</text><line x1="207.8" y1="204.8" x2="207.8" y2="210.8"/><text x="207.8" y="225.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">4</text><line x1="115.9" y1="163.3" x2="121.9" y2="163.3"/><text x="112.9" y="167.2" fill="currentColor" stroke="none" text-anchor="end" font-size="11">2</text><line x1="115.9" y1="118.9" x2="121.9" y2="118.9"/><text x="112.9" y="122.7" fill="currentColor" stroke="none" text-anchor="end" font-size="11">4</text><line x1="115.9" y1="74.4" x2="121.9" y2="74.4"/><text x="112.9" y="78.3" fill="currentColor" stroke="none" text-anchor="end" font-size="11">6</text><line x1="115.9" y1="30" x2="121.9" y2="30"/><text x="112.9" y="33.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">8</text><text x="110.9" y="223.6" fill="currentColor" stroke="none" text-anchor="end" font-size="11">O</text></g><path d="M43.3 225.6L43.7 224.8L44.1 224L44.5 223.2L44.9 222.4L45.3 221.7L45.7 220.9L46.1 220.1L46.4 219.3L46.8 218.6L47.2 217.8L47.6 217L48 216.2L48.4 215.4L48.8 214.7L49.2 213.9L49.6 213.1L49.9 212.3L50.3 211.6L50.7 210.8L51.1 210L51.5 209.2L51.9 208.4L52.3 207.7L52.7 206.9L53.1 206.1L53.4 205.3L53.8 204.6L54.2 203.8L54.6 203L55 202.2L55.4 201.4L55.8 200.7L56.2 199.9L56.6 199.1L56.9 198.3L57.3 197.6L57.7 196.8L58.1 196L58.5 195.2L58.9 194.4L59.3 193.7L59.7 192.9L60.1 192.1L60.4 191.3L60.8 190.6L61.2 189.8L61.6 189L62 188.2L62.4 187.4L62.8 186.7L63.2 185.9L63.6 185.1L63.9 184.3L64.3 183.6L64.7 182.8L65.1 182L65.5 181.2L65.9 180.4L66.3 179.7L66.7 178.9L67.1 178.1L67.4 177.3L67.8 176.6L68.2 175.8L68.6 175L69 174.2L69.4 173.4L69.8 172.7L70.2 171.9L70.6 171.1L70.9 170.3L71.3 169.6L71.7 168.8L72.1 168L72.5 167.2L72.9 166.4L73.3 165.7L73.7 164.9L74.1 164.1L74.4 163.3L74.8 162.6L75.2 161.8L75.6 161L76 160.2L76.4 159.4L76.8 158.7L77.2 157.9L77.6 157.1L77.9 156.3L78.3 155.6L78.7 154.8L79.1 154L79.5 153.2L79.9 152.4L80.3 151.7L80.7 150.9L81.1 150.1L81.4 149.3L81.8 148.6L82.2 147.8L82.6 147L83 146.2L83.4 145.4L83.8 144.7L84.2 143.9L84.6 143.1L84.9 142.3L85.3 141.6L85.7 140.8L86.1 140L86.5 139.2L86.9 138.4L87.3 137.7L87.7 136.9L88.1 136.1L88.4 135.3L88.8 134.6L89.2 133.8L89.6 133L90 132.2L90.4 131.4L90.8 130.7L91.2 129.9L91.6 129.1L91.9 128.3L92.3 127.6L92.7 126.8L93.1 126L93.5 125.2L93.9 124.4L94.3 123.7L94.7 122.9L95.1 122.1L95.4 121.3L95.8 120.6L96.2 119.8L96.6 119L97 118.2L97.4 117.4L97.8 116.7L98.2 115.9L98.6 115.1L98.9 114.3L99.3 113.6L99.7 112.8L100.1 112L100.5 111.2L100.9 110.4L101.3 109.7L101.7 108.9L102.1 108.1L102.4 107.3L102.8 106.6L103.2 105.8L103.6 105L104 104.2L104.4 103.4L104.8 102.7L105.2 101.9L105.6 101.1L105.9 100.3L106.3 99.6L106.7 98.8L107.1 98L107.5 97.2L107.9 96.4L108.3 95.7L108.7 94.9L109.1 94.1L109.4 93.3L109.8 92.6L110.2 91.8L110.6 91L111 90.2L111.4 89.4L111.8 88.7L112.2 87.9L112.6 87.1L112.9 86.3L113.3 85.6L113.7 84.8L114.1 84L114.5 83.2L114.9 82.4L115.3 81.7L115.7 80.9L116.1 80.1L116.4 79.3L116.8 78.6L117.2 77.8L117.6 77L118 76.2L118.4 75.4L118.8 74.7L119.2 73.9L119.6 73.1L119.9 72.3L120.3 71.6L120.7 70.8L121.1 70L121.5 69.2L121.9 68.4L122.3 67.7L122.7 66.9L123.1 66.1L123.4 65.3L123.8 64.6L124.2 63.8L124.6 63L125 62.2L125.4 61.4L125.8 60.7L126.2 59.9L126.6 59.1L126.9 58.3L127.3 57.6L127.7 56.8L128.1 56L128.5 55.2L128.9 54.4L129.3 53.7L129.7 52.9L130.1 52.1L130.4 51.3L130.8 50.6L131.2 49.8L131.6 49L132 48.2L132.4 47.4L132.8 46.7L133.2 45.9L133.6 45.1L133.9 44.3L134.3 43.6L134.7 42.8L135.1 42L135.5 41.2L135.9 40.4L136.3 39.7L136.7 38.9" stroke-width="2.2"/><text x="98.2" y="122.7" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">f</text><circle cx="52.2" cy="207.8" r="3" fill="currentColor" stroke="none"/><text x="41.7" y="202.2" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="118.9" cy="74.4" r="3" fill="currentColor" stroke="none"/><text x="132.9" y="79.3" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text></svg>', true),
  -- mat-09-038 · şekilli · doğrulandı
  ('5c1ca2ae-d3f1-5eee-9730-9df90a89e7d3'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   'Şekildeki dik koordinat düzleminde $f$ ve $g$ doğrusal fonksiyonlarının grafikleri $C(2, 4)$ noktasında kesişmektedir. $f$ doğrusu $(-2, 0)$ ve $(0, 2)$ noktalarından, $g$ doğrusu ise $(0, 6)$ ve $(6, 0)$ noktalarından geçmektedir.
Buna göre $(f \circ g)(1) + g^{-1}(4)$ toplamı kaçtır?',
   '{"options":["5","7","9","11","13"],"correctIndex":2}'::jsonb,
   'Grafikten doğrunun denklemleri yazılır: $f(x) = x + 2$ ve $g(x) = 6 - x$.
- $(f \circ g)(1) = f(g(1)) = f(6 - 1) = f(5) = 5 + 2 = 7$.
- $g(2) = 4$ ($C(2, 4)$ noktası grafik üzerinde) olduğundan $g^{-1}(4) = 2$''dir.
Toplam $7 + 2 = 9$ bulunur.',
   'B şıkkı ($7$), yalnızca $(f \circ g)(1) = 7$ değerini hesaplayıp $g^{-1}(4) = 2$''yi eklemeyi unutan adayı; E şıkkı ($13$) ise $g^{-1}(4)$ yerine $g(4)$ veya ters sırada $(g \circ f)(1)$ alanları yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 310 260" width="310" height="260" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><g stroke-width="0.6" stroke-opacity="0.25"><line x1="55" y1="230" x2="55" y2="30"/><line x1="105" y1="230" x2="105" y2="30"/><line x1="155" y1="230" x2="155" y2="30"/><line x1="205" y1="230" x2="205" y2="30"/><line x1="255" y1="230" x2="255" y2="30"/><line x1="30" y1="205" x2="280" y2="205"/><line x1="30" y1="155" x2="280" y2="155"/><line x1="30" y1="105" x2="280" y2="105"/><line x1="30" y1="55" x2="280" y2="55"/></g><line x1="24" y1="205" x2="290" y2="205"/><line x1="105" y1="236" x2="105" y2="20"/><path d="M290 205 l-7 -4 m7 4 l-7 4"/><path d="M105 20 l-4 7 m4 -7 l4 7"/><text x="294" y="221.9" fill="currentColor" stroke="none" text-anchor="end" font-style="italic">x</text><text x="117" y="22.9" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">y</text><g stroke-width="1.2"><line x1="55" y1="202" x2="55" y2="208"/><text x="55" y="222.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">-2</text><line x1="155" y1="202" x2="155" y2="208"/><text x="155" y="222.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">2</text><line x1="205" y1="202" x2="205" y2="208"/><text x="205" y="222.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">4</text><line x1="255" y1="202" x2="255" y2="208"/><text x="255" y="222.9" fill="currentColor" stroke="none" text-anchor="middle" font-size="11">6</text><line x1="102" y1="155" x2="108" y2="155"/><text x="99" y="158.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">2</text><line x1="102" y1="105" x2="108" y2="105"/><text x="99" y="108.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">4</text><line x1="102" y1="55" x2="108" y2="55"/><text x="99" y="58.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">6</text><text x="97" y="220.9" fill="currentColor" stroke="none" text-anchor="end" font-size="11">O</text></g><path d="M45 215L45.7 214.3L46.4 213.6L47.1 212.9L47.8 212.2L48.5 211.5L49.3 210.8L50 210L50.7 209.3L51.4 208.6L52.1 207.9L52.8 207.2L53.5 206.5L54.2 205.8L54.9 205.1L55.6 204.4L56.3 203.7L57 203L57.8 202.3L58.5 201.5L59.2 200.8L59.9 200.1L60.6 199.4L61.3 198.7L62 198L62.7 197.3L63.4 196.6L64.1 195.9L64.8 195.2L65.5 194.5L66.3 193.8L67 193L67.7 192.3L68.4 191.6L69.1 190.9L69.8 190.2L70.5 189.5L71.2 188.8L71.9 188.1L72.6 187.4L73.3 186.7L74 186L74.8 185.3L75.5 184.5L76.2 183.8L76.9 183.1L77.6 182.4L78.3 181.7L79 181L79.7 180.3L80.4 179.6L81.1 178.9L81.8 178.2L82.5 177.5L83.3 176.7L84 176L84.7 175.3L85.4 174.6L86.1 173.9L86.8 173.2L87.5 172.5L88.2 171.8L88.9 171.1L89.6 170.4L90.3 169.7L91 169L91.8 168.2L92.5 167.5L93.2 166.8L93.9 166.1L94.6 165.4L95.3 164.7L96 164L96.7 163.3L97.4 162.6L98.1 161.9L98.8 161.2L99.5 160.5L100.3 159.8L101 159L101.7 158.3L102.4 157.6L103.1 156.9L103.8 156.2L104.5 155.5L105.2 154.8L105.9 154.1L106.6 153.4L107.3 152.7L108 152L108.8 151.3L109.5 150.5L110.2 149.8L110.9 149.1L111.6 148.4L112.3 147.7L113 147L113.7 146.3L114.4 145.6L115.1 144.9L115.8 144.2L116.5 143.5L117.3 142.8L118 142L118.7 141.3L119.4 140.6L120.1 139.9L120.8 139.2L121.5 138.5L122.2 137.8L122.9 137.1L123.6 136.4L124.3 135.7L125 135L125.8 134.3L126.5 133.5L127.2 132.8L127.9 132.1L128.6 131.4L129.3 130.7L130 130L130.7 129.3L131.4 128.6L132.1 127.9L132.8 127.2L133.5 126.5L134.3 125.7L135 125L135.7 124.3L136.4 123.6L137.1 122.9L137.8 122.2L138.5 121.5L139.2 120.8L139.9 120.1L140.6 119.4L141.3 118.7L142 118L142.8 117.2L143.5 116.5L144.2 115.8L144.9 115.1L145.6 114.4L146.3 113.7L147 113L147.7 112.3L148.4 111.6L149.1 110.9L149.8 110.2L150.5 109.5L151.3 108.7L152 108L152.7 107.3L153.4 106.6L154.1 105.9L154.8 105.2L155.5 104.5L156.2 103.8L156.9 103.1L157.6 102.4L158.3 101.7L159 101L159.8 100.2L160.5 99.5L161.2 98.8L161.9 98.1L162.6 97.4L163.3 96.7L164 96L164.7 95.3L165.4 94.6L166.1 93.9L166.8 93.2L167.5 92.5L168.3 91.7L169 91L169.7 90.3L170.4 89.6L171.1 88.9L171.8 88.2L172.5 87.5L173.2 86.8L173.9 86.1L174.6 85.4L175.3 84.7L176 84L176.8 83.2L177.5 82.5L178.2 81.8L178.9 81.1L179.6 80.4L180.3 79.7L181 79L181.7 78.3L182.4 77.6L183.1 76.9L183.8 76.2L184.5 75.5L185.3 74.7L186 74L186.7 73.3L187.4 72.6L188.1 71.9L188.8 71.2L189.5 70.5L190.2 69.8L190.9 69.1L191.6 68.4L192.3 67.7L193 67L193.8 66.2L194.5 65.5L195.2 64.8L195.9 64.1L196.6 63.4L197.3 62.7L198 62L198.7 61.3L199.4 60.6L200.1 59.9L200.8 59.2L201.5 58.5L202.3 57.7L203 57L203.7 56.3L204.4 55.6L205.1 54.9L205.8 54.2L206.5 53.5L207.2 52.8L207.9 52.1L208.6 51.4L209.3 50.7L210 50L210.8 49.2L211.5 48.5L212.2 47.8L212.9 47.1L213.6 46.4L214.3 45.7L215 45" stroke-width="2.2"/><text x="206" y="54.9" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">f</text><path d="M95 45L95.7 45.7L96.4 46.4L97.1 47.1L97.8 47.8L98.5 48.5L99.3 49.2L100 50L100.7 50.7L101.4 51.4L102.1 52.1L102.8 52.8L103.5 53.5L104.2 54.2L104.9 54.9L105.6 55.6L106.3 56.3L107 57L107.8 57.8L108.5 58.5L109.2 59.2L109.9 59.9L110.6 60.6L111.3 61.3L112 62L112.7 62.7L113.4 63.4L114.1 64.1L114.8 64.8L115.5 65.5L116.3 66.3L117 67L117.7 67.7L118.4 68.4L119.1 69.1L119.8 69.8L120.5 70.5L121.2 71.2L121.9 71.9L122.6 72.6L123.3 73.3L124 74L124.8 74.8L125.5 75.5L126.2 76.2L126.9 76.9L127.6 77.6L128.3 78.3L129 79L129.7 79.7L130.4 80.4L131.1 81.1L131.8 81.8L132.5 82.5L133.3 83.3L134 84L134.7 84.7L135.4 85.4L136.1 86.1L136.8 86.8L137.5 87.5L138.2 88.2L138.9 88.9L139.6 89.6L140.3 90.3L141 91L141.8 91.8L142.5 92.5L143.2 93.2L143.9 93.9L144.6 94.6L145.3 95.3L146 96L146.7 96.7L147.4 97.4L148.1 98.1L148.8 98.8L149.5 99.5L150.3 100.3L151 101L151.7 101.7L152.4 102.4L153.1 103.1L153.8 103.8L154.5 104.5L155.2 105.2L155.9 105.9L156.6 106.6L157.3 107.3L158 108L158.8 108.8L159.5 109.5L160.2 110.2L160.9 110.9L161.6 111.6L162.3 112.3L163 113L163.7 113.7L164.4 114.4L165.1 115.1L165.8 115.8L166.5 116.5L167.3 117.3L168 118L168.7 118.7L169.4 119.4L170.1 120.1L170.8 120.8L171.5 121.5L172.2 122.2L172.9 122.9L173.6 123.6L174.3 124.3L175 125L175.8 125.8L176.5 126.5L177.2 127.2L177.9 127.9L178.6 128.6L179.3 129.3L180 130L180.7 130.7L181.4 131.4L182.1 132.1L182.8 132.8L183.5 133.5L184.3 134.3L185 135L185.7 135.7L186.4 136.4L187.1 137.1L187.8 137.8L188.5 138.5L189.2 139.2L189.9 139.9L190.6 140.6L191.3 141.3L192 142L192.8 142.8L193.5 143.5L194.2 144.2L194.9 144.9L195.6 145.6L196.3 146.3L197 147L197.7 147.7L198.4 148.4L199.1 149.1L199.8 149.8L200.5 150.5L201.3 151.3L202 152L202.7 152.7L203.4 153.4L204.1 154.1L204.8 154.8L205.5 155.5L206.2 156.2L206.9 156.9L207.6 157.6L208.3 158.3L209 159L209.8 159.8L210.5 160.5L211.2 161.2L211.9 161.9L212.6 162.6L213.3 163.3L214 164L214.7 164.7L215.4 165.4L216.1 166.1L216.8 166.8L217.5 167.5L218.3 168.3L219 169L219.7 169.7L220.4 170.4L221.1 171.1L221.8 171.8L222.5 172.5L223.2 173.2L223.9 173.9L224.6 174.6L225.3 175.3L226 176L226.8 176.8L227.5 177.5L228.2 178.2L228.9 178.9L229.6 179.6L230.3 180.3L231 181L231.7 181.7L232.4 182.4L233.1 183.1L233.8 183.8L234.5 184.5L235.3 185.3L236 186L236.7 186.7L237.4 187.4L238.1 188.1L238.8 188.8L239.5 189.5L240.2 190.2L240.9 190.9L241.6 191.6L242.3 192.3L243 193L243.8 193.8L244.5 194.5L245.2 195.2L245.9 195.9L246.6 196.6L247.3 197.3L248 198L248.7 198.7L249.4 199.4L250.1 200.1L250.8 200.8L251.5 201.5L252.3 202.3L253 203L253.7 203.7L254.4 204.4L255.1 205.1L255.8 205.8L256.5 206.5L257.2 207.2L257.9 207.9L258.6 208.6L259.3 209.3L260 210L260.8 210.8L261.5 211.5L262.2 212.2L262.9 212.9L263.6 213.6L264.3 214.3L265 215" stroke-width="2.2"/><text x="231" y="169.9" fill="currentColor" stroke="none" text-anchor="start" font-style="italic">g</text><circle cx="155" cy="105" r="3" fill="currentColor" stroke="none"/><text x="155" y="95.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text></svg>', true),
  -- mat-09-039 · şekilli · doğrulandı
  ('7964f577-0d22-594c-9cf6-5b321244f906'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 2,
   'Şekildeki Venn şemasında ayrık bölgelerdeki eleman sayıları verilmiştir.
Buna göre $s((A \cup B) \setminus C)$ kaçtır?',
   '{"options":["16","18","19","20","25"],"correctIndex":3}'::jsonb,
   '$(A \cup B) \setminus C$ kümesi, $A$ veya $B$''nin içinde olup $C$ kümesinin dışında kalan bölgelerden oluşur. Bunlar sırasıyla yalnızca $A$ ($9$), yalnızca $A \cap B$ ($4$) ve yalnızca $B$ ($7$) bölgeleridir. Toplam eleman sayısı $9 + 4 + 7 = 20$ bulunur.',
   'A şıkkı ($16$), ikişerli kesişim olan $AB = 4$ bölgesini çıkarmayıp yalnızca $9 + 7 = 16$ alan adayı; E şıkkı ($25$) ise dıştaki $5$ veya $C$''nin içindeki bir bölgeyi de ekleyenleri yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 270" width="320" height="270" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><rect x="4" y="4" width="312" height="262" rx="6" stroke-width="1.4"/><text x="18" y="24.9" fill="currentColor" stroke="none" text-anchor="start" font-weight="600">E</text><circle cx="120" cy="100" r="70" fill="currentColor" fill-opacity="0.06"/><text x="62" y="42.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">A</text><circle cx="200" cy="100" r="70" fill="currentColor" fill-opacity="0.06"/><text x="258" y="42.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">B</text><circle cx="160" cy="165" r="70" fill="currentColor" fill-opacity="0.06"/><text x="160" y="249.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">C</text><text x="92" y="86.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">9</text><text x="228" y="86.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">7</text><text x="160" y="204.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">6</text><text x="160" y="76.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">4</text><text x="118" y="146.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">3</text><text x="202" y="146.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">2</text><text x="160" y="122.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">3</text><text x="294" y="254.6" fill="currentColor" stroke="none" text-anchor="middle" font-size="13">5</text></svg>', true),
  -- mat-09-040 · şekilli · doğrulandı
  ('b6355885-5f57-534d-bd42-82f9f5a3a558'::uuid, 'Matematik & Geometri', 'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik', 'multiple_choice', 3,
   'Şekildeki işlem makinesine girilen sayıya ok üzerindeki işlem uygulanıp $7$ ile bölümünden kalan $y$ değeri elde edilmekte, ardından bu $y$ değeri tekrar girişe verilerek sistem art arda çalıştırılmaktadır.
Başlangıçta girişe $x = 2025$ yazıldığında $29.$ turun sonunda çıkışta hangi $y$ değeri görülür?',
   '{"options":["0","1","2","4","5"],"correctIndex":4}'::jsonb,
   'Önce $2025$ sayısının $7$ ile bölümünden kalan bulunur: $2025 = 7 \cdot 289 + 2 \equiv 2$ (mod $7$).
Şimdi turlar mod $7$''de takip edilir:
- $1.$ tur: $3(2) + 1 = 7 \equiv 0$ (mod $7$)
- $2.$ tur: $3(0) + 1 = 1 \equiv 1$ (mod $7$)
- $3.$ tur: $3(1) + 1 = 4 \equiv 4$ (mod $7$)
- $4.$ tur: $3(4) + 1 = 13 \equiv 6$ (mod $7$)
- $5.$ tur: $3(6) + 1 = 19 \equiv 5$ (mod $7$)
- $6.$ tur: $3(5) + 1 = 16 \equiv 2$ (mod $7$)
$6$ turda bir $(0, 1, 4, 6, 5, 2)$ dizisi tekrar eder. $29 = 6 \cdot 4 + 5$ olduğundan $29.$ turun sonunda $5.$ turdaki değer olan $5$ elde edilir.',
   'C şıkkı ($2$) veya B şıkkı ($1$), $29$ sayısını yanlış periyoda bölerek ya da başlangıç kalanı olan $2$''yi $1.$ tur sanarak bir adım kaydıran adayı yakalar.',
   array['lisans_gygk', 'b_grubu_gygk']::text[], null, '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 354 66" width="354" height="66" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" font-family="DM Sans, Arial, sans-serif" font-size="14"><line x1="50" y1="33" x2="142.6" y2="33" stroke-width="1.4"/><path d="M142.6 33 L135.3 36.1 M142.6 33 L135.3 29.9" stroke-width="1.4"/><text x="96.3" y="46.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">×3, +1</text><line x1="211.4" y1="33" x2="304" y2="33" stroke-width="1.4"/><path d="M304 33 L296.6 36.1 M304 33 L296.6 29.9" stroke-width="1.4"/><text x="257.7" y="46.2" fill="currentColor" stroke="none" text-anchor="middle" font-size="12">mod 7</text><circle cx="33" cy="33" r="17" fill="currentColor" fill-opacity="0.06"/><text x="33" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">x</text><rect x="142.6" y="16" width="68.7" height="34" rx="6" fill="currentColor" fill-opacity="0.06"/><text x="177" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">3x + 1</text><circle cx="321" cy="33" r="17" fill="currentColor" fill-opacity="0.06"/><text x="321" y="37.9" fill="currentColor" stroke="none" text-anchor="middle" font-weight="600">y</text></svg>', true)
on conflict (id) do update set
  lesson = excluded.lesson, topic = excluded.topic, question_type = excluded.question_type,
  difficulty = excluded.difficulty, prompt_text = excluded.prompt_text,
  interaction_data = excluded.interaction_data, explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap, exam_scopes = excluded.exam_scopes,
  education_level = excluded.education_level, figure_svg = excluded.figure_svg, is_active = true;
