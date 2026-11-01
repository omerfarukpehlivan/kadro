import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/lessons/data/kpss_lessons.dart';

void main() {
  test('KPSS Genel Kültür dersleri toplam 60 soru olmalı', () {
    // fold: listeyi tek bir değere indirger (JS'teki reduce)
    final total = kpssLessons.fold<int>(
      0,
      (sum, lesson) => sum + lesson.questionCount,
    );
    expect(total, 60);
  });

  test('Toplam 4 Genel Kültür dersi bulunmalı ve tamamı Genel Kültür bölümünde olmalı', () {
    expect(kpssLessons.length, 4);
    for (final lesson in kpssLessons) {
      expect(lesson.section, 'Genel Kültür');
    }
  });
}
