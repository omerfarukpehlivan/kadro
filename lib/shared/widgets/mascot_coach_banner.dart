import 'package:flutter/material.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Kadro Koçu'nun ruh hali (mood) ve derse özel görsel varyasyonları (12 Özgün Karakter Modu).
///
/// Angular/Web karşılığı:
/// Gamification avatar model varyasyonları (Duolingo/Babbel karakter durumları).
enum MascotMood {
  coach,
  victory,
  detective,
  pro,
  history,
  geography,
  citizenship,
  current,
  practice,
  exam,
  analyst,
  streak,
}

/// [MascotMood] için dosya yolu, ikon, KPSS tüyoları ve ders eşleştirme yardımcı fonksiyonları.
extension MascotMoodExtension on MascotMood {
  /// Her mood için ilgili görsel varlığın dosya yolu.
  String get assetPath {
    switch (this) {
      case MascotMood.coach:
        return 'assets/images/mascot/tugrul_coach.png';
      case MascotMood.victory:
        return 'assets/images/mascot/tugrul_victory.png';
      case MascotMood.detective:
        return 'assets/images/mascot/tugrul_detective.png';
      case MascotMood.pro:
        return 'assets/images/mascot/tugrul_pro.png';
      case MascotMood.history:
        return 'assets/images/mascot/tugrul_history.png';
      case MascotMood.geography:
        return 'assets/images/mascot/tugrul_geography.png';
      case MascotMood.citizenship:
        return 'assets/images/mascot/tugrul_citizenship.png';
      case MascotMood.current:
        return 'assets/images/mascot/tugrul_current.png';
      case MascotMood.practice:
        return 'assets/images/mascot/tugrul_practice.png';
      case MascotMood.exam:
        return 'assets/images/mascot/tugrul_exam.png';
      case MascotMood.analyst:
        return 'assets/images/mascot/tugrul_analyst.png';
      case MascotMood.streak:
        return 'assets/images/mascot/tugrul_streak.png';
    }
  }

  /// Her moda özel karakteristik Phosphor doldurulmuş rozet ikonu.
  IconData get badgeIcon {
    switch (this) {
      case MascotMood.coach:
        return PhosphorIconsFill.graduationCap;
      case MascotMood.victory:
        return PhosphorIconsFill.trophy;
      case MascotMood.detective:
        return PhosphorIconsFill.magnifyingGlass;
      case MascotMood.pro:
        return PhosphorIconsFill.crown;
      case MascotMood.history:
        return PhosphorIconsFill.scroll;
      case MascotMood.geography:
        return PhosphorIconsFill.globeHemisphereEast;
      case MascotMood.citizenship:
        return PhosphorIconsFill.scales;
      case MascotMood.current:
        return PhosphorIconsFill.newspaperClipping;
      case MascotMood.practice:
        return PhosphorIconsFill.target;
      case MascotMood.exam:
        return PhosphorIconsFill.timer;
      case MascotMood.analyst:
        return PhosphorIconsFill.chartLineUp;
      case MascotMood.streak:
        return PhosphorIconsFill.fire;
    }
  }

  /// Her moda özel 4 adet KPSS Sınav Formatı, Ders Soru/Konu Dağılımı ve Uygulama Kullanım Rehberi bilgisi.
  List<String> get coachTips {
    switch (this) {
      case MascotMood.coach:
        return const [
          '💡 KPSS Genel Kültür: Sınavda toplam 60 soru sorulur (Tarih 27, Coğrafya 18, Vatandaşlık 9, Güncel Bilgiler 6) ve 65 dakika süre verilir.',
          '💡 Puan Hesabı: KPSS\'de 4 yanlış 1 doğruyu götürür. Emin olmadığın soruları boş bırakmak netini korur.',
          '💡 Uygulama Rehberi: Ana sayfadaki Çalışma Planlayıcı ve Pomodoro sayacı ile günlük soru ve süre hedeflerini takip edebilirsin.',
          '💡 Çalışma Modları: Pratik sekmesinden Konu Testi, Bilgi Kartları, Yanlış Defteri ve 60 Saniyede Pençe modlarına ulaşabilirsin.',
        ];
      case MascotMood.victory:
        return const [
          '💡 Karne Rehberi: Bu ekranda çözdüğün testin Doğru, Yanlış, Boş sayılarını ve 4 yanlış 1 doğru düşülmüş gerçek KPSS Netini görürsün.',
          '💡 Yanlış Defteri Köprüsü: Testte yanlış yaptığın sorular otomatik olarak Yanlış Defteri\'ne eklenir; oradan tekrar çözebilirsin.',
          '💡 Zafer Karnesi Paylaşımı: Sonuç ekranındaki paylaş butonuyla 9:16 hikaye formatında net karneni oluşturup paylaşabilirsin.',
          '💡 Kadro Ligi & XP: Tamamladığın her test ve doğru cevap sana XP kazandırır; haftalık ligde üst kademelere yükselirsin.',
        ];
      case MascotMood.detective:
        return const [
          '💡 Yanlış Defteri Nasıl Çalışır?: Testlerde yanlış işaretlediğin her soru otomatik olarak bu havuza kaydedilir.',
          '💡 Otomatik Temizleme: Yanlış Defteri\'ndeki bir soruyu tekrar çözdüğünde doğru yaparsan soru defterden otomatik olarak silinir.',
          '💡 Ders Filtresi: Üstteki sekmelerden sadece Tarih, Coğrafya, Vatandaşlık veya Güncel Bilgiler yanlışlarını filtreleyip çözebilirsin.',
          '💡 ÖSYM Çeldirici Tuzağı: Soru çözümlerindeki kehribar renkli uyarı kutuları, adayların en çok düştüğü yanıltıcı şıkkı açıklar.',
        ];
      case MascotMood.pro:
        return const [
          '💡 Kadro PRO Avantajı: Günlük 30 soru sınırını kaldırarak tüm ders ve denemelerde sınırsız soru çözümü sağlar.',
          '💡 Çevrimdışı (Offline) Mod: Konu testlerini ve denemeleri telefonuna indirerek internet olmadan metroda veya kütüphanede çözebilirsin.',
          '💡 Reklamsız Deneyim: Kadro PRO üyeliği ile reklam beklemeden kesintisiz odaklanma ve detaylı çeldirici analizleri açılır.',
          '💡 Bulut Senkronizasyonu: Tüm test geçmişin, yanlış defterin ve istatistiklerin hesabınla eşleşerek güvende tutulur.',
        ];
      case MascotMood.history:
        return const [
          '💡 KPSS Tarih Ağırlığı: Genel Kültür testindeki 60 sorunun 27\'si (%45\'i) Tarih dersinden gelir; sınavın en yüksek puanlı dersidir.',
          '💡 Konu Dağılımı (1/2): İslamiyet Öncesi (1-2 soru), İlk Türk-İslam (1-2 soru) ve Osmanlı Tarihi (9-11 soru) ilk bölümü oluşturur.',
          '💡 Konu Dağılımı (2/2): İnkılap Tarihi / Kurtuluş Savaşı ile Atatürk İlke ve İnkılapları (~12 soru) ve Çağdaş Dünya Tarihi (3 soru) yer alır.',
          '💡 Uygulama Yapısı: Tarih bölümü 7 ana üniteye ve kolaydan zora sıralanmış 10\'ar soruluk seviye testlerine ayrılmıştır.',
        ];
      case MascotMood.geography:
        return const [
          '💡 KPSS Coğrafya Ağırlığı: Genel Kültür testindeki 60 sorunun 18\'i (%30\'u) Coğrafya dersinden sorulmaktadır.',
          '💡 Fiziki Coğrafya Konuları: Türkiye\'nin Coğrafi Konumu, Yer Şekilleri, İklimi, Su-Toprak-Bitki varlığı (~7-8 soru) ilk kısmı oluşturur.',
          '💡 Beşeri & Ekonomik Konular: Türkiye\'de Nüfus ve Yerleşme (~3 soru) ile Tarım, Hayvancılık, Madenler, Sanayi ve Ulaşım (~7-8 soru) yer alır.',
          '💡 Uygulama Yapısı: Coğrafya yol haritasındaki 6 konunun tamamındaki testleri bitirdiğinde konu kartına yeşil onay işareti eklenir.',
        ];
      case MascotMood.citizenship:
        return const [
          '💡 KPSS Vatandaşlık Ağırlığı: Genel Kültür testindeki 60 sorunun 9\'u (%15\'i) Vatandaşlık (Anayasa) dersinden gelir.',
          '💡 Konu Dağılımı: Temel Hukuk Kavramları (2-3 soru), 1982 Anayasası, Temel Haklar, Yasama, Yürütme ve Yargı (4-5 soru) sorulur.',
          '💡 İdare Hukuku: Vatandaşlık testinin son 2-3 sorusu İdare Hukuku (Merkezi/Yerinden Yönetim ve Memurluk) konularından çıkar.',
          '💡 Uygulama Yapısı: Bu bölümdeki 6 konuyu sırayla çözebilir, karıştırdığın kavramları Pratik sekmesindeki Bilgi Kartları ile tekrar edebilirsin.',
        ];
      case MascotMood.current:
        return const [
          '💡 KPSS Güncel Bilgiler Ağırlığı: Genel Kültür testinin son 6 sorusu (%10\'u) Güncel Bilgiler ve Sosyoekonomik Gelişmelerden oluşur.',
          '💡 Kapsam (1/2): Türkiye ve Dünya Gündemi, Uluslararası Kuruluşlar (BM, NATO, Türk Devletleri Teşkilatı) ve Zirveler sorulur.',
          '💡 Kapsam (2/2): Kültür, Sanat, Edebiyat, Bilim-Teknoloji hamleleri, UNESCO Miras Listesi ve Olimpiyat/Spor başarıları yer alır.',
          '💡 Uygulama Yapısı: Güncel Bilgiler bölümü 6 alt başlıktan oluşur; hızlı tekrar için Bilgi Kartları modunu da kullanabilirsin.',
        ];
      case MascotMood.practice:
        return const [
          '💡 Antrenman Sahası: Bu ekranda klasik test dışında 6 farklı interaktif çalışma ve tekrar aracına tek merkezden erişebilirsin.',
          '💡 Bilgi Kartları & Eşleştirme: Hap bilgileri ön/arka kartlarla ezberleyebilir veya Kavram Eşleştirme tahtasında terimleri eşleştirebilirsin.',
          '💡 60 Saniyede Pençe & Çeldirici Avı: 60 saniyelik Doğru/Yanlış düellosu ile hız kazanabilir, ÖSYM Tuzak Soruları ile çeldiricileri öğrenebilirsin.',
          '💡 Pomodoro & Sınav Sayacı: En alttaki sayaç kartından KPSS geri sayımını takip edebilir ve dikey/yatay masa saatiyle odaklanabilirsin.',
        ];
      case MascotMood.exam:
        return const [
          '💡 KPSS Genel Kültür Provası: Gerçek sınavda 60 soru (27 Tarih, 18 Coğrafya, 9 Vatandaşlık, 6 Güncel) için 65 dakika süre verilir.',
          '💡 Süreli Deneme Motoru: Denemeyi başlattığında üstte geri sayım sayacı çalışır ve bitirdiğinde 4 yanlış 1 doğru net hesabın çıkarılır.',
          '💡 Kamp & Mola Denemeleri: Tam 65 dakikalık Türkiye Geneli prova dışında 30 soruluk Kamp veya 15 soruluk Hızlı Mola denemesi çözebilirsin.',
          '💡 Çözülen Deneme Takibi: Bitirdiğin denemelerin üzerinde son yaptığın net puanı yazar; dilediğin zaman "Denemeyi Tekrar Çöz" diyebilirsin.',
        ];
      case MascotMood.analyst:
        return const [
          '💡 İstatistik & Analiz: Bu ekranda çözdüğün tüm soruların ders bazlı doğruluk oranlarını ve soru başına ortalama çözüm süreni görürsün.',
          '💡 Ders Ustalık Seviyesi: Başarı oranına göre derslerin "Kritik (<%50)", "Gelişiyor (%50-79)" ve "Usta (%80+)" olarak sınıflandırılır.',
          '💡 Çözülen Testler Arşivi: Daha önce tamamladığın tüm testlerin tarih, doğru/yanlış ve net geçmişini buradan inceleyebilirsin.',
          '💡 Kadro Ligi & Rozetler: Topladığın XP puanlarıyla Bronz, Gümüş, Altın ve Müsteşar Ligi kademelerinde sıralamanı takip edebilirsin.',
        ];
      case MascotMood.streak:
        return const [
          '💡 Günlük Seri (Streak) Nedir?: Uygulamada her gün en az 1 soru çözdüğünde günlük çalışma serin kesintisiz olarak artar.',
          '💡 Günlük Soru Hedefi: Profil ekranından günlük soru hedefini (30, 50 veya 100 soru) kendi çalışma tempona göre değiştirebilirsin.',
          '💡 Görev Hatırlatıcıları: Ana sayfadaki hatırlatıcı kartı, o gün kalan soru sayını ve bekleyen çalışma planı görevlerini özetler.',
          '💡 Zayıf Konu Tespiti: Uygulama en çok yanlış yaptığın dersi otomatik tespit eder ve ana sayfada 10 soruluk güçlendirme testi sunar.',
        ];
    }
  }

  /// Verilen KPSS ders adına göre uygun Tuğrul karakterini seçer.
  ///
  /// Örnek:
  /// - 'Tarih' -> [MascotMood.history] (Selçuklu miğferli Tuğrul Alp)
  /// - 'Coğrafya' -> [MascotMood.geography] (Kâşif Tuğrul)
  /// - 'Vatandaşlık' -> [MascotMood.citizenship] (Hukukçu Tuğrul)
  /// - 'Güncel Bilgiler' -> [MascotMood.current] (Haberci Tuğrul)
  static MascotMood fromLesson(String? lesson) {
    final normalized = (lesson ?? '').toLowerCase().trim();
    if (normalized.contains('tarih')) return MascotMood.history;
    if (normalized.contains('coğrafya') || normalized.contains('cografya')) {
      return MascotMood.geography;
    }
    if (normalized.contains('vatandaşlık') ||
        normalized.contains('vatandaslik')) {
      return MascotMood.citizenship;
    }
    if (normalized.contains('güncel') || normalized.contains('guncel')) {
      return MascotMood.current;
    }
    return MascotMood.coach;
  }
}

/// "Kadro Koçu" maskot konuşma balonu ve 3D Dönen (Flip Card) Tüyo bileşeni.
///
/// Web/Angular karşılığı:
/// Gamification bildirim ve 3D Flip Card bileşeni (`transform: rotateY(180deg)`).
/// Varsayılan (Ön Yüz) durumda tüyolar gizlidir ve sadece ekranın karşılama metni tam (kesilmeden) gösterilir.
/// Kullanıcı karta tıkladığında kart döner (Arka Yüz) ve o sayfa/ders ile ilgili KPSS tüyolarını tam metin olarak sunar.
class MascotCoachBanner extends StatefulWidget {
  final MascotMood mood;
  final String title;
  final String message;
  final String badgeLabel;

  const MascotCoachBanner({
    super.key,
    this.mood = MascotMood.coach,
    required this.title,
    required this.message,
    this.badgeLabel = 'KADRO KOÇU',
  });

  @override
  State<MascotCoachBanner> createState() => _MascotCoachBannerState();
}

class _MascotCoachBannerState extends State<MascotCoachBanner> {
  bool _isFlipped = false;
  int _tipIndex = 0;

  void _handleCardTap() {
    setState(() {
      if (!_isFlipped) {
        _isFlipped = true;
      } else {
        final tipsLength = widget.mood.coachTips.length;
        if (_tipIndex < tipsLength - 1) {
          _tipIndex++;
        } else {
          _tipIndex = 0;
          _isFlipped = false;
        }
      }
    });
  }

  void _flipBackToFront() {
    setState(() {
      _isFlipped = false;
    });
  }

  void _nextTipOnly() {
    setState(() {
      _tipIndex = (_tipIndex + 1) % widget.mood.coachTips.length;
    });
  }

  @override
  void didUpdateWidget(covariant MascotCoachBanner oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.mood != widget.mood || oldWidget.message != widget.message) {
      _isFlipped = false;
      _tipIndex = 0;
    }
  }

  Color _getMoodColor(ColorScheme colorScheme) {
    switch (widget.mood) {
      case MascotMood.coach:
      case MascotMood.history:
      case MascotMood.citizenship:
      case MascotMood.practice:
      case MascotMood.analyst:
        return colorScheme.primary;
      case MascotMood.victory:
      case MascotMood.pro:
      case MascotMood.exam:
        return colorScheme.tertiary;
      case MascotMood.geography:
      case MascotMood.current:
        return colorScheme.secondary;
      case MascotMood.detective:
      case MascotMood.streak:
        return colorScheme.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final isCompact = ResponsiveBreakpoints.isCompact(context);
    final avatarSize = isCompact ? 72.0 : 92.0;

    final auraColor = _getMoodColor(colorScheme);
    final tips = widget.mood.coachTips;
    final longestTip = tips.reduce((a, b) => a.length >= b.length ? a : b);

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : MediaQuery.sizeOf(context).width - 32;

        final fixedCardHeight = _computeUnifiedHeight(
          context: context,
          maxWidth: maxWidth,
          textTheme: textTheme,
          avatarSize: avatarSize,
          isCompact: isCompact,
          longestTip: longestTip,
        );

        final frontChild = _buildFrontFace(
          context: context,
          colorScheme: colorScheme,
          textTheme: textTheme,
          auraColor: auraColor,
          avatarSize: avatarSize,
          fixedHeight: fixedCardHeight,
          isCompact: isCompact,
        );

        final backChild = _buildBackFace(
          context: context,
          colorScheme: colorScheme,
          textTheme: textTheme,
          auraColor: auraColor,
          fixedHeight: fixedCardHeight,
          isCompact: isCompact,
          tips: tips,
        );

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 220),
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeInCubic,
          layoutBuilder: (currentChild, previousChildren) {
            return Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[...previousChildren, ?currentChild],
            );
          },
          transitionBuilder: (child, animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: _isFlipped ? backChild : frontChild,
        );
      },
    );
  }

  /// Ön yüz ve tüm tüyoların yüksekliğini TextPainter ile ayrı ayrı ölçüp
  /// en büyük olanını + güvenli payı döndürür (Sıfır zıplama / Zero Layout Shift).
  double _computeUnifiedHeight({
    required BuildContext context,
    required double maxWidth,
    required TextTheme textTheme,
    required double avatarSize,
    required bool isCompact,
    required String longestTip,
  }) {
    final textDirection = Directionality.of(context);
    final textScaler = MediaQuery.textScalerOf(context);
    final hPad = (isCompact ? 12.0 : 14.0) * 2;
    final vPad = (isCompact ? 10.0 : 12.0) * 2;
    const borderAllowance = 4.0;

    // 1. Ön yüz sağ sütun yüksekliği (border genişliği düşülerek)
    final frontRightWidth =
        (maxWidth -
                hPad -
                borderAllowance -
                avatarSize -
                (isCompact ? 10.0 : 14.0))
            .clamp(100.0, 1200.0);
    final titleStyle = (textTheme.titleMedium ?? const TextStyle(fontSize: 16))
        .copyWith(fontWeight: FontWeight.w800);
    final msgStyle = (textTheme.bodyMedium ?? const TextStyle(fontSize: 14))
        .copyWith(fontWeight: FontWeight.w500, height: 1.4);

    final titlePainter = TextPainter(
      text: TextSpan(text: widget.title, style: titleStyle),
      textDirection: textDirection,
      textScaler: textScaler,
    )..layout(maxWidth: frontRightWidth);

    final msgInnerWidth = (frontRightWidth - (isCompact ? 20.0 : 24.0) - 2.0)
        .clamp(80.0, 1200.0);
    final msgPainter = TextPainter(
      text: TextSpan(text: widget.message, style: msgStyle),
      textDirection: textDirection,
      textScaler: textScaler,
    )..layout(maxWidth: msgInnerWidth);

    final frontContentHeight =
        24.0 + // üst rozet satırı
        4.0 +
        titlePainter.height +
        4.0 +
        msgPainter.height +
        (isCompact ? 14.0 : 18.0) + // konuşma balonu dikey iç dolgusu + border
        6.0;
    final frontTotalHeight =
        (frontContentHeight > avatarSize ? frontContentHeight : avatarSize) +
        vPad +
        borderAllowance;

    // 2. Arka yüz (tüm tüyoların en yükseği) yüksekliği
    final tipStyle = (textTheme.bodyMedium ?? const TextStyle(fontSize: 14))
        .copyWith(fontWeight: FontWeight.w600, height: 1.45);
    final backInnerWidth =
        (maxWidth - hPad - borderAllowance - (isCompact ? 24.0 : 28.0) - 2.0)
            .clamp(100.0, 1200.0);

    double maxTipHeight = 0;
    for (final tip in widget.mood.coachTips) {
      final tp = TextPainter(
        text: TextSpan(text: tip, style: tipStyle),
        textDirection: textDirection,
        textScaler: textScaler,
      )..layout(maxWidth: backInnerWidth);
      if (tp.height > maxTipHeight) {
        maxTipHeight = tp.height;
      }
    }

    final backTotalHeight =
        vPad +
        borderAllowance +
        28.0 + // üst başlık/aksiyon satırı
        8.0 +
        maxTipHeight +
        (isCompact ? 22.0 : 26.0) + // tüyo kutusu iç dikey dolgusu + border
        6.0;

    final minFloor = isCompact ? 132.0 : 148.0;
    final maxCalculated = frontTotalHeight > backTotalHeight
        ? frontTotalHeight
        : backTotalHeight;
    return (maxCalculated > minFloor ? maxCalculated : minFloor).ceilToDouble();
  }

  /// Ön Yüz (Varsayılan): Tüyolar gizlidir, sayfa başlığı ve açıklama metni kesilmeden üstten hizalı gösterilir.
  Widget _buildFrontFace({
    required BuildContext context,
    required ColorScheme colorScheme,
    required TextTheme textTheme,
    required Color auraColor,
    required double avatarSize,
    required double fixedHeight,
    required bool isCompact,
  }) {
    return Container(
      key: const ValueKey('mascot_front_face'),
      height: fixedHeight,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: auraColor.withAlpha(120), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Color.alphaBlend(
              auraColor.withAlpha(60),
              colorScheme.surface,
            ),
            offset: const Offset(0, 3.5),
            blurRadius: 0,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: _handleCardTap,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isCompact ? 12 : 14,
              vertical: isCompact ? 10 : 12,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Sol: Çift Katmanlı Borderlı Maskot Çerçevesi + Dinamik Rozet (Üste hizalı)
                Align(
                  alignment: Alignment.topCenter,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: avatarSize,
                        height: avatarSize,
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(
                            isCompact ? 16 : 20,
                          ),
                          border: Border.all(
                            color: auraColor.withAlpha(100),
                            width: 2,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            isCompact ? 14 : 18,
                          ),
                          child: Image.asset(
                            widget.mood.assetPath,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                PhosphorIcon(
                                  PhosphorIconsDuotone.trophy,
                                  color: auraColor,
                                  size: isCompact ? 32 : 40,
                                ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: -2,
                        bottom: -2,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: colorScheme.tertiaryContainer,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: colorScheme.surface,
                              width: 2,
                            ),
                          ),
                          child: PhosphorIcon(
                            widget.mood.badgeIcon,
                            size: isCompact ? 10 : 12,
                            color: colorScheme.onTertiaryContainer,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: isCompact ? 10 : 14),

                // Sağ: Rozet, Başlık ve Kalan Yüksekliği %100 Dolduran Konuşma Balonu
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Üst Rozet Satırı + Sağda zarif çevirme ikonu
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: isCompact ? 8 : 10,
                                vertical: isCompact ? 2 : 3,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                widget.badgeLabel,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.labelSmall?.copyWith(
                                  color: colorScheme.onPrimaryContainer,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ),
                          PhosphorIcon(
                            PhosphorIconsBold.arrowsClockwise,
                            size: 15,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),

                      // Başlık
                      Text(
                        widget.title,
                        style: textTheme.titleMedium?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 4),

                      // Konuşma Balonu (Expanded ile kalan gri alanı %100 kaplar!)
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            horizontal: isCompact ? 10 : 12,
                            vertical: isCompact ? 6 : 8,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: colorScheme.outlineVariant,
                            ),
                          ),
                          child: Text(
                            widget.message,
                            style: textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurface,
                              fontWeight: FontWeight.w500,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Arka Yüz (Kart Döndüğünde): O sayfa/ders ile ilgili KPSS tüyolarını üstten hizalı tam metin olarak gösterir.
  Widget _buildBackFace({
    required BuildContext context,
    required ColorScheme colorScheme,
    required TextTheme textTheme,
    required Color auraColor,
    required double fixedHeight,
    required bool isCompact,
    required List<String> tips,
  }) {
    final currentTip = tips[_tipIndex % tips.length];

    return Container(
      key: const ValueKey('mascot_back_face'),
      height: fixedHeight,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: colorScheme.tertiary, width: 1.8),
        boxShadow: [
          BoxShadow(
            color: Color.alphaBlend(
              colorScheme.tertiary.withAlpha(70),
              colorScheme.surface,
            ),
            offset: const Offset(0, 3.5),
            blurRadius: 0,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: _handleCardTap,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isCompact ? 12 : 14,
              vertical: isCompact ? 10 : 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Üst Satır: Sayfa/Ders Tüyo Başlığı + Sayaç + Ön Yüze Dön Butonu
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.tertiaryContainer,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            PhosphorIcon(
                              PhosphorIconsFill.lightbulb,
                              size: 14,
                              color: colorScheme.onTertiaryContainer,
                            ),
                            const SizedBox(width: 5),
                            Flexible(
                              child: Text(
                                '${widget.badgeLabel} · KPSS TÜYOSU (${_tipIndex + 1}/${tips.length})',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.labelSmall?.copyWith(
                                  color: colorScheme.onTertiaryContainer,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: _nextTipOnly,
                          borderRadius: BorderRadius.circular(8),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            child: Text(
                              'Sonraki Tüyo →',
                              style: textTheme.labelSmall?.copyWith(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        InkWell(
                          onTap: _flipBackToFront,
                          borderRadius: BorderRadius.circular(8),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: PhosphorIcon(
                              PhosphorIconsBold.arrowUUpLeft,
                              size: 16,
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Tam Genişlik ve %100 Kalan Yükseklikte Tüyo İçeriği
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: isCompact ? 12 : 14,
                      vertical: isCompact ? 10 : 12,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.tertiaryContainer.withAlpha(55),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: colorScheme.tertiary.withAlpha(110),
                      ),
                    ),
                    child: Text(
                      currentTip,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                        height: 1.45,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
