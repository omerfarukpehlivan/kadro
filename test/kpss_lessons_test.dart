import 'package:flutter_test/flutter_test.dart';

import 'package:kadro/features/lessons/data/kpss_lessons.dart';

void main() {
  test('KPSS GY-GK dersleri toplam 120 soru', () {
    // fold: listeyi tek bir değere indirger (JS'teki reduce)
    final total = kpssLessons.fold<int>(
      0,
      (sum, lesson) => sum + lesson.questionCount,
    );
    expect(total, 120);
  });

  test('Genel Yetenek ve Genel Kültür 60\'ar soru', () {
    int countOf(String section) => kpssLessons
        .where((lesson) => lesson.section == section)
        .fold<int>(0, (sum, lesson) => sum + lesson.questionCount);

    expect(countOf('Genel Yetenek'), 60);
    expect(countOf('Genel Kültür'), 60);
  });
}
