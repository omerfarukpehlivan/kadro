-- ==========================================================================
-- KADRO SORU HAVUZU · KPSS GY Türkçe · Cümlede Anlam (10 soru) · SUPABASE SQL
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
  'Cümlede Anlam',
  'multiple_choice',
  2,
  'Aşağıdaki cümlelerin hangisinde neden-sonuç ilişkisi yoktur?',
  '{"options":["Hava kararmadan eve dönmek için acele etti.","Yağmur şiddetini artırdığı için maç ertelendi.","Eğitimini tamamladığından işe hemen alındı.","Sınava yeterince çalışmadığından beklediği notu alamadı.","Aşırı trafik yüzünden toplantıya geç kaldı."],"correctIndex":0}'::jsonb,
  'İlk cümlede "için" bağlacı amaç bildirir: acele etmenin amacı eve karanlıktan önce dönmektir. Diğer cümlelerde eylemin gerekçesi (neden) belirtilmiştir.',
  '"-için" bağlacı hem neden hem amaç bildirir. Aday ilk cümleyi de neden-sonuç sanabilir; oysa burada eylem henüz gerçekleşmemiş bir hedefe yöneliktir, bu yüzden ilişki amaç-sonuçtur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde koşul (şart) anlamı vardır?',
  '{"options":["Gelir gelmez işe koyuldu.","Yorulduğu hâlde çalışmayı sürdürdü.","Çocuk, görmek için parmaklarının ucuna yükseldi.","Kitabı okurken notlar aldı.","Erken kalkarsan treni kaçırmazsın."],"correctIndex":4}'::jsonb,
  '"Kalkarsan" ifadesindeki şart eki, treni kaçırmamanın erken kalkmaya bağlı olduğunu gösterir. Diğer cümlelerde sırasıyla zaman, karşıtlık, amaç ve zaman anlamı vardır.',
  '"Gelir gelmez" gibi ardışık eylemler, zamansal bağ nedeniyle koşul sanılabilir. Koşul anlamı, bir işin gerçekleşmesinin başka bir duruma bağlı olmasıdır; zaman bildiren yapılar bunu belirtmez.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde bir karşılaştırma yapılmıştır?',
  '{"options":["Bu kitap kardeşime aittir.","Bu yıl kardeşim, benden daha çok kitap okudu.","Okulun bahçesi çok geniş bir alanı kaplıyor.","Sınavdan bir hafta önce tüm konuları bitirdim.","Annem her sabah erkenden kalkar."],"correctIndex":1}'::jsonb,
  '"Benden daha çok" ifadesi iki kişinin okuma miktarını kıyaslar. Diğer cümlelerde herhangi bir kıyas yoktur.',
  '"Çok geniş bir alan" gibi derece bildiren ifadeler karşılaştırma gibi görünebilir; ancak karşılaştırma için iki varlığın ya da durumun birbirine göre değerlendirilmesi gerekir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Okuma alışkanlığı, bir toplumun kültür düzeyini belirleyen ölçütlerden biridir." cümlesinden aşağıdaki yargılardan hangisine ulaşılamaz?',
  '{"options":["Kültür düzeyi tek bir ölçütle belirlenmez.","Okuma alışkanlığı kültür düzeyinin göstergelerindendir.","Okumayan toplumlarda kültür düzeyi düşük kalabilir.","Toplumların kültür düzeyini yalnızca okuma alışkanlığı belirler.","Kültür düzeyini belirleyen başka ölçütler de olabilir."],"correctIndex":3}'::jsonb,
  'Cümle, okuma alışkanlığının "ölçütlerden biri" olduğunu söyler. "Yalnızca" ifadesi, tek ölçüt olduğunu ileri sürer; bu yargıya cümleden ulaşılamaz.',
  '"Kültür düzeyi" ve "okuma alışkanlığı" ilişkisi vurgulandığı için aşırı genelleme içeren şık doğru sanılır. Oysa cümledeki "biri" sözü başka ölçütlerin de var olduğunu gösterir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde nesnel bir yargı vardır?',
  '{"options":["İstanbul''un manzarası dünyanın en güzel manzarasıdır.","Bu film, yılın en etkileyici yapımıdır.","Türkiye''nin başkenti Ankara''dır.","Sabah yürüyüşü herkes için çok keyifli bir alışkanlıktır.","Çay, kahveden çok daha lezzetlidir."],"correctIndex":2}'::jsonb,
  'Nesnel yargı kişiden kişiye değişmeyen, doğrulanabilen bilgidir. Başkentin Ankara olması bir olgudur; diğerleri kişisel beğeni bildirir.',
  '"En güzel", "en etkileyici" gibi kesin görünen ifadeler genel kabul gibi algılanabilir. Oysa bunlar kişisel değerlendirmedir ve kanıtlanamaz.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde abartma (mübalağa) vardır?',
  '{"options":["Korkudan kalbi yerinden çıkacaktı.","Sınavdan sonra okul bahçesinde buluştuk.","Yağmurdan sonra hava biraz serinledi.","Annem akşam yemeği için çorba pişirdi.","Toplantı iki saat sürdü."],"correctIndex":0}'::jsonb,
  'Kalbin yerinden çıkması gerçekte olamayacağı hâlde korkunun şiddetini anlatmak için büyütülmüştür; bu abartmadır.',
  '"Hava biraz serinledi" gibi derece bildiren ifadeler abartı sanılabilir. Abartıda gerçek olamayacak ölçüde büyütme vardır.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  2,
  '"Erken yatma kararım, yarın çok erken kalkmam gerekmesinden kaynaklanıyor." cümlesiyle anlamca en yakın cümle aşağıdakilerden hangisidir?',
  '{"options":["Yarın erken kalkacağım için bu akşam geç yatabilirim.","Bu akşam erken yatacağım, çünkü yarın geç kalkacağım.","Erken yatmam gerektiğinden yarın erken kalkamayacağım.","Yarın erken kalkmak için bu akşam hiç uyumayacağım.","Yarın çok erken kalkmam gerektiği için bu akşam erken yatacağım."],"correctIndex":4}'::jsonb,
  'Soru kökünde erken yatmanın nedeni yarın erken kalkma zorunluluğudur. Aynı neden-sonuç ilişkisi yalnızca doğru şıkta korunur.',
  'Diğer şıklar da "erken yatmak" ve "erken kalkmak" sözcüklerini taşıdığı için benzer görünür. Ancak neden ve sonucun yerini değiştirir ya da ilişkiyi tersine çevirir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerin hangisinde olasılık anlamı vardır?',
  '{"options":["Mutlaka zamanında gelmeliydi.","Yarın yağmur yağabilir.","Kapıyı kapat.","Ah, keşke daha erken gelseydi.","Çok güzel konuştu."],"correctIndex":1}'::jsonb,
  '"-ebilir" ekiyle kurulan yapı, eylemin gerçekleşmesinin kesin olmadığını, mümkün olduğunu bildirir. Diğer cümlelerde gereklilik, emir, istek ve olumlu bir yargı vardır.',
  '"Keşke gelseydi" gibi dilek bildiren yapılar, kesinlik taşımadığı için olasılıkla karıştırılabilir. Olasılıkta eylemin gerçekleşme ihtimali söz konusudur.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  1,
  'Aşağıdaki cümlelerden hangisi diğerlerinden anlamca farklıdır?',
  '{"options":["Bu işi Ali''den başkası yapamaz.","Bu işi yalnızca Ali yapabilir.","Bu işi ancak Ali yapabilir.","Bu işi Ali''nin yanı sıra başkaları da yapabilir.","Bu işi Ali dışında kimse beceremez."],"correctIndex":3}'::jsonb,
  'Dört cümle de işin yalnızca Ali tarafından yapılabileceğini söyler. "Yanı sıra başkaları da" ifadesi ise başka kişilerin de yapabileceğini bildirir.',
  'Bütün cümleler aynı fiil ve aynı kişiyle kurulduğu için aday farkı yakalamakta zorlanır. Anlamı belirleyen, "yalnızca, ancak, başkası yapamaz" gibi sınırlayıcı sözlerdir.',
  array['lisans_gygk']::text[],
  'lisans'
),
(
  'Türkçe',
  'Cümlede Anlam',
  'multiple_choice',
  3,
  '"Başarı, yalnızca yetenekle değil, yetenekle birlikte süreklilik gösteren çabayla da gelir." cümlesine göre aşağıdakilerden hangisi söylenemez?',
  '{"options":["Yetenek, başarıda tek başına yeterli sayılmaz.","Çabanın sürekli olması önemlidir.","Başarı için yetenek hiçbir zaman gerekli değildir.","Yetenek ve çaba birlikte başarıya katkı sağlar.","Başarıyı etkileyen birden çok etken vardır."],"correctIndex":2}'::jsonb,
  'Cümle yeteneği reddetmez; yetenekle çabanın birlikte gerekli olduğunu söyler. Yeteneğin hiç gerekli olmadığını ileri süren yargı cümleyle çelişir.',
  '"Yalnızca yetenekle değil" ifadesi, yeteneğin önemsiz olduğu şeklinde yanlış okunabilir. Oysa bu sözde yetenek yadsınmaz, yetersiz bulunur.',
  array['lisans_gygk']::text[],
  'lisans'
);
