import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/shared/widgets/turkey_map/turkey_map.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('TurkeySvgParser ve TurkeyMapData Testleri', () {
    test('81 ilin tamamı eksiksiz tanımlı ve geçerli olmalı', () {
      expect(TurkeyMapData.provinces.length, 81);

      // Başkent ve büyükşehir kontrolleri
      final ankara = TurkeyMapData.getProvince('ankara');
      expect(ankara, isNotNull);
      expect(ankara!.name, 'Ankara');
      expect(ankara.region, TurkeyRegion.icAnadolu);

      // Alias kontrolleri (i-stanbul, i-zmir)
      final istanbul = TurkeyMapData.getProvince('i-stanbul');
      expect(istanbul, isNotNull);
      expect(istanbul!.name, 'İstanbul');
      expect(istanbul.region, TurkeyRegion.marmara);

      final izmir = TurkeyMapData.getProvince('i-zmir');
      expect(izmir, isNotNull);
      expect(izmir!.name, 'İzmir');
      expect(izmir.region, TurkeyRegion.ege);

      final zonguldak = TurkeyMapData.getProvince('zonguldak');
      expect(zonguldak, isNotNull);
      expect(zonguldak!.name, 'Zonguldak');
      expect(zonguldak.region, TurkeyRegion.karadeniz);
    });

    test('Bölge bazlı il sorgulama doğru illeri listelemeli', () {
      final karadeniz = TurkeyMapData.getProvinceIdsInRegion(
        TurkeyRegion.karadeniz,
      );
      expect(karadeniz.contains('zonguldak'), isTrue);
      expect(karadeniz.contains('trabzon'), isTrue);
      expect(karadeniz.contains('samsun'), isTrue);
      expect(karadeniz.contains('ankara'), isFalse);

      final ege = TurkeyMapData.getProvinceIdsInRegion(TurkeyRegion.ege);
      expect(ege.contains('izmir'), isTrue);
      expect(ege.contains('aydin'), isTrue);
      expect(ege.contains('istanbul'), isFalse);
    });

    test('TurkeySvgParser 81 ilin SVG path verisini sorunsuz parse etmeli', () {
      TurkeySvgParser.clearCache();

      for (final prov in TurkeyMapData.provinces.values) {
        final path = TurkeySvgParser.parse(prov.pathData);
        expect(path, isNotNull);
        expect(path.getBounds().isEmpty, isFalse);
      }

      // Önbellek dolmuş olmalı
      expect(TurkeySvgParser.cachedCount, 81);
    });
  });

  group('TurkeyMapMarker ve TurkeyMapConfig Testleri', () {
    test('TurkeyMapMarker.atProvince il merkezini otomatik atamalı', () {
      final marker = TurkeyMapMarker.atProvince('ankara', label: 'I');
      expect(marker.label, 'I');
      expect(marker.offset.dx, greaterThan(300));
      expect(marker.offset.dy, greaterThan(100));
    });

    test(
      'TurkeyMapConfig JSON serileştirme ve geri okuma sorunsuz çalışmalı',
      () {
        const original = TurkeyMapConfig(
          highlightedProvinces: {'zonguldak': Color(0xFFD97706)},
          markers: [
            TurkeyMapMarker(id: 'm1', label: 'I', offset: Offset(358.1, 36.1)),
            TurkeyMapMarker(
              id: 'm2',
              label: 'II',
              offset: Offset(525.4, 232.2),
            ),
          ],
          strokeWidth: 1.2,
        );

        final json = original.toJson();
        final restored = TurkeyMapConfig.fromJson(json);

        expect(restored.highlightedProvinces.containsKey('zonguldak'), isTrue);
        expect(restored.markers.length, 2);
        expect(restored.markers[0].label, 'I');
        expect(restored.markers[1].label, 'II');
        expect(restored.markers[0].offset.dx, closeTo(358.1, 0.01));
        expect(restored.markers[0].offset.dy, closeTo(36.1, 0.01));
        expect(restored.strokeWidth, 1.2);
      },
    );
  });

  group('Question Model Harita Entegrasyon Testleri', () {
    test(
      'map://turkey/tas_komuru URI şeması 5 marker ile otomatik parse edilir',
      () {
        const question = Question(
          id: 'cog_map_001',
          lesson: 'Coğrafya',
          topic: 'Türkiye\'nin Madenleri ve Enerji Kaynakları',
          text: 'Haritada numaralarla gösterilen alanların hangisinde Taş kömürü çıkarılır?',
          options: ['I', 'II', 'III', 'IV', 'V'],
          correctIndex: 0,
          explanation: 'Taş kömürü Zonguldak havzasında çıkarılır.',
          imageUrl: 'map://turkey/tas_komuru',
        );

        final config = question.effectiveMapConfig;
        expect(config, isNotNull);
        expect(config!.markers.length, 5);
        expect(config.markers[0].label, 'I'); // Zonguldak
        expect(config.markers[1].label, 'II'); // İç Anadolu
        expect(config.markers[2].label, 'III'); // Doğu Anadolu
        expect(config.markers[3].label, 'IV'); // Çanakkale
        expect(config.markers[4].label, 'V'); // Balıkesir
      },
    );

    test('map://turkey URI query parametreleri dinamik marker üretmeli', () {
      const uri =
          'map://turkey?provinces=zonguldak,karabuk&markers=I:358.1,36.1;II:525.4,232.2';
      final config = Question.parseMapUri(uri);

      expect(config, isNotNull);
      expect(config!.highlightedProvinces.containsKey('zonguldak'), isTrue);
      expect(config.highlightedProvinces.containsKey('karabuk'), isTrue);
      expect(config.markers.length, 2);
      expect(config.markers[0].label, 'I');
      expect(config.markers[1].label, 'II');
    });
  });

  group('TurkeyMap ve TurkeyMapCard Widget Testleri', () {
    testWidgets('TurkeyMap bileşeni illeri ve markerları render eder', (
      tester,
    ) async {
      String? tappedProvince;
      TurkeyMapMarker? tappedMarker;

      const config = TurkeyMapConfig(
        highlightedProvinces: {'zonguldak': Color(0xFFD97706)},
        markers: [
          TurkeyMapMarker(id: 'm1', label: 'I', offset: Offset(358.1, 36.1)),
          TurkeyMapMarker(id: 'm2', label: 'II', offset: Offset(525.4, 232.2)),
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 500,
                child: TurkeyMap(
                  config: config,
                  onProvinceTap: (p) => tappedProvince = p,
                  onMarkerTap: (m) => tappedMarker = m,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // CustomPaint render edildiğini doğrula
      expect(find.byType(CustomPaint), findsWidgets);
      expect(tappedProvince, isNull);
      expect(tappedMarker, isNull);
    });

    testWidgets(
      'TurkeyMapCard Büyüt butonuna basıldığında InteractiveViewer modalını açar',
      (tester) async {
        const config = TurkeyMapConfig(
          markers: [
            TurkeyMapMarker(id: 'm1', label: 'I', offset: Offset(358.1, 36.1)),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: SingleChildScrollView(
                child: TurkeyMapCard(
                  config: config,
                  title: 'Taş Kömürü Havzası',
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        // Başlık ve Büyüt butonu görünmeli
        expect(find.text('Taş Kömürü Havzası'), findsOneWidget);
        expect(find.text('Büyüt'), findsOneWidget);

        // Büyüt'e tıkla
        await tester.tap(find.text('Büyüt'));
        await tester.pumpAndSettle();

        // Modal açılmış olmalı (InteractiveViewer ve bilgilendirme metni)
        expect(find.byType(InteractiveViewer), findsOneWidget);
        expect(
          find.textContaining('İki parmağınızla yakınlaştırabilirsiniz'),
          findsOneWidget,
        );

        // Kapat'a tıkla
        await tester.tap(find.byType(IconButton).last);
        await tester.pumpAndSettle();

        // Modal kapanmalı
        expect(find.byType(InteractiveViewer), findsNothing);
      },
    );

    testWidgets(
      '1536x700 geniş ve alçak masaüstü penceresinde TurkeyMapCard Büyüt diyaloğu taşma olmadan açılır',
      (tester) async {
        tester.view.physicalSize = const Size(1536, 700);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        const config = TurkeyMapConfig(
          markers: [
            TurkeyMapMarker(id: 'm1', label: 'I', offset: Offset(470, 80)),
            TurkeyMapMarker(id: 'm2', label: 'II', offset: Offset(530, 395)),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: SingleChildScrollView(
                child: TurkeyMapCard(
                  config: config,
                  title: 'KPSS Coğrafya Haritası',
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.text('Büyüt'));
        await tester.pumpAndSettle();

        expect(find.byType(InteractiveViewer), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );
  });
}
