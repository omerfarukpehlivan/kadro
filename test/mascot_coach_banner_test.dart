import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/shared/widgets/mascot_coach_banner.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

void main() {
  group('TASK-68: MascotMood & MascotMoodExtension (12 Mod) Testleri', () {
    test('MascotMood tam olarak 12 özgün karakter modu içermeli', () {
      expect(MascotMood.values.length, 12);
      expect(
        MascotMood.values,
        containsAll([
          MascotMood.coach,
          MascotMood.victory,
          MascotMood.detective,
          MascotMood.pro,
          MascotMood.history,
          MascotMood.geography,
          MascotMood.citizenship,
          MascotMood.current,
          MascotMood.practice,
          MascotMood.exam,
          MascotMood.analyst,
          MascotMood.streak,
        ]),
      );
    });

    test('fromLesson metodu ders isimlerini doğru Tuğrul mood varyasyonlarına eşlemeli', () {
      expect(MascotMoodExtension.fromLesson('Tarih'), MascotMood.history);
      expect(MascotMoodExtension.fromLesson('tarih'), MascotMood.history);

      expect(MascotMoodExtension.fromLesson('Coğrafya'), MascotMood.geography);
      expect(MascotMoodExtension.fromLesson('cografya'), MascotMood.geography);

      expect(
        MascotMoodExtension.fromLesson('Vatandaşlık'),
        MascotMood.citizenship,
      );
      expect(
        MascotMoodExtension.fromLesson('vatandaslik'),
        MascotMood.citizenship,
      );

      expect(
        MascotMoodExtension.fromLesson('Güncel Bilgiler'),
        MascotMood.current,
      );
      expect(MascotMoodExtension.fromLesson('guncel'), MascotMood.current);

      // Eşleşmeyen veya null derslerde koç fallback'i dönmeli
      expect(MascotMoodExtension.fromLesson('Bilinmeyen'), MascotMood.coach);
      expect(MascotMoodExtension.fromLesson(null), MascotMood.coach);
      expect(MascotMoodExtension.fromLesson(''), MascotMood.coach);
    });

    test('Tüm 12 MascotMood değeri geçerli assetPath, badgeIcon ve dolu coachTips döndürmeli', () {
      for (final mood in MascotMood.values) {
        final path = mood.assetPath;
        expect(
          path.isNotEmpty,
          true,
          reason: '$mood için assetPath boş olamaz',
        );
        expect(
          path.startsWith('assets/images/mascot/tugrul_'),
          true,
          reason: '$mood assetPath doğru adlandırma kuralında olmalı',
        );
        expect(
          path.endsWith('.png'),
          true,
          reason: '$mood assetPath PNG olmalı',
        );

        // Her mood için badgeIcon doğrulaması
        expect(mood.badgeIcon, isNotNull);

        // Her mood için en az 4 adet coachTips doğrulaması
        final tips = mood.coachTips;
        expect(
          tips.length >= 4,
          true,
          reason: '$mood için en az 4 adet koç tüyosu bulunmalı',
        );
        for (final tip in tips) {
          expect(tip.isNotEmpty, true);
          expect(tip.contains('💡'), true);
        }
      }
    });

    test(
      'Her mood kendine özgü ve karakteristik badgeIcon değerine sahip olmalı',
      () {
        expect(MascotMood.coach.badgeIcon, PhosphorIconsFill.graduationCap);
        expect(MascotMood.victory.badgeIcon, PhosphorIconsFill.trophy);
        expect(
          MascotMood.detective.badgeIcon,
          PhosphorIconsFill.magnifyingGlass,
        );
        expect(MascotMood.pro.badgeIcon, PhosphorIconsFill.crown);
        expect(MascotMood.history.badgeIcon, PhosphorIconsFill.scroll);
        expect(
          MascotMood.geography.badgeIcon,
          PhosphorIconsFill.globeHemisphereEast,
        );
        expect(MascotMood.citizenship.badgeIcon, PhosphorIconsFill.scales);
        expect(
          MascotMood.current.badgeIcon,
          PhosphorIconsFill.newspaperClipping,
        );
        expect(MascotMood.practice.badgeIcon, PhosphorIconsFill.target);
        expect(MascotMood.exam.badgeIcon, PhosphorIconsFill.timer);
        expect(MascotMood.analyst.badgeIcon, PhosphorIconsFill.chartLineUp);
        expect(MascotMood.streak.badgeIcon, PhosphorIconsFill.fire);
      },
    );
  });

  group('TASK-68: MascotCoachBanner Widget & Tap-to-Inspire Testleri', () {
    testWidgets(
      'MascotCoachBanner başlık, mesaj ve moda özel rozeti render etmeli',
      (tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: MascotCoachBanner(
                mood: MascotMood.history,
                badgeLabel: 'TARİH REHBERİ',
                title: 'Tarih Yol Haritası',
                message: 'Tarih konularını adım adım fethet!',
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('TARİH REHBERİ'), findsOneWidget);
        expect(find.text('Tarih Yol Haritası'), findsOneWidget);
        expect(find.text('Tarih konularını adım adım fethet!'), findsOneWidget);
        expect(find.text('Tüyo Al'), findsNothing);
        expect(find.byIcon(PhosphorIconsFill.scroll), findsOneWidget);
        expect(find.byType(Image), findsOneWidget);

        // 92x92 boyutundaki borderlı görsel kutusunu doğrula
        final containers = tester.widgetList<Container>(find.byType(Container));
        final mascotBox = containers.any(
          (c) =>
              c.constraints?.maxWidth == 92 && c.constraints?.maxHeight == 92,
        );
        expect(
          mascotBox,
          true,
          reason: 'Tuğrul 92x92 borderlı çerçeve kutusunda render edilmeli',
        );
      },
    );

    testWidgets(
      'Varsayılan durumda tüyo gizlidir; karta tıklanınca kart döner ve tam metin KPSS tüyolarını gösterir',
      (tester) async {
        const mood = MascotMood.geography;
        final tips = mood.coachTips;

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: MascotCoachBanner(
                mood: mood,
                badgeLabel: 'COĞRAFYA REHBERİ',
                title: 'Coğrafya Konuları',
                message: 'Coğrafya için harita odaklı çalış.',
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // Başlangıçta (Ön Yüz) sadece orijinal mesaj görünür, tüyo görünmez
        expect(find.text('Coğrafya için harita odaklı çalış.'), findsOneWidget);
        expect(find.text(tips[0]), findsNothing);

        // 1. Tıklama -> Kart döner (Arka Yüz) ve 1. tüyo tam metin olarak görünür
        await tester.tap(find.byType(MascotCoachBanner));
        await tester.pumpAndSettle();

        expect(find.text(tips[0]), findsOneWidget);
        expect(
          find.text('COĞRAFYA REHBERİ · KPSS TÜYOSU (1/${tips.length})'),
          findsOneWidget,
        );

        // 2. Tıklama -> 2. tüyoya geçer
        await tester.tap(find.byType(MascotCoachBanner));
        await tester.pumpAndSettle();

        expect(find.text(tips[1]), findsOneWidget);
        expect(
          find.text('COĞRAFYA REHBERİ · KPSS TÜYOSU (2/${tips.length})'),
          findsOneWidget,
        );
      },
    );
  });
}
