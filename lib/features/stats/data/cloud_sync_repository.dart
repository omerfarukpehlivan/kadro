import 'package:flutter/foundation.dart';
import 'package:kadro/core/config/supabase_config.dart';
import 'package:kadro/features/stats/data/models/quiz_session_record.dart';

/// Kullanıcının çözdüğü test oturumlarını, soru loglarını ve profil istatistiklerini
/// Supabase PostgreSQL veritabanı ile senkronize eden veri erişim katmanı.
///
/// Web/Angular Karşılığı: `CloudSyncService` / Repository Katmanı.
/// Ağ kesintilerinde veya misafir (offline) modunda sessiz ve güvenli şekilde çalışır.
class CloudSyncRepository {
  const CloudSyncRepository();

  /// Tamamlanan test oturumunu Supabase `public.quiz_sessions` tablosuna kaydeder.
  Future<void> saveQuizSession(QuizSessionRecord session) async {
    final client = SupabaseConfig.clientOrNull;
    final userId = client?.auth.currentUser?.id;
    if (client == null || userId == null) return;

    try {
      await client.from('quiz_sessions').insert({
        'user_id': userId,
        'session_title': session.title,
        'session_mode': 'topic_quiz',
        'lesson': session.lesson,
        'total_questions': session.totalQuestions,
        'correct_count': session.correctCount,
        'wrong_count': session.wrongCount,
        'empty_count': session.emptyCount,
        'net_score': session.netScore,
        'earned_xp': session.earnedXp,
        'duration_seconds': session.durationSeconds,
        'completed_at': session.completedAt.toIso8601String(),
      });
    } catch (e) {
      debugPrint('Supabase saveQuizSession hatası: $e');
    }
  }

  /// Her çözülen sorunun mikro analitiğini Supabase `public.question_attempt_logs` tablosuna kaydeder.
  Future<void> saveQuestionAttempt({
    required String questionText,
    required String lesson,
    required String topic,
    required bool isCorrect,
    required int timeSpentSeconds,
  }) async {
    final client = SupabaseConfig.clientOrNull;
    final userId = client?.auth.currentUser?.id;
    if (client == null || userId == null) return;

    try {
      await client.from('question_attempt_logs').insert({
        'user_id': userId,
        'question_text': questionText,
        'lesson': lesson,
        'topic': topic,
        'is_correct': isCorrect,
        'time_spent_seconds': timeSpentSeconds,
      });
    } catch (e) {
      debugPrint('Supabase saveQuestionAttempt hatası: $e');
    }
  }

  /// Kullanıcının toplam XP, lig seviyesi ve günlük hedefini `public.profiles` tablosuna senkronize eder.
  Future<void> syncProfileStats({
    required int totalXp,
    required String leagueTier,
    required int dailyGoalQuestions,
  }) async {
    final client = SupabaseConfig.clientOrNull;
    final userId = client?.auth.currentUser?.id;
    if (client == null || userId == null) return;

    try {
      await client
          .from('profiles')
          .update({
            'total_xp': totalXp,
            'league_tier': leagueTier,
            'daily_goal_questions': dailyGoalQuestions,
            'last_study_date': DateTime.now().toIso8601String().substring(
              0,
              10,
            ),
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', userId);
    } catch (e) {
      debugPrint('Supabase syncProfileStats hatası: $e');
    }
  }

  /// Giriş yapmış kullanıcının buluttaki geçmiş test oturumlarını çeker.
  Future<List<QuizSessionRecord>> fetchSessionHistory() async {
    final client = SupabaseConfig.clientOrNull;
    final userId = client?.auth.currentUser?.id;
    if (client == null || userId == null) return const [];

    try {
      final List<dynamic> response = await client
          .from('quiz_sessions')
          .select()
          .eq('user_id', userId)
          .order('completed_at', ascending: false)
          .limit(50);

      return response
          .map((row) => QuizSessionRecord.fromMap(row as Map<String, dynamic>))
          .toList();
    } catch (e) {
      debugPrint('Supabase fetchSessionHistory hatası: $e');
      return const [];
    }
  }
}
