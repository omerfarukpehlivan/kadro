import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/shared/widgets/mascot_coach_banner.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

void main() {
  group('TASK-53: MascotMood & MascotMoodExtension Testleri', () {
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

    test('Tüm MascotMood değerleri geçerli ve boş olmayan PNG dosya yolu döndürmeli', () {
      for (final mood in MascotMood.values) {
        final path = mood.assetPath;
        expect(
          path.isNotEmpty,
          true,
          reason: '$mood için assetPath boş olamaz',
        );
        expect(
          path.startsWith('assets/images/mascot/'),
          true,
          reason: '$mood assetPath doğru klasörde olmalı',
        );
        expect(
          path.endsWith('.png'),
          true,
          reason: '$mood assetPath PNG olmalı',
        );
      }
    });
  });

  group('TASK-53: MascotCoachBanner Widget Testleri', () {
    testWidgets(
      '92x92 borderlı çerçeve yapısında başlık, mesaj ve rozet eksiksiz render edilmeli',
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
        expect(find.byIcon(LucideIcons.award), findsOneWidget);
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
  });
}
