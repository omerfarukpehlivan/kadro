import 'package:flutter_test/flutter_test.dart';

import 'package:gunisigi/main.dart';

void main() {
  testWidgets('Alt menüden sayfalar arasında geçiş yapılır', (
    WidgetTester tester,
  ) async {
    // Uygulamayı çiz: ilk açılışta ana sayfa görünür.
    await tester.pumpWidget(const MyApp());
    expect(find.text('Günaydın'), findsOneWidget);

    // Alt menüde "Geçmiş"e dokun ve animasyonların bitmesini bekle.
    await tester.tap(find.text('Geçmiş'));
    await tester.pumpAndSettle();
    expect(find.text('Günaydın'), findsNothing);
    expect(find.text('Geçmiş kayıtların'), findsOneWidget);

    // "Ayarlar"a geç.
    await tester.tap(find.text('Ayarlar').last);
    await tester.pumpAndSettle();
    expect(find.text('Uygulama ayarları'), findsOneWidget);
  });
}
