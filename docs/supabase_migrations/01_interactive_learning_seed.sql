-- =============================================================================
-- KADRO KPSS LİSANS GENEL KÜLTÜR — İNTERAKTİF ÖĞRENME & OYUNLAR SUPABASE MİGRASYONU
-- Oluşturulma: 2026-11-22T01:32:07.016050
-- İçerik:
--   1. public.flashcards (200 Adet KPSS Şifre & Hap Bilgi Kartı)
--   2. public.questions - true_false (100 Adet 60 Saniyede Pençe Şimşek Önermesi)
--   3. public.questions - matching (20 Tematik Set, 80 Kavram Çifti)
--   4. public.map_challenges (50 Adet Uzman KPSS Harita Pratik Sorusu)
-- =============================================================================

BEGIN;

-- -------------------------------------------------------------
-- 1. TABLO TANIMLARI & GÜVENLİK (RLS)
-- -------------------------------------------------------------
create extension if not exists "uuid-ossp";

-- Flashcards tablosu
create table if not exists public.flashcards (
  id text primary key,
  lesson text not null,
  topic text not null,
  front_text text not null,
  back_text text not null,
  order_index integer,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

alter table public.flashcards enable row level security;

do $$ begin
  if not exists (select 1 from pg_policies where tablename = 'flashcards' and policyname = 'Flashcards public read') then
    create policy "Flashcards public read" on public.flashcards for select using (true);
  end if;
end $$;

create index if not exists idx_flashcards_lesson_topic on public.flashcards (lesson, topic);
create index if not exists idx_flashcards_order on public.flashcards (order_index);

-- Map Challenges tablosu
create table if not exists public.map_challenges (
  id text primary key,
  category text not null,
  interaction_type text not null,
  difficulty integer default 2 not null,
  title text not null,
  question_text text not null,
  target_province_id text not null,
  hint text,
  explanation text not null,
  distractor_trap text,
  tag text,
  order_index integer,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

alter table public.map_challenges enable row level security;

do $$ begin
  if not exists (select 1 from pg_policies where tablename = 'map_challenges' and policyname = 'Map challenges public read') then
    create policy "Map challenges public read" on public.map_challenges for select using (true);
  end if;
end $$;

create index if not exists idx_map_challenges_category on public.map_challenges (category);

-- Questions tablosu indeks ve order_index güncellemesi
alter table public.questions add column if not exists order_index integer;
alter table public.questions alter column explanation drop not null;
create index if not exists idx_questions_type_lesson_topic on public.questions (question_type, lesson, topic);
create index if not exists idx_questions_order_index on public.questions (order_index);


-- -------------------------------------------------------------
-- 2. HAP BİLGİ KARTLARI (200 ADET)
-- -------------------------------------------------------------

insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_001', 'Tarih', 'İlk Türk Devletleri', 'İlk Türk devletlerinde hükümdara devleti yönetme yetkisinin Gök Tanrı tarafından verildiğine inanılan anlayış nedir?', 'KUT İNANCI

Bu anlayışa göre kut kan yoluyla hanedanın tüm erkek üyelerine geçer. Bu durum sık sık taht kavgalarına ve Türk devletlerinin kısa sürede parçalanmasına zemin hazırlamıştır.', 1) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_002', 'Tarih', 'İlk Türk Devletleri Teşkilatı', 'İlk Türk devletlerinde hükümet başkanı (başvezir), bakan ve askeri vali unvanları nelerdir?', 'DEVLET TEŞKİLATI KAVRAMLARI

• Ayguçı: Başvezir / Hükümet Başkanı
• Buyruk: Bakan
• Tudun: Vergi memuru / vali
• Tutuk: Askerî vali
• Bitikçi: Kâtip / Yazman
• Tigin: Hükümdar oğlu', 2) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_003', 'Tarih', 'İlk Türk Devletleri', 'Hristiyanlık dinini benimseyen Türk topluluklarının şifresi nedir?', 'ŞİFRE: A-M-A-P-K-U

• A: Avarlar
• M: Macarlar
• A: Akasirler
• P: Peçenekler
• K: Kumanlar (Kıpçaklar)
• U: Uzlar

⚠️ Bu topluluklar Hristiyanlığı kabul ettikten sonra millî benliklerini kaybedip asimile olmuşlardır.', 3) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_004', 'Tarih', 'İlk Türk Devletleri', 'Tarihte Musevilik (Yahudilik) inancını benimseyen tek Türk devleti hangisidir?', 'HAZARLAR

Ticarete önem vermiş, ordusunda paralı asker bulunduran ilk Türk devleti olmuştur. Hoşgörülü yönetimleri sayesinde dönemlerine ''Hazar Barış Çağı'' (Pax Hazarica) denilmiştir.', 4) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_005', 'Tarih', 'İlk Türk Devletleri', 'Kendi adına madeni para bastıran ilk Türk hükümdarı kimdir ve hangi devlete aittir?', 'BAGA TARKAN (TÜRGİŞLER)

Türgiş hükümdarı Baga Tarkan kendi adına madeni para bastıran ilk hükümdardır. Türgişler ayrıca Emevilerle mücadele ederek İslamiyet''in Orta Asya''ya yayılmasını bir süre geciktirmiştir.', 5) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_006', 'Tarih', 'İlk Türk Devletleri', 'Türk kara ordusunun temeli sayılan ''Onluk Sistem''i kuran hükümdar kimdir?', 'METE HAN (ASYA HUN DEVLETİ)

MÖ 209 yılı, Türk Kara Kuvvetleri''nin resmî kuruluş yılı olarak kabul edilir. Mete Han ayrıca ıslıklı oku icat etmiş ve Türk boylarını ilk kez tek bayrak altında toplamıştır.', 6) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_007', 'Tarih', 'İlk Türk Devletleri', 'Türk tarihinin ilk yazılı belgeleri olan Orhun Abideleri kimler adına dikilmiştir ve ilk Türk yazar kimdir?', 'ORHUN ABİDELERİ (GÖKTÜRK YAZITLARI)

• Vezir Tonyukuk (720) - İlk Türk tarihçisi ve yazarıdır.
• Kül Tigin (732)
• Bilge Kağan (735)

Yazıtları Danimarkalı dilbilimci Vilhelm Thomsen çözmüştür.', 7) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_008', 'Tarih', 'Türk-İslam Tarihi', 'İslamiyet''i kabul eden ilk Türk boyu ve ilk Türk devletleri hangileridir?', 'İLK TÜRK-İSLAM ÖNCÜLERİ

• İlk Boy: Karluklar (751 Talas Savaşı sonrası)
• Orta Asya''da İlk Devlet: Karahanlılar (Satuk Buğra Han)
• Avrupa''da İlk Müslüman Devlet: İtil (Volga) Bulgarları (Almış Han)', 8) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_009', 'Tarih', 'Türk-İslam Edebiyatı', 'Karahanlılar döneminde yazılan ilk Türk-İslam edebî eserleri ve yazarları kimlerdir?', 'İLK TÜRK-İSLAM ESERLERİ

• Kutadgu Bilig (İlk siyasetname): Yusuf Has Hacib
• Divanü Lugati''t-Türk (İlk Türkçe sözlük): Kaşgarlı Mahmud
• Atabetü''l-Hakayık (Ahlak kitabı): Edip Ahmet Yükneki
• Divan-ı Hikmet (İlk tasavvuf eseri): Hoca Ahmet Yesevi', 9) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_010', 'Tarih', 'Türk-İslam Tarihi', 'Türk-İslam tarihinde ''Sultan'' unvanını kullanan ilk hükümdar kimdir?', 'GAZNELİ MAHMUT

Abbasî Halifesi''ni Şii Büveyhoğulları baskısından kurtardığı için halife tarafından kendisine ''Sultan'' unvanı verilmiştir. Hindistan''a düzenlediği 17 seferle İslamiyet''in bölgede yayılmasını sağlamıştır.', 10) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_011', 'Tarih', 'Türkiye Tarihi', 'Anadolu''nun fethinde ''Keşif'', ''Yurt Açan'' ve ''Yurt Tutan'' olarak nitelendirilen 3 kilit savaş hangileridir?', 'ANADOLU''NUN FETHİ SAVAŞLARI

1. Pasinler (1048): Keşif ve ilk Selçuklu-Bizans savaşı
2. Malazgirt (1071): Yurt Açan savaş (Sultan Alparslan)
3. Miryokefalon (1176): Yurt Tutan / Tapu alan savaş (II. Kılıç Arslan - Anadolu kesin olarak Türk yurdu oldu)', 11) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_012', 'Tarih', 'Anadolu Beylikleri', 'Malazgirt Savaşı sonrası kurulan I. Dönem Anadolu Türk Beyliklerinin şifresi nedir?', 'ŞİFRE: S-A-C-I-D-M

• S: Saltuklular (Erzurum - İlk kurulan beylik)
• A: Artuklular (Mardin, Batman, Diyarbakır)
• Ç: Çaka Beyliği (İzmir - İlk denizci beylik)
• İ: İnaloğulları (Diyarbakır)
• D: Danişmentliler (Sivas, Tokat - En güçlüsü)
• M: Mengücekliler (Erzincan, Divriği)', 12) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_013', 'Tarih', 'Anadolu Beylikleri', 'Anadolu''da inşa edilen ilk Türk medresesi hangisidir ve hangi beylik yapmıştır?', 'YAĞIBASAN MEDRESESİ

Tokat Niksar''da Danişmentliler tarafından yapılmıştır. Anadolu''daki ilk medrese (yükseköğretim kurumu) kabul edilir.', 13) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_014', 'Tarih', 'Türkiye Tarihi', 'İlk Türk denizcisi kimdir ve Türk Deniz Kuvvetleri''nin kuruluşu kabul edilen olay nedir?', 'ÇAKA BEY (1081)

İzmir''de ilk Türk donanmasını kuran Çaka Bey ilk Türk amiralidir. Donanmanın kuruluş yılı olan 1081, günümüzde Türk Deniz Kuvvetleri Komutanlığı''nın kuruluş yılıdır.', 14) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_015', 'Tarih', 'Osmanlı Kuruluş Dönemi', 'Osman Bey döneminde gerçekleşen ilk teşkilatlanma ve askerî başarılar nelerdir?', 'OSMAN BEY İLKLERİ

• İlk Bizans Savaşı: Koyunhisar (Bafeus) Savaşı (1302)
• İlk madeni para: Bakır para (Mangır)
• İlk vergi: Baç vergisi (Çarşı/Pazar vergisi)
• İlk kadı ataması: Dursun Fakih (Karacahisar)', 15) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_016', 'Tarih', 'Osmanlı Kuruluş Dönemi', 'Osmanlı''nın Rumeli''deki ilk toprak parçası neresidir ve hangi padişah döneminde alınmıştır?', 'ÇİMPE KALESİ (ORHAN BEY DÖNEMİ)

Bizans İmparatoru Kantakuzen''e yapılan yardım karşılığında Gelibolu''daki Çimpe Kalesi üs olarak alınmış ve Osmanlı Rumeli''ye ilk kez adım atmıştır.', 16) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_017', 'Tarih', 'Osmanlı Kuruluş Dönemi', 'I. Murat (Hüdavendigar) döneminin idari ve askeri önemli yenilikleri nelerdir?', 'I. MURAT DÖNEMİ KİLİT GELİŞMELERİ

• ''Ülke hükümdar ve oğullarınındır'' anlayışı getirildi.
• Kapıkulu / Yeniçeri Ocağı kuruldu (Pençik sistemi).
• Rumeli Beylerbeyliği kuruldu (Merkez: Manastır, Lala Şahin Paşa).
• İlk kez sadrazamlık (Çandarlı Kara Halil) ve defterdarlık makamları ihdas edildi.', 17) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_018', 'Tarih', 'Osmanlı Kuruluş Dönemi', '1402 Ankara Savaşı''nın Osmanlı Devleti üzerindeki en yıkıcı iki sonucu nedir?', 'ANKARA SAVAŞI SONUÇLARI (1402)

1. Fetret Devri (1402-1413): Taht kavgalarıyla devlet 11 yıl padişahsız kaldı (Çelebi Mehmet son verip ikinci kurucu sayıldı).
2. Anadolu Türk siyasi birliği bozuldu ve beylikler yeniden bağımsızlık kazandı (İstanbul''un fethi 50 yıl gecikti).', 18) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_019', 'Tarih', 'Osmanlı Yükselme Dönemi', 'Fatih Sultan Mehmet''in çıkardığı Kanunname-i Âli Osman ile yasallaşan uygulamalar nelerdir?', 'KANUNNAME-İ ÂLİ OSMAN

• Kardeş katli yasallaştı (Nizam-ı âlem için).
• Müsadere usulü resmileşti (Haksız kazanç sağlayan devlet adamının malına el koyma).
• Cülus bahşişi kanunlaştı.
• Divan başkanlığı sadrazama devredildi (Padişah Kasr-ı Adil''den izlemeye başladı).', 19) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_020', 'Tarih', 'Osmanlı Yükselme Dönemi', 'Osmanlı Devleti''nde halifeliğin Osmanlı hanedanına geçmesini sağlayan savaşlar hangileridir?', 'MISIR SEFERİ (YAVUZ SULTAN SELİM)

• Mercidabık (1516) ve Ridaniye (1517) Savaşları ile Memlük Devleti yıkıldı.
• Halifelik Osmanlı''ya geçti ve teokratik yapı güçlendi.
• Kutsal Emanetler İstanbul''a getirildi ve Baharat Yolu denetimi sağlandı.', 20) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_021', 'Tarih', 'Osmanlı Yükselme Dönemi', 'Dünyanın en kısa süren meydan savaşı hangisidir ve kimin dönemindedir?', 'MOHAÇ MEYDAN MUHAREBESİ (1526)

Kanuni Sultan Süleyman komutasındaki Osmanlı ordusu, Macar ordusunu yaklaşık 2 saatte imha ederek Macaristan''ı Osmanlı hâkimiyetine bağlamıştır.', 21) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_022', 'Tarih', 'Osmanlı Yükselme Dönemi', 'Avusturya Arşidükünün protokolde Osmanlı Sadrazamına denk sayıldığı antlaşma hangisidir?', '1533 İSTANBUL (İBRAHİM PAŞA) ANTLAŞMASI

Bu antlaşmayla Osmanlı Devleti Avusturya üzerinde siyasi ve diplomatik üstünlük sağlamıştır. Bu üstünlük 1606 Zitvatorok Antlaşması''na kadar devam etmiştir.', 22) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_023', 'Tarih', 'Osmanlı Yükselme Dönemi', 'Akdeniz''in Türk gölü haline gelmesini sağlayan deniz zaferi hangisidir?', 'PREVEZE DENİZ ZAFERİ (1538)

Kaptan-ı Derya Barbaros Hayrettin Paşa komutasındaki Osmanlı donanması, Andrea Doria komutasındaki Haçlı donanmasını bozguna uğratmıştır. 28 Eylül günü günümüzde Türk Deniz Kuvvetleri Günü olarak kutlanır.', 23) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_024', 'Tarih', 'Osmanlı Duraklama Dönemi', 'Ekber ve Erşed (En yaşlı ve en olgun) sistemini getirerek taht kavgalarını önlemeyi amaçlayan padişah kimdir?', 'I. AHMET

Veraset sistemindeki son değişikliği yapmıştır. Şehzadelerin sancağa çıkma usulüne son verilmiş, yerine sarayda ''Şimşirlik / Kafes Usulü'' getirilmiştir.', 24) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_025', 'Tarih', 'Osmanlı Sınırları', 'Osmanlı Devleti''nin doğuda ve batıda en geniş sınırlara ulaştığı antlaşmalar hangileridir?', 'EN GENİŞ SINIRLAR

• Doğuda En Geniş Sınırlar: 1590 Ferhat Paşa Antlaşması (İran/Safeviler ile)
• Batıda En Geniş Sınırlar: 1672 Bucaş Antlaşması (Lehistan ile - Podolya ve Kamaniçe alındı)', 25) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_026', 'Tarih', 'Osmanlı Gerileme Dönemi', 'Osmanlı Devleti''nin Batı''nın üstünlüğünü kabul ettiği ve Lale Devri''ni başlatan antlaşma hangisidir?', '1718 PASAROFÇA ANTLAŞMASI

Avusturya ve Venedik ile imzalanmıştır. Osmanlı kaybettiği Mora''yı korumuş ancak Belgrad''ı Avusturya''ya bırakmıştır. Bu antlaşmayla fetih politikasından savunma ve barış politikasına geçilmiştir.', 26) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_027', 'Tarih', 'Osmanlı Dağılma Dönemi', 'Kırım''ın Osmanlı''dan kopuş sürecini özetleyen 3 basamak hangisidir?', 'KIRIM''IN KAYBEDİLİŞ BASAMAKLARI

1. Küçük Kaynarca (1774): Kırım bağımsız oldu (Halkı Müslüman ilk toprak kaybı; dinen halifeye bağlı kaldı).
2. Aynalıkavak Tenkihnamesi (1779): Şahin Giray''ın hanlığı tanındı.
3. Yaş Antlaşması (1792): Kırım''ın Rusya''ya ait olduğu resmen kabul edildi.', 27) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_028', 'Tarih', 'Osmanlı Islahatları', '17. Yüzyıl (Duraklama) Islahatçılarının şifresi nedir?', 'ŞİFRE: T-O-K-M-A-K

• T: Tarhuncu Ahmet Paşa (İlk modern denk bütçe)
• O: Genç Osman (İlk radikal ıslahatçı padişah / Şeyhülislamın yetkilerini kısıtladı)
• K: Kuyucu Murat Paşa
• M: IV. Murat (Bağdat Fatihi / Koçi Bey Risalesi)
• A: I. Ahmet (Ekber ve Erşed)
• K: Köprülüler (Şartlar öne sürerek sadrazam olan aile)', 28) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_029', 'Tarih', 'Osmanlı Islahatları', '18. Yüzyıl (Gerileme) Islahatçı padişahlarının kronolojik şifresi nedir?', 'ŞİFRE: 3-1-3-1-3

• III. Ahmet (Lale Devri)
• I. Mahmut (İlk Batılı askerî okul: Hendesehane)
• III. Mustafa (Esham tahvilleri / Sürat Topçuları)
• I. Abdülhamit (Ulufe alım-satımının yasaklanması)
• III. Selim (Nizam-ı Cedit dönemi / İrad-ı Cedit hazinesi)', 29) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_030', 'Tarih', 'Osmanlı Dağılma Dönemi', 'Hukukun üstünlüğü ilkesinin Osmanlı''da ilk kez kabul edildiği 1839 tarihli ferman hangisidir?', 'TANZİMAT FERMANI (GÜLHANE HATT-I HÜMAYUNU)

Sultan Abdülmecit döneminde Hariciye Nazırı Mustafa Reşit Paşa tarafından okunmuştur. Padişah ilk kez kendi gücünün üzerinde kanun gücü olduğunu kabul etmiştir (Kanun üstünlüğü).', 30) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_031', 'Tarih', 'Osmanlı Dağılma Dönemi', 'Kırım Savaşı (1853-1856) sonrasında ilan edilen ve gayrimüslimlere geniş haklar tanıyan ferman hangisidir?', 'ISLAHAT FERMANI (1856)

Paris Barış Konferansı kararlarında Avrupalı devletlerin iç işlerimize karışmasını önlemek amacıyla ilan edilmiştir. Cizye vergisi ve iltizam sistemi kaldırılmış, gayrimüslimlere memur olma, bedelli askerlik ve yerel meclislere üye olma hakkı tanınmıştır.', 31) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_032', 'Tarih', 'Osmanlı Meşrutiyet Dönemi', 'Türk tarihinin ilk yazılı anayasası hangisidir ve hangi meclislerden oluşmuştur?', 'KANUN-İ ESASİ (1876 - I. MEŞRUTİYET)

II. Abdülhamit döneminde Mithat Paşa başkanlığındaki komisyonca hazırlanmıştır. Meclis-i Umumi iki kanattan oluşur:
1. Meclis-i Mebusan (Halk tarafından 4 yıllığına seçilir)
2. Meclis-i Ayan (Padişah tarafından ömür boyu seçilir)', 32) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_033', 'Tarih', '20. Yüzyıl Başları', 'II. Meşrutiyet''in ilanını tetikleyen ve İngiltere ile Rusya''nın Osmanlı''yı paylaştığı tarihi görüşme nedir?', 'REVAL GÖRÜŞMELERİ (1908)

İngiltere ve Rusya, Reval''de Makedonya ve Boğazlar konusunda anlaştı. Bu paylaşımı engellemek isteyen İttihat ve Terakki Cemiyeti subayları (Resneli Niyazi, Enver Paşa) ayaklanarak II. Abdülhamit''e II. Meşrutiyet''i ilan ettirdi.', 33) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_034', 'Tarih', '20. Yüzyıl Başları', 'Türk tarihinde mevcut rejime (meşrutiyete) karşı çıkan ilk isyan hangisidir ve kim bastırmıştır?', '31 MART VAKASI (13 Nisan 1909)

Selanik''ten gelen ''Hareket Ordusu'' tarafından bastırılmıştır. Ordunun komutanı Mahmut Şevket Paşa, Kurmay Başkanı ise Kolağası Mustafa Kemal''dir. İsyan sonrası II. Abdülhamit tahttan indirilmiş ve yerine V. Mehmet Reşat geçmiştir.', 34) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_035', 'Tarih', '20. Yüzyıl Başları', 'Mustafa Kemal''in tarih sahnesine çıktığı ilk askerî başarısı hangisidir?', 'TRABLUSGARP SAVAŞI (1911-1912)

Mustafa Kemal ''Gazeteci Şerif Bey'' takma adıyla bölgeye gitmiş, Tobruk ve Derne''de yerel halkı örgütleyerek İtalyanlara karşı ilk büyük askerî zaferini kazanmış ve Binbaşılığa terfi etmiştir.', 35) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_036', 'Tarih', 'I. Dünya Savaşı', 'Osmanlı Devleti''nin I. Dünya Savaşı''ndaki taarruz (hücum) cepheleri hangileridir?', 'TAARRUZ CEPHELERİ ŞİFRESİ: K-K

1. Kafkas Cephesi (Enver Paşa - Sarıkamış Harekatı)
2. Kanal Cephesi (Cemal Paşa - Süveyş Kanalı)

⚠️ Diğer cepheler savunma (Çanakkale, Suriye-Filistin, Irak, Hicaz-Yemen) veya müttefiklere yardım (Galiçya, Romanya, Makedonya) cepheleridir.', 36) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_037', 'Tarih', 'I. Dünya Savaşı', 'Mustafa Kemal''in I. Dünya Savaşı''nda savaştığı cephelerin kronolojik sırası ve şifresi nedir?', 'ŞİFRE: Ç-A-K-S / ÇIKIŞ

1. Çanakkale Cephesi (Anafartalar Kahramanı - Albay rütbesi)
2. Kafkas Cephesi (Muş ve Bitlis''i Ruslardan geri aldı - General / Paşa rütbesi)
3. Suriye-Filistin Cephesi (Yıldırım Orduları Grup Komutanlığı / Katma zaferi)', 37) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_038', 'Tarih', 'Milli Mücadele', 'Mondros Ateşkes Antlaşması''nın (30 Ekim 1918) en tehlikeli iki maddesi hangileridir?', 'MONDROS''UN EN TEHLİKELİ MADDELERİ

• 7. Madde: İtilaf Devletleri güvenliklerini tehdit eden herhangi bir stratejik noktayı işgal edebilecektir (İşgallere hukuki zemin).
• 24. Madde: Vilayet-i Sitte''de (6 doğu ili: BESVED) karışıklık çıkarsa işgal edilecektir (Büyük Ermenistan devleti kurma amacı).', 38) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_039', 'Tarih', 'Milli Mücadele', 'Millî Mücadele''nin amacı, gerekçesi ve yönteminin ilk kez açıklandığı tarihî belge hangisidir?', 'AMASYA GENELGESİ (22 Haziran 1919)

• Gerekçe: Vatanın bütünlüğü, milletin bağımsızlığı tehlikededir.
• Yöntem & Amaç: ''Milletin bağımsızlığını yine milletin azim ve kararı kurtaracaktır.''
• İlk kez üstü kapalı olarak Millî Egemenlik ve Temsil Heyeti fikrinden bahsedilmiştir.', 39) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_040', 'Tarih', 'Milli Mücadele', 'Toplanış bakımından bölgesel, aldığı kararlar bakımından ulusal olan kongre hangisidir?', 'ERZURUM KONGRESİ (1919)

Doğu Anadolu ve Karadeniz müdafaa-i hukuk cemiyetlerince toplanmıştır. ''Millî sınırlar içinde vatan bir bütündür, bölünemez'' kararıyla ilk kez Misak-ı Millî sınırları çizilmiş ve Temsil Heyeti kurulmuştur.', 40) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_041', 'Tarih', 'Milli Mücadele', 'Temsil Heyeti''nin ilk kez yürütme (hükümet) yetkisini kullandığı tarihi karar nedir?', 'ALİ FUAT CEBESOY''UN ATANMASI (SİVAS KONGRESİ)

Temsil Heyeti, Ali Fuat Paşa''yı Batı Cephesi Kuvayımilliye Komutanlığı''na atayarak ilk kez bir hükümet gibi yürütme yetkisini kullanmıştır.', 41) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_042', 'Tarih', 'Milli Mücadele', 'Son Osmanlı Mebusan Meclisi''nde kabul edilen Misak-ı Millî kararlarının konuları ve şifresi nedir?', 'ŞİFRE: B-O-R-S-A-K

• B: Boğazlar
• O: Osmanlı Borçları
• R: Referandum (Halk oylaması: Kars, Ardahan, Batum, Batı Trakya, Arap toprakları)
• S: Sınırlar (Mondros imzalandığında işgal edilmemiş vatan toprakları)
• A: Azınlık Hakları
• K: Kapitülasyonlar (İlk kez tam reddedildi)', 42) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_043', 'Tarih', 'Milli Mücadele', 'I. TBMM''nin açıldıktan sonra çıkardığı ilk kanun hangisidir?', 'AĞNAM RESMİ KANUNU (24 Nisan 1920)

Küçükbaş hayvanlardan alınan Ağnam vergisinin 4 katına çıkarılmasına dair kanundur. Millî Mücadele''nin finansman ihtiyacını karşılamak amacıyla oy birliğiyle kabul edilmiştir.', 43) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_044', 'Tarih', 'Kurtuluş Savaşı', 'I. İnönü Zaferi''nin ulusal ve uluslararası sonuçlarının şifresi nedir?', 'ŞİFRE: M-İ-L-A-T

• M: Moskova Antlaşması (Sovyet Rusya ile)
• İ: İstiklal Marşı''nın kabulü (12 Mart 1921)
• L: Londra Konferansı (TBMM resmen tanındı)
• A: Afganistan Dostluk Antlaşması
• T: Teşkilat-ı Esasiye (1921 Anayasası)', 44) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_045', 'Tarih', 'Kurtuluş Savaşı', 'Doğu sınırımızı sırasıyla çizen antlaşmaların şifresi nedir ve hangisiyle kesinleşmiştir?', 'ŞİFRE: G-A-K

1. Gümrü Antlaşması (İlk zafer / Ermenistan ile)
2. Moskova Antlaşması (Batum Gürcistan''a verildi - Misak-ı Millî''den 1. taviz)
3. Kars Antlaşması (Sakarya zaferi sonrası - Doğu sınırımız KESİNLEŞTİ)', 45) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_046', 'Tarih', 'Kurtuluş Savaşı', 'Mustafa Kemal''e Başkomutanlık yetkisi hangi yenilgiden sonra verilmiştir ve hangi emirleri yayımlamıştır?', 'KÜTAHYA-ESKİŞEHİR & TEKALİF-İ MİLLİYE

Kütahya-Eskişehir muharebeleri sonrası meclis 3 aylığına tüm yetkilerini Mustafa Kemal''e devretmiştir. Mustafa Kemal hemen ardından ordunun lojistik ihtiyacını karşılamak için Tekalif-i Milliye (Millî Yükümlülük) Emirleri''ni yayımlamıştır.', 46) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_047', 'Tarih', 'Kurtuluş Savaşı', '1683 II. Viyana Kuşatması''ndan beri süren Türk geri çekilişini sona erdiren meydan savaşı hangisidir?', 'SAKARYA MEYDAN MUHAREBESİ (1921)

''Hattı müdafaa yoktur, sathı müdafaa vardır. O satıh bütün vatandır.'' emriyle kazanılmıştır. Zafer sonrası Mustafa Kemal''e TBMM tarafından ''Gazi'' unvanı ve ''Mareşal'' rütbesi verilmiştir.', 47) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_048', 'Tarih', 'Kurtuluş Savaşı', 'Mudanya Ateşkes Antlaşması ile tek kurşun atılmadan, diplomatik yolla kurtarılan bölgeler nerelerdir?', 'DİPLOMASİYLE KURTARILAN YERLER

• Doğu Trakya (Edirne, Kırklareli, Tekirdağ)
• İstanbul
• Boğazlar Çevresi

⚠️ Bu bölgeleri teslim almak üzere Trakya Yüksek Komiseri sıfatıyla Refet Bele İstanbul''a gönderilmiştir.', 48) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_049', 'Tarih', 'Lozan Barış Antlaşması', 'Lozan Barış Antlaşması''nda (1923) çözüme kavuşturulamayıp sonraya bırakılan tek konu hangisidir?', 'MUSUL MESELESİ (IRAK SINIRI)

İngiltere ile Türkiye arasındaki ikili görüşmelere bırakılmıştır. 1926 Ankara Antlaşması ile Şeyh Sait İsyanı''nın etkisiyle maalesef Musul Irak''a (İngiliz mandasına) bırakılmak zorunda kalınmıştır.', 49) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_tar_050', 'Tarih', 'Cumhuriyet Dönemi', 'Cumhuriyet döneminin ilk muhalefet partisinin adı ve kurucularının şifresi nedir?', 'TERAKKİPERVER CUMHURİYET FIRKASI (1924)

ŞİFRE: K-A-R-A-R
• K: Kazım Karabekir (Genel Başkan)
• A: Ali Fuat Cebesoy
• R: Refet Bele
• A: Adnan Adıvar
• R: Rauf Orbay

⚠️ Tüzüğünde ''Parti dinî inançlara saygılıdır'' maddesi yer almıştır.', 50) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_001', 'Coğrafya', 'Coğrafi Konum & Zaman', 'Türkiye''nin en doğusu ile en batısı arasındaki meridyen ve zaman farkı ne kadardır?', '26°-45° DOĞU MERİDYENLERİ

• Meridyen farkı: 45 - 26 = 19 meridyen
• Zaman farkı: 19 x 4 = 76 dakika yerel saat farkı vardır.
• Türkiye 2016''dan beri 45° Doğu (Iğdır) 3. Saat Dilimini (GMT+3) yıl boyunca tek ortak saat olarak kullanmaktadır.', 51) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_002', 'Coğrafya', 'Matematik Konum & Bakı', 'Türkiye''nin Kuzey Yarımküre''de ve Yengeç Dönencesi''nin kuzeyinde yer almasının gölge ve bakı üzerindeki 2 kesin sonucu nedir?', 'GÖLGE VE BAKI KURALLARI

1. Güneş ışınları hiçbir zaman 90° dik açıyla düşmez; gölge boyu asla sıfır olmaz.
2. Öğle vakti yatay düzlemlerde gölge yönü daima KUZEYİ gösterir.
3. Dağların GÜNEY yamaçları bakı etkisiyle daha fazla güneşlenir, karlar erken erir ve yerleşmeler bu yamaçta toplanır.', 52) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_003', 'Coğrafya', 'Ekinoks ve Gündüz Süreleri', '21 Haziran ve 21 Aralık tarihlerinde Türkiye''de gündüz süresi hangi yöne gidildikçe uzar?', 'GÜNDÜZ VE GECE KURALI

• 21 Haziran (Yaz gündönümü): KUZEYE gidildikçe gündüz uzar. En uzun gündüz Sinop''ta yaşanır.
• 21 Aralık (Kış gündönümü): GÜNEYE gidildikçe gündüz uzar. En uzun gündüz Hatay''da, en uzun gece Sinop''ta yaşanır.', 53) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_004', 'Coğrafya', 'Türkiye''nin İklimi & Rüzgârlar', 'Türkiye''yi etkileyen yerel rüzgârların yönleri ve sıcaklık etkisinin şifresi nedir?', 'ŞİFRE: K-A-Y-I-P  S-A-K-A-L

Kuzeyden esen soğuk rüzgârlar:
• K: Karayel (Kuzeybatı)
• Y: Yıldız (Kuzey)
• P: Poyraz (Kuzeydoğu)

Güneyden esen sıcak rüzgârlar:
• S: Samyeli / Keşişleme (Güneydoğu)
• K: Kıble (Güney)
• L: Lodos (Güneybatı)', 54) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_005', 'Coğrafya', 'Türkiye''nin Dağları (Orojenez)', 'Ege Bölgesi''ndeki kırıklı dağların (Horst) kuzeyden güneye sıralanış şifresi nedir?', 'ŞİFRE: KAZ MAYMUN YUTMUŞ BOZ AYI

• Kaz Dağları
• Madra Dağı
• Yunt Dağları
• Bozdağlar
• Aydın Dağları
• Menteşe Dağları

⚠️ Akdeniz''deki Hatay Amanos (Nur) Dağları da kırıklı (horst) yapılı bir dağdır.', 55) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_006', 'Coğrafya', 'Türkiye''nin Volkanik Dağları', 'İç Anadolu ve Doğu Anadolu''daki volkanik dağlarımızın isimleri nelerdir?', 'VOLKANİK DAĞLAR

• İç Anadolu: Karadağ, Karacadağ, Hasandağı, Melendiz, Erciyes Dağı.
• Doğu Anadolu (NEMSA): Nemrut (krater gölü var), Süphan, Tendürek (gaz/buhar çıkarır), Ağrı Dağı (En yüksek zirve - 5.137 m).
• Güneydoğu: Karacadağ (Kalkan volkan özelliği gösterir).', 56) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_007', 'Coğrafya', 'Karstik Aşınım ve Şekiller', 'Akdeniz Bölgesi''nde yer alan karstik ovaların (Polye / Gölova) şifresi nedir?', 'ŞİFRE: T-A-K-K-E-M / T-A-K-K-E

• T: Tefenni (Burdur)
• A: Acıpayam (Denizli)
• K: Korkuteli (Antalya)
• K: Kestel (Burdur)
• E: Elmalı (Antalya)
• M: Muğla Ovası

⚠️ Kalkerli yapının erimesiyle oluşan karstik aşınım düzlükleridir.', 57) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_008', 'Coğrafya', 'Delta Ovaları', 'Türkiye''nin en büyük delta ovası hangisidir ve hangi nehirler tarafından oluşturulmuştur?', 'ÇUKUROVA (ADANA)

Seyhan ve Ceyhan nehirlerinin Akdeniz''e taşıdığı alüvyonlarla oluşmuştur. Türkiye''nin en büyük delta ovası ve tarımsal üretim merkezidir.', 58) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_009', 'Coğrafya', 'Kıyı Tipleri ve Şekilleri', 'Kıyı set gölü (Lagün / Denizkulağı) ve Tombolo (Saplı ada) oluşumlarına Türkiye''den 2''şer örnek veriniz.', 'KIYI BİRİKİM ŞEKİLLERİ

• Lagün (Kıyı Set Gölü): Büyük Çekmece, Küçük Çekmece, Terkos (Durusu) ve Adana Akyatan Lagünü.
• Tombolo (Saplı Ada): Marmara Denizi''ndeki Kapıdağ Yarımadası ve Sinop İnceburun Yarımadası.', 59) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_010', 'Coğrafya', 'Kıyı Tipleri', 'Türkiye''de görülen Boyuna, Enine, Dalmaçya ve Ria tipi kıyılar nerelerde yaygındır?', 'TÜRKİYE KIYI TİPLERİ

• Boyuna Kıyı: Karadeniz ve Akdeniz (Dağlar denize paralel)
• Enine Kıyı: Ege Bölgesi (Dağlar denize dik)
• Dalmaçya Kıyı: Antalya Kaş - Finike kıyıları
• Ria Tipi Kıyı: İstanbul ve Çanakkale Boğazları, Haliç ve Güneybatı Ege (Menteşe kıyıları)', 60) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_011', 'Coğrafya', 'Türkiye''nin Gölleri', 'Türkiye''nin en derin göllerinden olan, beyaz kumsallarıyla ''Türkiye''nin Maldivleri'' anılan karstik göl hangisidir?', 'SALDA GÖLÜ (BURDUR)

Karstik ve tektonik kökenlidir. Magnezyum zengini beyaz hidromanyezit tortulları Mars gezegenindeki jeolojik yapıya benzerlik gösterir.', 61) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_012', 'Coğrafya', 'Türkiye''nin Gölleri', 'Karadeniz Bölgesi''nde heyelan kütlesinin vadi önünü tıkamasıyla oluşan Heyelan Set Gölleri hangileridir?', 'HEYELAN SET GÖLLERİ

• Bolu: Abant ve Yedigöller
• Trabzon: Sera Gölü
• Erzurum: Tortum Gölü
• Tokat: Boraboy ve Zinav Gölleri', 62) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_013', 'Coğrafya', 'Türkiye''nin Gölleri', 'Lav akıntılarının vadi önünü kapatmasıyla oluşan Doğu Anadolu''daki Volkanik Set Göllerinin şifresi nedir?', 'ŞİFRE: B-A-H-Ç-E-V-A-N

• B: Balık Gölü
• A: Aktaş Gölü
• H: Haçlı Gölü
• Ç: Çıldır Gölü (Kışın donar, atlı kızak yapılır)
• E: Erçek Gölü
• V: Van Gölü (Türkiye''nin en büyük gölü - sodalı)
• N: Nazik Gölü', 63) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_014', 'Coğrafya', 'Türkiye''nin Akarsuları', 'Türkiye sınırları dışından doğup ülkemizde denize dökülen 2 akarsu hangisidir?', 'DIŞARIDAN GELEN AKARSULAR

1. Meriç Nehri: Bulgaristan''dan doğar, Yunanistan ile sınır oluşturarak Ege Denizi''ne dökülür (Ergene kolu vardır).
2. Asi Nehri: Lübnan Dağları''ndan doğar, Suriye''den geçip Hatay Samandağ''dan Akdeniz''e dökülür.', 64) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_015', 'Coğrafya', 'Türkiye''nin Akarsuları', 'Türkiye sınırları içinden doğup Hazar Denizi''ne dökülen kapalı havza nehirlerimiz hangileridir?', 'ARAS VE KURA NEHİRLERİ

Doğu Anadolu dağlarından doğarlar, Gürcistan ve Azerbaycan üzerinden geçerek dünyanın en büyük gölü olan Hazar Denizi''ne dökülürler. Açık denize ulaşamadıkları için Hazar Kapalı Havzası akarsularıdır.', 65) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_016', 'Coğrafya', 'İklim ve Yağış Tipleri', 'Türkiye''de Konveksiyonel (Yükselim), Orografik (Yamaç) ve Cephesel (Frontal) yağışlar en çok nerelerde görülür?', 'YAĞIŞ OLUŞUM ŞEKİLLERİ

• Konveksiyonel: İç Anadolu''da ilkbaharda (''Kırkikindi'') ve Erzurum-Kars''ta yaz aylarında görülür.
• Orografik (Yamaç): Karadeniz ve Akdeniz dağlarının denize bakan yamaçlarında (Rize, Trabzon, Muğla).
• Cephesel: Akdeniz iklim bölgesinde kış aylarında sıcak ve soğuk havanın karşılaşmasıyla oluşur (Matematik konum kanıtıdır).', 66) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_017', 'Coğrafya', 'Toprak Tipleri', 'Akdeniz iklim bölgesinde kalkerler (kireçtaşı) üzerinde oluşan, demir oksitçe zengin kırmızı renkli toprak türü nedir?', 'TERRA-ROSSA (KIRMIZI AKDENİZ TOPRAĞI)

İçeriğindeki yüksek demir oksit nedeniyle kırmızı renktedir. Kireç oranı yüksek, organik madde yönünden orta verimliliktedir. Turunçgil ve zeytin tarımına oldukça elverişlidir.', 67) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_018', 'Coğrafya', 'Toprak Tipleri', 'Erzurum-Kars platosunda çayır bitki örtüsü altında oluşan, dünyanın en verimli yerli (zonal) toprağı hangisidir?', 'ÇERNEZYOM (KARA TOPRAK)

Organik madde ve humus yönünden aşırı zengindir. Ancak bölgenin sert karasal iklimi ve kısa yaz süresi nedeniyle tarımdan ziyade gür çayırlarda büyükbaş mera hayvancılığı yapılır.', 68) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_019', 'Coğrafya', 'Toprak Tipleri', 'Trakya Ergene Havzası''nda yaygın olan, kurak dönemde çatlayan, yağışla şişip taşları yüzeye çıkaran toprağın adı nedir?', 'VERTİSOL (DÖNEN TOPRAK / KEPİR / TAŞ DOĞURAN)

Killi kireçli göl tortulları üzerinde oluşur. En tipik kullanım alanı ayçiçeği ve çeltik (pirinç) tarımıdır.', 69) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_020', 'Coğrafya', 'Nüfus ve Yerleşme', 'Türkiye''de nüfusu en az olan il ve nüfus yoğunluğu (kilometrekareye düşen kişi sayısı) en az olan il hangileridir?', 'NÜFUS İLKLERİ (TÜİK GÜNCEL)

• Nüfusu En Az Olan İl: Bayburt
• Aritmetik Nüfus Yoğunluğu En Az Olan İl: Tunceli (Yüzölçümüne göre kişi sayısı en az)
• Nüfusu ve Nüfus Yoğunluğu En Fazla Olan İl: İstanbul', 70) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_021', 'Coğrafya', 'Nüfus Piramidi', 'Türkiye''nin güncel nüfus piramidinin tabanındaki daralma hangi demografik gerçeği gösterir?', 'TÜRKİYE''NİN NÜFUS YAPISI DEĞİŞİMİ

• Doğum oranları hızla azalmaktadır.
• Nüfus artış hızı düşmektedir.
• Çocuk nüfus oranı azalırken yaşlı nüfus oranı ve ortanca yaş (medyan yaş) yükselmektedir.
• Piramit ''Arı Kovanı'' modeline yaklaşmaktadır.', 71) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_022', 'Coğrafya', 'Köy Altı Yerleşmeleri', 'Türkiye''deki köy altı yerleşmelerinden sürekli (daimi) olanlar ile geçici olanlar nasıl ayrılır?', 'KÖY ALTI YERLEŞMELERİ

• Sürekli (Tarım öncelikli): Mahalle, Divan (Batı Karadeniz), Mezra (Doğu/Güneydoğu Anadolu), Çiftlik.
• Geçici (Hayvancılık öncelikli): Yayla (en yaygın), Kom, Oba (Toroslar göçebe yörükler), Ağıl, Dam.', 72) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_023', 'Coğrafya', 'Tarım Ürünleri', 'GAP (Güneydoğu Anadolu Projesi) ile sulamanın yaygınlaşması sonucu pamuk üretiminde Türkiye 1.si olan ilimiz neresidir?', 'ŞANLIURFA

Sulama öncesinde Ege ve Çukurova liderken, GAP kanallarıyla sulanan Harran Ovası sayesinde Şanlıurfa tek başına Türkiye pamuk üretiminin %40''tan fazlasını karşılar hale gelmiştir.', 73) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_024', 'Coğrafya', 'Tarım Ürünleri', 'Yetişme alanı en dar olan, mikroklima özelliği nedeniyle yalnızca Doğu Karadeniz''de yetiştirilen ürün hangisidir?', 'ÇAY

%100''ü Doğu Karadeniz''de (başta Rize olmak üzere Trabzon, Artvin, Giresun) üretilir. Bol ve düzenli nem, kireçsiz asidik toprak ve kış ılıklığı ister. Tabii ekim alanı en dar tarım ürünlerimizdendir.', 74) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_025', 'Coğrafya', 'Tarım Ürünleri', 'Türkiye''nin dünya üretim ve ihracatında açık ara birinci olduğu iki stratejik tarım ürünü hangileridir?', 'FINDIK VE KURU İNCİR

• Fındık: Ordu ve Giresun başta olmak üzere Karadeniz sahil kuşağında yetişir; dünya fındık üretiminin yaklaşık %65-70''ini karşılarız.
• Kuru İncir: Aydın (%80) ve İzmir çevresinde yetişir; dünya ihracatında 1. sıradayız.', 75) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_026', 'Coğrafya', 'Tarım ve Devlet Kontrolü', 'Türkiye''de üretimi devlet kontrolünde olan tarım ürünleri ve kontrol edilme gerekçeleri nelerdir?', 'DEVLET KONTROLÜNDEKİ ÜRÜNLER

• Haşhaş: Uyuşturucu yapımı (Afyonkarahisar)
• Kenevir: Uyuşturucu yapımı (Samsun, Amasya)
• Pirinç (Çeltik): Sıtma hastalığına yol açan sivrisinek üremesi (Yerleşim yerlerine mesafe kuralı)
• Tütün: Kalite standardının korunması
• Şeker Pancarı: Kota uygulaması ve çabuk bozulma riski', 76) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_027', 'Coğrafya', 'Tarım ve Sanayi', 'Şeker pancarı tarımının Karadeniz kıyılarında ve Akdeniz/Ege kıyılarında yapılmama sebepleri nelerdir?', 'ŞEKER PANCARI İSTİSNALARI

• Karadeniz Kıyısı: Her mevsim yağışlı olduğu için ürün olgunlaşma ve hasat döneminde güneşlenemez, çürür.
• Akdeniz ve Ege Kıyıları: Çiftçiler ekonomik getirisi çok daha yüksek olan pamuk, sebze, meyve ve seracılığı tercih eder.', 77) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_028', 'Coğrafya', 'Hayvancılık', 'Maki bitki örtüsünün yaprak ve filizleriyle beslenen, Toroslar''da orman tahribatı nedeniyle sayısı sınırlandırılan hayvan türü hangisidir?', 'KIL KEÇİSİ

Engebeli karstik arazide ve maki bitki örtüsünün olduğu Akdeniz Bölgesi''nde (Mersin, Antalya, Şırnak) yaygındır. Çam ormanlarındaki genç fidanları kemirdiği için devlet tarafından yetiştiriciliği sınırlandırılmaktadır.', 78) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_029', 'Coğrafya', 'Hayvancılık', 'Gür çayırların altında büyükbaş mera hayvancılığı yapılan bölüm ve küçükbaş bozkır hayvancılığı yapılan bölge hangileridir?', 'BÜYÜKBAŞ VE KÜÇÜKBAŞ AYRIMI

• Erzurum-Kars-Ardahan: Yaz yağışları, gür çayırlar ve çernezyom toprak nedeniyle et-süt verimli büyükbaş mera hayvancılığı.
• İç ve Güneydoğu Anadolu: İlkbaharda yeşerip yazın kuruyan bozkır (step) nedeniyle koyun yetiştiriciliği (Küçükbaş).', 79) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_030', 'Coğrafya', 'Madenler', 'Sivas Divriği ve Malatya Hekimhan-Hasançelebi''de çıkarılan, ağır sanayinin hammaddesi olan metalik maden hangisidir?', 'DEMİR

İnşaat ve makine sanayisinin ana girdisidir. Çıkarılan demir madeni Zonguldak Karabük ve Ereğli (Kömüre yakınlık) ile İskenderun (Ulaşım/Liman kolaylığı) demir-çelik fabrikalarında işlenir.', 80) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_031', 'Coğrafya', 'Madenler', 'Bakır madeninin Türkiye''de çıkarıldığı yerlerin akrostiş şifresi nedir?', 'ŞİFRE: K-A-D-E-R

• K: Kastamonu (Küre)
• A: Artvin (Murgul)
• D: Diyarbakır (Ergani)
• E: Elazığ (Maden)
• R: Rize (Çayeli)

⚠️ Samsun''da bakır madeni çıkarılmaz ancak liman ve ulaşım kolaylığı nedeniyle Türkiye''nin en büyük bakır işleme izabe tesisi Samsun''dadır.', 81) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_032', 'Coğrafya', 'Madenler', 'Paslanmaz çelik yapımında ve silah sanayisinde kullanılan, Elazığ Guleman ve Muğla Fethiye''de çıkarılan maden hangisidir?', 'KROM

Sert ve paslanmaz çelik alaşımlarında kullanılır. İşlendiği tesisler Elazığ Ferrokrom Fabrikası (Hammaddeye yakın) ve Antalya Ferrokrom Fabrikası''dır (Liman/İhracat kolaylığı).', 82) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_033', 'Coğrafya', 'Madenler', 'Dünya toplam rezervinin %73''üne sahip olduğumuz ve ''Geleceğin Petrolü'' olarak anılan maden hangisidir?', 'BOR MİNERALLERİ

Balıkesir (Bigadiç, Susurluk), Bursa (Mustafakemalpaşa - Kestelek), Kütahya (Emet) ve Eskişehir (Kırka) havzalarında çıkarılır. Roket yakıtı, cam, seramik, deterjan ve nükleer sanayide kullanılır. Bandırma Borik Asit Fabrikası''nda işlenir.', 83) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_034', 'Coğrafya', 'Madenler', 'Alüminyumun hammaddesi olan boksit madeni nerede çıkarılır ve nerede işlenir?', 'BOKSİT (ALÜMİNYUM)

Konya Seydişehir ve Antalya Akseki''de çıkarılır. Türkiye''nin tek alüminyum izabe fabrikası Konya Seydişehir Alüminyum Tesisleri''dir.', 84) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_035', 'Coğrafya', 'Enerji Kaynakları', 'Taş kömürü ile linyit arasındaki jeolojik zaman ve kullanım amacı farkı nedir?', 'TAŞ KÖMÜRÜ VS LİNYİT

• Taş Kömürü: 1. Jeolojik Zaman (Paleozoik) arazisidir. Kalorisi çok yüksektir, yalnızca Zonguldak havzasında çıkar ve demir-çelik eritmede kullanılır.
• Linyit: 3. Jeolojik Zaman (Tersiyer) arazisidir. Türkiye genç arazi olduğu için hemen her bölgede bulunur, kalorisi düşüktür, termik santrallerde elektrik üretiminde kullanılır.', 85) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_036', 'Coğrafya', 'Yenilenebilir Enerji', 'Türkiye''nin kırıklı fay hatlarına bağlı olarak sıcak su buharından elektrik ürettiği jeotermal santralleri nerededir?', 'JEOTERMAL ENERJİ SANTRALLERİ

Ege Bölgesi Graben alanlarında yoğunlaşmıştır:
• Denizli - Sarayköy
• Aydın - Germencik

Jeotermal enerji hem elektrik üretiminde hem de konut ısıtması ve kaplıca / termal turizmde kullanılır.', 86) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_037', 'Coğrafya', 'Yenilenebilir Enerji', 'Türkiye''de ilk rüzgâr enerjisi santrali nerede kurulmuştur ve en yüksek potansiyel hangi bölgemizdedir?', 'RÜZGÂR ENERJİSİ (RES)

• İlk Santral: 1998 yılında İzmir Çeşme Alaçatı''da kurulmuştur.
• En Yüksek Potansiyel: Ege ve Marmara bölgeleridir (İzmir, Balıkesir, Çanakkale, Manisa).', 87) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_038', 'Coğrafya', 'Yenilenebilir Enerji', 'Güneş enerjisi potansiyelinin en fazla olduğu bölge ve bulutluluk nedeniyle en az olduğu bölge hangileridir?', 'GÜNEŞ ENERJİSİ POTANSİYELİ

• En Yüksek Potansiyel: Güneydoğu Anadolu ve Akdeniz (Yıllık güneşlenme süresi 3000 saatin üzerindedir).
• En Düşük Potansiyel: Doğu Karadeniz (Yıllık yağış ve bulutluluk oranı çok yüksek olduğu için güneşlenme süresi düşüktür).', 88) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_039', 'Coğrafya', 'Enerji Kaynakları', 'Türkiye''de ham petrol çıkarılan ilk saha neresidir ve petrol rafinerilerimiz hangileridir?', 'PETROL VE RAFİNERİLERİMİZ

• İlk Petrol Sahası: 1940 Batman Raman Dağı
• Rafineriler:
  - Batman (Hammaddeye yakın)
  - İzmir Aliağa (Liman / Ulaşım)
  - Kocaeli İpraş (Tüketim / Sanayi merkezi)
  - Kırıkkale Orta Anadolu (Güvenlik / İç bölge dağıtımı)', 89) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_040', 'Coğrafya', 'Enerji Kaynakları', 'Doğal gazla çalışan ve Türkiye''nin en büyük termik santralleri nerelerdedir?', 'DOĞAL GAZ SANTRALLERİ

• Kırklareli - Hamitabat (Hammaddeye yakın)
• İstanbul - Ambarlı (Tüketim merkezine yakın)
• Bursa - Ovaakça (Sanayi merkezine yakın)

⚠️ Türkiye''de yerli doğal gaz Trakya Hamitabat ve Karadeniz Sakarya Gaz Sahası''ndan çıkarılmaktadır.', 90) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_041', 'Coğrafya', 'Ulaşım ve Ticaret', 'Hinterlandı (art bölgesi) en geniş ve dağlar nedeniyle en dar olan limanlarımız hangileridir?', 'LİMAN HİNTERLANDI

• En Geniş Hinterland: İstanbul (Ambarlı), İzmir ve Mersin limanları.
• Karadeniz''in En Gelişmiş Limanı: Samsun (Canik Dağları alçak olduğu için iç kesimlerle demir yolu ve kara yolu bağlantısı güçlüdür).
• En Dar Hinterland: Sinop Limanı (Doğal limandır fakat arkasında Küre Dağları dik yükselir, ulaşım zor olduğu için gelişememiştir).', 91) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_042', 'Coğrafya', 'Ulaşım ve Demir Yolu', 'Türkiye''de dağlık topoğrafya nedeniyle demir yolu ağı bulunmayan kıyı şehirlerimiz hangileridir?', 'DEMİR YOLU BULUNMAYAN İLLER

• Doğu Karadeniz Kıyısı: Trabzon, Rize, Artvin, Giresun, Ordu
• Batı Karadeniz Kıyısı: Sinop, Bartın, Kastamonu
• Akdeniz / Ege: Antalya ve Muğla
• Marmara: Çanakkale ve Bursa (merkez)', 92) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_043', 'Coğrafya', 'Sınır Kapıları', 'Türkiye''nin Avrupa''ya açılan en işlek sınır kapısı hangisidir ve hangi ülkeyle bağlantılıdır?', 'KAPIKULE SINIR KAPISI

Edirne ilinde yer alır ve Bulgaristan ile kara ve demir yolu bağlantısını sağlar. Türkiye''nin ve Avrupa''nın en yoğun transit tır ve yolcu kapılarından biridir.', 93) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_044', 'Coğrafya', 'Sınır Kapıları ve Demir Yolu', 'İran ile aramızda doğrudan demir yolu bağlantısı bulunan sınır kapımız hangisidir?', 'KAPIKÖY SINIR KAPISI (VAN)

Van ilinde yer alır ve İran ile demir yolu bağlantısını sağlar. Tren vagonları Van Gölü üzerinden feribotla (Tatvan-Van feribotu) taşınarak hatta bağlanır.', 94) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_045', 'Coğrafya', 'Çevre ve Koruma Alanları', 'Uluslararası Ramsar Sözleşmesi (Sulak Alanların Korunması) kapsamına alınan ilk alanımız neresidir?', 'GÖKSU DELTASI (MERSİN - 1994)

Akdeniz kıyısında kuş göç yolları üzerinde yer alan zengin sulak alan ekosistemidir. Manyas (Kuşcenneti), Seyfe, Sultansazlığı ve Burdur Gölü de Ramsar alanlarımızdandır.', 95) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_046', 'Coğrafya', 'Turizm ve Yaşam', 'Türkiye''nin ilk Sakin Şehri (Cittaslow) seçilen ilçe hangisidir?', 'İZMİR - SEFERİHİSAR (2009)

Hızlı şehir yaşamına ve tüketime alternatif olarak yerel kültürü, zanaatı, sakinliği ve sürdürülebilirliği destekleyen Cittaslow hareketine Türkiye''den katılan ilk yerleşim yeridir.', 96) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_047', 'Coğrafya', 'Bölgesel Kalkınma Projeleri', 'GAP (Güneydoğu Anadolu Projesi) hangi iki nehir havzasını kapsar ve sulamayla en çok artan ürünler nelerdir?', 'GAP (FIRAT VE DİCLE HAVZALARI)

Cumhuriyet tarihinin en büyük bölgesel projesidir. Sulama sayesinde Şanlıurfa, Mardin ve Diyarbakır ovalarında pamuk, mısır ve soya üretimi patlama yapmıştır.', 97) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_048', 'Coğrafya', 'Bölgesel Kalkınma Projeleri', 'Yeşil Yol Projesi ile yaylaların birbirine bağlanmasının hedeflendiği kalkınma projesi hangisidir?', 'DOKAP (DOĞU KARADENİZ PROJESİ)

Artvin, Rize, Trabzon, Giresun, Ordu, Gümüşhane, Bayburt, Samsun, Tokat ve Amasya illerini kapsar. Temel hedefleri yayla turizmini (Yeşil Yol), balıkçılığı ve organik tarımı geliştirmektir.', 98) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_049', 'Coğrafya', 'UNESCO Dünya Mirası', 'Türkiye''de UNESCO Dünya Mirası Listesi''nde ''Karma Miras'' (Hem kültürel hem doğal miras) olarak kabul edilen 2 varlığımız hangileridir?', 'KARMA MİRAS ALANLARIMIZ

1. Göreme Millî Parkı ve Kapadokya (Nevşehir - Peri bacaları doğal, kiliseler kültürel)
2. Pamukkale - Hierapolis (Denizli - Travertenler doğal, antik kent kültürel)', 99) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_cog_050', 'Coğrafya', 'Jeopolitik ve Boru Hatları', 'Azerbaycan Şahdeniz doğal gazını Gürcistan ve Türkiye üzerinden Avrupa''ya taşıyan mega boru hattı projesi hangisidir?', 'TANAP (TRANS ANADOLU DOĞAL GAZ BORU HATTI)

Türkiye''nin enerji koridoru rolünü perçinleyen projedir. Türkiye-Yunanistan sınırında TAP (Trans Adriyatik) hattına bağlanarak gazı İtalya ve Avrupa pazarına iletir.', 100) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_001', 'Vatandaşlık', 'Hukukun Temel Kavramları', 'Hukukun yazılı, yazısız ve yardımcı kaynakları nelerdir ve bağlayıcılık durumları nasıldır?', 'HUKUKUN KAYNAKLARI

• Yazılı Kaynaklar (Bağlayıcı): Anayasa, Kanun, Milletlerarası Andlaşmalar, CBK, Yönetmelik.
• Yazısız Kaynaklar (Bağlayıcı): Örf ve adet hukuku (Maddi unsur, manevi unsur, hukuki unsur).
• Yardımcı Kaynaklar (Bağlayıcı DEĞİL): Doktrin (Öğreti) ve Yargısal Kararlar (İçtihatlar). Hâkim yardımcı kaynaklara uymak zorunda değildir.', 101) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_002', 'Vatandaşlık', 'Normlar Hiyerarşisi', 'Normlar Hiyerarşisinde (Kelsen Piramidi) kuralların üstten alta doğru sıralanışı nasıldır?', 'NORMLAR HİYERARŞİSİ

1. Anayasa (En üstün kural)
2. Kanun & Usulüne Göre Yürürlüğe Konmuş Milletlerarası Andlaşmalar
3. Cumhurbaşkanlığı Kararnamesi (CBK)
4. Yönetmelik
5. Genelge, Yönerge, Tebliğ

⚠️ Alttaki norm, üstteki norma asla aykırı olamaz.', 102) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_003', 'Vatandaşlık', 'Kişiler Hukuku', 'Hak ehliyeti ile Fiil ehliyeti arasındaki temel fark nedir ve Hak ehliyeti ne zaman başlar?', 'HAK VE FİİL EHLİYETİ

• Hak Ehliyeti: Haklara ve borçlara sahip olabilme yeteneğidir. Pasiftir. Sağ ve tam doğumla başlar, ana rahmine düşüldüğü andan itibaren hak kazanılır.
• Fiil Ehliyeti: Kendi işlem ve eylemleriyle hak kazanabilme ve borç altına girebilme yeteneğidir. Aktiftir. Ayırt etme gücü, erginlik ve kısıtlı olmamak şarttır.', 103) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_004', 'Vatandaşlık', 'Kişiler Hukuku', 'Olağan erginlik, evlenme yoluyla erginlik ve mahkeme kararıyla erginlik (Kazai Rüşt) yaşları kaçtır?', 'ERGİNLİK (RÜŞT) YAŞLARI

• Olağan Erginlik: 18 yaşın doldurulmasıyla kendiliğinden başlar.
• Evlenme ile Erginlik: Olağan evlenme 17 yaş, olağanüstü evlenme (hâkim kararıyla) 16 yaştır.
• Kazai Rüşt (Yargısal Erginlik): 15 yaşını doldurmuş küçüğün kendi isteği, velisinin rızası ve Asliye Hukuk Mahkemesi kararıyla kazanılır.', 104) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_005', 'Vatandaşlık', 'Kişiler Hukuku', 'Ölüm tehlikesi içinde kaybolma ve uzun zamandır haber alınamama durumlarında gaiplik davası açma süreleri kaçtır?', 'GAİPLİK SÜRELERİ

• Ölüm Tehlikesi İçinde Kaybolma: Olay tarihinden itibaren en az 1 YIL geçtikten sonra mahkemeden gaiplik istenebilir.
• Uzun Süre Haber Alınamama: Son haber alma tarihinden itibaren en az 5 YIL geçtikten sonra dava açılabilir.
• Mirasçıların teminat gösterme süreleri ise sırasıyla 5 yıl ve 15 yıldır.', 105) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_006', 'Vatandaşlık', 'Hukukun Yaptırımları', 'Kamu hukuku yaptırımları (maddi yaptırımlar) nelerdir?', 'HUKUKİ YAPTIRIM TÜRLERİ

1. Ceza (Hapis veya adli para cezası)
2. Cebri İcra (Borcunu yerine getirmeyeni devlet zoruyla ifa ettirme)
3. Tazminat (Maddi veya manevi zararın ödetilmesi)
4. İptal (Hukuka aykırı idari işlemlerin yargı kararıyla kaldırılması)
5. Hükümsüzlük (Yokluk, Butlan, Askıda hükümsüzlük)', 106) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_007', 'Vatandaşlık', 'Hükümsüzlük Türleri', 'Bir hukuki işlemin kurucu unsurlarındaki eksiklik (Yokluk) ile geçerlilik şartlarındaki sakatlık (Butlan) arasındaki fark nedir?', 'YOKLUK VS BUTLAN

• Yokluk: Hukuki işlemin kurucu unsurlarından biri yoktur; işlem hukuk âleminde hiç doğmamıştır (Örn: Resmî nikâh memuru olmadan yapılan evlilik).
• Mutlak Butlan: Kurucu unsurlar vardır ancak kanunun emredici kuralına aykırılık vardır (Örn: Ayırt etme gücü olmayan birinin evlenmesi).
• Nisbi Butlan: İrade sakatlığı (Hata, hile, korkutma) nedeniyle iptal edilebilirliktir.', 107) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_008', 'Vatandaşlık', 'Devlet Biçimleri', 'Egemenliğin kaynağına göre ve yapısına göre devlet biçimleri nelerdir?', 'DEVLET BİÇİMLERİ

• Egemenliğin Kaynağına Göre: Monarşi (Tek kişi), Oligarşi (Zümre/Grup), Teokrasi (Din kuralları), Cumhuriyet (Millet egemenliği).
• Yapısına Göre:
  1. Basit (Üniter) Devlet: Tek meclis, tek anayasa, tek yargı (Türkiye).
  2. Birleşik Devlet: Federasyon (Federal ve federe devletler - ABD, Almanya) ve Konfederasyon.', 108) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_009', 'Vatandaşlık', 'Anayasa Tarihi', 'Türk anayasa tarihinin ilk ve tek ''Yumuşak'' ve ''Çerçeve'' anayasası hangisidir?', '1921 ANAYASASI (TEŞKİLAT-I ESASİYE)

• 23 temel maddeden oluşur (Çerçeve anayasadır, detay içermez).
• Değiştirilmesi kanunlarla aynı usule tabidir (Yumuşak anayasadır).
• Güçler birliği ve ''Meclis Hükümeti'' sistemi benimsenmiştir.
• Temel hak ve hürriyetlerden ile yargı organından bahsetmemiştir.', 109) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_010', 'Vatandaşlık', 'Anayasa Tarihi', '1924 Anayasası''nda ''Devletin dini İslam''dır'' maddesi ne zaman çıkarılmış, Atatürk ilkeleri ne zaman anayasaya girmiştir?', '1924 ANAYASASI DEĞİŞİKLİKLERİ

• 1928 Değişikliği: ''Devletin dini İslam''dır'' ibaresi ve milletvekillerinin yemin şeklindeki dinî ifadeler anayasadan çıkarıldı.
• 1937 Değişikliği: Altı Atatürk ilkesi (Cumhuriyetçilik, Milliyetçilik, Halkçılık, Devletçilik, Laiklik, İnkılapçılık) anayasaya eklendi.', 110) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_011', 'Vatandaşlık', 'Kadın Hakları', 'Türk kadınına siyasal hakların veriliş kronolojisi ve şifresi nedir?', 'ŞİFRE: 0-3-4  B-M-V

• 1930: Belediye seçimlerine katılma hakkı (B)
• 1933: Muhtarlık seçimlerine katılma ve köy ihtiyar heyetine seçilme hakkı (M)
• 1934: Milletvekili seçme ve seçilme hakkı (V)', 111) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_012', 'Vatandaşlık', 'Anayasa Tarihi', '1961 Anayasası ile hukuk sistemimize ilk kez kazandırılan kurumlar nelerdir?', '1961 ANAYASASI İLKLERİ

• Anayasa Mahkemesi (Kanunların anayasaya uygunluğunu denetlemek üzere kuruldu)
• Millî Güvenlik Kurulu (MGK)
• Devlet Planlama Teşkilatı (DPT)
• Yüksek Hâkimler Kurulu
• Çift meclisli parlamento: Millet Meclisi ve Cumhuriyet Senatosu', 112) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_013', 'Vatandaşlık', '1982 Anayasası', '1982 Anayasası''nın değiştirilemez ve değiştirilmesi teklif dahi edilemez maddeleri nelerdir?', 'İLK 3 MADDE KORUMASI (4. MADDE)

• 1. Madde: Devletin şekli Cumhuriyettir.
• 2. Madde: Türkiye Cumhuriyeti, toplumun huzuru, millî dayanışma ve adalet anlayışı içinde, insan haklarına saygılı, Atatürk milliyetçiliğine bağlı, demokratik, laik ve sosyal bir hukuk devletidir.
• 3. Madde: Devleti, ülkesi ve milletiyle bölünmez bir bütündür. Dili Türkçe, bayrağı beyaz ay yıldızlı al bayrak, marşı İstiklal Marşı, başkenti Ankara''dır.', 113) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_014', 'Vatandaşlık', 'Temel Hak ve Hürriyetler', '1982 Anayasası''na göre temel hak ve hürriyetler hangi şartlarla sınırlanabilir?', 'TEMEL HAKLARIN SINIRLANMA KRİTERLERİ (Madde 13)

1. Ancak KANUNLA sınırlanabilir.
2. Anayasanın ilgili maddelerinde belirtilen özel sebeplere bağlı olmalıdır.
3. Anayasanın sözüne ve ruhuna uygun olmalıdır.
4. Demokratik toplum düzeninin ve laik cumhuriyetin gereklerine aykırı olamaz.
5. Ölçülülük ilkesine aykırı olamaz.
6. Hakkın özüne asla dokunulamaz.', 114) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_015', 'Vatandaşlık', 'Temel Hak ve Hürriyetler', 'Savaş, seferberlik ve OHAL durumlarında dahi asla dokunulamayacak ''Çekirdek Haklar'' nelerdir?', 'ÇEKİRDEK HAKLAR (Madde 15)

• Yaşama hakkı ile maddi ve manevi vücut bütünlüğü (Tıbbi zorunluluklar hariç)
• Din, vicdan, düşünce ve kanaatlerini açıklamaya zorlanamama ve bunlardan dolayı kınanamama
• Suç ve cezaların geçmişe yürütülememesi
• Masumiyet karinesi (Suçluluğu mahkeme kararıyla kesinleşinceye kadar kimse suçlu sayılamaz)', 115) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_016', 'Vatandaşlık', 'Temel Haklar Ayrımı', 'Jellinek sınıflandırmasına göre Kişi Hak ve Ödevleri (Negatif Statü / Koruyucu Haklar) nelerdir?', 'KİŞİ HAKLARI (KORUYUCU HAKLAR)

Devletin müdahale edemeyeceği dokunulmaz alanları kapsar:
• Kişi dokunulmazlığı ve kişi hürriyeti
• Özel hayatın ve aile hayatının gizliliği
• Konut dokunulmazlığı ve haberleşme hürriyeti
• Yerleşme ve seyahat hürriyeti
• Din ve vicdan hürriyeti
• Mülkiyet hakkı ve hak arama hürriyeti', 116) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_017', 'Vatandaşlık', 'Temel Haklar Ayrımı', 'Jellinek sınıflandırmasına göre Sosyal ve Ekonomik Haklar (Pozitif Statü / İsteme Hakları) nelerdir?', 'SOSYAL VE EKONOMİK HAKLAR (İSTEME HAKLARI)

Vatandaşın devletten hizmet talep ettiği haklardır:
• Ailenin korunması ve çocuk hakları
• Eğitim ve öğrenim hakkı
• Çalışma ve sözleşme hürriyeti
• Sendika kurma hakkı
• Toplu iş sözleşmesi, grev ve lokavt hakkı
• Sosyal güvenlik hakkı ve sağlık hakkı', 117) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_018', 'Vatandaşlık', 'Temel Haklar Ayrımı', 'Jellinek sınıflandırmasına göre Siyasi Haklar ve Ödevler (Aktif Statü / Katılma Hakları) nelerdir?', 'SİYASİ HAKLAR (KATILMA HAKLARI)

Vatandaşın devlet yönetimine katılmasını sağlayan haklardır:
• Türk vatandaşlığı
• Seçme, seçilme ve siyasi faaliyette bulunma hakkı
• Siyasi parti kurma ve üye olma hakkı
• Kamu hizmetine girme hakkı (Memurluk)
• Vatan hizmeti (Askerlik) ve vergi ödevi
• Dilekçe, bilgi edinme ve Kamu Denetçisine başvurma hakkı', 118) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_019', 'Vatandaşlık', 'Siyasi Partiler', 'Anayasa''ya göre siyasi partilere üye olamayacak meslek ve kişi grupları kimlerdir?', 'SİYASİ PARTİLERE ÜYE OLAMAYACAKLAR

• Hâkimler ve savcılar
• Sayıştay dâhil yüksek yargı organları mensupları
• Kamu kurum ve kuruluşlarının memur statüsündeki görevlileri
• Silahlı Kuvvetler mensupları (TSK)
• Yükseköğretim öncesi öğrenciler (Lise vb.)

⚠️ Yükseköğretim elemanları (Akademisyenler) ve yükseköğretim öğrencileri (Üniversiteliler) kanunun belirlediği esaslarla üye olabilir.', 119) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_020', 'Vatandaşlık', 'Siyasi Partiler', 'Siyasi partilerin kapatılması davasını kim açar ve davayı hangi mahkeme karara bağlar?', 'SİYASİ PARTİ KAPATMA DAVASI

• Davayı Açan: Yargıtay Cumhuriyet Başsavcısı
• Davaya Bakan: Anayasa Mahkemesi (Genel Kurul)
• Karar Yeter Sayısı: Toplantıya katılan üyelerin 3''te 2 oy çokluğu (En az 10 üye)
• Kapatma yerine alternatif olarak Hazine yardımından kısmen veya tamamen yoksun bırakma kararı da verilebilir.', 120) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_021', 'Vatandaşlık', 'Yasama (TBMM)', 'TBMM''nin üye tamsayısı kaçtır ve genel seçimler kaç yılda bir hangi seçimle birlikte yapılır?', 'TBMM VE SEÇİM DÖNEMİ

• Üye Tamsayısı: 600 Milletvekili
• Seçim Dönemi: 5 Yılda bir Cumhurbaşkanı seçimi ile aynı gün yapılır.
• Görev süresi dolan milletvekili yeniden seçilebilir.', 121) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_022', 'Vatandaşlık', 'Yasama (TBMM)', 'TBMM seçimleri hangi gerekçeyle ve en fazla ne kadar süreyle geriye bırakılabilir (ertelenir)?', 'SEÇİMLERİN GERİYE BIRAKILMASI

• Tek Sebep: Yalnızca SAVAŞ sebebiyle seçimlerin yapılmasına imkân görülmezse geriye bırakılabilir.
• Yetki: TBMM kararıyla
• Süre: 1 YIL ertelenebilir. Savaş hali devam ederse aynı usulle uzatılabilir.', 122) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_023', 'Vatandaşlık', 'Yasama (TBMM)', 'Ara seçim hangi durumlarda zorunlu hale gelir?', 'ARA SEÇİMİN ZORUNLU OLDUĞU DURUMLAR

• Kural: Her seçim döneminde sadece 1 defa yapılır. Seçimden 30 ay geçmedikçe ve son 1 yıl kala yapılamaz.
• Zorunlu Durum 1: Üye tamsayısının %5''i (30 milletvekili) boşalırsa 3 ay içinde ara seçim yapılması zorunludur (Son 1 yıl kala yapılamaz).
• Zorunlu Durum 2: Bir ilin veya seçim çevresinin TBMM''de hiç üyesi kalmazsa, boşalmayı takip eden 90 günden sonraki ilk pazar günü ara seçim yapılması zorunludur.', 123) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_024', 'Vatandaşlık', 'Yasama Bağışıklığı', 'Yasama Sorumsuzluğu ile Yasama Dokunulmazlığı arasındaki farklar nelerdir?', 'SORUMSUZLUK VS DOKUNULMAZLIK

• Yasama Sorumsuzluğu: Kürsü dokunulmazlığıdır. Meclis çalışmalarındaki oy, söz ve düşüncelerden dolayı ömür boyu ceza davası açılamaz. Mutlaktır, kaldırılamaz.
• Yasama Dokunulmazlığı: Suç işlediği iddia edilen vekilin meclis kararı olmadıkça tutulamaması, tutuklanamaması ve yargılanamamasıdır. Nisbidir, meclis kaldırabilir. Hukuk davalarını engellemez.', 124) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_025', 'Vatandaşlık', 'TBMM Toplantı ve Karar', 'TBMM''nin toplanabilmesi ve karar alabilmesi için gereken en az üye sayıları (Yeter sayıları) kaçtır?', 'TOPLANTI VE KARAR YETER SAYILARI

• Toplantı Yeter Sayısı: Üye tamsayısının en az 1/3''ü = 200 Milletvekili
• Karar Yeter Sayısı: Toplantıya katılanların salt çoğunluğudur. Ancak bu sayı hiçbir şekilde üye tamsayısının 1/4''ünün 1 fazlasından = 151 Milletvekilinden az olamaz.', 125) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_026', 'Vatandaşlık', 'Kanun Yapım Süreci', 'Kanun teklif etmeye kimler yetkilidir ve Cumhurbaşkanının kanun teklif edebildiği tek istisna nedir?', 'KANUN TEKLİF YETKİSİ

• Kural: Kanun teklif etmeye sadece MİLLETVEKİLLERİ yetkilidir (En az 1 milletvekili teklif verebilir).
• Cumhurbaşkanının İstisnası: Cumhurbaşkanı kural olarak kanun teklif edemez. Tek istisnası ''Bütçe ve Kesin Hesap Kanun Teklifi''dir.', 126) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_027', 'Vatandaşlık', 'Kanun Yapım Süreci', 'Cumhurbaşkanının kanunları inceleme süresi ne kadardır ve TBMM geri gönderilen kanunu nasıl aynen kabul edebilir?', 'CUMHURBAŞKANININ KANUNU İNCELEMESİ

• Süre: 15 GÜN içinde yayımlar veya veto ederek meclise geri gönderir.
• TBMM Onayı: TBMM üye tamsayısının salt çoğunluğuyla (En az 301 Milletvekili) kanunu aynen kabul ederse Cumhurbaşkanı yayımlamak ZORUNDADIR.
• Cumhurbaşkanı Bütçe Kanununu veto edemez.', 127) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_028', 'Vatandaşlık', 'Anayasa Değişikliği', 'Anayasa değişikliği için gereken teklif ve kabul yeter sayıları nelerdir?', 'ANAYASA DEĞİŞİKLİĞİ NİSAPLARI

• Teklif Sayısı: Üye tamsayısının en az 1/3''ü = 200 Milletvekili
• Kabul 360-399 Oy (3/5 - 2/3 arası): Cumhurbaşkanı onaylayamaz; kanunu ya meclise geri gönderir ya da ZORUNLU HALKOYLAMASINA (Referanduma) sunar.
• Kabul 400 ve Üzeri Oy (2/3 ve üzeri): Cumhurbaşkanı onaylayıp Resmî Gazete''de yayımlayabilir veya İHTİYARİ HALKOYLAMASINA götürebilir.', 128) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_029', 'Vatandaşlık', 'TBMM Başkanlık Seçimi', 'TBMM Başkanlık seçimi en fazla kaç turda tamamlanır ve turlardaki oy yeter sayıları nasıldır?', 'TBMM BAŞKANLIK SEÇİMİ (EN ÇOK 4 TUR)

• 1. Tur: Üye tamsayısının 2/3''ü (400 oy)
• 2. Tur: Üye tamsayısının 2/3''ü (400 oy)
• 3. Tur: Üye tamsayısının salt çoğunluğu (301 oy)
• 4. Tur: 3. turda en çok oyu alan 2 aday katılır; en fazla oyu alan başkan seçilir.', 129) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_030', 'Vatandaşlık', 'Meclis Soruşturması', 'Cumhurbaşkanı yardımcısı ve bakanların görev suçlarından dolayı Yüce Divan''a sevk edilme karar yeter sayısı kaçtır?', 'MECLİS SORUŞTURMASI AŞAMALARI

1. Soruşturma Açılması Teklifi: Üye tamsayısının salt çoğunluğu (301 MV)
2. Soruşturma Açılmasına Karar Verilmesi: Üye tamsayısının 3/5''i (360 MV)
3. Yüce Divan''a Sevk Kararı: Üye tamsayısının 2/3''ü (400 MV gizli oyla)', 130) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_031', 'Vatandaşlık', 'Yürütme (Cumhurbaşkanı)', 'Cumhurbaşkanı seçilme şartları nelerdir?', 'CUMHURBAŞKANI SEÇİLME ŞARTLARI

• Türk vatandaşı olmak
• 40 yaşını doldurmuş olmak
• Yükseköğrenim mezunu olmak (Üniversite)
• Milletvekili seçilme yeterliliğine sahip olmak
• Görev süresi 5 yıldır. Bir kimse en fazla 2 kez Cumhurbaşkanı seçilebilir (İstisnası: 2. döneminde TBMM''nin seçimleri yenilemesi).', 131) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_032', 'Vatandaşlık', 'Yürütme (Cumhurbaşkanı)', 'Cumhurbaşkanlığına kimler aday gösterebilir?', 'CUMHURBAŞKANI ADAY GÖSTERME YOLLARI

1. Siyasi parti meclis grupları (En az 20 vekil)
2. En son yapılan milletvekili seçimlerinde tek başına veya birlikte geçerli oyların en az %5''ini almış siyasi partiler
3. En az 100.000 seçmenin yazılı imzasıyla', 132) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_033', 'Vatandaşlık', 'Yürütme (CBK)', 'Cumhurbaşkanlığı Kararnamesi (CBK) ile düzenlenemeyecek anayasal alanlar hangileridir?', 'CBK İLE DÜZENLENEMEYECEK ALANLAR

• Anayasa''daki Kişi Hak ve Ödevleri ile Siyasi Hak ve Ödevler (Sosyal ve ekonomik haklar düzenlenebilir).
• Anayasada münhasıran kanunla düzenlenmesi öngörülen konular.
• Kanunda açıkça düzenlenen konular.

⚠️ Kanun ile CBK aynı konuda farklı hüküm içerirse KANUN hükümleri uygulanır.', 133) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_034', 'Vatandaşlık', 'Olağanüstü Hâl (OHAL)', 'OHAL ilan etmeye kim yetkilidir, süresi en fazla ne kadardır ve kimin onayına sunulur?', 'OHAL İLAN SÜRECİ

• İlan Eden: Cumhurbaşkanı
• Süre: En fazla 6 AY süreyle ilan edilebilir.
• Onay: İlan edildiği gün Resmî Gazete''de yayımlanır ve aynı gün TBMM''nin onayına sunulur.
• Uzatma: TBMM her defasında 4 AYI geçmemek üzere süreyi uzatabilir.', 134) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_035', 'Vatandaşlık', 'Millî Güvenlik Kurulu (MGK)', 'MGK''nın başkanı kimdir, ne sıklıkla toplanır ve kurulda yer ALMAYAN komutan kimdir?', 'MİLLÎ GÜVENLİK KURULU (MGK)

• Başkanı: Cumhurbaşkanı (Yokluğunda CB Yardımcısı)
• Toplanma Sıklığı: 2 ayda bir toplanır.
• Askerî Üyeler: Genelkurmay Başkanı, Kara, Deniz ve Hava Kuvvetleri Komutanları.
• ⚠️ DİKKAT: Jandarma Genel Komutanı 2016 değişikliği ile MGK üyeliğinden çıkarılmıştır!', 135) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_036', 'Vatandaşlık', 'Yargı (Yüksek Mahkemeler)', '1982 Anayasası''na göre Türkiye''deki 4 yüksek mahkeme hangileridir?', 'YÜKSEK MAHKEMELER

1. Anayasa Mahkemesi
2. Yargıtay (Adli yargının temyiz mercii)
3. Danıştay (İdari yargının temyiz mercii)
4. Uyuşmazlık Mahkemesi (Adli ve idari yargı uyuşmazlıklarını çözer)

⚠️ DİKKAT: Sayıştay ve HSK yüksek mahkeme DEĞİLDİR!', 136) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_037', 'Vatandaşlık', 'Yargı (Anayasa Mahkemesi)', 'Anayasa Mahkemesi kaç üyeden oluşur, üyeleri kim seçer ve görev süreleri kaç yıldır?', 'ANAYASA MAHKEMESİ YAPISI

• Üye Sayısı: 15 Üye
• Seçim: 3 üyeyi TBMM, 12 üyeyi Cumhurbaşkanı seçer.
• Görev Süresi: 12 yıldır. Bir kimse iki defa üye seçilemez.
• Emeklilik Yaşı: 65 yaşını dolduran üyeler emekliye ayrılır.', 137) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_038', 'Vatandaşlık', 'Yargı (Bireysel Başvuru)', 'Anayasa Mahkemesi''ne Bireysel Başvuru hangi haklar için ve ne kadar sürede yapılabilir?', 'AYM BİREYSEL BAŞVURU ŞARTLARI

• Kapsam: Anayasa''da güvenceye alınmış ve aynı zamanda AİHS (Avrupa İnsan Hakları Sözleşmesi) kapsamındaki temel hak ve hürriyetlerin kamu gücü tarafından ihlali.
• Süre: İdari ve olağan yargı yollarının tüketilmesinden itibaren 30 GÜN içinde başvurulmalıdır.', 138) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_039', 'Vatandaşlık', 'Yargı Organları', 'Danıştay üyelerinin seçimini kimler yapar?', 'DANIŞTAY ÜYELERİNİN SEÇİMİ

• 3/4''ünü Hâkimler ve Savcılar Kurulu (HSK)
• 1/4''ünü Cumhurbaşkanı seçer.

⚠️ Yargıtay üyelerinin tamamını ise Hâkimler ve Savcılar Kurulu (HSK) seçer.', 139) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_040', 'Vatandaşlık', 'Yargı (HSK)', 'Hâkimler ve Savcılar Kurulu (HSK) kaç üyeden oluşur ve başkanı kimdir?', 'HÂKİMLER VE SAVCILAR KURULU (HSK)

• Üye Sayısı: 13 üye (2 daire halinde çalışır)
• Başkanı: Adalet Bakanı
• Doğal Üye: Adalet Bakanlığı İlgili Bakan Yardımcısı
• Kalan Üyeler: 4 üyeyi Cumhurbaşkanı, 7 üyeyi TBMM seçer. Üyelerin görev süresi 4 yıldır.', 140) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_041', 'Vatandaşlık', 'Sayıştay', 'Sayıştay kimin adına denetim yapar ve kararlarına karşı yargı yolu açık mıdır?', 'SAYIŞTAY

• TBMM adına kamu idarelerinin gelir, gider ve mallarını denetler.
• Sorumluların hesap ve işlemlerini kesin hükme bağlar.
• Sayıştay kararlarına karşı yargı yolu KAPALIDIR (Kesindir). İlgililer 15 gün içinde bir defaya mahsus karar düzeltme isteyebilir.', 141) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_042', 'Vatandaşlık', 'İdare Hukuku', 'İdarenin bütünlüğünü sağlayan iki hukuki denetim mekanizması (Hiyerarşi ve İdari Vesayet) nasıl ayırt edilir?', 'HİYERARŞİ VS İDARİ VESAYET

• Hiyerarşi: AYNI kamu tüzel kişiliği içerisindeki ast-üst ilişkisidir (Bakan-Müsteşar, Vali-Kaymakam, Rektör-Dekan). Emir ve talimat verebilir.
• İdari Vesayet: FARKLI kamu tüzel kişileri arasındaki kanuni denetim ilişkisidir (Merkezi idarenin yerel yönetimleri denetlemesi: İçişleri Bakanı - Belediye Başkanı).', 142) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_043', 'Vatandaşlık', 'İdare Hukuku', 'Kamu Tüzel Kişiliği anayasal olarak hangi iki yolla kurulabilir?', 'KAMU TÜZEL KİŞİLİĞİNİN KURULMASI

Anayasa Madde 123''e göre Kamu tüzel kişiliği, ancak KANUNLA veya CUMHURBAŞKANLIĞI KARARNAMESİYLE kurulur.', 143) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_044', 'Vatandaşlık', 'İdare Hukuku', 'İl ve ilçelerin kurulması, kaldırılması, ad ve merkezlerinin değiştirilmesi hangi işlemle yapılır?', 'İL VE İLÇELERİN KURULMASI

İl ve ilçe kurulması, kaldırılması, adlarının ve merkezlerinin değiştirilmesi ve bir ilçenin başka bir ile bağlanması ancak KANUNLA olur.', 144) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_045', 'Vatandaşlık', 'Mülki İdare', 'Vali ile Kaymakam arasındaki temel farklar nelerdir?', 'VALİ VS KAYMAKAM

• Vali: İl genel idaresinin başıdır. Cumhurbaşkanı kararıyla atanır. İstisnai memurdur. Yetki genişliği vardır.
• Kaymakam: İlçe genel idaresinin başıdır. Cumhurbaşkanı onayıyla atanır. Güvenceli meslek memurudur. Yetki genişliği YOKTUR.', 145) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_046', 'Vatandaşlık', 'Mahalli İdareler', 'Köyün zorunlu organları nelerdir ve köy kurulması hangi kararla olur?', 'KÖY İDARESİ

• Kuruluş: Nüfusu 150 ile 2.000 arası olan yerlerde İçişleri Bakanlığı kararıyla kurulur.
• Organları:
  1. Muhtar (Yürütme organı)
  2. Köy Derneği (Köydeki tüm seçmenler)
  3. Köy İhtiyar Meclisi (İmam ve öğretmen doğal üyedir)', 146) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_047', 'Vatandaşlık', 'Mahalli İdareler', 'Büyükşehir Belediyesi kurulabilmesi için gereken toplam nüfus şartı kaçtır ve ne ile kurulur?', 'BÜYÜKŞEHİR BELEDİYESİ ŞARTLARI

• Nüfus Şartı: Toplam nüfusu en az 750.000 olmalıdır.
• İşlem Türü: Ancak KANUNLA kurulabilir (Normlar hiyerarşisinde kanun şarttır).', 147) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_048', 'Vatandaşlık', 'Devlet Memurları Kanunu (657)', '657 sayılı DMK''ya göre disiplin cezaları nelerdir?', 'DİSİPLİN CEZALARI (5 ADET)

1. Uyarma
2. Kınama
3. Aylıktan Kesme (Brüt aylığın 1/30 - 1/8 arasında kesinti)
4. Kademe İlerlemesinin Durdurulması (1-3 yıl)
5. Devlet Memurluğundan Çıkarma (Yüksek Disiplin Kurulu kararıyla)

⚠️ Yer değiştirme, açığa alma veya görevden uzaklaştırma disiplin cezası DEĞİLDİR; idari tedbirdir.', 148) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_049', 'Vatandaşlık', 'Kamu Denetçiliği Kurumu', 'Kamu Denetçiliği Kurumu (Ombudsmanlık) kime bağlıdır ve Başdenetçiyi kim seçer?', 'KAMU DENETÇİLİĞİ KURUMU

• Bağlılık: TBMM Başkanlığına bağlı olarak çalışır.
• Görevi: İdarenin her türlü eylem ve işlemlerini hukuka ve hakkaniyete uygunluk yönünden inceler.
• Seçim: Kamu Başdenetçisini TBMM gizli oyla 4 turda seçer (Görev süresi 4 yıldır).', 149) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_vat_050', 'Vatandaşlık', 'İdari Yargı', 'İdari yargıda genel dava açma süresi Danıştay ve İdare Mahkemelerinde kaç gündür?', 'İDARİ DAVA AÇMA SÜRELERİ

• Danıştay ve İdare Mahkemelerinde: 60 GÜN
• Vergi Mahkemelerinde: 30 GÜN

Süre, idari işlemin yazılı olarak tebliğ edildiği tarihi izleyen günden itibaren başlar.', 150) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_001', 'Güncel Bilgiler', 'Spor ve Olimpiyatlar', '2024 Paris Olimpiyatları''nda gümüş madalya kazanarak eli cebinde atışıyla dünya çapında fenomen olan millî atıcımız kimdir?', 'YUSUF DİKEÇ

10m Havalı Tabanca Karışık Takım kategorisinde Şevval İlayda Tarhan ile birlikte gümüş madalya kazanarak Türkiye''ye olimpiyat tarihindeki ilk atıcılık madalyasını getirmiştir. Özel ekipman kullanmadan rahat atış tarzıyla 2024 Paris Olimpiyatları''nın küresel simgesi haline gelmiştir.', 151) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_002', 'Güncel Bilgiler', 'Spor ve Olimpiyatlar', 'Tokyo 2020 Olimpiyat şampiyonu olup 2024 Paris Olimpiyatları''nda klasik yay erkek takımıyla bronz madalya kazanan sporcumuz kimdir?', 'METE GAZOZ

Türkiye''ye okçuluk branşında tarihin ilk olimpiyat şampiyonluğunu kazandıran millî sporcumuzdur. 2024 Paris Olimpiyatları''nda Ulaş Berkim Tümer ve Muhammed Abdullah Yıldırmış ile birlikte takım hâlinde bronz madalya kazanmıştır.', 152) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_003', 'Güncel Bilgiler', 'Bilim ve Uzay', 'Axiom-3 (Ax-3) misyonuyla Uluslararası Uzay İstasyonu''na (ISS) giderek uzaya çıkan ilk Türk astronot kimdir?', 'ALPER GEZERAVCI

Ocak 2024''te SpaceX Falcon 9 roketiyle uzaya gönderilen Gezeravcı, ISS''de 13 farklı bilimsel deneyi başarıyla tamamlamıştır. Uzaydaki ilk sözü Gazi Mustafa Kemal Atatürk''ün ''İstikbal göklerdedir'' vecizesi olmuştur.', 153) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_004', 'Güncel Bilgiler', 'Bilim ve Uzay', 'Virgin Galactic firmasının VSS Unity uzay aracıyla yörünge altı araştırma uçuşu gerçekleştiren ikinci Türk astronot kimdir?', 'TUVA CİHANGİR ATASEVER

Haziran 2024''te yörünge altı araştırma uçuşunu gerçekleştirmiş ve mikro yerçekimi ortamında insan fizyolojisi üzerine 7 farklı bilimsel deney icra etmiştir.', 154) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_005', 'Güncel Bilgiler', 'Kültür Başkentleri', 'TÜRKSOY tarafından 2024 ve 2025 yılları için ilan edilen ''Türk Dünyası Kültür Başkentleri'' neresidir?', 'TÜRK DÜNYASI KÜLTÜR BAŞKENTLERİ

• 2024 Yılı: Anev şehri (Türkmenistan)
• 2025 Yılı: Aktau şehri (Kazakistan)', 155) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_006', 'Güncel Bilgiler', 'Kültür ve Turizm', '2024 yılı Türk Dünyası Turizm Başkenti ilan edilen şehir neresidir?', 'CELALABAD (KIRGIZİSTAN)

Türk Devletleri Teşkilatı Turizm Bakanları toplantısında 2024 yılı Türk Dünyası Turizm Başkenti olarak Kırgızistan''ın Celalabad şehri seçilmiştir.', 156) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_007', 'Güncel Bilgiler', 'UNESCO Dünya Mirası', 'UNESCO Dünya Mirası Listesi''ne 2023''te 20. ve 21. varlığımız olarak giren tarihî değerlerimiz hangileridir?', 'GORDİON VE AHŞAP CAMİLER

• 20. Varlık: Ankara Gordion Antik Kenti (Frigya Başkenti)
• 21. Varlık: Anadolu''nun Orta Çağ Dönemi Ahşap Hipostil Camileri (Konya Eşrefoğlu, Afyon Ulu Cami, Sivrihisar Ulu Cami, Kastamonu Mahmut Bey, Ankara Arslanhane Camisi)', 157) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_008', 'Güncel Bilgiler', 'UNESCO Kültürel Miras', '2023 yılında UNESCO İnsanlığın Somut Olmayan Kültürel Mirası Temsili Listesi''ne kaydedilen geleneklerimiz nelerdir?', 'İFTAR VE TEZHİP SANATI

İftar ve bununla bağlantılı sosyo-kültürel gelenekler ile İslam kitap sanatlarının en zarif kollarından biri olan ''Tezhip Sanatı'' çok uluslu ortak dosyalarla UNESCO listesine dâhil edilmiştir.', 158) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_009', 'Güncel Bilgiler', 'Bilim ve Teknoloji', 'Türkiye''nin yerli imkânlarla ürettiği ilk haberleşme uydusu hangisidir ve ne zaman fırlatılmıştır?', 'TÜRKSAT 6A

Temmuz 2024''te Florida Cape Canaveral''dan SpaceX Falcon 9 roketiyle uzaya fırlatılmıştır. Bu başarıyla Türkiye, kendi haberleşme uydusunu üretebilen dünyadaki 11 ülkeden biri olmuştur.', 159) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_010', 'Güncel Bilgiler', 'Savunma Sanayii', 'TUSAŞ tarafından geliştirilen ve ilk uçuşunu 21 Şubat 2024 tarihinde gerçekleştiren 5. nesil millî muharip uçağımızın adı nedir?', 'KAAN (MİLLÎ MUHARİP UÇAK)

Radar dalgalarını sönümleyen düşük görünürlük (hayalet uçak), süpersonik hızda dâhili silah yuvaları ve gelişmiş yapay zekâ entegrasyonuna sahip 5. nesil savaş uçağımızdır.', 160) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_011', 'Güncel Bilgiler', 'Savunma Sanayii', 'Dünyanın ilk SİHA gemisi olarak Türk Deniz Kuvvetleri hizmetine giren en büyük amiral gemimiz hangisidir?', 'TCG ANADOLU (L400)

Çok maksatlı amfibi hücum gemisidir. Bayraktar TB3, KIZILELMA gibi insansız hava araçlarının iniş-kalkış yapabildiği dünyadaki ilk SİHA gemisi unvanına sahiptir.', 161) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_012', 'Güncel Bilgiler', 'Uluslararası Örgütler (NATO)', 'NATO''ya katılan 31. ve 32. en yeni üye ülkeler hangileridir?', 'NATO''NUN EN YENİ ÜYELERİ

• 31. Üye (2023): Finlandiya
• 32. Üye (2024): İsveç

Rusya-Ukrayna savaşı sonrası geleneksel tarafsızlık politikalarını terk ederek ittifaka katılmışlardır.', 162) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_013', 'Güncel Bilgiler', 'Uluslararası Örgütler (NATO)', '2024 yılında NATO Genel Sekreterliği görevine seçilen eski Hollanda Başbakanı kimdir?', 'MARK RUTTE

10 yıl boyunca görevi yürüten Jens Stoltenberg''in ardından 1 Ekim 2024 tarihinde NATO''nun yeni Genel Sekreteri olarak göreve başlamıştır.', 163) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_014', 'Güncel Bilgiler', 'Avrupa Birliği', '2024 yılında Avrupa Birliği Konseyi Dönem Başkanlığı yürüten ülkeler hangileridir?', 'AB DÖNEM BAŞKANLARI (2024-2025)

• 2024 1. Yarı: Belçika
• 2024 2. Yarı: Macaristan
• 2025 1. Yarı: Polonya
• 2025 2. Yarı: Danimarka', 164) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_015', 'Güncel Bilgiler', 'Spor ve Futbol', 'Almanya''nın ev sahipliğinde düzenlenen EURO 2024 Avrupa Futbol Şampiyonası''nda şampiyon olan ülke hangisidir?', 'İSPANYA

Finalde İngiltere''yi 2-1 mağlup ederek turnuvayı 4. kez kazanan İspanya, Avrupa Şampiyonası tarihinin en çok şampiyon olan takımı olmuştur. A Millî Takımımız turnuvada çeyrek finale kadar yükselmiştir.', 165) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_016', 'Güncel Bilgiler', 'Nobel Ödülleri', '2024 Nobel Edebiyat Ödülü''nü kazanan ilk Güney Koreli yazar kimdir?', 'HAN KANG

''Tarihsel travmalarla yüzleşen ve insan hayatının kırılganlığını ortaya koyan yoğun şiirsel nesri için'' ödüle layık görülmüştür. En ünlü eserleri arasında ''Vejetaryen'' ve ''Çocuk Geliyor'' yer alır.', 166) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_017', 'Güncel Bilgiler', 'Nobel Ödülleri', '2024 Nobel Barış Ödülü hangi kuruluşa verilmiştir?', 'NİHON HİDANKYO (JAPONYA)

Hiroşima ve Nagazaki atom bombası mağdurlarını (Hibakusha) temsil eden taban örgütüne, ''Nükleer silahlardan arındırılmış bir dünya için yürüttüğü çabalar ve nükleer silahların bir daha asla kullanılmaması gerektiğini gösteren tanıklıkları nedeniyle'' verilmiştir.', 167) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_018', 'Güncel Bilgiler', 'Nobel Ödülleri', '2024 Nobel Fizik ve Kimya ödüllerinin ortaklaşa verildiği bilimsel devrim alanı nedir?', 'YAPAY ZEKÂ VE DERİN ÖĞRENME

• Fizik Ödülü: Yapay sinir ağları ve makine öğreniminin temellerini atan John Hopfield ve Geoffrey Hinton''a,
• Kimya Ödülü: Yapay zekâ (AlphaFold) ile protein yapısını çözen Demis Hassabis, John Jumper ve David Baker''a verilmiştir.', 168) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_019', 'Güncel Bilgiler', 'Nobel Ödülleri', '2024 Nobel Ekonomi Ödülü''nü kazanan Türk asıllı dünyaca ünlü iktisatçı kimdir?', 'DARON ACEMOĞLU

Simon Johnson ve James A. Robinson ile birlikte ''Kurumların nasıl oluştuğu ve ulusların refahını nasıl etkilediği konusundaki çığır açan çalışmaları'' (Ulusların Düşüşü tezi) nedeniyle Nobel Ekonomi Ödülü''ne layık görülmüştür.', 169) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_020', 'Güncel Bilgiler', 'Uluslararası Örgütler (ŞİÖ)', 'Şanghay İşbirliği Örgütü''ne (ŞİÖ) 2023 ve 2024 yıllarında tam üye olarak katılan ülkeler hangileridir?', 'ŞİÖ YENİ ÜYELERİ

• 2023 Üyesi: İran
• 2024 Üyesi: Belarus (Beyaz Rusya)

Örgütün tam üye sayısı böylece 10''a yükselmiştir (Türkiye diyalog ortağı statüsündedir).', 170) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_021', 'Güncel Bilgiler', 'Ekonomi ve BRICS', '2024 yılı başında BRICS topluluğuna resmen tam üye olarak katılan ülkeler hangileridir?', 'BRICS''İN YENİ ÜYELERİ

• Mısır
• Etiyopya
• İran
• Birleşik Arap Emirlikleri (BAE)

(Suudi Arabistan katılım sürecini sürdürmektedir; Arjantin ise hükümet değişikliği sonrası üyelikten çekilmiştir).', 171) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_022', 'Güncel Bilgiler', 'Uluslararası Hukuk', 'İsrail''e karşı Gazze''de Soykırım Sözleşmesi''ni ihlal ettiği gerekçesiyle Uluslararası Adalet Divanı''nda dava açan ülke hangisidir?', 'GÜNEY AFRİKA CUMHURİYETİ

Lahey''deki Uluslararası Adalet Divanı''na (UAD) başvurarak ihtiyati tedbir kararları aldırmıştır. Türkiye de TBMM Hukuk Komisyonu aracılığıyla davaya resmî müdahillik dilekçesi sunmuştur.', 172) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_023', 'Güncel Bilgiler', 'Ekonomik Örgütler (D-8)', 'Gelişmekte olan 8 Müslüman ülkenin oluşturduğu D-8 Ekonomik İşbirliği Teşkilatı''nın kurucu fikir babası kimdir?', 'NECMETTİN ERBAKAN (1997 İSTANBUL DEKLARASYONU)

Üyeler: Türkiye, İran, Pakistan, Bangladeş, Malezya, Endonezya, Mısır, Nijerya. Teşkilatın daimi sekreteryası ve merkezi İstanbul''dadır.', 173) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_024', 'Güncel Bilgiler', 'Bölgesel Örgütler (KEİ)', 'Merkezi İstanbul''da bulunan Karadeniz Ekonomik İşbirliği Teşkilatı''nın (KEİ) Karadeniz''e kıyısı olmadığı halde üye olan ülkeleri kimlerdir?', 'KEİ''NİN KIYISI OLMAYAN ÜYELERİ

Yunanistan, Arnavutluk, Ermenistan, Azerbaycan, Moldova, Sırbistan ve Kuzey Makedonya''dır. Teşkilatın merkezi ve Uluslararası Daimi Sekreteryası İstanbul''dadır.', 174) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_025', 'Güncel Bilgiler', 'Türk Dünyası (TDT)', 'Türk Devletleri Teşkilatı''nın (TDT) genel sekreterlik merkezi neresidir ve üye ülkeler kimlerdir?', 'TÜRK DEVLETLERİ TEŞKİLATI (TDT)

• Genel Merkez: İstanbul
• Tam Üyeler: Türkiye, Azerbaycan, Kazakistan, Kırgızistan, Özbekistan
• Gözlemci Üyeler: Macaristan, Türkmenistan, Kuzey Kıbrıs Türk Cumhuriyeti (KKTC)', 175) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_026', 'Güncel Bilgiler', 'Birleşmiş Milletler (BM)', 'Birleşmiş Milletler''in ana yargı organı olan Uluslararası Adalet Divanı''nın (UAD) merkezi neresidir?', 'LAHEY (HOLLANDA / BARIŞ SARAYI)

Devletler arasındaki hukuki uyuşmazlıkları çözer ve BM organlarına hukuki danışma görüşü verir. 15 yargıçtan oluşur.', 176) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_027', 'Güncel Bilgiler', 'Finans Kuruluşları', 'Uluslararası Para Fonu (IMF) ve Dünya Bankası''nın (World Bank) genel merkezleri hangi şehirdedir?', 'WASHINGTON D.C. (ABD)

İkisi de 1944 Bretton Woods Konferansı ile kurulmuş küresel finans kuruluşlarıdır.', 177) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_028', 'Güncel Bilgiler', 'Ulaşım ve Mega Projeler', '2023 metre orta açıklığıyla dünyanın en uzun orta açıklıklı asma köprüsü unvanına sahip köprümüz hangisidir?', '1915 ÇANAKKALE KÖPRÜSÜ

Çanakkale Boğazı''nın ilk asma köprüsüdür. 2023 metre orta açıklığı Türkiye Cumhuriyeti''nin 100. yılını, 318 metre kule yüksekliği ise 18 Mart 1915 Çanakkale Zaferi''ni simgeler.', 178) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_029', 'Güncel Bilgiler', 'Ulaşım ve Mega Projeler', '14,5 kilometre uzunluğuyla Türkiye''nin ve Avrupa''nın en uzun çift tüplü kara yolu tüneli hangisidir?', 'YENİ ZİGANA TÜNELİ

Trabzon ile Gümüşhane arasında Doğu Karadeniz''i Doğu ve Güneydoğu Anadolu''ya bağlayan stratejik tüneldir. Dünyanın 3. en uzun çift tüplü kara yolu tünelidir.', 179) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_030', 'Güncel Bilgiler', 'Mega Barajlar', '275 metre gövde yüksekliğiyle Türkiye''nin en yüksek, dünyanın 5. en yüksek kemer barajı hangisidir?', 'YUSUFELİ BARAJI VE HES

Artvin ilinde Çoruh Nehri üzerinde inşa edilmiştir. Çift eğrilikli beton kemer baraj tipinde Türkiye''nin en yüksek mühendislik yapısıdır.', 180) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_031', 'Güncel Bilgiler', 'Spor ve Voleybol', '2023 yılında hem FIVB Milletler Ligi (VNL) hem de CEV Avrupa Şampiyonu olan ve Dünya 1 numarası olan millî takımımız hangisidir?', 'A MİLLÎ KADIN VOLEYBOL TAKIMI (FİLENİN SULTANLARI)

Başantrenör Daniele Santarelli yönetiminde tarihin ilk Avrupa ve VNL şampiyonluklarını kazanmış, Melissa Vargas turnuvaların en değerli oyuncusu (MVP) seçilmiştir.', 181) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_032', 'Güncel Bilgiler', 'Futbol Başarıları', 'Real Madrid formasıyla UEFA Şampiyonlar Ligi kupasını kazanan ilk Türk millî futbolcu kimdir?', 'ARDA GÜLER

2023-2024 sezonunda Real Madrid ile Şampiyonlar Ligi şampiyonluğu yaşayarak bu kupayı kazanan ilk A Millî futbolcumuz olmuştur.', 182) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_033', 'Güncel Bilgiler', 'Sinema ve Sanat', '97. Akademi Ödülleri''nde (Oscar 2025) Türkiye''nin ''En İyi Uluslararası Film'' adayı seçilen film ve yönetmeni kimdir?', 'HAYAT (YÖNETMEN: ZEKİ DEMİRKUBUZ)

Türkiye Sinema Eseri Sahipleri Meslek Birliği (SESAM) jürisi tarafından 97. Oscar Ödülleri için Türkiye''nin resmi adayı olarak belirlenmiştir.', 183) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_034', 'Güncel Bilgiler', 'Spor Organizasyonları', 'Türkiye ve İtalya''nın ortaklaşa ev sahipliği yapacağı büyük futbol turnuvası hangisidir?', 'EURO 2032 (AVRUPA FUTBOL ŞAMPİYONASI)

UEFA tarafından onaylanan karara göre 2032 Avrupa Futbol Şampiyonası Türkiye ve İtalya ortaklığında düzenlenecektir.', 184) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_035', 'Güncel Bilgiler', 'Spor Organizasyonları', '2026 Kış Olimpiyat Oyunları hangi ülkede ve şehirlerde düzenlenecektir?', 'İTALYA (MİLANO VE CORTİNA D''AMPEZZO)

2026 Kış Olimpiyat ve Paralimpik Oyunları İtalya''nın Milano ve Cortina d''Ampezzo kentlerinde yapılacaktır.', 185) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_036', 'Güncel Bilgiler', 'Spor Organizasyonları', '2028 Yaz Olimpiyat Oyunları hangi şehirde düzenlenecektir?', 'LOS ANGELES (ABD)

2024 Paris''in ardından 2028 Yaz Olimpiyatları ABD''nin Los Angeles kentine verilmiştir.', 186) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_037', 'Güncel Bilgiler', 'Çevre ve İklim', '2024 BM İklim Değişikliği Konferansı (COP29) hangi ülkede düzenlenmiştir?', 'BAKÜ (AZERBAYCAN)

Kasım 2024''te ''Yeşil Bir Dünya İçin Dayanışma'' temasıyla COP29 zirvesi Azerbaycan''ın başkenti Bakü''de toplanmıştır.', 187) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_038', 'Güncel Bilgiler', 'Uluslararası Zirveler', '2024 G20 Liderler Zirvesi hangi ülkede gerçekleştirilmiştir?', 'BREZİLYA (RİO DE JANEİRO)

2024 G20 Dönem Başkanlığını yürüten Brezilya, ''Adil Bir Dünya ve Sürdürülebilir Bir Gezegen İnşa Etmek'' temasıyla zirveye ev sahipliği yapmıştır (2025 başkanı: Güney Afrika).', 188) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_039', 'Güncel Bilgiler', 'Uluslararası Yargı', 'Avrupa İnsan Hakları Mahkemesi''nde (AİHM) görev yapan Türk yargıç kimdir?', 'DOÇ. DR. SAADET YÜKSEL

2019 yılında Avrupa Konseyi Parlamenter Meclisi (AKPM) tarafından seçilmiş olup AİHM bünyesinde görev yapmaktadır.', 189) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_040', 'Güncel Bilgiler', 'Uluslararası Örgütler (İİT)', 'İslam İşbirliği Teşkilatı''nın (İİT) genel sekreterlik merkezi hangi şehirdedir?', 'CİDDE (SUUDİ ARABİSTAN)

1969 yılında Mescid-i Aksa kundaklaması sonrası kurulan teşkilatın daimi merkezi Cidde''dedir.', 190) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_041', 'Güncel Bilgiler', 'Enerji ve Ekonomi (OPEC)', 'Petrol İhraç Eden Ülkeler Örgütü''nün (OPEC) genel merkezi hangi şehirdedir?', 'VİYANA (AVUSTURYA)

⚠️ Dikkat edilmesi gereken nokta: Avusturya örgüte ev sahipliği yapmasına rağmen bir OPEC üyesi ülke DEĞİLDİR.', 191) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_042', 'Güncel Bilgiler', 'Otomotiv ve Teknoloji', 'Türkiye''nin ilk yerli ve millî elektrikli otomobili Togg''un seri üretim fabrikası hangi ilçemizdedir?', 'BURSA - GEMLİK

''Togg Teknoloji Kampüsü'' Bursa''nın Gemlik ilçesinde yer almaktadır. İlk üretilen modeli C-SUV segmentindeki T10X''tir.', 192) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_043', 'Güncel Bilgiler', 'Enerji ve Nükleer', 'Türkiye''nin ilk nükleer güç santrali olan Akkuyu Nükleer Güç Santrali hangi ilimizde inşa edilmektedir?', 'MERSİN (GÜLNAR İLÇESİ - BÜYÜKECELİ)

Rusya Devlet Nükleer Enerji Şirketi Rosatom ortaklığıyla 4 reaktör olarak inşa edilmektedir. İlk taze nükleer yakıt 2023 yılında sahaya getirilerek tesis nükleer statü kazanmıştır.', 193) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_044', 'Güncel Bilgiler', 'Savunma Sanayii', 'Baykar tarafından geliştirilen Türkiye''nin ilk insansız savaş uçağı projesinin adı nedir?', 'BAYRAKTAR KIZILELMA (MİUS)

Turbofan motorlu, süpersonik hıza yakın, düşük radar kesit alanına sahip Muharip İnsansız Uçak Sistemidir. TCG Anadolu gibi kısa pistli gemilere iniş-kalkış yapabilecek kabiliyettedir.', 194) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_045', 'Güncel Bilgiler', 'Kültür ve Kütüphaneler', 'Türkiye''nin ve başkent Ankara''nın en büyük kütüphanesi olan, 4 milyondan fazla basılı esere sahip kütüphane hangisidir?', 'CUMHURBAŞKANLIĞI MİLLET KÜTÜPHANESİ

Ankara Beştepe''de yer alır; 125 bin metrekarelik kapalı alanıyla Türkiye''nin en büyük kütüphanesidir. (İstanbul''un en büyük kütüphanesi ise restore edilen tarihî Rami Kütüphanesi''dir).', 195) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_046', 'Güncel Bilgiler', 'Kültür ve UNESCO', 'UNESCO tarafından 2023 yılı ne yılı olarak anılmıştır?', 'AŞIK VEYSEL YILI (2023)

Büyük halk ozanı Aşık Veysel Şatıroğlu''nun vefatının 50. yıl dönümü vesilesiyle UNESCO Anma ve Kutlama Yıl Dönümleri Programı''na alınmıştır.', 196) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_047', 'Güncel Bilgiler', 'Edebiyat ve Kültür', 'İstiklal Marşı şairimiz Mehmet Akif Ersoy''un şiirlerini topladığı ünlü eserinin adı nedir?', 'SAFAHAT

Yedi kitaptan oluşan bu başyapıtta İstiklal Marşı yer almaz. Şair ''O benim değil, milletimindir'' diyerek İstiklal Marşı''nı Safahat''a almamıştır.', 197) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_048', 'Güncel Bilgiler', 'Tarih ve Arkeoloji', '''Tarihin Sıfır Noktası'' olarak kabul edilen, insanlık tarihinin bilinen en eski anıtsal tapınak kompleksi hangisidir?', 'GÖBEKLİTEPE (ŞANLIURFA)

UNESCO Dünya Mirası Listesi''nde yer alan Göbeklitepe, yaklaşık 12.000 yıl öncesine (Neolitik Çağ) tarihlenir. Alman arkeolog Klaus Schmidt başkanlığında gün yüzüne çıkarılmıştır.', 198) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_049', 'Güncel Bilgiler', 'Tarih ve Arkeoloji', 'Şanlıurfa''da Neolitik Çağ''a ait 12 farklı arkeolojik kazı alanını kapsayan çatı projenin adı nedir?', 'TAŞ TEPELER PROJESİ

Göbeklitepe, Karahantepe, Sayburç, Çakmaktepe ve Sefertepe gibi alanları bir araya getiren dünya çapında bir Neolitik Çağ araştırma projesidir.', 199) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;
insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('fc_gun_050', 'Güncel Bilgiler', 'Bilim ve İcatlar', 'Biyoteknoloji alanında mRNA tabanlı Covid-19 aşısını geliştirerek 2023 Nobel Tıp Ödülü''nün kapısını aralayan Türk bilim insanları kimlerdir?', 'PROF. DR. UĞUR ŞAHİN & DR. ÖZLEM TÜRECİ

BioNTech firmasının kurucuları olan bilim insanlarımız, geliştirdikleri mRNA aşı teknolojisiyle tıp dünyasında çığır açmış ve uluslararası alanda sayısız onur ödülü almışlardır.', 200) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;

-- -------------------------------------------------------------
-- 3. 60 SANİYEDE PENÇE — DOĞRU / YANLIŞ ŞİMŞEK ÖNERMELERİ (100 ADET)
-- -------------------------------------------------------------

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Tarih',
  'İlk Türk Devletleri',
  'true_false',
  2,
  'Orhun Yazıtları; Bilge Kağan, Kül Tigin ve Vezir Tonyukuk adına dikilmiştir.',
  '{"isTrue":true}'::jsonb,
  'Doğru! II. Göktürk (Kutluk) Devleti döneminde dikilmiş olup Türk tarihinin ilk yazılı belgeleridir.',
  1
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı ve Antlaşmalar',
  'true_false',
  2,
  'Lozan Barış Antlaşması ile Boğazlar Komisyonu tamamen kaldırılmıştır.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: Lozan''da başkanı Türk olan uluslararası bir komisyon kuruldu; komisyon ancak 1936 Montrö Boğazlar Sözleşmesi ile tamamen kaldırılmıştır.',
  2
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Tarih',
  'İlk Türk Devletleri',
  'true_false',
  2,
  'Hazarlar, ordularında ücretli (paralı) asker bulunduran ilk Türk devletidir.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Ticaretle zenginleşen Hazarlar düzenli ordu yerine paralı asker kullanmış, bu da yıkılışlarını hızlandırmıştır.',
  3
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Tarih',
  'Türk-İslam Tarihi',
  'true_false',
  2,
  'Karahanlılar Devleti, resmî yazışma dili olarak Farsça ve Arapçayı kabul etmiştir.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: Selçuklular ve Gazneliler Farsça ve Arapçayı kullanırken, Karahanlılar resmî dil, ordu ve edebiyat dili olarak Türkçeyi (Hakaniye lehçesi) korumuştur.',
  4
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Tarih',
  'Türkiye Tarihi',
  'true_false',
  2,
  '1176 Miryokefalon Savaşı ile Anadolu''nun Türk yurdu olduğu kesinleşmiştir.',
  '{"isTrue":true}'::jsonb,
  'Doğru! II. Kılıç Arslan döneminde Bizans mağlup edilmiş, bu savaşa ''Yurt Tutan / Tapu Alan'' savaş denilmiştir.',
  5
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Tarih',
  'Anadolu Beylikleri',
  'true_false',
  2,
  'Anadolu''da Malazgirt sonrası kurulan ilk Türk beyliği Danişmentlilerdir.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: Anadolu''da kurulan İLK beylik Saltuklulardır (Erzurum). Danişmentliler ise beylikler arasındaki en güçlü olanıdır.',
  6
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Tarih',
  'Osmanlı Kuruluş Dönemi',
  'true_false',
  2,
  'Osmanlı Devleti''nde Rumeli''ye geçişi sağlayan ilk üs Gelibolu''daki Çimpe Kalesi''dir.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Orhan Bey döneminde Bizans İmparatoru Kantakuzen''e yapılan yardım karşılığında hediye olarak alınmıştır.',
  7
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Tarih',
  'Osmanlı Kuruluş Dönemi',
  'true_false',
  2,
  'I. Murat döneminde ''Ülke hanedanın ortak malıdır'' anlayışı benimsenmiştir.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: I. Murat taht kavgalarını azaltmak için ''Ülke hükümdar ve oğullarınındır'' anlayışını getirmiştir.',
  8
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Tarih',
  'Osmanlı Yükselme Dönemi',
  'true_false',
  2,
  'Fatih Sultan Mehmet''in çıkardığı Kanunname-i Âli Osman ile cülus bahşişi ve müsadere sistemi yasallaşmıştır.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Padişah otoritesini mutlaklaştırmak adına kardeş katli, müsadere ve cülus ilk kez kanunlaşmıştır.',
  9
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Tarih',
  'Osmanlı Yükselme Dönemi',
  'true_false',
  2,
  'Osmanlı Devleti''nde halifelik makamı Çaldıran Savaşı sonucunda Memlüklerden devralınmıştır.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: Çaldıran Savaşı (1514) Safevilere karşıdır; halifelik Mısır Seferi (1516 Mercidabık ve 1517 Ridaniye) ile Memlüklerden geçmiştir.',
  10
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Tarih',
  'Osmanlı Yükselme Dönemi',
  'true_false',
  2,
  '1533 İstanbul Antlaşması''na göre Avusturya Arşidükü protokolde Osmanlı Sadrazamına denk sayılmıştır.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Kanuni döneminde imzalanan bu antlaşma ile Osmanlı Avusturya üzerinde mutlak diplomatik üstünlük kurmuştur.',
  11
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Tarih',
  'Osmanlı Duraklama Dönemi',
  'true_false',
  2,
  'Osmanlı Devleti doğuda en geniş sınırlara Bucaş Antlaşması ile ulaşmıştır.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: Bucaş (1672) batıda en geniş sınırlardır; doğuda en geniş sınırlara 1590 Ferhat Paşa Antlaşması ile ulaşılmıştır.',
  12
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Tarih',
  'Osmanlı Gerileme Dönemi',
  'true_false',
  2,
  '1718 Pasarofça Antlaşması ile Osmanlı Devleti Batı''nın üstünlüğünü ilk kez kabul etmiş ve Lale Devri başlamıştır.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Bu tarihten itibaren fetih politikasından savunma ve barış politikasına geçilmiştir.',
  13
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'true_false',
  2,
  'Osmanlı Devleti''nde ilk anayasal belge Sened-i İttifak''tır.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: Sened-i İttifak (1808) padişah yetkilerini kısıtlayan bir sözleşmedir; ilk yazılı anayasa ise 1876 Kanun-i Esasi''dir.',
  14
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Tarih',
  'Osmanlı Dağılma Dönemi',
  'true_false',
  2,
  'Tanzimat Fermanı (1839) ile padişah ilk kez kendi gücünün üstünde kanun gücü olduğunu kabul etmiştir.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Abdülmecit döneminde Mustafa Reşit Paşa tarafından ilan edilmiş ve hukuk devleti anlayışı başlamıştır.',
  15
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Tarih',
  '20. Yüzyıl Başları',
  'true_false',
  2,
  'Mustafa Kemal''in askerî başarı elde ederek Binbaşılığa yükseldiği ilk savaş Trablusgarp Savaşı''dır.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Gazeteci Şerif takma adıyla gitmiş, Derne ve Tobruk''ta yerel kuvvetlerle İtalyanları durdurmuştur.',
  16
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Tarih',
  'I. Dünya Savaşı',
  'true_false',
  2,
  'I. Dünya Savaşı''nda Çanakkale ve Irak cepheleri Osmanlı Devleti''nin taarruz (hücum) cepheleridir.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: Taarruz cepheleri sadece Kafkas ve Kanal''dır (K-K); Çanakkale ve Irak savunma cepheleridir.',
  17
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Tarih',
  'Milli Mücadele',
  'true_false',
  2,
  'Kurtuluş Savaşı''nın amacı, gerekçesi ve yöntemi ilk kez Erzurum Kongresi''nde belirtilmiştir.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: Amaç, gerekçe ve yöntem ilk kez Amasya Genelgesi''nde (22 Haziran 1919) ilan edilmiştir.',
  18
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Tarih',
  'Milli Mücadele',
  'true_false',
  2,
  'Temsil Heyeti, Ali Fuat Paşa''yı Batı Cephesi Komutanlığı''na atayarak ilk kez bir hükümet gibi yürütme yetkisini kullanmıştır.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Sivas Kongresi''nde alınan bu karar, Temsil Heyeti''nin fiilen yürütme gücünü kullandığının kanıtıdır.',
  19
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Tarih',
  'Milli Mücadele',
  'true_false',
  2,
  'Misak-ı Millî kararlarında kapitülasyonların koşulsuz kaldırılması gerektiği ilk kez resmî belgede yer almıştır.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Son Osmanlı Mebusan Meclisi''nde kapitülasyonlar kesin bir dille reddedilmiştir.',
  20
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı',
  'true_false',
  2,
  'I. TBMM''nin kurduğu düzenli ordunun Batı Cephesi''ndeki ilk askerî zaferi Sakarya Meydan Muharebesi''dir.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: Düzenli ordunun ilk askerî zaferi I. İnönü Muharebesi''dir (Ocak 1921).',
  21
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı',
  'true_false',
  2,
  'Kars Antlaşması ile Türkiye''nin doğu sınırı kesinlik kazanmıştır.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Sakarya Zaferi sonrasında Kafkas Cumhuriyetleri ile imzalanarak doğu sınırımız kesinleşmiştir.',
  22
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Tarih',
  'Kurtuluş Savaşı',
  'true_false',
  2,
  'Mudanya Ateşkes Antlaşması ile Doğu Trakya, İstanbul ve Boğazlar savaşılmadan diplomasi yoluyla kurtarılmıştır.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Askerî zafer diplomatik zafere dönüştürülmüş ve Refet Bele bu bölgeleri teslim almıştır.',
  23
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Tarih',
  'Lozan Barış Antlaşması',
  'true_false',
  2,
  'Lozan Barış Antlaşması ile Türkiye-Suriye sınırı Hatay dahil edilerek kesinleşmiştir.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: Lozan''da 1921 Ankara Antlaşması sınırı esas alındığı için Hatay sınır dışında kalmıştır; Hatay 1939''da anavatana katılmıştır.',
  24
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Tarih',
  'Cumhuriyet Dönemi',
  'true_false',
  2,
  'Terakkiperver Cumhuriyet Fırkası, Şeyh Sait İsyanı ile bağlantısı olduğu gerekçesiyle Takrir-i Sükun Kanunu''na dayanılarak kapatılmıştır.',
  '{"isTrue":true}'::jsonb,
  'Doğru! 1925 yılında Takrir-i Sükun Kanunu uyarınca hükümet kararıyla kapatılmıştır.',
  25
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Coğrafya',
  'Coğrafi Konum',
  'true_false',
  2,
  'Türkiye''de dönenceler dışında yer aldığımız için cisimlerin gölge boyu yıl içinde hiçbir zaman sıfır olmaz.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Güneş ışınları Yengeç Dönencesi''nin kuzeyine hiçbir zaman 90° dik açıyla düşmez.',
  26
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Coğrafya',
  'Matematik Konum',
  'true_false',
  2,
  '21 Haziran tarihinde Türkiye''de güneye gidildikçe gündüz süresi uzar.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: 21 Haziran''da KUZEYE gidildikçe gündüz süresi uzar ve en uzun gündüz Sinop''ta yaşanır.',
  27
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Coğrafya',
  'Rüzgârlar',
  'true_false',
  2,
  'Türkiye''yi güneybatıdan etkileyen Lodos, sıcak karakterli bir rüzgârdır ve kışın kar erimelerine neden olur.',
  '{"isTrue":true}'::jsonb,
  'Doğru! ''KAYIP SAKAL'' şifresinde güney sektörlü olan Lodos sıcak ve nemli eser.',
  28
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Coğrafya',
  'Yer Şekilleri',
  'true_false',
  2,
  'Ege Bölgesi''ndeki Kaz, Madra, Yunt ve Bozdağlar volkanik kökenli dağlardır.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: Bu dağlar kırılma (orojenez) sonucu oluşan ''Horst'' dağlarıdır; volkanik değillerdir.',
  29
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Coğrafya',
  'Ovalar',
  'true_false',
  2,
  'Tefenni, Acıpayam, Korkuteli ve Elmalı ovaları karstik çözünme (polye) sonucu oluşmuş karstik ovalardır.',
  '{"isTrue":true}'::jsonb,
  'Doğru! ''TAKKEM'' şifresiyle Akdeniz kireçtaşı arazisinde erimeyle oluşmuş polye ovalarıdır.',
  30
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Coğrafya',
  'Delta Ovaları',
  'true_false',
  2,
  'Çukurova, Seyhan ve Ceyhan nehirlerinin getirdiği alüvyonlarla oluşmuş Türkiye''nin en büyük delta ovasıdır.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Akdeniz''e dökülen Seyhan ve Ceyhan nehirleri Çukurova''yı inşa etmiştir.',
  31
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Coğrafya',
  'Göller',
  'true_false',
  2,
  'Van Gölü, suları tatlı olan ve üzerinde balıkçılık yapılan tektonik bir göldür.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: Van Gölü volkanik set gölüdür; kapalı havza olduğu için suları aşırı sodalı ve tuzludur (sadece İnci Kefali yaşar).',
  32
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Coğrafya',
  'Akarsular',
  'true_false',
  2,
  'Fırat ve Dicle nehirleri Türkiye sınırları içinden doğup Basra Körfezi''ne dökülür.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Sınırlarımızdan doğup yurt dışında denize/körfeze dökülen nehirlerimizdendir.',
  33
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Coğrafya',
  'İklim ve Yağış',
  'true_false',
  2,
  'İç Anadolu Bölgesi''nde ilkbaharda görülen konveksiyonel yağışlara halk arasında ''Kırkikindi'' denir.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Isınan havanın dikey yükselmesiyle oluşan tipik yükselim yağışlarıdır.',
  34
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Coğrafya',
  'Toprak Tipleri',
  'true_false',
  2,
  'Erzurum-Kars platosundaki Çernezyom toprakları mineral yönünden çok fakir ve verimsizdir.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: Çernezyom organik madde (humus) yönünden dünyanın en zengin ve verimli toprağıdır; sadece iklim sert olduğu için büyükbaş mera hayvancılığı yapılır.',
  35
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Coğrafya',
  'Toprak Tipleri',
  'true_false',
  2,
  'Trakya Ergene Havzası''nda ayçiçeği tarımında yaygın kullanılan, killi dönen topraklara Vertisol denir.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Kuruyunca çatlayan, su alınca kabaran ''taş doğuran / kepir'' topraklardır.',
  36
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Coğrafya',
  'Nüfus',
  'true_false',
  2,
  'Türkiye''de aritmetik nüfus yoğunluğu en az olan ilimiz Tunceli''dir.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Yüzölçümüne göre kilometre kareye düşen insan sayısı en az olan il Tunceli''dir (Nüfusu en az olan ise Bayburt''tur).',
  37
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Coğrafya',
  'Tarım Ürünleri',
  'true_false',
  2,
  'GAP sulama projeleri sonrasında Türkiye pamuk üretiminde ilk sıraya Şanlıurfa yerleşmiştir.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Sulanan Harran Ovası sayesinde Şanlıurfa, Ege ve Çukurova''yı geçerek %40''tan fazla payla lider olmuştur.',
  38
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Coğrafya',
  'Tarım Ürünleri',
  'true_false',
  2,
  'Çay tarımı Türkiye''nin tüm Karadeniz kıyı kuşağında tabii olarak yaygın şekilde yapılır.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: Çay her mevsim bol nem, asidik toprak ve kış ılıklığı istediği için yalnızca Doğu Karadeniz''de mikroklima olarak yetişir.',
  39
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Coğrafya',
  'Tarım Ürünleri',
  'true_false',
  2,
  'Pirinç (çeltik) tarımı sivrisinek üremesi ve sıtma riski nedeniyle devlet iznine ve kontrolüne tabidir.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Yerleşim birimlerine belirli mesafede ekilme zorunluluğu vardır.',
  40
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Coğrafya',
  'Hayvancılık',
  'true_false',
  2,
  'Maki bitki örtüsünün olduğu dağlık Akdeniz kuşağında en yaygın küçükbaş hayvan türü merinos koyunudur.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: Toroslar''da çalılık maki sürgünleriyle beslenen hayvan kıl keçisidir; merinos koyunu Güney Marmara ve İç Anadolu düzlüklerindedir.',
  41
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Coğrafya',
  'Madenler',
  'true_false',
  2,
  'Karabük ve İskenderun''da demir-çelik fabrikalarının kurulmasında temel etken demir madeni yataklarının burada bulunmasıdır.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: Karabük''te etken enerji kaynağına (Taş kömürü) yakınlık; İskenderun''da ise ulaşım ve liman kolaylığıdır. Demir buralarda çıkmaz!',
  42
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Coğrafya',
  'Madenler',
  'true_false',
  2,
  'Türkiye, dünyadaki toplam bor rezervinin yaklaşık %73''üne sahiptir.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Balıkesir, Bursa, Kütahya ve Eskişehir havzalarında dünya lideriyiz.',
  43
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Coğrafya',
  'Madenler',
  'true_false',
  2,
  'Bakır madeni Kastamonu Küre, Artvin Murgul ve Diyarbakır Ergani''de çıkarılır.',
  '{"isTrue":true}'::jsonb,
  'Doğru! ''K-A-D-E-R'' şifresinde yer alan zengin bakır yataklarımızdır.',
  44
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Coğrafya',
  'Enerji Kaynakları',
  'true_false',
  2,
  'Taş kömürü 3. Jeolojik Zaman arazisi olduğu için Türkiye''nin hemen her bölgesinde yaygın olarak çıkarılır.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: Taş kömürü 1. Zaman (Paleozoik) arazisidir ve sadece Zonguldak''ta çıkar; her bölgede çıkan genç kömür ise Linyit''tir.',
  45
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Coğrafya',
  'Yenilenebilir Enerji',
  'true_false',
  2,
  'Denizli Sarayköy ve Aydın Germencik santralleri jeotermal enerji ile elektrik üretir.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Fay hatlarındaki yüksek sıcaklıktaki yer altı buharından elektrik elde edilir.',
  46
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Coğrafya',
  'Ulaşım',
  'true_false',
  2,
  'Sinop Limanı, arkasındaki Küre Dağları nedeniyle hinterlandı en dar doğal limanlarımızdandır.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Doğal bir liman olmasına rağmen iç kesimlerle dağlık ulaşım engeli nedeniyle gelişememiştir.',
  47
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Coğrafya',
  'Ulaşım',
  'true_false',
  2,
  'Antalya ve Trabzon illerimizin merkezine kadar uzanan aktif bir demir yolu ağı bulunmaktadır.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: Antalya ve Trabzon''da demir yolu bağlantısı YOKTUR! Dağlar kıyıya paralel ve engebeli olduğu için demir yolu ulaşmamıştır.',
  48
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Coğrafya',
  'Sınır Kapıları',
  'true_false',
  2,
  'Kapıkule Sınır Kapısı, Türkiye''nin Yunanistan ile olan en işlek sınır kapısıdır.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: Kapıkule Bulgaristan sınır kapımızdır; Yunanistan ile en işlek kapı İpsala''dır.',
  49
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Coğrafya',
  'UNESCO',
  'true_false',
  2,
  'Pamukkale-Hierapolis ve Kapadokya hem doğal hem kültürel unsurları barındıran Karma Miras alanlarımızdır.',
  '{"isTrue":true}'::jsonb,
  'Doğru! UNESCO Dünya Miras Listesi''nde her iki varlığımız da Karma Miras statüsündedir.',
  50
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Vatandaşlık',
  'Temel Hukuk',
  'true_false',
  2,
  'Hukukun yardımcı kaynakları olan doktrin (öğreti) ve yargısal içtihatlar hâkim için bağlayıcıdır.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: Yardımcı kaynaklar hâkim için bağlayıcı DEĞİLDİR; sadece yol göstericidir. Yazılı ve yazısız kaynaklar bağlayıcıdır.',
  51
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Vatandaşlık',
  'Normlar Hiyerarşisi',
  'true_false',
  2,
  'Normlar hiyerarşisinde yönetmelikler kanunlara ve Cumhurbaşkanlığı kararnamelerine aykırı olamaz.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Kelsen piramidine göre alt norm üst norma daima uygun olmak zorundadır.',
  52
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Vatandaşlık',
  'Kişiler Hukuku',
  'true_false',
  2,
  'Hak ehliyeti 18 yaşın doldurulması ve ayırt etme gücünün bulunmasıyla başlar.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: Hak ehliyeti sağ ve tam doğumla başlar (pasiftir). 18 yaş ve ayırt etme gücü FİİL EHLİYETİ için şarttır.',
  53
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Vatandaşlık',
  'Kişiler Hukuku',
  'true_false',
  2,
  'Evlenme kişiyi ergin kılar ve sonradan boşanma gerçekleşse dahi kişi erginliğini kaybetmez.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Medeni Kanun''a göre evlenme ile kazanılan erginlik müktesep haktır, boşanmayla geri gitmez.',
  54
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Vatandaşlık',
  'Kişiler Hukuku',
  'true_false',
  2,
  'Ölüm tehlikesi içinde kaybolan bir kimse için olaydan en az 1 yıl sonra gaiplik davası açılabilir.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Ölüm tehlikesinde 1 yıl, uzun süre haber alınamama durumunda ise 5 yıl bekleme süresi vardır.',
  55
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Vatandaşlık',
  'Anayasa Tarihi',
  'true_false',
  2,
  '1921 Anayasası (Teşkilat-ı Esasiye), Türk anayasa tarihinin ilk ve tek yumuşak anayasasıdır.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Kanunlarla aynı usulde değiştirilebildiği ve nitelikli çoğunluk aramadığı için yumuşak anayasadır.',
  56
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Vatandaşlık',
  'Anayasa Tarihi',
  'true_false',
  2,
  '1924 Anayasası ilk kabul edildiğinde devletin dininin İslam olduğu maddesi yer almaktaydı.',
  '{"isTrue":true}'::jsonb,
  'Doğru! ''Devletin dini İslam''dır'' ibaresi 1928 anayasa değişikliği ile metinden çıkarılmıştır.',
  57
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Vatandaşlık',
  'Kadın Hakları',
  'true_false',
  2,
  'Türk kadınına ilk olarak milletvekili seçme-seçilme hakkı verilmiş, daha sonra belediye ve muhtarlık hakları tanınmıştır.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: Şifre ''0-3-4 B-M-V''dir: Önce 1930 Belediye, sonra 1933 Muhtarlık, en son 1934''te Milletvekilliği hakkı verilmiştir.',
  58
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Vatandaşlık',
  '1982 Anayasası',
  'true_false',
  2,
  '1982 Anayasası''nın ilk 3 maddesi değiştirilemez ve değiştirilmesi teklif dahi edilemez.',
  '{"isTrue":true}'::jsonb,
  'Doğru! 4. madde ilk 3 maddeyi güvence altına alarak değiştirme teklifini dahi yasaklamıştır.',
  59
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Vatandaşlık',
  'Temel Haklar',
  'true_false',
  2,
  'Temel hak ve hürriyetler genel ahlak ve kamu yararı gerekçesiyle Cumhurbaşkanlığı Kararnamesi ile sınırlandırılabilir.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: Temel hak ve hürriyetler Anayasa m.13 uyarınca ANCAK KANUNLA sınırlanabilir; CBK ile sınırlanamaz.',
  60
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Vatandaşlık',
  'Temel Haklar',
  'true_false',
  2,
  'Savaş ve OHAL durumlarında dahi masumiyet karinesine ve suç ve cezaların geçmişe yürütülemeyeceği kuralına dokunulamaz.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Bu ilkeler Anayasa m.15 kapsamında dokunulamayacak ''Çekirdek Haklar''dandır.',
  61
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Vatandaşlık',
  'Siyasi Partiler',
  'true_false',
  2,
  'Hâkimler, savcılar ve TSK mensupları siyasi partilere üye olabilirler.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: Yargı ve ordu mensupları ile devlet memurlarının siyasi partilere üye olması Anayasa gereği kesinlikle yasaktır.',
  62
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Vatandaşlık',
  'Yasama',
  'true_false',
  2,
  'TBMM milletvekili sayısı 600''dür ve milletvekili seçilme yaşı 18''dir.',
  '{"isTrue":true}'::jsonb,
  'Doğru! 2017 değişikliğiyle vekil sayısı 600''e çıkarılmış, seçilme yaşı 18''e indirilmiştir.',
  63
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Vatandaşlık',
  'Yasama',
  'true_false',
  2,
  'TBMM genel seçimleri savaş gerekçesiyle meclis kararıyla en fazla 1 yıl ertelenebilir.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Savaş dışında hiçbir gerekçeyle (deprem, salgın vb.) seçim ertelenemez.',
  64
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Vatandaşlık',
  'Yasama',
  'true_false',
  2,
  'Yasama sorumsuzluğu meclis kararıyla kaldırılabilirken, yasama dokunulmazlığı mutlaktır ve kaldırılamaz.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: Tam tersi! Kürsü sorumsuzluğu mutlaktır ve kaldırılamaz; dokunulmazlık ise nisbidir ve Meclis Genel Kurulu kararıyla kaldırılabilir.',
  65
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Vatandaşlık',
  'Yasama',
  'true_false',
  2,
  'TBMM toplantı yeter sayısı 200 milletvekilidir ve karar yeter sayısı hiçbir şekilde 151''den az olamaz.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Üye tamsayısının 1/3''ü ile toplanır (200 MV), üye tamsayısının 1/4''ünün 1 fazlasından (151 MV) az oyla karar alamaz.',
  66
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Vatandaşlık',
  'Kanun Yapımı',
  'true_false',
  2,
  'Bütçe kanun teklifi hariç, milletvekillerinden başka kimse kanun teklif edemez.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Kanun teklif etme yetkisi münhasıran milletvekillerine aittir. Bütçe teklifini ise Cumhurbaşkanı sunar.',
  67
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Vatandaşlık',
  'Anayasa Değişikliği',
  'true_false',
  2,
  'TBMM''de 400 ve üzeri oyla kabul edilen bir anayasa değişikliği kanununu Cumhurbaşkanı zorunlu olarak referanduma götürmelidir.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: 400 ve üzeri kabulde halkoylaması İHTİYARİDİR (Cumhurbaşkanı dilerse doğrudan onaylar). Zorunlu halkoylaması 360-399 oy aralığındadır.',
  68
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Vatandaşlık',
  'Yürütme',
  'true_false',
  2,
  'Cumhurbaşkanı seçilmek için en az 40 yaşını doldurmuş olmak ve yükseköğrenim mezunu olmak şarttır.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Anayasa m.101''e göre 40 yaş ve üniversite mezuniyeti zorunlu şartlardandır.',
  69
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Vatandaşlık',
  'Yürütme',
  'true_false',
  2,
  'Olağanüstü Hâl (OHAL) ilan etme yetkisi Cumhurbaşkanı''na aittir ve süresi bir defada en fazla 6 aydır.',
  '{"isTrue":true}'::jsonb,
  'Doğru! İlan günü Meclis onayına sunulur; TBMM süreyi her defasında en fazla 4 ay uzatabilir.',
  70
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Vatandaşlık',
  'Yürütme',
  'true_false',
  2,
  'Jandarma Genel Komutanı, Millî Güvenlik Kurulu''nun (MGK) daimi askerî üyelerinden biridir.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: 2016 değişikliği ile Jandarma Genel Komutanı MGK üyeliğinden çıkarılmıştır!',
  71
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Vatandaşlık',
  'Yargı',
  'true_false',
  2,
  'Sayıştay ve Hâkimler ve Savcılar Kurulu (HSK), 1982 Anayasası''nda sayılan Yüksek Mahkemeler arasındadır.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: Sayıştay ve HSK yüksek mahkeme DEĞİLDİR! Yüksek mahkemeler sadece 4 tanedir: AYM, Yargıtay, Danıştay ve Uyuşmazlık Mahkemesi.',
  72
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Vatandaşlık',
  'Yargı',
  'true_false',
  2,
  'Anayasa Mahkemesi 15 üyeden oluşur ve üyelerin görev süresi 12 yıldır.',
  '{"isTrue":true}'::jsonb,
  'Doğru! 3 üyeyi TBMM, 12 üyeyi Cumhurbaşkanı seçer. Bir kimse iki defa seçilemez.',
  73
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Vatandaşlık',
  'İdare Hukuku',
  'true_false',
  2,
  'Vali istisnai memur olup yetki genişliğine sahiptir; kaymakam ise meslek memurudur ve yetki genişliği yoktur.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Yetki genişliği il bazında sadece valiye tanınmış anayasal bir yetkidir.',
  74
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Vatandaşlık',
  'İdare Hukuku',
  'true_false',
  2,
  'Büyükşehir belediyesi kurulabilmesi için toplam il nüfusunun en az 750.000 olması ve KANUNLA kurulması gerekir.',
  '{"isTrue":true}'::jsonb,
  'Doğru! 750 bin nüfus eşiği vardır ve mutlaka kanun çıkarılmalıdır.',
  75
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Güncel Bilgiler',
  'Spor',
  'true_false',
  2,
  'Yusuf Dikeç, 2024 Paris Olimpiyatları''nda atıcılık branşında Türkiye''ye tarihin ilk olimpiyat altın madalyasını kazandırmıştır.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: Yusuf Dikeç ve Şevval İlayda Tarhan altın değil GÜMÜŞ madalya kazanmıştır (Atıcılıktaki ilk olimpiyat madalyamızdır).',
  76
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Güncel Bilgiler',
  'Spor',
  'true_false',
  2,
  'Mete Gazoz, Tokyo 2020 Olimpiyatları''nda ferdi altın madalya, Paris 2024''te ise Erkek Takım ile bronz madalya kazanmıştır.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Türk okçuluk tarihinin en başarılı olimpik sporcusudur.',
  77
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Güncel Bilgiler',
  'Bilim ve Uzay',
  'true_false',
  2,
  'Axiom-3 misyonu kapsamında Uluslararası Uzay İstasyonu''nda (ISS) 13 deney icra eden ilk Türk astronot Alper Gezeravcı''dır.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Ocak 2024''te uzaya çıkan ilk Türk vatandaşı olmuştur.',
  78
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Güncel Bilgiler',
  'Bilim ve Uzay',
  'true_false',
  2,
  'Tuva Cihangir Atasever, yörünge altı uçuşla uzayda bilimsel araştırma yapan ikinci Türk astronotumuzdur.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Haziran 2024''te Virgin Galactic VSS Unity aracıyla 7 mikro yerçekimi deneyi yapmıştır.',
  79
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Güncel Bilgiler',
  'Kültür Başkenti',
  'true_false',
  2,
  'TÜRKSOY tarafından 2024 yılı Türk Dünyası Kültür Başkenti ilan edilen şehir Anev''dir (Türkmenistan).',
  '{"isTrue":true}'::jsonb,
  'Doğru! 2025 yılı için ise Kazakistan''ın Aktau şehri seçilmiştir.',
  80
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Güncel Bilgiler',
  'UNESCO',
  'true_false',
  2,
  'UNESCO Dünya Miras Listesi''ne 2023 yılında 20. varlığımız olarak Ankara Gordion Antik Kenti dâhil edilmiştir.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Frigya uygarlığının başkenti Gordion listeye girmiştir (21. ise Ahşap Hipostil Camilerimizdir).',
  81
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Güncel Bilgiler',
  'Millî Teknoloji',
  'true_false',
  2,
  'TÜRKSAT 6A, Türkiye''nin yerli imkânlarla ürettiği ilk haberleşme uydusudur.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Temmuz 2024''te fırlatılmış ve Türkiye kendi haberleşme uydusunu yapan 11 ülkeden biri olmuştur.',
  82
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Güncel Bilgiler',
  'Savunma Sanayii',
  'true_false',
  2,
  'TUSAŞ tarafından geliştirilen 5. nesil millî muharip uçağımız KAAN, ilk uçuşunu 2024 yılında başarıyla gerçekleştirmiştir.',
  '{"isTrue":true}'::jsonb,
  'Doğru! 21 Şubat 2024 tarihinde gökyüzüyle buluşmuştur.',
  83
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Güncel Bilgiler',
  'Savunma Sanayii',
  'true_false',
  2,
  'TCG Anadolu gemisi, dünyanın ilk nükleer denizaltısı olarak Türk Deniz Kuvvetleri''ne katılmıştır.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: TCG Anadolu denizaltı değil; çok maksatlı amfibi hücum gemisi ve dünyanın İLK SİHA gemisidir.',
  84
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Güncel Bilgiler',
  'Uluslararası Örgütler',
  'true_false',
  2,
  '2024 yılında NATO''ya katılarak ittifakın 32. üyesi olan ülke İsveç''tir.',
  '{"isTrue":true}'::jsonb,
  'Doğru! 31. üye Finlandiya (2023), 32. üye ise İsveç (2024) olmuştur.',
  85
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Güncel Bilgiler',
  'Uluslararası Örgütler',
  'true_false',
  2,
  '2024 yılında Jens Stoltenberg''in ardından yeni NATO Genel Sekreteri olarak Mark Rutte göreve başlamıştır.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Eski Hollanda Başbakanı Mark Rutte NATO Genel Sekreteri seçilmiştir.',
  86
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Güncel Bilgiler',
  'Nobel Ödülleri',
  'true_false',
  2,
  '2024 Nobel Edebiyat Ödülü''nü Güney Koreli yazar Han Kang kazanmıştır.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Şiirsel nesriyle tarihsel travmaları ele alan yazar bu ödülü kazanan ilk Güney Koreli olmuştur.',
  87
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Güncel Bilgiler',
  'Nobel Ödülleri',
  'true_false',
  2,
  '2024 Nobel Ekonomi Ödülü, kurumların oluşumu ve refah üzerindeki etkisi araştırmalarıyla Daron Acemoğlu''na verilmiştir.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Simon Johnson ve James A. Robinson ile birlikte Nobel Ekonomi Ödülü''ne layık görülmüştür.',
  88
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Güncel Bilgiler',
  'Nobel Ödülleri',
  'true_false',
  2,
  '2024 Nobel Barış Ödülü Birleşmiş Milletler Mülteciler Yüksek Komiserliği''ne verilmiştir.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: 2024 Nobel Barış Ödülü, nükleer silahsız bir dünya için mücadele eden Japon örgüt ''Nihon Hidankyo''ya verilmiştir.',
  89
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Güncel Bilgiler',
  'Uluslararası Örgütler',
  'true_false',
  2,
  'Şanghay İşbirliği Örgütü''ne 2024 yılında tam üye olarak katılan son ülke Belarus''tur.',
  '{"isTrue":true}'::jsonb,
  'Doğru! 2023''te İran, 2024''te Belarus tam üye olmuş ve üye sayısı 10''a çıkmıştır.',
  90
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Güncel Bilgiler',
  'Ekonomi Örgütleri',
  'true_false',
  2,
  'D-8 Ekonomik İşbirliği Teşkilatı''nın genel sekreterliği ve merkezi Tahran''dadır.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: D-8''in genel sekreterlik merkezi Türkiye''dedir (İstanbul).',
  91
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Güncel Bilgiler',
  'Türk Dünyası',
  'true_false',
  2,
  'Türk Devletleri Teşkilatı''nın (TDT) daimi genel sekreterlik merkezi Bakü''dedir.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: Türk Devletleri Teşkilatı''nın merkezi İstanbul''dadır.',
  92
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Güncel Bilgiler',
  'Uluslararası Yargı',
  'true_false',
  2,
  'Birleşmiş Milletler''in ana adli organı olan Uluslararası Adalet Divanı''nın merkezi İsviçre''nin Cenevre kentindedir.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: Uluslararası Adalet Divanı Hollanda''nın Lahey (Barış Sarayı) kentindedir.',
  93
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Güncel Bilgiler',
  'Mega Projeler',
  'true_false',
  2,
  '1915 Çanakkale Köprüsü, 2023 metre orta açıklığıyla dünyanın en uzun orta açıklıklı asma köprüsüdür.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Cumhuriyetimizin 100. yılını simgeleyen 2023 metre orta açıklığıyla dünya rekoru sahibidir.',
  94
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Güncel Bilgiler',
  'Mega Projeler',
  'true_false',
  2,
  'Trabzon-Gümüşhane arasındaki Yeni Zigana Tüneli, 14,5 km uzunluğuyla Türkiye''nin ve Avrupa''nın en uzun çift tüplü kara yolu tünelidir.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Dünyanın da en uzun 3. çift tüplü kara yolu tünelidir.',
  95
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Güncel Bilgiler',
  'Spor',
  'true_false',
  2,
  'EURO 2032 Avrupa Futbol Şampiyonası, Türkiye ve İspanya ortaklığıyla düzenlenecektir.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: EURO 2032 Türkiye ve İTALYA ortaklığıyla düzenlenecektir.',
  96
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Güncel Bilgiler',
  'Spor',
  'true_false',
  2,
  'Real Madrid formasıyla 2024 UEFA Şampiyonlar Ligi şampiyonluğu yaşayan ilk Türk millî futbolcu Arda Güler''dir.',
  '{"isTrue":true}'::jsonb,
  'Doğru! Genç millî futbolcumuz Şampiyonlar Ligi madalyası alan ilk A Millî oyuncumuz olmuştur.',
  97
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Güncel Bilgiler',
  'Çevre ve İklim',
  'true_false',
  2,
  '2024 BM İklim Değişikliği Konferansı (COP29) Azerbaycan''ın başkenti Bakü''de düzenlenmiştir.',
  '{"isTrue":true}'::jsonb,
  'Doğru! ''Yeşil Dünya İçin Dayanışma'' temasıyla Bakü''de gerçekleştirilmiştir.',
  98
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Güncel Bilgiler',
  'Sanat ve Sinema',
  'true_false',
  2,
  '97. Akademi Ödülleri''nde (Oscar) En İyi Uluslararası Film kategorisinde Türkiye''nin adayı Zeki Demirkubuz''un ''Hayat'' filmidir.',
  '{"isTrue":true}'::jsonb,
  'Doğru! SESAM kurulu kararıyla Türkiye adayı olarak belirlenmiştir.',
  99
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Güncel Bilgiler',
  'Enerji',
  'true_false',
  2,
  'Türkiye''nin ilk nükleer güç santrali olan Akkuyu NGS, Sinop ilinde inşa edilmektedir.',
  '{"isTrue":false}'::jsonb,
  'Yanlış! ⚠️ ÖSYM Çeldirici Tuzağı: Akkuyu NGS Mersin''in Gülnar (Büyükeceli) ilçesinde inşa edilmektedir. Sinop projesi ise ikinci santral olarak planlanmaktadır.',
  100
);

-- -------------------------------------------------------------
-- 4. KAVRAM EŞLEŞTİRME — TEMATİK SETLER (20 SET, 80 KAVRAM ÇİFTİ)
-- -------------------------------------------------------------

insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Tarih',
  'Kavram Eşleştirme',
  'matching',
  2,
  'Tarih: Antlaşmalar & Önemi',
  '{"pairs":[{"id":"h1_1","leftTerm":"Lozan Antlaşması","rightMatch":"Kapitülasyonların Kaldırılması"},{"id":"h1_2","leftTerm":"Mondros Ateşkesi","rightMatch":"7. ve 24. Maddelerle İşgal Zeminini Hazırlama"},{"id":"h1_3","leftTerm":"Mudanya Ateşkesi","rightMatch":"Doğu Trakya''nın Savaşsız Kurtarılması"},{"id":"h1_4","leftTerm":"Gümrü Antlaşması","rightMatch":"TBMM''nin Uluslararası İlk Siyasi Zaferi"}]}'::jsonb,
  'Kadro Kavram Eşleştirme Çözümü: Lozan Antlaşması ➔ Kapitülasyonların Kaldırılması; Mondros Ateşkesi ➔ 7. ve 24. Maddelerle İşgal Zeminini Hazırlama; Mudanya Ateşkesi ➔ Doğu Trakya''nın Savaşsız Kurtarılması; Gümrü Antlaşması ➔ TBMM''nin Uluslararası İlk Siyasi Zaferi',
  1
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Tarih',
  'Kavram Eşleştirme',
  'matching',
  2,
  'Tarih: Padişahlar & Islahatlar',
  '{"pairs":[{"id":"h2_1","leftTerm":"Orhan Bey","rightMatch":"İlk Divan Teşkilatı ve İznik Medresesi"},{"id":"h2_2","leftTerm":"I. Murat","rightMatch":"Yeniçeri Ocağı (Kapıkulu) ve Tımar Sistemi"},{"id":"h2_3","leftTerm":"II. Mahmut","rightMatch":"Yeniçeri Ocağının Kaldırılması (Vaka-i Hayriye)"},{"id":"h2_4","leftTerm":"III. Selim","rightMatch":"Nizam-ı Cedit Ordusu ve İrad-ı Cedit Hazinesi"}]}'::jsonb,
  'Kadro Kavram Eşleştirme Çözümü: Orhan Bey ➔ İlk Divan Teşkilatı ve İznik Medresesi; I. Murat ➔ Yeniçeri Ocağı (Kapıkulu) ve Tımar Sistemi; II. Mahmut ➔ Yeniçeri Ocağının Kaldırılması (Vaka-i Hayriye); III. Selim ➔ Nizam-ı Cedit Ordusu ve İrad-ı Cedit Hazinesi',
  2
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Tarih',
  'Kavram Eşleştirme',
  'matching',
  2,
  'Tarih: Muharebeler & Sonuçları',
  '{"pairs":[{"id":"h3_1","leftTerm":"I. İnönü Muharebesi","rightMatch":"Teşkilat-ı Esasiye ve İstiklal Marşı''nın Kabulü"},{"id":"h3_2","leftTerm":"Sakarya Meydan Muharebesi","rightMatch":"1683 Viyana Kuşatması''ndan Beri Geri Çekilişin Sonu"},{"id":"h3_3","leftTerm":"Kütahya-Eskişehir Muharebeleri","rightMatch":"Mustafa Kemal''e 3 Aylık Başkomutanlık Verilmesi"},{"id":"h3_4","leftTerm":"Büyük Taarruz","rightMatch":"Mudanya Ateşkesine ve Kurtuluşa Zemin Hazırlama"}]}'::jsonb,
  'Kadro Kavram Eşleştirme Çözümü: I. İnönü Muharebesi ➔ Teşkilat-ı Esasiye ve İstiklal Marşı''nın Kabulü; Sakarya Meydan Muharebesi ➔ 1683 Viyana Kuşatması''ndan Beri Geri Çekilişin Sonu; Kütahya-Eskişehir Muharebeleri ➔ Mustafa Kemal''e 3 Aylık Başkomutanlık Verilmesi; Büyük Taarruz ➔ Mudanya Ateşkesine ve Kurtuluşa Zemin Hazırlama',
  3
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Tarih',
  'Kavram Eşleştirme',
  'matching',
  2,
  'Tarih: Genelgeler & Kongreler',
  '{"pairs":[{"id":"h4_1","leftTerm":"Havza Genelgesi","rightMatch":"İşgallere Karşı İlk Resmî Protesto ve Miting Çağrısı"},{"id":"h4_2","leftTerm":"Amasya Genelgesi","rightMatch":"Millî Mücadele''nin Amacı, Gerekçesi ve Yöntemi"},{"id":"h4_3","leftTerm":"Erzurum Kongresi","rightMatch":"İlk Kez Misak-ı Millî Sınırları ve Temsil Heyeti"},{"id":"h4_4","leftTerm":"Sivas Kongresi","rightMatch":"Tüm Millî Cemiyetlerin Tek Çatı Altında Birleşmesi"}]}'::jsonb,
  'Kadro Kavram Eşleştirme Çözümü: Havza Genelgesi ➔ İşgallere Karşı İlk Resmî Protesto ve Miting Çağrısı; Amasya Genelgesi ➔ Millî Mücadele''nin Amacı, Gerekçesi ve Yöntemi; Erzurum Kongresi ➔ İlk Kez Misak-ı Millî Sınırları ve Temsil Heyeti; Sivas Kongresi ➔ Tüm Millî Cemiyetlerin Tek Çatı Altında Birleşmesi',
  4
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Tarih',
  'Kavram Eşleştirme',
  'matching',
  2,
  'Tarih: Türk-İslam Eserleri & Yazarları',
  '{"pairs":[{"id":"h5_1","leftTerm":"Kutadgu Bilig","rightMatch":"Yusuf Has Hacib (İlk Türk-İslam Siyasetnamesi)"},{"id":"h5_2","leftTerm":"Divanü Lugati''t-Türk","rightMatch":"Kaşgarlı Mahmud (İlk Türkçe Sözlük ve Harita)"},{"id":"h5_3","leftTerm":"Atabetü''l-Hakayık","rightMatch":"Edip Ahmet Yükneki (Ahlak ve Hakikatler Eşiği)"},{"id":"h5_4","leftTerm":"Divan-ı Hikmet","rightMatch":"Hoca Ahmet Yesevi (İlk Tasavvuf Eseri)"}]}'::jsonb,
  'Kadro Kavram Eşleştirme Çözümü: Kutadgu Bilig ➔ Yusuf Has Hacib (İlk Türk-İslam Siyasetnamesi); Divanü Lugati''t-Türk ➔ Kaşgarlı Mahmud (İlk Türkçe Sözlük ve Harita); Atabetü''l-Hakayık ➔ Edip Ahmet Yükneki (Ahlak ve Hakikatler Eşiği); Divan-ı Hikmet ➔ Hoca Ahmet Yesevi (İlk Tasavvuf Eseri)',
  5
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Tarih',
  'Kavram Eşleştirme',
  'matching',
  2,
  'Tarih: Atatürk İnkılapları & Alanları',
  '{"pairs":[{"id":"h6_1","leftTerm":"Tevhid-i Tedrisat Kanunu","rightMatch":"Eğitim ve Öğretimin Tek Çatı Altında Birleşmesi"},{"id":"h6_2","leftTerm":"Medeni Kanun''un Kabulü","rightMatch":"Patrikhanenin Dünyevi Yetkilerinin Sona Ermesi"},{"id":"h6_3","leftTerm":"Kabotaj Kanunu","rightMatch":"Türk Karasularında Deniz Ticareti Bağımsızlığı"},{"id":"h6_4","leftTerm":"Teşvik-i Sanayi Kanunu","rightMatch":"Özel Sektörü Destekleme ve Sanayileşme Hamlesi"}]}'::jsonb,
  'Kadro Kavram Eşleştirme Çözümü: Tevhid-i Tedrisat Kanunu ➔ Eğitim ve Öğretimin Tek Çatı Altında Birleşmesi; Medeni Kanun''un Kabulü ➔ Patrikhanenin Dünyevi Yetkilerinin Sona Ermesi; Kabotaj Kanunu ➔ Türk Karasularında Deniz Ticareti Bağımsızlığı; Teşvik-i Sanayi Kanunu ➔ Özel Sektörü Destekleme ve Sanayileşme Hamlesi',
  6
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Coğrafya',
  'Kavram Eşleştirme',
  'matching',
  2,
  'Coğrafya: Madenler & Merkezler',
  '{"pairs":[{"id":"g1_1","leftTerm":"Divriği & Hekimhan","rightMatch":"Demir Çıkarım Alanı"},{"id":"g1_2","leftTerm":"Murgul & Küre","rightMatch":"Bakır Çıkarım Alanı"},{"id":"g1_3","leftTerm":"Seydişehir & Akseki","rightMatch":"Boksit (Alüminyum) Alanı"},{"id":"g1_4","leftTerm":"Kırka & Emet","rightMatch":"Bor Mineralleri Alanı"}]}'::jsonb,
  'Kadro Kavram Eşleştirme Çözümü: Divriği & Hekimhan ➔ Demir Çıkarım Alanı; Murgul & Küre ➔ Bakır Çıkarım Alanı; Seydişehir & Akseki ➔ Boksit (Alüminyum) Alanı; Kırka & Emet ➔ Bor Mineralleri Alanı',
  7
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Coğrafya',
  'Kavram Eşleştirme',
  'matching',
  2,
  'Coğrafya: Ovalar & Oluşum Kökenleri',
  '{"pairs":[{"id":"g2_1","leftTerm":"Çukurova & Bafra","rightMatch":"Akarsu Birikimi (Delta Ovası)"},{"id":"g2_2","leftTerm":"Elmalı & Tefenni","rightMatch":"Karstik Çözünme (Polye Ovası)"},{"id":"g2_3","leftTerm":"Gediz & Büyük Menderes","rightMatch":"Çöküntü Hendeği (Graben / Tektonik Ova)"},{"id":"g2_4","leftTerm":"Konya & Ergene Ovaları","rightMatch":"Eski Göl Tabanı ve Tortullanma Ovası"}]}'::jsonb,
  'Kadro Kavram Eşleştirme Çözümü: Çukurova & Bafra ➔ Akarsu Birikimi (Delta Ovası); Elmalı & Tefenni ➔ Karstik Çözünme (Polye Ovası); Gediz & Büyük Menderes ➔ Çöküntü Hendeği (Graben / Tektonik Ova); Konya & Ergene Ovaları ➔ Eski Göl Tabanı ve Tortullanma Ovası',
  8
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Coğrafya',
  'Kavram Eşleştirme',
  'matching',
  2,
  'Coğrafya: Barajlar & Akarsular',
  '{"pairs":[{"id":"g3_1","leftTerm":"Atatürk & Keban Barajı","rightMatch":"Fırat Nehri"},{"id":"g3_2","leftTerm":"Ilısu (Veysel Eroğlu) Barajı","rightMatch":"Dicle Nehri"},{"id":"g3_3","leftTerm":"Deriner & Yusufeli Barajı","rightMatch":"Çoruh Nehri"},{"id":"g3_4","leftTerm":"Altınkaya & Hirfanlı Barajı","rightMatch":"Kızılırmak"}]}'::jsonb,
  'Kadro Kavram Eşleştirme Çözümü: Atatürk & Keban Barajı ➔ Fırat Nehri; Ilısu (Veysel Eroğlu) Barajı ➔ Dicle Nehri; Deriner & Yusufeli Barajı ➔ Çoruh Nehri; Altınkaya & Hirfanlı Barajı ➔ Kızılırmak',
  9
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Coğrafya',
  'Kavram Eşleştirme',
  'matching',
  2,
  'Coğrafya: Yerel Rüzgârlar & Yönleri',
  '{"pairs":[{"id":"g4_1","leftTerm":"Karayel","rightMatch":"Kuzeybatıdan Esen Soğuk Rüzgâr"},{"id":"g4_2","leftTerm":"Poyraz","rightMatch":"Kuzeydoğudan Esen Soğuk ve Kuru Rüzgâr"},{"id":"g4_3","leftTerm":"Samyeli (Keşişleme)","rightMatch":"Güneydoğudan Esen Sıcak ve Çöl Kökenli Rüzgâr"},{"id":"g4_4","leftTerm":"Lodos","rightMatch":"Güneybatıdan Esen Ilık ve Denizel Rüzgâr"}]}'::jsonb,
  'Kadro Kavram Eşleştirme Çözümü: Karayel ➔ Kuzeybatıdan Esen Soğuk Rüzgâr; Poyraz ➔ Kuzeydoğudan Esen Soğuk ve Kuru Rüzgâr; Samyeli (Keşişleme) ➔ Güneydoğudan Esen Sıcak ve Çöl Kökenli Rüzgâr; Lodos ➔ Güneybatıdan Esen Ilık ve Denizel Rüzgâr',
  10
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Coğrafya',
  'Kavram Eşleştirme',
  'matching',
  2,
  'Coğrafya: Göller & Oluşum Tipleri',
  '{"pairs":[{"id":"g5_1","leftTerm":"Abant & Yedigöller","rightMatch":"Heyelan Set Gölü"},{"id":"g5_2","leftTerm":"Nemrut & Meke Gölü","rightMatch":"Volkanik Krater / Maar Gölü"},{"id":"g5_3","leftTerm":"Çıldır & Van Gölü","rightMatch":"Volkanik Set Gölü"},{"id":"g5_4","leftTerm":"Salda & Avlan Gölü","rightMatch":"Karstik Erime Gölü"}]}'::jsonb,
  'Kadro Kavram Eşleştirme Çözümü: Abant & Yedigöller ➔ Heyelan Set Gölü; Nemrut & Meke Gölü ➔ Volkanik Krater / Maar Gölü; Çıldır & Van Gölü ➔ Volkanik Set Gölü; Salda & Avlan Gölü ➔ Karstik Erime Gölü',
  11
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Vatandaşlık',
  'Kavram Eşleştirme',
  'matching',
  2,
  'Vatandaşlık: Erkler & Kurumlar',
  '{"pairs":[{"id":"v1_1","leftTerm":"Yasama Yetkisi","rightMatch":"Türkiye Büyük Millet Meclisi"},{"id":"v1_2","leftTerm":"Yargısal Denetim (Bireysel Başvuru)","rightMatch":"Anayasa Mahkemesi"},{"id":"v1_3","leftTerm":"İdari Yargı En Üst Mercii","rightMatch":"Danıştay"},{"id":"v1_4","leftTerm":"Adli Yargı En Üst Mercii","rightMatch":"Yargıtay"}]}'::jsonb,
  'Kadro Kavram Eşleştirme Çözümü: Yasama Yetkisi ➔ Türkiye Büyük Millet Meclisi; Yargısal Denetim (Bireysel Başvuru) ➔ Anayasa Mahkemesi; İdari Yargı En Üst Mercii ➔ Danıştay; Adli Yargı En Üst Mercii ➔ Yargıtay',
  12
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Vatandaşlık',
  'Kavram Eşleştirme',
  'matching',
  2,
  'Vatandaşlık: Kurumlar & Üye Sayıları',
  '{"pairs":[{"id":"v2_1","leftTerm":"Türkiye Büyük Millet Meclisi","rightMatch":"600 Milletvekili"},{"id":"v2_2","leftTerm":"Anayasa Mahkemesi","rightMatch":"15 Asıl Üye (12 Yıllığına)"},{"id":"v2_3","leftTerm":"Hâkimler ve Savcılar Kurulu","rightMatch":"13 Üye (2 Daire Hâlinde)"},{"id":"v2_4","leftTerm":"Yüksek Seçim Kurulu","rightMatch":"7 Asıl, 4 Yedek (11 Üye)"}]}'::jsonb,
  'Kadro Kavram Eşleştirme Çözümü: Türkiye Büyük Millet Meclisi ➔ 600 Milletvekili; Anayasa Mahkemesi ➔ 15 Asıl Üye (12 Yıllığına); Hâkimler ve Savcılar Kurulu ➔ 13 Üye (2 Daire Hâlinde); Yüksek Seçim Kurulu ➔ 7 Asıl, 4 Yedek (11 Üye)',
  13
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Vatandaşlık',
  'Kavram Eşleştirme',
  'matching',
  2,
  'Vatandaşlık: Hak Türleri & Kategorileri',
  '{"pairs":[{"id":"v3_1","leftTerm":"Konut Dokunulmazlığı & Mülkiyet","rightMatch":"Kişi Hak ve Ödevleri (Koruyucu / Negatif)"},{"id":"v3_2","leftTerm":"Sendika Kurma & Sağlık Hakkı","rightMatch":"Sosyal ve Ekonomik Haklar (İsteme / Pozitif)"},{"id":"v3_3","leftTerm":"Kamu Hizmetine Girme & Vergi Ödevi","rightMatch":"Siyasi Haklar ve Ödevler (Katılma / Aktif)"},{"id":"v3_4","leftTerm":"Yaşama Hakkı & Masumiyet Karinesi","rightMatch":"Savaş ve OHAL''de Dokunulamaz Çekirdek Haklar"}]}'::jsonb,
  'Kadro Kavram Eşleştirme Çözümü: Konut Dokunulmazlığı & Mülkiyet ➔ Kişi Hak ve Ödevleri (Koruyucu / Negatif); Sendika Kurma & Sağlık Hakkı ➔ Sosyal ve Ekonomik Haklar (İsteme / Pozitif); Kamu Hizmetine Girme & Vergi Ödevi ➔ Siyasi Haklar ve Ödevler (Katılma / Aktif); Yaşama Hakkı & Masumiyet Karinesi ➔ Savaş ve OHAL''de Dokunulamaz Çekirdek Haklar',
  14
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Vatandaşlık',
  'Kavram Eşleştirme',
  'matching',
  2,
  'Vatandaşlık: Yargı Mercileri & Görevleri',
  '{"pairs":[{"id":"v4_1","leftTerm":"Danıştay","rightMatch":"İdari İşlemlerin İptali ve İdari Yargı Temyizi"},{"id":"v4_2","leftTerm":"Yargıtay","rightMatch":"Hukuk ve Ceza Mahkemeleri Adli Yargı Temyizi"},{"id":"v4_3","leftTerm":"Uyuşmazlık Mahkemesi","rightMatch":"Adli ve İdari Yargı Arasındaki Görev İhtilafları"},{"id":"v4_4","leftTerm":"Sayıştay","rightMatch":"TBMM Adına Kamu Gelir ve Giderlerinin Kesin Hesabı"}]}'::jsonb,
  'Kadro Kavram Eşleştirme Çözümü: Danıştay ➔ İdari İşlemlerin İptali ve İdari Yargı Temyizi; Yargıtay ➔ Hukuk ve Ceza Mahkemeleri Adli Yargı Temyizi; Uyuşmazlık Mahkemesi ➔ Adli ve İdari Yargı Arasındaki Görev İhtilafları; Sayıştay ➔ TBMM Adına Kamu Gelir ve Giderlerinin Kesin Hesabı',
  15
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Vatandaşlık',
  'Kavram Eşleştirme',
  'matching',
  2,
  'Vatandaşlık: Anayasal Süreler & Nisaplar',
  '{"pairs":[{"id":"v5_1","leftTerm":"Kanunların Şekil İptal Davası","rightMatch":"Resmî Gazete Yayımından İtibaren 10 Gün"},{"id":"v5_2","leftTerm":"Cumhurbaşkanının Kanun İnceleme Süresi","rightMatch":"TBMM Kabulünden İtibaren 15 Gün"},{"id":"v5_3","leftTerm":"Anayasa Değişikliği Teklif Sayısı","rightMatch":"TBMM Üye Tamsayısının En Az 1/3''ü (200 MV)"},{"id":"v5_4","leftTerm":"AYM''ye Bireysel Başvuru Süresi","rightMatch":"Olağan Kanun Yollarının Tüketilmesinden Sonra 30 Gün"}]}'::jsonb,
  'Kadro Kavram Eşleştirme Çözümü: Kanunların Şekil İptal Davası ➔ Resmî Gazete Yayımından İtibaren 10 Gün; Cumhurbaşkanının Kanun İnceleme Süresi ➔ TBMM Kabulünden İtibaren 15 Gün; Anayasa Değişikliği Teklif Sayısı ➔ TBMM Üye Tamsayısının En Az 1/3''ü (200 MV); AYM''ye Bireysel Başvuru Süresi ➔ Olağan Kanun Yollarının Tüketilmesinden Sonra 30 Gün',
  16
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Güncel Bilgiler',
  'Kavram Eşleştirme',
  'matching',
  2,
  'Güncel Bilgiler: Örgütler & Merkezleri',
  '{"pairs":[{"id":"gu1_1","leftTerm":"Türk Devletleri Teşkilatı (TDT)","rightMatch":"İstanbul / Türkiye"},{"id":"gu1_2","leftTerm":"Uluslararası Adalet Divanı (UAD)","rightMatch":"Lahey (Barış Sarayı) / Hollanda"},{"id":"gu1_3","leftTerm":"Uluslararası Para Fonu (IMF)","rightMatch":"Washington D.C. / ABD"},{"id":"gu1_4","leftTerm":"İslam İşbirliği Teşkilatı (İİT)","rightMatch":"Cidde / Suudi Arabistan"}]}'::jsonb,
  'Kadro Kavram Eşleştirme Çözümü: Türk Devletleri Teşkilatı (TDT) ➔ İstanbul / Türkiye; Uluslararası Adalet Divanı (UAD) ➔ Lahey (Barış Sarayı) / Hollanda; Uluslararası Para Fonu (IMF) ➔ Washington D.C. / ABD; İslam İşbirliği Teşkilatı (İİT) ➔ Cidde / Suudi Arabistan',
  17
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Güncel Bilgiler',
  'Kavram Eşleştirme',
  'matching',
  2,
  'Güncel Bilgiler: Sporcular & Başarıları',
  '{"pairs":[{"id":"gu2_1","leftTerm":"Yusuf Dikeç","rightMatch":"10m Havalı Tabanca Karışık Takım (Paris 2024 Gümüş)"},{"id":"gu2_2","leftTerm":"Mete Gazoz","rightMatch":"Klasik Yay Okçuluk (Tokyo 2020 Altın & Paris 2024 Bronz)"},{"id":"gu2_3","leftTerm":"Arda Güler","rightMatch":"UEFA Şampiyonlar Ligi Kupası (Real Madrid)"},{"id":"gu2_4","leftTerm":"Melissa Vargas","rightMatch":"CEV Avrupa ve Milletler Ligi VNL Şampiyonluğu (MVP)"}]}'::jsonb,
  'Kadro Kavram Eşleştirme Çözümü: Yusuf Dikeç ➔ 10m Havalı Tabanca Karışık Takım (Paris 2024 Gümüş); Mete Gazoz ➔ Klasik Yay Okçuluk (Tokyo 2020 Altın & Paris 2024 Bronz); Arda Güler ➔ UEFA Şampiyonlar Ligi Kupası (Real Madrid); Melissa Vargas ➔ CEV Avrupa ve Milletler Ligi VNL Şampiyonluğu (MVP)',
  18
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Güncel Bilgiler',
  'Kavram Eşleştirme',
  'matching',
  2,
  'Güncel Bilgiler: Küresel Ödüller & İsimler',
  '{"pairs":[{"id":"gu3_1","leftTerm":"Daron Acemoğlu","rightMatch":"2024 Nobel Ekonomi Ödülü (Kurumlar ve Refah)"},{"id":"gu3_2","leftTerm":"Han Kang","rightMatch":"2024 Nobel Edebiyat Ödülü (Güney Koreli Yazar)"},{"id":"gu3_3","leftTerm":"Nihon Hidankyo","rightMatch":"2024 Nobel Barış Ödülü (Japon Nükleer Karşıtı Örgüt)"},{"id":"gu3_4","leftTerm":"Alper Gezeravcı","rightMatch":"Ax-3 Misyonu ile İlk Türk Uzay Yolcusu (ISS)"}]}'::jsonb,
  'Kadro Kavram Eşleştirme Çözümü: Daron Acemoğlu ➔ 2024 Nobel Ekonomi Ödülü (Kurumlar ve Refah); Han Kang ➔ 2024 Nobel Edebiyat Ödülü (Güney Koreli Yazar); Nihon Hidankyo ➔ 2024 Nobel Barış Ödülü (Japon Nükleer Karşıtı Örgüt); Alper Gezeravcı ➔ Ax-3 Misyonu ile İlk Türk Uzay Yolcusu (ISS)',
  19
);
insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  'Güncel Bilgiler',
  'Kavram Eşleştirme',
  'matching',
  2,
  'Güncel Bilgiler: Mega Projeler & Özellikleri',
  '{"pairs":[{"id":"gu4_1","leftTerm":"1915 Çanakkale Köprüsü","rightMatch":"Dünyanın En Uzun Orta Açıklıklı Asma Köprüsü (2023 m)"},{"id":"gu4_2","leftTerm":"Yeni Zigana Tüneli","rightMatch":"Avrupa''nın En Uzun Çift Tüplü Kara Yolu Tüneli (14,5 km)"},{"id":"gu4_3","leftTerm":"Yusufeli Barajı","rightMatch":"Türkiye''nin En Yüksek Kemer Barajı (275 m)"},{"id":"gu4_4","leftTerm":"TCG Anadolu","rightMatch":"Dünyanın İlk SİHA ve İHA Gemisi (L400)"}]}'::jsonb,
  'Kadro Kavram Eşleştirme Çözümü: 1915 Çanakkale Köprüsü ➔ Dünyanın En Uzun Orta Açıklıklı Asma Köprüsü (2023 m); Yeni Zigana Tüneli ➔ Avrupa''nın En Uzun Çift Tüplü Kara Yolu Tüneli (14,5 km); Yusufeli Barajı ➔ Türkiye''nin En Yüksek Kemer Barajı (275 m); TCG Anadolu ➔ Dünyanın İlk SİHA ve İHA Gemisi (L400)',
  20
);

-- -------------------------------------------------------------
-- 5. İNTERAKTİF HARİTA ATÖLYESİ — UZMAN SORULARI (50 ADET)
-- -------------------------------------------------------------

insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_agr_01',
  'agriculture',
  'tapProvince',
  1,
  'Pamuk Üretiminde Lider İl',
  'GAP projelerinin devreye girmesiyle birlikte Türkiye pamuk üretiminde Ege ve Çukurova''yı geride bırakarak açık ara birinci sıraya yerleşen ilimize harita üzerinde dokunun.',
  'sanliurfa',
  'Güneydoğu Anadolu''da Suriye sınırına komşu olan ilimiz.',
  'Şanlıurfa, sulama imkanlarının artmasıyla (özellikle Harran Ovası) Türkiye pamuk üretiminin %40''ından fazlasını tek başına karşılayarak açık ara birinci olmuştur.',
  '⚠️ ÖSYM Çeldirici Tuzağı: Adaylar eski alışkanlıkla pamuğu hâlâ Adana (Çukurova) sanabilir; oysa liderlik yıllardır Şanlıurfa''dadır.',
  'Pamuk & Sulama',
  1
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_agr_02',
  'agriculture',
  'identifyHighlighted',
  2,
  'Kıl Keçisi ve Karstik Platolar',
  'Haritada vurgulanan Teke ve Taşeli platolarında engebeli ve makilik arazi yapısı nedeniyle yaygın olarak yapılan hayvancılık türü hangisidir?',
  'antalya',
  'Maki çalıları ve sarp kayalık arazide çevik hareket eden hayvan türü.',
  'Akdeniz Bölgesi''ndeki karstik Teke (Antalya) ve Taşeli (Mersin) platolarında makilik bitki örtüsü ve dağlık yapı nedeniyle Kıl Keçisi yetiştiriciliği 1. sıradadır.',
  '⚠️ ÖSYM Çeldirici Tuzağı: Tiftik Keçisi (Angora) İç Anadolu''da (Ankara çevresinde); Kıl Keçisi ise Akdeniz kalker platosunda yaygındır.',
  'Hayvancılık',
  2
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_agr_03',
  'agriculture',
  'tapProvince',
  1,
  'Fındık Üretiminde Türkiye Lideri',
  'Türkiye ve dünya fındık üretiminde en yüksek rekolteye sahip olan Doğu Karadeniz ilimize haritada dokunun.',
  'ordu',
  'Samsun ile Giresun arasında yer alan Karadeniz kıyı ilimiz.',
  'Ordu, yıllık fındık üretiminde Giresun ve Trabzon''u geride bırakarak Türkiye''nin açık ara 1. fındık üreticisi ilidir.',
  '⚠️ ÖSYM Çeldirici Tuzağı: Fındık anavatanı olarak Giresun bilinse de toplam tonajda Ordu birinci sıradadır.',
  'Fındık',
  3
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_agr_04',
  'agriculture',
  'tapProvince',
  2,
  'Çay Tarımı ve Mikroklima',
  'Yıllık bol yağış ve asidik yıkanmış toprak ihtiyacı nedeniyle Türkiye çay üretiminin yaklaşık %65''ini tek başına karşılayan ilimize dokunun.',
  'rize',
  'Kaçkar Dağları''nın eteklerinde, Doğu Karadeniz kıyısındaki ilimiz.',
  'Rize, her mevsim yağışlı ve nemli iklimi ile kireçsiz toprakları sayesinde Türkiye çay tarımının kalbidir.',
  '',
  'Çay',
  4
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_agr_05',
  'agriculture',
  'tapProvince',
  1,
  'Ayçiçeği Üretiminin Kalbi (Ergene Havzası)',
  'Türkiye ayçiçeği üretiminin yaklaşık yarısını karşılayan, karasal iklim ve düz arazi avantajına sahip Trakya ilimize dokunun.',
  'tekirdag',
  'Marmara Denizi kıyısında, İstanbul''un batı komşusu olan ilimiz.',
  'Ergene Havzası (Tekirdağ ve Edirne), Türkiye ayçiçeği üretiminde 1. sıradadır. Üretilen çekirdekler sıvı yağ sanayisinde kullanılır.',
  '',
  'Ayçiçeği',
  5
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_agr_06',
  'agriculture',
  'identifyHighlighted',
  2,
  'İncir ve Zeytin Cenneti Ege',
  'Haritada işaretlenen Büyük Menderes grabeninde yer alan ve dünyada kuru incir üretiminde 1. sırada bulunan ilimiz hangisidir?',
  'aydin',
  'Kuşadası ve Didim gibi turistik ilçelere sahip olan Ege ilimiz.',
  'Aydın, Büyük Menderes Ovası''nın verimli toprakları ve kış ılıklığı sayesinde Türkiye ve dünya kuru incir üretiminde liderdir.',
  '',
  'İncir & Zeytin',
  6
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_agr_07',
  'agriculture',
  'tapProvince',
  2,
  'Mısır Üretiminde Şaşırtıcı Lider',
  'Geleneksel olarak Karadeniz ile özdeşleşen ancak modern sulama (KOP) imkanlarıyla Türkiye mısır üretiminde 1. sıraya yerleşen İç Anadolu ilimize dokunun.',
  'konya',
  'Türkiye''nin tahıl ambarı olarak bilinen en geniş yüz ölçümlü ilimiz.',
  'Mısır doğal olarak Karadeniz''de yetişse de üretilen mısır bölge halkı tarafından un olarak tüketildiğinden ticarete girmez. Ticari mısır üretiminde sulama avantajıyla Konya açık ara liderdir.',
  '⚠️ ÖSYM Çeldirici Tuzağı: Mısır diyince akla Karadeniz gelse de rekolte ve pazar lideri Konya ve Adana''dır.',
  'Mısır & KOP',
  7
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_agr_08',
  'agriculture',
  'tapProvince',
  1,
  'Turunçgil ve Muz Mikrokliması',
  'Yıllık ortalama kış sıcaklıklarının yüksek olması ve don olayının görülmemesi sayesinde Türkiye muz ve turunçgil üretiminin merkez üssü olan Akdeniz ilimize dokunun.',
  'antalya',
  'Alanya ve Gazipaşa ilçelerinde tropikal tarım yapılan turizm başkentimiz.',
  'Antalya ve Mersin kıyı şeridi (özellikle Anamur, Alanya, Gazipaşa), kış ılıklığı sayesinde mikroklima özelliği göstererek Türkiye muz ve narenciye üretimini sırtlar.',
  '',
  'Turunçgil & Muz',
  8
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_agr_09',
  'agriculture',
  'tapProvince',
  2,
  'Tiftik Keçisi (Angora) Yetiştiriciliği',
  'İpeksi ve değerli yünü (moher) ile dünyaca tanınan Tiftik Keçisi yetiştiriciliğinin anavatanı olan başkentimize haritada dokunun.',
  'ankara',
  'İç Anadolu''da, adını da bu keçiye veren başkentimiz.',
  'Tiftik Keçisi (Angora keçisi), bozkır iklimine uyumlu olup başta Ankara olmak üzere çevre İç Anadolu illerinde yetiştirilir.',
  '',
  'Tiftik Keçisi',
  9
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_agr_10',
  'agriculture',
  'identifyHighlighted',
  2,
  'Yaz Yağışları ve Büyükbaş Mera Hayvancılığı',
  'Haritada işaretlenen Erzurum-Kars Platosu''nda yaz yağışlarına bağlı olarak gelişen gür çayırlar hangi hayvancılık türünün yaygınlaşmasını sağlamıştır?',
  'erzurum',
  'Gür otlaklarda otlayan iri cüsseli hayvan türü.',
  'Sert karasal iklimin yaz yağışları çayır bitki örtüsünü oluşturur; bu da Erzurum, Kars ve Ardahan''da büyükbaş mera sığırcılığının temel nedenidir.',
  '',
  'Büyükbaş Besicilik',
  10
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_min_01',
  'mines',
  'identifyHighlighted',
  2,
  'Dünya Lideri Olduğumuz Stratejik Maden',
  'Haritada işaretlenen Balıkesir (Bigadiç), Kütahya (Emet), Eskişehir (Seyitgazi) ve Bursa havzalarında çıkarılan ve dünya rezervinin yaklaşık %73''üne sahip olduğumuz maden hangisidir?',
  'balikesir',
  'Roket yakıtından cam ve deterjan sanayisine kadar kullanılan beyaz stratejik maden.',
  'Türkiye, dünya bor rezervlerinin yaklaşık %73''üne sahiptir ve en zengin havzalar Güney Marmara ile İç Batı Anadolu''da (Balıkesir, Kütahya, Eskişehir, Bursa) toplanmıştır.',
  '',
  'Bor',
  11
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_min_02',
  'mines',
  'tapProvince',
  1,
  'Taş Kömürü Havzası',
  'I. Jeolojik Zaman (Paleozoik) arazisi üzerinde oluşan, yüksek kaloriye sahip Taş Kömürü yataklarının bulunduğu ilimize haritada dokunun.',
  'zonguldak',
  'Batı Karadeniz kıyısında, Karabük ve Bartın ile komşu olan maden şehrimiz.',
  'Taş kömürü sadece Zonguldak havzasında (Ereğli-Zonguldak-Amasra) çıkarılır ve demir-çelik sanayisinde yüksek ısı enerjisi sağlamak için kullanılır.',
  '⚠️ ÖSYM Çeldirici Tuzağı: Linyit III. Jeolojik Zamanda oluştuğu için tüm Türkiye''ye yayılmıştır; ancak Taş Kömürü yalnızca I. Zaman arazisi olan Zonguldak''tadır.',
  'Taş Kömürü',
  12
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_min_03',
  'mines',
  'tapProvince',
  1,
  'Türkiye''nin İlk Petrol Çıkarılan İli',
  '1940 yılında Raman Dağı''nda petrolün keşfedildiği ve Türkiye''nin en büyük petrol rafinerilerinden birine sahip olan ilimize dokunun.',
  'batman',
  'Güneydoğu Anadolu''da, Diyarbakır ve Siirt arasında yer alır.',
  'Türkiye''de yerli petrolün ilk çıkarıldığı yer Batman (Raman Dağı) olup, ham petrolün işlendiği Batman Rafinerisi de hammaddeye yakın kurulmuştur.',
  '',
  'Petrol',
  13
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_min_04',
  'mines',
  'identifyHighlighted',
  2,
  'Seydişehir Alüminyum Tesisleri',
  'Haritada vurgulanan Konya (Seydişehir) ve Antalya (Akseki) çevresinde çıkarılan ve Alüminyumun hammaddesi olan maden hangisidir?',
  'konya',
  'Hafifliğiyle uçak ve otomotiv sanayisinde kullanılan alüminyum cevheri.',
  'Boksit, alüminyumun hammaddesidir. Türkiye''nin en önemli boksit çıkarma ve işleme merkezi Konya-Seydişehir ve Antalya-Akseki çevresidir.',
  '',
  'Boksit',
  14
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_min_05',
  'mines',
  'tapProvince',
  2,
  'Bakır Madeninin Karadeniz Havzası (Murgul)',
  'Türkiye''nin en zengin bakır rezervlerinden biri olan Murgul maden yatağının bulunduğu Doğu Karadeniz ilimize dokunun.',
  'artvin',
  'Gürcistan sınırında, Çoruh Nehri''nin aktığı en doğudaki sahil ilimiz.',
  'Artvin (Murgul), Kastamonu (Küre) ve Elazığ (Maden) Türkiye''nin başlıca bakır çıkarım alanlarıdır.',
  '',
  'Bakır',
  15
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_min_06',
  'mines',
  'identifyHighlighted',
  2,
  'Paslanmaz Çelik ve Krom Yatakları (Guleman)',
  'Haritada işaretlenen Elazığ (Guleman) ve Muğla (Fethiye) havzalarında çıkarılan, paslanmaz çelik üretiminin ana maddesi olan maden hangisidir?',
  'elazig',
  'Metale sertlik ve paslanmazlık katan parlak maden.',
  'Krom, Elazığ Guleman ve Muğla Fethiye-Köyceğiz çevresinde yoğunlaşır. Antalya ve Elazığ''da kurulu Ferrokrom tesislerinde işlenir.',
  '',
  'Krom',
  16
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_min_07',
  'mines',
  'tapProvince',
  1,
  'Demir Madeninin En Zengin Havzası (Divriği)',
  'Türkiye''nin en büyük ve en kaliteli yer altı demir rezervine (Divriği yatakları) sahip olan İç Anadolu ilimize dokunun.',
  'sivas',
  'Kangal köpekleriyle ünlü, yüz ölçümü en büyük ikinci ilimiz.',
  'Sivas (Divriği) ve Malatya (Hekimhan, Hasançelebi), Türkiye demir cevherinin ana merkezleridir. Buradan çıkarılan demir Karabük, Ereğli ve İskenderun''a taşınır.',
  '',
  'Demir',
  17
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_min_08',
  'mines',
  'tapProvince',
  2,
  'Jeotermal Enerjinin Öncüsü (Sarayköy)',
  'Fay hatları boyunca yükselen yüksek sıcaklıktaki buharla Türkiye''nin ilk jeotermal elektrik santralinin (Sarayköy) kurulduğu Ege ilimize dokunun.',
  'denizli',
  'Pamukkale travertenlerine ev sahipliği yapan tekstil ilimiz.',
  'Denizli (Sarayköy) ve Aydın (Germencik), graben fay hatları üzerindeki yüksek jeotermal potansiyelle elektrik üreten başlıca santrallerdir.',
  '',
  'Jeotermal Enerji',
  18
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_min_09',
  'mines',
  'tapProvince',
  1,
  'Linyit Kömürü ve Termik Enerji (Soma)',
  'Türkiye''nin en büyük linyit rezervlerinden ve devasa termik santrallerinden birine sahip olan Soma ilçesinin bulunduğu Ege ilimize dokunun.',
  'manisa',
  'İzmir''in doğu komşusu, Spil Dağı ve mesir macunuyla ünlü ilimiz.',
  'Manisa (Soma), Kütahya (Tunçbilek, Seyitömer) ve Kahramanmaraş (Afşin-Elbistan) Türkiye''nin en büyük linyit maden havzalarıdır.',
  '',
  'Linyit & Termik',
  19
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_min_10',
  'mines',
  'tapProvince',
  2,
  'Doğal Gaz ve Hamitabat Termik Santrali',
  'Türkiye''de yerli doğal gazın çıkarıldığı ve doğal gaz çevrim santralinin (Hamitabat) bulunduğu Trakya ilimize dokunun.',
  'kirklareli',
  'Bulgaristan sınırında, Yıldız Dağları''nı sınırlarında barındıran ilimiz.',
  'Kırklareli (Hamitabat) ve Tekirdağ (Hayrabolu), Türkiye''de doğal gaz çıkarılan ve termik enerjiye dönüştürülen ilk yerlerdendir.',
  '',
  'Doğal Gaz',
  20
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_phy_01',
  'physical',
  'tapProvince',
  2,
  'Karstik Aşınım ve Obruk Platosu',
  'Tuz Gölü''nün güneyinde yer alan, yer altı sularının kalkerli tabakaları eritmesiyle devasa obrukların oluştuğu ve rüzgar erozyonunun en şiddetli olduğu ilimize dokunun.',
  'konya',
  'Türkiye''nin yüz ölçümü en büyük olan ve tahıl ambarı olarak bilinen ilimiz.',
  'Obruk Platosu Konya sınırlarında yer alır. Karstik mağara tavanlarının çökmesiyle meşhur Kızören Obruğu gibi yüzlerce obruk bu platoda meydana gelmiştir.',
  '',
  'Obruk Platosu',
  21
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_phy_02',
  'physical',
  'tapProvince',
  2,
  'Volkanik Set Gölü ve Nemrut Kalderası',
  'Türkiye''nin en büyük kapalı havzası ve soda rezervine sahip sodalı gölü olan Van Gölü''nün batı kıyısında yer alan ve Nemrut Kalderası''nı barındıran ilimize dokunun.',
  'bitlis',
  'Van Gölü''nün batısında yer alan ve Tatvan ilçesini sınırlarında bulunduran ilimiz.',
  'Nemrut Dağı''nın patlamasıyla çıkan lavlar Van çanağının önünü kapatmış (volkanik set) ve Van Gölü oluşmuştur. Nemrut Kalderası ve Krater Gölü Bitlis il sınırları içerisindedir.',
  '',
  'Nemrut & Van Gölü',
  22
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_phy_03',
  'physical',
  'identifyHighlighted',
  2,
  'Kırık Dağlar (Horst) Bölgesi',
  'Haritada işaretlenen Ege kıyılarında (Kaz, Madra, Yunt, Bozdağlar, Aydın Dağları) dağların oluşum türü aşağıdakilerden hangisidir?',
  'izmir',
  'Sert kütlelerin yan basınçlarla kırılarak yükselmesi.',
  'Ege Bölgesi arazisi sert tabakalardan oluştuğu için kıvrılamamış ve kırılmıştır. Yükselen kısımlar Horst (dağ), çöken kısımlar Graben (Gediz, Büyük Menderes vadileri) olmuştur.',
  '',
  'Horst-Graben',
  23
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_phy_04',
  'physical',
  'identifyHighlighted',
  2,
  'Göller Yöresi Karstik Çanakları',
  'Haritada işaretlenen Burdur ve Isparta çevresinde yer alan Salda, Eğirdir ve Kovada göllerinin oluşumundaki temel jeolojik etken nedir?',
  'burdur',
  'Kireçtaşı gibi eriyebilen kayaçların suyla erimesi.',
  'Akdeniz Göller Yöresi (Burdur, Isparta) kalkerli (kireçtaşı) karstik yapısıyla polyelerin suyla dolması sonucu karstik göllere ev sahipliği yapar.',
  '',
  'Karstik Göller',
  24
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_phy_05',
  'physical',
  'tapProvince',
  1,
  'Karadeniz''in Dev Deltaları (Bafra ve Çarşamba)',
  'Kızılırmak ve Yeşilırmak nehirlerinin denize döküldüğü yerde Karadeniz''in en verimli delta ovalarını (Bafra ve Çarşamba) oluşturan ilimize dokunun.',
  'samsun',
  'Orta Karadeniz''in ticaret ve liman merkezi olan ilimiz.',
  'Samsun kıyılarında Kızılırmak Bafra Deltası''nı, Yeşilırmak ise Çarşamba Deltası''nı oluşturarak bölgenin dev tarım merkezini meydana getirmiştir.',
  '',
  'Delta Ovaları',
  25
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_phy_06',
  'physical',
  'tapProvince',
  1,
  'Türkiye''nin En Büyük Deltası (Çukurova)',
  'Seyhan ve Ceyhan nehirlerinin binlerce yılda taşıdığı alüvyonlarla Türkiye''nin en geniş delta ovasını oluşturan Akdeniz ilimize dokunun.',
  'adana',
  'Toros Dağları''nın güneyinde, pamuk ve narenciye deposu ilimiz.',
  'Çukurova, Seyhan ve Ceyhan nehirlerinin oluşturduğu Türkiye''nin en büyük delta ovasıdır ve yılda birden fazla ürün alınabilen verimli alüvyal topraklara sahiptir.',
  '',
  'Çukurova',
  26
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_phy_07',
  'physical',
  'identifyHighlighted',
  2,
  'Dalga Biriktirmesi ve Tombolo (Saplı Ada)',
  'Haritada vurgulanan Balıkesir Kapıdağ Yarımadası ve Sinop İnceburun, bir adanın kıyı oku ile karaya bağlanması sonucu oluşmuştur. Bu jeomorfolojik yer şeklinin adı nedir?',
  'balikesir',
  'Açıkta duran bir adanın kıyı birikimiyle karaya bağlanarak yarımada olması.',
  'Dalgaların taşıdığı kumların adayla kara arasını doldurmasıyla Tombolo (Saplı Ada) oluşur. En güzel örnekleri Kapıdağ Yarımadası ve Sinop Boztepe''dir.',
  '',
  'Tombolo',
  27
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_phy_08',
  'physical',
  'tapProvince',
  2,
  'İç Anadolu''nun En Yüksek Volkanı (Erciyes)',
  'İç Anadolu tektonik fay hattı boyunca uzanan genç volkanlar kuşağının en heybetli zirvesi olan Erciyes Dağı''na (3917 m) ev sahipliği yapan ilimize dokunun.',
  'kayseri',
  'Pastırma, sucuk ve kayak turizmiyle ünlü Orta Anadolu ilimiz.',
  'Erciyes Dağı (Kayseri), Hasan Dağı ve Melendiz ile birlikte İç Anadolu''nun sönmüş stratovolkanlarındandır. Çıkardığı tüfler Kapadokya peri bacalarını oluşturmuştur.',
  '',
  'Erciyes Volkanı',
  28
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_phy_09',
  'physical',
  'tapProvince',
  2,
  'Karstik Taşeli Platosu',
  'Akdeniz''de kireçtaşı arazisi üzerinde derin vadilerle yarılmış, su tutmayan kalkerli yapısı nedeniyle Türkiye''nin en seyrek nüfuslu alanlarından biri olan Taşeli Platosu''na dokunun.',
  'mersin',
  'Kilikya kıyısında, Anamur ve Silifke ilçelerine sahip olan ilimiz.',
  'Taşeli Platosu (Mersin-Karaman sınırında), kalker arazisi, kireçli çatlaklı toprak yapısı ve suyun yer altına sızması sebebiyle yerleşmenin çok az olduğu karstik bir platodur.',
  '',
  'Taşeli Platosu',
  29
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_phy_10',
  'physical',
  'tapProvince',
  2,
  'Fırat Nehri ve Keban Baraj Gölü',
  'Türkiye sınırlarında debisi ve hidroelektrik potansiyeli en yüksek nehir olan Fırat üzerinde kurulan ilk dev barajımız Keban Barajı''nın bulunduğu ilimize dokunun.',
  'elazig',
  'Doğu Anadolu''da, Hazar Gölü ve Harput Kalesi''ne sahip olan ilimiz.',
  'Keban Barajı (Elazığ), Karasu ve Murat nehirlerinin birleştiği noktada Fırat üzerine kurulmuş devasa bir enerji ve yapay göl tesisidir.',
  '',
  'Fırat & Keban',
  30
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_ind_01',
  'industry',
  'tapProvince',
  2,
  'Hinterlandı En Dar Doğal Liman',
  'Türkiye''nin en kuzey ucunda yer alan, mükemmel bir doğal liman olmasına rağmen arkasındaki Küre Dağları''nın ulaşımı engellemesi (hinterlandı dar) nedeniyle gelişemeyen ilimize dokunun.',
  'sinop',
  'İnceburun''un bulunduğu, Karadeniz''in en kuzey noktası.',
  'Sinop Limanı Karadeniz''in tek doğal limanıdır ancak arkasındaki dağlar demiryolu ve karayolu bağlantısını kısıtladığı için ticaret limanı olarak gelişememiştir.',
  '⚠️ ÖSYM Çeldirici Tuzağı: Samsun limanı yapay olmasına rağmen hinterlandı geniş olduğu için çok gelişmiştir; Sinop ise doğal olmasına rağmen hinterlandı dar olduğu için gelişememiştir.',
  'Sinop Limanı',
  31
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_ind_02',
  'industry',
  'tapProvince',
  2,
  'Hammadde Olmadan Enerjiye Bağlı Sanayi',
  'Kendi bünyesinde demir madeni bulunmadığı halde, Zonguldak taş kömürü havzasına yakınlık (enerji kaynağı) sebebiyle Türkiye''nin ilk ağır demir-çelik fabrikasının kurulduğu ilimize dokunun.',
  'karabuk',
  'Zonguldak''ın komşusu olan, KARDEMİR tesislerine ev sahipliği yapan ilimiz.',
  'Karabük Demir-Çelik Fabrikası hammaddeye değil, taş kömürüne (enerji kaynağına) yakınlık prensibiyle kurulmuştur. Demir cevheri buraya Sivas ve Malatya''dan taşınır.',
  '',
  'Demir-Çelik',
  32
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_ind_03',
  'industry',
  'tapProvince',
  1,
  'Karadeniz''in En Gelişmiş Ticaret Limanı',
  'Arkasındaki Canik Dağları''nın yükseltisinin az olması ve iç kesimlerle demiryolu bağlantısının bulunması sayesinde Karadeniz''in en işlek ticaret limanına sahip ilimize dokunun.',
  'samsun',
  'Bafra ve Çarşamba ovalarının ortasında yer alan Karadeniz metropolü.',
  'Samsun Limanı yapay bir limandır ancak geniş bir art bölgeye (hinterland) sahip olması ve demiryoluyla Anadolu içlerine bağlanması sayesinde bölgenin en büyük limanıdır.',
  '',
  'Samsun Limanı',
  33
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_ind_04',
  'industry',
  'tapProvince',
  2,
  'Ulaşım Avantajıyla Kurulan Demir-Çelik (İSDEMİR)',
  'Ne demir madeni ne de taş kömürü havzası bulunduğu halde, derin su limanı ve deniz aşırı pazarlara kolay ihracat (ulaşım) avantajıyla İSDEMİR fabrikasının kurulduğu ilimize dokunun.',
  'hatay',
  'İskenderun Körfezi''ne ev sahipliği yapan güney sınır ilimiz.',
  'İskenderun Demir-Çelik Fabrikası (Hatay), hammadde veya enerjiye değil; tamamen deniz ulaşımı ve liman hinterlandı kolaylığı sebebiyle kıyıda kurulmuştur.',
  '',
  'İskenderun İSDEMİR',
  34
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_ind_05',
  'industry',
  'tapProvince',
  1,
  'Türkiye Sanayisinin ve Rafinerisinin Devi',
  'Otomotiv, petrokimya (TÜPRAŞ) ve liman tesislerinin yoğunlaştığı, Türkiye sanayi üretiminin en büyük payına sahip Marmara Körfez ilimize dokunun.',
  'kocaeli',
  'İzmit Körfezi etrafında kurulu olan sanayi şehri.',
  'Kocaeli (İzmit), sermaye, hammaddeye ve tüketim pazarına yakınlık, devasa ithalat limanları ve kara/demiryolu kavşağı olmasıyla Türkiye ağır sanayisinin kalbidir.',
  '',
  'Kocaeli & TÜPRAŞ',
  35
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_ind_06',
  'industry',
  'tapProvince',
  1,
  'Akdeniz''in En Büyük Konteyner Limanı ve Serbest Bölge',
  'Türkiye''nin ilk serbest bölgesine (1987) ve Akdeniz''in en modern Ro-Ro ve konteyner ihracat limanına sahip güney sahil ilimize dokunun.',
  'mersin',
  'Çukurova''nın batısında yer alan narenciye ve liman şehrimiz.',
  'Mersin Limanı, demiryolu bağlantısı, geniş hinterlandı ve Serbest Bölge imkanlarıyla Türkiye''nin dış ticaretinde hayati bir kapıdır.',
  '',
  'Mersin Limanı',
  36
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_ind_07',
  'industry',
  'tapProvince',
  1,
  'Otomotiv ve Tekstil Sanayisinin Başkenti',
  'Türkiye''nin ilk organize sanayi bölgesinin (OSB) kurulduğu, otomotiv montaj fabrikaları ve ipekli tekstiliyle meşhur Güney Marmara ilimize dokunun.',
  'bursa',
  'Uludağ''ın eteklerinde yer alan tarihi Osmanlı başkenti.',
  'Bursa, kalifiye iş gücü, tüketici pazarına yakınlık ve liman bağlantıları (Gemlik) ile Türkiye''nin otomotiv ve dokuma sanayisi merkezidir.',
  '',
  'Bursa Sanayi',
  37
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_ind_08',
  'industry',
  'identifyHighlighted',
  2,
  'Hammadde Olmadan Kıyıda Kurulan Bakır İşletmesi',
  'Kastamonu Küre ve Artvin Murgul''dan çıkarılan bakır cevherlerinin deniz yoluyla getirilerek işlendiği Samsun Bakır İzabe Tesisleri hangi kuruluş faktörüne dayanır?',
  'samsun',
  'Madenin kendi ilinde değil, deniz ulaşımı olan liman şehrine taşınması.',
  'Samsun''da bakır madeni çıkarılmaz. Ancak liman şehri olması ve demiryolu bağlantısı sebebiyle Küre ve Murgul bakırları işlenmek üzere Samsun''a getirilir (Ulaşım faktörü).',
  '',
  'Samsun Bakır Tesisleri',
  38
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_ind_09',
  'industry',
  'tapProvince',
  2,
  'Tarihi İpek Yolu ve Zigana Tüneli',
  'Doğu Karadeniz Dağları''nı aşan Zigana Geçidi/Tüneli ile Erzurum ve İran transit ticaretine açılan Karadeniz liman ilimize dokunun.',
  'trabzon',
  'Sümela Manastırı''na ev sahipliği yapan Doğu Karadeniz metropolü.',
  'Trabzon Limanı, Zigana ve Kop geçitleri üzerinden Doğu Anadolu''ya ve İran''a bağlanan en eski transit ticaret limanlarımızdandır.',
  '',
  'Zigana & Trabzon',
  39
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_ind_10',
  'industry',
  'tapProvince',
  2,
  'Akdeniz''i İç Anadolu''ya Bağlayan Gülek Boğazı',
  'Toros Dağları üzerinde yer alan, demiryolu ve otoyol ile Çukurova''yı İç Anadolu''ya bağlayan tarihî Gülek Boğazı''nın açıldığı ilimize dokunun.',
  'adana',
  'Seyhan Nehri''nin kıyısındaki güney ilimiz.',
  'Gülek Boğazı (Adana-Mersin-Niğde bağlantısı), Akdeniz bölgesini İç Anadolu''ya bağlayan en stratejik doğal geçittir.',
  '',
  'Gülek Boğazı',
  40
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_his_01',
  'history',
  'tapProvince',
  1,
  'Doğu Cephesi ve Gümrü Zaferi',
  'Kazım Karabekir komutasındaki 15. Kolordu''nun Ermeni güçlerini mağlup ederek TBMM''nin tarihteki ilk askerî ve siyasî antlaşmasını (Gümrü) imzalattığı Doğu Cephesi sınır ilimize dokunun.',
  'kars',
  'Sarıkamış ve Ani Harabeleri''ne ev sahipliği yapan serhat ilimiz.',
  'Doğu Cephesi''nde Kars ve çevresi kurtarılmış; 3 Aralık 1920 Gümrü Antlaşması ile TBMM uluslararası alanda ilk zaferini kazanmıştır.',
  '',
  'Doğu Cephesi',
  41
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_his_02',
  'history',
  'tapProvince',
  1,
  'Güney Cephesi ve Sütçü İmam Direnişi',
  'Fransız ve Ermeni işgaline karşı Sütçü İmam''ın ilk kurşunuyla başlayan, düzenli ordu olmadan halkın Kuvayımilliye direnişiyle 12 Şubat 1920''de kurtarılan ve "Kahraman" unvanı alan ilimize dokunun.',
  'kahramanmaras',
  'Dondurması ve tarhanasıyla ünlü Akdeniz-Güneydoğu geçiş ilimiz.',
  'Maraş halkı kendi direnişiyle şehri Fransız işgalinden temizlemiş; bu destansı direniş sebebiyle TBMM tarafından Kırmızı Şeritli İstiklal Madalyası ve "Kahraman" unvanı verilmiştir.',
  '',
  'Maraş Savunması',
  42
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_his_03',
  'history',
  'tapProvince',
  1,
  'Şahin Bey ve 11 Aylık Destansı Savunma',
  'Şahin Bey ve Karayılan önderliğinde Fransız işgal kuvvetlerine karşı 11 ay boyunca tek başına direnen ve TBMM tarafından "Gazi" unvanı ile ödüllendirilen ilimize dokunun.',
  'gaziantep',
  'Güneydoğu Anadolu''nun sanayi ve gastronomi merkezi olan ilimiz.',
  'Antep Savunması, Millî Mücadele''nin en çetin şehir direnişlerinden biridir. TBMM, 8 Şubat 1921''de kente "Gazi" unvanını vermiştir.',
  '',
  'Antep Savunması',
  43
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_his_04',
  'history',
  'tapProvince',
  1,
  'Ali Saip Bey ve Onikiler Hareketi',
  'Jandarma Komutanı Ali Saip Bey (Ursavaş) ve "Onikiler" adı verilen vatanseverlerin örgütlediği halk direnişiyle 11 Nisan 1920''de Fransızları şehirden çıkaran ve "Şanlı" unvanı alan ilimize dokunun.',
  'sanliurfa',
  'Balıklıgöl''ün bulunduğu kadim Güneydoğu ilimiz.',
  'Urfa halkı Fransız işgalini kendi çabasıyla püskürtmüştür. 1984 yılında kente TBMM tarafından "Şanlı" unvanı verilmiştir.',
  '',
  'Urfa Savunması',
  44
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_his_05',
  'history',
  'tapProvince',
  2,
  'Batı Cephesi ve Metristepe Zaferi',
  'Mustafa Kemal''in İsmet İnönü''ye "Siz orada yalnız düşmanı değil, milletin makus talihini de yendiniz" telgrafını çektiği II. İnönü Zaferi''nin kazanıldığı ilimize dokunun.',
  'bilecik',
  'Şeyh Edebali Türbesi ve Söğüt ilçesine ev sahipliği yapan ilimiz.',
  'I. ve II. İnönü Muharebeleri Bilecik-Eskişehir hattında cereyan etmiştir. Metristepe Anıtı Bilecik sınırlarında yer alır.',
  '',
  'İnönü Savaşları',
  45
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_his_06',
  'history',
  'tapProvince',
  1,
  'Sakarya Meydan Muharebesi (Polatlı Hattı)',
  'Mustafa Kemal''in "Hattı müdafaa yoktur, sathı müdafaa vardır. O satıh bütün vatandır" tarihi emrini verdiği, 22 gün 22 gece süren ölüm kalım savaşının gerçekleştiği ilimize dokunun.',
  'ankara',
  'Polatlı ve Haymana cephe hatlarını barındıran başkentimiz.',
  'Sakarya Meydan Muharebesi (1921), Ankara Polatlı yakınlarında yapılmış ve Türk ordusunun 1683 Viyana bozgunundan beri süren geri çekilişini durduran büyük zafer olmuştur.',
  '',
  'Sakarya Meydan',
  46
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_his_07',
  'history',
  'tapProvince',
  1,
  'Büyük Taarruz ve Başkomutanlık Meydan Muharebesi',
  '26 Ağustos 1922 sabahı Kocatepe''den top atışlarıyla başlayan ve Dumlupınar''da düşman ordusunu imha eden Büyük Taarruz''un başladığı ilimize dokunun.',
  'afyonkarahisar',
  'Kocatepe Anıtı ve termal kaynaklarıyla ünlü kavşak ilimiz.',
  'Afyon Kocatepe''den başlayan taarruz, 30 Ağustos''ta Kütahya Dumlupınar''da Başkomutanlık Meydan Muharebesi ile taçlanmış ve ardından İzmir''e doğru takip başlamıştır.',
  '',
  'Büyük Taarruz',
  47
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_his_08',
  'history',
  'tapProvince',
  2,
  'Millî Mücadele''de İlk Kurşun (Dörtyol)',
  '19 Aralık 1918''de Fransız işgalcilere karşı Millî Mücadele''nin Türk tarihindeki ilk silahlı kurşununun Mehmet Çavuş tarafından atıldığı güney sahil ilimize dokunun.',
  'hatay',
  'İskenderun Körfezi kıyısında, Dörtyol ilçesinin bulunduğu ilimiz.',
  'Millî Mücadele''de ilk kurşun İzmir''den önce, 19 Aralık 1918''de Hatay Dörtyol''da Fransızlara karşı Karamehmet (Mehmet Çavuş) tarafından sıkılmıştır.',
  '⚠️ ÖSYM Çeldirici Tuzağı: Batı Cephesi''nde ilk kurşunu İzmir''de Hasan Tahsin sıkmıştır; ancak tüm Kurtuluş Savaşı genelinde ilk kurşun Hatay Dörtyol''da atılmıştır.',
  'İlk Kurşun',
  48
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_his_09',
  'history',
  'tapProvince',
  1,
  'Amasya Genelgesi ve İhtilal Çağrısı',
  '"Milletin bağımsızlığını yine milletin azim ve kararı kurtaracaktır" maddesiyle Millî Mücadele''nin amaç, gerekçe ve yönteminin ilk kez yazılı olarak ilan edildiği ilimize dokunun.',
  'amasya',
  'Yeşilırmak kıyısında, Şehzadeler şehri ve elmasıyla ünlü ilimiz.',
  '22 Haziran 1919 Amasya Genelgesi, üstü kapalı olarak millî egemenliğe ve bir halk ihtilaline dayanan Kurtuluş Savaşı''nın ilk manifestosudur.',
  '',
  'Amasya Genelgesi',
  49
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;
insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  'map_his_10',
  'history',
  'tapProvince',
  1,
  'Sivas Kongresi ve Topyekûn Birlik',
  'Manda ve himayenin kesin olarak reddedildiği, tüm millî direniş cemiyetlerinin "Anadolu ve Rumeli Müdafaa-i Hukuk Cemiyeti" altında tek çatı yapıldığı ilimize dokunun.',
  'sivas',
  'İrade-i Milliye gazetesinin çıkarıldığı tarihi kongre lisemizin bulunduğu ilimiz.',
  '4-11 Eylül 1919 Sivas Kongresi, temsil gücü bakımından tüm yurdu kucaklayan ulusal bir kongredir. Burada alınan kararlarla Millî Mücadele tek elden yönetilmiştir.',
  '',
  'Sivas Kongresi',
  50
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;

COMMIT;

