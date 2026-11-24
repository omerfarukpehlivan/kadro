import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/core/utils/leitner_scheduler.dart';
import 'package:kadro/features/exams/data/mock_difficulty_cap.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/score_calculator/data/kpss_score_calculator.dart';
import 'package:kadro/features/topic_lessons/data/models/topic_lesson_models.dart';

/// Mobil ↔ Web eşleniklik testleri.
///
/// `docs/parity_fixtures/*.json` dosyaları mobil (`gunisigi`) ve web
/// (`kadro-web`) için ORTAK beklenen çıktılardır. Web deposu aynı dosyaları
/// `../gunisigi/docs/parity_fixtures` yolundan okuyup kendi motorunu test eder.
/// Böylece iki platformdan biri kuralı değiştirip diğeri unutursa testler
/// kırmızıya döner.
///
/// Angular/Web Karşılığı: İki farklı servisin (`ScoreService`) aynı
/// "golden file" (`*.snapshot.json`) dosyasına karşı test edilmesi.
Map<String, dynamic> _loadFixture(String name) {
  final file = File('docs/parity_fixtures/$name');
  return jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
}

void main() {
  group('Eşleniklik: KPSS B Grubu puan motoru', () {
    final fixture = _loadFixture('score_b_group.json');
    final levels = fixture['levels'] as Map<String, dynamic>;
    final cases = (fixture['cases'] as List).cast<Map<String, dynamic>>();

    for (final c in cases) {
      test(c['description'] as String, () {
        final level = levels[c['level']] as Map<String, dynamic>;
        final scoreType = KpssScoreType.values.byName(
          level['mobileScoreType'] as String,
        );
        final input = c['input'] as Map<String, dynamic>;
        final gy = input['gy'] as Map<String, dynamic>;
        final gk = input['gk'] as Map<String, dynamic>;
        final expected = c['expected'] as Map<String, dynamic>;
        final expectedGy = expected['gy'] as Map<String, dynamic>;
        final expectedGk = expected['gk'] as Map<String, dynamic>;

        final summary = KpssScoreCalculator.calculate(
          scoreType: scoreType,
          gyCorrect: gy['correct'] as int,
          gyWrong: gy['wrong'] as int,
          gkCorrect: gk['correct'] as int,
          gkWrong: gk['wrong'] as int,
        );

        expect(summary.gyCorrect, expectedGy['correct']);
        expect(summary.gyWrong, expectedGy['wrong']);
        expect(summary.gyEmpty, expectedGy['empty']);
        expect(summary.gkCorrect, expectedGk['correct']);
        expect(summary.gkWrong, expectedGk['wrong']);
        expect(summary.gkEmpty, expectedGk['empty']);
        expect(summary.gyNet, closeTo(expectedGy['net'] as num, 0.001));
        expect(summary.gkNet, closeTo(expectedGk['net'] as num, 0.001));
        expect(summary.totalNet, closeTo(expected['totalNet'] as num, 0.001));
        expect(summary.isThresholdMet, expected['isThresholdMet']);
        expect(
          summary.primaryScore,
          closeTo(expected['primaryScore'] as num, 0.001),
        );

        final years = (expected['years'] as List).cast<Map<String, dynamic>>();
        expect(summary.historicalResults.length, years.length);
        for (var i = 0; i < years.length; i++) {
          expect(summary.historicalResults[i].year, years[i]['year']);
          expect(
            summary.historicalResults[i].score,
            closeTo(years[i]['score'] as num, 0.001),
          );
        }
      });
    }
  });

  group('Eşleniklik: Leitner aralıklı tekrar', () {
    final fixture = _loadFixture('leitner.json');

    test('Kutu aralıkları ortak sözleşmeyle aynı', () {
      expect(
        LeitnerScheduler.boxIntervalDays,
        (fixture['boxIntervalDays'] as List).cast<int>(),
      );
    });

    final cases = (fixture['cases'] as List).cast<Map<String, dynamic>>();
    for (final c in cases) {
      final input = c['input'] as Map<String, dynamic>;
      final expected = c['expected'] as Map<String, dynamic>;
      test('Kutu ${input['currentBox']} · seri ${input['box4Streak']} · '
          '${input['isCorrect'] == true ? 'doğru' : 'yanlış'}', () {
        final now = DateTime.utc(2026, 1, 1, 12);
        final result = LeitnerScheduler.advance(
          currentBox: input['currentBox'] as int,
          currentBox4Streak: input['box4Streak'] as int,
          isCorrect: input['isCorrect'] as bool,
          now: now,
        );

        expect(result.reviewBox, expected['nextBox']);
        expect(result.box4ConsecutiveCorrect, expected['nextBox4Streak']);
        expect(result.isGraduated, expected['graduated']);
        expect(
          result.nextReviewAt.difference(now).inDays,
          expected['intervalDays'],
        );
      });
    }
  });

  group('Eşleniklik: Sınav kapsamları (exam_scopes.json)', () {
    final fixture = _loadFixture('exam_scopes.json');
    final cases = (fixture['cases'] as List).cast<Map<String, dynamic>>();

    for (final c in cases) {
      test(c['description'] as String, () {
        final input = c['input'] as Map<String, dynamic>;
        final expected = c['expected'] as Map<String, dynamic>;
        final selection = ExamSelection.fromJson(input);

        expect(selection.bGroupProfile.key, expected['bGroupProfile']);
        expect(selection.scopeKey, expected['scopeKey']);

        final actualScopes = selection.acceptedQuestionScopes.toList()..sort();
        final expectedScopes =
            (expected['acceptedQuestionScopes'] as List).cast<String>().toList()
              ..sort();
        expect(actualScopes, expectedScopes);
      });
    }
  });

  group('Eşleniklik: Deneme zor soru tavanı (mock_difficulty_cap.json)', () {
    final fixture = _loadFixture('mock_difficulty_cap.json');
    final cases = (fixture['cases'] as List).cast<Map<String, dynamic>>();

    for (final c in cases) {
      test(c['description'] as String, () {
        final input = c['input'] as Map<String, dynamic>;
        final level = EducationLevel.fromKey(input['level'] as String);
        final sectionQuestionCount = input['sectionQuestionCount'] as int;
        final expectedMaxHard = c['expectedMaxHard'] as int?;

        expect(
          maxHardQuestionsForSection(level, sectionQuestionCount),
          equals(expectedMaxHard),
        );
      });
    }
  });

  group('Eşleniklik: Konu Anlatımı (topic_lesson_units.json)', () {
    final fixture = _loadFixture('topic_lesson_units.json');

    final blockCases = (fixture['blockParsingCases'] as List)
        .cast<Map<String, dynamic>>();
    for (final c in blockCases) {
      test(c['description'] as String, () {
        final rawUnit = c['unit'] as Map<String, dynamic>;
        final expected = c['expected'] as Map<String, dynamic>;
        final unit = TopicLessonUnit.fromJson(rawUnit);

        expect(
          unit.blockTypes,
          equals((expected['blockTypes'] as List).cast<String>()),
        );
        expect(unit.checkQuestionCount, equals(expected['checkQuestionCount']));
        // TASK-172: paragraftaki $...$ matematik korunur; figure alt yazısı okunur.
        if (expected['paragraphText'] != null) {
          final paragraph = unit.blocks
              .whereType<TopicLessonParagraphBlock>()
              .first;
          expect(paragraph.text, equals(expected['paragraphText']));
        }
        if (expected['figureCaption'] != null) {
          final figure = unit.blocks.whereType<TopicLessonFigureBlock>().first;
          expect(figure.caption, equals(expected['figureCaption']));
          expect(figure.svg, startsWith('<svg '));
        }
      });
    }

    final checkQuestionCases = (fixture['autoCheckQuestionCases'] as List)
        .cast<Map<String, dynamic>>();
    for (final c in checkQuestionCases) {
      test(c['description'] as String, () {
        final unitOrder = c['unitOrder'] as int;
        final explicitIds = (c['explicitQuestionIds'] as List).cast<String>();
        final rawQuestions = (c['questions'] as List)
            .cast<Map<String, dynamic>>();
        final questions = rawQuestions
            .map(
              (q) => Question(
                id: q['id'] as String,
                lesson: 'Tarih',
                topic: 'İslamiyet Öncesi Türk Tarihi',
                text: 'Soru ${q['id']}',
                options: const ['A', 'B', 'C', 'D', 'E'],
                correctIndex: 0,
                explanation: 'Açıklama',
                difficulty: q['difficulty'].toString(),
                orderIndex: (q['order_index'] as num?)?.toInt(),
              ),
            )
            .toList();

        final selected = TopicLessonDomain.selectCheckQuestions(
          topicQuestions: questions,
          unitOrder: unitOrder,
          explicitQuestionIds: explicitIds,
        );
        expect(
          selected.map((q) => q.id).toList(),
          equals((c['expectedQuestionIds'] as List).cast<String>()),
        );
      });
    }

    final progressCases = (fixture['progressCases'] as List)
        .cast<Map<String, dynamic>>();
    for (final c in progressCases) {
      test(c['description'] as String, () {
        final completedCount = c['completedCount'] as int;
        final totalPublishedCount = c['totalPublishedCount'] as int;
        final expectedPercent = c['expectedPercent'] as int;

        expect(
          TopicLessonDomain.computeProgressPercent(
            completedCount: completedCount,
            totalPublishedCount: totalPublishedCount,
          ),
          equals(expectedPercent),
        );
      });
    }
  });
}
