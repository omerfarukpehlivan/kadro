import 'package:kadro/features/pomodoro/data/pomodoro_notifier.dart';

/// Otomatik KPSS Çalışma Programı Tempo Türleri.
///
/// Web/Angular Karşılığı: Study pace strategy enum.
enum StudyProgramPace {
  hafif(
    label: 'Hafif Tempo',
    subtitle: 'Sindirerek & Zamana Yayarak',
    dailyGoalQuestions: 25,
    estimatedMinutesPerDay: 35,
    tasksPerDay: 2,
    badgeText: '2 Görev / Gün',
    description: 'Sınava uzun vade varken veya çalışan adaylar için günde 1-2 odak göreviyle konuları sindirerek bitirir.',
  ),
  orta(
    label: 'Orta Tempo (Önerilen)',
    subtitle: 'Dengeli & Düzenli Rutin',
    dailyGoalQuestions: 45,
    estimatedMinutesPerDay: 55,
    tasksPerDay: 3,
    badgeText: '3 Görev / Gün',
    description: 'KPSS Lisans ve Ön Lisans için ideal ritim. Her gün konu testi, hap kart tekrarı ve pekiştirme içerir.',
  ),
  hizli(
    label: 'Hızlı Tempo (Kamp Modu)',
    subtitle: 'Yoğun & Derece Hedefi',
    dailyGoalQuestions: 85,
    estimatedMinutesPerDay: 90,
    tasksPerDay: 4,
    badgeText: '4-5 Görev / Gün',
    description: 'Günde çift konu testi, mini denemeler, yanlış defteri temizliği ve tam odaklı KPSS sprint maratonu.',
  );

  final String label;
  final String subtitle;
  final int dailyGoalQuestions;
  final int estimatedMinutesPerDay;
  final int tasksPerDay;
  final String badgeText;
  final String description;

  const StudyProgramPace({
    required this.label,
    required this.subtitle,
    required this.dailyGoalQuestions,
    required this.estimatedMinutesPerDay,
    required this.tasksPerDay,
    required this.badgeText,
    required this.description,
  });

  /// Enum anahtarından (name) StudyProgramPace örneği türetir.
  static StudyProgramPace fromKey(String? key) {
    if (key == null) return StudyProgramPace.orta;
    return StudyProgramPace.values.firstWhere(
      (e) => e.name == key,
      orElse: () => StudyProgramPace.orta,
    );
  }

  /// Sınava kalan süreye göre programın müfredatı kaç günde bitireceğini ve kaç tur atacağını hesaplar.
  String calculatePacingSummary(KpssExamTarget target) {
    final remainingDays = target.remainingDays().clamp(1, 9999);
    // Toplam 23 ana müfredat modülü (Tarih: 9, Coğrafya: 7, Vatandaşlık: 5, Güncel: 2)
    const totalModules = 23;

    int daysPerTour;
    switch (this) {
      case StudyProgramPace.hafif:
        daysPerTour = totalModules * 2; // 46 gün (Her konuya 2 gün)
        break;
      case StudyProgramPace.orta:
        daysPerTour = (totalModules * 1.3)
            .round(); // ~30 gün (Her gün 1 modül + karma test)
        break;
      case StudyProgramPace.hizli:
        daysPerTour = (totalModules * 0.7)
            .round(); // ~16 gün (Günde 1.5 - 2 modül sprint)
        break;
    }

    final potentialTours = (remainingDays / daysPerTour).floor().clamp(1, 15);

    return '$remainingDays gün kala: 1. Tur konu bitirme ~$daysPerTour gün sürer; sınava kadar ~$potentialTours tam tur tamamlanabilir.';
  }
}
