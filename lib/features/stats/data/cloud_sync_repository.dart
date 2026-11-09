import 'package:flutter/foundation.dart';
import 'package:kadro/core/config/supabase_config.dart';
import 'package:kadro/core/network/client_rate_limiter.dart';
import 'package:kadro/features/planner/data/models/study_task.dart';
import 'package:kadro/features/stats/data/models/quiz_session_record.dart';

/// Kullanıcının çözdüğü test oturumlarını, soru loglarını, profil istatistiklerini,
/// konu ustalık matrisini ve çalışma planlayıcı görevlerini
/// Supabase PostgreSQL veritabanı ile senkronize eden veri erişim katmanı (TASK-91 Batching & Rate-Limiting).
///
/// Web/Angular Karşılığı: `CloudSyncService` / Repository Katmanı.
/// Ağ kesintilerinde veya misafir (offline) modunda sessiz ve güvenli şekilde çalışır.
class CloudSyncRepository {
  /// Soru bazlı analitiklerin tekil HTTP istekleri atmak yerine toplu (bulk) olarak
  /// gönderilmesi için hafızada tutulan kuyruk.
  static final List<Map<String, dynamic>> _attemptQueue = [];

  const CloudSyncRepository();

  /// Tamamlanan test oturumunu Supabase `public.quiz_sessions` tablosuna kaydeder.
  /// Ayrıca oturum boyunca biriken soru deneme loglarını otomatik olarak tek bir
  /// toplu (bulk) INSERT ile veritabanına iletir.
  Future<void> saveQuizSession(QuizSessionRecord session) async {
    // 1. Önce biriken soru loglarını topluca gönder
    await flushQuestionAttempts();

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

  /// Her çözülen sorunun mikro analitiğini toplu kuyruğa (`_attemptQueue`) ekler.
  ///
  /// Her soru için tekil HTTP isteği göndermek yerine kuyruk 10 adede ulaştığında
  /// veya [flushImmediately] istendiğinde tek bir toplu INSERT yapar.
  /// Bu sayede sunucu trafiği ve maliyeti %90+ oranında korunur.
  Future<void> saveQuestionAttempt({
    required String questionText,
    required String lesson,
    required String topic,
    required bool isCorrect,
    required int timeSpentSeconds,
    bool flushImmediately = false,
  }) async {
    final client = SupabaseConfig.clientOrNull;
    final userId = client?.auth.currentUser?.id;
    if (client == null || userId == null) return;

    _attemptQueue.add({
      'user_id': userId,
      'question_text': questionText,
      'lesson': lesson,
      'topic': topic,
      'is_correct': isCorrect,
      'time_spent_seconds': timeSpentSeconds,
    });

    if (flushImmediately || _attemptQueue.length >= 10) {
      await flushQuestionAttempts();
    }
  }

  /// Kuyrukta bekleyen soru loglarını tek bir toplu istekte Supabase'e gönderir.
  Future<void> flushQuestionAttempts() async {
    if (_attemptQueue.isEmpty) return;
    final client = SupabaseConfig.clientOrNull;
    if (client == null) {
      _attemptQueue.clear();
      return;
    }

    final batch = List<Map<String, dynamic>>.from(_attemptQueue);
    _attemptQueue.clear();

    try {
      await client.from('question_attempt_logs').insert(batch);
      debugPrint(
        '[CloudSyncRepository] ${batch.length} soru analitiği tek bir toplu (bulk) istek ile gönderildi.',
      );
    } catch (e) {
      debugPrint('Supabase flushQuestionAttempts hatası: $e');
    }
  }

  /// Kullanıcının toplam XP, lig seviyesi ve günlük hedefini `public.profiles` tablosuna senkronize eder.
  ///
  /// Seri soru çözümü esnasında gereksiz sunucu bombardımanını önlemek için [ClientRateLimiter]
  /// ile en fazla 5 saniyede bir istek atacak şekilde kısıtlanmıştır ([force] = true hariç).
  Future<void> syncProfileStats({
    required int totalXp,
    required String leagueTier,
    required int dailyGoalQuestions,
    bool force = false,
  }) async {
    if (!force) {
      final allowed = ClientRateLimiter.instance.checkAndRecord(
        'sync_profile_stats',
        maxRequests: 1,
        window: const Duration(seconds: 5),
      );
      if (!allowed) {
        return; // Hızlı tekrarlanan güncellemeyi atla
      }
    }

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

  /// Testler için kuyruğu ve hız sınırlarını temizler.
  static void clearQueueForTest() {
    _attemptQueue.clear();
    ClientRateLimiter.instance.reset('sync_profile_stats');
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

  /// Giriş yapmış kullanıcının buluttaki çalışma planı görevlerini çeker.
  Future<List<StudyTask>> fetchStudyTasks() async {
    final client = SupabaseConfig.clientOrNull;
    final userId = client?.auth.currentUser?.id;
    if (client == null || userId == null) return const [];

    try {
      final List<dynamic> response = await client
          .from('study_tasks')
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: true);

      return response
          .map((row) => StudyTask.fromMap(row as Map<String, dynamic>))
          .toList();
    } catch (e) {
      debugPrint('Supabase fetchStudyTasks hatası: $e');
      return const [];
    }
  }

  /// Yeni çalışma görevini Supabase `public.study_tasks` tablosuna ekler.
  Future<void> insertStudyTask(StudyTask task) async {
    final client = SupabaseConfig.clientOrNull;
    final userId = client?.auth.currentUser?.id;
    if (client == null || userId == null) return;

    try {
      await client.from('study_tasks').insert(task.toMap(userId));
    } catch (e) {
      debugPrint('Supabase insertStudyTask hatası: $e');
    }
  }

  /// Çalışma görevinin tamamlanma durumunu günceller.
  Future<void> updateStudyTaskCompletion({
    required String title,
    required bool isCompleted,
  }) async {
    final client = SupabaseConfig.clientOrNull;
    final userId = client?.auth.currentUser?.id;
    if (client == null || userId == null) return;

    try {
      await client
          .from('study_tasks')
          .update({'is_completed': isCompleted})
          .eq('user_id', userId)
          .eq('title', title);
    } catch (e) {
      debugPrint('Supabase updateStudyTaskCompletion hatası: $e');
    }
  }

  /// Başlığına göre görevi siler.
  Future<void> deleteStudyTaskByTitle(String title) async {
    final client = SupabaseConfig.clientOrNull;
    final userId = client?.auth.currentUser?.id;
    if (client == null || userId == null) return;

    try {
      await client
          .from('study_tasks')
          .delete()
          .eq('user_id', userId)
          .eq('title', title);
    } catch (e) {
      debugPrint('Supabase deleteStudyTaskByTitle hatası: $e');
    }
  }

  /// Çözülen konu bazlı başarı matrisini `public.user_topic_mastery` tablosuna kaydeder/günceller (upsert).
  Future<void> upsertTopicMastery({
    required String lesson,
    required String topic,
    required int totalSolved,
    required int totalCorrect,
    required int totalTimeSeconds,
  }) async {
    final client = SupabaseConfig.clientOrNull;
    final userId = client?.auth.currentUser?.id;
    if (client == null || userId == null) return;

    try {
      final masteryPercent = totalSolved == 0
          ? 0
          : ((totalCorrect / totalSolved) * 100).round();

      await client.from('user_topic_mastery').upsert({
        'user_id': userId,
        'lesson': lesson,
        'topic': topic,
        'total_solved': totalSolved,
        'total_correct': totalCorrect,
        'total_time_seconds': totalTimeSeconds,
        'mastery_percent': masteryPercent,
        'last_studied_at': DateTime.now().toIso8601String(),
      }, onConflict: 'user_id,lesson,topic');
    } catch (e) {
      debugPrint('Supabase upsertTopicMastery hatası: $e');
    }
  }

  /// Yanlış defterindeki bir soru doğru çözüldüğünde
  /// Supabase `public.question_attempt_logs` tablosunda `is_resolved_in_mistakes = true` yapar.
  Future<void> markMistakeResolved({required String questionText}) async {
    final client = SupabaseConfig.clientOrNull;
    final userId = client?.auth.currentUser?.id;
    if (client == null || userId == null) return;

    try {
      await client
          .from('question_attempt_logs')
          .update({'is_resolved_in_mistakes': true})
          .eq('user_id', userId)
          .eq('question_text', questionText);
    } catch (e) {
      debugPrint('Supabase markMistakeResolved hatası: $e');
    }
  }

  /// Haftalık liderlik tablosunu Supabase `get_weekly_leaderboard` RPC fonksiyonu üzerinden çeker.
  ///
  /// Offline veya hata durumunda yüksek motivasyonlu varsayılan aday listesi döner.
  Future<List<LeaderboardEntry>> fetchLeaderboard() async {
    final client = SupabaseConfig.clientOrNull;
    if (client != null) {
      try {
        final response = await client.rpc('get_weekly_leaderboard');
        if (response is List && response.isNotEmpty) {
          return response.map((row) {
            final map = row as Map<String, dynamic>;
            return LeaderboardEntry(
              displayName: (map['display_name'] as String?) ?? 'Memur Adayı',
              totalXp: (map['total_xp'] as num?)?.toInt() ?? 0,
              leagueTier: (map['league_tier'] as String?) ?? 'Bronz Kadro',
            );
          }).toList();
        }
      } catch (e) {
        debugPrint('Supabase fetchLeaderboard RPC hatası: $e');
      }
    }

    // Offline / Demo yedek adaylar
    return const [
      LeaderboardEntry(
        displayName: 'Zeynep K. (90+ Hedef)',
        totalXp: 640,
        leagueTier: 'Altın Kadro',
      ),
      LeaderboardEntry(
        displayName: 'Burak T. (Merkez Kadro)',
        totalXp: 420,
        leagueTier: 'Gümüş Kadro',
      ),
      LeaderboardEntry(
        displayName: 'Elif A. (A Grubu)',
        totalXp: 285,
        leagueTier: 'Gümüş Kadro',
      ),
      LeaderboardEntry(
        displayName: 'Mert D. (Memur Adayı)',
        totalXp: 140,
        leagueTier: 'Bronz Kadro',
      ),
    ];
  }
}

/// Haftalık Kadro Lig sıralamasındaki bir adayın özet bilgisi.
class LeaderboardEntry {
  final String displayName;
  final int totalXp;
  final String leagueTier;

  const LeaderboardEntry({
    required this.displayName,
    required this.totalXp,
    required this.leagueTier,
  });
}
