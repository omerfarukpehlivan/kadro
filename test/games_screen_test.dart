import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/app/theme.dart';
import 'package:kadro/features/games/data/models/true_false_item.dart';
import 'package:kadro/features/games/presentation/concept_match_screen.dart';
import 'package:kadro/features/games/presentation/true_false_blitz_screen.dart';
import 'package:kadro/main.dart';

void main() {
  group('TASK-82: 100 Maddelik Doğru / Yanlış Refleks Havuzu Testleri', () {
    test('sampleTrueFalseItems tam olarak 100 adet olmalı ve 4 derse eşit dağılmalı (25-25-25-25)', () {
      expect(sampleTrueFalseItems.length, equals(100));

      final tarihItems = sampleTrueFalseItems
          .where((i) => i.lesson == 'Tarih')
          .toList();
      final cografyaItems = sampleTrueFalseItems
          .where((i) => i.lesson == 'Coğrafya')
          .toList();
      final vatandaslikItems = sampleTrueFalseItems
          .where((i) => i.lesson == 'Vatandaşlık')
          .toList();
      final guncelItems = sampleTrueFalseItems
          .where((i) => i.lesson == 'Güncel Bilgiler')
          .toList();

      expect(tarihItems.length, equals(25));
      expect(cografyaItems.length, equals(25));
      expect(vatandaslikItems.length, equals(25));
      expect(guncelItems.length, equals(25));

      final idSet = <String>{};
      for (final item in sampleTrueFalseItems) {
        expect(item.id.trim(), isNotEmpty);
        expect(
          idSet.contains(item.id),
          isFalse,
          reason: 'Mükerrer önerme ID: ${item.id}',
        );
        idSet.add(item.id);

        expect(item.topic.trim(), isNotEmpty);
        expect(item.statement.trim(), isNotEmpty);
        expect(item.explanation.trim(), isNotEmpty);
      }
    });

    test('ÖSYM Çeldirici Tuzağı deşifreleri yanlış önermelerde yer almalı', () {
      final falseItems = sampleTrueFalseItems
          .where((item) => !item.isTrue)
          .toList();
      expect(falseItems.isNotEmpty, isTrue);

      final trapExplanations = falseItems
          .where((item) => item.explanation.contains('ÖSYM Çeldirici Tuzağı'))
          .toList();

      // Yanlış önermelerin neredeyse tamamı UWorld tarzı tuzak deşifresi içerir
      expect(trapExplanations.length, greaterThanOrEqualTo(35));
    });
  });

  group('TrueFalseBlitzScreen Widget Testleri', () {
    testWidgets(
      'Doğru ve Yanlış butonları kombo, XP ve anlık açıklama kartını tetikler',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              theme: AppTheme.light,
              home: const TrueFalseBlitzScreen(),
            ),
          ),
        );
        await tester.pump();

        // 1. İlk açılışta başlık, süre, kombo ve butonları doğrula
        expect(find.text('60 Saniyede Pençe'), findsOneWidget);
        expect(find.text('60 sn'), findsOneWidget);
        expect(find.text('0x Kombo'), findsOneWidget);
        expect(find.text('+0 XP'), findsOneWidget);
        expect(find.text('DOĞRU'), findsOneWidget);
        expect(find.text('YANLIŞ'), findsOneWidget);

        // 2. İlk soru: Orhun Yazıtları (isTrue == true) -> 'DOĞRU' seçelim
        await tester.tap(find.text('DOĞRU'));
        await tester.pump();

        // Doğru bildi: Kombo 1x, XP +10, açıklama ve 'Sonraki İfade' butonu görünür
        expect(find.text('Tebrikler, Doğru!'), findsOneWidget);
        expect(find.text('1x Kombo'), findsOneWidget);
        expect(find.text('+10 XP'), findsOneWidget);
        expect(find.text('Sonraki İfade'), findsOneWidget);

        // 3. 'Sonraki İfade'ye tıkla -> 2. soruya geçiş
        await tester.tap(find.text('Sonraki İfade'));
        await tester.pump();

        expect(find.text('2 / 100'), findsOneWidget);
        expect(find.text('DOĞRU'), findsOneWidget);
        expect(find.text('YANLIŞ'), findsOneWidget);

        // 4. İkinci soru: Lozan Boğazlar Komisyonu (isTrue == false) -> 'DOĞRU' seçip yanlış yapalım
        await tester.tap(find.text('DOĞRU'));
        await tester.pump();

        // Yanlış bildi: Kombo sıfırlanır, açıklama görünür
        expect(find.text('Dikkat, Yanlış!'), findsOneWidget);
        expect(find.text('0x Kombo'), findsOneWidget);
        expect(find.text('Sonraki İfade'), findsOneWidget);
      },
    );

    testWidgets('Süre bittiğinde Düello Tamamlandı özeti gösterilir', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            theme: AppTheme.light,
            home: const TrueFalseBlitzScreen(initialSeconds: 1),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('1 sn'), findsOneWidget);

      // 1 saniyelik süreyi tüket
      await tester.pump(const Duration(seconds: 1));
      await tester.pump();

      // Bitiş ekranı doğrulaması
      expect(find.text('Düello Tamamlandı!'), findsOneWidget);
      expect(find.text('Tekrar Oyna'), findsOneWidget);
      expect(find.text('Ana Sayfaya Dön'), findsOneWidget);
    });
  });

  group('ConceptMatchScreen ve HomeScreen Vitrin Testleri', () {
    testWidgets(
      'ConceptMatchScreen doğru kavram eşleşmesini ve hamle sayacını doğrular',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              theme: AppTheme.light,
              home: const ConceptMatchScreen(),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Kavram Eşleştir'), findsOneWidget);
        expect(find.text('0 / 4 Eşleşti'), findsOneWidget);
        expect(find.text('Hamle: 0'), findsOneWidget);

        // Soldan 'Lozan Antlaşması' ve sağdan 'Kapitülasyonların Kaldırılması' seçelim
        await tester.tap(find.text('Lozan Antlaşması'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Kapitülasyonların Kaldırılması'));
        await tester.pumpAndSettle();

        expect(find.text('1 / 4 Eşleşti'), findsOneWidget);
        expect(find.text('Hamle: 1'), findsOneWidget);
      },
    );

    testWidgets(
      'PracticeHubScreen üzerinde Hızlı Tekrar & Refleks Antrenmanı vitrini görüntülenir',
      (WidgetTester tester) async {
        await tester.pumpWidget(const MyApp());
        await tester.pumpAndSettle();

        // Alt menüden Pratik sekmesine geçelim
        await tester.tap(find.text('Pratik'));
        await tester.pumpAndSettle();

        // Sayfayı aşağı kaydırıp refleks antrenmanı vitrinini bulalım
        await tester.scrollUntilVisible(
          find.text('Hızlı Tekrar & Refleks Antrenmanı'),
          200,
          scrollable: find.byType(Scrollable).first,
        );

        expect(find.text('Hızlı Tekrar & Refleks Antrenmanı'), findsOneWidget);
        expect(find.text('60 Saniyede Pençe'), findsOneWidget);
        expect(find.text('Kavram Eşleştir'), findsOneWidget);
      },
    );
  });
}
