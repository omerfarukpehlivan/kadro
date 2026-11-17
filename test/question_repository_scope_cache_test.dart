import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/mistakes/data/mistake_repository.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/data/question_repository.dart';
import 'package:kadro/features/stats/data/cloud_sync_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakeCloudSyncRepository extends CloudSyncRepository {
  final List<Map<String, dynamic>> unresolvedLogs;

  const _FakeCloudSyncRepository(this.unresolvedLogs);

  @override
  Future<List<Map<String, dynamic>>> fetchUnresolvedMistakes() async =>
      unresolvedLogs;
}

class _SpyQuestionRepository extends QuestionRepository {
  bool fetchQuestionsCalled = false;
  bool fetchQuestionsByIdsCalled = false;
  final List<List<String>> recordedCloudBatches = [];
  final Map<String, Question> cloudQuestionsById;

  _SpyQuestionRepository({
    this.cloudQuestionsById = const {},
    super.assetLoader,
  });

  @override
  Future<List<Question>> fetchQuestions({
    String? lesson,
    String? topic,
    ExamSelection? selection,
    String? difficulty,
    String? preferredSourceVariant,
    bool strictTopicFilter = false,
    bool forceRefresh = false,
    int limit = 60,
  }) async {
    fetchQuestionsCalled = true;
    throw StateError(
      'MistakeRepository.hydrateFromCloud() tam havuz fetchQuestions() cagirmamali',
    );
  }

  @override
  Future<List<Question>> fetchQuestionBatchFromCloud(
    List<String> batchIds,
  ) async {
    recordedCloudBatches.add(List<String>.from(batchIds));
    return [
      for (final id in batchIds)
        if (cloudQuestionsById.containsKey(id)) cloudQuestionsById[id]!,
    ];
  }

  @override
  Future<List<Question>> fetchQuestionsByIds(List<String> ids) async {
    fetchQuestionsByIdsCalled = true;
    return super.fetchQuestionsByIds(ids);
  }
}

Map<String, dynamic> _rawQuestionJson({
  required String id,
  required String lesson,
  required String topic,
  required String text,
  String difficulty = 'medium',
  List<String> examScopes = const ['lisans_gk'],
  String? subBranch,
  String? educationLevel,
  String? disabilityVariant,
  String? sourceVariant,
}) {
  return {
    'id': id,
    'lesson': lesson,
    'topic': topic,
    'text': text,
    'options': const ['A', 'B', 'C', 'D', 'E'],
    'correctIndex': 0,
    'explanation': 'Açıklama metni',
    'difficulty': difficulty,
    'distractor_trap': null,
    'exam_scopes': examScopes,
    'sub_branch': ?subBranch,
    'education_level': ?educationLevel,
    'disability_variant': ?disabilityVariant,
    'source_variant': ?sourceVariant,
  };
}

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    QuestionRepository.clearCacheForTest();
  });

  group('TASK-129: Question Kapsam & Varyant Eşleştirme', () {
    test('fromJson ve fromSupabase varsayılan/çoklu kapsam alanlarını doğru ayrıştırır', () {
      final legacy = Question.fromJson({
        'id': 'legacy_1',
        'lesson': 'Tarih',
        'topic': 'İlk Türk Devletleri',
        'text': 'Eski format soru',
        'options': ['A', 'B', 'C', 'D', 'E'],
        'correctIndex': 0,
        'explanation': 'Açıklama',
      });
      expect(legacy.examScopes, equals(const ['lisans_gk']));
      expect(legacy.subBranch, isNull);
      expect(legacy.educationLevel, isNull);
      expect(legacy.disabilityVariant, isNull);
      expect(legacy.sourceVariant, isNull);

      final supa = Question.fromSupabase({
        'id': 'ekpss_1',
        'lesson': 'Tarih',
        'topic': 'Türk Kültür ve Medeniyetleri',
        'prompt_text': 'Sadeleştirilmiş E-KPSS soru metni',
        'interaction_data': {
          'options': ['A', 'B', 'C', 'D'],
          'correctIndex': 1,
        },
        'explanation': 'Açıklama',
        'exam_scopes': ['ekpss_lisans'],
        'education_level': 'lisans',
        'disability_variant': 'isitme1',
        'source_variant': 'simplified',
      });
      expect(supa.examScopes, equals(const ['ekpss_lisans']));
      expect(supa.educationLevel, equals('lisans'));
      expect(supa.disabilityVariant, equals('isitme1'));
      expect(supa.sourceVariant, equals('simplified'));
      expect(supa.toJson()['disability_variant'], equals('isitme1'));
      expect(supa.toJson()['source_variant'], equals('simplified'));
    });

    test('matchesSelection kapsam, alt branş, engel grubu ve metin varyantını izole eder', () {
      const lisansGk = ExamSelection(
        family: KpssExamFamily.bGrubu,
        educationLevel: EducationLevel.lisans,
        bGroupProfile: BGroupProfile.onlyGk,
      );
      const lisansGyGk = ExamSelection(
        family: KpssExamFamily.bGrubu,
        educationLevel: EducationLevel.lisans,
        bGroupProfile: BGroupProfile.fullGyGk,
      );
      const dhbtLisans = ExamSelection(
        family: KpssExamFamily.dhbt,
        educationLevel: EducationLevel.lisans,
      );
      const ekpssIsitme = ExamSelection(
        family: KpssExamFamily.ekpss,
        educationLevel: EducationLevel.lisans,
        disabilityGroup: DisabilityGroup.isitme1,
      );
      const mebAgsTarih = ExamSelection(
        family: KpssExamFamily.mebAgs,
        oabtBranch: OabtBranch.tarih,
      );

      const gkQuestion = Question(
        id: 'q_gk',
        lesson: 'Tarih',
        topic: 'İlk Türk Devletleri',
        text: 'GK sorusu',
        options: ['A', 'B', 'C', 'D', 'E'],
        correctIndex: 0,
        explanation: 'Açıklama',
        examScopes: ['lisans_gk'],
      );
      expect(gkQuestion.matchesSelection(lisansGk), isTrue);
      expect(gkQuestion.matchesSelection(lisansGyGk), isTrue);
      expect(gkQuestion.matchesSelection(dhbtLisans), isFalse);
      expect(gkQuestion.matchesSelection(ekpssIsitme), isFalse);

      const isitmeSimplified = Question(
        id: 'q_ekpss',
        lesson: 'Vatandaşlık',
        topic: 'Engelli Hakları Mevzuatı',
        text: 'Sadeleştirilmiş soru',
        options: ['A', 'B', 'C', 'D', 'E'],
        correctIndex: 0,
        explanation: 'Açıklama',
        examScopes: ['ekpss_lisans'],
        educationLevel: 'lisans',
        disabilityVariant: 'isitme1',
        sourceVariant: 'simplified',
      );
      expect(isitmeSimplified.matchesSelection(ekpssIsitme), isTrue);
      expect(
        isitmeSimplified.matchesSelection(
          ekpssIsitme,
          preferredSourceVariant: 'standard',
        ),
        isFalse,
      );
      expect(isitmeSimplified.matchesSelection(lisansGk), isFalse);

      const oabtFizikQuestion = Question(
        id: 'q_fizik',
        lesson: 'ÖABT Fizik',
        topic: 'Mekanik',
        text: 'Fizik sorusu',
        options: ['A', 'B', 'C', 'D', 'E'],
        correctIndex: 0,
        explanation: 'Açıklama',
        examScopes: ['meb_ags_oabt_fizik', 'meb_ags_oabt_tarih'],
        subBranch: 'oabt_fizik',
      );
      expect(oabtFizikQuestion.matchesSelection(mebAgsTarih), isFalse);
    });
  });

  group('TASK-129: Modular Scope Asset, Isolate Parse & LRU Önbellek', () {
    test('Scope asset varsa (assets/data/scopes/<ns>.json) öncelikli yüklenir ve >50KB payload Isolate fallback ile sorunsuz parse edilir', () async {
      final loadedPaths = <String>[];
      // >50KB JSON payload oluştur
      final largePayload = List.generate(
        220,
        (i) => _rawQuestionJson(
          id: 'dhbt_q_$i',
          lesson: 'DHBT-1 Temel Din Bilgisi',
          topic: 'Fıkıh ve İlmihal',
          text:
              'DHBT uzun test metni #$i: ${'Kur\'an ve sünnet ışığında fıkıh hükümleri değerlendirilmektedir. ' * 3}',
          examScopes: const ['dhbt_lisans'],
          subBranch: 'dhbt_lisans',
          educationLevel: 'lisans',
        ),
      );
      final encodedLarge = jsonEncode(largePayload);
      expect(
        encodedLarge.length,
        greaterThan(QuestionRepository.isolateParseThresholdBytes),
      );

      final repo = QuestionRepository(
        forceIsolateParsing: true,
        assetLoader: (path) async {
          loadedPaths.add(path);
          if (path == 'assets/data/scopes/dhbt_lisans.json') {
            return encodedLarge;
          }
          throw StateError('Missing asset: $path');
        },
      );

      const dhbtSelection = ExamSelection(
        family: KpssExamFamily.dhbt,
        educationLevel: EducationLevel.lisans,
      );
      final questions = await repo.fetchQuestions(
        lesson: 'DHBT-1 Temel Din Bilgisi',
        selection: dhbtSelection,
      );

      expect(loadedPaths, contains('assets/data/scopes/dhbt_lisans.json'));
      expect(questions.length, equals(220));
      expect(questions.first.id, equals('dhbt_q_0'));

      // Kapsam asset'i bulunmayan E-KPSS isteği Lisans GK Tarih sorularını sızdırmamalı
      final leakingAttempt = await repo.fetchQuestions(
        lesson: 'Tarih',
        selection: const ExamSelection(family: KpssExamFamily.ekpss),
      );
      expect(leakingAttempt, isEmpty);
    });

    test('Bounded LRU önbellek maxQuestionCacheEntries (24) sınırını aşmaz ve parametreleri izole eder', () async {
      final repo = QuestionRepository(
        assetLoader: (path) async => jsonEncode([
          _rawQuestionJson(
            id: 'q_easy',
            lesson: 'Tarih',
            topic: 'Konu 1',
            text: 'Kolay soru',
            difficulty: 'easy',
            examScopes: const ['lisans_gk'],
          ),
          _rawQuestionJson(
            id: 'q_hard',
            lesson: 'Tarih',
            topic: 'Konu 1',
            text: 'Zor soru',
            difficulty: 'hard',
            examScopes: const ['lisans_gk'],
          ),
        ]),
      );

      final easyOnly = await repo.fetchQuestions(
        lesson: 'Tarih',
        difficulty: 'easy',
        selection: ExamSelection.initial,
      );
      final hardOnly = await repo.fetchQuestions(
        lesson: 'Tarih',
        difficulty: 'hard',
        selection: ExamSelection.initial,
      );

      expect(easyOnly.map((q) => q.id), equals(['q_easy']));
      expect(hardOnly.map((q) => q.id), equals(['q_hard']));

      for (var i = 0; i < 30; i++) {
        await repo.fetchQuestions(
          lesson: 'Tarih',
          topic: 'Konu 1',
          selection: ExamSelection.initial,
          limit: 10 + i,
        );
      }

      expect(
        QuestionRepository.questionCacheEntryCountForTest,
        lessThanOrEqualTo(QuestionRepository.maxQuestionCacheEntries),
      );
    });

    test('TopicCountQueryKey eşitliği ve lessonTopicTestCountsProvider kapsam izolasyonu', () async {
      const keyA1 = TopicCountQueryKey(
        scopeKey: 'lisans_gk',
        lessonName: 'Tarih',
      );
      const keyA2 = TopicCountQueryKey(
        scopeKey: 'lisans_gk',
        lessonName: 'Tarih',
      );
      const keyB = TopicCountQueryKey(
        scopeKey: 'ekpss_lisans',
        lessonName: 'Tarih',
      );

      expect(keyA1, equals(keyA2));
      expect(keyA1.hashCode, equals(keyA2.hashCode));
      expect(keyA1, isNot(equals(keyB)));

      final scopedRepo = QuestionRepository(
        assetLoader: (path) async {
          if (path == 'assets/data/scopes/lisans_gk.json') {
            return jsonEncode([
              for (var i = 0; i < 15; i++)
                _rawQuestionJson(
                  id: 'l_$i',
                  lesson: 'Tarih',
                  topic: 'Osmanlı',
                  text: 'Lisans $i',
                  examScopes: const ['lisans_gk'],
                ),
            ]);
          }
          if (path == 'assets/data/scopes/ekpss_lisans.json') {
            return jsonEncode([
              for (var i = 0; i < 5; i++)
                _rawQuestionJson(
                  id: 'e_$i',
                  lesson: 'Tarih',
                  topic: 'Osmanlı',
                  text: 'EKPSS $i',
                  examScopes: const ['ekpss_lisans'],
                ),
            ]);
          }
          throw StateError('Asset not found: $path');
        },
      );

      final container = ProviderContainer(
        overrides: [questionRepositoryProvider.overrideWithValue(scopedRepo)],
      );
      addTearDown(container.dispose);

      final lisansCounts = await container.read(
        lessonTopicTestCountsProvider(keyA1).future,
      );
      final ekpssCounts = await container.read(
        lessonTopicTestCountsProvider(keyB).future,
      );

      expect(lisansCounts['Osmanlı'], equals(2));
      expect(ekpssCounts['Osmanlı'], equals(1));
    });
  });

  group(
    'TASK-129: fetchQuestionsByIds Chunking & MistakeRepository Hydration',
    () {
      test('MistakeRepository.hydrateFromCloud() tam havuz fetchQuestions() yerine chunked fetchQuestionsByIds + yerel text fallback kullanır', () async {
        const repo = MistakeRepository();
        repo.clearForTest();

        final cloudMap = <String, Question>{
          for (var i = 0; i < 65; i++)
            'cloud_id_$i': Question(
              id: 'cloud_id_$i',
              lesson: 'Tarih',
              topic: 'Deneme Konusu',
              text: 'Bulut hata sorusu #$i',
              options: const ['A', 'B', 'C', 'D', 'E'],
              correctIndex: 0,
              explanation: 'Açıklama',
            ),
        };

        final logs = <Map<String, dynamic>>[
          for (var i = 0; i < 65; i++)
            {
              'question_id': 'cloud_id_$i',
              'question_text': 'Bulut hata sorusu #$i',
            },
          // Tekrarlanan ID -> deduplicate edilmeli
          {
            'question_id': 'cloud_id_0',
            'question_text': 'Bulut hata sorusu #0',
          },
          // ID'si olmayan eski kayıt -> yalnızca yerel JSON'da text eşleşmesiyle bulunmalı
          {
            'question_id': null,
            'question_text': 'Yerel fallback ile bulunan soru',
          },
        ];

        final spyRepo = _SpyQuestionRepository(
          cloudQuestionsById: cloudMap,
          assetLoader: (path) async => jsonEncode([
            _rawQuestionJson(
              id: 'local_text_match_1',
              lesson: 'Coğrafya',
              topic: 'İklim',
              text: 'Yerel fallback ile bulunan soru',
            ),
          ]),
        );

        await repo.hydrateFromCloud(spyRepo, _FakeCloudSyncRepository(logs));

        expect(spyRepo.fetchQuestionsCalled, isFalse);
        expect(spyRepo.fetchQuestionsByIdsCalled, isTrue);

        // 65 tekil ID -> [50, 15] olmak üzere 2 chunk
        expect(spyRepo.recordedCloudBatches.length, equals(2));
        expect(spyRepo.recordedCloudBatches[0].length, equals(50));
        expect(spyRepo.recordedCloudBatches[1].length, equals(15));

        final mistakes = repo.getMistakes();
        expect(mistakes.length, equals(66));
        expect(mistakes.any((q) => q.id == 'local_text_match_1'), isTrue);
      });
    },
  );
}
