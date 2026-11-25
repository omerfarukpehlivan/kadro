-- ============================================================================
-- TASK-180: KPSS B Grubu Havuz & Bülten Kalite Rötuşu
-- ============================================================================
-- 1. public.current_affairs_bulletins tablosunu 15 doğrulanmış bülten maddesiyle
--    (2026-05, 2026-06, 2026-07) idempotent olarak tohumlar.
-- 2. Güncel Bilgiler dersindeki 3 yetim / mükerrer çoktan seçmeli soruyu
--    pasifleştirir (is_active = false; 483 -> 480 kanonik soru).
-- 3. Kanonik havuzda distractor_trap ("ÖSYM Çeldirici Tuzağı") alanı boş olan
--    10 çoktan seçmeli sorunun çeldirici analizlerini tamamlar (3.480 / 3.480).
-- 4. topic_lesson_units (189 ünite) içindeki check_questions bloklarına ilgili
--    konunun difficulty <= 2 çoktan seçmeli soru UUID'lerini bağlar.
-- ============================================================================

-- 1) Aylık Güncel Bilgiler Bülteni Tohumlama (15 Madde · 2026-05 .. 2026-07)
INSERT INTO public.current_affairs_bulletins (
  id,
  year_month,
  month_title,
  subtitle,
  title,
  summary,
  category,
  osym_tip,
  published_label,
  linked_tags,
  exam_scopes,
  is_verified_official,
  is_active,
  order_index
)
VALUES
  (
    'ca_2026_05_unesco_ahsap',
    '2026-05',
    'Mayıs 2026',
    'UNESCO mirası, millî uzay programları ve küresel takvim başlıkları',
    'Anadolu''nun Orta Çağ Dönemi Ahşap Hipostil Camileri',
    'Türkiye''nin UNESCO Dünya Mirası Listesi''ndeki 21. varlığı olan bu seri adaylık; Afyonkarahisar, Ankara, Eskişehir, Kastamonu ve Konya''daki 5 tarihî camiyi tek çatı altında birleştiriyor.',
    'kultur_sanat',
    'ÖSYM, seri varlıklarda "hangisi bu 5 ildeki camilerden biri değildir?" sorusunu sever: Eşrefoğlu (Konya), Sivrihisar Ulu (Eskişehir), Ahi Şerafettin/Arslanhane (Ankara), Mahmut Bey (Kastamonu), Afyonkarahisar Ulu.',
    'Mayıs 2026 · Kültür Arşivi',
    ARRAY['UNESCO', 'Dünya Mirası', 'Mimarlık']::text[],
    ARRAY['lisans_gk', 'b_grubu_gk']::text[],
    true,
    true,
    1
  ),
  (
    'ca_2026_05_turksat_6a',
    '2026-05',
    'Mayıs 2026',
    'UNESCO mirası, millî uzay programları ve küresel takvim başlıkları',
    'Millî Haberleşme ve Gözlem Uyduları: TÜRKSAT 6A & İMECE',
    'Türkiye Uzay Ajansı (TUA) ve yerli mühendislik kurumlarınca geliştirilen TÜRKSAT 6A, Türkiye''yi kendi haberleşme uydusunu üretebilen 11 ülke arasına taşırken; İMECE metre altı çözünürlüklü elektro-optik gözlem görevi yürütür.',
    'bilim_teknoloji',
    'Gözlem uydusu (RASAT, GÖKTÜRK, İMECE) ile haberleşme uydusu (TÜRKSAT 3A/4A/5A/5B/6A) ayrımı sınavda sıkça çeldirici olarak kullanılır.',
    'Mayıs 2026 · Bilim & Uzay',
    ARRAY['TUA', 'TÜRKSAT 6A', 'İMECE']::text[],
    ARRAY['lisans_gk', 'b_grubu_gk']::text[],
    true,
    true,
    2
  ),
  (
    'ca_2026_05_fao_mera_yili',
    '2026-05',
    'Mayıs 2026',
    'UNESCO mirası, millî uzay programları ve küresel takvim başlıkları',
    'Birleşmiş Milletler 2026: Uluslararası Mera ve Çobanlar Yılı',
    'BM Genel Kurulu kararı ve FAO koordinasyonuyla 2026 yılı dünya genelinde "Uluslararası Mera ve Çobanlar Yılı" (International Year of Rangelands and Pastoralists) olarak ilan edildi.',
    'cevre_dunya',
    'ÖSYM son yıllarda BM''nin tematik yıllarını doğrudan sormaktadır (ör. 2025 Kuantum Bilimi / Buzullar Yılı sonrası 2026 Mera ve Çobanlar Yılı).',
    'Mayıs 2026 · Küresel Gündem',
    ARRAY['BM', 'FAO', '2026 Tematik Yıl']::text[],
    ARRAY['lisans_gk', 'b_grubu_gk']::text[],
    true,
    true,
    3
  ),
  (
    'ca_2026_05_dunya_kupasi_ilkler',
    '2026-05',
    'Mayıs 2026',
    'UNESCO mirası, millî uzay programları ve küresel takvim başlıkları',
    '2026 FIFA Dünya Kupası Formatı ve Ortak Ev Sahipleri',
    '2026 FIFA Dünya Kupası; ABD, Kanada ve Meksika''nın ortak ev sahipliğinde düzenlenerek tarihte ilk kez 3 ülkede oynanacak ve katılımcı sayısı 32''den 48 takıma yükselecek.',
    'spor',
    'Hem 3 ortak ev sahibi (ABD-Kanada-Meksika) hem de 48 takımlı yeni format bilgisi güncel spor sorularının klasik odak noktasıdır.',
    'Mayıs 2026 · Spor Gündemi',
    ARRAY['FIFA', 'Dünya Kupası', '2026']::text[],
    ARRAY['lisans_gk', 'b_grubu_gk']::text[],
    true,
    true,
    4
  ),
  (
    'ca_2026_05_yuksek_mahkemeler',
    '2026-05',
    'Mayıs 2026',
    'UNESCO mirası, millî uzay programları ve küresel takvim başlıkları',
    'Anayasal Yüksek Yargı Organları ve Sayıştay Ayrımı',
    '1982 Anayasası sistematiğinde Anayasa Mahkemesi, Yargıtay, Danıştay ve Uyuşmazlık Mahkemesi yüksek mahkeme statüsündeyken; Sayıştay TBMM adına mali denetim yapan yüksek yargı dışı anayasal kurumdur.',
    'ekonomi_kurumlar',
    'Yüksek Seçim Kurulu (YSK) ve Sayıştay, Anayasa''nın "Yüksek Mahkemeler" başlığı altında sayılmayan ama kararları kesin olan anayasal organlar olarak en çok düşülen çeldiricidir.',
    'Mayıs 2026 · Kurumsal Not',
    ARRAY['Anayasa', 'Sayıştay', 'Yüksek Mahkeme']::text[],
    ARRAY['lisans_gk', 'b_grubu_gk']::text[],
    true,
    true,
    5
  ),
  (
    'ca_2026_06_kadin_ciftci_yili',
    '2026-06',
    'Haziran 2026',
    'Uluslararası kuruluşlar, Akdeniz Oyunları ve TÜRKSOY kültür ekseni',
    'BM 2026 Uluslararası Kadın Çiftçi Yılı Vurgusu',
    'Birleşmiş Milletler, gıda güvenliği ve kırsal kalkınmada kadın üreticilerin rolüne dikkat çekmek amacıyla 2026''yı aynı zamanda "Uluslararası Kadın Çiftçi Yılı" olarak benimsedi.',
    'cevre_dunya',
    '2026 yılına ait iki paralel BM başlığını (Mera/Çobanlar + Kadın Çiftçi) birlikte bilmek "hangisi 2026 BM gündemi değildir?" eleme sorularında avantaj sağlar.',
    'Haziran 2026 · BM Takvimi',
    ARRAY['BM', 'Tarım', 'Kalkınma']::text[],
    ARRAY['lisans_gk', 'b_grubu_gk']::text[],
    true,
    true,
    6
  ),
  (
    'ca_2026_06_akdeniz_taranto',
    '2026-06',
    'Haziran 2026',
    'Uluslararası kuruluşlar, Akdeniz Oyunları ve TÜRKSOY kültür ekseni',
    'XX. Akdeniz Oyunları ve Türkiye''nin Ev Sahipliği Geçmişi',
    '2022''de Cezayir''in Vahran kentinde yapılan organizasyonun ardından 2026 Akdeniz Oyunları İtalya''nın Taranto kentine verildi. Türkiye bugüne kadar 1971 İzmir ve 2013 Mersin''de ev sahipliği yaptı.',
    'spor',
    'İlk Akdeniz Oyunları''nın 1951''de İskenderiye''de yapıldığı ve Türkiye''deki iki ev sahibinin İzmir (1971) ile Mersin (2013) olduğu sık karıştırılan ikilidir.',
    'Haziran 2026 · Çoklu Branş',
    ARRAY['Akdeniz Oyunları', 'Taranto', 'Mersin 2013']::text[],
    ARRAY['lisans_gk', 'b_grubu_gk']::text[],
    true,
    true,
    7
  ),
  (
    'ca_2026_06_turksoy_baskentler',
    '2026-06',
    'Haziran 2026',
    'Uluslararası kuruluşlar, Akdeniz Oyunları ve TÜRKSOY kültür ekseni',
    'TÜRKSOY Türk Dünyası Kültür Başkentleri Serisi',
    'Uluslararası Türk Kültürü Teşkilatı (TÜRKSOY) 2012''de Astana ile başlattığı Türk Dünyası Kültür Başkenti programında Türkiye''den Eskişehir (2013), Kastamonu (2018) ve Bursa''ya (2022) unvan vermiştir.',
    'kultur_sanat',
    'TÜRKSOY''un seçtiği Türk Dünyası Kültür Başkenti ile İslam İşbirliği Teşkilatı / TDT Turizm Başkenti (ör. Erzurum 2025) kavramlarını birbirine karıştırmamaya dikkat et.',
    'Haziran 2026 · Türk Dünyası',
    ARRAY['TÜRKSOY', 'Kültür Başkenti', 'Bursa']::text[],
    ARRAY['lisans_gk', 'b_grubu_gk']::text[],
    true,
    true,
    8
  ),
  (
    'ca_2026_06_cern_tenmak',
    '2026-06',
    'Haziran 2026',
    'Uluslararası kuruluşlar, Akdeniz Oyunları ve TÜRKSOY kültür ekseni',
    'CERN''de Türkiye Ortak Üyeliği ve TENMAK Eşgüdümü',
    'İsviçre-Fransa sınırındaki Cenevre merkezli CERN''e 2015''ten bu yana ortak üye olan Türkiye''nin bilimsel koordinasyonu Enerji, Maden ve Nükleer Araştırma Kurumu (TENMAK) tarafından yürütülmektedir.',
    'bilim_teknoloji',
    'Önceki TAEK yapısının yerini alan kurumun TENMAK olduğunu ve CERN merkezinin Cenevre (İsviçre-Fransa sınırı) olduğunu hatırlatır.',
    'Haziran 2026 · Bilim Kurumları',
    ARRAY['CERN', 'TENMAK', 'Cenevre']::text[],
    ARRAY['lisans_gk', 'b_grubu_gk']::text[],
    true,
    true,
    9
  ),
  (
    'ca_2026_06_ramsar_alanlari',
    '2026-06',
    'Haziran 2026',
    'Uluslararası kuruluşlar, Akdeniz Oyunları ve TÜRKSOY kültür ekseni',
    'Sulak Alanların Korunması: Ramsar Sözleşmesi ve Türkiye',
    '1971 İran''ın Ramsar kentinde imzalanan ve sulak alan ekosistemlerini koruyan sözleşme kapsamında Türkiye''de Nemrut Kalderası''ndan Kuyucuk Gölü''ne kadar 14 tescilli Ramsar alanı bulunur.',
    'ekonomi_kurumlar',
    'İlk Ramsar alanlarımız (1994): Göksu Deltası, Manyas Kuş Gölü, Sultan Sazlığı, Seyfe Gölü, Burdur Gölü. Ramsar şehir adının İran''da yer aldığı çeldirici olarak sorulabilir.',
    'Haziran 2026 · Çevre & Coğrafya',
    ARRAY['Ramsar', 'Sulak Alan', 'Ekoloji']::text[],
    ARRAY['lisans_gk', 'b_grubu_gk']::text[],
    true,
    true,
    10
  ),
  (
    'ca_2026_07_nato_ankara',
    '2026-07',
    'Temmuz 2026',
    'NATO 2026 Ankara Zirvesi, kış sporları ve yapay zekâ düzenlemeleri',
    'NATO 2026 Devlet ve Hükûmet Başkanları Zirvesi: Ankara',
    '2024 Washington NATO Zirvesi sonuç bildirgesinde kararlaştırıldığı üzere 2026 NATO Zirvesi''ne Türkiye''nin başkenti Ankara ev sahipliği yapmaktadır. Bu toplantı, 2004 İstanbul Zirvesi sonrası Türkiye''deki ikinci NATO zirvesidir.',
    'cevre_dunya',
    '2025 NATO Zirvesi Lahey (Hollanda), 2026 NATO Zirvesi Ankara (Türkiye)! İlk kez Türkiye''de yapılan zirve 2004 İstanbul idi; 2026 ise Ankara olarak ayrılır.',
    'Temmuz 2026 · Diplomasi',
    ARRAY['NATO', 'Ankara', 'Dış Politika']::text[],
    ARRAY['lisans_gk', 'b_grubu_gk']::text[],
    true,
    true,
    11
  ),
  (
    'ca_2026_07_kis_olimpiyatlari',
    '2026-07',
    'Temmuz 2026',
    'NATO 2026 Ankara Zirvesi, kış sporları ve yapay zekâ düzenlemeleri',
    'XXV. Kış Olimpiyat Oyunları: Milano – Cortina d''Ampezzo 2026',
    '2026 yılında düzenlenen XXV. Kış Olimpiyat Oyunları''na İtalya''nın Milano ve Cortina d''Ampezzo şehirleri ortaklaşa ev sahipliği yaptı; resmî olimpiyat adında iki şehir birlikte anılan ilk kış oyunlarıdır.',
    'spor',
    '2024 Yaz Olimpiyatları Paris, 2026 Kış Olimpiyatları Milano–Cortina, 2028 Yaz Olimpiyatları Los Angeles sıralamasını akılda tutmak sıralama sorularını çözer.',
    'Temmuz 2026 · Olimpiyat Notu',
    ARRAY['Kış Olimpiyatları', 'Milano', 'Cortina']::text[],
    ARRAY['lisans_gk', 'b_grubu_gk']::text[],
    true,
    true,
    12
  ),
  (
    'ca_2026_07_ai_act',
    '2026-07',
    'Temmuz 2026',
    'NATO 2026 Ankara Zirvesi, kış sporları ve yapay zekâ düzenlemeleri',
    'AB Yapay Zekâ Yasası (EU AI Act) Risk Katmanları',
    'Avrupa Birliği''nin kapsamlı Yapay Zekâ Yasası (AI Act) kademeli uygulama takviminde 2026 itibarıyla genel uyumluluk eşiklerine girerek yapay zekâ uygulamalarını kabul edilemez, yüksek, sınırlı ve düşük riskli diye 4 katmana ayırır.',
    'bilim_teknoloji',
    'Dünyanın ilk kapsamlı bağlayıcı yapay zekâ düzenlemesi olan AB AI Act, insan merkezli ve risk temelli yaklaşımıyla teknoloji gündeminde öne çıkar.',
    'Temmuz 2026 · Teknoloji Hukuku',
    ARRAY['Yapay Zekâ', 'AB AI Act', 'Dijitalleşme']::text[],
    ARRAY['lisans_gk', 'b_grubu_gk']::text[],
    true,
    true,
    13
  ),
  (
    'ca_2026_07_yunus_emre_unesco',
    '2026-07',
    'Temmuz 2026',
    'NATO 2026 Ankara Zirvesi, kış sporları ve yapay zekâ düzenlemeleri',
    'UNESCO Anma ve Kutlama Yıl Dönümleri Geleneği',
    'UNESCO tarafından dünya kültür ve bilim tarihine katkı sunan şahsiyetler için ilan edilen Anma Yıl Dönümleri listesinde bugüne kadar Türkiye''den Yunus Emre, Ahi Evran, Hacı Bektaş-ı Veli, Âşık Veysel, Kâtip Çelebi ve Piri Reis yer almıştır.',
    'kultur_sanat',
    'UNESCO''nun ilan ettiği şahsiyetler ve anma yılları KPSS Kültür-Sanat sorularının en yüksek getirili ezber başlıklarındandır.',
    'Temmuz 2026 · Kültür Mirası',
    ARRAY['UNESCO', 'Âşık Veysel', 'Yunus Emre']::text[],
    ARRAY['lisans_gk', 'b_grubu_gk']::text[],
    true,
    true,
    14
  ),
  (
    'ca_2026_07_bolgesel_kalkinma',
    '2026-07',
    'Temmuz 2026',
    'NATO 2026 Ankara Zirvesi, kış sporları ve yapay zekâ düzenlemeleri',
    'Türkiye''nin Bölgesel Kalkınma Projeleri ve Düzey-2 Ajansları',
    'Türkiye''de bölgesel gelişmişlik farklarını azaltmak amacıyla 26 Düzey-2 istatistiki bölgesinde kurulan Kalkınma Ajansları; GAP, KOP, DOKAP, DAP, YHGP ve ZBK gibi projelerle eşgüdüm içinde çalışır.',
    'ekonomi_kurumlar',
    'GAP dışında kalan projelerin hangi illeri kapsadığı (ör. ZBK: Zonguldak-Bartın-Karabük; YHGP: Yeşilırmak Havzası) Coğrafya + Güncel kesişiminde sıkça test edilir.',
    'Temmuz 2026 · Ekonomi & Bölge',
    ARRAY['Kalkınma Ajansı', 'GAP', 'KOP']::text[],
    ARRAY['lisans_gk', 'b_grubu_gk']::text[],
    true,
    true,
    15
  )
ON CONFLICT (id) DO UPDATE SET
  year_month = EXCLUDED.year_month,
  month_title = EXCLUDED.month_title,
  subtitle = EXCLUDED.subtitle,
  title = EXCLUDED.title,
  summary = EXCLUDED.summary,
  category = EXCLUDED.category,
  osym_tip = EXCLUDED.osym_tip,
  published_label = EXCLUDED.published_label,
  linked_tags = EXCLUDED.linked_tags,
  exam_scopes = EXCLUDED.exam_scopes,
  is_verified_official = EXCLUDED.is_verified_official,
  is_active = EXCLUDED.is_active,
  order_index = EXCLUDED.order_index,
  updated_at = now();

-- 2) Güncel Bilgiler Yetim / Mükerrer 3 Çoktan Seçmeli Soruyu Pasifleştirme
UPDATE public.questions
SET is_active = false
WHERE id IN (
  'fa1ebcf1-4004-4a7a-b306-9856be3251f9',
  '7faecdc1-9b11-4bce-b1a2-03122f25f23c',
  'd980858a-8ae0-4cc8-828d-4d16813c262a'
);

-- 3) Eksik 10 Kanonik Çoktan Seçmeli Sorunun "ÖSYM Çeldirici Tuzağı" Analizleri
UPDATE public.questions AS q
SET distractor_trap = v.trap
FROM (
  VALUES
    (
      'cc01a7cc-ba73-41db-adc3-45a29356ffbb'::uuid,
      'Adaylar "Kalıcı kar alt sınırı" veya "Güneş ışınlarının geliş açısı" şıklarına sıkça düşer. Oysa kutuplara (kuzeye) gidildikçe sıcaklık düştüğü için kalıcı kar daha alçak yükseltiden başlar (alt sınır alçalır); güneş ışınlarının geliş açısı, deniz tuzu ve çizgisel hız da azalır. Artan tek şey gece-gündüz süre farkı, yerçekimi ve grup-tan süresidir.'
    ),
    (
      '209f9177-3d87-41b6-9224-65e46dea8317'::uuid,
      'Diğer kanunlarla ülke eşleştirmesi en sık karıştırılan tuzaktır: İdari Yargı için Fransa, Ceza Kanunu için İtalya, Deniz Ticareti için Almanya örnek alınırken; 1926 Medeni Kanunu ile Borçlar Kanunu ve İcra-İflas Kanunu İsviçre''den alınmıştır.'
    ),
    (
      '60b72923-1f30-4478-b243-633559a05099'::uuid,
      'Karahanlı dönemi eserlerinin yazarları bilerek şıklarda çaprazlanır: Divanü Lügatit-Türk Kaşgarlı Mahmud''un ansiklopedik sözlüğü, Atabetü''l-Hakayık Edip Ahmet Yükneki''nin ahlak kitabı, Divan-ı Hikmet Hoca Ahmet Yesevi''nin tasavvuf eseridir; ilk siyasetname ise Yusuf Has Hacip''in Kutadgu Bilig''idir.'
    ),
    (
      'd90d8f09-e712-4479-b2c8-d46ee35f77df'::uuid,
      'Nevbet (davul) ve Tuğ (sancak) hem İslamiyet öncesi hem Türk-İslam devletlerinde ortak kullanıldığı için adayları yanıltır. Ancak Hutbe okutmak, Tıraz, Menşur (halife onayı) ve Hilat İslamiyet''in kabulüyle giren sembollerdir; İslam öncesinde yer almaz.'
    ),
    (
      '05034b13-88f5-43c7-b596-5cbad9bc6844'::uuid,
      'Sivas Kongresi kararları Erzurum kararlarını tüm yurt adına genişletip tekrar ettiği için adaylar bu ilkeyi Sivas''a mal edebiliyor. Oysa "Milli sınırlar içinde vatan bir bütündür, bölünemez" vurgusu ilk kez Erzurum Kongresi''nde alınmış, Sivas''ta aynen onaylanmıştır.'
    ),
    (
      'de30ee00-074c-4054-b574-4fcce58f3b25'::uuid,
      'Kale muhafızlarına ve tersane giderlerine ayrılan "Ocaklık" ile sınır boylarındaki askerlere verilen "Yurtluk" sık karıştırılır. Geliri iltizamla peşin toplanıp doğrudan devlet hazinesine (Miri Hazine) aktarılan toprak türü Mukataa''dır; Paşmaklık ise hanedan kadınlarına ayrılırdı.'
    ),
    (
      'cc124774-fe2c-4cc3-8cea-b8041f76abde'::uuid,
      'Valilik (İl Özel İdaresi değil, İl Genel İdaresi) ile Kaymakamlık yerel kavramlar gibi durduğu için mahalli idare sanılır; oysa bunlar merkezi idarenin taşra teşkilatıdır. Mahalli idareler (yerinden yönetim) yalnızca İl Özel İdaresi, Belediye ve Köydür.'
    ),
    (
      '01b5dd7c-afb4-418b-bb90-2d845c6c5d59'::uuid,
      'Soruda "hak sahibi olabilmesi" ifadesini gören adaylar doğrudan "Hak ehliyeti"ne yönelir. Hak ehliyeti pasiftir (sağ ve tam doğmakla kazanılır); "bizzat kendi fiil ve işlemleriyle" hak kazanıp borç altına girme gücü ise aktif olan Fiil ehliyetidir.'
    ),
    (
      'df4ab6f2-81ec-4e4d-a2df-ed9131fe600e'::uuid,
      '2017 öncesindeki "Cumhurbaşkanı başkanlığında toplanan Bakanlar Kurulu + MGK görüşü" kuralı nedeniyle bazı adaylar MGK veya TBMM''yi arar. Güncel 1982 Anayasası''na göre OHAL''i ilan eden makam doğrudan Cumhurbaşkanıdır; TBMM ise ilanı onaylama, süreyi uzatma veya kaldırma yetkisine sahiptir.'
    ),
    (
      '86f82a40-2a42-40ae-a139-f2206404bdcc'::uuid,
      '2007–2017 arasındaki 4 yıllık dönem (ve mahalli idarelerdeki 5 yıllık süreyle karışıklık) yüzünden en büyük çeldirici "4 yıl" şıkkıdır. 2017 Anayasa değişikliği ile TBMM ve Cumhurbaşkanlığı seçimleri birlikte 5 yılda bir yapılır.'
    )
) AS v(id, trap)
WHERE q.id = v.id;

-- 4) Konu Anlatımı Üniteleri (189 Bölüm) check_questions.question_ids Bağlama
WITH ranked_questions AS (
  SELECT
    id,
    lesson,
    topic,
    ROW_NUMBER() OVER (
      PARTITION BY lesson, topic
      ORDER BY order_index ASC NULLS LAST, id ASC
    ) - 1 AS rn,
    COUNT(*) OVER (PARTITION BY lesson, topic) AS total_cnt
  FROM public.questions
  WHERE is_active = true
    AND question_type = 'multiple_choice'
    AND interaction_data ? 'options'
    AND COALESCE(difficulty, 2) <= 2
),
unit_picks AS (
  SELECT
    u.id AS unit_id,
    u.blocks,
    rq1.id::text AS qid1,
    rq2.id::text AS qid2
  FROM public.topic_lesson_units u
  JOIN ranked_questions rq1
    ON rq1.lesson = u.lesson
   AND rq1.topic = u.topic
   AND rq1.rn = ((u.unit_order - 1) * 2) % rq1.total_cnt
  LEFT JOIN ranked_questions rq2
    ON rq2.lesson = u.lesson
   AND rq2.topic = u.topic
   AND rq2.rn = ((u.unit_order - 1) * 2 + 1) % rq2.total_cnt
   AND rq2.id <> rq1.id
  WHERE u.is_published = true
)
UPDATE public.topic_lesson_units u
SET blocks = (
  SELECT jsonb_agg(
    CASE
      WHEN elem->>'type' = 'check_questions'
      THEN jsonb_set(
        elem,
        '{question_ids}',
        CASE
          WHEN up.qid2 IS NOT NULL THEN jsonb_build_array(up.qid1, up.qid2)
          ELSE jsonb_build_array(up.qid1)
        END
      )
      ELSE elem
    END
    ORDER BY ord
  )
  FROM jsonb_array_elements(up.blocks) WITH ORDINALITY AS t(elem, ord)
),
updated_at = now()
FROM unit_picks up
WHERE u.id = up.unit_id;
