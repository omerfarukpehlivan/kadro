import 'package:flutter/foundation.dart';
import 'package:kadro/core/config/supabase_config.dart';
import 'package:kadro/core/network/client_rate_limiter.dart';
import 'package:kadro/features/reports/data/models/question_report.dart';

/// Hatalı soru raporlarını Supabase bulut veritabanına ve çevrimdışı yerel
/// belleğe ileten repository katmanı (TASK-47 & TASK-90).
///
/// Angular'daki `@Injectable({ providedIn: 'root' })` servis mimarisine benzer.
class QuestionReportRepository {
  static final List<QuestionReport> _inMemoryReports = [];

  const QuestionReportRepository();

  /// Soru bildirimini Supabase `question_reports` tablosuna ekler.
  ///
  /// İstemci seviyesinde [ClientRateLimiter] anti-spam koruması devrededir:
  /// 1 dakikada en fazla 3 rapor kabul edilir. Limit aşıldığında `false` döner.
  Future<bool> submitReport(QuestionReport report) async {
    final isAllowed = ClientRateLimiter.instance.checkAndRecord(
      'submit_question_report',
      maxRequests: 3,
      window: const Duration(minutes: 1),
    );

    if (!isAllowed) {
      debugPrint(
        '[QuestionReportRepository] İstemci hız limiti (Rate limit) aşıldı. İstek engellendi.',
      );
      return false;
    }

    _inMemoryReports.add(report);
    final client = SupabaseConfig.clientOrNull;
    if (client == null) {
      debugPrint(
        '[QuestionReportRepository] Supabase offline, yerel belleğe kaydedildi.',
      );
      return true;
    }

    try {
      final payload = report.toMap();
      if (report.id.isEmpty) {
        payload.remove('id');
      }
      if (client.auth.currentUser != null) {
        payload['user_id'] = client.auth.currentUser!.id;
      }
      await client.from('question_reports').insert(payload);
      return true;
    } catch (e) {
      debugPrint('[QuestionReportRepository] submitReport hatası: $e');
      return true;
    }
  }

  /// Bekleyen raporları Supabase üzerinden veya yerel bellekten çeker.
  Future<List<QuestionReport>> fetchPendingReports() async {
    final client = SupabaseConfig.clientOrNull;
    if (client != null) {
      try {
        final response = await client
            .from('question_reports')
            .select()
            .order('created_at', ascending: false);
        final list = response as List;
        return list
            .map(
              (item) => QuestionReport.fromJson(item as Map<String, dynamic>),
            )
            .toList();
      } catch (e) {
        debugPrint('[QuestionReportRepository] fetchPendingReports hatası: $e');
      }
    }
    return List.unmodifiable(_inMemoryReports.reversed);
  }

  /// Testler için bellekteki raporları ve rate limit geçmişini temizler.
  void clearForTest() {
    _inMemoryReports.clear();
    ClientRateLimiter.instance.reset('submit_question_report');
  }
}
