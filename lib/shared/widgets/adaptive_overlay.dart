import 'package:flutter/material.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Telefonlarda alt çekmece (`showModalBottomSheet`), büyük tabletlerde (`>= 900px`)
/// ortalanmış dialog veya sağdan açılan `SideDrawer` açan adaptif overlay yardımcısı (`TASK-153`).
///
/// Angular/Web karşılığı: Breakpoint'e göre `MatBottomSheet` veya `MatDialog` / `Drawer` açan servis.
class AdaptiveOverlay {
  AdaptiveOverlay._();

  /// Ekran genişliğine uygun modal sunumunu açar.
  static Future<T?> showModal<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    String? title,
    String? subtitle,
    IconData? headerIcon,
    Color? headerIconColor,
    bool showMobileHeader = false,
    bool showCloseButton = true,
    double dialogMaxWidth = 640,
    bool preferSideDrawerOnDesktop = false,
    double sideDrawerWidth = 420,
    bool transparentSheetBackground = false,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (!ResponsiveBreakpoints.usesDialogOverlay(context)) {
      return showModalBottomSheet<T>(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        clipBehavior: Clip.antiAlias,
        backgroundColor: transparentSheetBackground
            ? colorScheme.surface.withAlpha(0)
            : colorScheme.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (sheetCtx) {
          final bottomInset = MediaQuery.viewInsetsOf(sheetCtx).bottom;
          final body = !showMobileHeader
              ? Builder(builder: builder)
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _MobileSheetHeader(
                      title: title,
                      subtitle: subtitle,
                      icon: headerIcon,
                      iconColor: headerIconColor,
                      showCloseButton: showCloseButton,
                      onClose: () => Navigator.of(sheetCtx).pop(),
                    ),
                    Flexible(child: Builder(builder: builder)),
                  ],
                );
          // Klavye boşluğu yalnızca burada bir kez uygulanır; içerikteki eski
          // `viewInsets.bottom` dolgularının ikinci kez eklenmemesi için alt
          // ağaçtan bu değer silinir (çift boşluk hatası önlenir).
          return Padding(
            padding: EdgeInsets.only(bottom: bottomInset),
            child: MediaQuery.removeViewInsets(
              context: sheetCtx,
              removeBottom: true,
              child: body,
            ),
          );
        },
      );
    }

    if (preferSideDrawerOnDesktop) {
      final disableAnimations = MediaQuery.disableAnimationsOf(context);
      return showGeneralDialog<T>(
        context: context,
        barrierDismissible: true,
        barrierLabel: title ?? 'Paneli kapat',
        barrierColor: colorScheme.scrim.withAlpha(110),
        transitionDuration: disableAnimations
            ? Duration.zero
            : const Duration(milliseconds: 180),
        pageBuilder: (dialogCtx, animation, secondaryAnimation) {
          return SafeArea(
            child: Align(
              alignment: Alignment.centerRight,
              child: Material(
                color: colorScheme.surface,
                child: Container(
                  width: sideDrawerWidth,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    border: Border(
                      left: BorderSide(
                        color: colorScheme.outlineVariant,
                        width: 1.5,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (title != null)
                        _TabletOverlayHeader(
                          title: title,
                          subtitle: subtitle,
                          icon: headerIcon,
                          iconColor: headerIconColor,
                          showCloseButton: showCloseButton,
                          colorScheme: colorScheme,
                          textTheme: textTheme,
                          onClose: () => Navigator.of(dialogCtx).pop(),
                        ),
                      Expanded(child: Builder(builder: builder)),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          if (disableAnimations) return child;
          final offset = Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));
          return SlideTransition(position: offset, child: child);
        },
      );
    }

    return showDialog<T>(
      context: context,
      builder: (dialogCtx) => Dialog(
        backgroundColor: colorScheme.surface,
        insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: colorScheme.outlineVariant, width: 1.5),
        ),
        clipBehavior: Clip.antiAlias,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: dialogMaxWidth,
            maxHeight: MediaQuery.sizeOf(dialogCtx).height * 0.86,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (title != null)
                _TabletOverlayHeader(
                  title: title,
                  subtitle: subtitle,
                  icon: headerIcon,
                  iconColor: headerIconColor,
                  showCloseButton: showCloseButton,
                  colorScheme: colorScheme,
                  textTheme: textTheme,
                  onClose: () => Navigator.of(dialogCtx).pop(),
                ),
              Flexible(child: Builder(builder: builder)),
            ],
          ),
        ),
      ),
    );
  }
}

/// Alt çekmece (`BottomSheet`) üstünde yer alan standart 36x4 tutamaç çubuğu (`TASK-153`).
class KadroSheetHandle extends StatelessWidget {
  const KadroSheetHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 36,
        height: 4,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.outlineVariant,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}

class _MobileSheetHeader extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final IconData? icon;
  final Color? iconColor;
  final bool showCloseButton;
  final VoidCallback onClose;

  const _MobileSheetHeader({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.showCloseButton,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(20, 12, 12, title != null ? 8 : 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const KadroSheetHandle(),
          if (title != null) ...[
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  PhosphorIcon(
                    icon!,
                    size: 20,
                    color: iconColor ?? colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title!,
                        style: textTheme.titleMedium?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      if (subtitle != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          subtitle!,
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                if (showCloseButton)
                  IconButton(
                    tooltip: 'Kapat',
                    onPressed: onClose,
                    icon: PhosphorIcon(
                      PhosphorIconsBold.x,
                      size: 18,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _TabletOverlayHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final Color? iconColor;
  final bool showCloseButton;
  final ColorScheme colorScheme;
  final TextTheme textTheme;
  final VoidCallback onClose;

  const _TabletOverlayHeader({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.showCloseButton,
    required this.colorScheme,
    required this.textTheme,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 14, 12, 12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        border: Border(
          bottom: BorderSide(color: colorScheme.outlineVariant, width: 1.5),
        ),
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            PhosphorIcon(
              icon!,
              size: 20,
              color: iconColor ?? colorScheme.primary,
            ),
            const SizedBox(width: 10),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (showCloseButton)
            IconButton(
              tooltip: 'Kapat',
              onPressed: onClose,
              icon: PhosphorIcon(
                PhosphorIconsRegular.x,
                size: 18,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
        ],
      ),
    );
  }
}
