import 'package:flutter/material.dart';
import 'package:kadro/features/planner/data/services/auto_study_program_generator.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Haftalık 7 günlük (`Pzt–Paz`) görsel çalışma & dinlenme takvimi (`TASK-159`).
///
/// Masaüstünde 7 sütunlu tam genişlik, mobilde `Wrap` ile 2 satırlı taşma-güvenli
/// görünüm sunar; [onToggleWeekday] verildiğinde çalışma/dinlenme günleri etkileşimli seçilir.
class WeeklyPlannerCalendarGrid extends StatelessWidget {
  final List<WeeklyPlanDayPreview> days;
  final ValueChanged<int>? onToggleWeekday;
  final int? highlightedWeekday;
  final String title;

  const WeeklyPlannerCalendarGrid({
    super.key,
    required this.days,
    this.onToggleWeekday,
    this.highlightedWeekday,
    this.title = 'Haftalık Görsel Takvim',
  });

  Color _accentFor(WeeklyActivityKind kind, ColorScheme colorScheme) {
    switch (kind) {
      case WeeklyActivityKind.quiz:
        return colorScheme.primary;
      case WeeklyActivityKind.review:
        return colorScheme.secondary;
      case WeeklyActivityKind.sprintExam:
        return colorScheme.tertiary;
      case WeeklyActivityKind.rest:
        return colorScheme.outline;
    }
  }

  IconData _iconFor(WeeklyActivityKind kind) {
    switch (kind) {
      case WeeklyActivityKind.quiz:
        return PhosphorIconsFill.pencilSimple;
      case WeeklyActivityKind.review:
        return PhosphorIconsFill.repeat;
      case WeeklyActivityKind.sprintExam:
        return PhosphorIconsFill.lightning;
      case WeeklyActivityKind.rest:
        return PhosphorIconsRegular.coffee;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final activeWeekday = highlightedWeekday ?? DateTime.now().weekday;

    return TactileCard(
      padding: const EdgeInsets.all(14),
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.outlineVariant,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 4,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PhosphorIcon(
                    PhosphorIconsRegular.calendarDots,
                    size: 16,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      title,
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              if (onToggleWeekday != null)
                Text(
                  'Güne dokunarak dinlenme günü seçebilirsin',
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 10),
          LayoutBuilder(
            builder: (context, constraints) {
              final useSingleRow = constraints.maxWidth >= 540;
              if (useSingleRow) {
                return Row(
                  children: [
                    for (var i = 0; i < days.length; i++) ...[
                      if (i > 0) const SizedBox(width: 6),
                      Expanded(
                        child: _DayCalendarTile(
                          day: days[i],
                          isToday: days[i].weekday == activeWeekday,
                          accentColor: _accentFor(
                            days[i].primaryKind,
                            colorScheme,
                          ),
                          icon: _iconFor(days[i].primaryKind),
                          onTap: onToggleWeekday != null
                              ? () => onToggleWeekday!(days[i].weekday)
                              : null,
                        ),
                      ),
                    ],
                  ],
                );
              }

              final tileWidth = ((constraints.maxWidth - 24) / 4).clamp(
                64.0,
                140.0,
              );
              return Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final day in days)
                    SizedBox(
                      width: tileWidth,
                      child: _DayCalendarTile(
                        day: day,
                        isToday: day.weekday == activeWeekday,
                        accentColor: _accentFor(day.primaryKind, colorScheme),
                        icon: _iconFor(day.primaryKind),
                        onTap: onToggleWeekday != null
                            ? () => onToggleWeekday!(day.weekday)
                            : null,
                      ),
                    ),
                ],
              );
            },
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 12,
            runSpacing: 4,
            children: [
              _LegendDot(label: 'Konu Testi', color: colorScheme.primary),
              _LegendDot(
                label: 'Tekrar / Harita',
                color: colorScheme.secondary,
              ),
              _LegendDot(label: 'Deneme / Sprint', color: colorScheme.tertiary),
              _LegendDot(label: 'Dinlenme', color: colorScheme.outline),
            ],
          ),
        ],
      ),
    );
  }
}

class _DayCalendarTile extends StatelessWidget {
  final WeeklyPlanDayPreview day;
  final bool isToday;
  final Color accentColor;
  final IconData icon;
  final VoidCallback? onTap;

  const _DayCalendarTile({
    required this.day,
    required this.isToday,
    required this.accentColor,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final bgColor = day.isRestDay
        ? colorScheme.surfaceContainerLow
        : Color.alphaBlend(accentColor.withAlpha(24), colorScheme.surface);
    final borderColor = isToday
        ? accentColor
        : (day.isRestDay
              ? colorScheme.outlineVariant
              : accentColor.withAlpha(95));

    final cardContent = Container(
      key: ValueKey('weekly_calendar_day_${day.weekday}'),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor, width: isToday ? 1.8 : 1.2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            day.shortLabel,
            style: textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: day.isRestDay
                  ? colorScheme.onSurfaceVariant
                  : colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          PhosphorIcon(icon, size: 15, color: accentColor),
          const SizedBox(height: 4),
          Text(
            day.isRestDay ? 'Mola' : '${day.estimatedMinutes} dk',
            style: textTheme.labelSmall?.copyWith(
              color: day.isRestDay ? colorScheme.onSurfaceVariant : accentColor,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );

    if (onTap == null) return cardContent;
    return Tooltip(
      message: day.focusSummary,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: cardContent,
      ),
    );
  }
}

class _LegendDot extends StatelessWidget {
  final String label;
  final Color color;

  const _LegendDot({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall
              ?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
        ),
      ],
    );
  }
}
