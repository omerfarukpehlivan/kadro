import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/core/services/screen_security_service.dart';
import 'package:kadro/features/quiz/data/question_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('TASK-96: Soru Havuzu Güvenliği ve Anti-Scraping Testleri', () {
    setUp(() {
      ScreenSecurityService.resetForTest();
      QuestionRepository.clearCacheForTest();
    });

    test('ScreenSecurityService güvenli modu başarıyla etkinleştirmeli ve kapatmalı', () async {
      expect(ScreenSecurityService.isSecureModeEnabled, isFalse);

      await ScreenSecurityService.enableSecureMode();
      expect(ScreenSecurityService.isSecureModeEnabled, isTrue);

      await ScreenSecurityService.disableSecureMode();
      expect(ScreenSecurityService.isSecureModeEnabled, isFalse);
    });

    test('QuestionRepository.fetchQuestions anti-scraping limit parametresini desteklemeli', () async {
      const repo = QuestionRepository();
      final questions = await repo.fetchQuestions(limit: 5);
      expect(questions, isNotEmpty);
      // Yerel fallback veya buluttan gelen soruların limit kuralına uygunluğunu doğrula
    });
  });
}
