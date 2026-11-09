import 'package:kadro/features/planner/data/models/study_program_pace.dart';
import 'package:kadro/features/planner/data/models/study_task.dart';
import 'package:kadro/features/pomodoro/data/pomodoro_notifier.dart';

/// KPSS sınav tarihine ve seçilen tempoya (Hafif, Orta, Hızlı) göre
/// müfredatı günlere yayan ve dinamik günlük çalışma görevleri üreten servis.
///
/// Web/Angular Karşılığı: Curriculum Schedule Generator & Task Planner Service.
class AutoStudyProgramGenerator {
  /// Seçilen hedef sınav, tempo ve odak dersine göre bugünkü görev listesini üretir.
  static List<StudyTask> generateDailyTasks({
    required KpssExamTarget examTarget,
    required StudyProgramPace pace,
    String? focusLesson,
    int cycleDay = 1,
  }) {
    final effectiveFocus = focusLesson ?? 'Tarih';

    switch (pace) {
      case StudyProgramPace.hafif:
        return _generateLightPaceTasks(effectiveFocus, cycleDay);
      case StudyProgramPace.orta:
        return _generateMediumPaceTasks(effectiveFocus, cycleDay);
      case StudyProgramPace.hizli:
        return _generateFastPaceTasks(effectiveFocus, cycleDay);
    }
  }

  /// 🌿 Hafif Tempo Görevleri (Günde 2 Görev, ~25 Soru, ~35 Dakika)
  static List<StudyTask> _generateLightPaceTasks(
    String focusLesson,
    int cycleDay,
  ) {
    final dayMod = (cycleDay - 1) % 5;

    switch (dayMod) {
      case 0:
        return [
          StudyTask(
            id: 'auto_h_1',
            title: '$focusLesson: Temel Konu Pekiştirme 15 Soru',
            lessonTag: focusLesson,
            estimatedMinutes: 20,
            actionType: StudyTaskActionType.quiz,
          ),
          const StudyTask(
            id: 'auto_h_2',
            title: 'Tarih & Coğrafya Hap Bilgi Kartları Tekrarı',
            lessonTag: 'Tarih',
            estimatedMinutes: 15,
            actionType: StudyTaskActionType.flashcards,
          ),
        ];
      case 1:
        return [
          const StudyTask(
            id: 'auto_h_3',
            title: 'Türkiye Coğrafi Konumu & Enlem Etkileri 15 Soru',
            lessonTag: 'Coğrafya',
            estimatedMinutes: 20,
            actionType: StudyTaskActionType.quiz,
          ),
          const StudyTask(
            id: 'auto_h_4',
            title: 'Türkiye Akarsuları & Gölleri Harita Alıştırması',
            lessonTag: 'Coğrafya',
            estimatedMinutes: 15,
            actionType: StudyTaskActionType.map,
          ),
        ];
      case 2:
        return [
          const StudyTask(
            id: 'auto_h_5',
            title: 'Temel Hukuk Kavramları & Hak Türleri 12 Soru',
            lessonTag: 'Vatandaşlık',
            estimatedMinutes: 20,
            actionType: StudyTaskActionType.quiz,
          ),
          const StudyTask(
            id: 'auto_h_6',
            title: 'Yanlış Defterindeki Soruları ve Çeldiricileri İncele',
            lessonTag: 'Genel',
            estimatedMinutes: 15,
            actionType: StudyTaskActionType.mistakes,
          ),
        ];
      case 3:
        return [
          const StudyTask(
            id: 'auto_h_7',
            title: 'İlk Türk Devletleri & Selçuklular 15 Soru Çöz',
            lessonTag: 'Tarih',
            estimatedMinutes: 20,
            actionType: StudyTaskActionType.quiz,
          ),
          const StudyTask(
            id: 'auto_h_8',
            title: 'Padişah & Islahat Kavram Eşleştirme Pratiği',
            lessonTag: 'Tarih',
            estimatedMinutes: 15,
            actionType: StudyTaskActionType.game,
          ),
        ];
      case 4:
      default:
        return [
          const StudyTask(
            id: 'auto_h_9',
            title: 'Uluslararası Kuruluşlar & Güncel Olaylar 12 Soru',
            lessonTag: 'Güncel Bilgiler',
            estimatedMinutes: 18,
            actionType: StudyTaskActionType.quiz,
          ),
          const StudyTask(
            id: 'auto_h_10',
            title: 'Genel Kültür Haftalık Mini Tarama Denemesi',
            lessonTag: 'Genel',
            estimatedMinutes: 20,
            actionType: StudyTaskActionType.exam,
          ),
        ];
    }
  }

  /// ⚡ Orta Tempo Görevleri (Günde 3 Görev, ~45 Soru, ~55 Dakika)
  static List<StudyTask> _generateMediumPaceTasks(
    String focusLesson,
    int cycleDay,
  ) {
    final dayMod = (cycleDay - 1) % 5;

    switch (dayMod) {
      case 0:
        return [
          StudyTask(
            id: 'auto_m_1',
            title: 'İslamiyet Öncesi Türk Tarihi 20 Soru Çöz',
            lessonTag: focusLesson == 'Tarih' ? 'Tarih' : focusLesson,
            estimatedMinutes: 25,
            actionType: StudyTaskActionType.quiz,
          ),
          const StudyTask(
            id: 'auto_m_2',
            title: 'Türkiye Coğrafi Konumu Hap Kart Tekrarı',
            lessonTag: 'Coğrafya',
            estimatedMinutes: 15,
            actionType: StudyTaskActionType.flashcards,
          ),
          const StudyTask(
            id: 'auto_m_3',
            title: 'Yanlış Defterindeki Soruları Temizle',
            lessonTag: 'Genel',
            estimatedMinutes: 15,
            actionType: StudyTaskActionType.mistakes,
          ),
        ];
      case 1:
        return [
          const StudyTask(
            id: 'auto_m_4',
            title: 'Türkiye Yer Şekilleri, Dağlar & Ovalar 18 Soru',
            lessonTag: 'Coğrafya',
            estimatedMinutes: 25,
            actionType: StudyTaskActionType.quiz,
          ),
          const StudyTask(
            id: 'auto_m_5',
            title: 'Türkiye Akarsu ve Gölleri Harita Alıştırması',
            lessonTag: 'Coğrafya',
            estimatedMinutes: 15,
            actionType: StudyTaskActionType.map,
          ),
          const StudyTask(
            id: 'auto_m_6',
            title: 'İlk Türk-İslam Devletleri Kavram Kartları',
            lessonTag: 'Tarih',
            estimatedMinutes: 15,
            actionType: StudyTaskActionType.flashcards,
          ),
        ];
      case 2:
        return [
          const StudyTask(
            id: 'auto_m_7',
            title: 'Osmanlı Kültür & Medeniyeti Divan-ı Hümayun 20 Soru',
            lessonTag: 'Tarih',
            estimatedMinutes: 25,
            actionType: StudyTaskActionType.quiz,
          ),
          const StudyTask(
            id: 'auto_m_8',
            title: 'Temel Hukuk Kavramları & Yaptırım Türleri 15 Soru',
            lessonTag: 'Vatandaşlık',
            estimatedMinutes: 20,
            actionType: StudyTaskActionType.quiz,
          ),
          const StudyTask(
            id: 'auto_m_9',
            title: 'Padişah & Islahat Kavram Eşleştirme Oyunu',
            lessonTag: 'Tarih',
            estimatedMinutes: 15,
            actionType: StudyTaskActionType.game,
          ),
        ];
      case 3:
        return [
          const StudyTask(
            id: 'auto_m_10',
            title: 'TBMM Yasama Dönemi & Kanunlaşma Süreci 15 Soru',
            lessonTag: 'Vatandaşlık',
            estimatedMinutes: 22,
            actionType: StudyTaskActionType.quiz,
          ),
          const StudyTask(
            id: 'auto_m_11',
            title: 'Uluslararası Kuruluşlar (BM, NATO, ŞİÖ) 12 Soru',
            lessonTag: 'Güncel Bilgiler',
            estimatedMinutes: 18,
            actionType: StudyTaskActionType.quiz,
          ),
          const StudyTask(
            id: 'auto_m_12',
            title: 'Haftalık Yanlış Defteri & Çeldirici Analizi',
            lessonTag: 'Genel',
            estimatedMinutes: 15,
            actionType: StudyTaskActionType.mistakes,
          ),
        ];
      case 4:
      default:
        return [
          const StudyTask(
            id: 'auto_m_13',
            title: 'Kurtuluş Savaşı Hazırlık & Muharebeler 20 Soru',
            lessonTag: 'Tarih',
            estimatedMinutes: 25,
            actionType: StudyTaskActionType.quiz,
          ),
          const StudyTask(
            id: 'auto_m_14',
            title: 'Türkiye İklimi & Yağış Rejimleri 15 Soru Çöz',
            lessonTag: 'Coğrafya',
            estimatedMinutes: 20,
            actionType: StudyTaskActionType.quiz,
          ),
          const StudyTask(
            id: 'auto_m_15',
            title: 'KPSS Genel Kültür 30 Soruluk Hızlı Karma Deneme',
            lessonTag: 'Genel',
            estimatedMinutes: 25,
            actionType: StudyTaskActionType.exam,
          ),
        ];
    }
  }

  /// 🔥 Hızlı / Yoğun Tempo Görevleri (Günde 4-5 Görev, ~85 Soru, ~90 Dakika)
  static List<StudyTask> _generateFastPaceTasks(
    String focusLesson,
    int cycleDay,
  ) {
    final dayMod = (cycleDay - 1) % 5;

    switch (dayMod) {
      case 0:
        return [
          StudyTask(
            id: 'auto_f_1',
            title: 'İslamiyet Öncesi & Selçuklu Tarihi 25 Soru Çöz',
            lessonTag: focusLesson == 'Tarih' ? 'Tarih' : focusLesson,
            estimatedMinutes: 30,
            actionType: StudyTaskActionType.quiz,
          ),
          const StudyTask(
            id: 'auto_f_2',
            title: 'Türkiye Coğrafi Konumu & Yer Şekilleri 20 Soru',
            lessonTag: 'Coğrafya',
            estimatedMinutes: 25,
            actionType: StudyTaskActionType.quiz,
          ),
          const StudyTask(
            id: 'auto_f_3',
            title: 'Türkiye Akarsuları & Platoları Harita Alıştırması',
            lessonTag: 'Coğrafya',
            estimatedMinutes: 15,
            actionType: StudyTaskActionType.map,
          ),
          const StudyTask(
            id: 'auto_f_4',
            title: 'Yanlış Defterindeki Tüm Soru Çeldiricilerini Temizle',
            lessonTag: 'Genel',
            estimatedMinutes: 15,
            actionType: StudyTaskActionType.mistakes,
          ),
          const StudyTask(
            id: 'auto_f_5',
            title: 'Genel Kültür Gün Sonu Hızlı Tarama Denemesi',
            lessonTag: 'Genel',
            estimatedMinutes: 25,
            actionType: StudyTaskActionType.exam,
          ),
        ];
      case 1:
      default:
        return [
          const StudyTask(
            id: 'auto_f_6',
            title: 'Osmanlı Siyasi Tarihi & Islahatlar 25 Soru Çöz',
            lessonTag: 'Tarih',
            estimatedMinutes: 30,
            actionType: StudyTaskActionType.quiz,
          ),
          const StudyTask(
            id: 'auto_f_7',
            title: 'Temel Hukuk & Anayasa Süreleri 20 Soru Çöz',
            lessonTag: 'Vatandaşlık',
            estimatedMinutes: 25,
            actionType: StudyTaskActionType.quiz,
          ),
          const StudyTask(
            id: 'auto_f_8',
            title: 'Madenler & Enerji Kaynakları Flashcards Tekrarı',
            lessonTag: 'Coğrafya',
            estimatedMinutes: 15,
            actionType: StudyTaskActionType.flashcards,
          ),
          const StudyTask(
            id: 'auto_f_9',
            title: 'Uluslararası Kuruluşlar & Güncel Olaylar 15 Soru',
            lessonTag: 'Güncel Bilgiler',
            estimatedMinutes: 20,
            actionType: StudyTaskActionType.quiz,
          ),
        ];
    }
  }
}
