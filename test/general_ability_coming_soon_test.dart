import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/lessons/data/kpss_lessons.dart';
import 'package:kadro/features/lessons/presentation/lessons_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('TASK-111: KPSS Genel Yetenek Veri Modeli ve Sabitleri', () {
    test('kpssGeneralAbilityLessons Türkçe ve Matematik derslerini içerir', () {
      expect(kpssGeneralAbilityLessons.length, 2);

      final turkce = kpssGeneralAbilityLessons.firstWhere(
        (l) => l.name == 'Türkçe',
      );
      expect(turkce.questionCount, 30);
      expect(turkce.isComingSoon, isTrue);
      expect(turkce.badgeText, 'Yakında');
      expect(turkce.topics.isNotEmpty, isTrue);

      final matematik = kpssGeneralAbilityLessons.firstWhere(
        (l) => l.name == 'Matematik & Geometri',
      );
      expect(matematik.questionCount, 30);
      expect(matematik.isComingSoon, isTrue);
      expect(matematik.badgeText, 'Yakında');
      expect(matematik.topics.isNotEmpty, isTrue);
    });

    test('allKpssLessons hem Genel Kültür hem Genel Yetenek derslerini birleştirir', () {
      expect(allKpssLessons.length, 6);
      expect(kpssLessons.length, 4); // Genel Kültür 4 dersi izole kalmalı
      expect(kpssLessons.every((l) => !l.isComingSoon), isTrue);
    });
  });

  group('TASK-111: LessonsScreen Genel Yetenek "Yakında" Vitrini', () {
    testWidgets(
      'Genel Kültür ve Genel Yetenek bölümleri doğru başlıklarla gösterilir',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(800, 1800);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(home: Scaffold(body: LessonsScreen())),
          ),
        );

        await tester.pumpAndSettle();

        // Bölüm başlıkları
        expect(find.text('KPSS Genel Kültür (60 Soru)'), findsOneWidget);
        expect(
          find.text('KPSS Genel Yetenek (60 Soru · Yakında)'),
          findsOneWidget,
        );

        // Genel Yetenek ders isimleri
        expect(find.text('Türkçe'), findsOneWidget);
        expect(find.text('Matematik & Geometri'), findsOneWidget);

        // "Yakında" rozetleri (hem kartlarda hem bölüm başlığında yer alır)
        expect(find.text('Yakında'), findsWidgets);
        // Kilit ikonları
        expect(find.byIcon(PhosphorIconsRegular.lockSimple), findsWidgets);
      },
    );

    testWidgets(
      'Genel Yetenek kartına tıklandığında bilgilendirici alt çekmece açılır',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(800, 1800);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(home: Scaffold(body: LessonsScreen())),
          ),
        );

        await tester.pumpAndSettle();

        // Türkçe kartına tıkla
        await tester.tap(find.text('Türkçe'));
        await tester.pumpAndSettle();

        // Alt çekmecenin açıldığını doğrula
        expect(find.textContaining('Tuğrul Hazırlıyor!'), findsOneWidget);
        expect(find.text('Çok Yakında'), findsOneWidget);
        expect(
          find.textContaining('ÖSYM formatında özgün soru havuzu'),
          findsOneWidget,
        );
        expect(find.text('Hazırlanan Konu Modülleri:'), findsOneWidget);
        expect(find.text('Anladım, Takipteyim'), findsOneWidget);

        // Kapatma butonuna basınca çekmece kapanır
        await tester.tap(find.text('Anladım, Takipteyim'));
        await tester.pumpAndSettle();

        expect(find.textContaining('Tuğrul Hazırlıyor!'), findsNothing);
      },
    );
  });
}
