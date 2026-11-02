import 'package:kadro/features/flashcards/data/models/flashcard.dart';

/// KPSS Lisans Genel Kültür müfredatına uygun 10 adet özgün örnek hap bilgi kartı.
const List<Flashcard> sampleFlashcards = [
  Flashcard(
    id: 'fc_tar_001',
    lesson: 'Tarih',
    topic: 'İlk Türk Devletleri',
    frontText: 'İlk Türk devletlerinde hükümdara devleti yönetme yetkisinin Gök Tanrı tarafından verildiğine inanılan anlayış nedir?',
    backText: 'KUT İNANCI\n\nBu anlayışa göre kut kan yoluyla hanedanın tüm erkek üyelerine geçer. Bu durum sık sık taht kavgalarına ve Türk devletlerinin kısa sürede parçalanmasına zemin hazırlamıştır.',
  ),
  Flashcard(
    id: 'fc_tar_002',
    lesson: 'Tarih',
    topic: 'Osmanlı Dağılma Dönemi',
    frontText: 'Osmanlı Devleti\'nde yayımlanan ilk resmî gazete hangisidir?',
    backText: 'TAKVİM-İ VEKAYİ (1831)\n\nII. Mahmut döneminde çıkarılmıştır. Devletin resmî duyurularını ve kanunlarını halka duyurmak amacıyla Türkçe ve çeşitli azınlık dillerinde yayımlanmıştır.',
  ),
  Flashcard(
    id: 'fc_tar_003',
    lesson: 'Tarih',
    topic: 'Kurtuluş Savaşı Hazırlık',
    frontText: 'Kurtuluş Savaşı\'nın amacı, gerekçesi ve yönteminin ilk kez belirtildiği tarihî belge hangisidir?',
    backText: 'AMASYA GENELGESİ (22 Haziran 1919)\n\n"Milletin bağımsızlığını yine milletin azim ve kararı kurtaracaktır" maddesiyle ilk kez millî egemenlik ilkesinden ve ihtilal kararından bahsedilmiştir.',
  ),
  Flashcard(
    id: 'fc_cog_001',
    lesson: 'Coğrafya',
    topic: 'Türkiye\'nin Yer Şekilleri',
    frontText:
        'Türkiye\'nin en yüksek zirvesi hangisidir ve oluşum kökeni nedir?',
    backText: 'AĞRI DAĞI (5.137 m)\n\nVolkanik kökenli bir dağdır (Stratovolkan). Doğu Anadolu Bölgesi\'nde yer alır ve zirvesinde takke buzulu bulunmaktadır.',
  ),
  Flashcard(
    id: 'fc_cog_002',
    lesson: 'Coğrafya',
    topic: 'Sanayi ve Madenler',
    frontText: 'Demir-çelik sanayisinin Karabük ve İskenderun\'da kurulmasında hangi temel yer seçimi faktörleri etkili olmuştur?',
    backText: '• Karabük: Enerji kaynağına (Taş kömürü yataklarına) yakınlık.\n• İskenderun: Ulaşım ve liman kolaylığı (Hinterlandı geniş liman).',
  ),
  Flashcard(
    id: 'fc_cog_003',
    lesson: 'Coğrafya',
    topic: 'Türkiye İklimi ve Mikroklima',
    frontText: 'Türkiye\'de fön rüzgârları ve çukur alan özellikleri sayesinde kivi/turunçgil yetişen Doğu Karadeniz ili ve pamuk yetişen Doğu Anadolu ili hangileridir?',
    backText: 'RİZE & IĞDIR\n\nRize\'de kış ılıklığı sayesinde mandalina/turunçgil ve kivi, Iğdır Ovası\'nda ise etrafı yüksek dağlarla çevrili korunaklı mikroklima sahası sayesinde pamuk yetiştirilebilmektedir.',
  ),
  Flashcard(
    id: 'fc_vat_001',
    lesson: 'Vatandaşlık',
    topic: 'Anayasa Hukuku ve Yargı',
    frontText: '1982 Anayasası\'na göre kanunların şekil bakımından denetimi için Anayasa Mahkemesi\'ne kaç gün içinde iptal davası açılabilir?',
    backText: '10 GÜN\n\nKanunların yayımlandığı tarihten itibaren 10 gün içinde sadece Cumhurbaşkanı veya TBMM üye tamsayısının beşte biri (120 milletvekili) tarafından şekil bozukluğu gerekçesiyle dava açılabilir.',
  ),
  Flashcard(
    id: 'fc_vat_002',
    lesson: 'Vatandaşlık',
    topic: 'Temel Hukuk - Normlar Hiyerarşisi',
    frontText: 'Hukuk düzeninde normlar hiyerarşisinin (Kelsen Piramidi) en üstünden aşağıya doğru sıralaması nasıldır?',
    backText: 'NORMLAR HİYERARŞİSİ\n\n1. Anayasa\n2. Kanun & Usulüne Göre Yürürlüğe Konmuş Milletlerarası Andlaşmalar\n3. Cumhurbaşkanlığı Kararnamesi (CBK)\n4. Yönetmelik\n5. Genelge ve Yönergeler',
  ),
  Flashcard(
    id: 'fc_gun_001',
    lesson: 'Güncel Bilgiler',
    topic: 'Spor ve Olimpiyatlar',
    frontText: '2024 Paris Yaz Olimpiyat Oyunları\'nda klasik yay erkek milli takımımızla bronz madalya kazanan ve Tokyo 2020 olimpiyat şampiyonu olan milli okçumuz kimdir?',
    backText: 'METE GAZOZ\n\nTürk spor tarihinin ilk olimpik okçuluk şampiyonu olup 2024 Paris Olimpiyatları\'nda Erkek Takım ile bronz madalya kazanmıştır.',
  ),
  Flashcard(
    id: 'fc_gun_002',
    lesson: 'Güncel Bilgiler',
    topic: 'Kültür ve UNESCO Mirası',
    frontText: 'UNESCO Dünya Mirası Listesi\'ne 2023 yılında 20. ve 21. varlıklarımız olarak dâhil edilen tarihî değerlerimiz nelerdir?',
    backText: 'GORDİON & AHŞAP CAMİLER\n\n20. Varlık: Ankara Gordion Antik Kenti (Frigya Başkenti)\n21. Varlık: Anadolu\'nun Orta Çağ Dönemi Ahşap Hipostil Camileri (Konya Eşrefoğlu, Afyon Ulu Cami vb.)',
  ),
];
