import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Proje genelinde tek tip açılır liste (Dropdown) seçimi sunan ortak bileşen.
///
/// Angular/Web karşılığı: Stilize edilmiş `<mat-select>` / `<select>` bileşenidir.
/// Form içi tam genişlikte alan (`KadroDropdown`) ve kart başlıkları için
/// kompakt hap (`KadroDropdown.compact`) varyantlarını tek çekirdek mantıkta sunar.
class KadroDropdown<T> extends StatefulWidget {
  final T? value;
  final List<T> items;
  final String Function(T item) itemLabelBuilder;
  final ValueChanged<T> onChanged;
  final Key? dropdownKey;
  final Key Function(T item)? itemKeyBuilder;
  final IconData? leadingIcon;
  final String? label;
  final String? hint;
  final bool alignEnd;
  final bool enabled;
  final bool isCompact;

  const KadroDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.itemLabelBuilder,
    required this.onChanged,
    this.dropdownKey,
    this.itemKeyBuilder,
    this.leadingIcon,
    this.label,
    this.hint,
    this.alignEnd = false,
    this.enabled = true,
  }) : isCompact = false;

  /// Kart başlıkları ve satır içi filtreler için kompakt hap dropdown varyantı.
  const KadroDropdown.compact({
    super.key,
    required this.value,
    required this.items,
    required this.itemLabelBuilder,
    required this.onChanged,
    this.dropdownKey,
    this.itemKeyBuilder,
    this.leadingIcon,
    this.hint,
    this.enabled = true,
  }) : label = null,
       alignEnd = false,
       isCompact = true;

  @override
  State<KadroDropdown<T>> createState() => _KadroDropdownState<T>();
}

class _KadroDropdownState<T> extends State<KadroDropdown<T>> {
  bool _isHovered = false;
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final disableAnimations = MediaQuery.disableAnimationsOf(context);
    final interactive = widget.enabled && widget.items.isNotEmpty;

    final alignment = widget.alignEnd
        ? AlignmentDirectional.centerEnd
        : AlignmentDirectional.centerStart;

    final TextStyle? selectedStyle = widget.isCompact
        ? textTheme.labelSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: colorScheme.onPrimaryContainer,
          )
        : (widget.alignEnd || widget.label != null)
        ? textTheme.labelLarge?.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.w700,
          )
        : textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          );

    final dropdownButton = DropdownButtonHideUnderline(
      child: DropdownButton<T>(
        key: widget.dropdownKey,
        value: widget.value,
        isDense: true,
        isExpanded: !widget.isCompact,
        alignment: alignment,
        borderRadius: BorderRadius.circular(12),
        dropdownColor: colorScheme.surface,
        focusColor: colorScheme.primary.withAlpha(18),
        onTap: interactive ? () {} : null,
        hint: widget.hint != null
            ? Text(
                widget.hint!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              )
            : null,
        icon: Padding(
          padding: EdgeInsets.only(left: widget.isCompact ? 4 : 6),
          child: PhosphorIcon(
            widget.isCompact
                ? PhosphorIconsBold.caretDown
                : PhosphorIconsRegular.caretDown,
            size: widget.isCompact ? 12 : 16,
            color: widget.isCompact
                ? colorScheme.onPrimaryContainer
                : colorScheme.primary,
          ),
        ),
        selectedItemBuilder: (ctx) => widget.items
            .map(
              (item) => Align(
                alignment: alignment,
                child: Text(
                  widget.itemLabelBuilder(item),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: selectedStyle,
                ),
              ),
            )
            .toList(growable: false),
        items: widget.items
            .map((item) {
              final isCurrent = item == widget.value;
              final label = widget.itemLabelBuilder(item);
              final style = textTheme.bodyMedium?.copyWith(
                color: isCurrent ? colorScheme.primary : colorScheme.onSurface,
                fontWeight: isCurrent ? FontWeight.w700 : FontWeight.w500,
              );
              return DropdownMenuItem<T>(
                key: widget.itemKeyBuilder?.call(item),
                value: item,
                child: widget.isCompact
                    ? Text(
                        label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: style,
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: Text(
                              label,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: style,
                            ),
                          ),
                          if (isCurrent) ...[
                            const SizedBox(width: 8),
                            PhosphorIcon(
                              PhosphorIconsBold.check,
                              size: 15,
                              color: colorScheme.primary,
                            ),
                          ],
                        ],
                      ),
              );
            })
            .toList(growable: false),
        onChanged: interactive
            ? (next) {
                if (next != null) {
                  widget.onChanged(next);
                }
              }
            : null,
      ),
    );

    final Color containerBg = widget.isCompact
        ? colorScheme.primaryContainer
        : colorScheme.surfaceContainerLow;
    final Color borderColor = _isFocused
        ? colorScheme.primary
        : _isHovered && interactive
        ? colorScheme.primary.withAlpha(150)
        : widget.isCompact
        ? colorScheme.primaryContainer
        : colorScheme.outlineVariant;

    final box = Focus(
      skipTraversal: true,
      onFocusChange: (focused) {
        if (_isFocused != focused) {
          setState(() => _isFocused = focused);
        }
      },
      child: MouseRegion(
        cursor: interactive
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        onEnter: (_) {
          if (!_isHovered) setState(() => _isHovered = true);
        },
        onExit: (_) {
          if (_isHovered) setState(() => _isHovered = false);
        },
        child: AnimatedContainer(
          duration: disableAnimations
              ? Duration.zero
              : const Duration(milliseconds: 120),
          padding: widget.isCompact
              ? const EdgeInsets.symmetric(horizontal: 10, vertical: 5)
              : const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: containerBg,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: borderColor,
              width: _isFocused ? 2.0 : 1.5,
            ),
          ),
          child: Row(
            mainAxisSize: widget.isCompact
                ? MainAxisSize.min
                : MainAxisSize.max,
            children: [
              if (widget.leadingIcon != null) ...[
                PhosphorIcon(
                  widget.leadingIcon!,
                  size: widget.isCompact ? 14 : 18,
                  color: widget.isCompact
                      ? colorScheme.onPrimaryContainer
                      : colorScheme.primary,
                ),
                SizedBox(width: widget.isCompact ? 5 : 8),
              ],
              if (widget.isCompact)
                Flexible(child: dropdownButton)
              else
                Expanded(child: dropdownButton),
            ],
          ),
        ),
      ),
    );

    if (widget.label == null || widget.isCompact) {
      return box;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.label!,
          style: textTheme.labelMedium?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        box,
      ],
    );
  }
}
