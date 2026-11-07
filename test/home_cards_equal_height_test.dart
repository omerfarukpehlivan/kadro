import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/practice/presentation/practice_hub_screen.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';

void main() {
  testWidgets(
    'PracticeHubScreen Çalışma türleri ve Mini Oyunlar kartları yan yana eşit boyda ve justify-between hizalı olmalı',
    (tester) async {
      // 1. Ekran boyutunu geniş ve uzun tutarak ListView'deki tüm kartların görünmesini sağla
      tester.view.physicalSize = const Size(800, 1600);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(home: Scaffold(body: PracticeHubScreen())),
        ),
      );
      await tester.pumpAndSettle();

      // 1. Satır: "Konu testi" ve "Bilgi kartları" kartlarının boyutlarını al
      final konuTestiCard = find.ancestor(
        of: find.text('Konu testi'),
        matching: find.byType(TactileCard),
      );
      final bilgiKartlariCard = find.ancestor(
        of: find.text('Bilgi kartları'),
        matching: find.byType(TactileCard),
      );

      expect(konuTestiCard, findsOneWidget);
      expect(bilgiKartlariCard, findsOneWidget);

      final konuTestiSize = tester.getSize(konuTestiCard);
      final bilgiKartlariSize = tester.getSize(bilgiKartlariCard);

      // Kartların yükseklikleri eşit olmalı
      expect(
        konuTestiSize.height,
        equals(bilgiKartlariSize.height),
        reason:
            'Konu testi ve Bilgi kartları kartları aynı yükseklikte olmalıdır',
      );

      // 2. Satır: "Yanlış defteri" ve "Deneme sınavı" kartlarının boyutlarını al
      final yanlisDefteriCard = find.ancestor(
        of: find.text('Yanlış defteri'),
        matching: find.byType(TactileCard),
      );
      final denemeSinaviCard = find.ancestor(
        of: find.text('Deneme sınavı'),
        matching: find.byType(TactileCard),
      );

      expect(yanlisDefteriCard, findsOneWidget);
      expect(denemeSinaviCard, findsOneWidget);

      final yanlisDefteriSize = tester.getSize(yanlisDefteriCard);
      final denemeSinaviSize = tester.getSize(denemeSinaviCard);

      // Kartların yükseklikleri eşit olmalı
      expect(
        yanlisDefteriSize.height,
        equals(denemeSinaviSize.height),
        reason: 'Yanlış defteri ve Deneme sınavı kartları aynı yükseklikte olmalıdır',
      );

      // 1. Satırdaki "Başla" aksiyon butonlarının dikey (Y) hizası eşit olmalı (justify-between doğrulaması)
      final konuTestiAction = find.descendant(
        of: konuTestiCard,
        matching: find.text('Başla'),
      );
      final bilgiKartlariAction = find.descendant(
        of: bilgiKartlariCard,
        matching: find.text('Başla'),
      );

      final konuTestiActionPos = tester.getBottomLeft(konuTestiAction);
      final bilgiKartlariActionPos = tester.getBottomLeft(bilgiKartlariAction);

      expect(
        konuTestiActionPos.dy,
        equals(bilgiKartlariActionPos.dy),
        reason: 'Konu testi ve Bilgi kartları kartlarının "Başla" butonları alt çizgide tam hizalı olmalıdır',
      );

      // 2. Satırdaki "Başla" aksiyon butonlarının dikey (Y) hizası eşit olmalı
      final yanlisDefteriAction = find.descendant(
        of: yanlisDefteriCard,
        matching: find.text('Başla'),
      );
      final denemeSinaviAction = find.descendant(
        of: denemeSinaviCard,
        matching: find.text('Başla'),
      );

      final yanlisDefteriActionPos = tester.getBottomLeft(yanlisDefteriAction);
      final denemeSinaviActionPos = tester.getBottomLeft(denemeSinaviAction);

      expect(
        yanlisDefteriActionPos.dy,
        equals(denemeSinaviActionPos.dy),
        reason: 'Yanlış defteri ve Deneme sınavı kartlarının "Başla" butonları alt çizgide tam hizalı olmalıdır',
      );

      // 3. Etkileşimli Mini Oyunlar: "60 Saniyede Pençe" ve "Kavram Eşleştir"
      final blitzCard = find.ancestor(
        of: find.text('60 Saniyede Pençe'),
        matching: find.byType(TactileCard),
      );
      final matchCard = find.ancestor(
        of: find.text('Kavram Eşleştir'),
        matching: find.byType(TactileCard),
      );

      expect(blitzCard, findsOneWidget);
      expect(matchCard, findsOneWidget);

      final blitzSize = tester.getSize(blitzCard);
      final matchSize = tester.getSize(matchCard);

      expect(
        blitzSize.height,
        equals(matchSize.height),
        reason: '60 Saniyede Pençe ve Kavram Eşleştir kartları aynı yükseklikte olmalıdır',
      );
    },
  );
}
