import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/lessons/data/kpss_lessons.dart';
import 'package:kadro/features/lessons/presentation/lessons_screen.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
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

  group('TASK-174: LessonsScreen B Grubu Tam GY-GK Aktif & E-KPSS Yakında Vitrini', () {
    testWidgets(
      'Varsayılan Lisans B Grubu seçiminde Türkçe ve Matematik & Geometri dahil tüm 6 ders aktif gösterilir',
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

        expect(
          find.text('KPSS Genel Kültür & Genel Yetenek (120 Soru)'),
          findsOneWidget,
        );

        // Genel Yetenek ders isimleri aktif listede
        expect(find.text('Türkçe'), findsOneWidget);
        expect(find.text('Matematik & Geometri'), findsOneWidget);
        expect(find.byIcon(PhosphorIconsRegular.lockSimple), findsNothing);
      },
    );

    testWidgets(
      'TASK-179: Kayıtlı eski E-KPSS seçimi KPSS B Grubu\'na düşer; Matematik & Geometri kilitsiz ve aktif görünür',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(800, 1800);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              initialUserPreferencesProvider.overrideWithValue(
                const UserPreferencesState(
                  examSelection: ExamSelection(
                    family: KpssExamFamily.ekpss,
                    educationLevel: EducationLevel.lisans,
                  ),
                ),
              ),
            ],
            child: const MaterialApp(home: Scaffold(body: LessonsScreen())),
          ),
        );

        await tester.pumpAndSettle();

        // Kilitli aile (E-KPSS) yüklenirken aktif B Grubu'na normalize edilir;
        // bu yüzden "Yakında" vitrini ve kilit ikonu görünmez.
        expect(find.text('Matematik & Geometri'), findsOneWidget);
        expect(find.text('Yakında'), findsNothing);
        expect(find.byIcon(PhosphorIconsRegular.lockSimple), findsNothing);
        expect(find.textContaining('Tuğrul Hazırlıyor!'), findsNothing);
      },
    );
  });
}
