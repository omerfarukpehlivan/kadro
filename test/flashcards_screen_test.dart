import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/flashcards/data/models/flashcard.dart';
import 'package:kadro/features/flashcards/data/sample_flashcards.dart';
import 'package:kadro/features/flashcards/presentation/flashcards_screen.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';

void main() {
  group('TASK-81: 200 Kartlık KPSS Hap Bilgi Havuzu Doğrulama Testleri', () {
    test('sampleFlashcards tam olarak 200 adet olmalı ve ders dağılımı 50-50-50-50 olmalı', () {
      expect(sampleFlashcards.length, equals(200));

      final tarihCards = sampleFlashcards
          .where((c) => c.lesson == 'Tarih')
          .toList();
      final cografyaCards = sampleFlashcards
          .where((c) => c.lesson == 'Coğrafya')
          .toList();
      final vatandaslikCards = sampleFlashcards
          .where((c) => c.lesson == 'Vatandaşlık')
          .toList();
      final guncelCards = sampleFlashcards
          .where((c) => c.lesson == 'Güncel Bilgiler')
          .toList();

      expect(tarihCards.length, equals(50));
      expect(cografyaCards.length, equals(50));
      expect(vatandaslikCards.length, equals(50));
      expect(guncelCards.length, equals(50));

      // Tüm ID'lerin benzersiz olduğunu ve boş alan olmadığını doğrula
      final idSet = <String>{};
      for (final card in sampleFlashcards) {
        expect(card.id.trim(), isNotEmpty);
        expect(
          idSet.contains(card.id),
          isFalse,
          reason: 'Mükerrer kart ID: ${card.id}',
        );
        idSet.add(card.id);

        expect(card.topic.trim(), isNotEmpty);
        expect(card.frontText.trim(), isNotEmpty);
        expect(card.backText.trim(), isNotEmpty);
      }
    });

    test('Önemli KPSS akrostiş ve şifreleri kartlarda mevcut olmalı', () {
      final allBackTexts = sampleFlashcards
          .map((c) => c.backText)
          .join('\n---\n');

      expect(allBackTexts.contains('K-A-Y-I-P  S-A-K-A-L'), isTrue);
      expect(allBackTexts.contains('T-A-K-K-E-M'), isTrue);
      expect(allBackTexts.contains('M-İ-L-A-T'), isTrue);
      expect(allBackTexts.contains('0-3-4  B-M-V'), isTrue);
      expect(allBackTexts.contains('K-A-D-E-R'), isTrue);
      expect(allBackTexts.contains('YUSUF DİKEÇ'), isTrue);
      expect(allBackTexts.contains('ALPER GEZERAVCI'), isTrue);
    });

    testWidgets(
      'FlashcardsScreen varsayılan 200 kartla açılmalı ve her ders filtresinde 50 kart göstermeli',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          const ProviderScope(child: MaterialApp(home: FlashcardsScreen())),
        );
        await tester.pumpAndSettle();

        // Varsayılan olarak 'Tümü' seçili ve 200 kart olmalı
        expect(find.text('Kart 1 / 200'), findsOneWidget);

        // Tarih seçildiğinde 50 kart olmalı
        await tester.tap(find.widgetWithText(ChoiceChip, 'Tarih'));
        await tester.pumpAndSettle();
        expect(find.text('Kart 1 / 50'), findsOneWidget);

        // Coğrafya seçildiğinde 50 kart olmalı
        await tester.tap(find.widgetWithText(ChoiceChip, 'Coğrafya'));
        await tester.pumpAndSettle();
        expect(find.text('Kart 1 / 50'), findsOneWidget);

        // Vatandaşlık seçildiğinde 50 kart olmalı
        await tester.tap(find.widgetWithText(ChoiceChip, 'Vatandaşlık'));
        await tester.pumpAndSettle();
        expect(find.text('Kart 1 / 50'), findsOneWidget);

        // Güncel Bilgiler seçildiğinde 50 kart olmalı
        final guncelChipFinder = find.widgetWithText(
          ChoiceChip,
          'Güncel Bilgiler',
        );
        await tester.drag(find.byType(Scrollable).first, const Offset(-200, 0));
        await tester.pumpAndSettle();
        await tester.tap(guncelChipFinder);
        await tester.pumpAndSettle();
        expect(find.text('Kart 1 / 50'), findsOneWidget);
      },
    );
  });

  group('FlashcardsScreen Widget Testleri', () {
    const testCards = [
      Flashcard(
        id: 'fc_1',
        lesson: 'Tarih',
        topic: 'İlk Türk Devletleri',
        frontText: 'İlk Türk devletlerinde hükümdara yönetme yetkisi kim tarafından verilir?',
        backText: 'KUT İNANCI: Gök Tanrı tarafından verildiğine inanılır.',
      ),
      Flashcard(
        id: 'fc_2',
        lesson: 'Coğrafya',
        topic: 'Dağlar',
        frontText: 'Türkiye\'nin en yüksek dağı hangisidir?',
        backText: 'AĞRI DAĞI (5.137 m) - Volkanik dağdır.',
      ),
    ];

    testWidgets(
      'İlk açılışta ön yüz görünmeli, karta dokunulunca arka yüz açılmalı',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          const MaterialApp(home: FlashcardsScreen(flashcards: testCards)),
        );

        // İlk açılışta ön yüz görünmeli
        expect(find.text('Kart 1 / 2'), findsOneWidget);
        expect(find.text('SORU / KAVRAM'), findsOneWidget);
        expect(
          find.text(
            'İlk Türk devletlerinde hükümdara yönetme yetkisi kim tarafından verilir?',
          ),
          findsOneWidget,
        );
        expect(find.text('HAP BİLGİ'), findsNothing);

        // Karta dokun
        await tester.tap(find.byKey(const ValueKey('flashcard_flip_detector')));
        await tester.pumpAndSettle();

        // Arka yüz açılmalı
        expect(find.text('HAP BİLGİ'), findsOneWidget);
        expect(
          find.text('KUT İNANCI: Gök Tanrı tarafından verildiğine inanılır.'),
          findsOneWidget,
        );

        // Tekrar dokunulunca ön yüze dönmeli
        await tester.tap(find.byKey(const ValueKey('flashcard_flip_detector')));
        await tester.pumpAndSettle();

        expect(find.text('SORU / KAVRAM'), findsOneWidget);
      },
    );

    testWidgets(
      'Biliyorum ve Tekrar Et butonları kart ilerlemesini ve özet ekranını sağlamalı',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          const MaterialApp(home: FlashcardsScreen(flashcards: testCards)),
        );

        // 1. Kartta 'Biliyorum' butonuna bas
        await tester.tap(find.widgetWithText(FilledButton, 'Biliyorum'));
        await tester.pumpAndSettle();

        // 2. Karta geçtiğini doğrula
        expect(find.text('Kart 2 / 2'), findsOneWidget);
        expect(
          find.text('Türkiye\'nin en yüksek dağı hangisidir?'),
          findsOneWidget,
        );

        // 2. Kartta 'Tekrar Et' butonuna bas
        await tester.tap(find.widgetWithText(OutlinedButton, 'Tekrar Et'));
        await tester.pumpAndSettle();

        // Tüm kartlar bitince Özet Ekranı açılmalı
        expect(find.text('Tebrikler!'), findsOneWidget);
        expect(find.text('2 Kart'), findsOneWidget);
        expect(find.text('Öğrenildi'), findsOneWidget);
        expect(find.text('Tekrar Edilecek'), findsOneWidget);
        expect(find.text('Yeniden Başla'), findsOneWidget);
        expect(find.text('Ana Sayfaya Dön'), findsOneWidget);

        // Yeniden Başla'ya basıldığında başa dönmeli
        await tester.tap(find.widgetWithText(OutlinedButton, 'Yeniden Başla'));
        await tester.pumpAndSettle();

        expect(find.text('Kart 1 / 2'), findsOneWidget);
        expect(find.text('SORU / KAVRAM'), findsOneWidget);
      },
    );

    testWidgets(
      'Ders filtre şeridinde seçim yapılınca yalnızca seçilen dersin kartları gelmeli ve boş durumda uyarı gösterilmeli',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          const MaterialApp(home: FlashcardsScreen(flashcards: testCards)),
        );

        // Filtre çiplerinin varlığını doğrula
        expect(find.widgetWithText(ChoiceChip, 'Tümü'), findsOneWidget);
        expect(find.widgetWithText(ChoiceChip, 'Tarih'), findsOneWidget);
        expect(find.widgetWithText(ChoiceChip, 'Coğrafya'), findsOneWidget);
        expect(find.widgetWithText(ChoiceChip, 'Vatandaşlık'), findsOneWidget);
        expect(
          find.widgetWithText(ChoiceChip, 'Güncel Bilgiler'),
          findsOneWidget,
        );

        // 'Coğrafya' çipine dokun
        await tester.tap(find.widgetWithText(ChoiceChip, 'Coğrafya'));
        await tester.pumpAndSettle();

        // Sadece 1 Coğrafya kartı olmalı
        expect(find.text('Kart 1 / 1'), findsOneWidget);
        expect(
          find.text('Türkiye\'nin en yüksek dağı hangisidir?'),
          findsOneWidget,
        );

        // 'Vatandaşlık' çipine dokun (test verisinde yok)
        await tester.tap(find.widgetWithText(ChoiceChip, 'Vatandaşlık'));
        await tester.pumpAndSettle();

        // Boş durum kartı görünmeli
        expect(
          find.text('Vatandaşlık için henüz kart bulunmuyor'),
          findsOneWidget,
        );

        // Tekrar 'Tümü' seç
        await tester.tap(find.widgetWithText(ChoiceChip, 'Tümü'));
        await tester.pumpAndSettle();

        expect(find.text('Kart 1 / 2'), findsOneWidget);
      },
    );

    testWidgets(
      'Biliyorum butonuna basıldığında studyStatsProvider üzerinden XP ve soru istatistiği kaydedilmeli',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        final container = ProviderContainer();
        addTearDown(container.dispose);

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(
              home: FlashcardsScreen(flashcards: testCards),
            ),
          ),
        );

        expect(container.read(studyStatsProvider).totalSolved, equals(0));
        expect(container.read(studyStatsProvider).totalXp, equals(0));

        // 1. Kartta 'Biliyorum' tıkla
        await tester.tap(find.widgetWithText(FilledButton, 'Biliyorum'));
        await tester.pumpAndSettle();

        // 1 doğru cevap ve +15 XP kazanılmış olmalı
        final stats = container.read(studyStatsProvider);
        expect(stats.totalSolved, equals(1));
        expect(stats.totalCorrect, equals(1));
        expect(stats.totalXp, equals(15));
        expect(stats.correctByLesson['Tarih'], equals(1));
      },
    );
  });
}
