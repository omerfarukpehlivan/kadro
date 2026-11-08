import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/shared/widgets/geo_diagram/geo_diagram.dart';

void main() {
  group('GeoDiagram Model & Preset Birim Testleri', () {
    test('Horst-Graben referans modeli doğru değerlere sahip olmalı', () {
      const config = GeoPresets.horstGraben;
      expect(config.type, GeoDiagramType.horstGraben);
      expect(config.title, contains('Horst - Graben'));
      expect(config.badges, contains('HORST (Yüksekte Kalan)'));
      expect(config.badges, contains('GRABEN (Çöken Ova)'));
      expect(config.educationalNote, contains('Kaz, Madra, Yunt'));
    });

    test(
      'Antiklinal-Senklinal referans modeli doğru değerlere sahip olmalı',
      () {
        const config = GeoPresets.antiklinalSenklinal;
        expect(config.type, GeoDiagramType.antiklinalSenklinal);
        expect(config.title, contains('Antiklinal - Senklinal'));
        expect(config.badges, contains('ANTİKLİNAL (Kıvrım Tepesi)'));
      },
    );

    test('Vadi Tipleri referans modeli 4 ana vadi türünü içermeli', () {
      const config = GeoPresets.vadiTipleri;
      expect(config.type, GeoDiagramType.vadiTipleri);
      expect(config.badges.length, 4);
      expect(config.educationalNote, contains('Çentik'));
      expect(config.educationalNote, contains('Menderes'));
    });

    test('Karstik Kesit ve Tombolo modelleri doğru değerlere sahip olmalı', () {
      expect(GeoPresets.karstikKesit.type, GeoDiagramType.karstikKesit);
      expect(GeoPresets.tombolo.type, GeoDiagramType.tombolo);
      expect(GeoPresets.tombolo.educationalNote, contains('Kapıdağ'));
    });

    test('Question.parseGeoUri URI şemasını doğru presetlere çevirmeli', () {
      final horst = Question.parseGeoUri('geo://horst_graben');
      expect(horst, isNotNull);
      expect(horst!.type, GeoDiagramType.horstGraben);

      final kivrim = Question.parseGeoUri('geo://antiklinal_senklinal');
      expect(kivrim, isNotNull);
      expect(kivrim!.type, GeoDiagramType.antiklinalSenklinal);

      final vadi = Question.parseGeoUri('geo://vadi_tipleri');
      expect(vadi, isNotNull);
      expect(vadi!.type, GeoDiagramType.vadiTipleri);

      final karstik = Question.parseGeoUri('geo://karstik_kesit');
      expect(karstik, isNotNull);
      expect(karstik!.type, GeoDiagramType.karstikKesit);

      final tombolo = Question.parseGeoUri('geo://tombolo');
      expect(tombolo, isNotNull);
      expect(tombolo!.type, GeoDiagramType.tombolo);
    });
  });

  group('GeoDiagramCard Widget Testleri', () {
    testWidgets(
      'GeoDiagramCard başarıyla render edilmeli ve kesit bileşenlerini göstermeli',
      (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: SingleChildScrollView(
                child: GeoDiagramCard(config: GeoPresets.horstGraben),
              ),
            ),
          ),
        );

        // Başlık ve Büyüt butonu kontrolü
        expect(find.text('KPSS Jeomorfoloji & Yer Şekli'), findsOneWidget);
        expect(find.text('Büyüt'), findsOneWidget);
        expect(
          find.text('Kırıklı Dağ Oluşumu (Horst - Graben)'),
          findsOneWidget,
        );

        // Alt eğitici not kontrolü
        expect(find.textContaining('Kaz, Madra, Yunt'), findsOneWidget);
      },
    );
  });
}
