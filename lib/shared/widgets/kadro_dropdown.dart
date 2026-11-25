import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Proje genelinde tek tip açılır liste (Dropdown) seçimi sunan ortak bileşen.
///
/// Angular/Web karşılığı: Stilize edilmiş `<mat-select>` / `<select>` bileşenidir.
/// Form içi tam genişlikte alan (`KadroDropdown`) ve kart başlıkları için
/// kompakt hap (`KadroDropdown.compact`) varyantlarını tek çekirdek mantıkta sunar.
/// Açılır liste butonun üzerinde değil, doğrudan altında yukarıdan aşağıya
/// yumuşak bir animasyonla açılır.
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

  /// Seçeneğin kilitli/devre dışı olup olmadığını belirler (`TASK-179`).
  final bool Function(T item)? isItemDisabled;

  /// Kilitli bir seçeneğe basıldığında `onChanged` yerine tetiklenen geri çağırım.
  final ValueChanged<T>? onDisabledItemTap;

  /// Açılır liste satırının sağ tarafına ek rozet/ikon yerleştirmek için opsiyonel oluşturucu.
  final Widget? Function(T item, bool isCurrent, bool isDisabled)?
  itemTrailingBuilder;

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
    this.isItemDisabled,
    this.onDisabledItemTap,
    this.itemTrailingBuilder,
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
    this.isItemDisabled,
    this.onDisabledItemTap,
    this.itemTrailingBuilder,
  }) : label = null,
       alignEnd = false,
       isCompact = true;

  @override
  State<KadroDropdown<T>> createState() => _KadroDropdownState<T>();
}

class _KadroDropdownState<T> extends State<KadroDropdown<T>>
    with SingleTickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  final GlobalKey _triggerKey = GlobalKey();

  late final AnimationController _animController;
  late final Animation<double> _expandAnimation;

  OverlayEntry? _overlayEntry;
  bool _isFocused = false;
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 170),
      reverseDuration: const Duration(milliseconds: 120),
    );
    _expandAnimation = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    );
  }

  @override
  void didUpdateWidget(covariant KadroDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.enabled && _isOpen) {
      _removeOverlay();
    } else if (_isOpen) {
      _overlayEntry?.markNeedsBuild();
    }
  }

  @override
  void dispose() {
    _removeOverlay();
    _animController.dispose();
    super.dispose();
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _isOpen = false;
  }

  void _toggleMenu() {
    if (_isOpen) {
      _closeMenu();
    } else {
      _openMenu();
    }
  }

  void _closeMenu({bool immediate = false}) {
    if (!_isOpen) return;
    setState(() => _isOpen = false);

    final disableAnimations =
        immediate || (mounted && MediaQuery.disableAnimationsOf(context));
    if (disableAnimations) {
      _animController.value = 0;
      _overlayEntry?.remove();
      _overlayEntry = null;
      return;
    }

    _animController.reverse().then((_) {
      if (!mounted || _isOpen) return;
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  void _openMenu() {
    final renderObject = _triggerKey.currentContext?.findRenderObject();
    if (renderObject is! RenderBox) return;

    final overlayState = Overlay.of(context, rootOverlay: true);
    final triggerSize = renderObject.size;
    final triggerOffset = renderObject.localToGlobal(Offset.zero);
    final media = MediaQuery.of(context);
    final screenHeight = media.size.height;
    final screenWidth = media.size.width;

    final spaceBelow =
        screenHeight -
        (triggerOffset.dy + triggerSize.height) -
        media.padding.bottom -
        12;
    final spaceAbove = triggerOffset.dy - media.padding.top - 12;

    final openAbove = spaceBelow < 150 && spaceAbove > spaceBelow;
    final availableHeight = openAbove ? spaceAbove : spaceBelow;
    final maxMenuHeight = math.min(280.0, math.max(120.0, availableHeight));
    final menuWidth = widget.isCompact
        ? math.min(screenWidth - 24, math.max(triggerSize.width, 190.0))
        : triggerSize.width;

    setState(() => _isOpen = true);

    _overlayEntry = OverlayEntry(
      builder: (overlayContext) {
        final theme = Theme.of(overlayContext);
        final colorScheme = theme.colorScheme;
        final textTheme = theme.textTheme;

        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: _closeMenu,
              ),
            ),
            CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              targetAnchor: openAbove
                  ? Alignment.topLeft
                  : Alignment.bottomLeft,
              followerAnchor: openAbove
                  ? Alignment.bottomLeft
                  : Alignment.topLeft,
              offset: Offset(0, openAbove ? -6 : 6),
              child: Material(
                color: colorScheme.surface.withAlpha(0),
                child: FadeTransition(
                  opacity: _expandAnimation,
                  child: SizeTransition(
                    sizeFactor: _expandAnimation,
                    axis: Axis.vertical,
                    alignment: openAbove
                        ? Alignment.bottomCenter
                        : Alignment.topCenter,
                    child: Container(
                      width: menuWidth,
                      constraints: BoxConstraints(maxHeight: maxMenuHeight),
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: colorScheme.outlineVariant,
                          width: 1.5,
                        ),
                        // MASTER.md: bulanık drop-shadow yerine keskin 3px
                        // fiziksel alt dudak (`blurRadius: 0`).
                        boxShadow: [
                          BoxShadow(
                            color: colorScheme.outlineVariant,
                            blurRadius: 0,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: widget.items
                              .map((item) {
                                final isDisabled =
                                    widget.isItemDisabled?.call(item) ?? false;
                                final isCurrent =
                                    !isDisabled && item == widget.value;
                                final itemLabel = widget.itemLabelBuilder(item);
                                final itemStyle = textTheme.bodyMedium
                                    ?.copyWith(
                                      color: isDisabled
                                          ? colorScheme.onSurfaceVariant
                                          : isCurrent
                                          ? colorScheme.primary
                                          : colorScheme.onSurface,
                                      fontWeight: isCurrent
                                          ? FontWeight.w700
                                          : FontWeight.w500,
                                    );
                                final customTrailing = widget
                                    .itemTrailingBuilder
                                    ?.call(item, isCurrent, isDisabled);

                                return InkWell(
                                  key: widget.itemKeyBuilder?.call(item),
                                  onTap: () {
                                    _closeMenu(immediate: true);
                                    if (isDisabled) {
                                      widget.onDisabledItemTap?.call(item);
                                      return;
                                    }
                                    widget.onChanged(item);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                      vertical: 10,
                                    ),
                                    color: isCurrent
                                        ? colorScheme.primaryContainer
                                              .withAlpha(70)
                                        : isDisabled
                                        ? colorScheme.surfaceContainerLow
                                        : null,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            itemLabel,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: itemStyle,
                                          ),
                                        ),
                                        if (customTrailing != null) ...[
                                          const SizedBox(width: 8),
                                          customTrailing,
                                        ] else if (isCurrent) ...[
                                          const SizedBox(width: 8),
                                          PhosphorIcon(
                                            PhosphorIconsBold.check,
                                            size: 15,
                                            color: colorScheme.primary,
                                          ),
                                        ] else if (isDisabled) ...[
                                          const SizedBox(width: 8),
                                          PhosphorIcon(
                                            PhosphorIconsRegular.lock,
                                            size: 15,
                                            color: colorScheme.onSurfaceVariant,
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                );
                              })
                              .toList(growable: false),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    overlayState.insert(_overlayEntry!);
    if (MediaQuery.disableAnimationsOf(context)) {
      _animController.value = 1.0;
    } else {
      _animController.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final disableAnimations = MediaQuery.disableAnimationsOf(context);
    final interactive = widget.enabled && widget.items.isNotEmpty;

    final hasValue = widget.value != null;
    final displayText = hasValue
        ? widget.itemLabelBuilder(widget.value as T)
        : (widget.hint ?? '');

    final TextStyle? selectedStyle = !hasValue
        ? textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant)
        : widget.isCompact
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

    final Color containerBg = widget.isCompact
        ? colorScheme.primaryContainer
        : colorScheme.surfaceContainerLow;
    final Color borderColor = (_isFocused || _isOpen)
        ? colorScheme.primary
        : widget.isCompact
        ? colorScheme.primaryContainer
        : colorScheme.outlineVariant;

    final triggerBox = CompositedTransformTarget(
      link: _layerLink,
      child: Focus(
        onFocusChange: (focused) {
          if (_isFocused != focused) {
            setState(() => _isFocused = focused);
          }
        },
        child: Material(
          color: colorScheme.surface.withAlpha(0),
          child: InkWell(
            key: widget.dropdownKey,
            onTap: interactive ? _toggleMenu : null,
            borderRadius: BorderRadius.circular(12),
            child: AnimatedContainer(
              key: _triggerKey,
              duration: disableAnimations
                  ? Duration.zero
                  : const Duration(milliseconds: 120),
              padding: widget.isCompact
                  ? const EdgeInsets.symmetric(horizontal: 10, vertical: 6)
                  : const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
              decoration: BoxDecoration(
                color: containerBg,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: borderColor,
                  width: (_isFocused || _isOpen) ? 2.0 : 1.5,
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
                    Flexible(
                      child: Text(
                        displayText,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: selectedStyle,
                      ),
                    )
                  else
                    Expanded(
                      child: Align(
                        alignment: widget.alignEnd
                            ? AlignmentDirectional.centerEnd
                            : AlignmentDirectional.centerStart,
                        child: Text(
                          displayText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: selectedStyle,
                        ),
                      ),
                    ),
                  SizedBox(width: widget.isCompact ? 4 : 8),
                  AnimatedRotation(
                    turns: _isOpen ? 0.5 : 0.0,
                    duration: disableAnimations
                        ? Duration.zero
                        : const Duration(milliseconds: 160),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );

    if (widget.label == null || widget.isCompact) {
      return triggerBox;
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
        triggerBox,
      ],
    );
  }
}
