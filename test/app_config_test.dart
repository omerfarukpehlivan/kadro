import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/core/config/app_config_service.dart';
import 'package:kadro/core/config/app_remote_config.dart';
import 'package:kadro/shared/widgets/force_update_dialog.dart';
import 'package:kadro/shared/widgets/maintenance_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('TASK-94: Sürüm Kontrolü ve Bakım Modu Testleri', () {
    test('AppRemoteConfig semantik sürüm karşılaştırması doğru çalışmalı', () {
      const config = AppRemoteConfig(
        minSupportedVersion: '1.2.0',
        latestVersion: '1.5.0',
      );

      // Eski sürüm: Zorunlu güncelleme gerekmeli
      expect(config.isForceUpdateRequired('1.0.0'), isTrue);
      expect(config.isForceUpdateRequired('1.1.9'), isTrue);
      expect(config.isForceUpdateRequired('1.0.0+5'), isTrue);

      // Eşit veya üst sürüm: Zorunlu güncelleme gerekmemeli
      expect(config.isForceUpdateRequired('1.2.0'), isFalse);
      expect(config.isForceUpdateRequired('1.2.1'), isFalse);
      expect(config.isForceUpdateRequired('2.0.0'), isFalse);

      // Opsiyonel güncelleme kontrolü
      expect(config.hasOptionalUpdate('1.2.0'), isTrue);
      expect(config.hasOptionalUpdate('1.4.0'), isTrue);
      expect(config.hasOptionalUpdate('1.5.0'), isFalse);
      expect(config.hasOptionalUpdate('1.6.0'), isFalse);
    });

    test(
      'AppRemoteConfig.fromMap Supabase JSON verisini eksiksiz parse etmeli',
      () {
        final json = {
          'min_supported_version': '1.3.0',
          'latest_version': '1.4.2',
          'is_maintenance_mode': true,
          'maintenance_message': 'Sunucu yenileniyor...',
          'store_url': 'https://custom-store-url.com',
          'exam_date_overrides': {
            'lisans_gk': '2027-09-19T10:15:00',
            'dhbt_onlisans': '2028-11-12T10:15:00',
            'bozuk_anahtar': 'not-a-date',
            '': '2027-01-01',
          },
        };

        final config = AppRemoteConfig.fromMap(json);
        expect(config.minSupportedVersion, equals('1.3.0'));
        expect(config.latestVersion, equals('1.4.2'));
        expect(config.isMaintenanceMode, isTrue);
        expect(config.maintenanceMessage, equals('Sunucu yenileniyor...'));
        expect(config.storeUrl, equals('https://custom-store-url.com'));
        expect(
          config.examDateOverrides['lisans_gk'],
          equals(DateTime(2027, 9, 19, 10, 15)),
        );
        expect(
          config.examDateOverrides['dhbt_onlisans'],
          equals(DateTime(2028, 11, 12, 10, 15)),
        );
        expect(config.examDateOverrides.containsKey('bozuk_anahtar'), isFalse);
        expect(config.examDateOverrides.containsKey(''), isFalse);
      },
    );

    test('AppRemoteConfig.fromMap string JSON veya geçersiz exam_date_overrides verisini güvenle yönetmeli', () {
      final stringConfig = AppRemoteConfig.fromMap({
        'exam_date_overrides': '{"ekpss_lisans":"2028-04-30T10:15:00"}',
      });
      expect(
        stringConfig.examDateOverrides['ekpss_lisans'],
        equals(DateTime(2028, 4, 30, 10, 15)),
      );

      final malformedConfig = AppRemoteConfig.fromMap({
        'exam_date_overrides': '{bozuk json',
      });
      expect(malformedConfig.examDateOverrides, isEmpty);
    });

    test(
      'AppConfigService çevrimdışı modda güvenli fallback değerini dönmeli',
      () async {
        AppConfigService.clearCacheForTest();
        const service = AppConfigService();
        final config = await service.fetchConfig();

        expect(config.minSupportedVersion, equals('1.0.0'));
        expect(config.isMaintenanceMode, isFalse);
      },
    );

    testWidgets('ForceUpdateDialog doğru metinleri ve butonları çizmeli', (
      tester,
    ) async {
      const config = AppRemoteConfig(
        minSupportedVersion: '2.0.0',
        latestVersion: '2.0.0',
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ForceUpdateDialog(config: config, isForced: true),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Güncelleme gerekli'), findsOneWidget);
      expect(find.text('Google Play\'den Güncelle'), findsOneWidget);
      expect(
        find.text('Daha Sonra'),
        findsNothing,
      ); // Zorunlu güncellemede iptal butonu yok
    });

    testWidgets(
      'MaintenanceScreen bakım mesajını ve tekrar kontrol et butonunu çizmeli',
      (tester) async {
        const config = AppRemoteConfig(
          isMaintenanceMode: true,
          maintenanceMessage:
              'Kadro sunucuları KPSS güncellemesi için bakımdadır.',
        );

        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(home: MaintenanceScreen(config: config)),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Planlı bakım'), findsOneWidget);
        expect(
          find.text('Kadro sunucuları KPSS güncellemesi için bakımdadır.'),
          findsOneWidget,
        );
        expect(find.text('Tekrar Kontrol Et'), findsOneWidget);
      },
    );
  });
}
