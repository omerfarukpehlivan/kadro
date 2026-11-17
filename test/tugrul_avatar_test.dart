import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/app/theme.dart';
import 'package:kadro/core/constants/kpss_study_tips.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';

void main() {
  group('StudyTipCategory ve TugrulMood Testleri', () {
    test('StudyTipCategory 12 çalışma kategorisi ve en az 4 not içerir', () {
      expect(StudyTipCategory.values.length, 12);
      for (final category in StudyTipCategory.values) {
        expect(category.sheetTitle.trim().isNotEmpty, isTrue);
        expect(category.tips.length, greaterThanOrEqualTo(4));
        for (final tip in category.tips) {
          expect(tip.trim().isNotEmpty, isTrue);
          expect(tip.contains('\u{1F4A1}'), isFalse);
        }
      }
    });

    test('12 TugrulMood öğesinin tamamı benzersiz asset ve kategori taşır', () {
      expect(TugrulMood.values.length, 12);
      final paths = <String>{};
      for (final mood in TugrulMood.values) {
        expect(mood.assetPath, startsWith('assets/images/mascot/tugrul_'));
        expect(mood.assetPath, endsWith('.png'));
        paths.add(mood.assetPath);
        expect(mood.studyCategory.sheetTitle.isNotEmpty, isTrue);
        expect(mood.accentColor(AppTheme.light.colorScheme), isA<Color>());
      }
      expect(paths.length, 12);
    });

    test('fromLesson ders isimlerini doğru StudyTipCategory ve TugrulMood değerine eşler', () {
      expect(
        StudyTipCategoryExtension.fromLesson('Tarih'),
        StudyTipCategory.history,
      );
      expect(
        StudyTipCategoryExtension.fromLesson('Coğrafya'),
        StudyTipCategory.geography,
      );
      expect(
        StudyTipCategoryExtension.fromLesson('Vatandaşlık'),
        StudyTipCategory.citizenship,
      );
      expect(
        StudyTipCategoryExtension.fromLesson('Güncel Bilgiler'),
        StudyTipCategory.current,
      );
      expect(
        StudyTipCategoryExtension.fromLesson('Diğer'),
        StudyTipCategory.home,
      );
      expect(StudyTipCategoryExtension.fromLesson(null), StudyTipCategory.home);

      expect(TugrulMoodExtension.fromLesson('Tarih'), TugrulMood.history);
      expect(TugrulMoodExtension.fromLesson('Coğrafya'), TugrulMood.geography);
      expect(
        TugrulMoodExtension.fromLesson('Vatandaşlık'),
        TugrulMood.citizenship,
      );
      expect(
        TugrulMoodExtension.fromLesson('Güncel Bilgiler'),
        TugrulMood.current,
      );
      expect(TugrulMoodExtension.fromLesson('Diğer'), TugrulMood.coach);
      expect(TugrulMoodExtension.fromLesson(null), TugrulMood.coach);
    });
  });

  group('TugrulAvatar ve TugrulTipsSheet Widget Testleri', () {
    testWidgets(
      'TugrulAvatar ClipOval madalyonu içinde karakter görseli render eder',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.light,
            home: const Scaffold(
              body: Center(
                child: TugrulAvatar(mood: TugrulMood.victory, size: 72),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.byType(TugrulAvatar), findsOneWidget);
        expect(find.byType(ClipOval), findsOneWidget);
        expect(find.byType(Image), findsOneWidget);
      },
    );

    testWidgets(
      'onTap verildiğinde dokununca TugrulTipsSheet alt çekmecesi açılır',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.light,
            home: Scaffold(
              body: Builder(
                builder: (context) => Center(
                  child: TugrulAvatar(
                    mood: TugrulMood.geography,
                    size: 64,
                    onTap: () => TugrulTipsSheet.show(
                      context,
                      mood: TugrulMood.geography,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.byType(TugrulAvatar));
        await tester.pumpAndSettle();

        expect(
          find.text(StudyTipCategory.geography.sheetTitle),
          findsOneWidget,
        );
        expect(
          find.text(StudyTipCategory.geography.tips.first),
          findsOneWidget,
        );
      },
    );
  });
}
