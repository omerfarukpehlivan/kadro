import 'package:flutter/material.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Mobilde alt çekmece (`showModalBottomSheet`), Web/Masaüstü ekranlarda (`>= 900px`)
/// ortalanmış dialog veya sağdan açılan `SideDrawer` açan adaptif overlay yardımcısı (`TASK-147`).
///
/// Angular/Web karşılığı: Breakpoint'e göre `MatBottomSheet` veya `MatDialog` / `Drawer` açan servis.
class AdaptiveOverlay {
  AdaptiveOverlay._();

  /// Ekran genişliğine uygun modal sunumunu açar.
  static Future<T?> showModal<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    String? title,
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
        builder: builder,
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
                        _DesktopOverlayHeader(
                          title: title,
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
                _DesktopOverlayHeader(
                  title: title,
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

class _DesktopOverlayHeader extends StatelessWidget {
  final String title;
  final ColorScheme colorScheme;
  final TextTheme textTheme;
  final VoidCallback onClose;

  const _DesktopOverlayHeader({
    required this.title,
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
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          IconButton(
            tooltip: 'Kapat (Esc)',
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
