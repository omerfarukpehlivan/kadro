-- =============================================================================
-- 📖 KADRO KONU ANLATIMI — Matematik & Geometri · Rasyonel ve Ondalık Sayılar
-- Kaynak: docs/konu_anlatimi/matematik/03_rasyonel_ve_ondalik_sayilar.md
-- Üreten: tools/konu_anlatimi_to_sql.mjs (TASK-169)
-- Not: Tamamen idempotenttir (on conflict (id) do update).
-- =============================================================================

begin;

insert into public.topic_lesson_units (
  id,
  lesson,
  topic,
  unit_order,
  title,
  summary,
  estimated_minutes,
  blocks,
  exam_scopes,
  content_version,
  is_published,
  updated_at
) values (
  'matematik_geometri.rasyonel_ve_ondalik_sayilar.01',
  'Matematik & Geometri',
  'Rasyonel ve Ondalık Sayılar',
  1,
  'Bölüm 1: Kesir Çeşitleri, İşlemler ve Merdivenli İfadeler',
  '$a$ ve $b$ birer tam sayı ve $b \neq 0$ olmak üzere $\frac{a}{b}$ biçiminde yazılabilen sayılara rasyonel sayı denir; burada $a$ pay, $b$ ise paydadır.  Paydası $0$ olan ifadeler tanımsız, hem payı hem paydası $0$ olan $\frac{0}{0}$ biçimindeki ifadeler ise belirsizdir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "$a$ ve $b$ birer tam sayı ve $b \\neq 0$ olmak üzere $\\frac{a}{b}$ biçiminde yazılabilen sayılara **rasyonel sayı** denir; burada $a$ pay, $b$ ise paydadır. Paydası $0$ olan ifadeler **tanımsız**, hem payı hem paydası $0$ olan $\\frac{0}{0}$ biçimindeki ifadeler ise **belirsizdir**. Kesrin işaretinden bağımsız olarak payın mutlak değeri paydanın mutlak değerinden küçükse kesir **basit kesir** ($\\lvert a \\rvert < \\lvert b \\rvert$), payın mutlak değeri paydanın mutlak değerine büyük veya eşitse **bileşik kesir** ($\\lvert a \\rvert \\ge \\lvert b \\rvert$) adını alır. Bir tam sayı ile basit kesrin toplamı biçiminde yazılan ifadelere ($2\\frac{1}{3}$ gibi) **tam sayılı kesir** denir ve gizli toplama içerir: $2\\frac{1}{3} = 2 + \\frac{1}{3} = \\frac{7}{3}$."
  },
  {
    "type": "heading",
    "text": "Kesirlerle Dört İşlem ve Ana Kesir Çizgisi"
  },
  {
    "type": "paragraph",
    "text": "Rasyonel sayılarda toplama ve çıkarma yapılırken **paydalar eşitlenir**; çarpma işleminde paylar kendi arasında, paydalar kendi arasında çarpılır (işleme başlamadan önce çapraz sadeleştirme yapmak büyük sayıları önler); bölme işleminde ise birinci kesir aynen yazılır, ikinci kesir ters çevrilip çarpılır. Burada en önemli görsel detay **ana kesir çizgisidir** ($=$ veya $+$ işaretinin tam hizasındaki uzun çizgi). Örneğin $\\dfrac{a}{\\dfrac{b}{c}} = a \\cdot \\frac{c}{b} = \\frac{ac}{b}$ iken $\\dfrac{\\dfrac{a}{b}}{c} = \\frac{a}{b} \\cdot \\frac{1}{c} = \\frac{a}{bc}$ sonucunu verir. İşlem içinde hem büyük kesir hem de yanında $\\div$ veya $\\cdot$ işareti varsa önce parantezler ve kesir blokları hesaplanır, ardından soldan sağa çarpma-bölme uygulanır."
  },
  {
    "type": "heading",
    "text": "Merdivenli (Basamaklı) Kesir Soruları"
  },
  {
    "type": "paragraph",
    "text": "**Merdivenli kesir** sorularında iki temel yaklaşım vardır: Değer hesaplama sorularında işlemlere **en içteki / en alttaki** küçük kesirden başlanarak adım adım yukarıya doğru sadeleştirme yapılır. Buna karşılık bilinmeyen içeren denklem sorularında payda eşitlemek yerine **dıştan içe doğru** kapak açma yöntemi uygulanır: ana sayıdan başlayarak her katmanın kaç olması gerektiği sırayla yazılır ve $x$ doğrudan elde edilir. Sonsuza giden devirli merdivenli yapılarda ($x = 2 + \\dfrac{3}{2 + \\dfrac{3}{\\cdots}}$) ise kendini tekrarlayan blok yeniden $x$''e eşitlenerek denklem çözülür. Kesir içeren basit denklem sorularında payda eşitlemeye başlamadan önce aynı paydaya sahip kesirleri yan yana toplamak veya kesri tam sayılı biçimde ayırmak ($\\frac{x+3}{x} = 1 + \\frac{3}{x}$) işlemi büyük ölçüde sadeleştirir."
  },
  {
    "type": "table",
    "headers": [
      "İfade Türü",
      "Tanım Koşulu",
      "Örnekler"
    ],
    "rows": [
      [
        "Basit Kesir",
        "$\\lvert \\text{Pay} \\rvert < \\lvert \\text{Payda} \\rvert$",
        "$\\frac{3}{5}$, $-\\frac{2}{7}$, $0$"
      ],
      [
        "Bileşik Kesir",
        "$\\lvert \\text{Pay} \\rvert \\ge \\lvert \\text{Payda} \\rvert$ ve $\\text{Payda} \\neq 0$",
        "$\\frac{7}{4}$, $-\\frac{9}{5}$, $1$, $-1$"
      ],
      [
        "Tam Sayılı Kesir",
        "$\\text{Tam} + \\text{Basit Kesir}$",
        "$-2\\frac{1}{4} = -(2 + \\frac{1}{4}) = -\\frac{9}{4}$"
      ],
      [
        "Tanımsız İfade",
        "$\\text{Payda} = 0$ (Pay $\\neq 0$)",
        "$\\frac{5}{x - 3}$ ifadesi $x = 3$''te tanımsızdır"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "$$3 + \\dfrac{4}{1 + \\dfrac{2}{x - 1}} = 5$$ denklemini dıştan içe çözelim. $3$ ile toplandığında $5$ veren kesir $2$''dir; yani $\\dfrac{4}{1 + \\frac{2}{x-1}} = 2$. Payı $4$ olan bir kesrin sonucu $2$ ise paydası $2$ olmalıdır: $1 + \\dfrac{2}{x-1} = 2$. Buradan $\\dfrac{2}{x-1} = 1$ elde edilir ve pay ile payda eşitlenerek $x - 1 = 2$ çıkar. Son olarak $-1$ karşıya $+1$ olarak geçer ve $x = 3$ bulunur. İkinci bir sayısal örnekte ise $\\dfrac{2 + \\frac{1}{3}}{1 - \\frac{1}{6}} \\div \\frac{7}{10}$ işlemini yapalım: üst kısım $\\frac{7}{3}$, alt kısım $\\frac{5}{6}$ olduğundan büyük kesir $\\frac{7}{3} \\cdot \\frac{6}{5} = \\frac{14}{5}$ çıkar; ardından $\\div \\frac{7}{10}$ işlemini ters çevirip çarparsak $\\frac{14}{5} \\cdot \\frac{10}{7} = 4$ elde edilir."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Negatif tam sayılı kesirlerde eksi işareti yalnızca tam kısma değil **sayının tamamına** aittir: $-2\\frac{1}{3}$ ifadesi $-2 + \\frac{1}{3}$ değil, $-(2 + \\frac{1}{3}) = -\\frac{7}{3}$ demektir. Ayrıca merdivenli kesirlerde ana kesir çizgisinin nerede olduğunu karıştırmak $\\frac{a/b}{c}$ ile $\\frac{a}{b/c}$ değerlerini tamamen değiştirir. Son olarak, denklem sonunda bulduğun $x$ değerinin merdivendeki hiçbir paydayı sıfır yapmadığını kontrol etmelisin."
  },
  {
    "type": "key_points",
    "items": [
      "Paydayı sıfır yapan değer kesri tanımsız yapar; denklem çözümlerinde bulunan kökü paydalarda mutlaka test et.",
      "$-a\\frac{b}{c} = -(a + \\frac{b}{c})$ eşittir; eksi işareti tam sayı ile kesrin toplamının tamamına aittir.",
      "Sayısal merdiven sorularını en alttan yukarıya, bilinmeyenli denklem sorularını en dıştan içe çöz.",
      "İşlem önceliğinde kesir içi bölme ve yanındaki bölme/çarpma işaretlerinde soldan sağa sırayı koru."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "10b14a4a-f9a8-5142-b69c-fda388bee8ce",
      "1604c153-10ce-55b5-a089-8a57195ece13"
    ]
  }
]'::jsonb,
  '{"b_grubu_gygk"}'::text[],
  1,
  true,
  timezone('utc'::text, now())
) on conflict (id) do update set
  lesson = excluded.lesson,
  topic = excluded.topic,
  unit_order = excluded.unit_order,
  title = excluded.title,
  summary = excluded.summary,
  estimated_minutes = excluded.estimated_minutes,
  blocks = excluded.blocks,
  exam_scopes = excluded.exam_scopes,
  content_version = excluded.content_version,
  is_published = excluded.is_published,
  updated_at = excluded.updated_at;

insert into public.topic_lesson_units (
  id,
  lesson,
  topic,
  unit_order,
  title,
  summary,
  estimated_minutes,
  blocks,
  exam_scopes,
  content_version,
  is_published,
  updated_at
) values (
  'matematik_geometri.rasyonel_ve_ondalik_sayilar.02',
  'Matematik & Geometri',
  'Rasyonel ve Ondalık Sayılar',
  2,
  'Bölüm 2: Ondalık Sayılar ve Devirli Ondalık Açılımlar',
  'Paydası $10$ veya $10$''un pozitif tam sayı kuvveti ($10, 100, 1000, \ldots$) olarak yazılabilen rasyonel sayılara ondalık sayı denir.  Örneğin $0{,}12 = \frac{12}{100}$ ve $2{,}4 = \frac{24}{10}$ biçiminde yazılır.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Paydası $10$ veya $10$''un pozitif tam sayı kuvveti ($10, 100, 1000, \\ldots$) olarak yazılabilen rasyonel sayılara **ondalık sayı** denir. Örneğin $0{,}12 = \\frac{12}{100}$ ve $2{,}4 = \\frac{24}{10}$ biçiminde yazılır. Ondalık sayılarda toplama ve çıkarma yapılırken **virgüller alt alta** gelecek biçimde hizalanır ve eksik basamaklar sağdan $0$ ile tamamlanır. Çarpmada ise sayılar virgül yokmuş gibi çarpılır, sonra her iki çarpandaki virgülden sonraki basamak sayıları toplanarak sağdan sola virgül kaydırılır."
  },
  {
    "type": "heading",
    "text": "Ondalık Bölmede Basamak Eşitleme"
  },
  {
    "type": "paragraph",
    "text": "Sınavda en çok hız kazandıran işlem **ondalık kesir bölmesidir**. İki ondalık sayıyı bölerken pay ve paydada virgülden sonraki basamak sayıları eşitlenir; eksik basamağa $0$ eklenip **virgüller tamamen silinir**. Örneğin $\\dfrac{0{,}08}{0{,}4}$ kesrinde payda virgülden sonra $2$, paydada $1$ basamak vardır. Paydayı $0{,}40$ yaparsak basamak sayıları eşitlenir ve virgüller silinerek doğrudan $\\dfrac{8}{40} = \\frac{1}{5} = 0{,}2$ bulunur. Bu yöntemi her ondalık bölmede alışkanlık hâline getirirsen $10$''un negatif kuvvetleriyle uğraşırken basamak kaydırma hatası yapmazsın."
  },
  {
    "type": "heading",
    "text": "Devirli Ondalık Sayıları Kesre Çevirme"
  },
  {
    "type": "paragraph",
    "text": "Virgülden sonra belirli bir rakam veya rakam grubunun sonsuza kadar düzenli biçimde tekrar ettiği sayılara **devirli ondalık sayı** denir ($1{,}\\overline{2} = 1{,}222\\ldots$ veya $0{,}1\\overline{6} = 0{,}1666\\ldots$). Devirli sayıları kesre dönüştürmenin genel formülü şudur:"
  },
  {
    "type": "paragraph",
    "text": "$$\\text{Devirli Sayı} = \\frac{\\text{Sayının Tamamı} - \\text{Devretmeyen Kısım}}{\\text{Virgülden Sonra Devreden Kadar } 9, \\text{ Devretmeyen Kadar } 0}$$"
  },
  {
    "type": "paragraph",
    "text": "Örneğin $0{,}1\\overline{6}$ sayısında sayının tamamı $16$, devretmeyen kısım $1$''dir; virgülden sonra $1$ devreden ($9$) ve $1$ devretmeyen ($0$) rakam olduğundan kesir değeri $\\dfrac{16 - 1}{90} = \\frac{15}{90} = \\frac{1}{6}$ olur. Özel bir durum olarak $0{,}\\overline{9} = \\frac{9}{9} = 1$''dir; yani sonu $\\overline{9}$ ile devreden sayılar bir üst basamağa yuvarlanır ($2{,}\\overline{9} = 3$, $2{,}3\\overline{9} = 2{,}4$). Ondalık bir sayıyı $10$ tabanında çözümleyerek $a{,}bc$ yapılarında $a + 0{,}1b + 0{,}01c$ yazmak da bilinmeyenli basamak sorularında işe yarar. Ayrıca bir $0{,}\\overline{ab} + 0{,}\\overline{ba}$ toplamında doğrudan $\\frac{ab + ba}{99} = \\frac{11(a + b)}{99} = \\frac{a + b}{9}$ sadeleşmesi ortaya çıkar; bu kalıp sıkça tam sayı yapan rakam çifti sorularında kullanılır."
  },
  {
    "type": "paragraph",
    "text": "Bir rasyonel sayının ondalık açılımının **sonlu** olup olmadığını belirlemek için kesri en sade hâline getirdikten sonra paydasına bakılır: paydada yalnızca $2$ ve $5$ asal çarpanları varsa açılım sonludur; $3, 7, 11$ gibi başka bir asal çarpan kalıyorsa sayı mutlaka devirli ondalık açılıma dönüşür."
  },
  {
    "type": "table",
    "headers": [
      "Ondalık Sayı",
      "Pay/Payda Dönüşümü",
      "Sade Kesir Değeri"
    ],
    "rows": [
      [
        "$0{,}08 \\div 0{,}4$",
        "$0{,}08 \\div 0{,}40 = \\frac{8}{40}$",
        "$\\frac{1}{5}$ ($0{,}2$)"
      ],
      [
        "$1{,}\\overline{2}$",
        "$\\frac{12 - 1}{9}$",
        "$\\frac{11}{9}$"
      ],
      [
        "$0{,}1\\overline{6}$",
        "$\\frac{16 - 1}{90}$",
        "$\\frac{1}{6}$"
      ],
      [
        "$2{,}3\\overline{9}$",
        "$\\frac{239 - 23}{90} = \\frac{216}{90}$",
        "$2{,}4$ ($\\frac{12}{5}$)"
      ]
    ]
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "$$1{,}\\overline{2} + 0{,}\\overline{4} - 0{,}1\\overline{6}$$ işlemini hesaplayalım. Üç sayıyı da formülle kesre çevirelim: $1{,}\\overline{2} = \\frac{12 - 1}{9} = \\frac{11}{9}$, $0{,}\\overline{4} = \\frac{4}{9}$ ve $0{,}1\\overline{6} = \\frac{16 - 1}{90} = \\frac{15}{90} = \\frac{1}{6}$. İlk iki kesri toplarsak $\\frac{11}{9} + \\frac{4}{9} = \\frac{15}{9} = \\frac{5}{3}$ olur. Ardından çıkarma yapılır: $\\frac{5}{3} - \\frac{1}{6} = \\frac{10 - 1}{6} = \\frac{9}{6} = \\frac{3}{2} = 1{,}5$. Başka bir örnekte $\\frac{0{,}12}{0{,}04} + \\frac{0{,}45}{0{,}15} - \\frac{0{,}08}{0{,}4}$ işlemi verilseydi $3 + 3 - 0{,}2 = 5{,}8$ sonucu elde edilirdi."
  },
  {
    "type": "callout",
    "kind": "mnemonic",
    "text": "**ÜSTTE HEPSİNDEN DEVRETMEYİ ÇIKAR, ALTTA VİRGÜL SAĞINA BAK**: Payda yazarken virgülden **önceki** tam kısma kesinlikle $0$ veya $9$ koyma! Yalnızca virgülden sonrasına bak: üstünde çizgi varsa $9$, yoksa $0$ yaz."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "İki hata çok sık tekrarlanır: Birincisi, $\\dfrac{0{,}08}{0{,}4}$ ifadesinde basamak sayısını eşitlemeden virgül atıp $\\frac{8}{4} = 2$ bulmaktır; doğrusu $\\frac{8}{40} = 0{,}2$''dir. İkincisi, $0{,}1\\overline{6}$ dönüşümünde paydaya $99$ yazmak ya da $1{,}\\overline{2}$ için payı $12$ almak yerine $12 - 1 = 11$ çıkarma adımını unutmaktır. Ayrıca $0{,}1\\overline{6}$ içinde payı $16 - 1 = 15$ yerine $16 - 6$ gibi yazmamaya dikkat et."
  },
  {
    "type": "key_points",
    "items": [
      "Ondalık bölmede pay ve paydanın virgülden sonraki basamak sayılarını $0$ ekleyerek eşitle, sonra virgülleri kaldır.",
      "Devirli ondalık dönüşümünde pay için tüm sayıdan devretmeyen kısım çıkarılır (tam kısım dahil).",
      "Payda oluşturulurken yalnızca virgülden sonraki rakamlara bakılır: devreden kadar $9$, devretmeyen kadar $0$.",
      "Sonu $\\overline{9}$ ile biten sayılar daima bir üst ondalık basamağa eşittir ($0{,}\\overline{9} = 1$)."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "19d990ec-495f-5912-98e4-8875d1d577f5",
      "201bc13e-935e-5839-9c79-de5c5749cc7a"
    ]
  }
]'::jsonb,
  '{"b_grubu_gygk"}'::text[],
  1,
  true,
  timezone('utc'::text, now())
) on conflict (id) do update set
  lesson = excluded.lesson,
  topic = excluded.topic,
  unit_order = excluded.unit_order,
  title = excluded.title,
  summary = excluded.summary,
  estimated_minutes = excluded.estimated_minutes,
  blocks = excluded.blocks,
  exam_scopes = excluded.exam_scopes,
  content_version = excluded.content_version,
  is_published = excluded.is_published,
  updated_at = excluded.updated_at;

insert into public.topic_lesson_units (
  id,
  lesson,
  topic,
  unit_order,
  title,
  summary,
  estimated_minutes,
  blocks,
  exam_scopes,
  content_version,
  is_published,
  updated_at
) values (
  'matematik_geometri.rasyonel_ve_ondalik_sayilar.03',
  'Matematik & Geometri',
  'Rasyonel ve Ondalık Sayılar',
  3,
  'Bölüm 3: Rasyonel Sayılarda Sıralama ve Örüntülü Çarpım/Toplamlar',
  'Rasyonel sayıları küçükten büyüğe ya da büyükten küçüğe sıralarken her zaman payda eşitlemeye çalışmak büyük sayılarda vakit kaybettirir.',
  4,
  '[
  {
    "type": "paragraph",
    "text": "Rasyonel sayıları küçükten büyüğe ya da büyükten küçüğe sıralarken her zaman payda eşitlemeye çalışmak büyük sayılarda vakit kaybettirir. Bunun yerine KPSS''de dört hızlı strateji kullanılır:"
  },
  {
    "type": "paragraph",
    "text": "1. **Paydalar eşitse:** Pozitif kesirlerde payı büyük olan kesir büyüktür ($\\frac{7}{13} > \\frac{5}{13}$). 2. **Paylar eşitse:** Pozitif kesirlerde paydası **küçük** olan kesir büyüktür ($\\frac{7}{9} > \\frac{7}{11}$). Paylar eşit değilse küçük katsayılarla payları eşitlemek çoğu zaman payda eşitlemekten çok daha kolaydır. 3. **Pay ile payda arasındaki farklar eşitse:** Pozitif **basit kesirlerde** (pay < payda) sayılar büyüdükçe kesir **$1$''e yaklaşır ve büyür**; örneğin $\\frac{11}{13} < \\frac{17}{19} < \\frac{23}{25}$. Pozitif **bileşik kesirlerde** (pay > payda) ise sayılar büyüdükçe kesir **$1$''e yaklaşır ve küçülür**; örneğin $\\frac{13}{11} > \\frac{19}{17} > \\frac{25}{23}$. 4. **Negatif kesirlerde:** Önce hepsini **pozitif gibi sırala**, ardından tüm eşitsizlik yönlerini tam tersine çevir. Örneğin $\\frac{11}{13} < \\frac{17}{19} < \\frac{23}{25}$ ise $-\\frac{23}{25} < -\\frac{17}{19} < -\\frac{11}{13}$ olur."
  },
  {
    "type": "heading",
    "text": "Sayı Doğrusu ve Teleskopik Zincir İşlemler"
  },
  {
    "type": "paragraph",
    "text": "Sıralama ve sayı doğrusu içeren sorularda kesirlerin hangi tam sayılar arasında yer aldığını belirlemek (tam sayılı kesre çevirmek) işi kolaylaştırır. Ayrıca $0{,}5 < a < 1$ ve $2 < b < 2{,}5$ gibi pozitif aralıklarda $\\frac{b}{a}$ oranının en büyük ve en küçük değerleri soruluyorsa uç değerler analiz edilir: oranın üst sınırı için $b$ en büyük, $a$ en küçük seçilir ($\\frac{2{,}5}{0{,}5} = 5$); alt sınırı için ise $b$ en küçük, $a$ en büyük seçilir ($\\frac{2}{1} = 2$)."
  },
  {
    "type": "figure",
    "svg": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 300 64\" width=\"300\" height=\"64\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.8\" stroke-linecap=\"round\" stroke-linejoin=\"round\" font-family=\"DM Sans, Arial, sans-serif\" font-size=\"14\"><line x1=\"12\" y1=\"30\" x2=\"292\" y2=\"30\"/><path d=\"M292 30 l-8 -4 m8 4 l-8 4\"/><path d=\"M12 30 l8 -4 m-8 4 l8 4\"/><line x1=\"30\" y1=\"25\" x2=\"30\" y2=\"35\" stroke-width=\"1.2\"/><text x=\"30\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">0</text><line x1=\"150\" y1=\"25\" x2=\"150\" y2=\"35\" stroke-width=\"1.2\"/><text x=\"150\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">1</text><line x1=\"270\" y1=\"25\" x2=\"270\" y2=\"35\" stroke-width=\"1.2\"/><text x=\"270\" y=\"51.9\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"11\">2</text><text x=\"90\" y=\"16.6\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"13\" font-style=\"italic\">1/2</text><text x=\"132\" y=\"16.6\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"13\" font-style=\"italic\">11/13</text><text x=\"140.4\" y=\"16.6\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"13\" font-style=\"italic\">23/25</text><text x=\"159.6\" y=\"16.6\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"13\" font-style=\"italic\">25/23</text><text x=\"171.6\" y=\"16.6\" fill=\"currentColor\" stroke=\"none\" text-anchor=\"middle\" font-size=\"13\" font-style=\"italic\">13/11</text><circle cx=\"90\" cy=\"30\" r=\"5\" fill=\"currentColor\" stroke=\"none\"/><circle cx=\"132\" cy=\"30\" r=\"5\" fill=\"currentColor\" stroke=\"none\"/><circle cx=\"140.4\" cy=\"30\" r=\"5\" fill=\"currentColor\" stroke=\"none\"/><circle cx=\"159.6\" cy=\"30\" r=\"5\" fill=\"currentColor\" stroke=\"none\"/><circle cx=\"171.6\" cy=\"30\" r=\"5\" fill=\"currentColor\" stroke=\"none\"/></svg>",
    "caption": "Şekil 2. Basit ve bileşik kesirlerin pay-payda farkı sabitken sayı doğrusunda $1$''e yaklaşımı"
  },
  {
    "type": "paragraph",
    "text": "**Örüntülü kesir çarpım ve toplamları** da rasyonel sayılar testlerinin vazgeçilmez kalıbıdır. Özellikle $\\left(1 - \\frac{1}{2}\\right)\\left(1 - \\frac{1}{3}\\right)\\cdots\\left(1 - \\frac{1}{n}\\right)$ gibi parantez çarpımlarında önce her parantez içi tek kesre çevrilir ($\\frac{1}{2} \\cdot \\frac{2}{3} \\cdots \\frac{n-1}{n}$); çapraz sadeleşmelerle yalnızca ilk pay ve son payda kalır ($\\frac{1}{n}$). Toplama zincirlerinde ise $\\frac{1}{k(k+1)} = \\frac{1}{k} - \\frac{1}{k+1}$ ayrıştırması yapıldığında aradaki tüm terimler birbirini götürür ve geriye sadece ilk terim eksi son terim kalır. Eğer çarpım $\\left(1 + \\frac{1}{2}\\right)\\left(1 + \\frac{1}{3}\\right)\\cdots\\left(1 + \\frac{1}{n}\\right)$ biçimindeyse terimler $\\frac{3}{2} \\cdot \\frac{4}{3} \\cdots \\frac{n+1}{n}$ şeklinde sadeleşir ve sonuç $\\frac{n+1}{2}$ olur. Her iki durumda da yönü ezberlemek yerine ilk üç kesri yan yana yazıp sadeleşmenin sol üstten sağ alta mı yoksa sol alttan sağ üste mi gittiğini görmek sıfır hata sağlar."
  },
  {
    "type": "callout",
    "kind": "example",
    "text": "$a = \\frac{11}{13}$, $b = \\frac{17}{19}$ ve $c = \\frac{23}{25}$ sayılarını sıralayalım. Paydaları eşitlemek yerine pay ile payda farklarına bakarız: $13 - 11 = 2$, $19 - 17 = 2$, $25 - 23 = 2$. Üç kesir de pozitif **basit kesir** olduğu ve farkları sabit ($2$) kaldığı için pay ve paydası büyüdükçe kesir $1$''e yaklaşarak büyür. Dolayısıyla $a < b < c$ olur. Eğer aynı kesirler negatif ($-a, -b, -c$) olsaydı yön değişir ve $-c < -b < -a$ sıralaması elde edilirdi. Bir başka soru kalıbında ise $A = \\frac{5}{7} + \\frac{9}{11} + \\frac{13}{15}$ verilir ve $B = \\frac{9}{7} + \\frac{13}{11} + \\frac{17}{15}$ ifadesinin $A$ türünden değeri sorulur; burada paydaları eşitlemek yerine $B - A$ ya da $B + A$ hesaplanır: $B - A = \\frac{4}{7} + \\frac{4}{11} + \\frac{4}{15}$ değil, kesirler aynı paydalarda tam sayı üretecek şekilde düzenlenmiştir ($A + B$ veya $B - A$ tek tek denenerek tam sayı çıktığı görülür)."
  },
  {
    "type": "callout",
    "kind": "trap",
    "text": "Farkı sabit kesirlerde basit ve bileşik kesir kuralını karıştırmak en yaygın hatadır: $1$''den küçük basit kesirlerde sayı büyüdükçe değer büyür ($\\frac{11}{13} < \\frac{23}{25}$), $1$''den büyük bileşik kesirlerde ise sayı büyüdükçe değer küçülür ($\\frac{13}{11} > \\frac{25}{23}$). Negatiflerde ise mutlaka pozitif sıralamayı yazıp sonra tüm yönleri tersine çevir. İki kesirli ifadeyi \"türünden\" yazma sorularında asla payda eşitleme; $A + B$ veya $A - B$ kurup tam sayı çıkaran kombinasyonu bul."
  },
  {
    "type": "key_points",
    "items": [
      "Pay-payda farkı sabit pozitif **basit kesirlerde** büyük rakamlı olan büyüktür.",
      "Pay-payda farkı sabit pozitif **bileşik kesirlerde** büyük rakamlı olan küçüktür.",
      "Negatif kesir sıralamasında pozitif gibi sırala, ardından tüm yönleri tersine çevir.",
      "Çarpım ve toplam zincirlerinde ilk $3$ terimi ve son terimi açarak çapraz sadeleşen kalıbı gör."
    ]
  },
  {
    "type": "check_questions",
    "question_ids": [
      "20b71b11-2ea1-5340-a05e-f5a37e02f641",
      "227b490f-7e3e-5bc7-ab90-4d57efdcac4e"
    ]
  }
]'::jsonb,
  '{"b_grubu_gygk"}'::text[],
  1,
  true,
  timezone('utc'::text, now())
) on conflict (id) do update set
  lesson = excluded.lesson,
  topic = excluded.topic,
  unit_order = excluded.unit_order,
  title = excluded.title,
  summary = excluded.summary,
  estimated_minutes = excluded.estimated_minutes,
  blocks = excluded.blocks,
  exam_scopes = excluded.exam_scopes,
  content_version = excluded.content_version,
  is_published = excluded.is_published,
  updated_at = excluded.updated_at;

commit;
