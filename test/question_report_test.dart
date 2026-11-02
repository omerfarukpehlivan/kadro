import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/features/reports/data/models/question_report.dart';
import 'package:kadro/features/reports/data/question_report_repository.dart';
import 'package:kadro/features/reports/presentation/admin_reports_screen.dart';
import 'package:kadro/features/reports/presentation/report_question_bottom_sheet.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    const QuestionReportRepository().clearForTest();
  });

  group('QuestionReport Model & Repository Testleri (TASK-47)', () {
    test(
      'QuestionReport toJson ve fromJson serileştirmesi eksiksiz çalışmalı',
      () {
        final now = DateTime(2026, 11, 2, 17, 30);
        final report = QuestionReport(
          id: 'rep_123',
          userId: 'usr_abc',
          questionId: 'tar_001',
          lesson: 'Tarih',
          topic: 'İlk Türk Devletleri',
          testTitle: 'Tarih Konu Testi',
          questionText: 'Uygurlar yerleşik hayata geçmiştir.',
          reason: 'Cevap anahtarı hatalı',
          userNote: 'Doğru cevap A yerine B olmalı',
          status: 'pending',
          createdAt: now,
        );

        final json = report.toJson();
        expect(json['id'], equals('rep_123'));
        expect(json['user_id'], equals('usr_abc'));
        expect(json['question_id'], equals('tar_001'));
        expect(json['lesson'], equals('Tarih'));
        expect(json['topic'], equals('İlk Türk Devletleri'));
        expect(json['reason'], equals('Cevap anahtarı hatalı'));
        expect(json['user_note'], equals('Doğru cevap A yerine B olmalı'));
        expect(json['status'], equals('pending'));

        final fromJson = QuestionReport.fromJson(json);
        expect(fromJson.id, equals(report.id));
        expect(fromJson.userId, equals(report.userId));
        expect(fromJson.questionId, equals(report.questionId));
        expect(fromJson.reason, equals(report.reason));
        expect(fromJson.userNote, equals(report.userNote));
      },
    );

    test(
      'QuestionReportRepository in-memory ve fallback akışı güvenli çalışmalı',
      () async {
        const repo = QuestionReportRepository();
        repo.clearForTest();

        final report = QuestionReport(
          id: 'rep_test',
          questionId: 'tar_002',
          lesson: 'Tarih',
          topic: 'Osmanlı Devleti',
          testTitle: 'Deneme Sınavı',
          questionText: 'Osmanlı Beyliği hangi yüzyılda kuruldu?',
          reason: 'Yazım / İmla hatası',
          createdAt: DateTime.now(),
        );

        final success = await repo.submitReport(report);
        expect(success, isTrue);

        final list = await repo.fetchPendingReports();
        expect(list.isNotEmpty, isTrue);
        expect(list.first.questionId, equals('tar_002'));
        expect(list.first.reason, equals('Yazım / İmla hatası'));
      },
    );
  });

  group(
    'ReportQuestionBottomSheet & QuizScreen Entegrasyon Testleri (TASK-47)',
    () {
      const sampleQuestion = Question(
        id: 'tar_sample',
        lesson: 'Tarih',
        topic: 'İslamiyet Öncesi',
        text: 'Orhun Yazıtları hangi alfabe ile yazılmıştır?',
        options: ['Göktürk', 'Uygur', 'Arap', 'Kiril', 'Latin'],
        correctIndex: 0,
        explanation:
            'Orhun Kitabeleri 38 harfli Göktürk alfabesiyle yazılmıştır.',
      );

      testWidgets(
        'QuizScreen AppBar üzerinde bayrak butonu olmalı ve tıklandığında alt sayfa açılmalı',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 1.0;
          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          final container = ProviderContainer();
          addTearDown(container.dispose);

          await tester.pumpWidget(
            UncontrolledProviderScope(
              container: container,
              child: const MaterialApp(
                home: QuizScreen(questions: [sampleQuestion]),
              ),
            ),
          );
          await tester.pumpAndSettle();

          // Bayrak butonu var mı?
          final flagButton = find.byIcon(LucideIcons.flag);
          expect(flagButton, findsOneWidget);

          // Bayrak butonuna tıkla
          await tester.tap(flagButton);
          await tester.pumpAndSettle();

          // Alt sayfa açıldı mı?
          expect(find.byType(ReportQuestionBottomSheet), findsOneWidget);
          expect(find.text('Hatalı Soru Bildir'), findsOneWidget);
          expect(find.text('Cevap anahtarı hatalı'), findsOneWidget);
          expect(find.text('Birden fazla doğru şık var'), findsOneWidget);

          // Sebep seç ve gönder
          await tester.tap(find.text('Birden fazla doğru şık var'));
          await tester.pumpAndSettle();

          await tester.tap(find.text('Bildirimi Gönder'));
          await tester.pumpAndSettle();

          // Alt sayfa kapandı mı ve teşekkür mesajı çıktı mı?
          expect(find.byType(ReportQuestionBottomSheet), findsNothing);
          expect(
            find.text('Bildirimin için teşekkürler! Soru incelemeye alındı.'),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'AdminReportsScreen boş ve dolu durumları doğru render etmeli',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 1.0;
          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          const repo = QuestionReportRepository();
          repo.clearForTest();

          // 1. Boş durum
          await tester.pumpWidget(
            const MaterialApp(home: AdminReportsScreen(repository: repo)),
          );
          await tester.pumpAndSettle();

          expect(find.text('Henüz bildirilmiş soru yok!'), findsOneWidget);

          // 2. Rapor ekle ve yeniden yükle
          await repo.submitReport(
            QuestionReport(
              id: 'rep_admin_test',
              questionId: 'cogr_001',
              lesson: 'Coğrafya',
              topic: 'Türkiye Dağları',
              testTitle: 'Coğrafya Genel Soru Çözümü',
              questionText: 'Ağrı Dağı hangi bölgemizde yer alır?',
              reason: 'Cevap anahtarı hatalı',
              userNote: 'Şıklar karışmış.',
              createdAt: DateTime.now(),
            ),
          );

          // Yenile butonuna tıkla
          await tester.tap(find.byIcon(LucideIcons.refreshCw));
          await tester.pumpAndSettle();

          expect(find.text('Soru Denetim Masası'), findsOneWidget);
          expect(find.text('Coğrafya · Türkiye Dağları'), findsOneWidget);
          expect(find.text('Cevap anahtarı hatalı'), findsOneWidget);
          expect(
            find.text('Kullanıcı Notu: "Şıklar karışmış."'),
            findsOneWidget,
          );
        },
      );
    },
  );
}
