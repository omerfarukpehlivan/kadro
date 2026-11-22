import 'package:flutter/foundation.dart';
import 'package:kadro/core/config/supabase_config.dart';
import 'package:kadro/core/network/client_rate_limiter.dart';
import 'package:kadro/features/flashcards/data/models/flashcard_review_progress.dart';
import 'package:kadro/features/planner/data/models/planner_sync_snapshot.dart';
import 'package:kadro/features/planner/data/models/study_task.dart';
import 'package:kadro/features/stats/data/models/quiz_session_record.dart';
import 'package:kadro/features/topic_lessons/data/models/topic_lesson_models.dart';
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

    final payload = <String, dynamic>{
      'user_id': userId,
      'session_title': session.title,
      'session_mode': 'topic_quiz',
      'lesson': session.lesson,
      'exam_scope': session.examScope,
      'total_questions': session.totalQuestions,
      'correct_count': session.correctCount,
      'wrong_count': session.wrongCount,
      'empty_count': session.emptyCount,
      'net_score': session.netScore,
      'earned_xp': session.earnedXp,
      'duration_seconds': session.durationSeconds,
      'completed_at': session.completedAt.toIso8601String(),
    };

    try {
      await client.from('quiz_sessions').insert(payload);
    } catch (e) {
      if (e.toString().contains('exam_scope')) {
        try {
          payload.remove('exam_scope');
          await client.from('quiz_sessions').insert(payload);
          return;
        } catch (fallbackErr) {
          debugPrint('Supabase saveQuizSession fallback hatası: $fallbackErr');
          return;
        }
      }
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
    String examScope = 'lisans_gk',
  }) async {
    final client = SupabaseConfig.clientOrNull;
    final userId = client?.auth.currentUser?.id;
    if (client == null || userId == null) return;

    final entry = <String, dynamic>{
      'user_id': userId,
      'question_text': questionText,
      'lesson': lesson,
      'topic': topic,
      'exam_scope': examScope,
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
      if (e.toString().contains('exam_scope')) {
        try {
          final legacyBatch = batch
              .map(
                (row) => Map<String, dynamic>.from(row)..remove('exam_scope'),
              )
              .toList(growable: false);
          await client.from('question_attempt_logs').insert(legacyBatch);
          return;
        } catch (fallbackErr) {
          debugPrint(
            'Supabase flushQuestionAttempts fallback hatası: $fallbackErr',
          );
          return;
        }
      }
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
    int? dailySolvedCount,
    int? dailyFreeLimit,
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
      if (dailySolvedCount != null) {
        payload['daily_solved_count'] = dailySolvedCount;
      }
      if (dailyFreeLimit != null) {
        payload['daily_free_limit'] = dailyFreeLimit;
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

  /// Çalışma planının gün, kilit ve görev tamamlanma durumunu (snapshot)
  /// Supabase üzerinde hem Auth `user_metadata` hem de `profiles` tablosuna
  /// çift katmanlı olarak senkronize eder.
  ///
  /// Web/Angular Benzetmesi: Backend'e state senkronizasyonu isteği gönderme.
  Future<void> syncPlannerSnapshot(PlannerSyncSnapshot snapshot) async {
    final client = SupabaseConfig.clientOrNull;
    final user = client?.auth.currentUser;
    if (client == null || user == null) return;

    final payload = snapshot.toJson();

    // Katman 1: Supabase Auth user_metadata (anında erişilebilir oturum önbelleği)
    try {
      await client.auth.updateUser(
        UserAttributes(data: {'planner_state': payload}),
      );
    } catch (e) {
      debugPrint('Supabase auth planner_state hatası: $e');
    }

    // Katman 2: public.profiles tablosu (kalıcı veritabanı JSONB kaydı)
    try {
      await client
          .from('profiles')
          .update({
            'planner_state': payload,
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', user.id);
    } catch (e) {
      debugPrint('Supabase profiles planner_state hatası: $e');
    }
  }

  /// Kullanıcının bulutta kayıtlı çalışma planı durumunu (snapshot) çeker.
  ///
  /// Hem `user_metadata` hem `profiles` tablosunu kontrol eder; her ikisinde de veri varsa
  /// `mergeWith` ile High-Water Mark prensibine göre birleştirip döndürür.
  Future<PlannerSyncSnapshot?> fetchPlannerSnapshot() async {
    final client = SupabaseConfig.clientOrNull;
    final user = client?.auth.currentUser;
    if (client == null || user == null) return null;

    PlannerSyncSnapshot? metaSnapshot;
    final rawMeta = user.userMetadata?['planner_state'];
    if (rawMeta is Map) {
      try {
        metaSnapshot = PlannerSyncSnapshot.fromJson(
          Map<String, dynamic>.from(rawMeta),
        );
      } catch (e) {
        debugPrint('Meta planner_state parse hatası: $e');
      }
    }

    PlannerSyncSnapshot? profileSnapshot;
    try {
      final profile = await fetchUserProfile();
      final rawProfileState = profile?['planner_state'];
      if (rawProfileState is Map && rawProfileState.isNotEmpty) {
        final profileMap = Map<String, dynamic>.from(rawProfileState);
        if (profileMap.containsKey('cycle_day') ||
            profileMap.containsKey('cycleDay') ||
            profileMap.containsKey('max_unlocked_day') ||
            profileMap.containsKey('completed_task_ids')) {
          profileSnapshot = PlannerSyncSnapshot.fromJson(profileMap);
        }
      }
    } catch (e) {
      debugPrint('Profile planner_state parse hatası: $e');
    }

    if (metaSnapshot != null && profileSnapshot != null) {
      return metaSnapshot.mergeWith(profileSnapshot);
    }
    return metaSnapshot ?? profileSnapshot;
  }

  /// Çözülen konu bazlı başarı matrisini `public.user_topic_mastery` tablosuna kaydeder/günceller (upsert).
  Future<void> upsertTopicMastery({
    required String lesson,
    required String topic,
    required int totalSolved,
    required int totalCorrect,
    required int totalTimeSeconds,
    String examScope = 'lisans_gk',
  }) async {
    final client = SupabaseConfig.clientOrNull;
    final userId = client?.auth.currentUser?.id;
    if (client == null || userId == null) return;

    final masteryPercent = totalSolved == 0
        ? 0
        : ((totalCorrect / totalSolved) * 100).round();
    final nowIso = DateTime.now().toIso8601String();
    final scopedPayload = <String, dynamic>{
      'user_id': userId,
      'exam_scope': examScope,
      'lesson': lesson,
      'topic': topic,
      'total_solved': totalSolved,
      'total_correct': totalCorrect,
      'total_time_seconds': totalTimeSeconds,
      'mastery_percent': masteryPercent,
      'last_studied_at': nowIso,
    };

    try {
      await client
          .from('user_topic_mastery')
          .upsert(scopedPayload, onConflict: 'user_id,exam_scope,lesson,topic');
    } catch (e) {
      final err = e.toString().toLowerCase();
      if (err.contains('exam_scope') ||
          err.contains('constraint') ||
          err.contains('conflict') ||
          err.contains('42p10') ||
          err.contains('42703') ||
          err.contains('pgrst204')) {
        try {
          final legacyPayload = Map<String, dynamic>.from(scopedPayload)
            ..remove('exam_scope');
          await client
              .from('user_topic_mastery')
              .upsert(legacyPayload, onConflict: 'user_id,lesson,topic');
          return;
        } catch (fallbackErr) {
          debugPrint(
            'Supabase upsertTopicMastery fallback hatası: $fallbackErr',
          );
          return;
        }
      }
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

  /// Yanlış defterindeki sorunun Leitner (`review_box`, `next_review_at`,
  /// `box4_streak`) ve çözüm durumunu bulutta günceller.
  Future<void> syncMistakeReviewState({
    required String questionText,
    required int reviewBox,
    required DateTime nextReviewAt,
    required int box4Streak,
    bool isResolved = false,
  }) async {
    final client = SupabaseConfig.clientOrNull;
    final userId = client?.auth.currentUser?.id;
    if (client == null || userId == null) return;

    try {
      await client
          .from('question_attempt_logs')
          .update({
            'review_box': reviewBox,
            'next_review_at': nextReviewAt.toIso8601String(),
            'box4_streak': box4Streak,
            'is_resolved_in_mistakes': isResolved,
          })
          .eq('user_id', userId)
          .eq('question_text', questionText);
    } catch (e) {
      debugPrint('Supabase syncMistakeReviewState (eski şema fallback): $e');
      if (isResolved) {
        await markMistakeResolved(questionText: questionText);
      }
    }
  }

  /// Hap bilgi kartının Leitner tekrar durumunu `public.user_flashcard_reviews`
  /// tablosuna kaydeder (`TASK-158`).
  Future<void> upsertFlashcardReview(FlashcardReviewProgress progress) async {
    final client = SupabaseConfig.clientOrNull;
    final userId = client?.auth.currentUser?.id;
    if (client == null || userId == null) return;

    try {
      await client.from('user_flashcard_reviews').upsert({
        'user_id': userId,
        'exam_scope': progress.examScope,
        'card_id': progress.cardId,
        'review_box': progress.reviewBox,
        'next_review_at': progress.nextReviewAt.toIso8601String(),
        if (progress.lastReviewedAt != null)
          'last_reviewed_at': progress.lastReviewedAt!.toIso8601String(),
        'box4_streak': progress.box4ConsecutiveCorrect,
        'is_graduated': progress.isGraduated,
      }, onConflict: 'user_id,exam_scope,card_id');
    } catch (e) {
      debugPrint('Supabase upsertFlashcardReview hatası: $e');
    }
  }

  /// Seçili sınav kapsamındaki bilgi kartı Leitner ilerlemelerini buluttan çeker.
  Future<List<FlashcardReviewProgress>> fetchFlashcardReviews({
    required String examScope,
  }) async {
    final client = SupabaseConfig.clientOrNull;
    final userId = client?.auth.currentUser?.id;
    if (client == null || userId == null) return const [];

    try {
      final List<dynamic> response = await client
          .from('user_flashcard_reviews')
          .select(
            'card_id, exam_scope, review_box, next_review_at, last_reviewed_at, box4_streak, is_graduated',
          )
          .eq('user_id', userId)
          .eq('exam_scope', examScope);

      return response.whereType<Map<String, dynamic>>().map((row) {
        return FlashcardReviewProgress.fromJson({
          ...row,
          'box4_consecutive_correct': row['box4_streak'],
        });
      }).toList();
    } catch (e) {
      debugPrint('Supabase fetchFlashcardReviews hatası: $e');
      return const [];
    }
  }

  /// Konu anlatımı bölüm ilerlemesini `public.user_topic_lesson_progress`
  /// tablosuna kaydeder (`TASK-168`).
  Future<void> upsertTopicLessonProgress(
    TopicLessonUnitProgress progress,
  ) async {
    final client = SupabaseConfig.clientOrNull;
    final userId = client?.auth.currentUser?.id;
    if (client == null || userId == null) return;

    try {
      await client
          .from('user_topic_lesson_progress')
          .upsert(
            progress.toSupabaseRow(userId),
            onConflict: 'user_id,unit_id',
          );
    } catch (e) {
      debugPrint('Supabase upsertTopicLessonProgress hatası: $e');
    }
  }

  /// Giriş yapmış kullanıcının tüm konu anlatımı ilerlemelerini buluttan çeker (`TASK-168`).
  Future<List<TopicLessonUnitProgress>> fetchTopicLessonProgress() async {
    final client = SupabaseConfig.clientOrNull;
    final userId = client?.auth.currentUser?.id;
    if (client == null || userId == null) return const [];

    try {
      final List<dynamic> response = await client
          .from('user_topic_lesson_progress')
          .select('unit_id, exam_scope, completed_at, last_opened_at')
          .eq('user_id', userId);

      return response
          .whereType<Map<String, dynamic>>()
          .map(TopicLessonUnitProgress.fromJson)
          .where((e) => e.unitId.isNotEmpty)
          .toList();
    } catch (e) {
      debugPrint('Supabase fetchTopicLessonProgress hatası: $e');
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
          .select(
            'question_id, question_text, lesson, topic, exam_scope, review_box, next_review_at, box4_streak',
          )
          .eq('user_id', userId)
          .eq('is_correct', false)
          .eq('is_resolved_in_mistakes', false)
          .order('attempted_at', ascending: false)
          .limit(100);

      return response.cast<Map<String, dynamic>>();
    } catch (_) {
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
  }

  /// Kullanıcının hedef sınavını, çok boyutlu sınav seçimini, çalışma temposunu
  /// ve tercihlerini buluta senkronize eder.
  Future<void> syncUserPreferences({
    String? targetExam,
    Map<String, dynamic>? examSelection,
    String? studyPace,
    int? targetKpssScore,
    String? focusLesson,
    bool? hasActiveStudyProgram,
    bool? hasCompletedOnboarding,
    int? dailyFreeQuestionLimit,
    String? dailyQuotaDate,
  }) async {
    final client = SupabaseConfig.clientOrNull;
    final user = client?.auth.currentUser;
    if (client == null || user == null) return;

    final prefMap = <String, dynamic>{};
    if (targetExam != null) prefMap['target_exam'] = targetExam;
    if (examSelection != null) prefMap['exam_selection'] = examSelection;
    if (studyPace != null) prefMap['study_pace'] = studyPace;
    if (targetKpssScore != null) prefMap['target_kpss_score'] = targetKpssScore;
    if (focusLesson != null) prefMap['focus_lesson'] = focusLesson;
    if (hasActiveStudyProgram != null) {
      prefMap['has_active_study_program'] = hasActiveStudyProgram;
    }
    if (hasCompletedOnboarding != null) {
      prefMap['has_completed_onboarding'] = hasCompletedOnboarding;
    }
    if (dailyFreeQuestionLimit != null) {
      prefMap['daily_free_limit'] = dailyFreeQuestionLimit;
    }
    if (dailyQuotaDate != null) {
      prefMap['daily_quota_date'] = dailyQuotaDate;
    }

    if (prefMap.isEmpty) return;

    // 1. Supabase Auth user_metadata'ya yaz (her zaman garantili ve anında erişilebilir)
    try {
      await client.auth.updateUser(UserAttributes(data: prefMap));
    } catch (e) {
      debugPrint('Supabase updateUser metadata hatası: $e');
    }

    // 2. profiles tablosuna güncelleme dene (var olan kolonlar için)
    final profilePayload = Map<String, dynamic>.from(prefMap)
      ..remove('has_completed_onboarding')
      ..remove('daily_quota_date');
    if (dailyQuotaDate != null) {
      profilePayload['last_study_date'] = dailyQuotaDate;
    }
    if (profilePayload.isEmpty) return;

    try {
      await client.from('profiles').update(profilePayload).eq('id', user.id);
    } catch (e) {
      if (e.toString().contains('exam_selection')) {
        try {
          profilePayload.remove('exam_selection');
          if (profilePayload.isNotEmpty) {
            await client
                .from('profiles')
                .update(profilePayload)
                .eq('id', user.id);
          }
          return;
        } catch (_) {}
      }
      debugPrint('Supabase syncUserPreferences profiles hatası: $e');
    }
  }

  /// Kullanıcının buluttaki tercihlerini okur.
  Future<Map<String, dynamic>?> fetchUserPreferences() async {
    final client = SupabaseConfig.clientOrNull;
    final user = client?.auth.currentUser;
    if (client == null || user == null) return null;

    final result = <String, dynamic>{};
    final meta = user.userMetadata ?? const <String, dynamic>{};

    // 1. Önce user_metadata'dan al
    if (meta.isNotEmpty) {
      result.addAll(meta);
    }

    // 2. profiles tablosundan da al
    Map<String, dynamic>? profile;
    try {
      profile = await fetchUserProfile();
      if (profile != null) {
        if (profile['target_exam'] != null) {
          result['target_exam'] = profile['target_exam'];
        }
        final profileExamSelection = profile['exam_selection'];
        if (profileExamSelection is Map && profileExamSelection.isNotEmpty) {
          result['exam_selection'] = profileExamSelection;
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
        final profilePlanner = profile['planner_state'];
        if (profilePlanner is Map && profilePlanner.isNotEmpty) {
          result['planner_state'] = profilePlanner;
        }
        if (profile['daily_free_limit'] != null) {
          result['daily_free_limit'] = profile['daily_free_limit'];
        }
      }
    } catch (_) {}

    final resolvedLimit =
        profile?['daily_free_limit'] ?? meta['daily_free_limit'];
    if (resolvedLimit != null) {
      result['dailyFreeQuestionLimit'] = (resolvedLimit as num).toInt();
      result['daily_free_limit'] = (resolvedLimit).toInt();
    }
    final resolvedQuotaDate =
        meta['daily_quota_date']?.toString() ??
        profile?['last_study_date']?.toString();
    if (resolvedQuotaDate != null && resolvedQuotaDate.isNotEmpty) {
      final dateOnly = resolvedQuotaDate.length >= 10
          ? resolvedQuotaDate.substring(0, 10)
          : resolvedQuotaDate;
      result['dailyQuotaDate'] = dateOnly;
      result['daily_quota_date'] = dateOnly;
    }

    final rawPlanner = result['planner_state'];
    final hasNonEmptyPlanner = rawPlanner is Map && rawPlanner.isNotEmpty;
    if (!hasNonEmptyPlanner) {
      result.remove('planner_state');
    }

    // Yalnızca gerçek anlamda program kurmuş, dolu plan snapshot'ı olan veya
    // metadata'da açıkça onboarding tamamlamış kullanıcılar kurulum yapmış sayılır.
    // SQL varsayılan target_exam='lisans' veya boş '{}' planner_state sayılmaz.
    if (meta['has_completed_onboarding'] == true ||
        result['has_active_study_program'] == true ||
        hasNonEmptyPlanner) {
      result['has_completed_onboarding'] = true;
    } else {
      result['has_completed_onboarding'] = false;
    }

    return result.isEmpty ? null : result;
  }

  /// Haftalık liderlik tablosunu Supabase `get_weekly_leaderboard` RPC fonksiyonu üzerinden çeker.
  ///
  /// Offline veya hata durumunda yüksek motivasyonlu varsayılan aday listesi döner.
  Future<List<LeaderboardEntry>> fetchLeaderboard({String? examFamily}) async {
    final client = SupabaseConfig.clientOrNull;
    if (client != null) {
      dynamic response;
      if (examFamily != null && examFamily.trim().isNotEmpty) {
        try {
          response = await client.rpc(
            'get_weekly_leaderboard',
            params: {'p_exam_family': examFamily.trim()},
          );
        } catch (e) {
          debugPrint(
            'Supabase scoped fetchLeaderboard RPC fallback çalışıyor: $e',
          );
        }
      }

      if (response == null) {
        try {
          response = await client.rpc('get_weekly_leaderboard');
        } catch (e) {
          debugPrint('Supabase fetchLeaderboard RPC hatası: $e');
        }
      }

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
