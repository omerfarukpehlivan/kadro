import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Uygulama genelinde onay, uyarı ve bilgi diyaloglarını tek tasarımda
/// birleştiren ortak modal bileşeni (`TASK-153`).
///
/// Web/Angular Karşılığı: `ConfirmDialogService.confirm(...)` /
/// `MatDialog<ConfirmDialogComponent>` sarmalayıcısı.
class KadroConfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  final IconData? icon;
  final Color? iconColor;
  final Widget? extraContent;
  final String confirmLabel;
  final String? cancelLabel;
  final bool isDestructive;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;

  const KadroConfirmDialog({
    super.key,
    required this.title,
    required this.message,
    this.icon,
    this.iconColor,
    this.extraContent,
    this.confirmLabel = 'Onayla',
    this.cancelLabel,
    this.isDestructive = false,
    required this.onConfirm,
    this.onCancel,
  });

  /// Kullanıcıdan evet/hayır onayı isteyen standart onay penceresi açar.
  static Future<bool> confirm(
    BuildContext context, {
    required String title,
    required String message,
    String confirmLabel = 'Onayla',
    String cancelLabel = 'Vazgeç',
    IconData? icon,
    Color? iconColor,
    Widget? extraContent,
    bool isDestructive = false,
    bool barrierDismissible = true,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (dialogCtx) => PopScope(
        canPop: barrierDismissible,
        child: KadroConfirmDialog(
          title: title,
          message: message,
          icon: icon,
          iconColor: iconColor,
          extraContent: extraContent,
          confirmLabel: confirmLabel,
          cancelLabel: cancelLabel,
          isDestructive: isDestructive,
          onCancel: () => Navigator.of(dialogCtx).pop(false),
          onConfirm: () => Navigator.of(dialogCtx).pop(true),
        ),
      ),
    );
    return result ?? false;
  }

  /// Kullanıcıyı bilgilendiren ve opsiyonel ikinci aksiyon sunan uyarı penceresi açar.
  static Future<void> alert(
    BuildContext context, {
    required String title,
    required String message,
    String buttonLabel = 'Tamam',
    String? secondaryButtonLabel,
    VoidCallback? onSecondaryPressed,
    IconData? icon,
    Color? iconColor,
    Widget? extraContent,
    bool barrierDismissible = true,
  }) {
    final hasSecondaryAction =
        secondaryButtonLabel != null && onSecondaryPressed != null;

    return showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (dialogCtx) => PopScope(
        canPop: barrierDismissible,
        child: KadroConfirmDialog(
          title: title,
          message: message,
          icon: icon,
          iconColor: iconColor,
          extraContent: extraContent,
          confirmLabel: hasSecondaryAction ? secondaryButtonLabel : buttonLabel,
          cancelLabel: hasSecondaryAction ? buttonLabel : null,
          onCancel: hasSecondaryAction
              ? () => Navigator.of(dialogCtx).pop()
              : null,
          onConfirm: () {
            Navigator.of(dialogCtx).pop();
            if (hasSecondaryAction) {
              onSecondaryPressed();
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final resolvedIconColor =
        iconColor ?? (isDestructive ? colorScheme.error : colorScheme.primary);

    return AlertDialog(
      backgroundColor: colorScheme.surface,
      surfaceTintColor: colorScheme.surface.withAlpha(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: colorScheme.outlineVariant, width: 1.5),
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) ...[
            PhosphorIcon(icon!, size: 22, color: resolvedIconColor),
            const SizedBox(width: 10),
          ],
          Expanded(
            child: Text(
              title,
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              message,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                height: 1.45,
              ),
            ),
            if (extraContent != null) ...[
              const SizedBox(height: 14),
              extraContent!,
            ],
          ],
        ),
      ),
      actions: [
        if (cancelLabel != null)
          TextButton(onPressed: onCancel, child: Text(cancelLabel!)),
        FilledButton(
          style: isDestructive
              ? FilledButton.styleFrom(
                  backgroundColor: colorScheme.error,
                  foregroundColor: colorScheme.onError,
                )
              : null,
          onPressed: onConfirm,
          child: Text(confirmLabel),
        ),
      ],
    );
  }
}
