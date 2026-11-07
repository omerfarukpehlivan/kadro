import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/core/services/local_storage_service.dart';
import 'package:kadro/core/services/offline_download_service.dart';
import 'package:kadro/features/exams/presentation/exams_screen.dart';
import 'package:kadro/features/lessons/data/kpss_lessons.dart';
import 'package:kadro/features/lessons/presentation/lesson_topics_screen.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/profile/presentation/paywall_screen.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/data/question_repository.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockUserPreferencesNotifier extends UserPreferencesNotifier {
  final bool initialIsPro;
  MockUserPreferencesNotifier({this.initialIsPro = false});

  @override
  UserPreferencesState build() {
    return UserPreferencesState(isPro: initialIsPro);
  }
}

class MockOnlineStatusNotifier extends OnlineStatusNotifier {
  final bool initialOnline;
  MockOnlineStatusNotifier({this.initialOnline = true});

  @override
  bool build() => initialOnline;
}

class FakeQuestionRepository extends QuestionRepository {
  final List<Question> testQuestions;
  const FakeQuestionRepository(this.testQuestions);

  @override
  Future<List<Question>> loadAllQuestions() async => testQuestions;

  @override
  Future<List<Question>> fetchQuestions({
    String? lesson,
    String? topic,
  }) async => testQuestions;

  @override
  Future<List<Question>> getQuestionsByLesson(String lessonName) async =>
      testQuestions;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const sampleQuestions = [
    Question(
      id: 'off_q1',
      lesson: 'Tarih',
      topic: 'İslamiyet Öncesi Türk Tarihi',
      text: 'İlk Türk devletlerinde hükümdara yönetme yetkisinin Tanrı tarafından verildiğine inanılmasına ne ad verilir?',
      options: ['Kut', 'Töre', 'Kurultay', 'Yargu', 'Tigin'],
      correctIndex: 0,
      explanation: 'Kut anlayışı Tanrı bağışıdır.',
    ),
    Question(
      id: 'off_q2',
      lesson: 'Tarih',
      topic: 'İslamiyet Öncesi Türk Tarihi',
      text: 'Uygurların yerleşik hayata geçmesiyle ortaya çıkan tapınak mimarisine ne ad verilir?',
      options: ['Stupa', 'Kümbet', 'Yurt', 'Balbal', 'Kurgan'],
      correctIndex: 0,
      explanation: 'Stupa Maniheizm tapınaklarıdır.',
    ),
  ];

  group('OfflineDownloadService Birim Testleri', () {
    late LocalStorageService storage;
    late OfflineDownloadService service;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();
      storage = LocalStorageService(prefs: prefs);
      service = OfflineDownloadService(storage: storage);
    });

    test('isPro: false iken downloadPackage çağrılırsa ProRequiredException fırlatmalı', () async {
      expect(
        () => service.downloadPackage(
          packageId: 'test_pkg',
          questions: sampleQuestions,
          isPro: false,
        ),
        throwsA(isA<ProRequiredException>()),
      );
    });

    test('isPro: true iken sorular başarıyla yerel belleğe kaydedilmeli ve okunabilmeli', () async {
      await service.downloadPackage(
        packageId: 'test_pkg',
        questions: sampleQuestions,
        isPro: true,
      );

      final isDownloaded = await service.isPackageDownloaded('test_pkg');
      expect(isDownloaded, isTrue);

      final retrieved = await service.getDownloadedQuestions('test_pkg');
      expect(retrieved, isNotNull);
      expect(retrieved!.length, equals(2));
      expect(retrieved.first.id, equals('off_q1'));
      expect(retrieved.first.options[0], equals('Kut'));

      final allIds = await service.getDownloadedPackageIds();
      expect(allIds, contains('test_pkg'));
    });

    test(
      'removeDownloadedPackage paketi ve kayıtlı soruları temizlemeli',
      () async {
        await service.downloadPackage(
          packageId: 'pkg_to_delete',
          questions: sampleQuestions,
          isPro: true,
        );
        expect(await service.isPackageDownloaded('pkg_to_delete'), isTrue);

        await service.removeDownloadedPackage('pkg_to_delete');
        expect(await service.isPackageDownloaded('pkg_to_delete'), isFalse);
        expect(await service.getDownloadedQuestions('pkg_to_delete'), isNull);
      },
    );
  });

  group('ExamsScreen & Paywall Köprüsü Çevrimdışı İndirme Widget Testleri', () {
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
    });

    testWidgets(
      'Ücretsiz (PRO olmayan) kullanıcı İndir butonuna bastığında PaywallScreen açılmalı ve kilit uyarısı gösterilmeli',
      (tester) async {
        tester.view.physicalSize = const Size(800, 1600);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              userPreferencesProvider.overrideWith(
                MockUserPreferencesNotifier.new,
              ),
            ],
            child: const MaterialApp(home: Scaffold(body: ExamsScreen())),
          ),
        );
        await tester.pumpAndSettle();

        // İndir butonuna dokun (zarif mikro-ikon)
        final downloadBtn = find.byTooltip('Çevrimdışı İndir').first;
        expect(downloadBtn, findsOneWidget);
        await tester.tap(downloadBtn);
        await tester.pumpAndSettle();

        // PaywallScreen ve kilit SnackBar'ının açıldığını doğrula
        expect(find.byType(PaywallScreen), findsOneWidget);
        expect(
          find.text(
            '🔒 Çevrimdışı soru ve deneme indirme özelliği Kadro PRO üyelerine özeldir.',
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Kadro PRO kullanıcısı İndir butonuna bastığında paket indirilmeli ve Cihazda Hazır rozetine geçmeli',
      (tester) async {
        tester.view.physicalSize = const Size(800, 1600);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              userPreferencesProvider.overrideWith(
                () => MockUserPreferencesNotifier(initialIsPro: true),
              ),
              questionRepositoryProvider.overrideWithValue(
                const FakeQuestionRepository(sampleQuestions),
              ),
            ],
            child: const MaterialApp(home: Scaffold(body: ExamsScreen())),
          ),
        );
        await tester.pumpAndSettle();

        final downloadBtn = find.byTooltip('Çevrimdışı İndir').first;
        await tester.tap(downloadBtn);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 500));
        await tester.pumpAndSettle();

        // Cihazda rozetinin belirdiğini doğrula
        expect(find.text('Cihazda'), findsWidgets);
      },
    );

    testWidgets(
      'İnternet yokken indirilmemiş denemeye tıklandığında bilgilendirici diyalog gösterilmeli',
      (tester) async {
        tester.view.physicalSize = const Size(800, 1600);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              isOnlineProvider.overrideWith(
                () => MockOnlineStatusNotifier(initialOnline: false),
              ),
            ],
            child: const MaterialApp(home: Scaffold(body: ExamsScreen())),
          ),
        );
        await tester.pumpAndSettle();

        // İndirilmemiş bir denemeye tıkla
        await tester.tap(find.text('Türkiye Geneli GK Provası #1'));
        await tester.pumpAndSettle();

        // Diyalog metnini doğrula
        expect(find.text('İnternet Bağlantısı Yok'), findsOneWidget);
        expect(
          find.text(
            'Bu denemeyi internetsiz çözebilmek için internet varken Kadro PRO ile indirmiş olmanız gerekir.',
          ),
          findsOneWidget,
        );
        expect(find.text("Kadro PRO'ya Geç"), findsOneWidget);
      },
    );

    testWidgets(
      'İnternet yokken indirilmiş denemeye tıklandığında soru motoru doğrudan yerel sorularla başlamalı',
      (tester) async {
        tester.view.physicalSize = const Size(800, 1600);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        final prefs = await SharedPreferences.getInstance();
        final storage = LocalStorageService(prefs: prefs);
        await storage.saveDownloadedPackage('exam_gk_prova_1', sampleQuestions);

        final service = OfflineDownloadService(
          storage: storage,
          isOnline: false,
        );

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              offlineDownloadServiceProvider.overrideWithValue(service),
              isOnlineProvider.overrideWith(
                () => MockOnlineStatusNotifier(initialOnline: false),
              ),
            ],
            child: const MaterialApp(home: Scaffold(body: ExamsScreen())),
          ),
        );
        await tester.pumpAndSettle();

        // İndirilmiş denemeyi başlat
        await tester.tap(find.text('Türkiye Geneli GK Provası #1'));
        await tester.pumpAndSettle();

        // QuizScreen açılmış olmalı ve indirilen sorular render edilmeli
        expect(find.byType(QuizScreen), findsOneWidget);
        expect(
          find.text(
            'İlk Türk devletlerinde hükümdara yönetme yetkisinin Tanrı tarafından verildiğine inanılmasına ne ad verilir?',
          ),
          findsOneWidget,
        );
        expect(find.text('Kut'), findsOneWidget);
      },
    );
  });

  group('LessonTopicsScreen Çevrimdışı İndirme Widget Testleri', () {
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
    });

    testWidgets(
      'Konu ekranında internet yokken indirilmemiş konuya tıklandığında uyarı diyaloğu açılmalı',
      (tester) async {
        tester.view.physicalSize = const Size(800, 1600);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        final testLesson = kpssLessons.first;

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              isOnlineProvider.overrideWith(
                () => MockOnlineStatusNotifier(initialOnline: false),
              ),
            ],
            child: MaterialApp(home: LessonTopicsScreen(lesson: testLesson)),
          ),
        );
        await tester.pumpAndSettle();

        // "Test Çöz" butonuna tıkla
        await tester.tap(find.text('Test Çöz').first);
        await tester.pumpAndSettle();

        expect(find.text('İnternet Bağlantısı Yok'), findsOneWidget);
        expect(
          find.text(
            'Bu denemeyi internetsiz çözebilmek için internet varken Kadro PRO ile indirmiş olmanız gerekir.',
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Konu ekranında ücretsiz kullanıcı indirme butonuna bastığında PaywallScreen açılmalı',
      (tester) async {
        tester.view.physicalSize = const Size(800, 1600);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        final testLesson = kpssLessons.first;

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              userPreferencesProvider.overrideWith(
                MockUserPreferencesNotifier.new,
              ),
            ],
            child: MaterialApp(home: LessonTopicsScreen(lesson: testLesson)),
          ),
        );
        await tester.pumpAndSettle();

        // AppBar içindeki 'Tümünü İndir' butonuna bas
        final downloadAllBtn = find.text('Tümünü İndir');
        expect(downloadAllBtn, findsOneWidget);
        await tester.tap(downloadAllBtn);
        await tester.pumpAndSettle();

        expect(find.byType(PaywallScreen), findsOneWidget);
        expect(
          find.text(
            '🔒 Çevrimdışı soru ve deneme indirme özelliği Kadro PRO üyelerine özeldir.',
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Konu ekranında internet yokken indirilmiş konuya tıklandığında yerel sorularla başlamalı',
      (tester) async {
        tester.view.physicalSize = const Size(800, 1600);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        final testLesson = kpssLessons.first;
        final topic = testLesson.topics.first;
        final packageId = 'topic_${testLesson.name}_$topic';

        final prefs = await SharedPreferences.getInstance();
        final storage = LocalStorageService(prefs: prefs);
        await storage.saveDownloadedPackage(packageId, sampleQuestions);

        final service = OfflineDownloadService(
          storage: storage,
          isOnline: false,
        );

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              offlineDownloadServiceProvider.overrideWithValue(service),
              isOnlineProvider.overrideWith(
                () => MockOnlineStatusNotifier(initialOnline: false),
              ),
            ],
            child: MaterialApp(home: LessonTopicsScreen(lesson: testLesson)),
          ),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.text('Test Çöz').first);
        await tester.pumpAndSettle();

        // TopicTestsScreen üzerinden ilk testi başlat
        if (find.text('Test Çöz').evaluate().isNotEmpty) {
          await tester.tap(find.text('Test Çöz').first);
          await tester.pumpAndSettle();
        }

        expect(find.byType(QuizScreen), findsOneWidget);
        expect(
          find.text(
            'İlk Türk devletlerinde hükümdara yönetme yetkisinin Tanrı tarafından verildiğine inanılmasına ne ad verilir?',
          ),
          findsOneWidget,
        );
      },
    );
  });
}
