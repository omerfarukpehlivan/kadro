import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Sınava kalan sürenin Yıl, Ay, Gün ve toplam gün kırılımı.
///
/// Angular'daki DatePipe veya countdown modeline karşılık gelir.
/// Kullanıcının ana ekranda '1 Yıl 10 Ay 29 Gün' gibi takvim matematiğine
/// uygun ve net bir dille geri sayımı görmesini sağlar.
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

  /// İnsan dostu okunabilir tek satırlık sayaç metni (örn: "1 Yıl 10 Ay 29 Gün Kaldı" veya "11 Ay 20 Gün Kaldı").
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
  ExamRemainingDetails detailedRemaining([DateTime? now]) {
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

    int years = 0;
    while (true) {
      final nextYear = DateTime(temp.year + 1, temp.month, temp.day);
      if (nextYear.isAfter(target)) break;
      temp = nextYear;
      years++;
    }

    int months = 0;
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

  /// Hazırlık sezonunun tamamlanma oranı (0.0 - 1.0)
  double progressRatio([DateTime? now]) {
    final current = now ?? DateTime.now();
    final totalDuration = examDate.difference(seasonStart).inSeconds;
    if (totalDuration <= 0) return 1.0;
    final elapsed = current.difference(seasonStart).inSeconds;
    return (elapsed / totalDuration).clamp(0.0, 1.0);
  }
}

/// Pomodoro Stüdyosundaki 3 Farklı Saat Tasarımı (Clock Face Styles).
///
/// Flocus, Flip Focus ve iOS StandBy masa saati estetiğinden esinlenilmiştir.
enum PomodoroClockStyle {
  ring(label: 'Akademik Halka'),
  flip(label: 'Flip Masa Saati'),
  zen(label: 'Minimal Zen');

  final String label;
  const PomodoroClockStyle({required this.label});
}

/// KPSS'ye özel çalışma süresi şablonları.
enum PomodoroPreset {
  classic25(
    label: '25/5 Klasik',
    focusMinutes: 25,
    breakMinutes: 5,
    isStopwatch: false,
  ),
  deep50(
    label: '50/10 Derin Odak',
    focusMinutes: 50,
    breakMinutes: 10,
    isStopwatch: false,
  ),
  exam65(
    label: '65/15 Sınav Provası',
    focusMinutes: 65,
    breakMinutes: 15,
    isStopwatch: false,
  ),
  stopwatch(
    label: 'Serbest Kronometre',
    focusMinutes: 0,
    breakMinutes: 5,
    isStopwatch: true,
  );

  final String label;
  final int focusMinutes;
  final int breakMinutes;
  final bool isStopwatch;

  const PomodoroPreset({
    required this.label,
    required this.focusMinutes,
    required this.breakMinutes,
    required this.isStopwatch,
  });
}

/// Pomodoro ve Sınav Sayacı durum modeli.
class PomodoroState {
  final KpssExamTarget examTarget;
  final PomodoroClockStyle clockStyle;
  final PomodoroPreset preset;
  final int customFocusMinutes;
  final int customBreakMinutes;
  final String selectedLesson;
  final bool isRunning;
  final bool isFocusMode;
  final bool isBreak;
  final bool isLandscapeMode;
  final int remainingSeconds;
  final int elapsedSeconds;
  final int completedSessionsToday;
  final int totalFocusMinutesToday;
  final Map<String, int> lessonFocusMinutes;

  const PomodoroState({
    required this.examTarget,
    required this.clockStyle,
    required this.preset,
    this.customFocusMinutes = 25,
    this.customBreakMinutes = 5,
    required this.selectedLesson,
    required this.isRunning,
    this.isFocusMode = false,
    required this.isBreak,
    required this.isLandscapeMode,
    required this.remainingSeconds,
    required this.elapsedSeconds,
    required this.completedSessionsToday,
    required this.totalFocusMinutesToday,
    required this.lessonFocusMinutes,
  });

  /// Görüntülenecek dakika (örn. "25")
  String get formattedMinutes {
    final secs = preset.isStopwatch ? elapsedSeconds : remainingSeconds;
    return (secs ~/ 60).toString().padLeft(2, '0');
  }

  /// Görüntülenecek saniye (örn. "00")
  String get formattedSeconds {
    final secs = preset.isStopwatch ? elapsedSeconds : remainingSeconds;
    return (secs % 60).toString().padLeft(2, '0');
  }

  /// "MM:SS" formatında metin
  String get formattedTime => '$formattedMinutes:$formattedSeconds';

  /// Mevcut aşamanın hedef süresi (saniye cinsinden)
  int get totalTargetSeconds =>
      (isBreak ? customBreakMinutes : customFocusMinutes) * 60;

  /// Saat ilerleme yüzdesi (0.0 - 1.0)
  double get progress {
    if (preset.isStopwatch) {
      return ((elapsedSeconds % 3600) / 3600.0).clamp(0.0, 1.0);
    }
    if (totalTargetSeconds <= 0) return 0.0;
    return (1.0 - (remainingSeconds / totalTargetSeconds)).clamp(0.0, 1.0);
  }

  PomodoroState copyWith({
    KpssExamTarget? examTarget,
    PomodoroClockStyle? clockStyle,
    PomodoroPreset? preset,
    int? customFocusMinutes,
    int? customBreakMinutes,
    String? selectedLesson,
    bool? isRunning,
    bool? isFocusMode,
    bool? isBreak,
    bool? isLandscapeMode,
    int? remainingSeconds,
    int? elapsedSeconds,
    int? completedSessionsToday,
    int? totalFocusMinutesToday,
    Map<String, int>? lessonFocusMinutes,
  }) {
    return PomodoroState(
      examTarget: examTarget ?? this.examTarget,
      clockStyle: clockStyle ?? this.clockStyle,
      preset: preset ?? this.preset,
      customFocusMinutes: customFocusMinutes ?? this.customFocusMinutes,
      customBreakMinutes: customBreakMinutes ?? this.customBreakMinutes,
      selectedLesson: selectedLesson ?? this.selectedLesson,
      isRunning: isRunning ?? this.isRunning,
      isFocusMode: isFocusMode ?? this.isFocusMode,
      isBreak: isBreak ?? this.isBreak,
      isLandscapeMode: isLandscapeMode ?? this.isLandscapeMode,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      elapsedSeconds: elapsedSeconds ?? this.elapsedSeconds,
      completedSessionsToday:
          completedSessionsToday ?? this.completedSessionsToday,
      totalFocusMinutesToday:
          totalFocusMinutesToday ?? this.totalFocusMinutesToday,
      lessonFocusMinutes: lessonFocusMinutes ?? this.lessonFocusMinutes,
    );
  }
}

/// Pomodoro ve Sınav Sayacı durum yöneticisi.
///
/// Web/Angular Karşılığı: `PomodoroService` / Riverpod Notifier.
class PomodoroNotifier extends Notifier<PomodoroState> {
  Timer? _timer;

  @override
  PomodoroState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });

    return const PomodoroState(
      examTarget: KpssExamTarget.lisans,
      clockStyle: PomodoroClockStyle.ring,
      preset: PomodoroPreset.classic25,
      customFocusMinutes: 25,
      customBreakMinutes: 5,
      selectedLesson: 'Tarih',
      isRunning: false,
      isFocusMode: false,
      isBreak: false,
      isLandscapeMode: false,
      remainingSeconds: 25 * 60,
      elapsedSeconds: 0,
      completedSessionsToday: 0,
      totalFocusMinutesToday: 0,
      lessonFocusMinutes: {},
    );
  }

  void selectExamTarget(KpssExamTarget target) {
    state = state.copyWith(examTarget: target);
  }

  void selectClockStyle(PomodoroClockStyle style) {
    state = state.copyWith(clockStyle: style);
  }

  void selectPreset(PomodoroPreset preset) {
    _timer?.cancel();
    final fMins = preset.isStopwatch
        ? state.customFocusMinutes
        : preset.focusMinutes;
    final bMins = preset.breakMinutes;
    state = state.copyWith(
      preset: preset,
      customFocusMinutes: fMins,
      customBreakMinutes: bMins,
      isRunning: false,
      isFocusMode: false,
      isBreak: false,
      remainingSeconds: preset.isStopwatch ? 0 : fMins * 60,
      elapsedSeconds: 0,
    );
  }

  /// Kullanıcının ders süresini (dk) ve mola süresini (dk) doğrudan ayarlamasını sağlar.
  void setCustomDurations({int? focusMinutes, int? breakMinutes}) {
    _timer?.cancel();
    final newFocus = (focusMinutes ?? state.customFocusMinutes).clamp(5, 180);
    final newBreak = (breakMinutes ?? state.customBreakMinutes).clamp(1, 60);
    state = state.copyWith(
      customFocusMinutes: newFocus,
      customBreakMinutes: newBreak,
      isRunning: false,
      isBreak: false,
      remainingSeconds: state.preset.isStopwatch ? 0 : newFocus * 60,
      elapsedSeconds: 0,
    );
  }

  void selectLesson(String lesson) {
    state = state.copyWith(selectedLesson: lesson);
  }

  void setLandscapeMode(bool value) {
    state = state.copyWith(isLandscapeMode: value);
  }

  void startPause() {
    if (state.isRunning) {
      _timer?.cancel();
      state = state.copyWith(isRunning: false);
    } else {
      state = state.copyWith(isRunning: true, isFocusMode: true);
      _timer?.cancel();
      _timer = Timer.periodic(const Duration(seconds: 1), (_) => tick());
    }
  }

  /// Odak ekranından (sadece sayaç görünümü) çıkıp süre ayar ekranına döner.
  void exitFocusMode() {
    _timer?.cancel();
    state = state.copyWith(
      isRunning: false,
      isFocusMode: false,
      isBreak: false,
      remainingSeconds: state.preset.isStopwatch
          ? 0
          : state.customFocusMinutes * 60,
      elapsedSeconds: 0,
    );
  }

  /// 1 saniyelik zaman adımı (test edilebilir olması için public metottur).
  void tick() {
    if (state.preset.isStopwatch) {
      final newElapsed = state.elapsedSeconds + 1;
      int newTotalMinutes = state.totalFocusMinutesToday;
      final newLessonMinutes = Map<String, int>.from(state.lessonFocusMinutes);

      if (newElapsed % 60 == 0) {
        newTotalMinutes += 1;
        newLessonMinutes[state.selectedLesson] =
            (newLessonMinutes[state.selectedLesson] ?? 0) + 1;
      }

      state = state.copyWith(
        elapsedSeconds: newElapsed,
        totalFocusMinutesToday: newTotalMinutes,
        lessonFocusMinutes: newLessonMinutes,
      );
      return;
    }

    if (state.remainingSeconds > 0) {
      final newRemaining = state.remainingSeconds - 1;
      final newElapsed = state.elapsedSeconds + 1;
      int newTotalMinutes = state.totalFocusMinutesToday;
      final newLessonMinutes = Map<String, int>.from(state.lessonFocusMinutes);

      if (!state.isBreak && newElapsed > 0 && newElapsed % 60 == 0) {
        newTotalMinutes += 1;
        newLessonMinutes[state.selectedLesson] =
            (newLessonMinutes[state.selectedLesson] ?? 0) + 1;
      }

      state = state.copyWith(
        remainingSeconds: newRemaining,
        elapsedSeconds: newElapsed,
        totalFocusMinutesToday: newTotalMinutes,
        lessonFocusMinutes: newLessonMinutes,
      );

      if (newRemaining <= 0) {
        _completeCurrentPhase();
      }
    } else {
      _completeCurrentPhase();
    }
  }

  void _completeCurrentPhase() {
    _timer?.cancel();
    if (!state.isBreak) {
      // Odak oturumu tamamlandı -> Molaya geç
      state = state.copyWith(
        isRunning: false,
        isBreak: true,
        completedSessionsToday: state.completedSessionsToday + 1,
        remainingSeconds: state.customBreakMinutes * 60,
        elapsedSeconds: 0,
      );
    } else {
      // Mola bitti -> Tekrar Odak moduna dön
      state = state.copyWith(
        isRunning: false,
        isBreak: false,
        remainingSeconds: state.customFocusMinutes * 60,
        elapsedSeconds: 0,
      );
    }
  }

  void reset() {
    _timer?.cancel();
    state = state.copyWith(
      isRunning: false,
      isBreak: false,
      remainingSeconds: state.preset.isStopwatch
          ? 0
          : state.customFocusMinutes * 60,
      elapsedSeconds: 0,
    );
  }

  void switchPhase(bool toBreak) {
    _timer?.cancel();
    state = state.copyWith(
      isRunning: false,
      isBreak: toBreak,
      remainingSeconds:
          (toBreak ? state.customBreakMinutes : state.customFocusMinutes) * 60,
      elapsedSeconds: 0,
    );
  }
}

/// Global Pomodoro ve Sınav Sayacı provider'ı.
final pomodoroProvider = NotifierProvider<PomodoroNotifier, PomodoroState>(
  PomodoroNotifier.new,
);
