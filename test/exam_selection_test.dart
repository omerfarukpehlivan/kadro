import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/core/config/app_config_service.dart';
import 'package:kadro/core/config/app_remote_config.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/home/presentation/home_screen.dart';
import 'package:kadro/core/utils/exam_calendar_utils.dart';

void main() {
  group('TASK-126: ExamSelection & Çoklu KPSS Domain Modeli Testleri', () {
    test(
      'Resmî 17 ÖABT branşı süre (70/90 dk) ve 30+20 ayrımı kurallarına uymalı',
      () {
        final officialBranches = OabtBranch.officialOabtBranches;
        expect(officialBranches.length, 17);
        expect(officialBranches, isNot(contains(OabtBranch.none)));
        expect(officialBranches, isNot(contains(OabtBranch.ydsDil)));

        final ninetyMinBranches = officialBranches
            .where((b) => b.durationMinutes == 90)
            .toList();
        expect(ninetyMinBranches.length, 5);
        expect(
          ninetyMinBranches,
          containsAll([
            OabtBranch.ilkogretimMatematik,
            OabtBranch.matematikLise,
            OabtBranch.fenBilimleri,
            OabtBranch.fizik,
            OabtBranch.kimya,
          ]),
        );

        final seventyMinBranches = officialBranches
            .where((b) => b.durationMinutes == 70)
            .toList();
        expect(seventyMinBranches.length, 12);

        final splitBranches = officialBranches
            .where((b) => b.hasFieldEducationSplit)
            .toList();
        expect(
          splitBranches,
          unorderedEquals([
            OabtBranch.sinifOgretmenligi,
            OabtBranch.okulOncesi,
            OabtBranch.ozelEgitim,
          ]),
        );
      },
    );

    test('scopeKey ve curriculumNamespace tüm sınav aileleri için kanonik üretilmeli', () {
      const lisansGk = ExamSelection();
      expect(lisansGk.scopeKey, 'lisans_gk');
      expect(lisansGk.curriculumNamespace, 'lisans_gk');

      const lisansGyGk = ExamSelection(
        family: KpssExamFamily.bGrubu,
        educationLevel: EducationLevel.lisans,
        bGroupProfile: BGroupProfile.fullGyGk,
      );
      expect(lisansGyGk.scopeKey, 'lisans_gygk');

      const onlisansGyGk = ExamSelection(
        family: KpssExamFamily.bGrubu,
        educationLevel: EducationLevel.onlisans,
        bGroupProfile: BGroupProfile.fullGyGk,
        examCycleYear: 2028,
      );
      expect(onlisansGyGk.scopeKey, 'onlisans_gygk');

      const ortaogretimGyGk = ExamSelection(
        family: KpssExamFamily.bGrubu,
        educationLevel: EducationLevel.ortaogretim,
        bGroupProfile: BGroupProfile.fullGyGk,
        examCycleYear: 2028,
      );
      expect(ortaogretimGyGk.scopeKey, 'ortaogretim_gygk');

      const ekpssLisans = ExamSelection(
        family: KpssExamFamily.ekpss,
        educationLevel: EducationLevel.lisans,
        disabilityGroup: DisabilityGroup.isitme1,
        examCycleYear: 2028,
      );
      expect(ekpssLisans.scopeKey, 'ekpss_lisans');

      const dhbtOnlisans = ExamSelection(
        family: KpssExamFamily.dhbt,
        educationLevel: EducationLevel.onlisans,
        examCycleYear: 2028,
      );
      expect(dhbtOnlisans.scopeKey, 'dhbt_onlisans');

      const mebAgsTarih = ExamSelection(
        family: KpssExamFamily.mebAgs,
        oabtBranch: OabtBranch.tarih,
        examCycleYear: 2027,
      );
      expect(mebAgsTarih.scopeKey, 'meb_ags_oabt_tarih');

      const mebAgsOnly = ExamSelection(family: KpssExamFamily.mebAgs);
      expect(mebAgsOnly.scopeKey, 'meb_ags');

      const mebAgsYds = ExamSelection(
        family: KpssExamFamily.mebAgs,
        oabtBranch: OabtBranch.ydsDil,
      );
      expect(mebAgsYds.scopeKey, 'meb_ags_yds');

      const aGrubuP48 = ExamSelection(
        family: KpssExamFamily.aGrubu,
        selectedFieldLessons: ExamSelection.defaultAGroupP48Lessons,
      );
      expect(aGrubuP48.scopeKey, 'a_grubu_p48');

      const aGrubuCustom = ExamSelection(
        family: KpssExamFamily.aGrubu,
        selectedFieldLessons: ['Alan İşletme', 'Alan Hukuk'],
      );
      expect(aGrubuCustom.scopeKey, 'a_grubu_custom');
      expect(
        aGrubuCustom.curriculumNamespace,
        'a_grubu_alan_hukuk_alan_isletme',
      );
    });

    test('Eski KpssExamTarget değerleri çift yönlü hatasız göç etmeli', () {
      for (final legacy in KpssExamTarget.values) {
        final selection = ExamSelection.fromLegacyTarget(legacy);
        expect(selection.toLegacyTarget(), legacy);
        expect(selection.resolveExamDate(), legacy.examDate);
      }
    });

    test('toJson / fromJson camelCase, snake_case ve geçersiz değerlerde güvenli çalışmalı', () {
      const original = ExamSelection(
        family: KpssExamFamily.ekpss,
        educationLevel: EducationLevel.onlisans,
        bGroupProfile: BGroupProfile.fullGyGk,
        oabtBranch: OabtBranch.ozelEgitim,
        disabilityGroup: DisabilityGroup.gorme,
        selectedFieldLessons: ['Alan Hukuk', 'Alan Maliye'],
        examCycleYear: 2028,
        includeExtraTime: true,
      );

      final roundTrip = ExamSelection.fromJson(original.toJson());
      expect(roundTrip, equals(original));
      expect(roundTrip.hashCode, equals(original.hashCode));

      final snakeCaseParsed = ExamSelection.fromJson(const {
        'family': 'meb_ags',
        'education_level': 'lisans',
        'b_group_profile': 'only_gk',
        'oabt_branch': 'sinif_ogretmenligi',
        'disability_group': 'genel',
        'selected_field_lessons': <String>[],
        'exam_cycle_year': 2099,
        'include_extra_time': true,
      });
      expect(snakeCaseParsed.family, KpssExamFamily.mebAgs);
      expect(snakeCaseParsed.oabtBranch, OabtBranch.sinifOgretmenligi);
      expect(snakeCaseParsed.examCycleYear, 2040);
      expect(snakeCaseParsed.includeExtraTime, isTrue);

      final fallbackParsed = ExamSelection.fromJson(const {
        'family': 'bilinmeyen',
        'educationLevel': 'bilinmeyen',
        'oabtBranch': null,
      });
      expect(fallbackParsed.family, KpssExamFamily.bGrubu);
      expect(fallbackParsed.educationLevel, EducationLevel.lisans);
      expect(fallbackParsed.oabtBranch, OabtBranch.none);
    });

    test('AppRemoteConfig.examDateOverrides en özel anahtardan genele doğru tarih ezmeli', () {
      const selection = ExamSelection(
        family: KpssExamFamily.bGrubu,
        educationLevel: EducationLevel.lisans,
        bGroupProfile: BGroupProfile.onlyGk,
        examCycleYear: 2027,
      );

      final config = AppRemoteConfig.fromMap({
        'exam_date_overrides': {
          'b_grubu': '2027-12-01T10:00:00',
          'lisans_gk': '2027-10-10T10:15:00',
          'lisans_gk_2027': '2027-09-20T10:15:00',
        },
      });
      expect(selection.resolveExamDate(config), DateTime(2027, 9, 20, 10, 15));

      final scopeOnlyConfig = AppRemoteConfig.fromMap({
        'exam_date_overrides': {
          'b_grubu': '2027-12-01T10:00:00',
          'lisans_gk': '2027-10-10T10:15:00',
        },
      });
      expect(
        selection.resolveExamDate(scopeOnlyConfig),
        DateTime(2027, 10, 10, 10, 15),
      );
    });

    testWidgets(
      'HomeScreen geri sayım kartı sabit KPSS 2027 yerine AppRemoteConfig ve ExamSelection kullanmalı',
      (WidgetTester tester) async {
        final remoteConfig = AppRemoteConfig(
          examDateOverrides: {
            'lisans_gk_2027': DateTime.now().add(
              const Duration(days: 100, hours: 12),
            ),
          },
        );

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              appRemoteConfigProvider.overrideWith((ref) async => remoteConfig),
            ],
            child: const MaterialApp(home: Scaffold(body: HomeScreen())),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('2027 KPSS Lisans (Genel Kültür)'), findsOneWidget);
        expect(find.textContaining('KPSS 2027:'), findsNothing);
        expect(find.textContaining('Toplam 100 gün kaldı'), findsOneWidget);
      },
    );
  });
}
