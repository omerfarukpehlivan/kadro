import 'package:flutter/material.dart';
import 'package:kadro/shared/widgets/adaptive_overlay.dart';
import 'package:kadro/shared/widgets/kadro_badge.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// [KadroOptionPickerModal] içindeki tek bir seçim satırının veri modeli.
@immutable
class KadroPickerOption<T> {
  final T value;
  final String label;
  final String? description;
  final IconData? icon;
  final IconData? selectedIcon;
  final Key? key;

  const KadroPickerOption({
    required this.value,
    required this.label,
    this.description,
    this.icon,
    this.selectedIcon,
    this.key,
  });
}

/// Düz `SimpleDialog` yerine dokunsal kart + radyo göstergeli tekli seçim
/// sunan ortak modal bileşeni (`TASK-153`).
///
/// Web/Angular Karşılığı: `AdaptiveOverlay` içinde açılan dokunsal
/// `RadioCardGroupModal<T>` bileşeni.
class KadroOptionPickerModal<T> extends StatelessWidget {
  final List<KadroPickerOption<T>> options;
  final T selectedValue;
  final String? subtitle;
  final Widget? footer;
  final ValueChanged<T> onSelected;

  const KadroOptionPickerModal({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onSelected,
    this.subtitle,
    this.footer,
  });

  /// Seçenek listesini telefonlarda alt çekmece, tabletlerde ortalanmış
  /// diyalog olarak açar ve seçilen değeri döndürür.
  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    required List<KadroPickerOption<T>> options,
    required T selectedValue,
    String? subtitle,
    WidgetBuilder? footerBuilder,
    double dialogMaxWidth = 480,
  }) {
    return AdaptiveOverlay.showModal<T>(
      context: context,
      title: title,
      dialogMaxWidth: dialogMaxWidth,
      showMobileHeader: true,
      builder: (modalCtx) => KadroOptionPickerModal<T>(
        options: options,
        selectedValue: selectedValue,
        subtitle: subtitle,
        footer: footerBuilder?.call(modalCtx),
        onSelected: (value) => Navigator.of(modalCtx).pop<T>(value),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (subtitle != null) ...[
            Text(
              subtitle!,
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 14),
          ],
          for (var i = 0; i < options.length; i++) ...[
            if (i > 0) const SizedBox(height: 10),
            _PickerOptionCard<T>(
              option: options[i],
              isSelected: options[i].value == selectedValue,
              onTap: () => onSelected(options[i].value),
            ),
          ],
          if (footer != null) ...[const Divider(height: 24), footer!],
        ],
      ),
    );
  }
}

class _PickerOptionCard<T> extends StatelessWidget {
  final KadroPickerOption<T> option;
  final bool isSelected;
  final VoidCallback onTap;

  const _PickerOptionCard({
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final resolvedIcon = isSelected
        ? (option.selectedIcon ?? option.icon)
        : option.icon;

    return Semantics(
      button: true,
      selected: isSelected,
      label: option.description != null
          ? '${option.label}. ${option.description}'
          : option.label,
      child: TactileCard(
        key: option.key,
        onTap: onTap,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        backgroundColor: isSelected
            ? Color.alphaBlend(
                colorScheme.primaryContainer.withAlpha(110),
                colorScheme.surface,
              )
            : colorScheme.surface,
        borderColor: isSelected
            ? colorScheme.primary
            : colorScheme.outlineVariant,
        borderWidth: isSelected ? 2.0 : 1.5,
        lipColor: isSelected ? colorScheme.primary : colorScheme.outlineVariant,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (resolvedIcon != null) ...[
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: isSelected
                      ? colorScheme.primaryContainer
                      : colorScheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isSelected
                        ? colorScheme.primary.withAlpha(90)
                        : colorScheme.outlineVariant,
                  ),
                ),
                alignment: Alignment.center,
                child: PhosphorIcon(
                  resolvedIcon,
                  size: 19,
                  color: isSelected
                      ? colorScheme.primary
                      : colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 6,
                    runSpacing: 4,
                    children: [
                      Text(
                        option.label,
                        style: textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: isSelected
                              ? colorScheme.primary
                              : colorScheme.onSurface,
                        ),
                      ),
                      if (isSelected)
                        const KadroBadge(
                          label: 'Seçili',
                          tone: KadroBadgeTone.solidPrimary,
                          padding: EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 2,
                          ),
                          borderRadius: 6,
                        ),
                    ],
                  ),
                  if (option.description != null) ...[
                    const SizedBox(height: 3),
                    Text(
                      option.description!,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 10),
            if (isSelected)
              PhosphorIcon(
                PhosphorIconsFill.checkCircle,
                color: colorScheme.primary,
                size: 22,
              )
            else
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: colorScheme.outline, width: 1.8),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
