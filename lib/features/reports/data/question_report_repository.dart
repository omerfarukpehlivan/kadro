import 'package:flutter/foundation.dart';
import 'package:kadro/core/config/supabase_config.dart';
import 'package:kadro/features/reports/data/models/question_report.dart';

/// Hatalı soru raporlarını Supabase bulut veritabanına ve çevrimdışı yerel
/// belleğe ileten repository katmanı (TASK-47).
///
/// Angular'daki `@Injectable({ providedIn: 'root' })` servis mimarisine benzer.
class QuestionReportRepository {
  static final List<QuestionReport> _inMemoryReports = [];

  const QuestionReportRepository();

  /// Soru bildirimini Supabase `question_reports` tablosuna ekler.
  ///
  /// Ağ kesintisinde veya çevrimdışıyken sessizce yakalar ve in-memory listeye kaydeder.
  Future<bool> submitReport(QuestionReport report) async {
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

  /// Testler için bellekteki raporları temizler.
  void clearForTest() {
    _inMemoryReports.clear();
  }
}
