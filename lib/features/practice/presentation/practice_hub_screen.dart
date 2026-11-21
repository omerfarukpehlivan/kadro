import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/current_affairs/presentation/current_affairs_screen.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/exams/data/models/mock_exam_blueprint.dart';
import 'package:kadro/features/exams/presentation/widgets/blueprint_exam_launcher.dart';
import 'package:kadro/features/flashcards/presentation/flashcards_screen.dart';
import 'package:kadro/features/games/presentation/concept_match_screen.dart';
import 'package:kadro/features/games/presentation/true_false_blitz_screen.dart';
import 'package:kadro/features/lessons/data/curriculum_registry.dart';
import 'package:kadro/features/lessons/data/kpss_lessons.dart';
import 'package:kadro/features/lessons/data/models/exam_curriculum.dart';
import 'package:kadro/features/lessons/presentation/lesson_topics_screen.dart';
import 'package:kadro/features/map_practice/presentation/map_practice_hub_screen.dart';
import 'package:kadro/features/mistakes/presentation/mistakes_screen.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/features/score_calculator/presentation/kpss_score_calculator_screen.dart';
import 'package:kadro/shared/widgets/adaptive_overlay.dart';
import 'package:kadro/shared/widgets/responsive_grid.dart';
import 'package:kadro/shared/widgets/section_title.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Çalışma Türleri ve Antrenman Sahası ekranı (`PracticeHubScreen`).
///
/// Web/Angular benzetmesi: Tuğrul antrenman karakterleriyle zenginleştirilmiş pratik merkezi.
class PracticeHubScreen extends ConsumerWidget {
  const PracticeHubScreen({super.key});

  /// "Konu testi" seçildiğinde 4 KPSS Genel Kültür dersinden birini seçtiren
  /// alt çekmeceyi (Bottom Sheet) açar ve doğrudan `LessonTopicsScreen`'e yönlendirir.
  ///
  /// Web/Angular karşılığı: Dinamik ders seçim modalı (`MatBottomSheet.open`).
  void _showLessonSelectorSheet(BuildContext context) {
    AdaptiveOverlay.showModal<void>(
      context: context,
      dialogMaxWidth: 600,
      builder: (sheetCtx) => _LessonSelectorBottomSheet(
        onSelectLesson: (lesson) {
          Navigator.of(sheetCtx).pop();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => LessonTopicsScreen(lesson: lesson),
            ),
          );
        },
      ),
    );
  }

  /// "Deneme sınavı" kartına tıklandığında aktif sınav profiline uygun tam ve
  /// mini deneme paketlerini seçtiren dinamik modal/çekmeceyi açar.
  ///
  /// Web/Angular karşılığı: Sınav paketi seçim modalıdır (`MockExamSelectorDialog`).
  void _showMockExamSelectorSheet(BuildContext context, WidgetRef ref) {
    final selection = readOrWatchExamSelection(ref, watch: false);
    final curriculum = readOrWatchCurriculum(ref, watch: false);
    final options = ExamBlueprintRegistry.practicePacksFor(
      selection,
      curriculum: curriculum,
    );

    AdaptiveOverlay.showModal<void>(
      context: context,
      dialogMaxWidth: 620,
      builder: (sheetCtx) => _MockExamSelectorBottomSheet(
        selection: selection,
        options: options,
        onSelectOption: (blueprint) {
          Navigator.of(sheetCtx).pop();
          launchBlueprintExamWithGuard(
            context: context,
            ref: ref,
            blueprint: blueprint,
            selection: selection,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isCompact = ResponsiveBreakpoints.isCompact(context);
    final gridSpacing = isCompact ? AppSpacing.xs : AppSpacing.sm;
    final selection = readOrWatchExamSelection(ref);
    final curriculum = readOrWatchCurriculum(ref);
    final primaryBlueprint = ExamBlueprintRegistry.primaryFullExamFor(
      selection,
      curriculum: curriculum,
    );
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isLargeTablet = ResponsiveBreakpoints.isLargeTablet(context);
    final toolColumns = screenWidth >= 900 ? 2 : 1;

    final primaryTilesRow = IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: _PrimaryPracticeTile(
              meta: '10–20 SORU',
              title: 'Konu testi',
              description: 'Bir konu seç, açıklamalı test çöz.',
              isHighlighted: true,
              onTap: () => _showLessonSelectorSheet(context),
            ),
          ),
          SizedBox(width: gridSpacing),
          Expanded(
            child: _PrimaryPracticeTile(
              meta: '${primaryBlueprint.standardDurationMinutes} DAKİKA',
              title: 'Deneme sınavı',
              description:
                  '${primaryBlueprint.totalQuestionCount} soruluk gerçek KPSS oturumu.',
              isHighlighted: false,
              onTap: () => _showMockExamSelectorSheet(context, ref),
            ),
          ),
        ],
      ),
    );

    final distractorBanner = _DistractorHuntBanner(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(
            builder: (_) => const QuizScreen(
              customTitle: 'ÖSYM Çeldirici Avı (Tuzak Sorular)',
              fetchAllFromPool: true,
              onlyDistractorTraps: true,
              limit: 10,
            ),
          ),
        );
      },
    );

    final reviewCard = TactileCard(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      child: Column(
        children: [
          _PracticeListRow(
            icon: PhosphorIconsFill.cards,
            accentColor: colorScheme.primary,
            title: 'Bilgi kartları',
            subtitle: 'Önünde soru, arkasında kısa cevap.',
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(builder: (_) => const FlashcardsScreen()),
              );
            },
          ),
          const Divider(height: 1),
          _PracticeListRow(
            icon: PhosphorIconsFill.bookmarks,
            accentColor: colorScheme.error,
            title: 'Yanlış defteri',
            subtitle: 'Hata yaptığın soruları tekrar çöz.',
            onTap: () {
              Navigator.of(
                context,
                rootNavigator: true,
              ).push(MaterialPageRoute(builder: (_) => const MistakesScreen()));
            },
          ),
          const Divider(height: 1),
          _PracticeListRow(
            icon: PhosphorIconsFill.puzzlePiece,
            accentColor: colorScheme.secondary,
            title: 'Kavram Eşleştir',
            subtitle: 'Tarih, Coğrafya ve Vatandaşlık terimlerini eşleştir.',
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(builder: (_) => const ConceptMatchScreen()),
              );
            },
          ),
        ],
      ),
    );

    final practiceTools = <Widget>[
      _PracticeToolCard(
        mood: TugrulMood.geography,
        accentColor: colorScheme.secondary,
        title: 'Harita Atölyesi',
        meta: '81 İl & Havzalar',
        description: 'İlleri, maden havzalarını ve tarım bölgelerini haritada dokunarak bul.',
        onTap: () {
          Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(builder: (_) => const MapPracticeHubScreen()),
          );
        },
      ),
      _PracticeToolCard(
        mood: TugrulMood.streak,
        accentColor: colorScheme.tertiary,
        title: '60 Saniyede Doğru / Yanlış',
        meta: 'Hızlı Tekrar',
        description: 'Süreli doğru/yanlış alıştırmasıyla refleks geliştir.',
        onTap: () {
          Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(builder: (_) => const TrueFalseBlitzScreen()),
          );
        },
      ),
      _PracticeToolCard(
        mood: TugrulMood.analyst,
        accentColor: colorScheme.primary,
        title: 'KPSS Puan Hesaplama',
        meta: 'P3 · P93 · P94 & Son 3 Yıl',
        description: 'Netlerini gir; P3, P93, P94 puanını ve son 3 KPSS sınavında kaç puan alacağını karşılaştır.',
        onTap: () {
          Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(
              builder: (_) => const KpssScoreCalculatorScreen(),
            ),
          );
        },
      ),
      _PracticeToolCard(
        mood: TugrulMood.current,
        accentColor: colorScheme.error,
        title: 'Aylık Güncel Bülten',
        meta: 'Mayıs · Haziran · Temmuz',
        description: 'Ay ay güncel gelişmeleri, ÖSYM soru ipuçlarını oku ve 10 soruluk mini testle pekiştir.',
        onTap: () {
          Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(builder: (_) => const CurrentAffairsScreen()),
          );
        },
      ),
    ];

    return ResponsiveContentWrapper(
      maxWidth: isLargeTablet ? 1240 : 720,
      padding: EdgeInsets.zero,
      child: Scrollbar(
        child: ListView(
          padding: AppSpacing.pagePadding(context),
          children: [
            // Canlı antrenman karşılama şeridi (kutu banner yerine sayfayla bütünleşen sahne)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Antrenman Sahası',
                          style: textTheme.headlineMedium?.copyWith(
                            color: colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Soru çözümü, kavram tekrarı, harita atölyesi ve süreli pratik.',
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  TugrulAvatar(
                    mood: TugrulMood.practice,
                    size: isLargeTablet ? 82 : 64,
                    tooltip: 'Çalışma Modu İpuçları',
                    onTap: () => TugrulTipsSheet.show(
                      context,
                      mood: TugrulMood.practice,
                    ),
                  ),
                ],
              ),
            ),
            AppSpacing.gapSm,

            if (isLargeTablet)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SectionTitle('Çalışma türleri'),
                        primaryTilesRow,
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SectionTitle(
                          'Özel Antrenman',
                          accentColor: colorScheme.tertiary,
                        ),
                        distractorBanner,
                      ],
                    ),
                  ),
                ],
              )
            else ...[
              // 1. Birincil Pratik: Eşit yükseklikli 2'li çalışma modu
              const SectionTitle('Çalışma türleri'),
              primaryTilesRow,
              AppSpacing.gapMd,

              // 2. Tekrar ve Kavramlar
              SectionTitle(
                'Tekrar ve kavramlar',
                accentColor: colorScheme.secondary,
              ),
              reviewCard,
              AppSpacing.gapMd,

              // 3. Özel Antrenman: Dedektif Tuğrul ile ÖSYM Çeldirici Avı
              SectionTitle('Özel Antrenman', accentColor: colorScheme.tertiary),
              distractorBanner,
            ],
            if (isLargeTablet) ...[
              AppSpacing.gapMd,
              SectionTitle(
                'Tekrar ve kavramlar',
                accentColor: colorScheme.secondary,
              ),
              reviewCard,
            ],
            AppSpacing.gapMd,

            // 4. Araçlar & Hızlı Tekrar
            const SectionTitle('Araçlar & Hızlı Tekrar'),
            ResponsiveGrid(
              columns: toolColumns,
              spacing: 12,
              runSpacing: 12,
              children: practiceTools,
            ),
          ],
        ),
      ),
    );
  }
}

class _PrimaryPracticeTile extends StatelessWidget {
  final String meta;
  final String title;
  final String description;
  final bool isHighlighted;
  final VoidCallback onTap;

  const _PrimaryPracticeTile({
    required this.meta,
    required this.title,
    required this.description,
    required this.isHighlighted,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return TactileCard(
      onTap: onTap,
      backgroundColor: isHighlighted
          ? colorScheme.primary
          : colorScheme.surface,
      borderColor: isHighlighted
          ? colorScheme.onPrimaryContainer
          : colorScheme.outlineVariant,
      lipColor: isHighlighted
          ? colorScheme.onPrimaryContainer
          : colorScheme.outlineVariant,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: isHighlighted
                      ? colorScheme.onPrimary.withAlpha(38)
                      : colorScheme.tertiaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  meta,
                  style: textTheme.labelSmall?.copyWith(
                    color: isHighlighted
                        ? colorScheme.onPrimary
                        : colorScheme.onTertiaryContainer,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: textTheme.headlineSmall?.copyWith(
                  color: isHighlighted
                      ? colorScheme.onPrimary
                      : colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: textTheme.bodySmall?.copyWith(
                  color: isHighlighted
                      ? colorScheme.onPrimary.withAlpha(220)
                      : colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Text(
                'Başla',
                style: textTheme.labelLarge?.copyWith(
                  color: isHighlighted
                      ? colorScheme.onPrimary
                      : colorScheme.primary,
                ),
              ),
              const SizedBox(width: 4),
              PhosphorIcon(
                PhosphorIconsBold.arrowRight,
                size: 15,
                color: isHighlighted
                    ? colorScheme.onPrimary
                    : colorScheme.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PracticeListRow extends StatelessWidget {
  final IconData icon;
  final Color accentColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _PracticeListRow({
    required this.icon,
    required this.accentColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: accentColor.withAlpha(24),
                borderRadius: BorderRadius.circular(11),
                border: Border.all(color: accentColor.withAlpha(65)),
              ),
              child: PhosphorIcon(icon, size: 19, color: accentColor),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.titleSmall?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            PhosphorIcon(
              PhosphorIconsRegular.caretRight,
              size: 16,
              color: colorScheme.outline,
            ),
          ],
        ),
      ),
    );
  }
}

class _DistractorHuntBanner extends StatelessWidget {
  final VoidCallback onTap;

  const _DistractorHuntBanner({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return TactileCard(
      onTap: onTap,
      backgroundColor: colorScheme.tertiaryContainer,
      borderColor: colorScheme.tertiary,
      lipColor: colorScheme.tertiary,
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          TugrulAvatar(
            mood: TugrulMood.detective,
            size: ResponsiveBreakpoints.isLargeTablet(context) ? 72 : 56,
            ringWidth: 2,
            hasShadow: false,
            ringColor: colorScheme.tertiary,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TUZAK SORULAR',
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onTertiaryContainer,
                    letterSpacing: 0.7,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'ÖSYM Çeldirici Avı',
                  style: textTheme.titleMedium?.copyWith(
                    color: colorScheme.onTertiaryContainer,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Adayların en çok düştüğü çeldiricilerle 10 soruluk çalışma.',
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onTertiaryContainer.withAlpha(200),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          PhosphorIcon(
            PhosphorIconsBold.caretRight,
            size: 18,
            color: colorScheme.onTertiaryContainer,
          ),
        ],
      ),
    );
  }
}

class _PracticeToolCard extends StatelessWidget {
  final TugrulMood mood;
  final Color accentColor;
  final String title;
  final String meta;
  final String description;
  final VoidCallback onTap;

  const _PracticeToolCard({
    required this.mood,
    required this.accentColor,
    required this.title,
    required this.meta,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return TactileCard(
      onTap: onTap,
      borderColor: accentColor.withAlpha(90),
      lipColor: accentColor.withAlpha(110),
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          TugrulAvatar(
            mood: mood,
            size: ResponsiveBreakpoints.isLargeTablet(context) ? 60 : 46,
            ringWidth: 2,
            ringColor: accentColor,
            hasShadow: false,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      title,
                      style: textTheme.titleSmall?.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: accentColor.withAlpha(22),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        meta,
                        style: textTheme.labelSmall?.copyWith(
                          color: accentColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  description,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          PhosphorIcon(
            PhosphorIconsRegular.caretRight,
            size: 16,
            color: accentColor,
          ),
        ],
      ),
    );
  }
}

/// Alt çekmece seçim listeleri için ortak başlık ve kaydırılabilir gövde iskeleti.
class _SelectorBottomSheetScaffold extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Widget> children;

  const _SelectorBottomSheetScaffold({
    required this.title,
    required this.subtitle,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      top: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (!ResponsiveBreakpoints.usesDialogOverlay(context)) ...[
              const KadroSheetHandle(),
              const SizedBox(height: 16),
            ],
            Text(
              title,
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }
}

/// "Konu testi" çalışma türüne tıklandığında aktif sınav müfredatındaki tüm dersleri
/// dinamik olarak sunan alt çekmece.
///
/// Web/Angular karşılığı: Ders seçim diyaloğu (`LessonSelectorBottomSheetComponent`).
class _LessonSelectorBottomSheet extends ConsumerWidget {
  final ValueChanged<Lesson> onSelectLesson;

  const _LessonSelectorBottomSheet({required this.onSelectLesson});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final curriculum = readOrWatchCurriculum(ref);
    final lessons = curriculum.allLessons;

    return _SelectorBottomSheetScaffold(
      title: 'Konu Testi İçin Ders Seçin',
      subtitle:
          '${curriculum.title} kapsamındaki ${lessons.length} ders için ünite yol haritasını açın ve seviye testlerini çözün.',
      children: [
        for (final spec in lessons)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.xs),
            child: _LessonSelectorTile(
              lessonSpec: spec,
              onTap: () => onSelectLesson(spec.toLesson()),
            ),
          ),
      ],
    );
  }
}

/// Hızlı Deneme Sınavı seçici alt çekmecesi (`TASK-121` & `TASK-130`).
///
/// Web/Angular karşılığı: Aktif sınav şablonlarına göre tam ve mini deneme
/// paketlerini listeleyen `<app-mock-exam-selector>`.
class _MockExamSelectorBottomSheet extends StatelessWidget {
  final ExamSelection selection;
  final List<MockExamBlueprint> options;
  final ValueChanged<MockExamBlueprint> onSelectOption;

  const _MockExamSelectorBottomSheet({
    required this.selection,
    required this.options,
    required this.onSelectOption,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return _SelectorBottomSheetScaffold(
      title: 'Deneme Sınavı Seçin',
      subtitle:
          '${selection.shortTitle} kapsamına göre tam süreli veya 20 soruluk hızlı mola denemesi başlatabilirsiniz.',
      children: [
        for (final option in options)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.xs),
            child: TactileCard(
              onTap: () => onSelectOption(option),
              borderColor:
                  (option.isMiniPractice
                          ? colorScheme.tertiary
                          : colorScheme.primary)
                      .withAlpha(90),
              lipColor:
                  (option.isMiniPractice
                          ? colorScheme.tertiary
                          : colorScheme.primary)
                      .withAlpha(110),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color:
                          (option.isMiniPractice
                                  ? colorScheme.tertiary
                                  : colorScheme.primary)
                              .withAlpha(24),
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all(
                        color:
                            (option.isMiniPractice
                                    ? colorScheme.tertiary
                                    : colorScheme.primary)
                                .withAlpha(65),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: PhosphorIcon(
                      option.isMiniPractice
                          ? PhosphorIconsFill.timer
                          : PhosphorIconsFill.exam,
                      color: option.isMiniPractice
                          ? colorScheme.tertiary
                          : colorScheme.primary,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          option.title,
                          style: textTheme.titleSmall?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          option.subtitle,
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  PhosphorIcon(
                    PhosphorIconsRegular.caretRight,
                    size: 16,
                    color: option.isMiniPractice
                        ? colorScheme.tertiary
                        : colorScheme.primary,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

/// Ders seçici alt çekmecesindeki tekil dokunsal ders satırı.
///
/// Web/Angular karşılığı: Ders listesi öğesi (`LessonOptionRowComponent`).
class _LessonSelectorTile extends StatelessWidget {
  final LessonSpec lessonSpec;
  final VoidCallback onTap;

  const _LessonSelectorTile({required this.lessonSpec, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final accent = TugrulMoodExtension.fromLesson(lessonSpec.name)
        .accentColor(colorScheme);

    return TactileCard(
      onTap: onTap,
      borderColor: accent.withAlpha(90),
      lipColor: accent.withAlpha(110),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: accent.withAlpha(24),
              borderRadius: BorderRadius.circular(11),
              border: Border.all(color: accent.withAlpha(65)),
            ),
            alignment: Alignment.center,
            child: PhosphorIcon(lessonSpec.icon, color: accent, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 6,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      lessonSpec.name,
                      style: textTheme.titleSmall?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    if (lessonSpec.isComingSoon)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'Yakında',
                          style: textTheme.labelSmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  '${lessonSpec.topics.length} konu · Sınavda ${lessonSpec.questionCount} soru',
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          PhosphorIcon(
            PhosphorIconsRegular.caretRight,
            size: 16,
            color: accent,
          ),
        ],
      ),
    );
  }
}
