import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/shared/widgets/sun_diagram/sun_diagram.dart';

void main() {
  group('SunDiagram Model & Preset Birim Testleri', () {
    test('21 Haziran modeli Yaz Gündönümü ve Sinop > Hatay gündüz bilgisini içermeli', () {
      const config = SunPresets.haziran21;
      expect(config.type, SunDiagramType.haziran21);
      expect(config.title, contains('21 Haziran'));
      expect(config.badges, contains('Sinop > Hatay (Gündüz)'));
      expect(config.subtitle, contains('Yengeç Dönencesi'));
    });

    test(
      '21 Aralık modeli Kış Gündönümü ve Sinop en uzun gece bilgisini içermeli',
      () {
        const config = SunPresets.aralik21;
        expect(config.type, SunDiagramType.aralik21);
        expect(config.title, contains('21 Aralık'));
        expect(config.badges, contains('Sinop > Hatay (Gece)'));
        expect(config.subtitle, contains('Oğlak Dönencesi'));
      },
    );

    test('Ekinoks modeli 12 saat gece/gündüz eşitliği bilgisini içermeli', () {
      const config = SunPresets.ekinoks;
      expect(config.type, SunDiagramType.ekinoks);
      expect(config.title, contains('Ekinoks'));
      expect(config.badges, contains('Gece = Gündüz (12 Saat)'));
    });

    test('Gölge Yönü modeli Türkiye için gölgenin daima Kuzeye düşmesi kuralını içermeli', () {
      const config = SunPresets.golgeYonu;
      expect(config.type, SunDiagramType.golgeYonu);
      expect(config.title, contains('Gölge Yönü'));
      expect(config.badges, contains('Öğle Vakti Gölge Daima KUZEYİ Gösterir'));
      expect(config.badges, contains('Gölge Boyu Asla Sıfır Olmaz'));
    });

    test(
      'Question.parseSunUri tüm sun:// şemalarını doğru presetlere eşlemeli',
      () {
        final haziran = Question.parseSunUri('sun://21_haziran');
        expect(haziran, isNotNull);
        expect(haziran!.type, SunDiagramType.haziran21);

        final aralik = Question.parseSunUri('sun://21_aralik');
        expect(aralik, isNotNull);
        expect(aralik!.type, SunDiagramType.aralik21);

        final ekinoks = Question.parseSunUri('sun://ekinoks');
        expect(ekinoks, isNotNull);
        expect(ekinoks!.type, SunDiagramType.ekinoks);

        final golge = Question.parseSunUri('sun://golge');
        expect(golge, isNotNull);
        expect(golge!.type, SunDiagramType.golgeYonu);

        final invalid = Question.parseSunUri('invalid://sun');
        expect(invalid, isNull);
      },
    );

    test('Question constructor ve JSON sunConfig ile doğru serileşmeli', () {
      const question = Question(
        id: 'cog_sun_01',
        lesson: 'Coğrafya',
        topic: 'Türkiye Coğrafi Konumu',
        text: 'Gölge şeması sorusu',
        options: ['A', 'B', 'C', 'D', 'E'],
        correctIndex: 0,
        explanation: 'Açıklama',
        sunConfig: SunPresets.golgeYonu,
      );

      expect(question.effectiveSunConfig, isNotNull);
      expect(question.effectiveSunConfig!.type, SunDiagramType.golgeYonu);

      final json = question.toJson();
      expect(json['sun_config'], isNotNull);

      final fromJsonQuestion = Question.fromJson(json);
      expect(fromJsonQuestion.effectiveSunConfig, isNotNull);
      expect(
        fromJsonQuestion.effectiveSunConfig!.type,
        SunDiagramType.golgeYonu,
      );
    });
  });

  group('SunDiagramCard Widget Testleri', () {
    testWidgets(
      'SunDiagramCard başarıyla render edilmeli ve başlık ile eğitici notu göstermeli',
      (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: SingleChildScrollView(
                child: SunDiagramCard(config: SunPresets.golgeYonu),
              ),
            ),
          ),
        );

        expect(find.textContaining('Gölge Yönü'), findsOneWidget);
        expect(
          find.textContaining(
            'Öğle vakti (12:00) gölge yönü DAİMA KUZEYİ gösterir',
          ),
          findsOneWidget,
        );
        expect(find.text('Büyüt'), findsOneWidget);
        expect(find.byType(SunDiagram), findsOneWidget);
      },
    );

    testWidgets('Büyüt butonuna tıklandığında tam ekran modal açılmalı', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SunDiagramCard(config: SunPresets.haziran21),
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
