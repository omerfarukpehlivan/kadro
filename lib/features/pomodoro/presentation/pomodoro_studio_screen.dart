import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/pomodoro/data/pomodoro_notifier.dart';
import 'package:kadro/shared/widgets/section_title.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// KPSS Sınav Geri Sayımı ve Çoklu Tasarımlı Pomodoro Odak Stüdyosu Ekranı.
///
/// Flocus, Flip Focus, Yeolpumta (YPT) ve iOS StandBy modundan ilham alan;
/// hem dikey hem de yatay masa saati olarak masaya konulabilen çalışma stüdyosu.
/// Web/Angular Benzetmesi: `PomodoroStudioComponent` (Dashboard & Live Desk Clock).
class PomodoroStudioScreen extends ConsumerStatefulWidget {
  final int initialTabIndex;

  const PomodoroStudioScreen({super.key, this.initialTabIndex = 0});

  @override
  ConsumerState<PomodoroStudioScreen> createState() =>
      _PomodoroStudioScreenState();
}

class _PomodoroStudioScreenState extends ConsumerState<PomodoroStudioScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Timer? _countdownTimer;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.initialTabIndex,
    );

    // Canlı sınav geri sayımı saniyesini yenilemek için 1 saniyelik periyodik tetikleyici
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _tabController.dispose();

    // Ekran kapatılırken cihaz yönlendirme kilitlerini serbest bırak
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  void _toggleOrientation() {
    final currentLandscape = ref.read(pomodoroProvider).isLandscapeMode;
    final nextLandscape = !currentLandscape;
    ref.read(pomodoroProvider.notifier).setLandscapeMode(nextLandscape);

    if (nextLandscape) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pomodoro = ref.watch(pomodoroProvider);
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape ||
        pomodoro.isLandscapeMode;

    if (isLandscape) {
      return Scaffold(
        body: SafeArea(
          child: _LandscapeStandByClockView(
            state: pomodoro,
            onToggleOrientation: _toggleOrientation,
          ),
        ),
      );
    }

    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          'Odak & Sınav Sayacı',
          style: Theme.of(context).textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.w800),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: ResponsiveBreakpoints.horizontalPadding(context) - 8,
            ),
            child: Tooltip(
              message: 'Yatay Masa Saati Modu',
              child: TextButton.icon(
                onPressed: _toggleOrientation,
                style: TextButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                ),
                icon: const PhosphorIcon(
                  PhosphorIconsBold.deviceRotate,
                  size: 18,
                ),
                label: Text(
                  'Masa Saati',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: ResponsiveContentWrapper(
        maxWidth: 720,
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            // Üst 2 Sekmeli Seçici (Pomodoro Stüdyosu / Sınav Geri Sayımı)
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveBreakpoints.horizontalPadding(context),
                vertical: 8,
              ),
              child: SegmentedButton<int>(
                segments: const [
                  ButtonSegment<int>(
                    value: 0,
                    icon: PhosphorIcon(PhosphorIconsBold.timer, size: 16),
                    label: Text('Pomodoro Stüdyosu'),
                  ),
                  ButtonSegment<int>(
                    value: 1,
                    icon: PhosphorIcon(
                      PhosphorIconsBold.calendarCheck,
                      size: 16,
                    ),
                    label: Text('Sınav Geri Sayımı'),
                  ),
                ],
                selected: {_tabController.index},
                onSelectionChanged: (selected) {
                  setState(() {
                    _tabController.animateTo(selected.first);
                  });
                },
              ),
            ),

            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _PomodoroStudioTab(
                    state: pomodoro,
                    onToggleOrientation: _toggleOrientation,
                    onGoToCountdownTab: () {
                      setState(() {
                        _tabController.animateTo(1);
                      });
                    },
                  ),
                  _ExamCountdownTab(
                    target: pomodoro.examTarget,
                    onStartPomodoro: () {
                      setState(() {
                        _tabController.animateTo(0);
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 📱 Yatay Masa Saati (Landscape StandBy) Görünümü
class _LandscapeStandByClockView extends ConsumerWidget {
  final PomodoroState state;
  final VoidCallback onToggleOrientation;

  const _LandscapeStandByClockView({
    required this.state,
    required this.onToggleOrientation,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final notifier = ref.read(pomodoroProvider.notifier);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Sol Bölüm: Dev Saat Yüzü
          Expanded(
            flex: 3,
            child: Center(
              child: _ClockFaceRenderer(state: state, isLandscape: true),
            ),
          ),
          const SizedBox(width: 20),

          // Sağ Bölüm: Kontroller, Ders Rozeti ve Sınav Sayacı
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Durum Rozetleri
                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: state.isBreak
                              ? colorScheme.secondaryContainer
                              : colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          state.isBreak ? 'KISA MOLA' : 'ODAK ZAMANI',
                          style: textTheme.labelSmall?.copyWith(
                            color: state.isBreak
                                ? colorScheme.onSecondaryContainer
                                : colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '📚 ${state.selectedLesson}',
                          style: textTheme.labelSmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.tertiaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '⏳ KPSS: ${state.examTarget.remainingDays()} Gün',
                          style: textTheme.labelSmall?.copyWith(
                            color: colorScheme.onTertiaryContainer,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),

                  // Saat Tasarımı Seçici (Halka / Flip / Zen)
                  Row(
                    children: PomodoroClockStyle.values.map((style) {
                      final isSelected = state.clockStyle == style;
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: ChoiceChip(
                            label: Text(
                              style == PomodoroClockStyle.ring
                                  ? 'Halka'
                                  : (style == PomodoroClockStyle.flip
                                        ? 'Flip'
                                        : 'Zen'),
                            ),
                            selected: isSelected,
                            onSelected: (_) => notifier.selectClockStyle(style),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 14),

                  // Başlat / Duraklat Butonu
                  FilledButton.icon(
                    onPressed: () => notifier.startPause(),
                    icon: PhosphorIcon(
                      state.isRunning
                          ? PhosphorIconsBold.pause
                          : PhosphorIconsBold.play,
                      size: 18,
                    ),
                    label: Text(
                      state.isRunning ? 'Duraklat' : 'Odaklanmayı Başlat',
                      style: textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Sıfırla ve Dikey Görünüme Dön
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => notifier.reset(),
                          icon: const PhosphorIcon(
                            PhosphorIconsBold.arrowCounterClockwise,
                            size: 16,
                          ),
                          label: const Text('Sıfırla'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: onToggleOrientation,
                          icon: const PhosphorIcon(
                            PhosphorIconsBold.deviceMobileCamera,
                            size: 16,
                          ),
                          label: const Text('Dikey Mod'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 🕒 Sekme 0: Pomodoro Stüdyosu Dikey İçerik Listesi
class _PomodoroStudioTab extends ConsumerWidget {
  final PomodoroState state;
  final VoidCallback onToggleOrientation;
  final VoidCallback onGoToCountdownTab;

  const _PomodoroStudioTab({
    required this.state,
    required this.onToggleOrientation,
    required this.onGoToCountdownTab,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final notifier = ref.read(pomodoroProvider.notifier);

    final remaining = state.examTarget.remainingTime();

    return ListView(
      padding: AppSpacing.pagePadding(context),
      children: [
        // 1. Üst Kompakt KPSS Geri Sayım Şeridi
        TactileCard(
          onTap: onGoToCountdownTab,
          backgroundColor: colorScheme.surfaceContainerHighest.withAlpha(90),
          borderColor: colorScheme.primary.withAlpha(60),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: PhosphorIcon(
                  PhosphorIconsBold.hourglassMedium,
                  size: 16,
                  color: colorScheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.examTarget.title,
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '${remaining.inDays} Gün · ${remaining.inHours % 24} Saat · ${remaining.inMinutes % 60} Dk kaldı',
                      style: textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              PhosphorIcon(
                PhosphorIconsBold.caretRight,
                size: 16,
                color: colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
        AppSpacing.gapSm,

        // 2. Saat Tasarımı Seçici (3 Tasarım Seçeneği)
        Row(
          children: PomodoroClockStyle.values.map((style) {
            final isSelected = state.clockStyle == style;
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: ChoiceChip(
                  label: Text(style.label),
                  selected: isSelected,
                  onSelected: (_) => notifier.selectClockStyle(style),
                ),
              ),
            );
          }).toList(),
        ),
        AppSpacing.gapSm,

        // 3. Ana Saat Sahnesi (TactileCard)
        TactileCard(
          backgroundColor: colorScheme.surface,
          borderColor: state.isBreak
              ? colorScheme.secondary.withAlpha(120)
              : colorScheme.primary.withAlpha(100),
          child: Column(
            children: [
              // Üst: Odaklanma / Mola Durum Butonları ve Ders Seçici
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(3),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _PhasePill(
                          label: 'Odak',
                          isActive: !state.isBreak,
                          activeColor: colorScheme.primary,
                          activeTextColor: colorScheme.onPrimary,
                          onTap: () => notifier.switchPhase(false),
                        ),
                        _PhasePill(
                          label: 'Mola',
                          isActive: state.isBreak,
                          activeColor: colorScheme.secondary,
                          activeTextColor: colorScheme.onSecondary,
                          onTap: () => notifier.switchPhase(true),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton<String>(
                    initialValue: state.selectedLesson,
                    onSelected: (lesson) => notifier.selectLesson(lesson),
                    itemBuilder: (context) =>
                        [
                              'Tarih',
                              'Coğrafya',
                              'Vatandaşlık',
                              'Güncel Bilgiler',
                              'Genel Tekrar',
                            ]
                            .map((l) => PopupMenuItem(value: l, child: Text(l)))
                            .toList(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PhosphorIcon(
                            PhosphorIconsBold.bookBookmark,
                            size: 14,
                            color: colorScheme.onPrimaryContainer,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            state.selectedLesson,
                            style: textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onPrimaryContainer,
                            ),
                          ),
                          const SizedBox(width: 3),
                          PhosphorIcon(
                            PhosphorIconsBold.caretDown,
                            size: 12,
                            color: colorScheme.onPrimaryContainer,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // Ortadaki Saat Tasarımı
              _ClockFaceRenderer(state: state, isLandscape: false),
              const SizedBox(height: 18),

              // Alttaki Kontrol Butonları
              Row(
                children: [
                  IconButton.filledTonal(
                    onPressed: () => notifier.reset(),
                    tooltip: 'Sıfırla',
                    icon: const PhosphorIcon(
                      PhosphorIconsBold.arrowCounterClockwise,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: () => notifier.startPause(),
                      icon: PhosphorIcon(
                        state.isRunning
                            ? PhosphorIconsBold.pause
                            : PhosphorIconsBold.play,
                        size: 20,
                      ),
                      label: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          state.isRunning ? 'Duraklat' : 'Odaklanmayı Başlat',
                          style: textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton.filledTonal(
                    onPressed: onToggleOrientation,
                    tooltip: 'Yatay Masa Saati',
                    icon: const PhosphorIcon(
                      PhosphorIconsBold.deviceRotate,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        AppSpacing.gapMd,

        // 4. Süre Şablonları (Presets)
        const SectionTitle('Çalışma Şablonları'),
        Row(
          children: PomodoroPreset.values.map((preset) {
            final isSelected = state.preset == preset;
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: OutlinedButton(
                  onPressed: () => notifier.selectPreset(preset),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: isSelected
                        ? colorScheme.primaryContainer
                        : colorScheme.surface,
                    side: BorderSide(
                      color: isSelected
                          ? colorScheme.primary
                          : colorScheme.outlineVariant,
                      width: isSelected ? 1.8 : 1,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 10,
                    ),
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      preset.label,
                      style: textTheme.labelSmall?.copyWith(
                        fontWeight: isSelected
                            ? FontWeight.w800
                            : FontWeight.w600,
                        color: isSelected
                            ? colorScheme.onPrimaryContainer
                            : colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        AppSpacing.gapMd,

        // 5. Bugünkü Odak İstatistiği Kartı (YPT Tarzı)
        const SectionTitle('Bugünkü Odak İstatistiği'),
        TactileCard(
          backgroundColor: colorScheme.surface,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: _MetricColumn(
                      label: 'Tamamlanan Oturum',
                      value: '${state.completedSessionsToday}',
                      unit: 'Oturum',
                      icon: PhosphorIconsFill.checkCircle,
                      color: colorScheme.secondary,
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 1,
                    color: colorScheme.outlineVariant,
                  ),
                  Expanded(
                    child: _MetricColumn(
                      label: 'Toplam Odak Süresi',
                      value: '${state.totalFocusMinutesToday}',
                      unit: 'Dakika',
                      icon: PhosphorIconsFill.timer,
                      color: colorScheme.primary,
                    ),
                  ),
                ],
              ),
              if (state.lessonFocusMinutes.isNotEmpty) ...[
                const Divider(height: 24),
                Text(
                  'Ders Dağılımı (Bugün)',
                  style: textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: state.lessonFocusMinutes.entries.map((entry) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '${entry.key}: ${entry.value} dk',
                        style: textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

/// 📅 Sekme 1: Sınav Geri Sayımı İçerik Sayfası
class _ExamCountdownTab extends ConsumerWidget {
  final KpssExamTarget target;
  final VoidCallback onStartPomodoro;

  const _ExamCountdownTab({
    required this.target,
    required this.onStartPomodoro,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final notifier = ref.read(pomodoroProvider.notifier);

    final remaining = target.remainingTime();
    final progress = target.progressRatio();

    final days = remaining.inDays;
    final hours = remaining.inHours % 24;
    final minutes = remaining.inMinutes % 60;
    final seconds = remaining.inSeconds % 60;

    return ListView(
      padding: AppSpacing.pagePadding(context),
      children: [
        // 1. Sınav Türü Seçici
        SegmentedButton<KpssExamTarget>(
          segments: const [
            ButtonSegment(value: KpssExamTarget.lisans, label: Text('Lisans')),
            ButtonSegment(
              value: KpssExamTarget.onlisans,
              label: Text('Önlisans'),
            ),
            ButtonSegment(
              value: KpssExamTarget.ortaogretim,
              label: Text('Ortaöğretim'),
            ),
          ],
          selected: {target},
          onSelectionChanged: (selected) {
            notifier.selectExamTarget(selected.first);
          },
        ),
        AppSpacing.gapMd,

        // Sınav Başlığı ve Tarihi Bilgi Rozeti
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer.withAlpha(90),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: colorScheme.primary.withAlpha(60)),
          ),
          child: Row(
            children: [
              PhosphorIcon(
                PhosphorIconsDuotone.calendarCheck,
                color: colorScheme.primary,
                size: 24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      target.title,
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Sınav Tarihi: ${target.examDate.day}.${target.examDate.month}.${target.examDate.year} - 10:15',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        AppSpacing.gapMd,

        // 2. Canlı 4'lü Geri Sayım Panosu (GÜN · SAAT · DAKİKA · SANİYE)
        Row(
          children: [
            Expanded(
              child: _CountdownDigitBox(
                label: 'GÜN',
                value: '$days',
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _CountdownDigitBox(
                label: 'SAAT',
                value: hours.toString().padLeft(2, '0'),
                color: colorScheme.secondary,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _CountdownDigitBox(
                label: 'DAKİKA',
                value: minutes.toString().padLeft(2, '0'),
                color: colorScheme.tertiary,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _CountdownDigitBox(
                label: 'SANİYE',
                value: seconds.toString().padLeft(2, '0'),
                color: colorScheme.error,
              ),
            ),
          ],
        ),
        AppSpacing.gapMd,

        // 3. Hazırlık Maratonu İlerleme Kartı
        TactileCard(
          backgroundColor: colorScheme.surface,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Hazırlık Maratonu',
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '%${(progress * 100).toStringAsFixed(1)} Geride Kaldı',
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 8,
                  backgroundColor: colorScheme.surfaceContainerHighest,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Kalan Süre: Yaklaşık ${(days / 7).floor()} hafta ($days gün). Her gün düzenli pratik netlerini zirveye taşıyacak.',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        AppSpacing.gapMd,

        // 4. Koç Tuğrul'dan Taktik & Pomodoro Başlat Aksiyonu
        TactileCard(
          backgroundColor: colorScheme.surfaceContainerHighest.withAlpha(80),
          borderColor: colorScheme.primary.withAlpha(60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      shape: BoxShape.circle,
                    ),
                    child: PhosphorIcon(
                      PhosphorIconsFill.lightning,
                      color: colorScheme.primary,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Kadro Koçu Taktik Önerisi',
                      style: textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Sınav günü masaya oturduğunda 65 dakikalık Genel Kültür kondisyonuna alışkın olmak için her gün en az iki Pomodoro oturumu tamamla!',
                style: textTheme.bodySmall,
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: onStartPomodoro,
                  icon: const PhosphorIcon(PhosphorIconsBold.timer, size: 18),
                  label: const Text('Hemen Pomodoro Başlat'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// 🎨 3 Farklı Saat Tasarımını Oluşturan Merkezi Render Bileşeni
class _ClockFaceRenderer extends StatelessWidget {
  final PomodoroState state;
  final bool isLandscape;

  const _ClockFaceRenderer({required this.state, required this.isLandscape});

  @override
  Widget build(BuildContext context) {
    switch (state.clockStyle) {
      case PomodoroClockStyle.ring:
        return _RingClockView(state: state, isLandscape: isLandscape);
      case PomodoroClockStyle.flip:
        return _FlipClockView(state: state, isLandscape: isLandscape);
      case PomodoroClockStyle.zen:
        return _ZenClockView(state: state, isLandscape: isLandscape);
    }
  }
}

/// 1️⃣ Akademik Halka Saat Tasarımı
class _RingClockView extends StatelessWidget {
  final PomodoroState state;
  final bool isLandscape;

  const _RingClockView({required this.state, required this.isLandscape});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final size = isLandscape ? 170.0 : 190.0;

    final ringColor = state.isBreak
        ? colorScheme.secondary
        : colorScheme.primary;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: state.progress,
              strokeWidth: 10,
              backgroundColor: colorScheme.surfaceContainerHighest,
              color: ringColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    state.formattedTime,
                    style: textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
                Text(
                  state.isBreak ? 'KISA MOLA' : state.selectedLesson,
                  style: textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: ringColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 2️⃣ Retro Masa Saati (Flip Clock) Tasarımı
class _FlipClockView extends StatelessWidget {
  final PomodoroState state;
  final bool isLandscape;

  const _FlipClockView({required this.state, required this.isLandscape});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _FlipDigitCard(
          value: state.formattedMinutes,
          label: 'DAKİKA',
          isLandscape: isLandscape,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            ':',
            style: textTheme.displayLarge?.copyWith(
              fontWeight: FontWeight.w900,
              color: state.isBreak
                  ? colorScheme.secondary
                  : colorScheme.primary,
            ),
          ),
        ),
        _FlipDigitCard(
          value: state.formattedSeconds,
          label: 'SANİYE',
          isLandscape: isLandscape,
        ),
      ],
    );
  }
}

/// Flip Saat Yaprağı Bileşeni (Ortadan menteşe çizgili yapraklı kart)
class _FlipDigitCard extends StatelessWidget {
  final String value;
  final String label;
  final bool isLandscape;

  const _FlipDigitCard({
    required this.value,
    required this.label,
    required this.isLandscape,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final cardWidth = isLandscape ? 95.0 : 105.0;
    final cardHeight = isLandscape ? 95.0 : 105.0;

    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: colorScheme.outlineVariant.withAlpha(120),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            offset: const Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Rakam içeriği (AnimatedSwitcher ile akıcı yaprak geçişi)
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            transitionBuilder: (child, anim) {
              return ScaleTransition(scale: anim, child: child);
            },
            child: FittedBox(
              key: ValueKey<String>(value),
              fit: BoxFit.scaleDown,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  value,
                  style: textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                    letterSpacing: -1,
                  ),
                ),
              ),
            ),
          ),
          // Ortadaki yatay yaprak ayrım / menteşe çizgisi
          Positioned(
            left: 0,
            right: 0,
            child: Divider(
              height: 1,
              thickness: 1.2,
              color: colorScheme.outline.withAlpha(120),
            ),
          ),
          // Alt Açıklama Etiketi (DAKİKA / SANİYE)
          Positioned(
            bottom: 4,
            child: Text(
              label,
              style: textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: colorScheme.onSurfaceVariant.withAlpha(160),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 3️⃣ Minimal Zen Saat Tasarımı
class _ZenClockView extends StatelessWidget {
  final PomodoroState state;
  final bool isLandscape;

  const _ZenClockView({required this.state, required this.isLandscape});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            state.formattedTime,
            style: textTheme.displayLarge?.copyWith(
              fontWeight: FontWeight.w900,
              letterSpacing: -1,
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: isLandscape ? 180 : 220,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: state.progress,
              minHeight: 4,
              backgroundColor: colorScheme.surfaceContainerHighest,
              color: state.isBreak
                  ? colorScheme.secondary
                  : colorScheme.primary,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          state.isBreak
              ? 'Mola zihnini tazeler, biraz su iç ve nefes al.'
              : 'Her 25 dakikalık odak, sınavda 1 net demektir.',
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

/// Odak / Mola Durum Geçiş Hapı
class _PhasePill extends StatelessWidget {
  final String label;
  final bool isActive;
  final Color activeColor;
  final Color activeTextColor;
  final VoidCallback onTap;

  const _PhasePill({
    required this.label,
    required this.isActive,
    required this.activeColor,
    required this.activeTextColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
          color: isActive ? activeColor : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: textTheme.labelSmall?.copyWith(
            color: isActive ? activeTextColor : null,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

/// Canlı 4'lü Sınav Geri Sayım Kutusu (GÜN / SAAT / DAKİKA / SANİYE)
class _CountdownDigitBox extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _CountdownDigitBox({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withAlpha(90), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: color.withAlpha(30),
            offset: const Offset(0, 3),
            blurRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.w900,
                color: color,
              ),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

/// İstatistik Metrik Kolonu
class _MetricColumn extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final IconData icon;
  final Color color;

  const _MetricColumn({
    required this.label,
    required this.value,
    required this.unit,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            PhosphorIcon(icon, size: 16, color: color),
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                label,
                style: textTheme.labelSmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              value,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
                color: color,
              ),
            ),
            const SizedBox(width: 4),
            Text(unit, style: textTheme.bodySmall),
          ],
        ),
      ],
    );
  }
}
