/// Her ekran ve ders için sunulan kısa KPSS sınav ve çalışma notları kategorileri.
///
/// Web/Angular karşılığı: `StudyTipCategory` enum ve yardımcı içerik deposu.
enum StudyTipCategory {
  home,
  victory,
  mistakes,
  pro,
  history,
  geography,
  citizenship,
  current,
  practice,
  exams,
  stats,
  streak,
}

/// KPSS Lisans Genel Kültür sınav formatı ve ders ağırlıklarına dair kısa notlar.
extension StudyTipCategoryExtension on StudyTipCategory {
  String get sheetTitle {
    switch (this) {
      case StudyTipCategory.home:
        return 'KPSS Genel Kültür Özeti';
      case StudyTipCategory.victory:
        return 'Puan ve Karne Notları';
      case StudyTipCategory.mistakes:
        return 'Yanlış Defteri Çalışma Düzeni';
      case StudyTipCategory.pro:
        return 'Kadro PRO Kapsamı';
      case StudyTipCategory.history:
        return 'Tarih Ders Dağılımı';
      case StudyTipCategory.geography:
        return 'Coğrafya Ders Dağılımı';
      case StudyTipCategory.citizenship:
        return 'Vatandaşlık Ders Dağılımı';
      case StudyTipCategory.current:
        return 'Güncel Bilgiler Kapsamı';
      case StudyTipCategory.practice:
        return 'Çalışma Modları';
      case StudyTipCategory.exams:
        return 'Deneme Sınavı Kuralları';
      case StudyTipCategory.stats:
        return 'İstatistik ve Ölçme';
      case StudyTipCategory.streak:
        return 'Günlük Çalışma Düzeni';
    }
  }

  List<String> get tips {
    switch (this) {
      case StudyTipCategory.home:
        return const [
          'KPSS Genel Kültür testinde toplam 60 soru sorulur (Tarih 27, Coğrafya 18, Vatandaşlık 9, Güncel Bilgiler 6) ve 65 dakika süre verilir.',
          'Net hesabında 4 yanlış 1 doğruyu götürür. Emin olmadığın soruları boş bırakmak toplam netini korur.',
          'Ana sayfadaki çalışma planlayıcısı ve hedef sınav geri sayımıyla günlük soru hedeflerini takip edebilirsin.',
          'Pratik sekmesinden konu testi, bilgi kartları, yanlış defteri ve hızlı doğru/yanlış alıştırmalarına erişebilirsin.',
        ];
      case StudyTipCategory.victory:
        return const [
          'Bu ekranda çözdüğün testin doğru, yanlış, boş sayılarını ve 4 yanlış 1 doğru kuralına göre hesaplanan netini görürsün.',
          'Testte yanlış yaptığın sorular otomatik olarak Yanlış Defteri listesine eklenir; dilediğinde oradan tekrar çözebilirsin.',
          'Paylaş butonu ile sonucunu sade özet kartı biçiminde kopyalayıp paylaşabilirsin.',
          'Tamamladığın her test çalışma istatistiklerine ve haftalık sıralamaya işlenir.',
        ];
      case StudyTipCategory.mistakes:
        return const [
          'Testlerde yanlış işaretlediğin her soru otomatik olarak bu havuza kaydedilir.',
          'Yanlış defterindeki bir soruyu tekrar çözdüğünde doğru yaparsan soru listeden otomatik olarak çıkar.',
          'Üstteki ders filtrelerinden yalnızca Tarih, Coğrafya, Vatandaşlık veya Güncel Bilgiler yanlışlarını ayırıp çözebilirsin.',
          'Çözüm açıklamalarındaki ÖSYM Çeldirici Tuzağı bölümü, adayların en sık düştüğü yanıltıcı şıkkı gösterir.',
        ];
      case StudyTipCategory.pro:
        return const [
          'Kadro PRO günlük 30 soru sınırını kaldırarak tüm ders ve denemelerde sınırsız çözüm imkânı sunar.',
          'Çevrimdışı indirme ile konu testlerini ve denemeleri internetsiz ortamlarda çözebilirsin.',
          'Reklamsız akışta kesintisiz odaklanma ve detaylı çeldirici analizleri açılır.',
          'Bulut eşitleme ile tüm test geçmişin ve yanlış defterin hesabınla güvende kalır.',
        ];
      case StudyTipCategory.history:
        return const [
          'Genel Kültür testindeki 60 sorunun 27\'si (%45) Tarih dersinden gelir; sınavın en yüksek ağırlıklı dersidir.',
          'İlk bölümde İslamiyet Öncesi (1-2 soru), İlk Türk-İslam Devletleri (1-2 soru) ve Osmanlı Tarihi (9-11 soru) yer alır.',
          'İkinci bölümde Kurtuluş Savaşı ile Atatürk İlke ve İnkılapları (~12 soru) ve Çağdaş Dünya Tarihi (3 soru) bulunur.',
          'Tarih bölümü 7 ana üniteye ve kolaydan zora sıralanmış 10\'ar soruluk testlere ayrılmıştır.',
        ];
      case StudyTipCategory.geography:
        return const [
          'Genel Kültür testindeki 60 sorunun 18\'i (%30) Coğrafya dersinden sorulur.',
          'Türkiye\'nin Coğrafi Konumu, Yer Şekilleri, İklimi ve Su-Toprak-Bitki varlığı (~7-8 soru) fiziki bölümü oluşturur.',
          'Türkiye\'de Nüfus ve Yerleşme (~3 soru) ile Tarım, Hayvancılık, Madenler, Sanayi ve Ulaşım (~7-8 soru) beşeri-ekonomik konuları kapsar.',
          'Tüm konulardaki testleri tamamladığında ders ilerlemen eksiksiz olarak işaretlenir.',
        ];
      case StudyTipCategory.citizenship:
        return const [
          'Genel Kültür testindeki 60 sorunun 9\'u (%15) Vatandaşlık ve Anayasa bilgisinden gelir.',
          'Temel Hukuk Kavramları (2-3 soru), 1982 Anayasası, Temel Haklar, Yasama, Yürütme ve Yargı (4-5 soru) ana başlıklardır.',
          'Son 2-3 soru İdare Hukuku (Merkezi/Yerinden Yönetim ve Devlet Memurluğu) konularından çıkar.',
          'Karıştırdığın hukuki kavramları Pratik sekmesindeki bilgi kartlarıyla hızlıca tekrar edebilirsin.',
        ];
      case StudyTipCategory.current:
        return const [
          'Genel Kültür testinin son 6 sorusu (%10) Güncel Bilgiler ve sosyoekonomik gelişmelerden oluşur.',
          'Türkiye ve dünya gündemi, uluslararası kuruluşlar (BM, NATO, Türk Devletleri Teşkilatı) ve önemli zirveler sorulur.',
          'Kültür, sanat, edebiyat, bilim-teknoloji hamleleri, UNESCO Miras Listesi ve spor başarıları da kapsam içindedir.',
          'Güncel Bilgiler 6 alt başlığa ayrılır; hızlı tekrar için bilgi kartlarını kullanabilirsin.',
        ];
      case StudyTipCategory.practice:
        return const [
          'Bu ekranda klasik test dışında bilgi kartları, kavram eşleştirme, harita atölyesi ve hızlı tekrar modlarına ulaşabilirsin.',
          'Bilgi kartları ve kavram eşleştirme tahtası özellikle tarih ve anayasa terimlerini pekiştirir.',
          '60 Saniyede Doğru / Yanlış ile hız kazanabilir, ÖSYM Çeldirici Avı ile sık düşülen tuzakları görebilirsin.',
          'KPSS Puan Hesaplama aracıyla farklı sınav türleri için tahmini net ve puanını anında hesaplayabilirsin.',
        ];
      case StudyTipCategory.exams:
        return const [
          'Gerçek KPSS Genel Kültür oturumunda 60 soru (27 Tarih, 18 Coğrafya, 9 Vatandaşlık, 6 Güncel) için 65 dakika verilir.',
          'Süreli deneme başlatıldığında üstte geri sayım çalışır; bitimde 4 yanlış 1 doğru düşülerek net hesaplanır.',
          'Tam 65 dakikalık deneme dışında 40 dakikalık kamp ve 15 dakikalık kısa mola denemeleri de çözebilirsin.',
          'Tamamlanan denemelerin üzerinde son yaptığın net değeri gösterilir.',
        ];
      case StudyTipCategory.stats:
        return const [
          'Bu ekranda çözdüğün tüm soruların ders bazlı doğruluk oranlarını ve soru başına ortalama süreni görürsün.',
          'Başarı oranına göre derslerin Kritik (<%50), Gelişiyor (%50-79) ve Usta (%80+) olarak gruplanır.',
          'Çözülen Testler Arşivi bölümünden geçmiş oturumlarının doğru, yanlış ve net dökümünü açabilirsin.',
          'Topladığın çalışma puanlarıyla haftalık lig sıralamasındaki yerini takip edebilirsin.',
        ];
      case StudyTipCategory.streak:
        return const [
          'Her gün en az 1 soru çözdüğünde günlük çalışma serin kesintisiz devam eder.',
          'Profil ekranından günlük soru hedefini (30, 50 veya 100 soru) çalışma tempona göre değiştirebilirsin.',
          'Ana sayfadaki hatırlatıcılar o gün kalan soru sayını ve bekleyen çalışma görevlerini özetler.',
          'En çok yanlış yaptığın ders otomatik belirlenir ve ana sayfada 10 soruluk güçlendirme testi önerilir.',
        ];
    }
  }

  /// Verilen KPSS ders adına göre uygun çalışma notunu seçer.
  static StudyTipCategory fromLesson(String? lesson) {
    final normalized = (lesson ?? '').toLowerCase().trim();
    if (normalized.contains('tarih')) return StudyTipCategory.history;
    if (normalized.contains('coğrafya') || normalized.contains('cografya')) {
      return StudyTipCategory.geography;
    }
    if (normalized.contains('vatandaşlık') ||
        normalized.contains('vatandaslik')) {
      return StudyTipCategory.citizenship;
    }
    if (normalized.contains('güncel') || normalized.contains('guncel')) {
      return StudyTipCategory.current;
    }
    return StudyTipCategory.home;
  }
}
