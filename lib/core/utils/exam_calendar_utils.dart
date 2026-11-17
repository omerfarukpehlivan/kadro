/// Takvim ayları ve artık yılları hesaba katan sınav geri sayım detay modeli.
///
/// Angular/Web Karşılığı: `ExamRemainingDetails` / Date countdown pipe modeli.
/// [KpssExamTarget] ve [ExamSelection] sınıflarının tarih hesaplama mantığını
/// tek merkezden paylaşması için `lib/core/utils/` altında konumlandırılmıştır.
class ExamRemainingDetails {
  final int years;
  final int months;
  final int days;
  final int totalDays;
  final bool isPast;

  const ExamRemainingDetails({
    required this.years,
    required this.months,
    required this.days,
    required this.totalDays,
    required this.isPast,
  });

  /// İnsan dostu okunabilir tek satırlık sayaç metni
  /// (örn: "1 Yıl 10 Ay 29 Gün Kaldı" veya "11 Ay 20 Gün Kaldı").
  String get formattedRemaining {
    if (isPast) return 'Sınav Günü Geldi!';
    final parts = <String>[];
    if (years > 0) parts.add('$years Yıl');
    if (months > 0) parts.add('$months Ay');
    if (days > 0 || parts.isEmpty) parts.add('$days Gün');
    return '${parts.join(' ')} Kaldı';
  }

  /// Sınav tarihi geçmiş veya sıfırlanmış mı?
  bool get hasArrived => isPast || totalDays <= 0;
}

/// Verilen [examDate] ile [now] arasındaki takvime duyarlı Yıl / Ay / Gün farkını hesaplar.
///
/// Ay uzunluklarını (28/29/30/31) ve artık yılları birebir takip eder; tekrarlı
/// takvim mantığını engellemek için tüm sınav modelleri tarafından paylaşılır.
ExamRemainingDetails calculateExamRemainingDetails(
  DateTime examDate, [
  DateTime? now,
]) {
  final current = now ?? DateTime.now();
  if (examDate.isBefore(current)) {
    return const ExamRemainingDetails(
      years: 0,
      months: 0,
      days: 0,
      totalDays: 0,
      isPast: true,
    );
  }

  final totalDays = examDate.difference(current).inDays;

  var temp = DateTime(current.year, current.month, current.day);
  final target = DateTime(examDate.year, examDate.month, examDate.day);

  var years = 0;
  while (true) {
    final nextYear = DateTime(temp.year + 1, temp.month, temp.day);
    if (nextYear.isAfter(target)) break;
    temp = nextYear;
    years++;
  }

  var months = 0;
  while (true) {
    final nextMonthYear = temp.month == 12 ? temp.year + 1 : temp.year;
    final nextMonthNum = temp.month == 12 ? 1 : temp.month + 1;
    final daysInNextMonth = DateTime(nextMonthYear, nextMonthNum + 1, 0).day;
    final safeDay = temp.day > daysInNextMonth ? daysInNextMonth : temp.day;
    final nextMonth = DateTime(nextMonthYear, nextMonthNum, safeDay);

    if (nextMonth.isAfter(target)) break;
    temp = nextMonth;
    months++;
  }

  final days = target.difference(temp).inDays;

  return ExamRemainingDetails(
    years: years,
    months: months,
    days: days,
    totalDays: totalDays,
    isPast: false,
  );
}

/// Hazırlık sezonunun başlangıç ([seasonStart]) ve hedef ([examDate]) tarihine göre
/// tamamlanma oranını (0.0 – 1.0) hesaplar.
double calculateExamProgressRatio(
  DateTime seasonStart,
  DateTime examDate, [
  DateTime? now,
]) {
  final current = now ?? DateTime.now();
  final totalDuration = examDate.difference(seasonStart).inSeconds;
  if (totalDuration <= 0) return 1.0;
  final elapsed = current.difference(seasonStart).inSeconds;
  return (elapsed / totalDuration).clamp(0.0, 1.0);
}

/// KPSS Sınav Türleri ve gelecek dönem ÖSYM sınav takvimi hedef tarihleri (Temsili / Projeksiyon).
///
/// Web/Angular Karşılığı: Exam target configuration model.
enum KpssExamTarget {
  lisans(
    title: '2027 KPSS Lisans (GY-GK)',
    shortTitle: '2027 KPSS Lisans',
    subtitle: '4 Yıllık Üniversite Mezunları & Son Sınıf',
    examDateStr: '2027-09-05T10:15:00',
    seasonStartStr: '2026-09-01T00:00:00',
  ),
  lisans2028(
    title: '2028 KPSS Lisans (B Grubu)',
    shortTitle: '2028 KPSS Lisans',
    subtitle: '4 Yıllık Genel Atama Kadroları',
    examDateStr: '2028-09-03T10:15:00',
    seasonStartStr: '2026-10-01T00:00:00',
  ),
  onlisans(
    title: '2028 KPSS Ön Lisans',
    shortTitle: '2028 KPSS Ön Lisans',
    subtitle: '2 Yıllık Meslek Yüksekokulu Mezunları',
    examDateStr: '2028-10-08T10:15:00',
    seasonStartStr: '2026-10-01T00:00:00',
  ),
  ortaogretim(
    title: '2028 KPSS Ortaöğretim',
    shortTitle: '2028 KPSS Ortaöğretim',
    subtitle: 'Lise ve Dengi Okul Mezunları',
    examDateStr: '2028-10-22T10:15:00',
    seasonStartStr: '2026-10-01T00:00:00',
  ),
  dhbt(
    title: '2028 KPSS DHBT',
    shortTitle: '2028 KPSS DHBT',
    subtitle: 'Din Hizmetleri Alan Bilgisi',
    examDateStr: '2028-11-05T10:15:00',
    seasonStartStr: '2026-10-01T00:00:00',
  );

  final String title;
  final String shortTitle;
  final String subtitle;
  final String examDateStr;
  final String seasonStartStr;

  const KpssExamTarget({
    required this.title,
    required this.shortTitle,
    required this.subtitle,
    required this.examDateStr,
    required this.seasonStartStr,
  });

  /// ÖSYM tahmini takvim açıklaması (Kullanıcıya gösterilen yasal ve sakin bilgilendirme).
  static const String osymDisclaimer =
      'ℹ️ ÖSYM geçmiş sınav takvimi baz alınarak tahmini hesaplanmıştır. Resmi takvim açıklandığında otomatik güncellenir.';

  /// Enum anahtarından (name) KpssExamTarget örneği türetir.
  static KpssExamTarget fromKey(String? key) {
    if (key == null) return KpssExamTarget.lisans;
    return KpssExamTarget.values.firstWhere(
      (e) => e.name == key,
      orElse: () => KpssExamTarget.lisans,
    );
  }

  DateTime get examDate => DateTime.parse(examDateStr);
  DateTime get seasonStart => DateTime.parse(seasonStartStr);

  /// Sınava kalan süre farkı (sınav geçtiyse 0 döner).
  Duration remainingTime([DateTime? now]) {
    final current = now ?? DateTime.now();
    final diff = examDate.difference(current);
    return diff.isNegative ? Duration.zero : diff;
  }

  /// Sınava kalan tam gün sayısı
  int remainingDays([DateTime? now]) => remainingTime(now).inDays;

  /// Kalan saatin gün modülü (0-23)
  int remainingHours([DateTime? now]) => remainingTime(now).inHours % 24;

  /// Kalan dakikanın saat modülü (0-59)
  int remainingMinutes([DateTime? now]) => remainingTime(now).inMinutes % 60;

  /// Kalan saniyenin dakika modülü (0-59)
  int remainingSeconds([DateTime? now]) => remainingTime(now).inSeconds % 60;

  /// Takvim ayı ve artık yılları hesaba katan kesin Yıl/Ay/Gün detaylı sayaç nesnesi.
  ExamRemainingDetails detailedRemaining([DateTime? now]) =>
      calculateExamRemainingDetails(examDate, now);

  /// Hazırlık sezonunun tamamlanma oranı (0.0 - 1.0)
  double progressRatio([DateTime? now]) =>
      calculateExamProgressRatio(seasonStart, examDate, now);
}
