import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/flashcards/data/models/flashcard.dart';
import 'package:kadro/features/flashcards/presentation/flashcards_screen.dart';
import 'package:kadro/features/games/data/models/concept_match_set.dart';
import 'package:kadro/features/games/data/models/true_false_item.dart';
import 'package:kadro/features/games/presentation/concept_match_screen.dart';
import 'package:kadro/features/games/presentation/true_false_blitz_screen.dart';
import 'package:kadro/features/lessons/data/curriculum_registry.dart';
import 'package:kadro/features/map_practice/data/map_practice_repository.dart';
import 'package:kadro/features/map_practice/data/models/map_challenge.dart';
import 'package:kadro/features/map_practice/presentation/map_practice_hub_screen.dart';
import 'package:kadro/shared/widgets/workshop_scope_bridge_banner.dart';
import 'package:shared_preferences/shared_preferences.dart';

MapChallenge _buildChallenge({
  required String id,
  required MapPracticeCategory category,
  required String title,
  List<String> examScopes = const ['lisans_gk'],
  String? subBranch,
}) {
  return MapChallenge(
    id: id,
    category: category,
    interactionType: MapInteractionType.tapProvince,
    title: title,
    questionText: '$title için haritada ilgili ili bulun.',
    targetProvinceId: 'ankara',
    hint: 'İpucu',
    explanation: 'Açıklama',
    tag: 'Test',
    examScopes: examScopes,
    subBranch: subBranch,
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  const lisansGk = ExamSelection.initial;
  const lisansFullGyGk = ExamSelection(
    family: KpssExamFamily.bGrubu,
    educationLevel: EducationLevel.lisans,
    bGroupProfile: BGroupProfile.fullGyGk,
  );
  const dhbtLisans = ExamSelection(
    family: KpssExamFamily.dhbt,
    educationLevel: EducationLevel.lisans,
  );
  const ekpssLisans = ExamSelection(
    family: KpssExamFamily.ekpss,
    educationLevel: EducationLevel.lisans,
  );
  const mebAgsTarih = ExamSelection(
    family: KpssExamFamily.mebAgs,
    oabtBranch: OabtBranch.tarih,
  );
  const mebAgsCografya = ExamSelection(
    family: KpssExamFamily.mebAgs,
    oabtBranch: OabtBranch.cografya,
  );

  group('TASK-138 Atölye Modelleri & Scope Çözümleme', () {
    test('Flashcard, TrueFalseItem, ConceptMatchSet ve MapChallenge varsayılan ve alt branş eşleşmesini uygular', () {
      const gkCard = Flashcard(
        id: 'fc_gk',
        lesson: 'Tarih',
        topic: 'Kurtuluş Savaşı',
        frontText: 'Havza Genelgesi',
        backText: '1919',
      );
      const oabtCard = Flashcard(
        id: 'fc_oabt',
        lesson: 'ÖABT Tarih',
        topic: 'Tarih Metodolojisi',
        frontText: 'Tarih Metodu',
        backText: 'Tarama-Tasnif-Tahlil-Tenkit-Terkip',
        examScopes: ['meb_ags_oabt'],
        subBranch: 'tarih',
      );

      expect(gkCard.examScopes, ['lisans_gk']);
      expect(gkCard.matchesSelection(lisansGk), isTrue);
      expect(gkCard.matchesSelection(lisansFullGyGk), isTrue);
      expect(gkCard.matchesSelection(dhbtLisans), isFalse);

      expect(oabtCard.matchesSelection(mebAgsTarih), isTrue);
      expect(oabtCard.matchesSelection(mebAgsCografya), isFalse);

      const dhbtTf = TrueFalseItem(
        id: 'tf_dhbt',
        lesson: 'DHBT-1 Temel Din',
        topic: 'Fıkıh',
        statement: 'Kıyas İslam hukukunun asli kaynaklarındandır.',
        isTrue: true,
        explanation: 'Edille-i şeriyye dört temel delilden oluşur.',
        examScopes: ['dhbt_lisans'],
      );
      expect(dhbtTf.matchesSelection(dhbtLisans), isTrue);
      expect(dhbtTf.matchesSelection(lisansGk), isFalse);

      const scopedMatch = ConceptMatchSet(
        id: 'cm_dhbt',
        title: 'DHBT Terimler',
        lesson: 'DHBT-2 Lisans',
        pairs: [
          ConceptPair(id: 'p1', leftTerm: 'İcma', rightMatch: 'Fikir birliği'),
        ],
        examScopes: ['dhbt_common'],
      );
      expect(scopedMatch.matchesSelection(dhbtLisans), isTrue);
      expect(scopedMatch.matchesSelection(ekpssLisans), isFalse);

      expect(ExamSelection.parseExamScopes(['  DHBT_LISANS ', '']), [
        'dhbt_lisans',
      ]);
      expect(ExamSelection.parseExamScopes(null), ['lisans_gk']);

      final mapItem = _buildChallenge(
        id: 'map_1',
        category: MapPracticeCategory.history,
        title: 'Malazgirt Ovası',
        examScopes: ['meb_ags_oabt'],
        subBranch: 'tarih',
      );
      final roundTrip = MapChallenge.fromJson(mapItem.toJson());
      expect(roundTrip.examScopes, ['meb_ags_oabt']);
      expect(roundTrip.subBranch, 'tarih');
      expect(roundTrip.matchesSelection(mebAgsTarih), isTrue);
      expect(roundTrip.matchesSelection(mebAgsCografya), isFalse);

      final legacyJson = Map<String, dynamic>.from(mapItem.toJson())
        ..remove('examScopes')
        ..remove('exam_scopes')
        ..remove('subBranch')
        ..remove('sub_branch');
      final legacyParsed = MapChallenge.fromJson(legacyJson);
      expect(legacyParsed.examScopes, ['lisans_gk']);
      expect(legacyParsed.subBranch, isNull);
    });

    test('WorkshopScopeResolution ve LocalMapPracticeRepository scope izolasyonu ile GK köprüsünü yönetir', () async {
      final repo = LocalMapPracticeRepository(
        predefinedChallenges: [
          _buildChallenge(
            id: 'map_gk',
            category: MapPracticeCategory.history,
            title: 'GK Tarih İli',
          ),
          _buildChallenge(
            id: 'map_dhbt',
            category: MapPracticeCategory.history,
            title: 'DHBT Dini Merkez',
            examScopes: ['dhbt_lisans'],
          ),
        ],
      );

      expect(repo.hasDedicatedChallengesFor(lisansGk), isTrue);
      expect(repo.hasDedicatedChallengesFor(dhbtLisans), isTrue);
      expect(repo.hasDedicatedChallengesFor(ekpssLisans), isFalse);

      final dhbtHistory = await repo.getChallengesByCategory(
        MapPracticeCategory.history,
        selection: dhbtLisans,
      );
      expect(dhbtHistory.map((c) => c.id), ['map_dhbt']);

      final ekpssFallbackHistory = await repo.getChallengesByCategory(
        MapPracticeCategory.history,
        selection: ekpssLisans,
      );
      expect(ekpssFallbackHistory.map((c) => c.id), ['map_gk']);

      final dhbtMarathon = await repo.getDailyMarathonChallenges(
        selection: dhbtLisans,
      );
      expect(dhbtMarathon.map((c) => c.id), ['map_dhbt']);

      final resolution = WorkshopScopeResolution.resolve<Flashcard>(
        selection: ekpssLisans,
        allItems: const [
          Flashcard(
            id: 'fc1',
            lesson: 'Tarih',
            topic: 'İlk Çağ',
            frontText: 'Ön',
            backText: 'Arka',
          ),
        ],
        matchesSelection: (item, sel) => item.matchesSelection(sel),
        matchesGkBridge: (item) => item.examScopes.contains('lisans_gk'),
      );
      expect(resolution.isUsingGkFallback, isTrue);
      expect(resolution.items.length, 1);
    });
  });

  group('TASK-138 Atölye Ekranları Widget Testleri', () {
    testWidgets(
      'FlashcardsScreen özel kart yoksa GK köprü şeridi gösterir, özel kart varsa kapsamı izole eder',
      (tester) async {
        const mixedCards = [
          Flashcard(
            id: 'fc_gk_only',
            lesson: 'Tarih',
            topic: 'Osmanlı',
            frontText: 'GK Ön Yüz',
            backText: 'GK Arka Yüz',
          ),
          Flashcard(
            id: 'fc_dhbt_only',
            lesson: 'DHBT-1 Temel Din',
            topic: 'Tefsir',
            frontText: 'DHBT Özel Ön Yüz',
            backText: 'DHBT Özel Arka Yüz',
            examScopes: ['dhbt_lisans'],
          ),
        ];

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              activeExamSelectionProvider.overrideWithValue(ekpssLisans),
            ],
            child: const MaterialApp(
              home: FlashcardsScreen(
                flashcards: [
                  Flashcard(
                    id: 'fc_gk_bridge',
                    lesson: 'Tarih',
                    topic: 'Osmanlı',
                    frontText: 'Ortak Köprü Kartı',
                    backText: 'Cevap',
                  ),
                ],
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(
          find.byKey(const ValueKey('workshop_gk_fallback_banner')),
          findsOneWidget,
        );
        expect(
          find.textContaining(
            'ortak Genel Kültür / Tarih-Coğrafya atölyesiyle pratik yap',
          ),
          findsOneWidget,
        );
        expect(find.text('Ortak Köprü Kartı'), findsOneWidget);

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              activeExamSelectionProvider.overrideWithValue(dhbtLisans),
            ],
            child: const MaterialApp(
              home: FlashcardsScreen(flashcards: mixedCards),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(
          find.byKey(const ValueKey('workshop_gk_fallback_banner')),
          findsNothing,
        );
        expect(find.text('DHBT Özel Ön Yüz'), findsOneWidget);
        expect(find.text('GK Ön Yüz'), findsNothing);
      },
    );

    testWidgets(
      'TrueFalseBlitzScreen E-KPSS için GK köprü şeridi, DHBT için özel soru izolasyonu uygular',
      (tester) async {
        const mixedItems = [
          TrueFalseItem(
            id: 'tf_gk_only',
            lesson: 'Tarih',
            topic: 'İnkılap',
            statement: 'GK Yalnız Doğru Yanlış',
            isTrue: true,
            explanation: 'GK Açıklama',
          ),
          TrueFalseItem(
            id: 'tf_dhbt_only',
            lesson: 'DHBT-1 Temel Din',
            topic: 'Kelam',
            statement: 'DHBT Özel İfade',
            isTrue: true,
            explanation: 'DHBT Açıklama',
            examScopes: ['dhbt_lisans'],
          ),
        ];

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              activeExamSelectionProvider.overrideWithValue(ekpssLisans),
            ],
            child: const MaterialApp(
              home: TrueFalseBlitzScreen(
                items: [
                  TrueFalseItem(
                    id: 'tf_gk_only',
                    lesson: 'Tarih',
                    topic: 'İnkılap',
                    statement: 'GK Köprü İfadesi',
                    isTrue: true,
                    explanation: 'Açıklama',
                  ),
                ],
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(
          find.byKey(const ValueKey('workshop_gk_fallback_banner')),
          findsOneWidget,
        );
        expect(find.text('GK Köprü İfadesi'), findsOneWidget);

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              activeExamSelectionProvider.overrideWithValue(dhbtLisans),
            ],
            child: const MaterialApp(
              home: TrueFalseBlitzScreen(items: mixedItems),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(
          find.byKey(const ValueKey('workshop_gk_fallback_banner')),
          findsNothing,
        );
        expect(find.text('DHBT Özel İfade'), findsOneWidget);
        expect(find.text('GK Yalnız Doğru Yanlış'), findsNothing);
      },
    );

    testWidgets(
      'ConceptMatchScreen scope fallback banner ve özel eşleşme seti izolasyonunu gösterir',
      (tester) async {
        const mixedSets = [
          ConceptMatchSet(
            id: 'set_gk',
            title: 'GK Eşleşme',
            lesson: 'Tarih',
            pairs: [
              ConceptPair(
                id: 'p1',
                leftTerm: 'GK Terim',
                rightMatch: 'GK Karşılık',
              ),
            ],
          ),
          ConceptMatchSet(
            id: 'set_dhbt',
            title: 'DHBT Özel Eşleşme',
            lesson: 'DHBT-1 Temel Din',
            pairs: [
              ConceptPair(
                id: 'p2',
                leftTerm: 'DHBT Terim',
                rightMatch: 'DHBT Karşılık',
              ),
            ],
            examScopes: ['dhbt_lisans'],
          ),
        ];

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              activeExamSelectionProvider.overrideWithValue(mebAgsTarih),
            ],
            child: const MaterialApp(
              home: ConceptMatchScreen(
                sets: [
                  ConceptMatchSet(
                    id: 'set_gk',
                    title: 'GK Köprü Eşleşme',
                    lesson: 'Tarih',
                    pairs: [
                      ConceptPair(
                        id: 'p1',
                        leftTerm: 'Köprü Terim',
                        rightMatch: 'Köprü Karşılık',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(
          find.byKey(const ValueKey('workshop_gk_fallback_banner')),
          findsOneWidget,
        );
        expect(find.text('GK Köprü Eşleşme'), findsOneWidget);

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              activeExamSelectionProvider.overrideWithValue(dhbtLisans),
            ],
            child: const MaterialApp(home: ConceptMatchScreen(sets: mixedSets)),
          ),
        );
        await tester.pumpAndSettle();

        expect(
          find.byKey(const ValueKey('workshop_gk_fallback_banner')),
          findsNothing,
        );
        expect(find.text('DHBT Özel Eşleşme'), findsOneWidget);
        expect(find.text('GK Eşleşme'), findsNothing);
      },
    );

    testWidgets(
      'MapPracticeHubScreen özel harita havuzu olmadığında GK köprü şeridi gösterir, olduğunda gizler',
      (tester) async {
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              activeExamSelectionProvider.overrideWithValue(dhbtLisans),
            ],
            child: const MaterialApp(home: MapPracticeHubScreen()),
          ),
        );
        await tester.pumpAndSettle();

        expect(
          find.byKey(const ValueKey('workshop_gk_fallback_banner')),
          findsOneWidget,
        );

        final customRepo = LocalMapPracticeRepository(
          predefinedChallenges: [
            _buildChallenge(
              id: 'map_dhbt_dedicated',
              category: MapPracticeCategory.history,
              title: 'DHBT Harita',
              examScopes: ['dhbt_lisans'],
            ),
          ],
        );

        await tester.pumpWidget(
          ProviderScope(
            key: UniqueKey(),
            overrides: [
              activeExamSelectionProvider.overrideWithValue(dhbtLisans),
              mapPracticeRepositoryProvider.overrideWithValue(customRepo),
            ],
            child: const MaterialApp(home: MapPracticeHubScreen()),
          ),
        );
        await tester.pumpAndSettle();

        expect(
          find.byKey(const ValueKey('workshop_gk_fallback_banner')),
          findsNothing,
        );
      },
    );
  });
}
