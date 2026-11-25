import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/app/theme.dart';
import 'package:kadro/features/exams/presentation/exams_screen.dart';
import 'package:kadro/features/home/presentation/home_screen.dart';
import 'package:kadro/features/lessons/data/kpss_lessons.dart';
import 'package:kadro/features/lessons/presentation/lesson_topics_screen.dart';
import 'package:kadro/features/lessons/presentation/lessons_screen.dart';
import 'package:kadro/features/lessons/presentation/topic_tests_screen.dart';
import 'package:kadro/features/mistakes/presentation/mistakes_screen.dart';
import 'package:kadro/features/profile/presentation/profile_screen.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/data/models/quiz_result.dart';
import 'package:kadro/features/quiz/presentation/quiz_result_screen.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/features/stats/presentation/stats_screen.dart';
import 'package:kadro/features/topic_lessons/data/models/topic_lesson_models.dart';
import 'package:kadro/features/topic_lessons/data/topic_lesson_repository.dart';
import 'package:kadro/features/topic_lessons/presentation/topic_lesson_unit_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _safeSampleSvg =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 10 10" width="10" height="10" fill="none" stroke="currentColor"><g transform="translate(2 2)"><circle cx="5" cy="5" r="2"/><text x="1" y="9" fill="currentColor" text-anchor="middle">A &amp; B</text></g></svg>';

const _mathQuestion = Question(
  id: 'mat-05-902',
  lesson: 'Matematik & Geometri',
  topic: 'Üslü ve Köklü İfadeler',
  text: r'$x$ bir gerçek sayı olmak üzere $$\dfrac{2^{x+3} - 2^{x+1}}{2^{x}}$$ ve $\sqrt{75} - \sqrt{12} + \sqrt{27}$ ifadesinin değeri kaçtır?',
  options: [r'$2$', r'$3$', r'$4$', r'$6$', r'$8$'],
  correctIndex: 3,
  explanation: r'Paydaki iki terimde de $2^{x}$ ortak çarpandır: $2^{x+3}-2^{x+1}=2^{x}(2^{3}-2^{1})=2^{x}\cdot 6$.',
  distractorTrap: r'C şıkkı ($4$), üslü sayıların farkını üslerin farkıyla karıştırıp $2^{(x+3)-(x+1)}=2^{2}$ yazan adayı yakalar.',
  difficulty: 'medium',
  figureSvg: _safeSampleSvg,
);

final _richMathUnit = TopicLessonUnit.fromJson({
  'id': 'matematik.uslu_koklu.01',
  'lesson': 'Matematik & Geometri',
  'topic': 'Üslü ve Köklü İfadeler',
  'unit_order': 1,
  'title': 'Bölüm 1: Üslü ve Köklü İfadelerde Temel Özellikler',
  'summary': 'Taban eşitliği, ortak çarpan parantezi ve kök sadeleştirme.',
  'estimated_minutes': 5,
  'blocks': [
    {
      'type': 'paragraph',
      'text': r'Üslü ifadelerde toplama ve çıkarma yapılırken **ortak çarpan parantezine** alma kuralı uygulanır: $\sqrt{75} - \sqrt{12} + \sqrt{27} = 6\sqrt{3}$ ve $$\dfrac{2^{x+3} - 2^{x+1}}{2^{x}} = 6$$',
    },
    {
      'type': 'figure',
      'svg': _safeSampleSvg,
      'caption': 'Şekil 1: Birim çember ve koordinat düzlemi örneği.',
    },
    {
      'type': 'table',
      'headers': ['İfade', 'Sade Hâli', 'Not'],
      'rows': [
        [r'$\sqrt{75}$', r'$5\sqrt{3}$', '25 tam kare'],
        [r'$\sqrt{12}$', r'$2\sqrt{3}$', '4 tam kare'],
      ],
    },
    {
      'type': 'callout',
      'kind': 'trap',
      'text': r'ÖSYM çeldiricisi olarak $2^{x+3}-2^{x+1}$ ifadesinde üsleri çıkarmaya çalışmayın.',
    },
    {
      'type': 'callout',
      'kind': 'example',
      'text': r'Örnek: $a=\sqrt{2}$, $b=\sqrt[3]{3}$, $c=\sqrt[6]{10}$ sıralamasında $a<b<c$ bulunur.',
    },
  ],
  'exam_scopes': ['lisans_gygk'],
  'content_version': 1,
  'is_published': true,
});

Future<void> _pumpAndVerifyNoOverflow(
  WidgetTester tester, {
  required Size size,
  required Widget home,
}) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1.0;
  addTearDown(() {
    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });

  final fakeTopicRepo = TopicLessonRepository(
    remoteFetcherOverride: ({required lesson, required topic}) async =>
        const [],
  );

  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        topicLessonRepositoryProvider.overrideWithValue(fakeTopicRepo),
      ],
      child: MaterialApp(theme: AppTheme.light, home: home),
    ),
  );
  await tester.pump(const Duration(milliseconds: 250));
  await tester.pump(const Duration(milliseconds: 250));

  expect(tester.takeException(), isNull);
}

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    TopicLessonRepository.clearMemoryCache();
  });

  const sizes = <String, Size>{
    '360x640': Size(360, 640),
    '412x915': Size(412, 915),
    '768x1024': Size(768, 1024),
  };

  final tarihLesson = kpssLessons.firstWhere((l) => l.name == 'Tarih');

  const sampleResult = QuizResult(
    totalQuestions: 20,
    correctCount: 15,
    wrongCount: 3,
    emptyCount: 2,
    topicBreakdown: {
      'Tarih::İslamiyet Öncesi Türk Tarihi': TopicResult(
        lesson: 'Tarih',
        topic: 'İslamiyet Öncesi Türk Tarihi',
        totalQuestions: 10,
        correctCount: 8,
        wrongCount: 2,
        emptyCount: 0,
      ),
    },
  );

  group('TASK-181: 3 Boyutta (360x640, 412x915, 768x1024) Taşma Taraması', () {
    for (final entry in sizes.entries) {
      final sizeName = entry.key;
      final size = entry.value;

      testWidgets('HomeScreen taşma üretmez ($sizeName)', (tester) async {
        await _pumpAndVerifyNoOverflow(
          tester,
          size: size,
          home: const Scaffold(body: HomeScreen()),
        );
      });

      testWidgets('LessonsScreen taşma üretmez ($sizeName)', (tester) async {
        await _pumpAndVerifyNoOverflow(
          tester,
          size: size,
          home: const Scaffold(body: LessonsScreen()),
        );
      });

      testWidgets('LessonTopicsScreen taşma üretmez ($sizeName)', (
        tester,
      ) async {
        await _pumpAndVerifyNoOverflow(
          tester,
          size: size,
          home: LessonTopicsScreen(lesson: tarihLesson),
        );
      });

      testWidgets('TopicTestsScreen taşma üretmez ($sizeName)', (tester) async {
        await _pumpAndVerifyNoOverflow(
          tester,
          size: size,
          home: const TopicTestsScreen(
            lessonName: 'Tarih',
            topic: 'İslamiyet Öncesi Türk Tarihi',
          ),
        );
      });

      testWidgets(
        'TopicLessonUnitScreen (Matematik + SVG + Tablo + Tuzak) taşma üretmez ($sizeName)',
        (tester) async {
          await _pumpAndVerifyNoOverflow(
            tester,
            size: size,
            home: TopicLessonUnitScreen(
              unit: _richMathUnit,
              allUnits: [_richMathUnit],
              topicQuestionsOverride: const [_mathQuestion],
            ),
          );
        },
      );

      testWidgets(
        'QuizScreen (Matematik LaTeX + SVG şekil) taşma üretmez ($sizeName)',
        (tester) async {
          await _pumpAndVerifyNoOverflow(
            tester,
            size: size,
            home: const QuizScreen(
              customTitle: 'Matematik Örnek',
              questions: [_mathQuestion],
            ),
          );
        },
      );

      testWidgets('ExamsScreen taşma üretmez ($sizeName)', (tester) async {
        await _pumpAndVerifyNoOverflow(
          tester,
          size: size,
          home: const Scaffold(body: ExamsScreen()),
        );
      });

      testWidgets('QuizResultScreen taşma üretmez ($sizeName)', (tester) async {
        await _pumpAndVerifyNoOverflow(
          tester,
          size: size,
          home: const QuizResultScreen(result: sampleResult),
        );
      });

      testWidgets('StatsScreen taşma üretmez ($sizeName)', (tester) async {
        await _pumpAndVerifyNoOverflow(
          tester,
          size: size,
          home: const Scaffold(body: StatsScreen()),
        );
      });

      testWidgets('ProfileScreen taşma üretmez ($sizeName)', (tester) async {
        await _pumpAndVerifyNoOverflow(
          tester,
          size: size,
          home: const Scaffold(body: ProfileScreen()),
        );
      });

      testWidgets('MistakesScreen taşma üretmez ($sizeName)', (tester) async {
        await _pumpAndVerifyNoOverflow(
          tester,
          size: size,
          home: const Scaffold(body: MistakesScreen()),
        );
      });
    }
  });
}
