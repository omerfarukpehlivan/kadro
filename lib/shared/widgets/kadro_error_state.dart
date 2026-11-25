import 'package:flutter/material.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Ağ veya sunucu kaynaklı hata durumlarında Tuğrul maskotu ve "Tekrar Dene"
/// düğmesiyle tutarlı geri bildirim sunan ortak durum bileşeni (`TASK-181`).
///
/// Görsel dili [EmptyStateView] ile aynı hiyerarşi ve boşlukları paylaşır.
///
/// Angular/Web Karşılığı: `ErrorState` bileşeni (`onRetry` callback'li).
class KadroErrorState extends StatelessWidget {
  final TugrulMood mascotMood;
  final String title;
  final String description;
  final String retryLabel;
  final VoidCallback? onRetry;
  final String? secondaryActionLabel;
  final VoidCallback? onSecondaryAction;

  const KadroErrorState({
    super.key,
    this.mascotMood = TugrulMood.detective,
    required this.title,
    required this.description,
    this.retryLabel = 'Tekrar Dene',
    this.onRetry,
    this.secondaryActionLabel,
    this.onSecondaryAction,
  });

  /// İnternet/ağ bağlantısı kesildiğinde kullanılan hazır hata durumu.
  const KadroErrorState.network({
    super.key,
    this.mascotMood = TugrulMood.coach,
    this.title = 'Bağlantı Kurulamadı',
    this.description = 'İnternet bağlantını kontrol edip tekrar dener misin?',
    this.retryLabel = 'Tekrar Dene',
    this.onRetry,
    this.secondaryActionLabel,
    this.onSecondaryAction,
  });

  /// Genel veya beklenmeyen sunucu/veri hataları için hazır hata durumu.
  const KadroErrorState.generic({
    super.key,
    this.mascotMood = TugrulMood.detective,
    this.title = 'Bir Sorun Oluştu',
    this.description = 'İçerik yüklenirken beklenmeyen bir hata meydana geldi. Lütfen tekrar dene.',
    this.retryLabel = 'Tekrar Dene',
    this.onRetry,
    this.secondaryActionLabel,
    this.onSecondaryAction,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TugrulAvatar(mood: mascotMood, size: 96),
            const SizedBox(height: 18),
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineSmall?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 20),
              FilledButton.icon(
                onPressed: onRetry,
                style: FilledButton.styleFrom(minimumSize: const Size(160, 48)),
                icon: const PhosphorIcon(
                  PhosphorIconsRegular.arrowClockwise,
                  size: 18,
                ),
                label: Text(retryLabel),
              ),
            ],
            if (secondaryActionLabel != null && onSecondaryAction != null) ...[
              const SizedBox(height: 10),
              TextButton(
                onPressed: onSecondaryAction,
                style: TextButton.styleFrom(minimumSize: const Size(120, 48)),
                child: Text(secondaryActionLabel!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
