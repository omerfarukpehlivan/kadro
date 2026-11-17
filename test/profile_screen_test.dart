import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/auth/data/auth_notifier.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/profile/data/models/achievement_badge.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/profile/presentation/profile_screen.dart';
import 'package:kadro/features/profile/presentation/widgets/achievement_showcase.dart';
import 'package:kadro/features/profile/presentation/widgets/candidate_hero_card.dart';
import 'package:kadro/features/profile/presentation/widgets/profile_metrics_card.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';

void main() {
  group('TASK-65 Profil Ekranı Evrimi Widget & Model Testleri', () {
    test(
      'calculateBadges() fonksiyonu başarı koşullarını doğru hesaplamalı',
      () {
        // 1. Sıfır istatistikle kilitli rozetler
        const emptyStats = StudyStatsState();
        final emptyBadges = calculateBadges(emptyStats);
        expect(emptyBadges.length, 6);
        expect(emptyBadges.every((b) => !b.isUnlocked), isTrue);

        // 2. Başarı koşulları sağlandığında kilitlerin açılması
        const activeStats = StudyStatsState(
          totalSolved: 150,
          totalCorrect: 120,
          streakDays: 7,
          totalXp: 850,
        );
        final activeBadges = calculateBadges(activeStats);
        final ilkPence = activeBadges.firstWhere((b) => b.id == 'first_claw');
        final seriCanavari = activeBadges.firstWhere(
          (b) => b.id == 'streak_monster',
        );
        final netSicratici = activeBadges.firstWhere(
          (b) => b.id == 'accuracy_jump',
        );

        expect(ilkPence.isUnlocked, isTrue);
        expect(seriCanavari.isUnlocked, isTrue);
        expect(netSicratici.isUnlocked, isTrue);
      },
    );

    testWidgets(
      'ProfileScreen aday kimlik kartı, sayaç ve başarı rozetlerini eksiksiz render etmeli',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        final container = ProviderContainer();
        addTearDown(container.dispose);

        container
            .read(studyStatsProvider.notifier)
            .recordAnswer(
              lesson: 'Tarih',
              isCorrect: true,
              topic: 'İlk Türk Devletleri',
            );

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(home: Scaffold(body: ProfileScreen())),
          ),
        );
        await tester.pumpAndSettle();

        // 1. Hero Card Testleri (En yakın sınav/geri sayım yalnızca Ana Sayfa'da yer alır)
        expect(find.byType(CandidateHeroCard), findsOneWidget);
        expect(find.textContaining('Gün Kaldı'), findsNothing);
        expect(find.text('Hedefi Düzenle'), findsOneWidget);

        // 2. Metrik Kartı & Lig Testleri
        expect(find.byType(ProfileMetricsCard), findsOneWidget);
        expect(find.text('Çalışma Serisi'), findsOneWidget);
        expect(find.text('Çözülen Soru'), findsOneWidget);
        expect(find.text('Doğru Oranı'), findsOneWidget);
        expect(find.text('Toplam XP'), findsOneWidget);
        expect(find.textContaining('Kadro Ligi'), findsOneWidget);

        // 3. Başarı Rozetleri Vitrini Testleri
        expect(find.byType(AchievementShowcase), findsOneWidget);
        expect(find.textContaining('Başarı Madalyaları'), findsOneWidget);
        expect(find.text('İlk Adım'), findsOneWidget);
        expect(find.text('Tarih Uzmanı'), findsOneWidget);
        expect(find.text('Çeldirici Avcısı'), findsOneWidget);

        // 4. Rozete tıklayınca detay BottomSheet açılmalı
        await tester.tap(find.text('İlk Adım'));
        await tester.pumpAndSettle();

        expect(find.text('Madalya Açıldı'), findsOneWidget);
      },
    );

    testWidgets(
      'CandidateHeroCard oturum açmış kullanıcı bilgilerini ve PRO etiketini göstermeli',
      (WidgetTester tester) async {
        const auth = AuthUserState(
          isAuthenticated: true,
          displayName: 'Ömer Memur',
          email: 'omer@kadro.com',
        );
        const prefs = UserPreferencesState(
          isPro: true,
          targetKpssScore: 92,
          focusLesson: 'Coğrafya',
          targetDailyStudyGoal: 60,
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: CandidateHeroCard(auth: auth, prefs: prefs),
            ),
          ),
        );

        expect(find.text('Ömer Memur'), findsOneWidget);
        expect(find.textContaining('omer@kadro.com'), findsOneWidget);
        expect(find.text('PRO'), findsOneWidget);
        expect(find.text('KPSS Hedefim: 92+ Puan'), findsOneWidget);
        expect(find.textContaining('Odak Ders: Coğrafya'), findsOneWidget);
        expect(find.textContaining('Gün Kaldı'), findsNothing);
      },
    );

    testWidgets(
      'Hedef sınav satırı tüm responsive boyutlarda dikey sıkışmadan tek yatay satırda kalır',
      (WidgetTester tester) async {
        const longExam = ExamSelection(
          family: KpssExamFamily.mebAgs,
          educationLevel: EducationLevel.lisans,
          oabtBranch: OabtBranch.sinifOgretmenligi,
        );

        final sizes = <Size>[
          const Size(360, 640),
          const Size(768, 1024),
          const Size(784, 768), // 1024px ekran - 240px kenar çubuğu
          const Size(1040, 800), // 1280px ekran - 240px kenar çubuğu
          const Size(1440, 900),
        ];

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        for (final size in sizes) {
          tester.view.physicalSize = size;
          tester.view.devicePixelRatio = 1.0;

          await tester.pumpWidget(
            ProviderScope(
              overrides: [
                initialUserPreferencesProvider.overrideWithValue(
                  const UserPreferencesState(
                    hasCompletedOnboarding: true,
                    examSelection: longExam,
                  ),
                ),
              ],
              child: const MaterialApp(home: Scaffold(body: ProfileScreen())),
            ),
          );
          await tester.pumpAndSettle();

          final targetFinder = find.text('Hedef sınav');
          if (find.byType(Scrollable).evaluate().isNotEmpty) {
            await tester.scrollUntilVisible(
              targetFinder,
              220,
              scrollable: find.byType(Scrollable).first,
            );
            await tester.pumpAndSettle();
          }

          expect(targetFinder, findsOneWidget);
          final labelSize = tester.getSize(targetFinder);
          expect(
            labelSize.width,
            greaterThanOrEqualTo(60),
            reason: 'Ekran $size üzerinde Hedef sınav genişliği sıkışmamalı',
          );
          expect(
            labelSize.height,
            lessThanOrEqualTo(36),
            reason:
                'Ekran $size üzerinde Hedef sınav dikey harf yığınına kırılmamalı',
          );

          final dailyGoalSize = tester.getSize(find.text('Günlük hedef'));
          expect(
            dailyGoalSize.height,
            lessThanOrEqualTo(36),
            reason:
                'Ekran $size üzerinde Günlük hedef dikey harf yığınına kırılmamalı',
          );

          expect(find.textContaining('Gün Kaldı'), findsNothing);
          expect(tester.takeException(), isNull);
        }
      },
    );
  });
}
