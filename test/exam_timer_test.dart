import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';

void main() {
  group('Süreli Sınav ve Sayaç (ExamTimer) Testleri', () {
    const testQuestions = [
      Question(
        id: 'timer_q1',
        lesson: 'Genel Kültür',
        topic: 'Deneme Sorusu',
        text: 'Deneme sınavı soru metni.',
        options: ['A', 'B', 'C', 'D', 'E'],
        correctIndex: 0,
        explanation: 'Açıklama',
      ),
    ];

    testWidgets(
      'Süreli deneme başlatıldığında sayaç rozeti görünmeli ve süre bitince otomatik sonuç ekranına geçmeli',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        // 3 saniyelik süreli deneme başlat
        await tester.pumpWidget(
          const MaterialApp(
            home: QuizScreen(
              questions: testQuestions,
              examDuration: Duration(seconds: 3),
              customTitle: 'Genel Kültür Denemesi',
            ),
          ),
        );

        // Başlığın ve 00:03 süresinin ekranda olduğunu doğrula
        expect(find.text('Genel Kültür Denemesi'), findsOneWidget);
        expect(find.text('00:03'), findsOneWidget);

        // 1 saniye ilerlet -> 00:02 olmalı
        await tester.pump(const Duration(seconds: 1));
        expect(find.text('00:02'), findsOneWidget);

        // 1 saniye daha ilerlet -> 00:01 olmalı
        await tester.pump(const Duration(seconds: 1));
        expect(find.text('00:01'), findsOneWidget);

        // Son saniyeyi de ilerlet -> Süre bittiğinde otomatik _finishQuiz çağrılmalı
        await tester.pump(const Duration(seconds: 1));
        await tester.pumpAndSettle();

        // Sonuç karnesinin açıldığını doğrula
        expect(find.text('Test Tamamlandı!'), findsOneWidget);
        expect(find.text('Test Sonucu'), findsOneWidget);
        expect(find.text('Ana Sayfaya Dön'), findsOneWidget);
      },
    );
  });
}
