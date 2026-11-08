import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/shared/widgets/population_pyramid/population_pyramid.dart';

void main() {
  group('PopulationPyramid Model & Preset Birim Testleri', () {
    test('Türkiye Güncel Nüfus Piramidi TÜİK verileriyle uyumlu olmalı', () {
      const config = PopulationPresets.turkeyCurrent;
      expect(config.title, contains('Türkiye Nüfus Piramidi'));
      expect(config.medianAge, 34.0);
      expect(config.workingAgePercent, 68.4);
      expect(config.elderlyPercent, 10.2);
      expect(config.ageGroups.length, 17);
      expect(config.educationalNote, contains('Ortanca yaş 34'));
    });

    test(
      'Question.parsePyramidUri pyramid://turkey şemasını doğru çözmeli',
      () {
        final config = Question.parsePyramidUri('pyramid://turkey');
        expect(config, isNotNull);
        expect(config!.medianAge, 34.0);
        expect(config.elderlyPercent, 10.2);

        final nullResult = Question.parsePyramidUri('invalid://uri');
        expect(nullResult, isNull);
      },
    );

    test(
      'Question constructor ve JSON pyramidConfig ile doğru serileşmeli',
      () {
        const question = Question(
          id: 'cog_pyr_01',
          lesson: 'Coğrafya',
          topic: 'Türkiye Nüfusu',
          text: 'Nüfus piramidi sorusu',
          options: ['A', 'B', 'C', 'D', 'E'],
          correctIndex: 0,
          explanation: 'Açıklama',
          pyramidConfig: PopulationPresets.turkeyCurrent,
        );

        expect(question.effectivePyramidConfig, isNotNull);
        expect(question.effectivePyramidConfig!.medianAge, 34.0);

        final json = question.toJson();
        expect(json['pyramid_config'], isNotNull);

        final fromJsonQuestion = Question.fromJson(json);
        expect(fromJsonQuestion.effectivePyramidConfig, isNotNull);
        expect(fromJsonQuestion.effectivePyramidConfig!.medianAge, 34.0);
      },
    );
  });

  group('PopulationPyramidCard Widget Testleri', () {
    testWidgets(
      'PopulationPyramidCard başarıyla render edilmeli ve hap rozetleri içermeli',
      (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: SingleChildScrollView(
                child: PopulationPyramidCard(
                  config: PopulationPresets.turkeyCurrent,
                ),
              ),
            ),
          ),
        );

        expect(find.textContaining('Türkiye Nüfus Piramidi'), findsOneWidget);
        expect(find.textContaining('Ortanca Yaş: 34.0'), findsOneWidget);
        expect(find.textContaining('15-64 Aktif: %68.4'), findsOneWidget);
        expect(find.textContaining('65+ Yaşlı: %10.2'), findsOneWidget);
        expect(find.text('Büyüt'), findsOneWidget);
        expect(find.byType(PopulationPyramid), findsOneWidget);
      },
    );

    testWidgets('Büyüt butonuna tıklandığında tam ekran modal açılmalı', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: PopulationPyramidCard(
                config: PopulationPresets.turkeyCurrent,
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Büyüt'));
      await tester.pumpAndSettle();

      expect(find.byType(InteractiveViewer), findsOneWidget);
      expect(
        find.textContaining('Çift parmakla yakınlaştırabilirsiniz'),
        findsOneWidget,
      );
    });
  });
}
