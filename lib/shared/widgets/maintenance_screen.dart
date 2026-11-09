import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/config/app_config_service.dart';
import 'package:kadro/core/config/app_remote_config.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Sistem bakımdayken tüm ekranları kilitleyen ve kullanıcıya bilgilendirme
/// sunan modern bakım ekranı (TASK-94).
class MaintenanceScreen extends ConsumerWidget {
  final AppRemoteConfig config;

  const MaintenanceScreen({super.key, required this.config});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Bakım Rozeti
                Container(
                  width: 88,
                  height: 88,
                  decoration: BoxDecoration(
                    color: colorScheme.errorContainer.withAlpha(120),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      PhosphorIconsBold.wrench,
                      size: 44,
                      color: colorScheme.error,
                    ),
                  ),
                ),
                const SizedBox(height: 28),

                // Başlık
                Text(
                  'Kadro Kısa Bir Bakımda 🛠️',
                  style: textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 14),

                // Açıklama Metni
                Text(
                  config.maintenanceMessage,
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 36),

                // Yeniden Dene Butonu
                SizedBox(
                  width: 220,
                  height: 48,
                  child: FilledButton.icon(
                    onPressed: () {
                      AppConfigService.clearCacheForTest();
                      ref.invalidate(appRemoteConfigProvider);
                    },
                    icon: const Icon(
                      PhosphorIconsBold.arrowsClockwise,
                      size: 20,
                    ),
                    label: const Text(
                      'Tekrar Kontrol Et',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
