-- ==========================================================================
-- KADRO SORU HAVUZU · KPSS GY Türkçe · Noktalama İşaretleri (10 soru) · SUPABASE SQL
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
  'Noktalama İşaretleri',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde virgül yanlış kullanılmıştır?',
  '{"options":["Sınıfa girdi, ve sessizce yerine oturdu.","Sevgili Ayşe, seni çok özledim.","Yarın, hava güzel olursa, pikniğe gideceğiz.","Elma, armut, portakal ve muz aldık.","Gitti ama dönmedi."],"correctIndex":0}'::jsonb,
  '"Ve" bağlacından önce virgül konmaz. Diğer cümlelerde virgül hitap, ara söz ve sıralama için doğru kullanılmıştır.',
  'Bağlaçlardan önce virgül konabileceği düşünülür. "Ve" gibi sıralayıcı bağlaçlardan önce virgül gerekmez.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde noktalı virgül yerinde kullanılmıştır?',
  '{"options":["Yarın gelmezse; ona haber veririm.","Çiçekler; gül, lale ve karanfildi.","Dün; çok yoruldum.","Ahmet; evde kalmak istedi.","Bahçede güller, laleler açmıştı; ağaçlar ise henüz çiçek açmamıştı."],"correctIndex":4}'::jsonb,
  'Noktalı virgül, içinde virgül bulunan ya da birbirine yakın bağımsız yargıları ayırır. Doğru şıkta virgüllü ögeler noktalı virgülle birbirinden ayrılmıştır.',
  'Şart bildiren yapılardan sonra noktalı virgül konabileceği sanılır. Oysa "gelmezse" gibi şart ifadesi, cümle bütünlüğünü bozmaz ve ayırmaya gerek duyurmaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde iki nokta yanlış kullanılmıştır?',
  '{"options":["Ayşe: Yarın gelecek misin?","Dün akşam: çok yoruldum.","Çiçekler: gül, lale, karanfil.","Annem şöyle dedi: \"Erken dön.\"","Şunu unutma: sözünü tut."],"correctIndex":1}'::jsonb,
  'İki nokta, açıklama yapılacağını ya da örnek verileceğini bildirir. "Dün akşam" bir açıklama beklemediği için iki nokta kullanılmaz.',
  'Zaman bildiren sözcüklerden sonra iki nokta gelebileceği düşünülür. Oysa iki nokta açıklama, sıralama veya aktarma öncesinde kullanılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde kesme işareti yanlış kullanılmıştır?',
  '{"options":["Ankara''da yaşıyor.","Atatürk''ün fikirleri hâlâ yol gösteriyor.","Ahmet''in kitabı masada duruyordu.","İstanbul''lu bir arkadaşım var.","1920''de açıldı."],"correctIndex":3}'::jsonb,
  'Yapım ekleri özel adlardan sonra kesme işaretiyle ayrılmaz: "İstanbullu". Diğer cümlelerde çekim ekleri doğru kesmeyle ayrılmıştır.',
  'Özel adlara gelen her ekin kesmeyle ayrıldığı sanılır. Oysa yalnızca çekim ekleri kesmeyle ayrılır; yapım ekleri ayrılmaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde soru işareti yanlış kullanılmıştır?',
  '{"options":["Nereye gidiyorsun?","Saat kaç?","Nereye gittiğini sordum?","Bunu sen mi yaptın?","Yarın gelecek misin?"],"correctIndex":2}'::jsonb,
  'Dolaylı sorularda soru işareti kullanılmaz. "Nereye gittiğini sordum" haber cümlesidir ve nokta ile biter.',
  'İçinde "nereye" gibi soru sözcüğü bulunduğu için cümle soru sanılır. Cümle soruyu aktarıyorsa nokta ile bitirilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde nokta işareti yanlış kullanılmıştır?',
  '{"options":["Cumhuriyet, 29. Ekim 1923''te ilan edildi.","5. sınıfa geçti.","Toplantı saat 17.30''da başlayacak.","Dr. Ayşe Kaya muayeneye başladı.","Kitabın 3. bölümünü okudu."],"correctIndex":0}'::jsonb,
  'Tarihte gün ve ay arasına nokta konmaz. "29 Ekim 1923" biçiminde yazılır. Diğer cümlelerde sıra sayısı, saat ve kısaltma noktaları doğrudur.',
  '"29." sıra sayısı olduğu için "29. Ekim" doğru görünebilir. Ancak tarihin içindeki gün rakamı sıra sayısı değildir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde tırnak işareti, başkasından aktarılan söz için kullanılmıştır?',
  '{"options":["\"Cimri\" sözcüğünün anlamını sordu.","Roman, \"Çalıkuşu\" adını taşıyor.","Sözcüğü \"anlam\" olarak yazdı.","\"Güzel\" sözcüğü bu cümlede zarftır.","Öğretmen: \"Yarın sınav var.\" dedi."],"correctIndex":4}'::jsonb,
  'Tırnak işareti doğru şıkta öğretmenin sözünü aynen aktarmak için kullanılmıştır. Diğerlerinde sözcük vurgulama, eser adı belirtme amacı vardır.',
  'Tırnakla yazılan her sözün aktarma olduğu sanılır. Aktarmada bir kişinin söylediği söz değiştirilmeden verilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde virgül kullanılması gerekmez?',
  '{"options":["Evet, bu konuda haklısın.","Dün akşam geç saatte yola çıktık.","Ali, bana kitabı getir.","Kitap okumayı severim, ancak vaktim yok.","Sevgili dostum, mektubunu aldım."],"correctIndex":1}'::jsonb,
  'Doğru şıkta sıralama, hitap ya da ara söz yoktur; cümle bütün olarak akar ve virgül gerektirmez. Diğer cümlelerde hitap, evet ve bağlaç öncesi virgül gerekir.',
  '"Dün akşam geç saatte" gibi zaman bildiren öbekler uzun olduğu için sonrasına virgül konabileceği düşünülür. Oysa cümlenin akışı bozulmadığı sürece virgül gerekmez.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde noktalama yönünden bir yanlışlık yoktur?',
  '{"options":["Ayşe''ye sordum, nereye gidiyorsun?","Ankara''dan İstanbul''a, geldim.","Ne güzel bir gün; diye düşündü.","Sevgili dostum, mektubunu aldım.","Dün gece: erkenden yattık."],"correctIndex":3}'::jsonb,
  'Hitap sözünden sonra virgül konur; doğru şıkta noktalama kurala uygundur. Diğer cümlelerde soru işareti, virgül, noktalı virgül ve iki nokta yanlış kullanılmıştır.',
  'Her şıkta bir noktalama işareti bulunduğu için aday hepsinin doğru olduğunu sanabilir. Yanlış kullanımlar şıkların içinde gizlidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Noktalama İşaretleri',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde virgül, eş görevli sözcükleri ayırmak için kullanılmıştır?',
  '{"options":["Sevgili dostum, nasılsın?","Yarın, hava güzelse, geleceğim.","Çarşıdan ekmek, süt, yumurta aldım.","Kitabı okudum, ama beğenmedim.","Evet, bu doğru."],"correctIndex":2}'::jsonb,
  'Doğru şıkta "ekmek, süt, yumurta" aynı görevdeki sözcükleri sıralar. Diğer cümlelerde virgül hitap, ara söz, bağlaç öncesi ve cevap sözü için kullanılmıştır.',
  'Her cümlede virgül bulunduğu için işlevi ayırt etmek zordur. Sıralama virgülü, aynı türden öğeleri art arda getirir.',
  array['lisans_gygk']::text[],
  'lisans'
);
