import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/data/question_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('QuestionRepository', () {
    const repository = QuestionRepository();

    test('loadAllQuestions tüm soruları yükler', () async {
      final questions = await repository.loadAllQuestions();

      expect(questions.isNotEmpty, true);
      expect(questions.length >= 12, true);

      final lessons = questions.map((q) => q.lesson).toSet();
      expect(lessons.contains('Tarih'), true);
      expect(lessons.contains('Coğrafya'), true);
      expect(lessons.contains('Vatandaşlık'), true);
      expect(lessons.contains('Güncel Bilgiler'), true);
    });

    test('getQuestionsByLesson ders adına göre filtreler', () async {
      final tarihQuestions = await repository.getQuestionsByLesson('Tarih');
      expect(tarihQuestions.length, 50);
      expect(tarihQuestions.first.lesson, 'Tarih');
      expect(tarihQuestions.first.id, 'tar_001');

      final vatandaslikQuestions = await repository.getQuestionsByLesson(
        'Vatandaşlık',
      );
      expect(vatandaslikQuestions.length, 300);
      expect(vatandaslikQuestions.first.lesson, 'Vatandaşlık');
      expect(vatandaslikQuestions.first.id, 'vat_001');

      final guncelQuestions = await repository.getQuestionsByLesson(
        'Güncel Bilgiler',
      );
      expect(guncelQuestions.length, 240);
      expect(guncelQuestions.first.lesson, 'Güncel Bilgiler');
      expect(guncelQuestions.first.id, 'gun_001');

      final olmayanDers = await repository.getQuestionsByLesson('Fizik');
      expect(olmayanDers.isEmpty, true);
    });

    test('fetchQuestions(lesson: "Coğrafya") yalnızca Coğrafya sorularını getirmeli', () async {
      final cografyaQuestions = await repository.fetchQuestions(
        lesson: 'Coğrafya',
      );

      expect(cografyaQuestions.isNotEmpty, true);
      expect(cografyaQuestions.length, 360);
      expect(cografyaQuestions.every((q) => q.lesson == 'Coğrafya'), true);
      expect(cografyaQuestions.any((q) => q.topic.contains('Türkiye')), true);
    });

    test('fetchQuestions konu bazlı filtreleme ve güvenli fallback', () async {
      final topicQuestions = await repository.fetchQuestions(
        lesson: 'Tarih',
        topic: 'İlk Türk Devletleri',
      );
      expect(topicQuestions.isNotEmpty, true);
      expect(topicQuestions.first.lesson, 'Tarih');
      expect(topicQuestions.first.topic, 'İlk Türk Devletleri');

      // Olmayan konu verildiğinde dersin genel sorularına düşmeli
      final fallbackQuestions = await repository.fetchQuestions(
        lesson: 'Tarih',
        topic: 'Bilinmeyen Konu XYZ',
      );
      expect(fallbackQuestions.isNotEmpty, true);
      expect(fallbackQuestions.every((q) => q.lesson == 'Tarih'), true);
    });

    test('fetchTrueFalseItems yerel örnekler ve ders filtrelemesi', () async {
      final allTf = await repository.fetchTrueFalseItems();
      expect(allTf.isNotEmpty, true);
      expect(allTf.length >= 8, true);

      final tarihTf = await repository.fetchTrueFalseItems(lesson: 'Tarih');
      expect(tarihTf.isNotEmpty, true);
      expect(tarihTf.every((item) => item.lesson == 'Tarih'), true);
    });

    test('fetchConceptMatchSets eşleştirme setlerini yüklemeli', () async {
      final matchSets = await repository.fetchConceptMatchSets();
      expect(matchSets.isNotEmpty, true);
      expect(matchSets.length >= 3, true);
      expect(matchSets.any((s) => s.lesson == 'Tarih'), true);
      expect(matchSets.any((s) => s.lesson == 'Coğrafya'), true);
      expect(matchSets.any((s) => s.lesson == 'Vatandaşlık'), true);
    });

    test('Question model imageUrl alanını hem JSON hem Supabase formatından doğru parse eder', () {
      final jsonSample = {
        'id': 'cog_map_001',
        'lesson': 'Coğrafya',
        'topic': 'Türkiye\'nin Yer Şekilleri ve İklimi',
        'text': 'Yukarıdaki Türkiye haritasında numaralandırılmış alanlardan...',
        'options': ['I', 'II', 'III', 'IV', 'V'],
        'correctIndex': 2,
        'explanation': 'III numaralı saha Doğu Karadeniz olup heyelan riski en yüksektir.',
        'difficulty': 'medium',
        'distractor_trap': 'ÖSYM daima I numaralı alanı çeldirici olarak kullanır.',
        'image_url': 'https://storage.supabase.co/question-images/harita_01.webp',
      };

      final qFromJson = Question.fromJson(jsonSample);
      expect(qFromJson.imageUrl, 'https://storage.supabase.co/question-images/harita_01.webp');
      expect(qFromJson.toJson()['image_url'], 'https://storage.supabase.co/question-images/harita_01.webp');

      final supabaseSample = {
        'id': 'cog_map_002',
        'lesson': 'Coğrafya',
        'topic': 'Madenler ve Enerji Kaynakları',
        'prompt_text': 'Haritada işaretli merkezlerin hangisinde boksit çıkarılır?',
        'interaction_data': {
          'options': ['Seydişehir', 'Murgul', 'Divriği', 'Guleman', 'Mazıdağı'],
          'correctIndex': 0,
        },
        'explanation': 'Seydişehir boksit çıkarılan ve işlenen merkezdir.',
        'difficulty': 2,
        'image_url': 'assets/images/maps/turkiye_madenler_map.png',
      };

      final qFromSupabase = Question.fromSupabase(supabaseSample);
      expect(qFromSupabase.imageUrl, 'assets/images/maps/turkiye_madenler_map.png');
      expect(qFromSupabase.options.length, 5);
      expect(qFromSupabase.options.first, 'Seydişehir');

      final copied = qFromJson.copyWith(imageUrl: 'https://new-url.webp');
      expect(copied.imageUrl, 'https://new-url.webp');
    });

    test('Hatalı dosya yolunda Exception fırlatmalı', () async {
      const invalidRepo = QuestionRepository(
        assetPath: 'assets/non_existing.json',
      );
      expect(
        () async => await invalidRepo.loadAllQuestions(),
        throwsA(isA<Exception>()),
      );
    });
  });
}
