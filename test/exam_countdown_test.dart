import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/home/presentation/home_screen.dart';
import 'package:kadro/features/pomodoro/data/pomodoro_notifier.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/shared/widgets/target_exam_selector_bottom_sheet.dart';

void main() {
  group('KpssExamTarget & ExamRemainingDetails Takvim Matematiği Testleri', () {
    test(
      '1 Yıl 10 Ay gibi uzun vadeli hedeflerde Yıl, Ay, Gün doğru hesaplanmalı',
      () {
        final now = DateTime(2026, 11, 9);
        const target = KpssExamTarget.onlisans; // 2028-10-08

        final remaining = target.detailedRemaining(now);

        expect(remaining.years, 1);
        expect(remaining.months, 10);
        expect(remaining.days, 29);
        expect(remaining.formattedRemaining, '1 Yıl 10 Ay 29 Gün Kaldı');
        expect(remaining.isPast, isFalse);
      },
    );

    test('1 yıldan kısa hedeflerde (11 Ay 20 Gün gibi) Yıl 0 olmalı ve Ay/Gün formatlanmalı', () {
      final now = DateTime(2026, 11, 9);
      // Lisans hedefi 2027-09-05 (Yaklaşık 9 ay 27 gün)
      final remaining = KpssExamTarget.lisans.detailedRemaining(now);

      expect(remaining.years, 0);
      expect(remaining.months, 9);
      expect(remaining.days, 27);
      expect(remaining.formattedRemaining, '9 Ay 27 Gün Kaldı');
    });

    test('Sınav tarihi geçmişse sıfırlanmış değerler ve isPast dönmeli', () {
      const pastTarget = KpssExamTarget.lisans;
      final futureDate = DateTime(2030, 1, 1);

      final remaining = pastTarget.detailedRemaining(futureDate);

      expect(remaining.years, 0);
      expect(remaining.months, 0);
      expect(remaining.days, 0);
      expect(remaining.totalDays, 0);
      expect(remaining.isPast, isTrue);
      expect(remaining.formattedRemaining, 'Sınav Günü Geldi!');
    });

    test(
      'fromKey metodu bilinmeyen veya null değerlerde güvenle lisans dönmeli',
      () {
        expect(KpssExamTarget.fromKey(null), KpssExamTarget.lisans);
        expect(KpssExamTarget.fromKey('onlisans'), KpssExamTarget.onlisans);
        expect(
          KpssExamTarget.fromKey('ortaogretim'),
          KpssExamTarget.ortaogretim,
        );
        expect(KpssExamTarget.fromKey('lisans2028'), KpssExamTarget.lisans2028);
        expect(KpssExamTarget.fromKey('dhbt'), KpssExamTarget.dhbt);
        expect(KpssExamTarget.fromKey('gecersiz_kod'), KpssExamTarget.lisans);
      },
    );

    test('ÖSYM tahmini takvim açıklaması standart metni içermeli', () {
      expect(
        KpssExamTarget.osymDisclaimer,
        contains(
          'ÖSYM geçmiş sınav takvimi baz alınarak tahmini hesaplanmıştır',
        ),
      );
    });
  });

  group('UserPreferencesNotifier Hedef Sınav Entegrasyonu', () {
    test('Varsayılan hedef sınav lisans olmalı ve setTargetExam ile güncellenebilmeli', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final initial = container.read(userPreferencesProvider);
      expect(initial.targetExam, KpssExamTarget.lisans);
      expect(initial.hasSelectedTargetExam, isFalse);

      container
          .read(userPreferencesProvider.notifier)
          .setTargetExam(KpssExamTarget.onlisans);

      final updated = container.read(userPreferencesProvider);
      expect(updated.targetExam, KpssExamTarget.onlisans);
      expect(updated.targetExamKey, 'onlisans');
      expect(updated.hasSelectedTargetExam, isTrue);
    });

    test('UserPreferencesState JSON serileştirme ve ters serileştirme hedef sınavı korumalı', () {
      const state = UserPreferencesState(
        targetExamKey: 'ortaogretim',
        hasSelectedTargetExam: true,
      );

      final json = state.toJson();
      expect(json['targetExamKey'], 'ortaogretim');
      expect(json['hasSelectedTargetExam'], isTrue);

      final deserialized = UserPreferencesState.fromJson(json);
      expect(deserialized.targetExam, KpssExamTarget.ortaogretim);
      expect(deserialized.hasSelectedTargetExam, isTrue);
    });
  });

  group('TargetExamSelectorBottomSheet & HomeScreen UI Testleri', () {
    testWidgets(
      'TargetExamSelectorBottomSheet tüm sınav türlerini ve ÖSYM notunu listelemeli',
      (WidgetTester tester) async {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(
              home: Scaffold(body: TargetExamSelectorBottomSheet()),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('KPSS Sınav Hedefini Seç'), findsOneWidget);
        expect(find.text('2027 KPSS Lisans (GY-GK)'), findsOneWidget);
        expect(find.text('2028 KPSS Lisans (B Grubu)'), findsOneWidget);
        expect(find.text('2028 KPSS Ön Lisans'), findsOneWidget);
        expect(find.text('2028 KPSS Ortaöğretim'), findsOneWidget);
        expect(find.text('2028 KPSS DHBT'), findsOneWidget);
        expect(
          find.textContaining('ÖSYM geçmiş sınav takvimi baz alınarak'),
          findsOneWidget,
        );

        // 2028 KPSS Ön Lisans seçeneğine tıkla
        await tester.tap(find.text('2028 KPSS Ön Lisans'));
        await tester.pumpAndSettle();

        expect(
          container.read(userPreferencesProvider).targetExam,
          KpssExamTarget.onlisans,
        );
      },
    );

    testWidgets(
      'HomeScreen üzerinde Yıl / Ay / Gün sayaç kutuları ve Değiştir butonu render edilmeli',
      (WidgetTester tester) async {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        // Ön Lisans hedefi ayarlayalım
        container
            .read(userPreferencesProvider.notifier)
            .setTargetExam(KpssExamTarget.onlisans);

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(home: Scaffold(body: HomeScreen())),
          ),
        );
        await tester.pumpAndSettle();

        // 1. Sayaç kutuları görünmeli (YIL, AY, GÜN)
        expect(find.text('YIL'), findsOneWidget);
        expect(find.text('AY'), findsOneWidget);
        expect(find.text('GÜN'), findsOneWidget);

        // 2. Seçili sınav başlığı ve Değiştir butonu görünmeli
        expect(find.textContaining('2028 KPSS Ön Lisans'), findsOneWidget);
        expect(find.text('Değiştir'), findsOneWidget);

        // 3. ÖSYM resmi takvim bilgilendirme notu görünmeli
        expect(
          find.textContaining('ÖSYM geçmiş sınav takvimi baz alınarak'),
          findsOneWidget,
        );

        // 4. Değiştir butonuna tıklayınca TargetExamSelectorBottomSheet açılmalı
        await tester.tap(find.text('Değiştir'));
        await tester.pumpAndSettle();

        expect(find.byType(TargetExamSelectorBottomSheet), findsOneWidget);
        expect(find.text('2028 KPSS Ortaöğretim'), findsOneWidget);

        // Ortaöğretim seçelim
        await tester.tap(find.text('2028 KPSS Ortaöğretim'));
        await tester.pumpAndSettle();

        // Modal kapanıp ana ekranda 2028 KPSS Ortaöğretim görünmeli
        expect(find.byType(TargetExamSelectorBottomSheet), findsNothing);
        expect(find.textContaining('2028 KPSS Ortaöğretim'), findsOneWidget);
        expect(
          container.read(userPreferencesProvider).targetExam,
          KpssExamTarget.ortaogretim,
        );
      },
    );
  });
}
