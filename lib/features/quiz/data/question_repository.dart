import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:kadro/core/config/supabase_config.dart';
import 'package:kadro/features/games/data/models/concept_match_set.dart';
import 'package:kadro/features/games/data/models/true_false_item.dart';
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

  /// Havuzdaki tüm soruları (varsa Supabase, yoksa yerel JSON) yükler.
  Future<List<Question>> fetchAllFromPool() => fetchQuestions();

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

  /// Supabase `public.questions` tablosundan doğru/yanlış önermelerini çeker.
  /// Çevrimdışı veya hata durumunda yerel `sampleTrueFalseItems` havuzuna düşer.
  Future<List<TrueFalseItem>> fetchTrueFalseItems({String? lesson}) async {
    final client = SupabaseConfig.clientOrNull;
    if (client != null) {
      try {
        var query = client
            .from('questions')
            .select()
            .eq('question_type', 'true_false');

        if (lesson != null && lesson.isNotEmpty) {
          query = query.eq('lesson', lesson);
        }

        final List<dynamic> response = await query;
        if (response.isNotEmpty) {
          final cloudItems = response
              .map((row) {
                final interaction =
                    row['interaction_data'] is Map<String, dynamic>
                    ? row['interaction_data'] as Map<String, dynamic>
                    : <String, dynamic>{};
                return TrueFalseItem(
                  id: (row['id'] ?? '').toString(),
                  lesson: (row['lesson'] ?? 'Genel Kültür').toString(),
                  topic: (row['topic'] ?? 'Genel').toString(),
                  statement: (row['prompt_text'] ?? row['text'] ?? '')
                      .toString(),
                  isTrue: (interaction['isTrue'] as bool?) ?? true,
                  explanation: (row['explanation'] ?? '').toString(),
                );
              })
              .where((item) => item.statement.isNotEmpty)
              .toList();

          if (cloudItems.isNotEmpty) {
            final existingIds = cloudItems.map((e) => e.id).toSet();
            final merged = [
              ...cloudItems,
              ...sampleTrueFalseItems.where((e) => !existingIds.contains(e.id)),
            ];
            return lesson != null && lesson.isNotEmpty
                ? merged.where((e) => e.lesson == lesson).toList()
                : merged;
          }
        }
      } catch (_) {
        // Çevrimdışı durumda yerel yedeğe devam et
      }
    }

    if (lesson != null && lesson.isNotEmpty) {
      final filtered = sampleTrueFalseItems
          .where((e) => e.lesson == lesson)
          .toList();
      return filtered.isNotEmpty ? filtered : sampleTrueFalseItems;
    }
    return sampleTrueFalseItems;
  }

  /// Supabase `public.questions` tablosundan kavram eşleştirme setlerini çeker.
  /// Çevrimdışı veya hata durumunda yerel `sampleConceptMatchSets` havuzuna düşer.
  Future<List<ConceptMatchSet>> fetchConceptMatchSets() async {
    final client = SupabaseConfig.clientOrNull;
    if (client != null) {
      try {
        final List<dynamic> response = await client
            .from('questions')
            .select()
            .eq('question_type', 'matching');

        if (response.isNotEmpty) {
          final cloudSets = <ConceptMatchSet>[];
          for (final row in response) {
            final interaction = row['interaction_data'] is Map<String, dynamic>
                ? row['interaction_data'] as Map<String, dynamic>
                : <String, dynamic>{};
            final rawPairs = interaction['pairs'] as List?;
            if (rawPairs != null && rawPairs.isNotEmpty) {
              final pairs = rawPairs.map((p) {
                final pairMap = p as Map<String, dynamic>;
                return ConceptPair(
                  id: (pairMap['id'] ?? '').toString(),
                  leftTerm: (pairMap['leftTerm'] ?? '').toString(),
                  rightMatch: (pairMap['rightMatch'] ?? '').toString(),
                );
              }).toList();

              cloudSets.add(
                ConceptMatchSet(
                  id: (row['id'] ?? '').toString(),
                  title:
                      (row['prompt_text'] ??
                              row['topic'] ??
                              'Kavram Eşleştirme')
                          .toString(),
                  lesson: (row['lesson'] ?? 'Genel Kültür').toString(),
                  pairs: pairs,
                ),
              );
            }
          }

          if (cloudSets.isNotEmpty) {
            final seenTitles = cloudSets.map((s) => s.title).toSet();
            return [
              ...cloudSets,
              ...sampleConceptMatchSets.where(
                (s) => !seenTitles.contains(s.title),
              ),
            ];
          }
        }
      } catch (_) {
        // Çevrimdışı durumda yerel yedeğe devam et
      }
    }

    return sampleConceptMatchSets;
  }
}
