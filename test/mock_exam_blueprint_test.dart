import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/exams/data/mock_difficulty_cap.dart';
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
      // Matematik havuzu eklendikten sonra Tam GY-GK denemeleri açıktır (TASK-174)
      expect(gyGkPrimary.isComingSoon, isFalse);

      final bGroupPacks = ExamBlueprintRegistry.forSelection(bGroupLisans);
      final tamGygk2 = bGroupPacks.firstWhere((b) => b.id == 'b_gygk_tam_2');
      expect(tamGygk2.totalQuestionCount, equals(120));
      expect(tamGygk2.isComingSoon, isFalse);
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

    test('TASK-167: Ortaöğretim GK oturum denemesinde her bölümde zor soru <= tavan olur, Lisans denemesinde tavan uygulanmaz ve kolay+orta yetmezse deneme tam üretilir', () async {
      // Her GK dersinde ilk soruların büyük kısmı zor ('3'), kalanları orta ('2') olan sahte havuz
      final fakePool = <Map<String, dynamic>>[];

      void addLessonQuestions(
        String lesson,
        String topic, {
        required int hardCount,
        required int mediumCount,
      }) {
        for (var i = 0; i < hardCount; i++) {
          fakePool.add({
            'id': '${lesson}_hard_$i',
            'lesson': lesson,
            'topic': topic,
            'text': '$lesson zor soru $i',
            'options': ['A', 'B', 'C', 'D', 'E'],
            'correctIndex': 0,
            'explanation': 'Açıklama',
            'difficulty': '3',
            'exam_scopes': ['b_grubu_gk', 'lisans_gk'],
          });
        }
        for (var i = 0; i < mediumCount; i++) {
          fakePool.add({
            'id': '${lesson}_med_$i',
            'lesson': lesson,
            'topic': topic,
            'text': '$lesson orta soru $i',
            'options': ['A', 'B', 'C', 'D', 'E'],
            'correctIndex': 0,
            'explanation': 'Açıklama',
            'difficulty': '2',
            'exam_scopes': ['b_grubu_gk', 'lisans_gk'],
          });
        }
      }

      // Her ders için bolca zor soru (ilk sırada) ve yeterli orta soru ekle
      addLessonQuestions(
        'Tarih',
        'Osmanlı Kültür ve Uygarlığı',
        hardCount: 25,
        mediumCount: 30,
      );
      addLessonQuestions(
        'Coğrafya',
        "Türkiye'nin Coğrafi Konumu",
        hardCount: 15,
        mediumCount: 20,
      );
      addLessonQuestions(
        'Vatandaşlık',
        '1982 Anayasası ve Temel İlkeler',
        hardCount: 8,
        mediumCount: 12,
      );
      addLessonQuestions(
        'Güncel Bilgiler',
        'Türkiye ve Dünya Gündemi',
        hardCount: 6,
        mediumCount: 8,
      );

      final repo = QuestionRepository(
        assetLoader: (_) async => jsonEncode(fakePool),
      );

      const ortaogretimSelection = ExamSelection(
        family: KpssExamFamily.bGrubu,
        educationLevel: EducationLevel.ortaogretim,
      );
      final gkBlueprint = ExamBlueprintRegistry.forSelection(
        ortaogretimSelection,
      ).firstWhere((b) => b.id == 'b_gk_oturum_1');

      final ortaGenerated = await repo.generateMockExamFromBlueprint(
        gkBlueprint,
        selection: ortaogretimSelection,
      );

      expect(ortaGenerated.questions.length, equals(60));
      for (final range in ortaGenerated.sectionRanges) {
        final sectionQuestions = ortaGenerated.questions.sublist(
          range.startIndex,
          range.endIndex,
        );
        final hardInSection = sectionQuestions
            .where((q) => q.difficultyLevel == 3)
            .length;
        final cap = maxHardQuestionsForSection(
          EducationLevel.ortaogretim,
          range.section.questionCount,
        )!;
        expect(
          hardInSection,
          lessThanOrEqualTo(cap),
          reason:
              '${range.section.lesson} bölümünde zor soru sayısı ($hardInSection) tavanı ($cap) aşmamalı',
        );
      }

      // Lisans denemesinde tavan uygulanmaz (ilk sıradaki zor sorular doğrudan seçilir)
      const lisansSelection = ExamSelection(
        family: KpssExamFamily.bGrubu,
        educationLevel: EducationLevel.lisans,
      );
      final lisansGkBlueprint = ExamBlueprintRegistry.forSelection(
        lisansSelection,
      ).firstWhere((b) => b.id == 'b_gk_oturum_1');
      final lisansGenerated = await repo.generateMockExamFromBlueprint(
        lisansGkBlueprint,
        selection: lisansSelection,
      );
      expect(lisansGenerated.questions.length, equals(60));
      final lisansTarihHard = lisansGenerated.questions
          .where((q) => q.lesson == 'Tarih' && q.difficultyLevel == 3)
          .length;
      expect(lisansTarihHard, greaterThan(4));

      // Kolay+orta havuzu yetmezse eksik kalan yer zor sorularla doldurulur (deneme tam üretilir)
      final onlyHardPool = <Map<String, dynamic>>[
        for (var i = 0; i < 18; i++)
          {
            'id': 'only_hard_cog_$i',
            'lesson': 'Coğrafya',
            'topic': "Türkiye'nin Coğrafi Konumu",
            'text': 'Zor Coğrafya $i',
            'options': ['A', 'B', 'C', 'D', 'E'],
            'correctIndex': 0,
            'explanation': 'Açıklama',
            'difficulty': '3',
            'exam_scopes': ['b_grubu_gk'],
          },
      ];
      final onlyHardRepo = QuestionRepository(
        assetLoader: (_) async => jsonEncode(onlyHardPool),
      );
      const cogOnlyBlueprint = MockExamBlueprint(
        id: 'test_cog_18',
        title: 'Coğrafya Denemesi',
        subtitle: '18 Soru',
        badgeLabel: '18 Soru',
        family: KpssExamFamily.bGrubu,
        scopeKey: 'ortaogretim_gygk',
        sections: [
          ExamSectionSpec(
            id: 'cografya',
            lesson: 'Coğrafya',
            title: 'Coğrafya',
            questionCount: 18,
          ),
        ],
        standardDurationMinutes: 20,
      );
      final fallbackGenerated = await onlyHardRepo
          .generateMockExamFromBlueprint(
            cogOnlyBlueprint,
            selection: ortaogretimSelection,
          );
      expect(fallbackGenerated.questions.length, equals(18));
    });

    test('TASK-176: Lisans Matematik denemesinde 14 konu kotası ve karma zorluk seçilir, Ön Lisans tavanı (<= 4) korunur', () async {
      const topics = [
        'Temel Kavramlar ve Sayı Basamakları',
        'Bölme-Bölünebilme ve EBOB-EKOK',
        'Rasyonel ve Ondalık Sayılar',
        'Basit Eşitsizlikler ve Mutlak Değer',
        'Üslü ve Köklü İfadeler',
        'Çarpanlara Ayırma ve Oran-Orantı',
        'Denklem Çözme ve Sayı-Kesir Problemleri',
        'Yaş, İşçi, Hareket, Yüzde ve Karışım Problemleri',
        'Kümeler, Bağıntı-Fonksiyon ve Modüler Aritmetik',
        'Permütasyon, Kombinasyon ve Olasılık',
        'Sayısal Mantık ve Tablo-Grafik Yorumlama',
        'Doğruda ve Üçgende Açılar, Üçgenler',
        'Çokgenler, Dörtgenler ve Çember-Daire',
        'Analitik Geometri ve Katı Cisimler',
      ];
      // Her konuda 12 kolay (1), 15 orta (2), 8 zor (3) -> sıralı d1 -> d2 -> d3
      final mathPool = <Map<String, dynamic>>[
        for (var tIdx = 0; tIdx < topics.length; tIdx++)
          for (final (diff, cnt) in [(1, 12), (2, 15), (3, 8)])
            for (var i = 0; i < cnt; i++)
              {
                'id': 'm_${tIdx}_d${diff}_$i',
                'lesson': 'Matematik & Geometri',
                'topic': topics[tIdx],
                'text': 'Matematik soru $tIdx $diff $i',
                'options': ['A', 'B', 'C', 'D', 'E'],
                'correctIndex': 0,
                'explanation': 'Açıklama',
                'difficulty': '$diff',
                'exam_scopes': ['lisans_gygk', 'b_grubu_gygk'],
              },
      ];

      final repo = QuestionRepository(
        assetLoader: (_) async => jsonEncode(mathPool),
      );

      const lisansSel = ExamSelection(
        family: KpssExamFamily.bGrubu,
        educationLevel: EducationLevel.lisans,
      );
      const mathSectionBp = MockExamBlueprint(
        id: 'b_gygk_tam_1',
        title: 'Lisans Tam GY-GK Deneme #1',
        subtitle: 'Matematik bölümü testi',
        badgeLabel: '30 Soru',
        family: KpssExamFamily.bGrubu,
        scopeKey: 'lisans_gygk',
        sections: [
          ExamSectionSpec(
            id: 'matematik',
            lesson: 'Matematik & Geometri',
            title: 'Matematik',
            questionCount: 30,
          ),
        ],
        standardDurationMinutes: 35,
      );

      final lisansGen = await repo.generateMockExamFromBlueprint(
        mathSectionBp,
        selection: lisansSel,
      );
      expect(lisansGen.questions.length, equals(30));
      expect(
        lisansGen.questions.map((q) => q.topic).toSet().length,
        equals(14),
      );
      final d1Count = lisansGen.questions
          .where((q) => q.difficultyLevel == 1)
          .length;
      final d2Count = lisansGen.questions
          .where((q) => q.difficultyLevel == 2)
          .length;
      final d3Count = lisansGen.questions
          .where((q) => q.difficultyLevel == 3)
          .length;
      expect(d1Count, lessThan(15));
      expect(d2Count, greaterThanOrEqualTo(12));
      expect(d3Count, greaterThanOrEqualTo(4));

      const onlisansSel = ExamSelection(
        family: KpssExamFamily.bGrubu,
        educationLevel: EducationLevel.onlisans,
      );
      final onlisansGen = await repo.generateMockExamFromBlueprint(
        mathSectionBp,
        selection: onlisansSel,
      );
      expect(onlisansGen.questions.length, equals(30));
      final onlisansHard = onlisansGen.questions
          .where((q) => q.difficultyLevel == 3)
          .length;
      final onlisansMedium = onlisansGen.questions
          .where((q) => q.difficultyLevel == 2)
          .length;
      expect(onlisansHard, lessThanOrEqualTo(4));
      expect(onlisansMedium, greaterThanOrEqualTo(10));
    });
  });
}
