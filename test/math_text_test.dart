import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/core/utils/figure_svg.dart';
import 'package:kadro/core/utils/math_text.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/topic_lessons/presentation/widgets/inline_formatted_text.dart';
import 'package:kadro/shared/widgets/math_text.dart';
import 'package:kadro/shared/widgets/question_figure.dart';

/// TASK-172 — Matematik gösterimi ve soru şekilleri.
///
/// Ortak sözleşme `docs/parity_fixtures/math_text.json`; web aynı dosyayı
/// `npm run test:parity` ile test eder.
void main() {
  final fixture = jsonDecode(
    File('docs/parity_fixtures/math_text.json').readAsStringSync(),
  ) as Map<String, dynamic>;

  group('Eşleniklik: math_text.json', () {
    for (final c in (fixture['cleanCases'] as List).cast<Map>()) {
      test('cleanQuestionText · ${c['description']}', () {
        final expected = c['expected'] as String;
        expect(cleanQuestionText(c['input'] as String), expected);
        // Temizlenmiş metin tekrar temizlenince değişmemeli.
        expect(cleanQuestionText(expected), expected);
        // Soru modeli aynı temizleyiciyi kullanır.
        expect(Question.cleanText(c['input'] as String), expected);
      });
    }

    for (final c in (fixture['segmentCases'] as List).cast<Map>()) {
      test('parseMathSegments · ${c['description']}', () {
        final expected = (c['expected'] as List).cast<Map>().map((e) {
          return e['type'] == 'math'
              ? MathSegment.math(
                  e['value'] as String,
                  display: e['display'] as bool,
                )
              : MathSegment.text(e['value'] as String);
        }).toList();
        expect(parseMathSegments(c['input'] as String), expected);
      });
    }

    test('figureSvg kuralları fixture ile birebir aynı', () {
      final rules = fixture['figureSvg'] as Map<String, dynamic>;
      expect(
        kFigureSvgAllowedTags,
        (rules['allowedTags'] as List).cast<String>().toSet(),
      );
      expect(
        kFigureSvgAllowedAttributes,
        (rules['allowedAttributes'] as List).cast<String>().toSet(),
      );
      expect(
        kFigureSvgForbiddenPatterns,
        (rules['forbiddenPatterns'] as List).cast<String>(),
      );
      expect(kFigureSvgMaxLength, rules['maxLength']);
    });

    final svgCases = ((fixture['figureSvg'] as Map)['cases'] as List)
        .cast<Map>();
    for (final c in svgCases) {
      test('isSafeFigureSvg · ${c['description']}', () {
        expect(isSafeFigureSvg(c['svg'] as String), c['safe']);
      });
    }

    test(
      'her izinli LaTeX komutu flutter_math_fork ile ayrıştırılabiliyor',
      () {
        final samples = (fixture['latexRenderSamples'] as List).cast<String>();
        for (final sample in samples) {
          final math = Math.tex(sample);
          expect(
            math.parseError,
            isNull,
            reason: '"$sample" → ${math.parseError}',
          );
        }
      },
    );
  });

  group('figure_svg yardımcıları', () {
    const svg =
        '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 150" '
        'width="300" height="150" stroke="currentColor"><line x1="0" y1="0" '
        'x2="10" y2="10"/></svg>';

    test('en/boy oranı ve doğal genişlik okunur', () {
      expect(figureSvgAspectRatio(svg), 2);
      expect(figureSvgIntrinsicWidth(svg), 300);
    });

    test('Question.fromSupabase güvenli SVG\'yi alır, zararlıyı eler', () {
      Map<String, dynamic> row(String? figure) => {
        'id': 'q1',
        'lesson': 'Matematik & Geometri',
        'topic': 'Üslü ve Köklü İfadeler',
        'prompt_text': r'$\sqrt{2}$ kaçtır?',
        'interaction_data': {
          'options': ['1', '2', '3', '4', '5'],
          'correctIndex': 0,
        },
        'figure_svg': figure,
      };
      final q = Question.fromSupabase(row(svg));
      expect(q.figureSvg, svg);
      expect(q.text, r'$\sqrt{2}$ kaçtır?');
      expect(
        Question.fromSupabase(
          row('<svg xmlns="x"><script>alert(1)</script></svg>'),
        ).figureSvg,
        isNull,
      );
      expect(Question.fromSupabase(row(null)).figureSvg, isNull);

      // Yerel önbellek (toJson → fromJson) şekli korur.
      final restored = Question.fromJson(q.toJson());
      expect(restored.figureSvg, svg);
    });

    test('mathToPlainText ekran okuyucu için sade metin üretir', () {
      expect(mathToPlainText(r'$\frac{1}{2}$ ve $\sqrt{3}$'), '1/2 ve √(3)');
      expect(mathToPlainText(r'$x \leq 5$'), 'x ≤ 5');
    });
  });

  group('MathText ve QuestionFigure bileşenleri', () {
    Widget host(Widget child) => MaterialApp(
      home: Scaffold(body: SizedBox(width: 360, child: child)),
    );

    testWidgets('matematiksiz metin düz Text olarak çizilir', (tester) async {
      await tester.pumpWidget(host(const MathText('Düz soru metni')));
      expect(find.text('Düz soru metni'), findsOneWidget);
      expect(find.byType(Math), findsNothing);
    });

    testWidgets(r'kaçışlı dolar düz $ olarak gösterilir', (tester) async {
      await tester.pumpWidget(host(const MathText(r'Fiyatı 5 \$ olan')));
      expect(find.text(r'Fiyatı 5 $ olan'), findsOneWidget);
      expect(find.byType(Math), findsNothing);
    });

    testWidgets('satır içi ve ayrık matematik Math ile çizilir', (
      tester,
    ) async {
      await tester.pumpWidget(
        host(
          const MathText(
            'Buna göre \$x^2\$ değeri\n\$\$\\frac{a+b}{2}\$\$\nkaçtır?',
          ),
        ),
      );
      expect(find.byType(Math), findsNWidgets(2));
      expect(tester.takeException(), isNull);
    });

    testWidgets('tüm LaTeX render örnekleri hatasız çizilir', (tester) async {
      final samples = (fixture['latexRenderSamples'] as List).cast<String>();
      for (final sample in samples) {
        await tester.pumpWidget(host(MathText('Örnek: \$$sample\$')));
        expect(tester.takeException(), isNull, reason: sample);
        // Uzun formül işlem işaretlerinden parçalara bölünebilir.
        expect(find.byType(Math), findsWidgets, reason: sample);
      }
    });

    testWidgets(
      'konu anlatımında kalın yazının içindeki formül çizilir, ** görünmez',
      (tester) async {
        await tester.pumpWidget(
          host(
            const InlineFormattedText(
              text:
                  r'bünyesindeki **demir oksitten ($\mathrm{Fe_2O_3}$)** alır',
            ),
          ),
        );
        expect(find.byType(Math), findsWidgets);
        expect(find.textContaining('**', findRichText: true), findsNothing);
        expect(
          find.textContaining('demir oksitten (', findRichText: true),
          findsOneWidget,
        );
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets('QuestionFigure güvenli SVG çizer, zararlıyı çizmez', (
      tester,
    ) async {
      const svg =
          '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 50" '
          'width="100" height="50" stroke="currentColor"><circle cx="5" '
          'cy="5" r="2"/></svg>';
      await tester.pumpWidget(host(const QuestionFigure(svg: svg)));
      expect(find.byType(SvgPicture), findsOneWidget);

      await tester.pumpWidget(
        host(const QuestionFigure(svg: '<svg xmlns="x" onload="x()"></svg>')),
      );
      expect(find.byType(SvgPicture), findsNothing);
    });
  });
}
