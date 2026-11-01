import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:kadro/core/config/supabase_config.dart';
import 'package:kadro/features/quiz/data/models/question.dart';

/// Soru verilerini yerel JSON dosyasından veya Supabase bulut veritabanından (`public.questions`)
/// okuyan veri erişim katmanı.
///
/// Web/Angular Karşılığı: `QuestionService` / Repository.
/// UI bileşenleri verinin nereden geldiğini (Supabase veya JSON) bilmez; sadece bu katmanı çağırır.
class QuestionRepository {
  final String assetPath;

  const QuestionRepository({
    this.assetPath = 'assets/data/questions/sample_questions.json',
  });

  /// Tüm soruları yerel JSON dosyasından yükler.
  Future<List<Question>> loadAllQuestions() async {
    try {
      final jsonString = await rootBundle.loadString(assetPath);
      final dynamic decoded = jsonDecode(jsonString);

      if (decoded is! List) {
        throw const FormatException(
          'Beklenen JSON formatı dizi (Array) olmalı.',
        );
      }

      return decoded
          .map((item) => Question.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Sorular yüklenemedi: $e');
    }
  }

  /// `loadAllQuestions` için alias (geriye dönük uyumluluk).
  Future<List<Question>> loadSampleQuestions() => loadAllQuestions();

  /// Belirli bir derse (`lessonName`) ait soruları yerel dosyadan filtreleyerek döner.
  Future<List<Question>> getQuestionsByLesson(String lessonName) async {
    final allQuestions = await loadAllQuestions();
    return allQuestions
        .where((question) => question.lesson == lessonName)
        .toList();
  }

  /// Supabase `public.questions` tablosundan ders ve konu bazında soruları çeker.
  /// Bulut bağlantısı yoksa veya hata alınırsa güvenli şekilde yerel JSON yedeğine düşer (Offline Fallback).
  Future<List<Question>> fetchQuestions({String? lesson, String? topic}) async {
    final client = SupabaseConfig.clientOrNull;
    if (client != null) {
      try {
        var query = client
            .from('questions')
            .select()
            .eq('question_type', 'multiple_choice');

        if (lesson != null && lesson.isNotEmpty) {
          query = query.eq('lesson', lesson);
        }
        if (topic != null && topic.isNotEmpty) {
          query = query.eq('topic', topic);
        }

        final List<dynamic> response = await query;
        if (response.isNotEmpty) {
          final cloudQuestions = response
              .map((row) => Question.fromSupabase(row as Map<String, dynamic>))
              .where((q) => q.options.isNotEmpty)
              .toList();

          if (cloudQuestions.isNotEmpty) {
            return cloudQuestions;
          }
        }
      } catch (_) {
        // Bulut sorgusu başarısız olursa yerel yedeğe devam et.
      }
    }

    // Yerel JSON fallback mekanizması
    try {
      final localQuestions = await loadSampleQuestions();
      if (lesson != null && lesson.isNotEmpty) {
        final lessonQuestions = localQuestions
            .where((q) => q.lesson == lesson)
            .toList();

        if (topic != null && topic.isNotEmpty) {
          final topicQuestions = lessonQuestions
              .where((q) => q.topic == topic)
              .toList();
          if (topicQuestions.isNotEmpty) {
            return topicQuestions;
          }
        }

        if (lessonQuestions.isNotEmpty) {
          return lessonQuestions;
        }
      }
      return localQuestions;
    } catch (_) {
      return defaultSampleQuestions;
    }
  }
}
