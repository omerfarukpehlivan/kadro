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

  group('TASK-111 & TASK-166: LessonsScreen Lisans GY-GK Türkçe Aktif ve Matematik "Yakında" Vitrini', () {
    testWidgets(
      'Varsayılan Lisans seçiminde Genel Kültür + GY Türkçe aktif, Matematik Yakında gösterilir',
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
        expect(
          find.text('KPSS Genel Kültür + GY Türkçe (90 Soru)'),
          findsOneWidget,
        );
        expect(
          find.text('KPSS Genel Yetenek · Matematik (30 Soru · Yakında)'),
          findsOneWidget,
        );

        // Genel Yetenek ders isimleri
        expect(find.text('Türkçe'), findsOneWidget);
        expect(find.text('Matematik & Geometri'), findsOneWidget);

        // "Yakında" rozetleri ve kilit ikonu (Matematik için)
        expect(find.text('Yakında'), findsWidgets);
        expect(find.byIcon(PhosphorIconsRegular.lockSimple), findsOneWidget);
      },
    );

    testWidgets(
      'Yakında olan Matematik & Geometri kartına tıklandığında bilgilendirici alt çekmece açılır',
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

        // Matematik & Geometri kartına tıkla
        await tester.tap(find.text('Matematik & Geometri'));
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
