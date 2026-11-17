import 'package:flutter/material.dart';
import 'package:kadro/core/config/app_remote_config.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

/// Kullanıcı eski bir sürümde olduğunda açılan modern güncelleme diyaloğu (TASK-94).
///
/// [isForced] = true ise kullanıcı diyaloğu kapatamaz; Google Play'e gitmek zorundadır.
/// [isForced] = false ise opsiyonel güncelleme olarak 'Daha Sonra' seçeneği sunulur.
class ForceUpdateDialog extends StatelessWidget {
  final AppRemoteConfig config;
  final bool isForced;

  const ForceUpdateDialog({
    super.key,
    required this.config,
    this.isForced = true,
  });

  /// Diyaloğu ekranda gösteren statik yardımcı metot.
  static Future<void> show(
    BuildContext context, {
    required AppRemoteConfig config,
    bool isForced = true,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: !isForced,
      builder: (ctx) => PopScope(
        canPop: !isForced,
        child: ForceUpdateDialog(config: config, isForced: isForced),
      ),
    );
  }

  Future<void> _openStore(BuildContext context) async {
    final uri = Uri.parse(config.storeUrl);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (_) {
      // url_launcher hatasında kullanıcıya uyarı göster
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Mağaza açılamadı: ${config.storeUrl}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      backgroundColor: colorScheme.surface,
      surfaceTintColor: colorScheme.surface.withAlpha(0),
      contentPadding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PhosphorIcon(
            PhosphorIconsRegular.cloudArrowUp,
            size: 36,
            color: colorScheme.primary,
          ),
          const SizedBox(height: 16),

          // Başlık
          Text(
            isForced ? 'Güncelleme gerekli' : 'Yeni sürüm hazır',
            style: textTheme.headlineSmall?.copyWith(
              color: colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),

          // Açıklama
          Text(
            isForced
                ? 'Kadro\'nun en güncel KPSS soru havuzunu ve deneme motorunu kullanabilmek için lütfen uygulamanı güncelle.'
                : 'Kadro için yeni bir sürüm (${config.latestVersion}) yayınlandı. En iyi deneyim için güncellemeni öneririz.',
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.48,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),

          // Aksiyon Butonları
          SizedBox(
            width: double.infinity,
            height: 48,
            child: FilledButton.icon(
              onPressed: () => _openStore(context),
              icon: const PhosphorIcon(
                PhosphorIconsBold.googlePlayLogo,
                size: 18,
              ),
              label: const Text('Google Play\'den Güncelle'),
            ),
          ),

          if (!isForced) ...[
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Daha Sonra',
                style: TextStyle(color: colorScheme.onSurfaceVariant),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
