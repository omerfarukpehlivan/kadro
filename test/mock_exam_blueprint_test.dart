import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/exams/data/models/mock_exam_blueprint.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/data/models/quiz_mode.dart';
import 'package:kadro/features/quiz/data/question_repository.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/features/stats/data/models/quiz_session_record.dart';

void main() {
  group('TASK-130: MockExamBlueprint & Çok Bölümlü Sınav Motoru', () {
    test('ExamBlueprintRegistry tüm sınav aileleri için geçerli süre ve soru şablonları üretmeli', () {
      const bGroupLisans = ExamSelection(
        family: KpssExamFamily.bGrubu,
        educationLevel: EducationLevel.lisans,
      );
      final gyGkPrimary = ExamBlueprintRegistry.primaryFullExamFor(
        bGroupLisans,
      );
      expect(gyGkPrimary.totalQuestionCount, equals(120));
      expect(gyGkPrimary.standardDurationMinutes, equals(130));
      expect(gyGkPrimary.sections.length, equals(6));
      expect(gyGkPrimary.isMultiSection, isTrue);
      // Matematik gelene kadar Tam GY-GK denemesi Yakında olarak işaretlenir (TASK-166)
      expect(gyGkPrimary.isComingSoon, isTrue);

      final bGroupPacks = ExamBlueprintRegistry.forSelection(bGroupLisans);
      final gkSessionPack = bGroupPacks.firstWhere(
        (b) => b.id == 'b_gk_oturum_1',
      );
      expect(gkSessionPack.totalQuestionCount, equals(60));
      expect(gkSessionPack.standardDurationMinutes, equals(65));
      expect(gkSessionPack.isComingSoon, isFalse);

      const ekpssSelection = ExamSelection(
        family: KpssExamFamily.ekpss,
        educationLevel: EducationLevel.lisans,
        disabilityGroup: DisabilityGroup.gorme,
        includeExtraTime: true,
      );
      final ekpssPrimary = ExamBlueprintRegistry.primaryFullExamFor(
        ekpssSelection,
      );
      expect(ekpssPrimary.totalQuestionCount, equals(60));
      expect(ekpssPrimary.standardDurationMinutes, equals(60));
      expect(
        ekpssPrimary.resolveDuration(ekpssSelection),
        equals(const Duration(minutes: 90)),
      );

      final dhbtPrimary = ExamBlueprintRegistry.primaryFullExamFor(
        const ExamSelection(
          family: KpssExamFamily.dhbt,
          educationLevel: EducationLevel.onlisans,
        ),
      );
      expect(dhbtPrimary.totalQuestionCount, equals(40));
      expect(dhbtPrimary.standardDurationMinutes, equals(60));

      final agsPrimary = ExamBlueprintRegistry.primaryFullExamFor(
        const ExamSelection(
          family: KpssExamFamily.mebAgs,
          oabtBranch: OabtBranch.none,
        ),
      );
      expect(agsPrimary.totalQuestionCount, equals(80));
      expect(agsPrimary.standardDurationMinutes, equals(110));
    });

    test('generateMockExamFromBlueprint eksik bölümleri raporlayıp hazır bölümlerle çökmeden sınav üretmeli', () async {
      final fakeQuestions = [
        for (var i = 0; i < 4; i++)
          {
            'id': 'tar_$i',
            'lesson': 'Tarih',
            'topic': 'Osmanlı Tarihi',
            'text': 'Tarih soru $i',
            'options': ['A', 'B', 'C', 'D', 'E'],
            'correctIndex': 0,
            'explanation': 'Açıklama',
            'examScopes': ['lisans_gygk'],
          },
        for (var i = 0; i < 2; i++)
          {
            'id': 'cog_$i',
            'lesson': 'Coğrafya',
            'topic': 'Coğrafi Konum',
            'text': 'Coğrafya soru $i',
            'options': ['A', 'B', 'C', 'D', 'E'],
            'correctIndex': 1,
            'explanation': 'Açıklama',
            'examScopes': ['lisans_gygk'],
          },
      ];

      final repo = QuestionRepository(
        assetLoader: (_) async => jsonEncode(fakeQuestions),
      );

      const selection = ExamSelection(
        family: KpssExamFamily.bGrubu,
        educationLevel: EducationLevel.lisans,
        bGroupProfile: BGroupProfile.fullGyGk,
      );
      final blueprint = ExamBlueprintRegistry.primaryFullExamFor(selection);

      final generated = await repo.generateMockExamFromBlueprint(
        blueprint,
        selection: selection,
      );

      expect(generated.questions.length, equals(6));
      expect(generated.hasMissingSections, isTrue);
      expect(generated.missingSections, contains('Türkçe'));
      expect(generated.missingSections, contains('Matematik'));
      expect(generated.sectionRanges.length, equals(2));
      expect(generated.sectionRanges.first.section.lesson, equals('Tarih'));
      expect(generated.sectionRanges.first.startIndex, equals(0));
      expect(generated.sectionRanges.first.endIndex, equals(4));
      expect(generated.sectionRanges.last.section.lesson, equals('Coğrafya'));
      expect(generated.sectionRanges.last.startIndex, equals(4));
      expect(generated.sectionRanges.last.endIndex, equals(6));
    });

    testWidgets(
      'QuizScreen paletinde bölüm hızlı geçiş sekmeleri ve ek süre rozeti görünmeli',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        final questions = [
          for (var i = 0; i < 16; i++)
            Question(
              id: 't_$i',
              lesson: 'Türkçe',
              topic: 'Paragraf',
              text: 'Türkçe $i',
              options: const ['A', 'B', 'C', 'D', 'E'],
              correctIndex: 0,
              explanation: 'Açıklama',
            ),
          for (var i = 0; i < 16; i++)
            Question(
              id: 'm_$i',
              lesson: 'Matematik & Geometri',
              topic: 'Problemler',
              text: 'Matematik $i',
              options: const ['A', 'B', 'C', 'D', 'E'],
              correctIndex: 0,
              explanation: 'Açıklama',
            ),
        ];

        const selection = ExamSelection(
          family: KpssExamFamily.ekpss,
          disabilityGroup: DisabilityGroup.gorme,
          includeExtraTime: true,
        );
        final blueprint = ExamBlueprintRegistry.primaryFullExamFor(selection);

        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              home: QuizScreen(
                questions: questions,
                blueprint: blueprint,
                examSelection: selection,
                applyExtraTime: true,
                mode: QuizMode.exam,
              ),
            ),
          ),
        );

        // E-KPSS görme ek süresi (+30 dk -> 90:00)
        expect(find.text('+30 dk'), findsOneWidget);

        // Soru Gezinti Paletini aç ve bölüm quick-jump sekmelerini test et
        await tester.tap(find.byTooltip('Soru Gezinti Paleti'));
        await tester.pumpAndSettle();

        expect(
          find.byKey(const ValueKey('palette_section_all')),
          findsOneWidget,
        );
        expect(
          find.byKey(const ValueKey('palette_section_section_1')),
          findsOneWidget,
        );

        // Matematik sekmesine dokununca yalnızca 17-32 numaralı sorular görünmeli
        await tester.tap(
          find.byKey(const ValueKey('palette_section_section_1')),
        );
        await tester.pumpAndSettle();
        expect(find.text('17'), findsOneWidget);
        expect(find.text('1'), findsNothing);
      },
    );

    test('QuizSessionRecord examScope serileştirme ve geriye dönük uyumluluk sağlamalı', () {
      final legacy = QuizSessionRecord.fromMap({
        'id': 's1',
        'session_title': 'Deneme',
        'lesson': 'Tarih',
        'total_questions': 20,
        'correct_count': 15,
        'wrong_count': 5,
        'empty_count': 0,
        'net_score': 13.75,
        'earned_xp': 250,
        'duration_seconds': 600,
      });
      expect(legacy.examScope, equals('lisans_gk'));

      final multi = QuizSessionRecord(
        id: 's2',
        title: 'DHBT',
        lesson: 'DHBT-1',
        examScope: 'dhbt_onlisans',
        totalQuestions: 40,
        correctCount: 32,
        wrongCount: 4,
        emptyCount: 4,
        netScore: 31.0,
        earnedXp: 500,
        durationSeconds: 1800,
        completedAt: DateTime(2026, 11, 1),
      );
      expect(multi.toMap()['exam_scope'], equals('dhbt_onlisans'));
      expect(
        QuizSessionRecord.fromMap(multi.toMap()).examScope,
        equals('dhbt_onlisans'),
      );
    });
  });
}
