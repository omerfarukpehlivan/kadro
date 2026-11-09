import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/core/network/client_rate_limiter.dart';
import 'package:kadro/features/quiz/data/question_repository.dart';
import 'package:kadro/features/reports/data/models/question_report.dart';
import 'package:kadro/features/reports/data/question_report_repository.dart';
import 'package:kadro/features/stats/data/cloud_sync_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Kadro Güvenlik, Rate-Limiting ve Performans Testleri (TASK-89 - TASK-92)', () {
    setUp(() {
      ClientRateLimiter.instance.reset();
      QuestionRepository.clearCacheForTest();
      CloudSyncRepository.clearQueueForTest();
    });

    test(
      'ClientRateLimiter sliding window kuralına göre aşırı istekleri engeller',
      () {
        const actionKey = 'test_spam_action';

        // 1 dakikada max 3 isteğe izin ver
        expect(
          ClientRateLimiter.instance.checkAndRecord(
            actionKey,
            maxRequests: 3,
            window: const Duration(minutes: 1),
          ),
          isTrue,
        );
        expect(
          ClientRateLimiter.instance.checkAndRecord(
            actionKey,
            maxRequests: 3,
            window: const Duration(minutes: 1),
          ),
          isTrue,
        );
        expect(
          ClientRateLimiter.instance.checkAndRecord(
            actionKey,
            maxRequests: 3,
            window: const Duration(minutes: 1),
          ),
          isTrue,
        );

        // 4. istek kalkan tarafından reddedilmeli
        expect(
          ClientRateLimiter.instance.checkAndRecord(
            actionKey,
            maxRequests: 3,
            window: const Duration(minutes: 1),
          ),
          isFalse,
        );

        // Reset sonrası tekrar izin verilmeli
        ClientRateLimiter.instance.reset(actionKey);
        expect(
          ClientRateLimiter.instance.checkAndRecord(
            actionKey,
            maxRequests: 3,
            window: const Duration(minutes: 1),
          ),
          isTrue,
        );
      },
    );

    test('QuestionReportRepository 1 dakikada 3 rapordan fazlasına izin vermez (Anti-Spam)', () async {
      const repo = QuestionReportRepository();
      repo.clearForTest();

      QuestionReport createDummyReport(int idx) => QuestionReport(
        id: 'rep_$idx',
        questionId: 'q_$idx',
        lesson: 'Tarih',
        topic: 'İlk Türk Devletleri',
        testTitle: 'Test 1',
        questionText: 'Soru metni $idx',
        reason: 'Cevap anahtarı hatalı',
        createdAt: DateTime.now(),
      );

      // İlk 3 rapor başarıyla kabul edilmeli
      expect(await repo.submitReport(createDummyReport(1)), isTrue);
      expect(await repo.submitReport(createDummyReport(2)), isTrue);
      expect(await repo.submitReport(createDummyReport(3)), isTrue);

      // 4. rapor rate limit kalkanına çarpmalı ve reddedilmeli (false)
      expect(await repo.submitReport(createDummyReport(4)), isFalse);
    });

    test(
      'CloudSyncRepository soru loglarını toplu kuyruklar ve güvenle boşaltır',
      () async {
        const repo = CloudSyncRepository();

        // Kuyruğa birden fazla soru analitiği ekle
        for (var i = 0; i < 5; i++) {
          await repo.saveQuestionAttempt(
            questionText: 'Soru $i',
            lesson: 'Tarih',
            topic: 'Osmanlı',
            isCorrect: true,
            timeSpentSeconds: 20,
          );
        }

        // Toplu boşaltım (flush) hata vermeden tamamlanmalı
        await expectLater(repo.flushQuestionAttempts(), completes);
      },
    );

    test('QuestionRepository bellek içi önbellek (TTL Caching) tekrarlanan istekleri anında döner', () async {
      const repo = QuestionRepository();
      QuestionRepository.clearCacheForTest();

      // İlk yükleme (yerel veya bulut)
      final firstFetch = await repo.fetchQuestions(lesson: 'Tarih');
      expect(firstFetch, isNotEmpty);

      // İkinci yükleme önbellekten gelmeli
      final secondFetch = await repo.fetchQuestions(lesson: 'Tarih');
      expect(identical(firstFetch, secondFetch), isTrue);

      // forceRefresh istendiğinde yeni liste üretilmeli
      final thirdFetch = await repo.fetchQuestions(
        lesson: 'Tarih',
        forceRefresh: true,
      );
      expect(thirdFetch, isNotEmpty);
    });
  });
}
