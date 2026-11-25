import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/lessons/data/kpss_lessons.dart';
import 'package:kadro/features/quiz/data/models/question.dart';

void main() {
  group('TASK-84: Tarih Dersi 620 Soru & order_index Standardizasyon Testleri', () {
    test('sample_questions.json içinde 620 Tarih sorusu bulunmalı ve order_index sıralı olmalı', () async {
      final file = File('assets/data/questions/sample_questions.json');
      expect(file.existsSync(), isTrue);

      final content = await file.readAsString();
      final List<dynamic> jsonList = json.decode(content);

      final tarihQuestions = jsonList
          .where((q) => q['lesson'] == 'Tarih')
          .map((q) => Question.fromJson(q as Map<String, dynamic>))
          .toList();

      expect(tarihQuestions.length, equals(620));

      final topicsExpected = {
        'İslamiyet Öncesi Türk Tarihi': 80,
        'İlk Türk-İslam Devletleri': 80,
        'Osmanlı Kültür ve Uygarlığı': 120,
        'Osmanlı Dağılma Dönemi': 100,
        'Kurtuluş Savaşı Hazırlık ve Cepheler': 80,
        'Atatürk İlke ve İnkılapları': 80,
        'Çağdaş Türk ve Dünya Tarihi': 80,
      };

      for (final entry in topicsExpected.entries) {
        final topicName = entry.key;
        final expectedCount = entry.value;

        final topicQuestions = tarihQuestions
            .where((q) => q.topic == topicName)
            .toList();
        expect(
          topicQuestions.length,
          equals(expectedCount),
          reason: '$topicName için soru sayısı eşleşmedi',
        );

        // orderIndex 1..expectedCount sıralı olduğunu doğrula
        for (var i = 0; i < topicQuestions.length; i++) {
          final q = topicQuestions[i];
          expect(
            q.orderIndex,
            equals(i + 1),
            reason: '${q.id} order_index beklenen ${i + 1} değil',
          );
          expect(q.options.length, equals(5));
          expect(q.correctIndex, inInclusiveRange(0, 4));
          expect(q.text.trim(), isNotEmpty);
          expect(q.explanation.trim(), isNotEmpty);
          expect(q.distractorTrap?.trim(), isNotEmpty);
        }
      }
    });

    test('kpss_lessons defaultTopicTestCount Tarih konuları için güncel Supabase test sayılarını (71 test) dönmeli', () {
      expect(
        defaultTopicTestCount('Tarih', 'İslamiyet Öncesi Türk Tarihi'),
        equals(9),
      );
      expect(
        defaultTopicTestCount('Tarih', 'İlk Türk-İslam Devletleri'),
        equals(9),
      );
      expect(
        defaultTopicTestCount('Tarih', 'Osmanlı Kültür ve Uygarlığı'),
        equals(13),
      );
      expect(
        defaultTopicTestCount('Tarih', 'Osmanlı Dağılma Dönemi'),
        equals(10),
      );
      expect(
        defaultTopicTestCount('Tarih', 'Kurtuluş Savaşı Hazırlık ve Cepheler'),
        equals(9),
      );
      expect(
        defaultTopicTestCount('Tarih', 'Atatürk İlke ve İnkılapları'),
        equals(9),
      );
      expect(
        defaultTopicTestCount('Tarih', 'Çağdaş Türk ve Dünya Tarihi'),
        equals(12),
      );
    });

    test(
      '00_tum_tarih_sorulari_tek_dosya.sql master dosyası 620 insert içermeli',
      () async {
        final sqlFile = File(
          'docs/soru_havuzu/tarih/00_tum_tarih_sorulari_tek_dosya.sql',
        );
        expect(sqlFile.existsSync(), isTrue);

        final content = await sqlFile.readAsString();
        final insertCount = RegExp(
          r'insert\s+into\s+public\.questions',
          caseSensitive: false,
        ).allMatches(content).length;

        expect(insertCount, equals(620));
        expect(content.contains('order_index'), isTrue);
      },
    );
  });
}
