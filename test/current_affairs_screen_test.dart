import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kadro/app/router.dart';
import 'package:kadro/app/theme.dart';
import 'package:kadro/core/services/local_storage_service.dart';
import 'package:kadro/features/current_affairs/data/current_affairs_repository.dart';
import 'package:kadro/features/current_affairs/data/models/current_affairs_bulletin.dart';
import 'package:kadro/features/current_affairs/presentation/current_affairs_screen.dart';
import 'package:kadro/features/flashcards/presentation/flashcards_screen.dart';
import 'package:kadro/features/lessons/presentation/lessons_screen.dart';
import 'package:kadro/features/practice/presentation/practice_hub_screen.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    CurrentAffairsRepository.clearMemoryCache();
  });

  group('TASK-160: CurrentAffairsRepository & Model Birim Testleri', () {
    test('CurrentAffairsItem.fromJson Supabase snake_case ve camelCase satırlarını çözer', () {
      final remoteRow = CurrentAffairsItem.fromJson(const {
        'id': 'ca_2026_08_test',
        'year_month': '2026-08',
        'month_title': 'Ağustos 2026',
        'title': 'Uluslararası Bilim Şenliği',
        'summary': 'Örnek özet metni.',
        'category': 'bilim_teknoloji',
        'osym_tip': 'Örnek ÖSYM soru ipucu.',
        'published_label': 'Ağustos 2026 · Bilim',
        'linked_tags': ['Bilim', 'Uzay'],
        'exam_scopes': ['lisans_gk', 'ekpss'],
        'is_verified_official': true,
        'order_index': 2,
      });

      expect(remoteRow.id, 'ca_2026_08_test');
      expect(remoteRow.yearMonth, '2026-08');
      expect(remoteRow.category, CurrentAffairsCategory.bilimTeknoloji);
      expect(remoteRow.linkedTags, ['Bilim', 'Uzay']);
      expect(remoteRow.examScopes, ['lisans_gk', 'ekpss']);
      expect(remoteRow.isVerifiedOfficial, isTrue);
      expect(remoteRow.orderIndex, 2);
    });

    test(
      'fetchBulletins uzak satırları yerel arşivle birleştirir ve filtreler',
      () async {
        final repo = CurrentAffairsRepository(
          remoteFetcherOverride: () async => const [
            {
              'id': 'ca_2026_08_custom',
              'year_month': '2026-08',
              'month_title': 'Ağustos 2026',
              'title': 'UNESCO 2026 Yaz Arşivi Notu',
              'summary': 'Kültürel miras güncellemesi.',
              'category': 'kultur_sanat',
              'osym_tip': 'Kurumsal ayrım ipucu.',
              'published_label': 'Ağustos 2026 · Kültür',
              'linked_tags': ['UNESCO'],
              'order_index': 1,
            },
          ],
        );

        final bulletins = await repo.fetchBulletins(forceRefresh: true);
        expect(bulletins.length, 4);
        expect(bulletins.last.yearMonth, '2026-08');
        expect(bulletins.last.monthTitle, 'Ağustos 2026');

        final filtered = repo.filterItems(
          bulletins.first,
          category: CurrentAffairsCategory.kulturSanat,
        );
        expect(filtered, isNotEmpty);
        expect(
          filtered.every(
            (i) => i.category == CurrentAffairsCategory.kulturSanat,
          ),
          isTrue,
        );
      },
    );

    test('Okundu ve kaydet durumları LocalStorageService ile kalıcı saklanır ve clearAll ile temizlenir', () async {
      const repo = CurrentAffairsRepository();
      const targetId = 'ca_2026_05_unesco_ahsap';

      final readAfterAdd = await repo.toggleRead(targetId);
      expect(readAfterAdd.contains(targetId), isTrue);

      final bookmarkedAfterAdd = await repo.toggleBookmark(targetId);
      expect(bookmarkedAfterAdd.contains(targetId), isTrue);

      // Yeni repository örneği ile kalıcılığı doğrula
      const freshRepo = CurrentAffairsRepository();
      expect(await freshRepo.loadReadIds(), contains(targetId));
      expect(await freshRepo.loadBookmarkedIds(), contains(targetId));

      await LocalStorageService().clearAll();
      expect(await freshRepo.loadReadIds(), isEmpty);
      expect(await freshRepo.loadBookmarkedIds(), isEmpty);
    });
  });

  group('TASK-160: CurrentAffairsScreen Widget & Entegrasyon Testleri', () {
    testWidgets(
      '360x640 mobilde ay değiştirme, okundu işaretleme ve kaydet filtresi sıfır taşmayla çalışır',
      (tester) async {
        tester.view.physicalSize = const Size(360, 640);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              theme: AppTheme.light,
              home: const CurrentAffairsScreen(),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(tester.takeException(), isNull);
        expect(find.text('Aylık Güncel Bilgiler Bülteni'), findsOneWidget);
        expect(find.text('Temmuz 2026'), findsOneWidget);
        expect(find.text('0/5 Okundu'), findsOneWidget);
        final osymTipFinder = find.text('ÖSYM Soru İpucu');
        await tester.ensureVisible(osymTipFinder.first);
        expect(osymTipFinder, findsWidgets);

        // İlk maddeyi okundu ve kaydedildi olarak işaretle
        final readBtn = find.byKey(
          const ValueKey('current_affairs_read_ca_2026_07_nato_ankara'),
        );
        await tester.ensureVisible(readBtn);
        await tester.tap(readBtn);
        await tester.pumpAndSettle();
        expect(find.text('1/5 Okundu'), findsOneWidget);

        final bookmarkBtn = find.byKey(
          const ValueKey('current_affairs_bookmark_ca_2026_07_nato_ankara'),
        );
        await tester.ensureVisible(bookmarkBtn);
        await tester.tap(bookmarkBtn);
        await tester.pumpAndSettle();

        // Kaydedilenler filtresini aç
        final bookmarkedChip = find.byKey(
          const ValueKey('category_chip_bookmarked'),
        );
        await tester.ensureVisible(bookmarkedChip);
        await tester.tap(bookmarkedChip);
        await tester.pumpAndSettle();
        expect(
          find.text('NATO 2026 Devlet ve Hükûmet Başkanları Zirvesi: Ankara'),
          findsOneWidget,
        );
        expect(tester.takeException(), isNull);

        // Kaydedilenler filtresini kapatıp Haziran ayına geç
        await tester.ensureVisible(bookmarkedChip);
        await tester.tap(bookmarkedChip);
        await tester.pumpAndSettle();
        final juneChip = find.byKey(const ValueKey('month_chip_2026-06'));
        await tester.ensureVisible(juneChip);
        await tester.tap(juneChip);
        await tester.pumpAndSettle();
        expect(find.text('Haziran 2026'), findsOneWidget);
        expect(find.text('0/5 Okundu'), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      '1280x800 masaüstünde 2 sütunlu akış taşmadan render edilir, mini test ve bilgi kartlarına geçer',
      (tester) async {
        tester.view.physicalSize = const Size(1280, 800);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              theme: AppTheme.light,
              home: const CurrentAffairsScreen(initialMonthParam: '2026-05'),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(tester.takeException(), isNull);
        expect(find.text('Mayıs 2026'), findsOneWidget);
        final calloutTitle = find.text('Mayıs 2026 Bültenini Pekiştir');
        await tester.ensureVisible(calloutTitle);
        expect(calloutTitle, findsOneWidget);

        // Bilgi kartlarına geçiş
        final flashcardsBtn = find.byKey(
          const ValueKey('current_affairs_flashcards_btn'),
        );
        await tester.ensureVisible(flashcardsBtn);
        await tester.tap(flashcardsBtn);
        await tester.pumpAndSettle();
        expect(find.byType(FlashcardsScreen), findsOneWidget);

        // Geri dön ve 10 soruluk mini teste geç
        await tester.pageBack();
        await tester.pumpAndSettle();

        final miniTestBtn = find.byKey(
          const ValueKey('current_affairs_mini_test_btn'),
        );
        await tester.ensureVisible(miniTestBtn);
        await tester.tap(miniTestBtn);
        await tester.pumpAndSettle();
        expect(find.byType(QuizScreen), findsOneWidget);
      },
    );

    testWidgets(
      'Router /current-affairs?ay=2026-06, PracticeHubScreen ve LessonsScreen giriş köprüleri çalışır',
      (tester) async {
        tester.view.physicalSize = const Size(1280, 800);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        // 1. Query parametreli GoRouter derin bağlantısı
        final router = createAppRouter(
          initialLocation: '/current-affairs?ay=2026-06',
        );
        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp.router(
              theme: AppTheme.light,
              routerConfig: router,
            ),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.byType(CurrentAffairsScreen), findsOneWidget);
        expect(find.text('Haziran 2026'), findsOneWidget);

        // 2. PracticeHubScreen giriş kartı
        await tester.pumpWidget(
          ProviderScope(
            key: const ValueKey('practice_hub_scope'),
            child: MaterialApp(
              key: const ValueKey('practice_hub_app'),
              theme: AppTheme.light,
              home: const Scaffold(body: PracticeHubScreen()),
            ),
          ),
        );
        await tester.pumpAndSettle();
        final hubCard = find.text('Aylık Güncel Bülten');
        await tester.ensureVisible(hubCard);
        await tester.tap(hubCard);
        await tester.pumpAndSettle();
        expect(find.byType(CurrentAffairsScreen), findsOneWidget);

        // 3. LessonsScreen içindeki Güncel Bilgiler kartı bülten kısayolu
        await tester.pumpWidget(
          ProviderScope(
            key: const ValueKey('lessons_scope'),
            child: MaterialApp(
              key: const ValueKey('lessons_app'),
              theme: AppTheme.light,
              home: const Scaffold(body: LessonsScreen()),
            ),
          ),
        );
        await tester.pumpAndSettle();
        final lessonCta = find.byKey(
          const ValueKey('lessons_current_affairs_bulletin_cta'),
        );
        expect(lessonCta, findsOneWidget);
        await tester.ensureVisible(lessonCta);
        await tester.tap(lessonCta);
        await tester.pumpAndSettle();
        expect(find.byType(CurrentAffairsScreen), findsOneWidget);
      },
    );
  });
}
