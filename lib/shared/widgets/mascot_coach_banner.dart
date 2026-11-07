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

/// "Kadro Koçu" maskot konuşma balonu ve rehberlik bileşeni.
///
/// Web/Angular karşılığı:
/// Gamification bildirim ve koçluk bileşeni (Duolingo banner/speech bubble).
/// 92x92 boyutundaki çift katmanlı çerçeveli avatar yapısı ve
/// dinamik mood aurası ile donatılmıştır.
class MascotCoachBanner extends StatelessWidget {
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

  Color _getMoodColor(ColorScheme colorScheme) {
    switch (mood) {
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
    final minHeight = isCompact ? 96.0 : 122.0;

    final auraColor = _getMoodColor(colorScheme);

    return Container(
      constraints: BoxConstraints(minHeight: minHeight),
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
                      mood.assetPath,
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
                      mood.badgeIcon,
                      size: isCompact ? 10 : 12,
                      color: colorScheme.onTertiaryContainer,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: isCompact ? 10 : 14),

            // Sağ: Rozet, Başlık ve Tam Genişlik Konuşma Balonu
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Üst Rozet (badgeLabel)
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isCompact ? 8 : 10,
                      vertical: isCompact ? 2 : 3,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      badgeLabel,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Başlık (Kompakt ve 2 satıra kadar zarif geçiş - TASK-71)
                  Text(
                    title,
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w800,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),

                  // Konuşma Balonu (Tam genişlik ve 2-3 satır ritim)
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
                      message,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w500,
                        height: 1.4,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
