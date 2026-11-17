import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/home/presentation/home_screen.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('TASK-112: HomeScreen De-AI-Slop & Temiz EdTech Görsel Doğrulama', () {
    testWidgets(
      'HomeScreen tek ve odaklı TuğrulAvatar ve temiz takvim taşı render eder',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(800, 2000);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(home: Scaffold(body: HomeScreen())),
          ),
        );

        await tester.pumpAndSettle();

        // 1. Hero sahnesi doğrulaması
        expect(find.text('Hoş geldin'), findsOneWidget);
        expect(find.text('Bugünkü hedefin'), findsOneWidget);

        // Ana sayfada hero alanında TuğrulAvatar bulunur
        expect(find.byType(TugrulAvatar), findsOneWidget);

        // 2. Takvim bannerı doğrulaması
        expect(find.byIcon(PhosphorIconsFill.calendarBlank), findsOneWidget);
        expect(find.text('YIL'), findsOneWidget);
        expect(find.text('AY'), findsOneWidget);
        expect(find.text('GÜN'), findsOneWidget);

        // 3. Hatırlatıcılar doğrulaması
        expect(find.text('Hatırlatıcılar'), findsOneWidget);
        expect(find.text('Çalışma Planı'), findsOneWidget);
        expect(find.text('Seri & Hedef'), findsOneWidget);
        expect(find.text('Hızlı Pratik'), findsOneWidget);

        // 4. Günlük plan kartı doğrulaması
        expect(find.text('Bugünün Çalışma Planı'), findsOneWidget);
        expect(find.text('Tümünü Gör'), findsOneWidget);
      },
    );
  });
}
