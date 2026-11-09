import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/lessons/data/kpss_lessons.dart';
import 'package:kadro/features/quiz/data/models/question.dart';

void main() {
  group('TASK-85: Vatandaşlık Dersi 300 Soru & order_index Standardizasyon Testleri', () {
    test('sample_questions.json içinde 300 Vatandaşlık sorusu bulunmalı ve order_index sıralı olmalı', () async {
      final file = File('assets/data/questions/sample_questions.json');
      expect(file.existsSync(), isTrue);

      final content = await file.readAsString();
      final List<dynamic> jsonList = json.decode(content);

      final vatandaslikQuestions = jsonList
          .where((q) => q['lesson'] == 'Vatandaşlık')
          .map((q) => Question.fromJson(q as Map<String, dynamic>))
          .toList();

      expect(vatandaslikQuestions.length, equals(300));

      final topicsExpected = {
        'Temel Hukuk Kavramları': 50,
        '1982 Anayasası ve Temel İlkeler': 50,
        'Temel Hak ve Ödevler': 50,
        'Yasama, Yürütme ve Yargı': 50,
        'İdare Hukuku': 50,
        'Uluslararası Kuruluşlar': 50,
      };

      for (final entry in topicsExpected.entries) {
        final topicName = entry.key;
        final expectedCount = entry.value;

        final topicQuestions = vatandaslikQuestions
            .where((q) => q.topic == topicName)
            .toList();
        expect(
          topicQuestions.length,
          equals(expectedCount),
          reason: '$topicName için soru sayısı eşleşmedi',
        );

        // orderIndex 1..expectedCount (1..50) sıralı olduğunu doğrula
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

    test(
      'kpss_lessons defaultTopicTestCount Vatandaşlık konuları için 5 dönmeli',
      () {
        const topics = [
          'Temel Hukuk Kavramları',
          '1982 Anayasası ve Temel İlkeler',
          'Temel Hak ve Ödevler',
          'Yasama, Yürütme ve Yargı',
          'İdare Hukuku',
          'Uluslararası Kuruluşlar',
        ];

        for (final topic in topics) {
          expect(
            defaultTopicTestCount('Vatandaşlık', topic),
            equals(5),
            reason: '$topic için test sayısı 5 olmalıdır (5x10=50 soru)',
          );
        }
      },
    );

    test('00_tum_vatandaslik_sorulari_tek_dosya.sql master dosyası 300 insert ve order_index içermeli', () async {
      final sqlFile = File(
        'docs/soru_havuzu/vatandaslik/00_tum_vatandaslik_sorulari_tek_dosya.sql',
      );
      expect(sqlFile.existsSync(), isTrue);

      final content = await sqlFile.readAsString();
      final insertCount = RegExp(
        r'insert\s+into\s+public\.questions',
        caseSensitive: false,
      ).allMatches(content).length;

      expect(insertCount, equals(300));
      expect(content.contains('order_index'), isTrue);
    });

    test('Her bir 6 Vatandaşlık konusunun kendi SQL dosyası 50 insert ve order_index içermeli', () async {
      const individualFiles = [
        '01_temel_hukuk_kavramlari.sql',
        '02_1982_anayasasi_ve_temel_ilkeler.sql',
        '03_temel_hak_ve_odevler.sql',
        '04_yasama_yurutme_ve_yargi.sql',
        '05_idare_hukuku.sql',
        '06_uluslararasi_kuruluslar.sql',
      ];

      for (final filename in individualFiles) {
        final sqlFile = File('docs/soru_havuzu/vatandaslik/$filename');
        expect(sqlFile.existsSync(), isTrue, reason: '$filename bulunamadı');

        final content = await sqlFile.readAsString();
        final insertCount = RegExp(
          r'insert\s+into\s+public\.questions',
          caseSensitive: false,
        ).allMatches(content).length;

        expect(insertCount, equals(50), reason: '$filename 50 insert içermeli');
        expect(
          content.contains('order_index'),
          isTrue,
          reason: '$filename order_index içermeli',
        );
      }
    });
  });
}
