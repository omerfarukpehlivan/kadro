import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/mistakes/data/mistake_repository.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';

import 'package:kadro/shared/widgets/turkey_map/turkey_map.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'QuizScreen imageUrl olan soruda görsel kartını ve zoom modalını render eder',
    (tester) async {
      const questionWithImage = Question(
        id: 'test_map_001',
        lesson: 'Coğrafya',
        topic: 'Türkiye\'nin Yer Şekilleri ve İklimi',
        text: 'Haritada numaralandırılmış alanlardan hangisinde karstik arazi yaygındır?',
        options: ['I', 'II', 'III', 'IV', 'V'],
        correctIndex: 2,
        explanation:
            'III numaralı alan Teke Platosu olup karstik şekiller yaygındır.',
        imageUrl: 'assets/images/maps/turkiye_dilsiz_harita.png',
      );

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: QuizScreen(
              questions: [questionWithImage],
              customTitle: 'Haritalı Soru Testi',
              mistakeRepository: MistakeRepository(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // 1. Harita kartının ve "Büyüt" rozetinin ekranda olduğunu doğrula
      expect(find.text('Büyüt'), findsOneWidget);
      expect(find.textContaining('karstik arazi yaygındır'), findsOneWidget);

      // 2. Harita kartına dokunulduğunda InteractiveViewer içeren zoom modalının açıldığını doğrula
      await tester.tap(find.text('Büyüt'));
      await tester.pumpAndSettle();

      expect(find.byType(InteractiveViewer), findsOneWidget);
      expect(
        find.textContaining('İki parmağınızla yakınlaştırıp'),
        findsOneWidget,
      );

      // 3. Kapatma butonuna basıldığında modalın kapandığını doğrula
      await tester.tap(find.byType(IconButton).last);
      await tester.pumpAndSettle();

      expect(find.byType(InteractiveViewer), findsNothing);
    },
  );

  testWidgets(
    'QuizScreen map:// URI olan soruda dinamik TurkeyMapCard render eder',
    (tester) async {
      const questionWithMap = Question(
        id: 'test_vector_map_001',
        lesson: 'Coğrafya',
        topic: 'Türkiye\'nin Madenleri ve Enerji Kaynakları',
        text: 'Haritada numaralarla gösterilen alanların hangisinde Taş kömürü çıkarılır?',
        options: ['I', 'II', 'III', 'IV', 'V'],
        correctIndex: 0,
        explanation: 'Taş kömürü Zonguldak havzasında çıkarılır.',
        imageUrl: 'map://turkey/tas_komuru',
      );

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: QuizScreen(
              questions: [questionWithMap],
              customTitle: 'Vektörel Harita Testi',
              mistakeRepository: MistakeRepository(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // TurkeyMapCard ve Büyüt butonu ekranda olmalı
      expect(find.byType(TurkeyMapCard), findsOneWidget);
      expect(find.text('Büyüt'), findsOneWidget);

      // Büyüt'e tıklandığında zoom modal açılmalı
      await tester.tap(find.text('Büyüt'));
      await tester.pumpAndSettle();

      expect(find.byType(InteractiveViewer), findsOneWidget);

      // Kapat
      await tester.tap(find.byType(IconButton).last);
      await tester.pumpAndSettle();

      expect(find.byType(InteractiveViewer), findsNothing);
    },
  );
}
