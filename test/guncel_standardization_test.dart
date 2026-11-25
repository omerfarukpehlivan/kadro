import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/lessons/data/kpss_lessons.dart';
import 'package:kadro/features/quiz/data/models/question.dart';

void main() {
  group('TASK-86: Güncel Bilgiler Dersi 240 Soru & order_index Standardizasyon Testleri', () {
    test('sample_questions.json içinde 240 Güncel Bilgiler sorusu bulunmalı ve order_index sıralı olmalı', () async {
      final file = File('assets/data/questions/sample_questions.json');
      expect(file.existsSync(), isTrue);

      final content = await file.readAsString();
      final List<dynamic> jsonList = json.decode(content);

      final guncelQuestions = jsonList
          .where((q) => q['lesson'] == 'Güncel Bilgiler')
          .map((q) => Question.fromJson(q as Map<String, dynamic>))
          .toList();

      expect(guncelQuestions.length, equals(240));

      final topicsExpected = {
        'Türkiye ve Dünya Gündemi': 40,
        'Kültür, Sanat ve Edebiyat': 40,
        'Bilim ve Teknoloji Gelişmeleri': 40,
        'Spor ve Olimpiyatlar': 40,
        'UNESCO Miras Listesi': 40,
        'Önemli Günler ve Zirveler': 40,
      };

      for (final entry in topicsExpected.entries) {
        final topicName = entry.key;
        final expectedCount = entry.value;

        final topicQuestions = guncelQuestions
            .where((q) => q.topic == topicName)
            .toList();
        expect(
          topicQuestions.length,
          equals(expectedCount),
          reason: '$topicName için soru sayısı eşleşmedi',
        );

        // orderIndex 1..expectedCount (1..40) sıralı olduğunu doğrula
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

    test('kpss_lessons defaultTopicTestCount Güncel Bilgiler konuları için 8 dönmeli', () {
      const topics = [
        'Türkiye ve Dünya Gündemi',
        'Kültür, Sanat ve Edebiyat',
        'Bilim ve Teknoloji Gelişmeleri',
        'Spor ve Olimpiyatlar',
        'UNESCO Miras Listesi',
        'Önemli Günler ve Zirveler',
      ];

      for (final topic in topics) {
        expect(
          defaultTopicTestCount('Güncel Bilgiler', topic),
          equals(8),
          reason: '$topic için test sayısı 8 olmalıdır (8x10=80 soru)',
        );
      }
    });

    test('00_tum_guncel_bilgiler_sorulari_tek_dosya.sql master dosyası 240 insert ve order_index içermeli', () async {
      final sqlFile = File(
        'docs/soru_havuzu/guncel/00_tum_guncel_bilgiler_sorulari_tek_dosya.sql',
      );
      expect(sqlFile.existsSync(), isTrue);

      final content = await sqlFile.readAsString();
      final insertCount = RegExp(
        r'insert\s+into\s+public\.questions',
        caseSensitive: false,
      ).allMatches(content).length;

      expect(insertCount, equals(240));
      expect(content.contains('order_index'), isTrue);
    });

    test('Her bir 6 Güncel Bilgiler konusunun kendi SQL dosyası 40 insert ve order_index içermeli', () async {
      const individualFiles = [
        '01_turkiye_ve_dunya_gundemi.sql',
        '02_kultur_sanat_ve_edebiyat.sql',
        '03_bilim_ve_teknoloji_gelismeleri.sql',
        '04_spor_ve_olimpiyatlar.sql',
        '05_unesco_miras_listesi.sql',
        '06_onemli_gunler_ve_zirveler.sql',
      ];

      for (final filename in individualFiles) {
        final sqlFile = File('docs/soru_havuzu/guncel/$filename');
        expect(sqlFile.existsSync(), isTrue, reason: '$filename bulunamadı');

        final content = await sqlFile.readAsString();
        final insertCount = RegExp(
          r'insert\s+into\s+public\.questions',
          caseSensitive: false,
        ).allMatches(content).length;

        expect(insertCount, equals(40), reason: '$filename 40 insert içermeli');
        expect(
          content.contains('order_index'),
          isTrue,
          reason: '$filename order_index içermeli',
        );
      }
    });
  });
}
