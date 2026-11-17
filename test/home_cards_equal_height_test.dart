import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/practice/presentation/practice_hub_screen.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';

void main() {
  testWidgets(
    'PracticeHubScreen Çalışma türleri yan yana eşit boyda ve justify-between hizalı olmalı',
    (tester) async {
      tester.view.physicalSize = const Size(800, 1600);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(home: Scaffold(body: PracticeHubScreen())),
        ),
      );
      await tester.pumpAndSettle();

      // 1. Birincil Satır: "Konu testi" ve "Deneme sınavı" kartlarının boyutlarını al
      final konuTestiCard = find.ancestor(
        of: find.text('Konu testi'),
        matching: find.byType(TactileCard),
      );
      final denemeSinaviCard = find.ancestor(
        of: find.text('Deneme sınavı'),
        matching: find.byType(TactileCard),
      );

      expect(konuTestiCard, findsOneWidget);
      expect(denemeSinaviCard, findsOneWidget);

      final konuTestiSize = tester.getSize(konuTestiCard);
      final denemeSinaviSize = tester.getSize(denemeSinaviCard);

      expect(
        konuTestiSize.height,
        equals(denemeSinaviSize.height),
        reason:
            'Konu testi ve Deneme sınavı kartları aynı yükseklikte olmalıdır',
      );

      // Alt aksiyon "Başla" satırlarının dikey (Y) hizası eşit olmalı (justify-between doğrulaması)
      final konuTestiAction = find.descendant(
        of: konuTestiCard,
        matching: find.text('Başla'),
      );
      final denemeSinaviAction = find.descendant(
        of: denemeSinaviCard,
        matching: find.text('Başla'),
      );

      expect(
        tester.getBottomLeft(konuTestiAction).dy,
        equals(tester.getBottomLeft(denemeSinaviAction).dy),
        reason: 'Konu testi ve Deneme sınavı kartlarının "Başla" butonları alt çizgide tam hizalı olmalıdır',
      );

      // 2. Araçlar & Hızlı Tekrar kartları aynı yatay genişlikte hizalanmalı
      final mapTool = find.ancestor(
        of: find.text('Harita Atölyesi'),
        matching: find.byType(TactileCard),
      );
      final blitzTool = find.ancestor(
        of: find.text('60 Saniyede Doğru / Yanlış'),
        matching: find.byType(TactileCard),
      );
      final scoreCalcTool = find.ancestor(
        of: find.text('KPSS Puan Hesaplama'),
        matching: find.byType(TactileCard),
      );

      expect(mapTool, findsOneWidget);
      expect(blitzTool, findsOneWidget);
      expect(scoreCalcTool, findsOneWidget);

      expect(
        tester.getSize(mapTool).width,
        equals(tester.getSize(blitzTool).width),
      );
      expect(
        tester.getSize(blitzTool).width,
        equals(tester.getSize(scoreCalcTool).width),
      );
      expect(tester.takeException(), isNull);
    },
  );
}
