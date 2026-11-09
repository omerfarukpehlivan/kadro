import 'package:flutter/foundation.dart';
import 'package:kadro/core/config/supabase_config.dart';
import 'package:kadro/core/network/client_rate_limiter.dart';
import 'package:kadro/features/planner/data/models/study_task.dart';
import 'package:kadro/features/stats/data/models/quiz_session_record.dart';
import 'package:supabase_flutter/supabase_flutter.dart' show UserAttributes;

/// Kullanıcının çözdüğü test oturumlarını, soru loglarını, profil istatistiklerini,
/// konu ustalık matrisini ve çalışma planlayıcı görevlerini
/// Supabase PostgreSQL veritabanı ile senkronize eden veri erişim katmanı.
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
    String? questionId,
    String? selectedAnswer,
    String? correctAnswer,
  }) async {
    final client = SupabaseConfig.clientOrNull;
    final userId = client?.auth.currentUser?.id;
    if (client == null || userId == null) return;

    final entry = <String, dynamic>{
      'user_id': userId,
      'question_text': questionText,
      'lesson': lesson,
      'topic': topic,
      'is_correct': isCorrect,
      'time_spent_seconds': timeSpentSeconds,
    };
    if (questionId != null) entry['question_id'] = questionId;
    if (selectedAnswer != null) entry['selected_answer'] = selectedAnswer;
    if (correctAnswer != null) entry['correct_answer'] = correctAnswer;

    _attemptQueue.add(entry);

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

  /// Kullanıcının toplam XP, lig seviyesi, seri ve günlük hedefini `public.profiles` tablosuna senkronize eder.
  ///
  /// Seri soru çözümü esnasında gereksiz sunucu bombardımanını önlemek için [ClientRateLimiter]
  /// ile en fazla 5 saniyede bir istek atacak şekilde kısıtlanmıştır ([force] = true hariç).
  Future<void> syncProfileStats({
    required int totalXp,
    required String leagueTier,
    required int dailyGoalQuestions,
    int? currentStreakDays,
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
      final payload = <String, dynamic>{
        'total_xp': totalXp,
        'league_tier': leagueTier,
        'daily_goal_questions': dailyGoalQuestions,
        'last_study_date': DateTime.now().toIso8601String().substring(0, 10),
        'updated_at': DateTime.now().toIso8601String(),
      };
      if (currentStreakDays != null && currentStreakDays > 0) {
        payload['current_streak_days'] = currentStreakDays;
      }
      await client.from('profiles').update(payload).eq('id', userId);
    } catch (e) {
      debugPrint('Supabase syncProfileStats hatası: $e');
    }
  }

  /// 30 günden eski veya Yanlış Defteri'nde çözülmüş mikro-analitik kayıtlarını temizler (TASK-95).
  ///
  /// Veritabanı disk kotasını korur ve sorgu performansını artırır.
  Future<int> purgeExpiredAttemptLogs({int retentionDays = 30}) async {
    final client = SupabaseConfig.clientOrNull;
    if (client == null) return 0;

    try {
      final response = await client.rpc(
        'purge_expired_attempt_logs',
        params: {'p_retention_days': retentionDays},
      );
      return (response as num?)?.toInt() ?? 0;
    } catch (e) {
      debugPrint('[CloudSyncRepository] purgeExpiredAttemptLogs hatası: $e');
      return 0;
    }
  }

  /// Testler için kuyruğu ve hız sınırlarını temizler.
  static void clearQueueForTest() {
    _attemptQueue.clear();
  }

  /// Giriş yapmış kullanıcının profil, XP, seri ve PRO durumunu çeker.
  Future<Map<String, dynamic>?> fetchUserProfile() async {
    final client = SupabaseConfig.clientOrNull;
    final userId = client?.auth.currentUser?.id;
    if (client == null || userId == null) return null;

    try {
      final response = await client
          .from('profiles')
          .select()
          .eq('id', userId)
          .maybeSingle();
      return response;
    } catch (e) {
      debugPrint('Supabase fetchUserProfile hatası: $e');
      return null;
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

  /// Giriş yapmış kullanıcının konu bazlı ustalık matrisini çeker.
  Future<List<Map<String, dynamic>>> fetchTopicMastery() async {
    final client = SupabaseConfig.clientOrNull;
    final userId = client?.auth.currentUser?.id;
    if (client == null || userId == null) return const [];

    try {
      final List<dynamic> response = await client
          .from('user_topic_mastery')
          .select()
          .eq('user_id', userId);
      return response.cast<Map<String, dynamic>>();
    } catch (e) {
      debugPrint('Supabase fetchTopicMastery hatası: $e');
      return const [];
    }
  }

  /// Giriş yapmış kullanıcının çözülmemiş yanlış soru kayıtlarını çeker.
  Future<List<Map<String, dynamic>>> fetchUnresolvedMistakes() async {
    final client = SupabaseConfig.clientOrNull;
    final userId = client?.auth.currentUser?.id;
    if (client == null || userId == null) return const [];

    try {
      final List<dynamic> response = await client
          .from('question_attempt_logs')
          .select('question_id, question_text, lesson, topic')
          .eq('user_id', userId)
          .eq('is_correct', false)
          .eq('is_resolved_in_mistakes', false)
          .order('attempted_at', ascending: false)
          .limit(100);

      return response.cast<Map<String, dynamic>>();
    } catch (e) {
      debugPrint('Supabase fetchUnresolvedMistakes hatası: $e');
      return const [];
    }
  }

  /// Kullanıcının hedef sınavını, çalışma temposunu ve tercihlerini buluta senkronize eder.
  Future<void> syncUserPreferences({
    String? targetExam,
    String? studyPace,
    int? targetKpssScore,
    String? focusLesson,
    bool? hasActiveStudyProgram,
    bool? hasCompletedOnboarding,
  }) async {
    final client = SupabaseConfig.clientOrNull;
    final user = client?.auth.currentUser;
    if (client == null || user == null) return;

    final prefMap = <String, dynamic>{};
    if (targetExam != null) prefMap['target_exam'] = targetExam;
    if (studyPace != null) prefMap['study_pace'] = studyPace;
    if (targetKpssScore != null) prefMap['target_kpss_score'] = targetKpssScore;
    if (focusLesson != null) prefMap['focus_lesson'] = focusLesson;
    if (hasActiveStudyProgram != null) {
      prefMap['has_active_study_program'] = hasActiveStudyProgram;
    }
    if (hasCompletedOnboarding != null) {
      prefMap['has_completed_onboarding'] = hasCompletedOnboarding;
    }

    if (prefMap.isEmpty) return;

    // 1. Supabase Auth user_metadata'ya yaz (her zaman garantili ve anında erişilebilir)
    try {
      await client.auth.updateUser(UserAttributes(data: prefMap));
    } catch (e) {
      debugPrint('Supabase updateUser metadata hatası: $e');
    }

    // 2. profiles tablosuna güncelleme dene (var olan kolonlar için)
    try {
      final profilePayload = Map<String, dynamic>.from(prefMap)
        ..remove('has_completed_onboarding');
      if (profilePayload.isNotEmpty) {
        await client.from('profiles').update(profilePayload).eq('id', user.id);
      }
    } catch (e) {
      debugPrint('Supabase syncUserPreferences profiles hatası: $e');
    }
  }

  /// Kullanıcının buluttaki tercihlerini okur.
  Future<Map<String, dynamic>?> fetchUserPreferences() async {
    final client = SupabaseConfig.clientOrNull;
    final user = client?.auth.currentUser;
    if (client == null || user == null) return null;

    final result = <String, dynamic>{};

    // 1. Önce user_metadata'dan al
    if (user.userMetadata != null && user.userMetadata!.isNotEmpty) {
      result.addAll(user.userMetadata!);
    }

    // 2. profiles tablosundan da al
    try {
      final profile = await fetchUserProfile();
      if (profile != null) {
        if (profile['target_exam'] != null) {
          result['target_exam'] = profile['target_exam'];
        }
        if (profile['study_pace'] != null) {
          result['study_pace'] = profile['study_pace'];
        }
        if (profile['target_kpss_score'] != null) {
          result['target_kpss_score'] = profile['target_kpss_score'];
        }
        if (profile['focus_lesson'] != null) {
          result['focus_lesson'] = profile['focus_lesson'];
        }
        if (profile['has_active_study_program'] != null) {
          result['has_active_study_program'] =
              profile['has_active_study_program'];
        }
        if (profile['is_pro'] != null) {
          result['is_pro'] = profile['is_pro'];
        }
        if (profile['daily_goal_questions'] != null) {
          result['daily_goal_questions'] = profile['daily_goal_questions'];
        }
      }
    } catch (_) {}

    return result.isEmpty ? null : result;
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
