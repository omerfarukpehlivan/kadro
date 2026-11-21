-- ==========================================================================
-- KADRO SORU HAVUZU · KPSS GY Türkçe · Yazım Kuralları (10 soru) · SUPABASE SQL
-- exam_scopes: lisans_gygk · education_level: lisans · Özgün üretim (TASK-140 pilot)
-- Not: Dosya yeniden çalıştırılırsa aynı sorular çoğalır; önce silmeden tekrar çalıştırma.
-- ==========================================================================

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  exam_scopes,
  education_level
) values
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde bir yazım yanlışı vardır?',
  '{"options":["Bir çok kişi toplantıya katıldı.","Birkaç gündür hiçbir haber alamadık.","Her şeyi unutup yeni bir sayfa açtı.","Hiçbir şey olmamış gibi konuştu.","Bugünlerde herkes bir şeyler yapıyor."],"correctIndex":0}'::jsonb,
  '"Birçok" bitişik yazılır. Diğer cümlelerde "birkaç, her şey, hiçbir şey, bir şeyler" doğru yazılmıştır.',
  '"Bir şeyler" ayrı yazıldığı için "bir çok" da ayrı yazılabilirmiş gibi düşünülür. Oysa "birçok" tek sözcüktür ve bitişik yazılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde "de/da" bağlacı ya da eki yanlış yazılmıştır?',
  '{"options":["Ankara''da yaşıyor.","Ders çalış da başarılı ol.","Sen de benim gibi düşünüyorsun.","Bugün de erken kalktı.","Çocuklar bahçe de oynuyordu."],"correctIndex":4}'::jsonb,
  '"Bahçe de oynuyordu" cümlesindeki "de" bulunma hâl ekidir ve bitişik yazılmalıdır (bahçede). Diğer cümlelerde doğru kullanım vardır.',
  'Aşırı dikkatli aday her "de"yi ayrı yazılması gereken bağlaç sanabilir. Ancak ek olan "-de" sözcüğe bitişik yazılır; yerine "dahi" konulamıyorsa ektir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde "ki" yanlış yazılmıştır?',
  '{"options":["Duydum ki sınav ertelenmiş.","Dünki toplantı çok verimliydi.","Sanki hiçbir şey olmamış gibi konuştu.","Mademki geldin, birlikte yemek yiyelim.","O kadar yorgundu ki hemen uyudu."],"correctIndex":1}'::jsonb,
  'Zaman bildiren "dün" sözcüğüne gelen ek "-kü" biçimindedir: "dünkü". "Dünki" yanlıştır. Diğerlerinde bağlaç olan "ki" ayrı, "sanki" ve "mademki" bitişik yazılmıştır.',
  '"Ki" ilgi eki olduğu için bitişik yazıldığı bilinse de, ünlü uyumuna girip "-kü" olduğu gözden kaçar. Aday "dünki"yi doğru sanabilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde büyük harflerin kullanımı bakımından bir yanlışlık vardır?',
  '{"options":["Ankara''dan İstanbul''a trenle gittik.","Karadeniz''in iklimi nemlidir.","Atatürk Orman Çiftliği''ni gezdik.","Yarın Pazartesi toplantı var.","Türk Dil Kurumu yeni bir sözlük yayımladı."],"correctIndex":3}'::jsonb,
  'Gün ve ay adları özel isim sayılmaz, küçük harfle başlar: "pazartesi". Diğer cümlelerde özel adlar doğru yazılmıştır.',
  'Takvimle ilgili adlar belirgin olduğu için büyük harfle yazılabileceği sanılır. TDK kurallarına göre gün ve ay adları küçük harfle yazılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde sayıların yazımıyla ilgili bir yanlışlık vardır?',
  '{"options":["Yirmi beş kişi toplantıya katıldı.","Kitabın yüz kırkıncı sayfasını okudu.","Ellibeş kişi toplantıya katıldı.","On altı yaşındaki genç, ödülü aldı.","Üç yüz yirmi lira ödedi."],"correctIndex":2}'::jsonb,
  'Sayılar, rakamla yazılmıyorsa ayrı yazılır: "elli beş". "Ellibeş" yanlıştır.',
  '"Yirmibeş" gibi bitişik yazımlar günlük yazışmada sık görüldüğü için doğru sanılabilir. Kurala göre sayıların her bir sözcüğü ayrı yazılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde bir yazım yanlışı vardır?',
  '{"options":["Yeni şöför araçla ilgili bilgi verdi.","Herkes toplantıya zamanında geldi.","Sürpriz parti herkesi şaşırttı.","Yanlış anlaşılma hemen giderildi.","Antrenör takımın çalışmalarını izledi."],"correctIndex":0}'::jsonb,
  'Doğru yazım "şoför"dür. Diğer sözcükler (herkes, sürpriz, yanlış, antrenör) doğru yazılmıştır.',
  'Yabancı kökenli sözcüklerin telaffuza göre yazılması sık yapılan bir hatadır. "Şöför" okunuşa yakın görünse de TDK yazımı "şoför"dür.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde yazım yanlışı vardır?',
  '{"options":["Önerisini kabul etmedi.","Bu durumu hissetti.","Yardım etmek istedi.","Dosyayı reddetti.","Hatayı af etti ve konuyu kapattı."],"correctIndex":4}'::jsonb,
  'Ses olayına (ünsüz ikizleşmesine) uğrayan birleşik fiiller bitişik yazılır: "affetti". "Af etti" yanlıştır. "Kabul etmek" ve "yardım etmek" ise ayrı yazılır.',
  '"Yardım etmek" ve "kabul etmek" ayrı yazıldığı için "af etmek" de ayrı yazılabilirmiş sanılır. Oysa "af" sözcüğünün sonundaki ünsüz ikileşerek birleşik fiil oluşturur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde ikilemelerin yazımında yanlışlık vardır?',
  '{"options":["Kös kös oturup bekledi.","Çoluk-çocuk bayramda büyüklerinin ellerini öptü.","Eski püskü elbiseler giymişti.","Yavaş yavaş yürüyüp köye ulaştı.","Hızlı hızlı konuşmaya başladı."],"correctIndex":1}'::jsonb,
  'İkilemeler ayrı yazılır, arasına tire konmaz: "çoluk çocuk". Diğer şıklarda ikilemeler doğru yazılmıştır.',
  'Birbirini tamamlayan sözcükler arasına tire konabileceği sanılır. TDK kurallarına göre ikilemeler ayrı yazılır, tire kullanılmaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde "mi" soru ekinin yazımı yanlıştır?',
  '{"options":["Gelecek misin?","Sen mi söyledin?","Güzel mi güzel bir manzaraydı.","Yarın bize geleceklermi?","Yorgun musunuz?"],"correctIndex":3}'::jsonb,
  'Soru eki "mi" her zaman ayrı yazılır: "gelecekler mi". Diğer cümlelerde ek doğru yazılmıştır.',
  'Ek gibi görünen "mi" sözcüğünün çekim eki sanılması yaygın hatadır. Soru eki ayrı yazılsa da ses uyumuna uyar ve kendinden önceki sözcüğe bitişmez.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Yazım Kuralları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde yazım yanlışı yoktur?',
  '{"options":["Birşey söylemeden ayrıldı.","Hiç bir zaman pes etmedi.","Herkes bir şeyler söylemek istiyordu.","Her hangi bir sorun çıkmadı.","Bir kaç gün sonra döneceğini söyledi."],"correctIndex":2}'::jsonb,
  'Doğru yazımlar "bir şey", "hiçbir", "herhangi" ve "birkaç"tır. Diğer cümlelerde bu sözcükler yanlış yazılmıştır; yalnızca "bir şeyler" doğru yazılmıştır.',
  'Her şıkta bitişik-ayrı yazım karışıklığı olduğu için aday doğru olanı seçmekte zorlanır. "Birşey, hiç bir, her hangi, bir kaç" ifadelerinin tamamı hatalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
);
