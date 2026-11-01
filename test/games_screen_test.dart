import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/app/theme.dart';
import 'package:kadro/features/games/presentation/true_false_blitz_screen.dart';

void main() {
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

        expect(find.text('2 / 8'), findsOneWidget);
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
}
