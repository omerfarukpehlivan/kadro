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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      contentPadding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // İkon Rozeti
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer.withAlpha(120),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                PhosphorIconsBold.cloudArrowUp,
                size: 32,
                color: colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Başlık
          Text(
            isForced ? 'Güncelleme Gerekli 🚀' : 'Yeni Sürüm Yayında! 🌟',
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),

          // Açıklama
          Text(
            isForced
                ? 'Kadro\'nun en güncel KPSS soru havuzunu, deneme motorunu ve yeni özelliklerini kullanabilmek için lütfen uygulamanızı güncelleyin.'
                : 'Kadro için yeni bir sürüm (${config.latestVersion}) yayınlandı. En iyi deneyim için güncellemenizi öneririz.',
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.45,
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
              icon: const Icon(PhosphorIconsBold.googlePlayLogo, size: 20),
              label: const Text(
                'Google Play\'den Güncelle',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
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
