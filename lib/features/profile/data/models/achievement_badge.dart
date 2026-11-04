import 'package:flutter/material.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Memur adayının motivasyonunu ve çalışma istikrarını artıran
/// Duolingo/UWorld stili KPSS Başarı Madalyası modeli.
///
/// Web/Angular Karşılığı: Gamification Badge / Achievement DTO.
class AchievementBadge {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final bool isUnlocked;
  final String progressText;

  const AchievementBadge({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.isUnlocked,
    required this.progressText,
  });

  /// Kullanıcının mevcut [StudyStatsState] verilerine göre 6 temel KPSS madalyasının
  /// kilit ve ilerleme durumlarını hesaplar.
  static List<AchievementBadge> calculateBadges(StudyStatsState stats) {
    // 1. İlk Pençe (En az 1 test veya soru çözülmüş mü?)
    final hasSolvedFirst =
        stats.totalSolved > 0 || stats.sessionHistory.isNotEmpty;

    // 2. Net Sıçratıcı (%80+ başarı oranı ve en az 10 soru çözümü)
    final hasHighAccuracy =
        stats.totalSolved >= 10 && stats.accuracyPercent >= 80;

    // 3. Seri Canavarı (Aralıksız 7 gün çalışma serisi)
    final streakDays = stats.streakDays;
    final hasWeekStreak = streakDays >= 7;

    // 4. Tarih Fatihi (En az 50 Tarih sorusu)
    final tarihSolved = stats.solvedByLesson['Tarih'] ?? 0;
    final hasTarihMastery = tarihSolved >= 50;

    // 5. Gece Kuşu (Saat 22:00 - 05:00 arasında oturum tamamlanmış mı?)
    final hasNightStudy = stats.sessionHistory.any((s) {
      final hour = s.completedAt.hour;
      return hour >= 22 || hour < 5;
    });

    // 6. Mayın Temizleyici (En az 5 doğru soru)
    final correctCount = stats.totalCorrect;
    final hasTrapMaster = correctCount >= 5;

    return [
      AchievementBadge(
        id: 'first_claw',
        title: '🌱 İlk Pençe',
        description: 'İlk KPSS konu testini başarıyla tamamla.',
        icon: LucideIcons.footprints,
        isUnlocked: hasSolvedFirst,
        progressText: hasSolvedFirst
            ? 'Kazanıldı'
            : '${stats.totalSolved}/1 Soru',
      ),
      AchievementBadge(
        id: 'accuracy_jump',
        title: '⚡ Net Sıçratıcı',
        description: 'En az 10 soruluk bir testte %80 ve üzeri başarı yakala.',
        icon: LucideIcons.zap,
        isUnlocked: hasHighAccuracy,
        progressText: hasHighAccuracy
            ? 'Kazanıldı'
            : '%${stats.accuracyPercent} Başarı',
      ),
      AchievementBadge(
        id: 'streak_monster',
        title: '🔥 Seri Canavarı',
        description: 'Aralıksız 7 gün soru çözerek haftalık seriyi tamamla.',
        icon: LucideIcons.flame,
        isUnlocked: hasWeekStreak,
        progressText: hasWeekStreak ? 'Kazanıldı' : '$streakDays/7 Gün',
      ),
      AchievementBadge(
        id: 'history_conqueror',
        title: '🏛️ Tarih Fatihi',
        description: 'Genel Kültür lokomotifi Tarih dersinden 50 soru çöz.',
        icon: LucideIcons.landmark,
        isUnlocked: hasTarihMastery,
        progressText: hasTarihMastery ? 'Kazanıldı' : '$tarihSolved/50 Soru',
      ),
      AchievementBadge(
        id: 'night_owl',
        title: '🌙 Gece Kuşu',
        description: 'Saat 22:00\'den sonra sessiz saatlerde soru çöz.',
        icon: LucideIcons.moon,
        isUnlocked: hasNightStudy,
        progressText: hasNightStudy ? 'Kazanıldı' : '22:00 Sonrası',
      ),
      AchievementBadge(
        id: 'trap_defuser',
        title: '🛡️ Mayın Temizleyici',
        description: 'ÖSYM çeldirici tuzaklarını aşarak en az 5 doğru yap.',
        icon: LucideIcons.shieldCheck,
        isUnlocked: hasTrapMaster,
        progressText: hasTrapMaster ? 'Kazanıldı' : '$correctCount/5 Doğru',
      ),
    ];
  }
}

/// [AchievementBadge.calculateBadges] için üst düzey yardımcı fonksiyon.
List<AchievementBadge> calculateBadges(StudyStatsState stats) =>
    AchievementBadge.calculateBadges(stats);
