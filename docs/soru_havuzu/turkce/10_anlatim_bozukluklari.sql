-- ==========================================================================
-- KADRO SORU HAVUZU · KPSS GY Türkçe · Anlatım Bozuklukları (10 soru) · SUPABASE SQL
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
  'Anlatım Bozuklukları',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde gereksiz sözcük kullanımı vardır?',
  '{"options":["Toplantıya daha önceden herkesi çağırdık.","Yarın sabah erkenden kalkıp işe gideceğim.","Kitabı okuduktan sonra bana ver.","Çocuklar parkta uzun süre oynadı.","Yeni evimiz oldukça geniş."],"correctIndex":0}'::jsonb,
  '"Daha önce" ve "önceden" aynı anlamı taşır; birlikte kullanılması gereksiz tekrardır.',
  '"Daha" sözcüğü derece bildirdiği için gerekli görünür. Oysa "önceden" ile birlikte kullanıldığında aynı zaman anlamı iki kez verilir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde özne-yüklem uyumsuzluğu vardır?',
  '{"options":["Biz bu işi yapmak istiyoruz.","O, bu işi yapmak istiyor.","Siz bu işi yapmak istiyorsunuz.","Sen bu işi yapmak istiyorsun.","Ben bu işi yapmak istiyor."],"correctIndex":4}'::jsonb,
  '"Ben" öznesi birinci tekil kişidir; yüklemin "istiyorum" olması gerekir. "İstiyor" üçüncü tekil kişidir. Diğer şıklarda özne ile yüklemin kişi ekleri uyumludur.',
  'Cümleler birbirine çok benzediği için aday kişi eklerini hızlıca okuyup geçebilir. Her şıkta öznenin kişisi ile yüklemin kişi ekini tek tek karşılaştırmak gerekir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde anlam çelişkisi vardır?',
  '{"options":["Salon küçük olduğu için herkes sığmadı.","Yalnızca birkaç kişi geldi, salon tamamen doldu.","Birkaç kişi geldi, bu yüzden toplantı ertelendi.","Sınıf kalabalıktı, herkes zor oturdu.","Toplantıya çok kişi katıldı."],"correctIndex":1}'::jsonb,
  '"Yalnızca birkaç kişi" ile "salon tamamen doldu" ifadeleri birbiriyle çelişir.',
  'Salonun dolması için çok kişi gelmesi gerekir. "Birkaç kişi" ifadesi bunu desteklemediği için çelişki oluşur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde anlam belirsizliği vardır?',
  '{"options":["Sabah erkenden kalkıp işe gitti.","Kitabı okuduktan sonra bana verdi.","Dün akşam arkadaşım bize geldi.","Onu çok seven arkadaşıyla gezmeye çıktı.","Annem bana yeni bir elbise aldı."],"correctIndex":3}'::jsonb,
  '"Onu çok seven arkadaşıyla" ifadesinde sevenin kim olduğu belirsizdir: arkadaşı mı, kendisi mi? Bu anlam belirsizliği yaratır.',
  'Cümle düzgün kurulmuş gibi göründüğü için aday belirsizliği fark etmeyebilir. İfade iki farklı biçimde okunabiliyorsa belirsizlik vardır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde ortak öge kullanımından kaynaklanan bir anlatım bozukluğu vardır?',
  '{"options":["Ahmet''i hem severim hem sayarım.","Ahmet''i çok severim ve ona saygı duyarım.","Ahmet''i çok severim ve saygı duyarım.","Ahmet''e hem sevgi duyarım hem saygı beslerim.","Ahmet''i ve Mehmet''i ziyaret ettim."],"correctIndex":2}'::jsonb,
  '"Sevmek" fiili belirtili nesne (-i) ister, "saygı duymak" ise dolaylı tümleç (-e) ister. Tek öğeyle iki yüklem kullanılırsa ortak öge hatası oluşur.',
  'Cümleler akıcı göründüğü için hata fark edilmeyebilir. Yüklemlerin istediği ekler farklı olduğunda aynı ögeyi ortak kullanmak bozukluğa yol açar.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde deyim yanlış kullanılmıştır?',
  '{"options":["Bu konuyu yönetim kurulunda masaya yattık.","Çocuğun sözlerine kulak verdi.","Önceki hatalarına göz yumdu.","Yeni göreve başlayınca işlerin başını çekti.","Verilen sözü tutmak için elinden geleni yaptı."],"correctIndex":0}'::jsonb,
  'Doğru deyim "masaya yatırmak"tır; yani bir konuyu derinlemesine ele almak. "Masaya yattık" bu hâliyle yanlış kullanılmıştır.',
  '"Masaya yatmak" ifadesi deyim gibi görünür. Ancak kalıplaşmış deyim "masaya yatırmak"tır ve çekimi bu şekilde yapılır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde karşılaştırmadan kaynaklanan bir anlatım bozukluğu vardır?',
  '{"options":["Bu yılın soruları geçen yılın sorularından daha zordu.","Bu yılın sınavı geçen yılınkinden daha zordu.","Bu yıl sorulan sorular, geçen yılkilerden daha zordu.","Bu yılın sınavı, geçen yılın sınavından daha zordu.","Bu yılın soruları geçen yılın sınavından daha zordu."],"correctIndex":4}'::jsonb,
  'Karşılaştırmada aynı türden varlıklar kıyaslanmalıdır. "Sorular" ile "sınav" farklı varlıklardır; bu nedenle kıyas mantıksızdır.',
  'Cümle akıcı olduğu için hata fark edilmez. Karşılaştırmanın iki tarafı da aynı türden olmalıdır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde anlatım bozukluğu yoktur?',
  '{"options":["Kimse bir şey söylemedi, ancak herkes konuşuyordu.","Yarın sabah erkenden evden çıkıp hemen işe gideceğim.","Ben bu soruları çözmek istiyorsun.","Daha önceden haberimiz olsaydı gelirdik.","Geri geri geriye döndü."],"correctIndex":1}'::jsonb,
  'Doğru şık anlam, uyum ve tekrar bakımından sorunsuzdur. Diğer cümlelerde çelişki, uyumsuzluk ve gereksiz sözcük vardır.',
  '"Hemen" ve "erkenden" birlikte kullanıldığı için tekrar sanılabilir. Ancak ikisi farklı kavramları anlatır: zaman ve ardışıklık.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde neden-sonuç mantığı bakımından bir bozukluk vardır?',
  '{"options":["Yağmur yağdığı için sokaklar ıslandı.","Sınava çalıştığı için başarılı oldu.","Çok yorulduğundan erken yattı.","Çok sağlam olmadığı için bu köprüden geçmek tehlikeli değildir.","Hava soğuk olduğu için montunu giydi."],"correctIndex":3}'::jsonb,
  'Köprünün sağlam olmaması geçmenin tehlikeli olduğunu gösterir. Cümle bunun tersini söylediği için neden-sonuç ilişkisi mantıksızdır.',
  'Cümlede "için" bağlacı kullanıldığı için neden-sonuç bağı kurulmuş gibi görünür. Ancak bağın içeriği çelişkilidir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Anlatım Bozuklukları',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisi anlatım bozukluğu bakımından diğerlerinden farklıdır?',
  '{"options":["Geri geri geriye döndü.","Daha önceden herkesi uyarmıştı.","Ben bu soruları çözmek istiyorsun.","Ortalama olarak yaklaşık yüz kişi geldi.","Ayrıca ek olarak bir de ödül verdiler."],"correctIndex":2}'::jsonb,
  'Diğer cümlelerde gereksiz sözcük kullanımı vardır. Doğru şıkta ise özne ile yüklem arasında kişi uyumsuzluğu vardır.',
  'Hepsinde bir hata bulunduğu için aday ayrım yapmakta zorlanır. Soru, hata türünün farklı olduğu cümleyi ister.',
  array['lisans_gygk']::text[],
  'lisans'
);
