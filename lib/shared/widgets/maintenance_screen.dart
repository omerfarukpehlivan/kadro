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
                PhosphorIcon(
                  PhosphorIconsRegular.wrench,
                  size: 36,
                  color: colorScheme.error,
                ),
                const SizedBox(height: 20),

                // Başlık
                Text(
                  'Planlı bakım',
                  style: textTheme.headlineMedium?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),

                // Açıklama Metni
                Text(
                  config.maintenanceMessage,
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                // Yeniden Dene Butonu
                SizedBox(
                  width: 220,
                  height: 48,
                  child: FilledButton.icon(
                    onPressed: () {
                      AppConfigService.clearCacheForTest();
                      ref.invalidate(appRemoteConfigProvider);
                    },
                    icon: const PhosphorIcon(
                      PhosphorIconsBold.arrowsClockwise,
                      size: 18,
                    ),
                    label: const Text('Tekrar Kontrol Et'),
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
