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

  /// Her moda özel 4 adet vurucu KPSS Genel Kültür tüyosu ve ezber şifresi.
  List<String> get coachTips {
    switch (this) {
      case MascotMood.coach:
        return const [
          '💡 Koç Tüyosu: Günde 30 soru çözerek 1 yılda 10.000+ soru biriktirir ve dereceye ulaşırsın!',
          '💡 Koç Tüyosu: Soru çözerken saat tutmak net hızını %25 artırır; turlama taktiğini ihmal etme!',
          '💡 Koç Tüyosu: Düzenli günlük tekrar, haftada tek gün saatlerce çalışmaktan 3 kat daha kalıcıdır.',
          '💡 Koç Tüyosu: Yanlış yaptığın her soru, gerçek sınavda kazanacağın potansiyel +1 net demektir!',
        ];
      case MascotMood.victory:
        return const [
          '💡 Zafer Tüyosu: Tebrikler! Başarı bir varış noktası değil, her gün tekrarlanan disiplinli bir alışkanlıktır.',
          '💡 Zafer Tüyosu: Yüksek netin sırrı konsantrasyondur; bu tempoyu koruyarak ilk 1000 hedefine koş!',
          '💡 Zafer Tüyosu: Zafer Karnesi ile başarına ortak ol; Instagram veya WhatsApp\'ta arkadaşlarınla paylaş!',
          '💡 Zafer Tüyosu: Zirveye çıkmak zordur ama orada kalmak istikrar gerektirir, seriyi bırakma!',
        ];
      case MascotMood.detective:
        return const [
          '💡 Dedektif Tüyosu: ÖSYM çeldiricileri genellikle en tanıdık gelen ama detayda yanıltan öncüllerdir.',
          '💡 Dedektif Tüyosu: "Yalnızca", "her zaman", "tümü" gibi mutlak kelimeler içeren seçenekleri iki kez oku!',
          '💡 Dedektif Tüyosu: Yanlış Defteri\'ndeki soruları aralıklı tekrarlarla çözerek kalıcı hafızaya kazı.',
          '💡 Dedektif Tüyosu: Soru kökünün olumlu mu ("ulaşılabilir") olumsuz mu ("değildir") olduğunu mutlaka çiz!',
        ];
      case MascotMood.pro:
        return const [
          '💡 VIP Koç Tüyosu: Kadro PRO ile internetsiz metroda veya kütüphanede çevrimdışı deneme çözebilirsin!',
          '💡 VIP Koç Tüyosu: Detaylı ÖSYM Çeldirici Tuzağı analizi seni adayların %90\'ının önüne geçirir.',
          '💡 VIP Koç Tüyosu: Sınırsız soru hakkıyla her gün en zayıf konudan 50 soru çözerek açığını kapat.',
          '💡 VIP Koç Tüyosu: PRO analiz raporlarında en çok vakit kaybettiğin soru kalıplarını analiz et.',
        ];
      case MascotMood.history:
        return const [
          '💡 Tarih Şifresi: Islahat Fermanı\'nda gayrimüslimlere siyasi hak değil, devlet memuru olma hakkı tanınmıştır!',
          '💡 Tarih Şifresi: İlk Türk devletlerinde kut anlayışı egemenliğin ilahi kaynaklı olduğunu gösterir; yerleşik hayatta da sürer.',
          '💡 Tarih Şifresi: Amasya Genelgesi, Kurtuluş Savaşı\'nın amaç, gerekçe ve yöntemini belirten ilk ihtilal belgesidir.',
          '💡 Tarih Şifresi: Lozan Barış Antlaşması\'nda çözülemeyip sonraya bırakılan tek konu Musul (Irak Sınırı) sorunudur.',
        ];
      case MascotMood.geography:
        return const [
          '💡 Coğrafya Şifresi: Türkiye\'de dağlar doğu-batı uzanışlı olduğu için kuzey-güney ulaşımında geçitler kullanılır.',
          '💡 Coğrafya Şifresi: Gerçek alan ile izdüşüm alan arasındaki farkın en fazla olduğu bölge Doğu Anadolu, en az Marmara\'dır.',
          '💡 Coğrafya Şifresi: Türkiye\'de falezler en çok dağların denize paralel uzandığı Doğu Karadeniz ve Batı Akdeniz\'dedir.',
          '💡 Coğrafya Şifresi: Karstik göller ve aşınım şekilleri en yoğun Akdeniz (Teke ve Taşeli platoları) bölgesindedir.',
        ];
      case MascotMood.citizenship:
        return const [
          '💡 Vatandaşlık Şifresi: 1982 Anayasası\'na göre kanun teklif etmeye milletvekilleri yetkilidir; Cumhurbaşkanı bütçe hariç teklif veremez.',
          '💡 Vatandaşlık Şifresi: Anayasa Mahkemesi 15 üyeden oluşur; 12 üyeyi Cumhurbaşkanı, 3 üyeyi TBMM seçer.',
          '💡 Vatandaşlık Şifresi: Yönetmelikleri Cumhurbaşkanı, bakanlıklar ve kamu tüzel kişileri çıkarabilir.',
          '💡 Vatandaşlık Şifresi: Memurlukta adaylık süresi en az 1 yıl, en çok 2 yıldır; adaylık süresinde başka kuruma nakil yapılamaz.',
        ];
      case MascotMood.current:
        return const [
          '💡 Güncel Bilgiler: UNESCO Dünya Mirası Listesi\'ndeki en son Türk kültür ve tabiat varlıklarını sınav öncesi mutlaka gözden geçir.',
          '💡 Güncel Bilgiler: Türkiye\'nin üye olduğu uluslararası kuruluşlar (NATO, BM, G20, Türk Devletleri Teşkilatı) her yıl soru getirir.',
          '💡 Güncel Bilgiler: Nobel ödülleri, uzay misyonları ve uluslararası spor başarıları son 1 yılın en sıcak konularıdır.',
          '💡 Güncel Bilgiler: Türkiye\'nin milli teknoloji hamlesi projeleri (Togg, KAAN, TCG Anadolu) potansiyel sınav sorularıdır.',
        ];
      case MascotMood.practice:
        return const [
          '💡 Pratik Tüyosu: Farklı modları harmanla: Önce hap kartlarla oku, sonra konu testi çöz, en son blitz ile hızlan!',
          '💡 Pratik Tüyosu: 60 Saniyede Pençe antrenmanı, zihindeki tereddütleri siler ve sınavdaki refleks karar hızını ikiye katlar.',
          '💡 Pratik Tüyosu: Kavram Eşleştirme tahtası, Tarih antlaşmaları ve Coğrafya madenlerini ezberlemenin en pratik yoludur.',
          '💡 Pratik Tüyosu: Yanlış defterini her pazar temizlemeyi rutin haline getir; netlerin hızla tırmansın!',
        ];
      case MascotMood.exam:
        return const [
          '💡 Deneme Tüyosu: Genel Kültür 60 soru için 65 dakikadır; soru başına ortalama 65 saniye hedefin olsun.',
          '💡 Deneme Tüyosu: Turlama Taktiği: İlk turda sadece kesin bildiklerini çöz, şüphelilere işaret koyup ikinci turda dön!',
          '💡 Deneme Tüyosu: 4 yanlış 1 doğruyu götürür; iki şık arasında kalmadığın sürece kesinlikle tahminle işaretleme yapma!',
          '💡 Deneme Tüyosu: Deneme biter bitmez hemen boş ve yanlışlarını incele; denemenin asıl faydası karne analizindedir.',
        ];
      case MascotMood.analyst:
        return const [
          '💡 Analiz Tüyosu: Netlerin plato çizdiğinde en zayıf dersine odaklanıp oradan 10\'ar soruluk mikro testler çöz.',
          '💡 Analiz Tüyosu: KPSS Lisans\'ta Tarih (%45) ve Coğrafya (%30) Genel Kültür puanının %75\'ini belirler; öncelik ver.',
          '💡 Analiz Tüyosu: Soru başına çözüm süren 50 saniyenin altındaysa harika hızdasın; doğruluğu korumaya dikkat et.',
          '💡 Analiz Tüyosu: Haftalık Kadro Ligi\'nde üst sıralara tırmanmak için her gün en az 1 test çözerek çarpanını koru.',
        ];
      case MascotMood.streak:
        return const [
          '💡 Seri Canavarı: Seri (streak) ateşi yanarken öğrenme motivasyonu zirvededir; zinciri asla kırma!',
          '💡 Seri Canavarı: Günde sadece 5 soru bile çözsen serin korunur; yorgun günlerde bile en azından 1 mini test çöz.',
          '💡 Seri Canavarı: 7 günlük kesintisiz seri tamamladığında Kadro Ligi\'nde +50 bonus XP kazanırsın!',
          '💡 Seri Canavarı: Başarı her gün tekrarlanan küçük adımların toplamıdır; serin senin disiplin kalkanındır!',
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

    final longestTip = tips.reduce(
      (a, b) => a.length >= b.length ? a : b,
    );

    final frontChild = _buildFrontFace(
      context: context,
      colorScheme: colorScheme,
      textTheme: textTheme,
      auraColor: auraColor,
      avatarSize: avatarSize,
      isCompact: isCompact,
    );

    final backChild = _buildBackFace(
      context: context,
      colorScheme: colorScheme,
      textTheme: textTheme,
      auraColor: auraColor,
      isCompact: isCompact,
      tips: tips,
    );

    final tallestBackMeasure = _buildBackFace(
      context: context,
      colorScheme: colorScheme,
      textTheme: textTheme,
      auraColor: auraColor,
      isCompact: isCompact,
      tips: tips,
      overrideTipText: longestTip,
    );

    // Zero-Layout-Shift (Sıfır Zıplama):
    // IntrinsicHeight + Stack içerisinde hem Ön Yüzün hem de En Uzun Tüyolu Arka Yüzün
    // yüksekliğini aynı anda referans alır ve her iki yüzü bu yüksekliğe eşitler (stretch).
    // Böylece ön/arka yüz ve tüyo geçişlerinde ne kartın kendisi ne de altındaki sayfa
    // 1 piksel bile zıplamaz!
    return IntrinsicHeight(
      child: Stack(
        fit: StackFit.expand,
        children: [
          IgnorePointer(
            child: Opacity(
              opacity: 0.0,
              child: ExcludeSemantics(child: frontChild),
            ),
          ),
          IgnorePointer(
            child: Opacity(
              opacity: 0.0,
              child: ExcludeSemantics(child: tallestBackMeasure),
            ),
          ),
          _isFlipped ? backChild : frontChild,
        ],
      ),
    );
  }

  /// Ön Yüz (Varsayılan): Tüyolar gizlidir, sayfa başlığı ve açıklama metni kesilmeden gösterilir.
  Widget _buildFrontFace({
    required BuildContext context,
    required ColorScheme colorScheme,
    required TextTheme textTheme,
    required Color auraColor,
    required double avatarSize,
    required bool isCompact,
  }) {
    final fixedMinHeight = isCompact ? 132.0 : 146.0;
    return Container(
      key: const ValueKey('mascot_front_face'),
      constraints: BoxConstraints(minHeight: fixedMinHeight),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Sol: Çift Katmanlı Borderlı Maskot Çerçevesi + Dinamik Rozet
                Stack(
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
                SizedBox(width: isCompact ? 10 : 14),

                // Sağ: Rozet, Başlık ve Tam Konuşma Balonu (Kesilmeden!)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
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

                      // Konuşma Balonu (Tam metin - nokta nokta ile kesilmez!)
                      Container(
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

  /// Arka Yüz (Kart Döndüğünde): O sayfa/ders ile ilgili KPSS tüyolarını tam metin olarak gösterir.
  Widget _buildBackFace({
    required BuildContext context,
    required ColorScheme colorScheme,
    required TextTheme textTheme,
    required Color auraColor,
    required bool isCompact,
    required List<String> tips,
    String? overrideTipText,
  }) {
    final fixedMinHeight = isCompact ? 132.0 : 146.0;
    final currentTip = overrideTipText ?? tips[_tipIndex % tips.length];

    return Container(
      key: const ValueKey('mascot_back_face'),
      constraints: BoxConstraints(minHeight: fixedMinHeight),
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
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
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

                // Tam Genişlik Tüyo İçeriği (Kesilmeden tam metin!)
                Container(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
