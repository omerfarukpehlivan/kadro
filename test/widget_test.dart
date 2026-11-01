import 'package:flutter_test/flutter_test.dart';

import 'package:kadro/main.dart';

void main() {
  testWidgets('Alt menüden sayfalar arasında geçiş yapılır', (
    WidgetTester tester,
  ) async {
    // Uygulamayı çiz: ilk açılışta ana sayfa görünür.
    await tester.pumpWidget(const MyApp());
    expect(find.text('Hoş geldin'), findsOneWidget);

    // Alt menüde "Dersler"e dokun ve animasyonların bitmesini bekle.
    await tester.tap(find.text('Dersler'));
    await tester.pumpAndSettle();
    expect(find.text('Hoş geldin'), findsNothing);
    expect(find.text('Tarih'), findsOneWidget);

    // "Profil"e geç.
    await tester.tap(find.text('Profil'));
    await tester.pumpAndSettle();
    expect(find.text('Profilin'), findsOneWidget);
  });
}
