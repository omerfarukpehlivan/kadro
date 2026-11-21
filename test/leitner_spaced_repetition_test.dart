import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/core/services/local_storage_service.dart';
import 'package:kadro/core/utils/leitner_scheduler.dart';
import 'package:kadro/features/flashcards/data/flashcard_review_repository.dart';
import 'package:kadro/features/flashcards/data/models/flashcard.dart';
import 'package:kadro/features/flashcards/data/sample_flashcards.dart';
import 'package:kadro/features/flashcards/presentation/flashcards_screen.dart';
import 'package:kadro/features/home/presentation/home_screen.dart';
import 'package:kadro/features/mistakes/data/mistake_repository.dart';
import 'package:kadro/features/mistakes/presentation/mistakes_screen.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const mistakeRepo = MistakeRepository();
  const flashcardReviewRepo = FlashcardReviewRepository();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    mistakeRepo.clearForTest();
    flashcardReviewRepo.clearForTest();
  });

  tearDown(() {
    mistakeRepo.clearForTest();
    flashcardReviewRepo.clearForTest();
  });

  group('TASK-158: LeitnerScheduler ve Veri Migrasyonu Birim Testleri', () {
    test('Leitner 1·3·7·14 gün kutu geçişleri, Kutu-4 çift onay mezuniyeti ve yanlışta Kutu-1 dönüşü doğru çalışmalı', () {
      final base = DateTime(2026, 11, 18, 10, 0);

      // Kutu 1 -> Kutu 2 (+3 gün)
      final toBox2 = LeitnerScheduler.advance(
        currentBox: 1,
        currentBox4Streak: 0,
        isCorrect: true,
        now: base,
      );
      expect(toBox2.reviewBox, 2);
      expect(toBox2.nextReviewAt, base.add(const Duration(days: 3)));
      expect(toBox2.isGraduated, isFalse);

      // Kutu 2 -> Kutu 3 (+7 gün)
      final toBox3 = LeitnerScheduler.advance(
        currentBox: 2,
        currentBox4Streak: 0,
        isCorrect: true,
        now: base,
      );
      expect(toBox3.reviewBox, 3);
      expect(toBox3.nextReviewAt, base.add(const Duration(days: 7)));
      expect(toBox3.isGraduated, isFalse);

      // Kutu 3 -> Kutu 4 (+14 gün)
      final toBox4 = LeitnerScheduler.advance(
        currentBox: 3,
        currentBox4Streak: 0,
        isCorrect: true,
        now: base,
      );
      expect(toBox4.reviewBox, 4);
      expect(toBox4.nextReviewAt, base.add(const Duration(days: 14)));
      expect(toBox4.isGraduated, isFalse);

      // Kutu 4 ilk doğru -> henüz mezun değil (streak = 1, +14 gün)
      final box4FirstHit = LeitnerScheduler.advance(
        currentBox: 4,
        currentBox4Streak: 0,
        isCorrect: true,
        now: base,
      );
      expect(box4FirstHit.reviewBox, 4);
      expect(box4FirstHit.box4ConsecutiveCorrect, 1);
      expect(box4FirstHit.isGraduated, isFalse);

      // Kutu 4 ikinci üst üste doğru -> mezun (streak = 2)
      final box4Graduated = LeitnerScheduler.advance(
        currentBox: 4,
        currentBox4Streak: 1,
        isCorrect: true,
        now: base,
      );
      expect(box4Graduated.isGraduated, isTrue);

      // Yanlış cevap her kutudan Kutu 1 (+1 gün) seviyesine döndürmeli
      final demoted = LeitnerScheduler.advance(
        currentBox: 4,
        currentBox4Streak: 1,
        isCorrect: false,
        now: base,
      );
      expect(demoted.reviewBox, 1);
      expect(demoted.box4ConsecutiveCorrect, 0);
      expect(demoted.nextReviewAt, base.add(const Duration(days: 1)));
      expect(demoted.isGraduated, isFalse);
    });

    test('LocalStorageService eski düz List<Question> JSON formatını Kutu 1 Leitner kaydı olarak göç etmeli', () async {
      const legacyQuestion = Question(
        id: 'legacy_q1',
        lesson: 'Tarih',
        topic: 'Kurtuluş Savaşı',
        text: 'Eski düz format sorusu',
        options: ['A', 'B', 'C', 'D', 'E'],
        correctIndex: 0,
        explanation: 'Açıklama',
      );

      SharedPreferences.setMockInitialValues({
        'kadro_mistakes': jsonEncode([legacyQuestion.toJson()]),
      });

      final storage = LocalStorageService();
      final entries = await storage.loadMistakeEntries();

      expect(entries.length, 1);
      expect(entries.first.question.id, 'legacy_q1');
      expect(entries.first.reviewBox, 1);
      expect(entries.first.isDue(), isTrue);

      // Yeni format yazma-okuma doğrulaması
      final upgraded = entries.first.copyWith(
        reviewBox: 3,
        nextReviewAt: DateTime(2026, 11, 25),
      );
      await storage.saveMistakeEntries([upgraded]);
      final reloaded = await storage.loadMistakeEntries();
      expect(reloaded.first.reviewBox, 3);
      expect(reloaded.first.nextReviewAt, DateTime(2026, 11, 25));
    });

    test('MistakeRepository recordReviewOutcome Kutu 1 -> 2 -> 3 -> 4 -> Mezuniyet akışını yönetmeli', () {
      final t0 = DateTime(2026, 11, 18, 9, 0);
      const q = Question(
        id: 'leitner_m1',
        lesson: 'Coğrafya',
        topic: 'İklim',
        text: 'Leitner sorusu',
        options: ['Doğru', 'B', 'C', 'D', 'E'],
        correctIndex: 0,
        explanation: 'Açıklama',
      );

      mistakeRepo.addMistake(q, now: t0);
      expect(mistakeRepo.getDueEntries(now: t0).length, 1);

      // 1. doğru -> Kutu 2 (+3 gün), t0'da kuyruktan düşer
      final r1 = mistakeRepo.recordReviewOutcome(
        q.id,
        isCorrect: true,
        now: t0,
      );
      expect(r1?.reviewBox, 2);
      expect(mistakeRepo.getDueEntries(now: t0), isEmpty);
      expect(
        mistakeRepo.getDueEntries(now: t0.add(const Duration(days: 3))).length,
        1,
      );

      // +3 gün sonra Kutu 2 -> Kutu 3
      final t1 = t0.add(const Duration(days: 3));
      final r2 = mistakeRepo.recordReviewOutcome(
        q.id,
        isCorrect: true,
        now: t1,
      );
      expect(r2?.reviewBox, 3);

      // +7 gün sonra Kutu 3 -> Kutu 4
      final t2 = t1.add(const Duration(days: 7));
      final r3 = mistakeRepo.recordReviewOutcome(
        q.id,
        isCorrect: true,
        now: t2,
      );
      expect(r3?.reviewBox, 4);

      // +14 gün sonra Kutu 4 1. onay -> henüz listede kalır
      final t3 = t2.add(const Duration(days: 14));
      final r4 = mistakeRepo.recordReviewOutcome(
        q.id,
        isCorrect: true,
        now: t3,
      );
      expect(r4?.isGraduated, isFalse);
      expect(mistakeRepo.entryFor(q.id)?.box4ConsecutiveCorrect, 1);

      // +14 gün sonra Kutu 4 2. onay -> mezun olup listeden düşer
      final t4 = t3.add(const Duration(days: 14));
      final r5 = mistakeRepo.recordReviewOutcome(
        q.id,
        isCorrect: true,
        now: t4,
      );
      expect(r5?.isGraduated, isTrue);
      expect(mistakeRepo.getMistakes(), isEmpty);
    });
  });

  group('TASK-158: Leitner UI Entegrasyon & Responsive Testleri', () {
    testWidgets(
      'MistakesScreen günlük Leitner tekrar kuyruğunu gösterir ve tekrarı başlatır',
      (WidgetTester tester) async {
        for (final size in const [Size(360, 640), Size(1280, 800)]) {
          tester.view.physicalSize = size;
          tester.view.devicePixelRatio = 1.0;

          mistakeRepo.clearForTest();
          mistakeRepo.addMistake(
            const Question(
              id: 'ui_m1',
              lesson: 'Tarih',
              topic: 'İlk Türk Devletleri',
              text: 'Leitner UI test sorusu',
              options: ['A', 'B', 'C', 'D', 'E'],
              correctIndex: 0,
              explanation: 'Açıklama',
            ),
          );

          await tester.pumpWidget(
            const ProviderScope(child: MaterialApp(home: MistakesScreen())),
          );
          await tester.pumpAndSettle();

          expect(
            find.text('Bugün Tekrar Etmen Gereken 1 Soru'),
            findsOneWidget,
          );
          expect(find.textContaining('Kutu 1 · 1g'), findsOneWidget);
          expect(tester.takeException(), isNull);
        }

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.tap(
          find.byKey(const ValueKey('mistakes_start_due_review_button')),
        );
        await tester.pumpAndSettle();

        expect(find.byType(QuizScreen), findsOneWidget);
        expect(find.text('Günlük Leitner Tekrarı (1 Soru)'), findsOneWidget);
      },
    );

    testWidgets(
      'FlashcardsScreen vadesi gelen kart filtresini (Bugün Tekrar) uygular ve kutu günceller',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1280, 800);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        const cards = [
          Flashcard(
            id: 'fc_due_1',
            lesson: 'Tarih',
            topic: 'Osmanlı',
            frontText: 'Vadesi gelen kart sorusu',
            backText: 'Vadesi gelen kart cevabı',
          ),
          Flashcard(
            id: 'fc_future_2',
            lesson: 'Tarih',
            topic: 'İnkılap',
            frontText: 'Gelecek hafta çıkacak kart',
            backText: 'Gelecek hafta cevabı',
          ),
        ];

        final pastNow = DateTime.now().subtract(const Duration(days: 2));
        flashcardReviewRepo.recordOutcome(
          cards.first,
          isLearned: false,
          examScope: 'lisans_gk',
          now: pastNow,
        );
        flashcardReviewRepo.recordOutcome(
          cards.last,
          isLearned: true,
          examScope: 'lisans_gk',
        );

        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(home: FlashcardsScreen(flashcards: cards)),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Bugün Tekrar (1)'), findsOneWidget);

        await tester.tap(
          find.byKey(const ValueKey('flashcards_due_only_chip')),
        );
        await tester.pumpAndSettle();

        expect(find.text('Kart 1 / 1'), findsOneWidget);
        expect(find.text('Vadesi gelen kart sorusu'), findsOneWidget);

        // 'Biliyorum' diyerek Kutu 2'ye (+3 gün) geçir
        await tester.tap(find.widgetWithText(FilledButton, 'Biliyorum'));
        await tester.pumpAndSettle();

        expect(
          flashcardReviewRepo.progressFor('fc_due_1')?.reviewBox,
          equals(2),
        );
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'HomeScreen üzerinde vadesi gelen soru/kart varsa Bugün Tekrar Etmen Gereken banner görünür',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1280, 800);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        mistakeRepo.addMistake(
          const Question(
            id: 'home_due_q',
            lesson: 'Tarih',
            topic: 'Beylikler',
            text: 'Home kuyruk sorusu',
            options: ['A', 'B', 'C', 'D', 'E'],
            correctIndex: 0,
            explanation: 'Açıklama',
          ),
        );

        final dueCard = sampleFlashcards.first;
        flashcardReviewRepo.recordOutcome(
          dueCard,
          isLearned: false,
          examScope: 'lisans_gk',
          now: DateTime.now().subtract(const Duration(days: 2)),
        );

        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(home: Scaffold(body: HomeScreen())),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Bugün Tekrar Etmen Gereken 2 Öğe'), findsOneWidget);
        expect(find.text('Sorular (1)'), findsOneWidget);
        expect(find.text('Kartlar (1)'), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );
  });
}
