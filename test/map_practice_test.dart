import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/map_practice/data/map_practice_data.dart';
import 'package:kadro/features/map_practice/data/map_practice_repository.dart';
import 'package:kadro/features/map_practice/data/models/map_challenge.dart';
import 'package:kadro/features/map_practice/presentation/map_challenge_screen.dart';
import 'package:kadro/features/map_practice/presentation/map_practice_hub_screen.dart';
import 'package:kadro/shared/widgets/turkey_map/turkey_map.dart';

void main() {
  group('MapPractice Model & Logic Birim Testleri', () {
    test(
      'MapChallenge modeli doğru oluşturulmalı ve doğrulamaları yapmalı',
      () {
        const challenge = MapChallenge(
          id: 'test_01',
          category: MapPracticeCategory.agriculture,
          interactionType: MapInteractionType.tapProvince,
          title: 'Pamuk Lideri',
          questionText: 'Pamuk üretiminde 1. olan ile dokunun.',
          targetProvinceId: 'sanliurfa',
          validProvinceIds: ['sanliurfa'],
          hint: 'Güneydoğu Anadolu ilimiz',
          explanation: 'Şanlıurfa pamukta 1. sıradadır.',
          tag: 'Pamuk',
          options: ['Şanlıurfa', 'Adana', 'Aydın', 'Diyarbakır'],
          correctOptionIndex: 0,
        );

        // İl doğrulama testi (büyük/küçük harf toleransı)
        expect(challenge.isProvinceCorrect('sanliurfa'), isTrue);
        expect(challenge.isProvinceCorrect('SANLIURFA'), isTrue);
        expect(challenge.isProvinceCorrect('  Sanliurfa  '), isTrue);
        expect(challenge.isProvinceCorrect('adana'), isFalse);

        // Seçenek doğrulama testi
        expect(challenge.isOptionCorrect(0), isTrue);
        expect(challenge.isOptionCorrect(1), isFalse);

        // JSON serileştirme döngüsü
        final json = challenge.toJson();
        final fromJson = MapChallenge.fromJson(json);
        expect(fromJson.id, 'test_01');
        expect(fromJson.category, MapPracticeCategory.agriculture);
        expect(fromJson.targetProvinceId, 'sanliurfa');
        expect(fromJson.options.length, 4);
      },
    );

    test('MapPracticeData dinamik il soruları doğru üretmeli', () {
      final dynamicTap = MapPracticeData.generateDynamicProvinceChallenges(
        count: 5,
        type: MapInteractionType.tapProvince,
        seed: 42,
      );
      expect(dynamicTap.length, 5);
      expect(dynamicTap.every((c) => c.targetProvinceId.isNotEmpty), isTrue);
      expect(
        dynamicTap.every(
          (c) => c.interactionType == MapInteractionType.tapProvince,
        ),
        isTrue,
      );

      final dynamicId = MapPracticeData.generateDynamicProvinceChallenges(
        count: 5,
        type: MapInteractionType.identifyHighlighted,
        seed: 42,
      );
      expect(dynamicId.length, 5);
      expect(dynamicId.every((c) => c.options.length == 4), isTrue);
      expect(
        dynamicId.every((c) => c.options[c.correctOptionIndex].isNotEmpty),
        isTrue,
      );
    });

    test(
      'LocalMapPracticeRepository kategorilere göre soruları getirmeli',
      () async {
        final repo = LocalMapPracticeRepository();

        final agrChallenges = await repo.getChallengesByCategory(
          MapPracticeCategory.agriculture,
          count: 4,
        );
        expect(agrChallenges.isNotEmpty, isTrue);

        final dynamicProvinces = await repo.getDynamicProvinceChallenges(
          count: 8,
        );
        expect(dynamicProvinces.length, 8);

        final hisChallenges = await repo.getChallengesByCategory(
          MapPracticeCategory.history,
          count: 5,
        );
        expect(hisChallenges.length, 5);
        expect(
          hisChallenges.every((c) => c.category == MapPracticeCategory.history),
          isTrue,
        );

        final marathon = await repo.getDailyMarathonChallenges(count: 6);
        expect(marathon.length, greaterThanOrEqualTo(5));

        // 50 uzman sorunun eksiksiz yüklendiğini doğrula
        expect(MapPracticeData.predefinedChallenges.length, 50);
      },
    );
  });

  group('MapPractice UI Widget Testleri', () {
    testWidgets(
      'MapPracticeHubScreen başlıkları ve kategorileri render etmeli',
      (tester) async {
        await tester.binding.setSurfaceSize(const Size(800, 1400));
        addTearDown(() => tester.binding.setSurfaceSize(null));

        await tester.pumpWidget(
          const ProviderScope(child: MaterialApp(home: MapPracticeHubScreen())),
        );
        await tester.pumpAndSettle();

        expect(find.text('Harita Atölyesi'), findsOneWidget);
        expect(find.text('Dilsiz Harita (81 İl)'), findsOneWidget);
        expect(find.text('Tarım & Hayvancılık'), findsOneWidget);
        expect(find.text('Madenler & Enerji'), findsOneWidget);
        expect(find.text('Plato, Dağ & Göller'), findsOneWidget);
        expect(find.text('Sanayi & Limanlar'), findsOneWidget);
        expect(find.text('Tarih: Millî Mücadele Haritası'), findsOneWidget);
        expect(find.text('Genel Harita Maratonu'), findsOneWidget);
      },
    );

    testWidgets('MapChallengeScreen harita ve soru arayüzünü render etmeli', (
      tester,
    ) async {
      await tester.binding.setSurfaceSize(const Size(800, 1400));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final testChallenges = [
        const MapChallenge(
          id: 'test_c_1',
          category: MapPracticeCategory.mines,
          interactionType: MapInteractionType.identifyHighlighted,
          title: 'Bor Havzası',
          questionText: 'Haritada işaretli havzada hangi maden çıkarılır?',
          targetProvinceId: 'balikesir',
          highlightedProvinceIds: ['balikesir'],
          options: ['Bor', 'Krom', 'Boksit', 'Demir'],
          correctOptionIndex: 0,
          hint: 'Beyaz stratejik maden',
          explanation: 'Dünya bor rezervinin %73ü Türkiyededir.',
          tag: 'Bor',
        ),
      ];

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: MapChallengeScreen(
              challenges: testChallenges,
              sessionTitle: 'Madenler Testi',
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Madenler Testi'), findsOneWidget);
      expect(find.textContaining('Soru 1/1'), findsOneWidget);
      expect(
        find.text('Haritada işaretli havzada hangi maden çıkarılır?'),
        findsOneWidget,
      );
      expect(find.text('Bor'), findsOneWidget);
      expect(find.text('Krom'), findsOneWidget);

      // Şıkka tıklandığında açıklama kartı görünmeli
      await tester.tap(find.text('Bor'));
      await tester.pumpAndSettle();

      expect(find.text('Tebrikler! Doğru Cevap'), findsOneWidget);
      expect(find.textContaining('Dünya bor rezervinin %73ü'), findsOneWidget);
      expect(find.text('Sonuçları Gör'), findsOneWidget);
    });

    testWidgets(
      'MapPracticeHubScreen ve Dilsiz Harita modu 360x640 kompakt mobil ekranda taşma olmadan çizilmeli',
      (tester) async {
        await tester.binding.setSurfaceSize(const Size(360, 640));
        addTearDown(() => tester.binding.setSurfaceSize(null));

        await tester.pumpWidget(
          const ProviderScope(child: MaterialApp(home: MapPracticeHubScreen())),
        );
        await tester.pumpAndSettle();

        expect(find.text('Dilsiz Harita (81 İl)'), findsOneWidget);
        expect(tester.takeException(), isNull);

        await tester.tap(find.text('Dilsiz Harita (81 İl)'));
        await tester.pumpAndSettle();

        expect(find.text('Dilsiz Harita Antrenman Modu'), findsOneWidget);
        expect(tester.takeException(), isNull);

        await tester.tap(find.text('Haritada İle Dokun (Zor)'));
        await tester.pumpAndSettle();

        expect(find.byType(MapChallengeScreen), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'MapChallengeScreen 360x640 ekranda minimum kenar boşluğu ile çizilmeli, yakınlaştırma ve tam ekran Büyüt diyaloğunu açmalı',
      (tester) async {
        await tester.binding.setSurfaceSize(const Size(360, 640));
        addTearDown(() => tester.binding.setSurfaceSize(null));

        const tapChallenges = [
          MapChallenge(
            id: 'zoom_test_1',
            category: MapPracticeCategory.provinces,
            interactionType: MapInteractionType.tapProvince,
            title: 'Yalova Bulma',
            questionText: 'Haritada Yalova ilini bulun ve üzerine dokunun.',
            targetProvinceId: 'yalova',
            hint: 'Marmara Bölgesi güney kıyısında küçük bir ilimizdir.',
            explanation: 'Yalova, Marmara Bölgesi illerindendir.',
            tag: '81 İl',
          ),
        ];

        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(
              home: MapChallengeScreen(
                challenges: tapChallenges,
                sessionTitle: 'Dilsiz Harita',
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // Kenar boşlukları azaltıldığı için harita genişliği 360px ekranda ~340px'e yaklaşmalı
        final mapSize = tester.getSize(find.byType(TurkeyMap));
        expect(mapSize.width, greaterThanOrEqualTo(335));
        expect(tester.takeException(), isNull);

        // Yakınlaştır (+) butonuna basılınca Sıfırla butonu görünmeli
        expect(
          find.byKey(const ValueKey('map_zoom_reset_button')),
          findsNothing,
        );
        await tester.tap(find.byKey(const ValueKey('map_zoom_in_button')));
        await tester.pumpAndSettle();
        expect(
          find.byKey(const ValueKey('map_zoom_reset_button')),
          findsOneWidget,
        );
        expect(tester.takeException(), isNull);

        await tester.tap(find.byKey(const ValueKey('map_zoom_reset_button')));
        await tester.pumpAndSettle();
        expect(
          find.byKey(const ValueKey('map_zoom_reset_button')),
          findsNothing,
        );

        // Büyüt butonuna basıldığında tam ekran harita diyaloğu taşmasız açılmalı
        await tester.tap(find.byKey(const ValueKey('map_fullscreen_button')));
        await tester.pumpAndSettle();

        expect(
          find.text('İki parmakla yakınlaştırıp ili seçin'),
          findsOneWidget,
        );
        expect(
          find.byKey(const ValueKey('fullscreen_map_zoom_in_button')),
          findsOneWidget,
        );
        expect(tester.takeException(), isNull);

        await tester.tap(
          find.byKey(const ValueKey('fullscreen_map_zoom_in_button')),
        );
        await tester.pumpAndSettle();
        await tester.tap(
          find.byKey(const ValueKey('fullscreen_map_reset_button')),
        );
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);

        await tester.tap(find.byTooltip('Kapat'));
        await tester.pumpAndSettle();
        expect(
          find.byKey(const ValueKey('fullscreen_map_zoom_in_button')),
          findsNothing,
        );
      },
    );
  });
}
