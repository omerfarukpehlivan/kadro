import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/exams/presentation/exams_screen.dart';
import 'package:kadro/features/lessons/data/curriculum_registry.dart';
import 'package:kadro/features/lessons/data/kpss_lessons.dart';
import 'package:kadro/features/lessons/data/models/exam_curriculum.dart';
import 'package:kadro/features/lessons/presentation/lessons_screen.dart';
import 'package:kadro/core/utils/exam_calendar_utils.dart';
import 'package:kadro/features/profile/presentation/profile_screen.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/features/score_calculator/data/engines/score_formula_engine.dart';
import 'package:kadro/features/score_calculator/data/kpss_score_calculator.dart';
import 'package:kadro/features/score_calculator/presentation/kpss_score_calculator_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    GoogleFonts.config.allowRuntimeFetching = false;
    SharedPreferences.setMockInitialValues({});
  });

  group('Faz A–E Çoklu Sınav Müfredat Doğrulaması', () {
    test(
      'Faz A: B Grubu GY-GK Türkçe ve Matematik tam ÖSYM konularını içerir',
      () {
        expect(kpssGeneralAbilityLessons.length, 2);
        final turkce = kpssGeneralAbilityLessons[0];
        final mat = kpssGeneralAbilityLessons[1];
        expect(turkce.topics.length, greaterThanOrEqualTo(10));
        expect(turkce.topics, contains('Sözel Mantık ve Muhakeme'));
        expect(mat.topics.length, greaterThanOrEqualTo(12));
        expect(mat.topics, contains('Analitik Geometri ve Katı Cisimler'));

        final curriculum = CurriculumRegistry.resolve(
          const ExamSelection(
            family: KpssExamFamily.bGrubu,
            educationLevel: EducationLevel.lisans,
            bGroupProfile: BGroupProfile.fullGyGk,
          ),
        );
        expect(curriculum.totalQuestions, 120);
        expect(curriculum.standardDurationMinutes, 130);
        expect(curriculum.availability, CurriculumAvailability.partial);
      },
    );

    test('Faz B: E-KPSS 3 düzeyde 30 GY + 30 GK ve Engelli Hakları içerir', () {
      for (final level in EducationLevel.values) {
        final curriculum = CurriculumRegistry.resolve(
          ExamSelection(
            family: KpssExamFamily.ekpss,
            educationLevel: level,
            disabilityGroup: DisabilityGroup.gorme,
            includeExtraTime: true,
          ),
        );
        expect(curriculum.totalQuestions, 60);
        expect(curriculum.standardDurationMinutes, 90);
        final tarih = curriculum.activeLessons.firstWhere(
          (l) => l.name == 'Tarih',
        );
        final vat = curriculum.activeLessons.firstWhere(
          (l) => l.name == 'Vatandaşlık',
        );
        expect(tarih.questionCount, 13);
        expect(tarih.topics, contains('Türk Kültür ve Medeniyetleri'));
        expect(vat.questionCount, 6);
        expect(vat.topics.join(' '), contains('Engelli Hakları'));
      }
    });

    test(
      'Faz C: DHBT 5 ortak alan ve düzeylere göre 7\'şer DHBT-2 konusu döner',
      () {
        for (final level in EducationLevel.values) {
          final curriculum = CurriculumRegistry.resolve(
            ExamSelection(family: KpssExamFamily.dhbt, educationLevel: level),
          );
          expect(curriculum.upcomingLessons.length, 2);
          expect(curriculum.upcomingLessons[0].topics.length, 5);
          expect(curriculum.upcomingLessons[1].topics.length, 7);
        }
        expect(
          KpssScoreType.fromExamTarget(KpssExamTarget.dhbt),
          KpssScoreType.p122Dhbt,
        );
      },
    );

    test('Faz D: MEB-AGS 1. Oturum + tüm 17 ÖABT branşı eksiksiz konu ağacına sahip', () {
      final agsBase = CurriculumRegistry.resolve(
        const ExamSelection(family: KpssExamFamily.mebAgs),
      );
      final ags1Topics = agsBase.upcomingLessons.first.topics.join(' ');
      expect(ags1Topics, contains('TYMM'));
      expect(ags1Topics, contains('Eğitim Bilimleri Arşiv'));
      expect(ags1Topics, contains('7528'));

      for (final branch in OabtBranch.officialOabtBranches) {
        final c = CurriculumRegistry.resolve(
          ExamSelection(family: KpssExamFamily.mebAgs, oabtBranch: branch),
        );
        expect(c.totalQuestions, 130);
        expect(c.upcomingLessons.length, 2);
        final oabt = c.upcomingLessons[1];
        expect(oabt.name, 'ÖABT ${branch.label}');
        expect(oabt.section, contains('${branch.durationMinutes} dk'));
        expect(oabt.topics.length, greaterThanOrEqualTo(4));
        if (branch.hasFieldEducationSplit) {
          expect(oabt.section, contains('30 Alan + 20 Alan Eğitimi'));
        }
      }
    });

    test(
      'Faz E: KPSS A Grubu 9 alan dersi ve İstatistik 60 dk süresini hesaplar',
      () {
        const all9 = [
          'Alan Hukuk',
          'Alan İktisat',
          'Alan Maliye',
          'Alan Muhasebe',
          'Alan İşletme',
          'Alan Kamu Yönetimi',
          'Alan Uluslararası İlişkiler',
          'Alan ÇEKO',
          'Alan İstatistik',
        ];
        final c = CurriculumRegistry.resolve(
          const ExamSelection(
            family: KpssExamFamily.aGrubu,
            selectedFieldLessons: all9,
          ),
        );
        expect(c.upcomingLessons.length, 9);
        expect(c.totalQuestions, 360);
        // 8 * 50 dk + 1 * 60 dk (İstatistik) = 460 dk
        expect(c.standardDurationMinutes, 460);
      },
    );
  });

  group('Faz A–E Çoklu Sınav Puan Motorları', () {
    test(
      'BGroupScoreEngine KPSSP1, KPSSP2 ve KPSSP3 puanlarını aynı anda üretir',
      () {
        final engine = ScoreEngineRegistry.engineForMode(
          ScoreEngineMode.bGrubuLisans,
        );
        final res = engine.calculate(
          selection: const ExamSelection.bGrubuLisans(),
          inputs: const {
            'gy': ScoreSectionInput(correct: 50, wrong: 0),
            'gk': ScoreSectionInput(correct: 30, wrong: 0),
          },
        );
        expect(res.isThresholdMet, isTrue);
        final p1 = res.scoreOutputs
            .firstWhere((o) => o.code == 'KPSSP1')
            .score!;
        final p2 = res.scoreOutputs
            .firstWhere((o) => o.code == 'KPSSP2')
            .score!;
        final p3 = res.scoreOutputs
            .firstWhere((o) => o.code == 'KPSSP3')
            .score!;
        expect(p1, greaterThan(p2));
        expect(p2, greaterThan(p3));
      },
    );

    test(
      'EkpssScoreEngine 30 GY + 30 GK 40–100 ölçeğini ve barajı uygular',
      () {
        final engine = ScoreEngineRegistry.engineForMode(ScoreEngineMode.ekpss);
        final full = engine.calculate(
          selection: const ExamSelection.ekpss(
            educationLevel: EducationLevel.lisans,
          ),
          inputs: const {
            'gy': ScoreSectionInput(correct: 30, wrong: 0),
            'gk': ScoreSectionInput(correct: 30, wrong: 0),
          },
        );
        expect(full.primaryCode, 'EKPSSP3');
        expect(full.primaryScore, closeTo(100.0, 0.01));

        final blocked = engine.calculate(
          selection: const ExamSelection.ekpss(
            educationLevel: EducationLevel.ortaogretim,
          ),
          inputs: const {
            'gy': ScoreSectionInput(correct: 0, wrong: 0),
            'gk': ScoreSectionInput(correct: 0, wrong: 0),
          },
        );
        expect(blocked.isThresholdMet, isFalse);
        expect(blocked.scoreOutputs.first.isCalculated, isFalse);
      },
    );

    test(
      'DhbtScoreEngine %15 GY + %15 GK + %30 DHBT-1 + %40 DHBT-2 hesaplar',
      () {
        final engine = ScoreEngineRegistry.engineForMode(ScoreEngineMode.dhbt);
        final res = engine.calculate(
          selection: const ExamSelection.dhbt(
            educationLevel: EducationLevel.onlisans,
          ),
          inputs: const {
            'gy': ScoreSectionInput(correct: 60, wrong: 0),
            'gk': ScoreSectionInput(correct: 60, wrong: 0),
            'dhbt1': ScoreSectionInput(correct: 20, wrong: 0),
            'dhbt2': ScoreSectionInput(correct: 20, wrong: 0),
          },
        );
        expect(res.primaryCode, 'KPSSP123');
        expect(res.primaryScore, closeTo(100.0, 0.01));
        expect(res.scoreOutputs.map((e) => e.code), [
          'KPSSP122',
          'KPSSP123',
          'KPSSP124',
        ]);

        final blockedDhbt = engine.calculate(
          selection: const ExamSelection.dhbt(),
          inputs: const {
            'gy': ScoreSectionInput(correct: 25, wrong: 0),
            'gk': ScoreSectionInput(correct: 25, wrong: 0),
            'dhbt1': ScoreSectionInput(correct: 0, wrong: 0),
            'dhbt2': ScoreSectionInput(correct: 0, wrong: 0),
          },
        );
        expect(blockedDhbt.isThresholdMet, isFalse);
        expect(blockedDhbt.thresholdWarning, contains('DHBT-1 veya DHBT-2'));
      },
    );

    test(
      'MebAgsScoreEngine AGS-P1, AGS-P2 (DKAB dahil) ve AGS-P3 hesaplar',
      () {
        final engine = ScoreEngineRegistry.engineForMode(
          ScoreEngineMode.mebAgs,
        );

        final p1 = engine.calculate(
          selection: const ExamSelection.mebAgs(oabtBranch: OabtBranch.none),
          inputs: const {'ags': ScoreSectionInput(correct: 40, wrong: 0)},
        );
        expect(p1.primaryCode, 'AGS-P1');
        expect(p1.primaryScore, closeTo(70.0, 0.01));

        final p2Dkab = engine.calculate(
          selection: const ExamSelection.mebAgs(oabtBranch: OabtBranch.dkabIhl),
          inputs: const {
            'ags': ScoreSectionInput(correct: 40, wrong: 0),
            'oabt': ScoreSectionInput(correct: 50, wrong: 0),
          },
        );
        expect(p2Dkab.primaryCode, 'AGS-P2');
        // (%50 * 70 + %50 * 100) = 85.0
        expect(p2Dkab.primaryScore, closeTo(85.0, 0.01));

        final p3Yds = engine.calculate(
          selection: const ExamSelection.mebAgs(oabtBranch: OabtBranch.ydsDil),
          inputs: const {
            'ags': ScoreSectionInput(correct: 80, wrong: 0),
            'yds': ScoreSectionInput(rawScore: 80.0),
          },
        );
        expect(p3Yds.primaryCode, 'AGS-P3');
        expect(p3Yds.primaryScore, closeTo(90.0, 0.01));
      },
    );

    test(
      'AGroupScoreEngine P4–P48 hesaplar ve < 1 ham net kuralıyla bloklar',
      () {
        final engine = ScoreEngineRegistry.engineForMode(
          ScoreEngineMode.aGrubu,
        );
        final res = engine.calculate(
          selection: const ExamSelection.aGrubu(),
          inputs: const {
            'gy': ScoreSectionInput(correct: 40, wrong: 0),
            'gk': ScoreSectionInput(correct: 40, wrong: 0),
            'hukuk': ScoreSectionInput(correct: 30, wrong: 0),
            // İktisat, Maliye, Muhasebe, İşletme vb. 0 -> yalnızca P4 hesaplanmalı!
          },
        );
        final codes = res.scoreOutputs.map((o) => o.code).toList();
        expect(
          codes,
          containsAll([
            'KPSSP4',
            'KPSSP12',
            'KPSSP13',
            'KPSSP14',
            'KPSSP19',
            'KPSSP20',
            'KPSSP21',
            'KPSSP24',
            'KPSSP29',
            'KPSSP34',
            'KPSSP35',
            'KPSSP48',
          ]),
        );

        final p4 = res.scoreOutputs.firstWhere((o) => o.code == 'KPSSP4');
        final p48 = res.scoreOutputs.firstWhere((o) => o.code == 'KPSSP48');
        final p12 = res.scoreOutputs.firstWhere((o) => o.code == 'KPSSP12');
        expect(p4.isCalculated, isTrue);
        expect(p48.isCalculated, isFalse);
        expect(p48.blockReason, contains('Hesaplanmadı: İktisat < 1 Net'));
        expect(p12.blockReason, contains('Hesaplanmadı: İstatistik < 1 Net'));
      },
    );
  });

  group('UI Entegrasyonu: E-KPSS Okunabilirlik, Hesaplayıcı ve 360x640 Overflow', () {
    testWidgets(
      'ProfileScreen yüksek okunabilirlik anahtarı QuizScreen textScale ve kenarlığı büyütür',
      (tester) async {
        tester.view.physicalSize = const Size(412, 915);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.resetPhysicalSize);

        final showQuiz = ValueNotifier<bool>(false);
        addTearDown(showQuiz.dispose);

        const sampleQuestion = Question(
          id: 'ekpss_q1',
          lesson: 'Tarih',
          topic: 'Türk Kültür ve Medeniyetleri',
          text: 'İlk Türk devletlerinde kurultay üyelerine ne ad verilir?',
          options: ['Toygun', 'Tudun', 'Tamgacı', 'Bitikçi', 'Subaşı'],
          correctIndex: 0,
          explanation: 'Kurultay (toy) üyelerine toygun adı verilir.',
        );

        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              home: ValueListenableBuilder<bool>(
                valueListenable: showQuiz,
                builder: (_, isQuiz, _) => isQuiz
                    ? const QuizScreen(questions: [sampleQuestion])
                    : const Scaffold(body: ProfileScreen()),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final toggleFinder = find.byKey(
          const ValueKey('profile_high_readability_switch'),
        );
        await tester.scrollUntilVisible(
          toggleFinder,
          250,
          scrollable: find.byType(Scrollable).first,
        );
        await tester.ensureVisible(toggleFinder);
        await tester.pumpAndSettle();
        await tester.tap(toggleFinder);
        await tester.pumpAndSettle();

        showQuiz.value = true;
        await tester.pumpAndSettle();

        // Yüksek Okunabilirlik açıkken soru metni saran MediaQuery 1.2x çarpan uygular
        final questionTextWidget = find.textContaining(
          'İlk Türk devletlerinde',
        );
        expect(questionTextWidget, findsOneWidget);
        final mediaQueryContext = tester.element(questionTextWidget);
        expect(
          MediaQuery.textScalerOf(mediaQueryContext).scale(10),
          closeTo(12.0, 0.1),
        );
      },
    );

    testWidgets(
      'KpssScoreCalculatorScreen 360x640 çözünürlükte tüm modları taşmasız çizer',
      (tester) async {
        tester.view.physicalSize = const Size(360, 640);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.resetPhysicalSize);

        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(home: KpssScoreCalculatorScreen()),
          ),
        );
        await tester.pumpAndSettle();

        expect(tester.takeException(), isNull);

        for (final modeCode in ['EKPSS', 'DHBT', 'MEB_AGS', 'A_GRUBU']) {
          await tester.tap(find.byKey(const ValueKey('score_type_dropdown')));
          await tester.pumpAndSettle();
          await tester.tap(
            find.descendant(
              of: find.byKey(ValueKey('score_type_$modeCode')).last,
              matching: find.byType(Text),
            ),
          );
          await tester.pumpAndSettle();
          expect(tester.takeException(), isNull);
        }

        // MEB-AGS içinde AGS-P3 (YDS) çipine geç ve slider görünümünü doğrula
        await tester.tap(find.byKey(const ValueKey('score_type_dropdown')));
        await tester.pumpAndSettle();
        await tester.tap(
          find.descendant(
            of: find.byKey(const ValueKey('score_type_MEB_AGS')).last,
            matching: find.byType(Text),
          ),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.byKey(const ValueKey('meb_ags_chip_p3')));
        await tester.pumpAndSettle();
        final ydsSliderFinder = find.byKey(const ValueKey('yds_raw_slider'));
        await tester.scrollUntilVisible(
          ydsSliderFinder,
          250,
          scrollable: find.byType(Scrollable).first,
        );
        expect(ydsSliderFinder, findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'LessonsScreen ve ExamsScreen 360x640 çözünürlükte çoklu sınavda taşmaz',
      (tester) async {
        tester.view.physicalSize = const Size(360, 640);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.resetPhysicalSize);

        final partialCurriculum = CurriculumRegistry.resolve(
          const ExamSelection(
            family: KpssExamFamily.bGrubu,
            bGroupProfile: BGroupProfile.fullGyGk,
          ),
        );

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              activeCurriculumProvider.overrideWithValue(partialCurriculum),
            ],
            child: const MaterialApp(home: Scaffold(body: LessonsScreen())),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.text(partialCurriculum.activeSectionTitle), findsOneWidget);
        expect(tester.takeException(), isNull);

        await tester.pumpWidget(
          ProviderScope(
            key: UniqueKey(),
            child: const MaterialApp(home: Scaffold(body: ExamsScreen())),
          ),
        );
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
      },
    );
  });
}
