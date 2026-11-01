import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/core/config/supabase_config.dart';
import 'package:kadro/features/stats/data/cloud_sync_repository.dart';
import 'package:kadro/features/stats/data/models/quiz_session_record.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';

void main() {
  group('CloudSyncRepository ve Supabase Entegrasyon Testleri', () {
    const repository = CloudSyncRepository();

    test('Supabase başlatılmamışken (offline) CloudSyncRepository güvenli çalışmalı', () async {
      // Test ortamında Supabase hazır değildir
      expect(SupabaseConfig.isReady, isFalse);

      final session = QuizSessionRecord(
        id: 'test_session_1',
        title: 'Tarih Testi 1',
        lesson: 'Tarih',
        totalQuestions: 10,
        correctCount: 8,
        wrongCount: 2,
        emptyCount: 0,
        netScore: 7.5,
        earnedXp: 130,
        durationSeconds: 180,
        completedAt: DateTime.now(),
      );

      // Metotların hata fırlatmadan (offline-safe) sessizce tamamlandığını doğrula
      await expectLater(repository.saveQuizSession(session), completes);

      await expectLater(
        repository.saveQuestionAttempt(
          questionText: 'İlk Türk devletlerinde hükümdarlık sembolleri...',
          lesson: 'Tarih',
          topic: 'İlk Türk Devletleri',
          isCorrect: true,
          timeSpentSeconds: 25,
        ),
        completes,
      );

      await expectLater(
        repository.syncProfileStats(
          totalXp: 150,
          leagueTier: 'Gümüş Kadro',
          dailyGoalQuestions: 30,
        ),
        completes,
      );

      final history = await repository.fetchSessionHistory();
      expect(history, isEmpty);
    });

    test('StudyStatsNotifier bulut senkronizasyonu offline modda yerel state ile çalışır', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final statsNotifier = container.read(studyStatsProvider.notifier);

      expect(container.read(studyStatsProvider).totalSolved, 0);
      expect(container.read(studyStatsProvider).totalXp, 0);

      // recordAnswer çağrısı hem yerel state'i günceller hem de cloud sync'i tetikler
      statsNotifier.recordAnswer(
        lesson: 'Coğrafya',
        topic: 'Türkiye Fiziki',
        questionText: 'Karstik şekiller en çok nerede görülür?',
        isCorrect: true,
        timeSpentSeconds: 20,
      );

      expect(container.read(studyStatsProvider).totalSolved, 1);
      expect(container.read(studyStatsProvider).totalCorrect, 1);
      expect(container.read(studyStatsProvider).totalXp, 15);

      // QuizSession kaydı
      final session = QuizSessionRecord(
        id: 'quiz_123',
        title: 'Coğrafya Genel Test',
        lesson: 'Coğrafya',
        totalQuestions: 5,
        correctCount: 4,
        wrongCount: 1,
        emptyCount: 0,
        netScore: 3.75,
        earnedXp: 65,
        durationSeconds: 100,
        completedAt: DateTime.now(),
      );

      statsNotifier.recordQuizSession(session);
      expect(container.read(studyStatsProvider).totalXp, 15 + 65);
      expect(container.read(studyStatsProvider).sessionHistory.length, 1);

      // loadFromCloud çağrısı offline modda yerel durumu bozmamalı
      await statsNotifier.loadFromCloud();
      expect(container.read(studyStatsProvider).sessionHistory.length, 1);
    });
  });
}
