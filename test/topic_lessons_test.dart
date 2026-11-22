import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/app/theme.dart';
import 'package:kadro/features/lessons/data/kpss_lessons.dart';
import 'package:kadro/features/lessons/presentation/lesson_topics_screen.dart';
import 'package:kadro/features/mistakes/data/mistake_repository.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/data/models/quiz_result.dart';
import 'package:kadro/features/quiz/presentation/quiz_result_screen.dart';
import 'package:kadro/features/topic_lessons/data/models/topic_lesson_models.dart';
import 'package:kadro/features/topic_lessons/data/topic_lesson_repository.dart';
import 'package:kadro/features/topic_lessons/presentation/topic_lesson_unit_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    TopicLessonRepository.clearMemoryCache();
    const TopicLessonProgressRepository().clearLocal();
    const MistakeRepository().clearForTest();
  });

  group('TASK-168: TopicLessonModel & Domain Birim Testleri', () {
    test('TopicLessonBlock.parseList bilinmeyen blok türlerini çökmeden atlar ve tüm resmi türleri ayrıştırır', () {
      final blocks = TopicLessonBlock.parseList([
        {'type': 'heading', 'text': 'Alt Başlık'},
        {'type': 'paragraph', 'text': 'Bu **kalın** ve *italik* bir metindir.'},
        {
          'type': 'bullets',
          'items': ['Madde 1', 'Madde 2'],
        },
        {
          'type': 'table',
          'headers': ['Sütun A', 'Sütun B'],
          'rows': [
            ['Değer 1', 'Değer 2'],
          ],
        },
        {
          'type': 'timeline',
          'items': [
            {'label': '1071', 'text': 'Malazgirt Zaferi'},
          ],
        },
        {'type': 'callout', 'kind': 'info', 'text': 'Bilgi notu'},
        {'type': 'callout', 'kind': 'mnemonic', 'text': 'Kodlama notu'},
        {'type': 'callout', 'kind': 'trap', 'text': 'ÖSYM tuzak notu'},
        {'type': 'callout', 'kind': 'example', 'text': 'Örnek notu'},
        {'type': 'experimental_3d_block', 'data': 123},
        {
          'type': 'key_points',
          'items': ['Özet 1', 'Özet 2'],
        },
        {'type': 'check_questions', 'question_ids': <String>[]},
      ]);

      expect(blocks.length, equals(11));
      expect(blocks.first, isA<TopicLessonHeadingBlock>());
      expect(blocks.last, isA<TopicLessonCheckQuestionsBlock>());
    });

    test('Otomatik kontrol sorusu seçimi difficulty <= 2 filtreler, order_index/id sıralar ve modulo ile sarar', () {
      const questions = [
        Question(
          id: 'q_hard',
          lesson: 'Tarih',
          topic: 'İslamiyet Öncesi Türk Tarihi',
          text: 'Zor soru',
          options: ['A', 'B', 'C', 'D', 'E'],
          correctIndex: 0,
          explanation: 'Açıklama',
          difficulty: '3',
          orderIndex: 1,
        ),
        Question(
          id: 'q_2',
          lesson: 'Tarih',
          topic: 'İslamiyet Öncesi Türk Tarihi',
          text: 'Soru 2',
          options: ['A', 'B', 'C', 'D', 'E'],
          correctIndex: 0,
          explanation: 'Açıklama',
          difficulty: '2',
          orderIndex: 2,
        ),
        Question(
          id: 'q_1',
          lesson: 'Tarih',
          topic: 'İslamiyet Öncesi Türk Tarihi',
          text: 'Soru 1',
          options: ['A', 'B', 'C', 'D', 'E'],
          correctIndex: 0,
          explanation: 'Açıklama',
          difficulty: '1',
          orderIndex: 1,
        ),
        Question(
          id: 'q_3',
          lesson: 'Tarih',
          topic: 'İslamiyet Öncesi Türk Tarihi',
          text: 'Soru 3',
          options: ['A', 'B', 'C', 'D', 'E'],
          correctIndex: 0,
          explanation: 'Açıklama',
          difficulty: '2',
          orderIndex: 3,
        ),
      ];

      final unit1 = TopicLessonDomain.selectCheckQuestions(
        topicQuestions: questions,
        unitOrder: 1,
      );
      expect(unit1.map((q) => q.id).toList(), equals(['q_1', 'q_2']));

      final unit2 = TopicLessonDomain.selectCheckQuestions(
        topicQuestions: questions,
        unitOrder: 2,
      );
      expect(unit2.map((q) => q.id).toList(), equals(['q_3', 'q_1']));
    });

    test('TopicLessonProgressRepository bölüm tamamlama ve konu ilerleme yüzdesini doğru hesaplar', () {
      const progressRepo = TopicLessonProgressRepository();
      const units = [
        TopicLessonUnit(
          id: 'tarih.islamiyet_oncesi_turk_tarihi.01',
          lesson: 'Tarih',
          topic: 'İslamiyet Öncesi Türk Tarihi',
          unitOrder: 1,
          title: 'Bölüm 1',
          summary: 'Özet 1',
          estimatedMinutes: 5,
          blocks: [],
        ),
        TopicLessonUnit(
          id: 'tarih.islamiyet_oncesi_turk_tarihi.02',
          lesson: 'Tarih',
          topic: 'İslamiyet Öncesi Türk Tarihi',
          unitOrder: 2,
          title: 'Bölüm 2',
          summary: 'Özet 2',
          estimatedMinutes: 4,
          blocks: [],
        ),
      ];
      expect(units.length, equals(2));
      expect(progressRepo.progressPercentForUnits(units), equals(0));

      progressRepo.markUnitCompleted(unitId: units.first.id);
      expect(progressRepo.isUnitCompleted(units.first.id), isTrue);
      expect(progressRepo.progressPercentForUnits(units), equals(50));

      progressRepo.markUnitCompleted(unitId: units.last.id);
      expect(progressRepo.progressPercentForUnits(units), equals(100));
    });
  });

  group('TASK-168: TopicLessonUnitScreen & TopicLessonScreen Widget Testleri', () {
    testWidgets(
      'TopicLessonUnitScreen tüm blok türlerini, uzun paragrafları ve kontrol sorularını 360x640 ekranda taşmadan çizer; yanlış kontrol sorusunu Yanlış Defterine yazar',
      (tester) async {
        tester.view.physicalSize = const Size(360, 640);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        final longParagraph =
            'Orta Asya bozkır coğrafyasında konargöçer yaşam süren **ilk Türk devletleri**, '
                'atlı göçebe kültürünün sağladığı hız ve teşkilatçılık yeteneği sayesinde '
                '*Asya Hun*, *Göktürk* ve *Uygur* gibi güçlü siyasi yapılar kurmuşlardır. ' *
            3;

        final richUnit = TopicLessonUnit.fromJson({
          'id': 'tarih.islamiyet_oncesi_turk_tarihi.test_01',
          'lesson': 'Tarih',
          'topic': 'İslamiyet Öncesi Türk Tarihi',
          'unit_order': 1,
          'title': 'Bölüm 1: Orta Asya Kültür Merkezleri',
          'summary': 'Kültür merkezleri ve ilk Türk devletleri özeti.',
          'estimated_minutes': 6,
          'blocks': [
            {'type': 'paragraph', 'text': longParagraph},
            {'type': 'heading', 'text': 'Kültür Merkezleri Karşılaştırması'},
            {
              'type': 'table',
              'headers': ['Kültür', 'Bölge', 'Özellik'],
              'rows': [
                ['Anav', 'Aşkabat', 'Orta Asya en eski kültür'],
                ['Afanesyova', 'Altay-Sayan', 'Türklerin en eski kültürü'],
              ],
            },
            {
              'type': 'timeline',
              'items': [
                {'label': 'MÖ 220', 'text': 'Asya Hun Devleti kuruldu.'},
              ],
            },
            {'type': 'callout', 'kind': 'info', 'text': 'Kritik bilgi kutusu.'},
            {
              'type': 'callout',
              'kind': 'mnemonic',
              'text': '**AAA-KT** hafıza şifresi.',
            },
            {
              'type': 'callout',
              'kind': 'trap',
              'text': 'Anav ile Afanesyova çeldiricisine dikkat et.',
            },
            {
              'type': 'callout',
              'kind': 'example',
              'text': 'Örnek soru incelemesi.',
            },
            {
              'type': 'bullets',
              'items': ['Madde bir', 'Madde iki'],
            },
            {
              'type': 'key_points',
              'items': ['Akılda kalsın madde 1', 'Akılda kalsın madde 2'],
            },
            {'type': 'check_questions', 'question_ids': <String>[]},
          ],
        });

        const checkQuestions = [
          Question(
            id: 'chk_1',
            lesson: 'Tarih',
            topic: 'İslamiyet Öncesi Türk Tarihi',
            text: 'Türklere ait en eski kültür merkezi hangisidir?',
            options: ['Anav', 'Afanesyova', 'Karasuk', 'Tagar', 'Andronova'],
            correctIndex: 1,
            explanation: 'Afanesyova Türklere ait en eski kültür merkezidir.',
            difficulty: '1',
            orderIndex: 1,
          ),
        ];

        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              theme: AppTheme.light,
              home: TopicLessonUnitScreen(
                unit: richUnit,
                allUnits: [richUnit],
                topicQuestionsOverride: checkQuestions,
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(
          find.text('Bölüm 1: Orta Asya Kültür Merkezleri'),
          findsOneWidget,
        );
        expect(tester.takeException(), isNull);

        // Kontrol sorusuna kadar kaydır ve yanlış şıkkı ('Karasuk') işaretle
        final optionFinder = find.text('Karasuk');
        await tester.scrollUntilVisible(
          optionFinder,
          250,
          scrollable: find.byType(Scrollable).first,
        );
        await tester.pumpAndSettle();
        await tester.tap(optionFinder);
        await tester.pumpAndSettle();

        expect(
          const MistakeRepository().getMistakes().any((q) => q.id == 'chk_1'),
          isTrue,
        );

        // Bölümü Bitir butonuna bas -> tamamlanır ve son bölüm olduğu için 'Konu Testine Geç →' görünür
        await tester.tap(find.byKey(const ValueKey('complete_unit_button')));
        await tester.pumpAndSettle();

        expect(
          const TopicLessonProgressRepository().isUnitCompleted(richUnit.id),
          isTrue,
        );
        expect(
          find.byKey(const ValueKey('go_to_topic_tests_from_unit_button')),
          findsOneWidget,
        );
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'LessonTopicsScreen konu satırında Konu Anlatımı butonu göstermez ve QuizResultScreen Konuyu Tekrar Oku bağlantısı sunar',
      (tester) async {
        tester.view.physicalSize = const Size(800, 1400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        final fakeRepo = TopicLessonRepository(
          remoteFetcherOverride: ({required lesson, required topic}) async {
            if (lesson == 'Tarih' && topic == 'İslamiyet Öncesi Türk Tarihi') {
              return [
                {
                  'id': 'tarih.islamiyet_oncesi_turk_tarihi.01',
                  'lesson': 'Tarih',
                  'topic': 'İslamiyet Öncesi Türk Tarihi',
                  'unit_order': 1,
                  'title': 'Bölüm 1: Orta Asya Kültür Merkezleri',
                  'summary': 'Pilot bölüm özeti.',
                  'estimated_minutes': 5,
                  'blocks': [
                    {'type': 'paragraph', 'text': 'Test paragrafı.'},
                  ],
                  'exam_scopes': ['lisans_gygk'],
                  'content_version': 1,
                  'is_published': true,
                },
              ];
            }
            return const [];
          },
        );

        // Konu Anlatımı girişi artık konu satırında değil, TopicTestsScreen'in
        // en üstünde (bkz. test/topic_tests_screen_test.dart).
        final tarihLesson = kpssLessons.firstWhere((l) => l.name == 'Tarih');
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              topicLessonRepositoryProvider.overrideWithValue(fakeRepo),
            ],
            child: MaterialApp(
              theme: AppTheme.light,
              home: LessonTopicsScreen(lesson: tarihLesson),
            ),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.byKey(const ValueKey('open_topic_lesson_1')), findsNothing);

        // QuizResultScreen zayıf konu kartında 'Konuyu Tekrar Oku' butonu bulunur
        const resultWithWeakTopic = QuizResult(
          totalQuestions: 10,
          correctCount: 5,
          wrongCount: 5,
          emptyCount: 0,
          topicBreakdown: {
            'Tarih::İslamiyet Öncesi Türk Tarihi': TopicResult(
              lesson: 'Tarih',
              topic: 'İslamiyet Öncesi Türk Tarihi',
              totalQuestions: 10,
              correctCount: 5,
              wrongCount: 5,
              emptyCount: 0,
            ),
          },
        );

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              topicLessonRepositoryProvider.overrideWithValue(fakeRepo),
            ],
            child: MaterialApp(
              key: const ValueKey('quiz_result_test_app'),
              theme: AppTheme.light,
              home: const QuizResultScreen(result: resultWithWeakTopic),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(
          find.byKey(const ValueKey('quiz_result_review_topic_lesson_btn')),
          findsOneWidget,
        );
        expect(find.text('Konuyu Tekrar Oku'), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );
  });
}
