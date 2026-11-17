import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/auth/data/auth_notifier.dart';
import 'package:kadro/features/auth/presentation/auth_screen.dart';
import 'package:kadro/features/flashcards/presentation/flashcards_screen.dart';
import 'package:kadro/features/mistakes/presentation/mistakes_screen.dart';
import 'package:kadro/features/quiz/data/models/quiz_result.dart';
import 'package:kadro/features/quiz/presentation/widgets/victory_story_card.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Test tamamlandığında Tuğrul kutlama sahnesi ve net karnesini gösteren ekran.
class QuizResultScreen extends StatefulWidget {
  final QuizResult result;
  final String? testTitle;

  const QuizResultScreen({super.key, required this.result, this.testTitle});

  @override
  State<QuizResultScreen> createState() => _QuizResultScreenState();
}

class _QuizResultScreenState extends State<QuizResultScreen> {
  bool _guestPromptShown = false;

  QuizResult get result => widget.result;
  String? get testTitle => widget.testTitle;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _maybeShowGuestSaveWarning(),
    );
  }

  void _maybeShowGuestSaveWarning() {
    if (!mounted || _guestPromptShown) return;

    final ProviderContainer container;
    try {
      container = ProviderScope.containerOf(context, listen: false);
    } catch (_) {
      return;
    }

    if (container.read(authProvider).isAuthenticated) return;
    _guestPromptShown = true;

    showDialog<void>(
      context: context,
      builder: (dialogContext) => _GuestSaveWarningDialog(
        onLoginPressed: () {
          Navigator.of(dialogContext).pop();
          final router = GoRouter.maybeOf(context);
          if (router != null) {
            router.push('/auth');
          } else {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const AuthScreen()));
          }
        },
        onContinuePressed: () => Navigator.of(dialogContext).pop(),
      ),
    );
  }

  void _showShareModal(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: colorScheme.surface.withAlpha(0),
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 24,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 320,
                    maxHeight: 540,
                  ),
                  child: AspectRatio(
                    aspectRatio: 9 / 16,
                    child: VictoryStoryCard(
                      result: result,
                      testTitle: testTitle,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: () async {
                    await Clipboard.setData(
                      ClipboardData(
                        text:
                            'Kadro KPSS Genel Kültür testimde ${result.net} net yaptım (%${result.successRate} başarı). https://kadro.app',
                      ),
                    );
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Sonuç metni panoya kopyalandı. İstediğin yerde paylaşabilirsin.',
                          ),
                        ),
                      );
                    }
                  },
                  icon: const PhosphorIcon(PhosphorIconsRegular.copy, size: 16),
                  label: const Text('Skorumu & Metni Kopyala'),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: const Text('Kapat'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isStrongResult = result.successRate >= 60;
    final mood = isStrongResult ? TugrulMood.victory : TugrulMood.coach;
    final isSplitPane = ResponsiveBreakpoints.usesSplitPane(context);

    final heroRow = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TugrulAvatar(
          mood: mood,
          size: 62,
          ringColor: isStrongResult
              ? colorScheme.tertiary
              : colorScheme.primary,
          tooltip: 'Karne & Tekrar Notları',
          onTap: () => TugrulTipsSheet.show(context, mood: TugrulMood.victory),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Test Tamamlandı!',
                style: textTheme.headlineSmall?.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                result.successRate >= 70
                    ? 'Güçlü bir performans çıkardın; yanlışlarını inceleyebilirsin.'
                    : 'Yanlış yaptığın sorular Yanlış Defteri listesine eklendi.',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );

    final statSummaryRow = Row(
      children: [
        Expanded(
          child: _ResultStatItem(
            label: 'Doğru',
            count: result.correctCount,
            icon: PhosphorIconsFill.checkCircle,
            color: colorScheme.secondary,
          ),
        ),
        AppSpacing.gapHorizontalXs,
        Expanded(
          child: _ResultStatItem(
            label: 'Yanlış',
            count: result.wrongCount,
            icon: PhosphorIconsFill.xCircle,
            color: colorScheme.error,
          ),
        ),
        AppSpacing.gapHorizontalXs,
        Expanded(
          child: _ResultStatItem(
            label: 'Boş',
            count: result.emptyCount,
            icon: PhosphorIconsFill.question,
            color: colorScheme.outline,
          ),
        ),
      ],
    );

    final actionButtons = <Widget>[
      FilledButton.tonalIcon(
        onPressed: () => _showShareModal(context),
        icon: const PhosphorIcon(PhosphorIconsRegular.shareNetwork, size: 18),
        label: const Text('Sonucu Paylaş'),
      ),
      const SizedBox(height: 8),
      if (result.wrongCount > 0) ...[
        FilledButton.icon(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const MistakesScreen()),
            );
          },
          icon: const PhosphorIcon(
            PhosphorIconsRegular.bookmarkSimple,
            size: 18,
          ),
          label: Text('Yanlış Defterine Git (${result.wrongCount} Yanlış)'),
        ),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const PhosphorIcon(PhosphorIconsRegular.house, size: 18),
          label: const Text('Ana Sayfaya Dön'),
        ),
      ] else ...[
        FilledButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const PhosphorIcon(PhosphorIconsRegular.house, size: 18),
          label: const Text('Ana Sayfaya Dön'),
        ),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const FlashcardsScreen()),
            );
          },
          icon: const PhosphorIcon(PhosphorIconsRegular.cards, size: 18),
          label: const Text('Bilgi Kartlarıyla Hızlı Tekrar'),
        ),
      ],
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Sonucu'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: isSplitPane
            ? ResponsiveContentWrapper(
                maxWidth: 1200,
                padding: EdgeInsets.zero,
                child: Scrollbar(
                  child: SingleChildScrollView(
                    padding: AppSpacing.pagePadding(context),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              heroRow,
                              AppSpacing.gapMd,
                              _NetScoreCard(result: result),
                              AppSpacing.gapSm,
                              statSummaryRow,
                              AppSpacing.gapMd,
                              ...actionButtons,
                            ],
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          flex: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              if (result.hasLessonBreakdown) ...[
                                _LessonBreakdownReportCard(
                                  lessonBreakdown: result.lessonBreakdown!,
                                ),
                                AppSpacing.gapMd,
                              ],
                              TactileCard(
                                backgroundColor:
                                    colorScheme.surfaceContainerLow,
                                borderColor: colorScheme.outlineVariant,
                                padding: const EdgeInsets.all(18),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      children: [
                                        PhosphorIcon(
                                          isStrongResult
                                              ? PhosphorIconsFill.sparkle
                                              : PhosphorIconsFill.target,
                                          size: 20,
                                          color: isStrongResult
                                              ? colorScheme.secondary
                                              : colorScheme.primary,
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            isStrongResult
                                                ? 'Sonraki Adım Önerisi'
                                                : 'Hızlı Toparlanma Planı',
                                            style: textTheme.titleSmall
                                                ?.copyWith(
                                                  color: colorScheme.onSurface,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      result.wrongCount > 0
                                          ? 'Bu oturumda ${result.wrongCount} yanlış ve ${result.emptyCount} boş soru oluştu. Yanlış Defteri üzerinden hatalı sorularını hemen tekrar çözerek net kaybını kalıcı kazanca çevirebilirsin.'
                                          : 'Harika gidiyorsun! Sıfır hatayla tamamladığın bu oturumu Bilgi Kartları ile pekiştirerek kalıcılığı artırabilirsin.',
                                      style: textTheme.bodySmall?.copyWith(
                                        color: colorScheme.onSurfaceVariant,
                                        height: 1.45,
                                      ),
                                    ),
                                    const SizedBox(height: 14),
                                    OutlinedButton.icon(
                                      onPressed: () => _showShareModal(context),
                                      icon: const PhosphorIcon(
                                        PhosphorIconsRegular.trophy,
                                        size: 16,
                                      ),
                                      label: const Text(
                                        'Zafer Karnesini Görüntüle',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : ResponsiveContentWrapper(
                maxWidth: 720,
                padding: EdgeInsets.zero,
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  children: [
                    heroRow,
                    const SizedBox(height: 12),
                    _NetScoreCard(result: result),
                    const SizedBox(height: 8),
                    statSummaryRow,
                    const SizedBox(height: 10),
                    if (result.hasLessonBreakdown) ...[
                      _LessonBreakdownReportCard(
                        lessonBreakdown: result.lessonBreakdown!,
                      ),
                      const SizedBox(height: 10),
                    ],
                    ...actionButtons,
                    const SizedBox(height: 10),
                  ],
                ),
              ),
      ),
    );
  }
}

class _NetScoreCard extends StatelessWidget {
  final QuizResult result;

  const _NetScoreCard({required this.result});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TactileCard(
      backgroundColor: colorScheme.primaryContainer,
      borderColor: colorScheme.primary.withAlpha(130),
      lipColor: colorScheme.primary.withAlpha(160),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Net Puanın',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  result.net.toStringAsFixed(2),
                  style: theme.textTheme.displayMedium?.copyWith(
                    color: colorScheme.primary,
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: colorScheme.primary.withAlpha(90),
                width: 1.2,
              ),
            ),
            child: Text(
              '%${result.successRate} Başarı',
              style: theme.textTheme.labelLarge?.copyWith(
                color: colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ResultStatItem extends StatelessWidget {
  final String label;
  final int count;
  final IconData icon;
  final Color color;

  const _ResultStatItem({
    required this.label,
    required this.count,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TactileCard(
      backgroundColor: theme.colorScheme.surface,
      borderColor: color.withAlpha(80),
      lipColor: color.withAlpha(90),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PhosphorIcon(icon, color: color, size: 18),
          const SizedBox(height: 4),
          Text(
            '$count',
            style: theme.textTheme.titleLarge?.copyWith(
              color: color,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _LessonBreakdownReportCard extends StatelessWidget {
  final Map<String, LessonResult> lessonBreakdown;

  const _LessonBreakdownReportCard({required this.lessonBreakdown});

  IconData _getLessonIcon(String lesson) {
    if (lesson == 'Tarih') return PhosphorIconsRegular.scroll;
    if (lesson == 'Coğrafya') return PhosphorIconsRegular.compass;
    if (lesson == 'Vatandaşlık') return PhosphorIconsRegular.scales;
    return PhosphorIconsRegular.newspaperClipping;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TactileCard(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              PhosphorIcon(
                PhosphorIconsFill.chartBar,
                size: 18,
                color: colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Ders Bazlı Net Karnesi',
                  style: theme.textTheme.titleSmall,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'ÖSYM Standardı',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 8),
          ...lessonBreakdown.values.map((item) {
            final netFormatted = item.net.toStringAsFixed(2);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      PhosphorIcon(
                        _getLessonIcon(item.lesson),
                        size: 16,
                        color: colorScheme.primary,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          '${item.lesson} (${item.totalQuestions} Soru)',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        '$netFormatted Net',
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: item.net >= (item.totalQuestions * 0.7)
                              ? colorScheme.secondary
                              : item.net >= (item.totalQuestions * 0.4)
                              ? colorScheme.primary
                              : colorScheme.error,
                          fontFeatures: const [FontFeature.tabularFigures()],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: item.totalQuestions > 0
                                ? (item.correctCount / item.totalQuestions)
                                      .clamp(0.0, 1.0)
                                : 0.0,
                            minHeight: 6,
                            backgroundColor:
                                colorScheme.surfaceContainerHighest,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              item.net >= (item.totalQuestions * 0.7)
                                  ? colorScheme.secondary
                                  : colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '${item.correctCount}D  ${item.wrongCount}Y  ${item.emptyCount}B',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

/// Misafir kullanıcı testi bitirdiğinde ilerleme kaydı için açılan bilgilendirme popup'ı.
class _GuestSaveWarningDialog extends StatelessWidget {
  final VoidCallback onLoginPressed;
  final VoidCallback onContinuePressed;

  const _GuestSaveWarningDialog({
    required this.onLoginPressed,
    required this.onContinuePressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: colorScheme.tertiaryContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: PhosphorIcon(
                        PhosphorIconsFill.cloudWarning,
                        color: colorScheme.onTertiaryContainer,
                        size: 22,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'İlerlemeniz Kaydedilmiyor',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Text(
                'Giriş yapmazsanız ilerlemeniz kaydedilemez. Şimdi giriş yapmak istemezseniz dilediğiniz zaman Profil sekmesinden giriş yapabilirsiniz.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: onLoginPressed,
                child: const Text('Giriş Yap / Kayıt Ol'),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: onContinuePressed,
                child: const Text('Şimdilik Devam Et'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
