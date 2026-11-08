import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/shared/widgets/climate_chart/climate_chart.dart';

void main() {
  group('ClimateChart Model & Preset Birim Testleri', () {
    test('Akdeniz iklimi referans verileri doğru hesaplanmalı', () {
      final config = ClimatePresets.akdeniz;
      expect(config.monthlyData.length, 12);
      expect(config.totalPrecipitation, greaterThan(900.0));
      expect(config.averageTemperature, greaterThan(17.0));
      expect(config.wettestSeason, contains('Kış'));
      expect(config.hasFrostRisk, isFalse);
    });

    test('Karadeniz ikliminde en yağışlı mevsim Sonbahar olmalı', () {
      final config = ClimatePresets.karadeniz;
      expect(config.monthlyData.length, 12);
      expect(config.totalPrecipitation, greaterThan(2000.0));
      expect(config.wettestSeason, contains('Sonbahar'));
      expect(config.hasFrostRisk, isFalse);
    });

    test('İç Anadolu Karasal ikliminde en yağışlı mevsim İlkbahar olmalı', () {
      final config = ClimatePresets.karasal;
      expect(config.monthlyData.length, 12);
      expect(config.totalPrecipitation, lessThan(500.0));
      expect(config.wettestSeason, contains('İlkbahar'));
      expect(config.hasFrostRisk, isTrue);
    });

    test('Sert Karasal ikliminde yaz yağışları ve kış don riski bulunmalı', () {
      final config = ClimatePresets.sertKarasal;
      expect(config.monthlyData.length, 12);
      expect(config.wettestSeason, contains('Yaz'));
      expect(config.hasFrostRisk, isTrue);
      // Kış aylarında sıcaklık eksiye inmeli
      expect(config.monthlyData[0].temperature, lessThan(0.0));
      expect(config.monthlyData[11].temperature, lessThan(0.0));
    });

    test(
      'Question.parseClimateUri URI şemasını doğru presetlere çevirmeli',
      () {
        final akdeniz = Question.parseClimateUri('climate://akdeniz');
        expect(akdeniz, isNotNull);
        expect(akdeniz!.title, contains('Akdeniz'));

        final karadeniz = Question.parseClimateUri(
          'climate://turkey/karadeniz',
        );
        expect(karadeniz, isNotNull);
        expect(karadeniz!.title, contains('Karadeniz'));

        final karasal = Question.parseClimateUri('climate://karasal');
        expect(karasal, isNotNull);
        expect(karasal!.title, contains('Karasal'));

        final sertKarasal = Question.parseClimateUri('climate://sert_karasal');
        expect(sertKarasal, isNotNull);
        expect(sertKarasal!.title, contains('Sert Karasal'));

        final guneydogu = Question.parseClimateUri('climate://guneydogu');
        expect(guneydogu, isNotNull);
        expect(guneydogu!.title, contains('Güneydoğu'));
      },
    );
  });

  group('ClimateChartCard Widget Testleri', () {
    testWidgets(
      'ClimateChartCard başarıyla render edilmeli ve bileşenleri göstermeli',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: SingleChildScrollView(
                child: ClimateChartCard(config: ClimatePresets.akdeniz),
              ),
            ),
          ),
        );

        // Başlık ve Büyüt butonu kontrolü
        expect(
          find.text('KPSS İklim Analizi (Sıcaklık & Yağış)'),
          findsOneWidget,
        );
        expect(find.text('Büyüt'), findsOneWidget);

        // Lejant kontrolü
        expect(find.text('Yağış (mm)'), findsOneWidget);
        expect(find.text('Sıcaklık (°C)'), findsOneWidget);

        // İstatistik rozetleri kontrolü
        expect(find.textContaining('Yıllık Yağış:'), findsOneWidget);
        expect(find.textContaining('Ort. Sıcaklık:'), findsOneWidget);
        expect(find.textContaining('Kış'), findsOneWidget);
      },
    );
  });
}
