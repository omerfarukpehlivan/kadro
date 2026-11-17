import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/flashcards/data/models/flashcard.dart';
import 'package:kadro/features/flashcards/presentation/flashcards_screen.dart';
import 'package:kadro/features/lessons/data/curriculum_registry.dart';
import 'package:kadro/features/lessons/data/kpss_lessons.dart';
import 'package:kadro/features/lessons/data/models/exam_curriculum.dart';
import 'package:kadro/features/lessons/presentation/lessons_screen.dart';
import 'package:kadro/features/mistakes/data/mistake_repository.dart';
import 'package:kadro/features/mistakes/presentation/mistakes_screen.dart';
import 'package:kadro/features/planner/data/models/study_program_pace.dart';
import 'package:kadro/core/utils/exam_calendar_utils.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
  });

  group('CurriculumRegistry & ExamCurriculum Birim Testleri', () {
    test('Varsayılan Lisans GK müfredatı 60 soru, 65 dk ve 152 test döner', () {
      final curriculum = CurriculumRegistry.resolve(ExamSelection.initial);

      expect(curriculum.scopeKey, 'lisans_gk');
      expect(curriculum.title, 'KPSS Genel Kültür');
      expect(curriculum.totalQuestions, 60);
      expect(curriculum.standardDurationMinutes, 65);
      expect(curriculum.availability, CurriculumAvailability.ready);
      expect(curriculum.activeLessons.length, 4);
      expect(curriculum.upcomingLessons.length, 2);
      expect(curriculum.totalTestCount, 152);
      expect(totalCurriculumTestCount, 152);
      expect(defaultTopicTestCount('Tarih', 'Osmanlı Kültür ve Uygarlığı'), 12);
      expect(
        defaultTopicTestCount('Coğrafya', 'Madenler ve Enerji Kaynaklar'),
        6,
      );
      expect(defaultTopicTestCount('Vatandaşlık', 'İdare Hukuku'), 5);
      expect(
        defaultTopicTestCount('Güncel Bilgiler', 'UNESCO Miras Listesi'),
        4,
      );
    });

    test('B Grubu Tam GY-GK 120 soru ve 130 dk müfredatı çözer', () {
      const selection = ExamSelection(
        family: KpssExamFamily.bGrubu,
        educationLevel: EducationLevel.onlisans,
        bGroupProfile: BGroupProfile.fullGyGk,
      );
      final curriculum = CurriculumRegistry.resolve(selection);

      expect(curriculum.scopeKey, 'onlisans_gygk');
      expect(curriculum.title, 'KPSS Ön Lisans (GY-GK)');
      expect(curriculum.totalQuestions, 120);
      expect(curriculum.standardDurationMinutes, 130);
      expect(curriculum.availability, CurriculumAvailability.partial);
      expect(curriculum.allLessons.length, 6);
    });

    test('E-KPSS ek süre ve 30 GY + 30 GK dağılımını doğru hesaplar', () {
      const selection = ExamSelection(
        family: KpssExamFamily.ekpss,
        educationLevel: EducationLevel.lisans,
        disabilityGroup: DisabilityGroup.gorme,
        includeExtraTime: true,
      );
      final curriculum = CurriculumRegistry.resolve(selection);

      final activeQ = curriculum.activeLessons.fold<int>(
        0,
        (sum, l) => sum + l.questionCount,
      );
      final upcomingQ = curriculum.upcomingLessons.fold<int>(
        0,
        (sum, l) => sum + l.questionCount,
      );

      expect(curriculum.totalQuestions, 60);
      expect(activeQ, 30);
      expect(upcomingQ, 30);
      expect(curriculum.standardDurationMinutes, 90);
    });

    test('DHBT öğrenim düzeyine göre farklı DHBT-2 müfredatı üretir', () {
      final onlisans = CurriculumRegistry.resolve(
        const ExamSelection(
          family: KpssExamFamily.dhbt,
          educationLevel: EducationLevel.onlisans,
        ),
      );
      final lisans = CurriculumRegistry.resolve(
        const ExamSelection(
          family: KpssExamFamily.dhbt,
          educationLevel: EducationLevel.lisans,
        ),
      );

      expect(onlisans.totalQuestions, 40);
      expect(onlisans.standardDurationMinutes, 60);
      expect(onlisans.supportsTurkeyMapWorkshop, isFalse);
      expect(onlisans.upcomingLessons.length, 2);
      expect(
        onlisans.upcomingLessons[1].topics,
        isNot(equals(lisans.upcomingLessons[1].topics)),
      );
    });

    test('MEB-AGS P1, YDS P3 ve ÖABT alan/eğitim bölünmesini doğru çözer', () {
      final agsP1 = CurriculumRegistry.resolve(
        const ExamSelection(family: KpssExamFamily.mebAgs),
      );
      final agsYds = CurriculumRegistry.resolve(
        const ExamSelection(
          family: KpssExamFamily.mebAgs,
          oabtBranch: OabtBranch.ydsDil,
        ),
      );
      final agsSinif = CurriculumRegistry.resolve(
        const ExamSelection(
          family: KpssExamFamily.mebAgs,
          oabtBranch: OabtBranch.sinifOgretmenligi,
        ),
      );

      expect(agsP1.totalQuestions, 80);
      expect(agsYds.totalQuestions, 160);
      expect(agsSinif.totalQuestions, 130);
      expect(agsSinif.upcomingLessons[1].topics, isNotEmpty);
      expect(
        agsSinif.upcomingLessons[1].topics.first,
        contains('Alan Bilgisi (30 Soru)'),
      );
      expect(
        agsSinif.upcomingLessons[1].topics.join(' '),
        contains('Alan Eğitimi (20 Soru)'),
      );
    });

    test('KPSS A Grubu varsayılan P48 ve özel alan seçimlerini destekler', () {
      final p48 = CurriculumRegistry.resolve(
        const ExamSelection(family: KpssExamFamily.aGrubu),
      );
      final custom = CurriculumRegistry.resolve(
        const ExamSelection(
          family: KpssExamFamily.aGrubu,
          selectedFieldLessons: [
            'Alan Hukuk',
            'Alan İşletme',
            'Alan İstatistik',
          ],
        ),
      );

      expect(p48.totalQuestions, 160);
      expect(p48.upcomingLessons.length, 4);
      expect(custom.totalQuestions, 120);
      expect(custom.primaryLessonNames, const [
        'Alan Hukuk',
        'Alan İşletme',
        'Alan İstatistik',
      ]);
    });

    test(
      'buildFilterLessons ders adlarını tekrarsız ve sıralı birleştirir',
      () {
        final curriculum = CurriculumRegistry.resolve(ExamSelection.initial);
        final filters = curriculum.buildFilterLessons(const [
          'Tarih',
          'Alan Hukuk',
          '',
          'Tümü',
          'Alan Hukuk',
        ]);

        expect(filters, const [
          'Tümü',
          'Tarih',
          'Coğrafya',
          'Vatandaşlık',
          'Güncel Bilgiler',
          'Alan Hukuk',
        ]);
      },
    );

    test('StudyProgramPace.evaluateSchedule özel ExamCurriculum ile günü yeniden hesaplar', () {
      final agsCurriculum = CurriculumRegistry.resolve(
        const ExamSelection(family: KpssExamFamily.mebAgs),
      );
      final customTestDate = DateTime(2026, 6, 1);

      final defaultAdvice = StudyProgramPace.dk30.evaluateSchedule(
        KpssExamTarget.lisans,
        now: customTestDate,
      );
      final agsAdvice = StudyProgramPace.dk30.evaluateSchedule(
        KpssExamTarget.lisans,
        now: customTestDate,
        curriculum: agsCurriculum,
      );

      expect(
        defaultAdvice.estimatedDaysToFinish,
        greaterThan(agsAdvice.estimatedDaysToFinish),
      );
      expect(
        agsAdvice.message,
        contains('${agsCurriculum.totalTestCount} test'),
      );
    });
  });

  group('Dinamik Müfredat Ekran Entegrasyon Testleri', () {
    testWidgets(
      'LessonsScreen özel DHBT müfredatını ve alt çekmecesini dinamik çizer',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(800, 1600);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final dhbtCurriculum = CurriculumRegistry.resolve(
          const ExamSelection(
            family: KpssExamFamily.dhbt,
            educationLevel: EducationLevel.lisans,
          ),
        );

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              activeCurriculumProvider.overrideWithValue(dhbtCurriculum),
            ],
            child: const MaterialApp(home: Scaffold(body: LessonsScreen())),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('DHBT-1 Temel Din Bilgisi'), findsOneWidget);
        expect(find.text('DHBT-2 Lisans Alan'), findsOneWidget);

        await tester.tap(find.text('DHBT-1 Temel Din Bilgisi'));
        await tester.pumpAndSettle();

        expect(
          find.textContaining(
            'KPSS DHBT (Lisans) kapsamındaki DHBT-1 Temel Din Bilgisi',
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'FlashcardsScreen özel A Grubu ve DHBT kartlarını dinamik filtreler',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(900, 1600);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        const customCards = [
          Flashcard(
            id: 'fc_hukuk_1',
            lesson: 'Alan Hukuk',
            topic: 'Anayasa Hukuku',
            frontText: 'Normlar hiyerarşisinin en üstünde ne yer alır?',
            backText: 'Anayasa.',
          ),
          Flashcard(
            id: 'fc_dhbt_1',
            lesson: 'DHBT-1 Temel Din Bilgisi',
            topic: 'Fıkıh',
            frontText: 'Şer\'i delillerden icma neyi ifade eder?',
            backText: 'Müctehidlerin görüş birliği.',
          ),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: FlashcardsScreen(
              flashcards: customCards,
              initialLesson: 'Alan Hukuk',
            ),
          ),
        );
        await tester.pumpAndSettle();

        final horizontalList = find.byType(Scrollable).first;
        await tester.scrollUntilVisible(
          find.text('Alan Hukuk'),
          150,
          scrollable: horizontalList,
        );
        await tester.pumpAndSettle();
        expect(find.text('Alan Hukuk'), findsOneWidget);
        expect(
          find.text('Normlar hiyerarşisinin en üstünde ne yer alır?'),
          findsOneWidget,
        );

        await tester.scrollUntilVisible(
          find.text('DHBT-1 Temel Din Bilgisi'),
          150,
          scrollable: horizontalList,
        );
        await tester.pumpAndSettle();
        expect(find.text('DHBT-1 Temel Din Bilgisi'), findsOneWidget);

        await tester.tap(find.text('DHBT-1 Temel Din Bilgisi'));
        await tester.pumpAndSettle();

        expect(
          find.text('Şer\'i delillerden icma neyi ifade eder?'),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'MistakesScreen GK dışı derslerdeki yanlışlar için dinamik çip üretir',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(900, 1600);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        const repo = MistakeRepository();
        repo.clearForTest();
        addTearDown(repo.clearForTest);

        repo.addMistake(
          const Question(
            id: 'err_hukuk_1',
            lesson: 'Alan Hukuk',
            topic: 'İdare Hukuku',
            text: 'İdari işlemin geri alınması hangi süreye tabidir?',
            options: ['A', 'B', 'C', 'D', 'E'],
            correctIndex: 0,
            explanation: 'Dava açma süresi içinde geri alınabilir.',
          ),
        );
        repo.addMistake(
          const Question(
            id: 'err_tarih_1',
            lesson: 'Tarih',
            topic: 'Osmanlı Kültür ve Uygarlığı',
            text: 'Divan-ı Hümayun kararları hangi deftere yazılır?',
            options: ['A', 'B', 'C', 'D', 'E'],
            correctIndex: 0,
            explanation: 'Mühimme Defteri.',
          ),
        );

        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(home: MistakesScreen(mistakeRepository: repo)),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Tümü (2)'), findsOneWidget);
        expect(find.text('Tarih (1)'), findsOneWidget);
        expect(find.text('Alan Hukuk (1)'), findsOneWidget);

        await tester.ensureVisible(find.text('Alan Hukuk (1)'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Alan Hukuk (1)'));
        await tester.pumpAndSettle();

        expect(
          find.text('İdari işlemin geri alınması hangi süreye tabidir?'),
          findsOneWidget,
        );
        expect(
          find.text('Divan-ı Hümayun kararları hangi deftere yazılır?'),
          findsNothing,
        );
      },
    );
  });
}
