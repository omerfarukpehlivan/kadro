import 'package:flutter/material.dart';
import 'package:kadro/core/constants/kpss_study_tips.dart';
import 'package:kadro/shared/widgets/adaptive_overlay.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Tuğrul (Anadolu Kartalı) maskotunun 12 bağlamsal karakter sahnesi.
///
/// Web/Angular karşılığı: Her çalışma moduna göre değişen `MascotCharacterMood` enum'u.
enum TugrulMood {
  coach,
  victory,
  detective,
  pro,
  history,
  geography,
  citizenship,
  current,
  practice,
  exam,
  analyst,
  streak,
}

extension TugrulMoodExtension on TugrulMood {
  String get assetPath {
    switch (this) {
      case TugrulMood.coach:
        return 'assets/images/mascot/tugrul_coach.png';
      case TugrulMood.victory:
        return 'assets/images/mascot/tugrul_victory.png';
      case TugrulMood.detective:
        return 'assets/images/mascot/tugrul_detective.png';
      case TugrulMood.pro:
        return 'assets/images/mascot/tugrul_pro.png';
      case TugrulMood.history:
        return 'assets/images/mascot/tugrul_history.png';
      case TugrulMood.geography:
        return 'assets/images/mascot/tugrul_geography.png';
      case TugrulMood.citizenship:
        return 'assets/images/mascot/tugrul_citizenship.png';
      case TugrulMood.current:
        return 'assets/images/mascot/tugrul_current.png';
      case TugrulMood.practice:
        return 'assets/images/mascot/tugrul_practice.png';
      case TugrulMood.exam:
        return 'assets/images/mascot/tugrul_exam.png';
      case TugrulMood.analyst:
        return 'assets/images/mascot/tugrul_analyst.png';
      case TugrulMood.streak:
        return 'assets/images/mascot/tugrul_streak.png';
    }
  }

  StudyTipCategory get studyCategory {
    switch (this) {
      case TugrulMood.coach:
        return StudyTipCategory.home;
      case TugrulMood.victory:
        return StudyTipCategory.victory;
      case TugrulMood.detective:
        return StudyTipCategory.mistakes;
      case TugrulMood.pro:
        return StudyTipCategory.pro;
      case TugrulMood.history:
        return StudyTipCategory.history;
      case TugrulMood.geography:
        return StudyTipCategory.geography;
      case TugrulMood.citizenship:
        return StudyTipCategory.citizenship;
      case TugrulMood.current:
        return StudyTipCategory.current;
      case TugrulMood.practice:
        return StudyTipCategory.practice;
      case TugrulMood.exam:
        return StudyTipCategory.exams;
      case TugrulMood.analyst:
        return StudyTipCategory.stats;
      case TugrulMood.streak:
        return StudyTipCategory.streak;
    }
  }

  Color accentColor(ColorScheme scheme) {
    switch (this) {
      case TugrulMood.coach:
      case TugrulMood.citizenship:
      case TugrulMood.exam:
        return scheme.primary;
      case TugrulMood.geography:
      case TugrulMood.analyst:
        return scheme.secondary;
      case TugrulMood.victory:
      case TugrulMood.pro:
      case TugrulMood.history:
      case TugrulMood.streak:
        return scheme.tertiary;
      case TugrulMood.detective:
      case TugrulMood.current:
      case TugrulMood.practice:
        return scheme.primary;
    }
  }

  /// KPSS ders adını ilgili kostümlü Tuğrul karakterine eşler.
  static TugrulMood fromLesson(String? lesson) {
    final normalized = (lesson ?? '').toLowerCase().trim();
    if (normalized.contains('tarih')) return TugrulMood.history;
    if (normalized.contains('coğrafya') || normalized.contains('cografya')) {
      return TugrulMood.geography;
    }
    if (normalized.contains('vatandaşlık') ||
        normalized.contains('vatandaslik')) {
      return TugrulMood.citizenship;
    }
    if (normalized.contains('güncel') || normalized.contains('guncel')) {
      return TugrulMood.current;
    }
    return TugrulMood.coach;
  }
}

/// Tuğrul görsellerini kare dış arka planını temizleyip dairesel madalyon olarak
/// sahneye yerleştiren karakter avatar bileşeni.
///
/// Görsel çevresindeki açık mavi/gri dış kenarlık [ClipOval] + hafif [Transform.scale]
/// ile kesilir ve marka çerçevesiyle kart/sahne yüzeyine organik biçimde kaynaşır.
///
/// Web/Angular karşılığı: Dekoratif modda `aria-hidden="true"`, tıklanabilir modda
/// odak halkalı `<button aria-label="...">MascotBadgeComponent</button>`.
class TugrulAvatar extends StatelessWidget {
  final TugrulMood mood;
  final double size;
  final Color? ringColor;
  final double ringWidth;
  final bool hasShadow;
  final VoidCallback? onTap;
  final String? tooltip;

  const TugrulAvatar({
    super.key,
    required this.mood,
    this.size = 64,
    this.ringColor,
    this.ringWidth = 2.5,
    this.hasShadow = true,
    this.onTap,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final effectiveRing = ringColor ?? mood.accentColor(colorScheme);

    final image = ClipOval(
      child: Transform.scale(
        scale: 1.09,
        child: Image.asset(
          mood.assetPath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Center(
            child: PhosphorIcon(
              PhosphorIconsFill.bird,
              size: size * 0.45,
              color: effectiveRing,
            ),
          ),
        ),
      ),
    );

    if (onTap == null) {
      return ExcludeSemantics(
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colorScheme.primaryContainer,
            border: Border.all(color: effectiveRing, width: ringWidth),
            boxShadow: hasShadow
                ? [
                    BoxShadow(
                      color: effectiveRing.withAlpha(90),
                      offset: const Offset(0, 3),
                      blurRadius: 0,
                    ),
                  ]
                : null,
          ),
          padding: const EdgeInsets.all(2),
          child: image,
        ),
      );
    }

    return _InteractiveTugrulAvatar(
      size: size,
      effectiveRing: effectiveRing,
      ringWidth: ringWidth,
      hasShadow: hasShadow,
      onTap: onTap!,
      tooltip: tooltip,
      child: ExcludeSemantics(child: image),
    );
  }
}

class _InteractiveTugrulAvatar extends StatefulWidget {
  final double size;
  final Color effectiveRing;
  final double ringWidth;
  final bool hasShadow;
  final VoidCallback onTap;
  final String? tooltip;
  final Widget child;

  const _InteractiveTugrulAvatar({
    required this.size,
    required this.effectiveRing,
    required this.ringWidth,
    required this.hasShadow,
    required this.onTap,
    required this.tooltip,
    required this.child,
  });

  @override
  State<_InteractiveTugrulAvatar> createState() =>
      _InteractiveTugrulAvatarState();
}

class _InteractiveTugrulAvatarState extends State<_InteractiveTugrulAvatar> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final accessibleLabel = widget.tooltip ?? 'Tuğrul çalışma ipuçlarını aç';

    Widget medallion = Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colorScheme.primaryContainer,
        border: Border.all(
          color: widget.effectiveRing,
          width: widget.ringWidth,
        ),
        boxShadow: widget.hasShadow
            ? [
                BoxShadow(
                  color: widget.effectiveRing.withAlpha(90),
                  offset: const Offset(0, 3),
                  blurRadius: 0,
                ),
              ]
            : null,
      ),
      padding: const EdgeInsets.all(2),
      child: widget.child,
    );

    medallion = Semantics(
      button: true,
      label: accessibleLabel,
      child: Material(
        color: colorScheme.surface.withAlpha(0),
        shape: const CircleBorder(),
        child: InkWell(
          onTap: widget.onTap,
          customBorder: const CircleBorder(),
          child: medallion,
        ),
      ),
    );

    if (widget.tooltip != null) {
      return Tooltip(message: widget.tooltip!, child: medallion);
    }
    return medallion;
  }
}

/// Tuğrul eşliğinde KPSS çalışma ipuçlarını sunan kaydırılabilir alt çekmece.
class TugrulTipsSheet {
  TugrulTipsSheet._();

  static Future<void> show(
    BuildContext context, {
    required TugrulMood mood,
    StudyTipCategory? categoryOverride,
  }) {
    final category = categoryOverride ?? mood.studyCategory;
    final tips = category.tips;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AdaptiveOverlay.showModal<void>(
      context: context,
      title: category.sheetTitle,
      preferSideDrawerOnDesktop: true,
      showMobileHeader: true,
      showCloseButton: false,
      builder: (ctx) => SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  TugrulAvatar(
                    mood: mood,
                    size: 54,
                    hasShadow: false,
                    ringWidth: 2,
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tuğrul ile KPSS Çalışma Özeti',
                          style: theme.textTheme.titleSmall?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              for (var i = 0; i < tips.length; i++) ...[
                if (i > 0) const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: colorScheme.outlineVariant),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '${i + 1}',
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          tips[i],
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
