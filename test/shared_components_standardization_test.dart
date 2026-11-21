import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/app/theme.dart';
import 'package:kadro/shared/widgets/adaptive_overlay.dart';
import 'package:kadro/shared/widgets/diagram_card_shell.dart';
import 'package:kadro/shared/widgets/kadro_badge.dart';
import 'package:kadro/shared/widgets/kadro_confirm_dialog.dart';
import 'package:kadro/shared/widgets/kadro_filter_chips.dart';
import 'package:kadro/shared/widgets/kadro_option_picker_modal.dart';
import 'package:kadro/shared/widgets/kadro_settings_card.dart';
import 'package:kadro/shared/widgets/page_header.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

void main() {
  group('TASK-153 Adım 2–6: Ortak UI Bileşenleri Standardizasyonu', () {
    testWidgets('KadroBadge tüm anlamsal tonları ve ikonları taşmadan çizer', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.light,
          home: const Scaffold(
            body: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                KadroBadge(
                  label: 'ÖSYM Standardı',
                  tone: KadroBadgeTone.primary,
                ),
                KadroBadge(
                  label: 'Çözüldü',
                  tone: KadroBadgeTone.secondary,
                  icon: PhosphorIconsFill.checkCircle,
                ),
                KadroBadge(label: 'Kadro PRO', tone: KadroBadgeTone.tertiary),
                KadroBadge(label: 'Kritik', tone: KadroBadgeTone.error),
                KadroBadge(label: 'Nötr', tone: KadroBadgeTone.neutral),
                KadroBadge(label: 'Seçili', tone: KadroBadgeTone.solidPrimary),
              ],
            ),
          ),
        ),
      );

      expect(find.text('ÖSYM Standardı'), findsOneWidget);
      expect(find.text('Çözüldü'), findsOneWidget);
      expect(find.text('Seçili'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('KadroConfirmDialog.confirm onay ve vazgeç değerlerini döner', (
      tester,
    ) async {
      bool? confirmedResult;

      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.light,
          home: Builder(
            builder: (context) => Scaffold(
              body: ElevatedButton(
                onPressed: () async {
                  confirmedResult = await KadroConfirmDialog.confirm(
                    context,
                    icon: PhosphorIconsRegular.trash,
                    title: 'Test Onayı',
                    message: 'Bu işlem kalıcıdır.',
                    cancelLabel: 'Vazgeç',
                    confirmLabel: 'Sil',
                    isDestructive: true,
                  );
                },
                child: const Text('Aç'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Aç'));
      await tester.pumpAndSettle();
      expect(find.text('Test Onayı'), findsOneWidget);
      expect(find.text('Bu işlem kalıcıdır.'), findsOneWidget);

      await tester.tap(find.text('Vazgeç'));
      await tester.pumpAndSettle();
      expect(confirmedResult, isFalse);

      await tester.tap(find.text('Aç'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Sil'));
      await tester.pumpAndSettle();
      expect(confirmedResult, isTrue);
    });

    testWidgets(
      'KadroOptionPickerModal telefon (<900px) alt çekmece ve tablet (>=900px) diyalogunda seçim döndürür',
      (tester) async {
        String? selectedGoal;

        Future<void> pumpHost(Size viewport) async {
          tester.view.physicalSize = viewport;
          tester.view.devicePixelRatio = 1.0;
          await tester.pumpWidget(
            MaterialApp(
              theme: AppTheme.light,
              home: Builder(
                builder: (context) => Scaffold(
                  body: ElevatedButton(
                    onPressed: () async {
                      selectedGoal = await KadroOptionPickerModal.show<String>(
                        context,
                        title: 'Hedef Seçimi',
                        subtitle: 'Bir seçenek belirle:',
                        selectedValue: '30',
                        options: const [
                          KadroPickerOption(
                            value: '30',
                            label: '30 soru',
                            description: 'Temel tempo',
                            icon: PhosphorIconsRegular.target,
                          ),
                          KadroPickerOption(
                            value: '50',
                            label: '50 soru',
                            description: 'Dengeli tempo',
                            icon: PhosphorIconsRegular.fire,
                          ),
                        ],
                      );
                    },
                    child: const Text('Seçici Aç'),
                  ),
                ),
              ),
            ),
          );
        }

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        // 1. Telefon görünümünde Alt Çekmece + tutamaç çubuğu
        await pumpHost(const Size(390, 844));
        await tester.tap(find.text('Seçici Aç'));
        await tester.pumpAndSettle();

        expect(find.byType(KadroSheetHandle), findsOneWidget);
        expect(find.text('Hedef Seçimi'), findsOneWidget);
        expect(find.text('Seçili'), findsOneWidget);
        await tester.tap(find.text('50 soru'));
        await tester.pumpAndSettle();
        expect(selectedGoal, equals('50'));

        // 2. Tablet (>= 900px) görünümünde Dialog
        selectedGoal = null;
        await pumpHost(const Size(1024, 768));
        await tester.tap(find.text('Seçici Aç'));
        await tester.pumpAndSettle();

        expect(find.byType(KadroSheetHandle), findsNothing);
        expect(find.text('Hedef Seçimi'), findsOneWidget);
        await tester.tap(find.text('50 soru'));
        await tester.pumpAndSettle();
        expect(selectedGoal, equals('50'));
      },
    );

    testWidgets(
      'KadroFilterChips, KadroSettingsCard ve ikonsuz PageHeader hatasız çizilir',
      (tester) async {
        String selectedFilter = 'Tümü';

        await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.light,
            home: StatefulBuilder(
              builder: (context, setState) => Scaffold(
                body: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    const PageHeader(
                      title: 'Başlık Bloğu',
                      subtitle: 'İkonsuz ortak sayfa başlığı',
                    ),
                    const SizedBox(height: 12),
                    KadroFilterChips<String>(
                      wrap: true,
                      selectedValue: selectedFilter,
                      options: const [
                        KadroFilterOption(value: 'Tümü', label: 'Tümü'),
                        KadroFilterOption(value: 'Tarih', label: 'Tarih'),
                      ],
                      onSelected: (v) => setState(() => selectedFilter = v),
                    ),
                    const SizedBox(height: 12),
                    const KadroSettingsCard(
                      children: [
                        ListTile(title: Text('Satır 1')),
                        ListTile(title: Text('Satır 2')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

        expect(find.text('Başlık Bloğu'), findsOneWidget);
        expect(find.byType(Divider), findsOneWidget);
        await tester.tap(find.text('Tarih'));
        await tester.pumpAndSettle();
        expect(selectedFilter, equals('Tarih'));
      },
    );

    testWidgets(
      'DiagramCardShell rozet, Büyüt düğmesi ve gövdeyi TactileCard içinde çizer',
      (tester) async {
        var zoomCount = 0;
        await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.light,
            home: Scaffold(
              body: DiagramCardShell(
                icon: PhosphorIconsRegular.mountains,
                badgeLabel: 'Test Şeması',
                badgeTone: KadroBadgeTone.tertiary,
                onZoom: () => zoomCount++,
                children: const [
                  DiagramTitle('Horst - Graben'),
                  DiagramNoteStrip(note: 'Eğitici not'),
                ],
              ),
            ),
          ),
        );

        expect(find.text('Test Şeması'), findsOneWidget);
        expect(find.text('Horst - Graben'), findsOneWidget);
        expect(find.text('Eğitici not'), findsOneWidget);
        expect(find.byType(KadroBadge), findsOneWidget);

        await tester.tap(find.text('Büyüt'));
        expect(zoomCount, equals(1));
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets('KadroBadge iconColor verildiğinde ikonu ayrı renkte çizer', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.light,
          home: const Scaffold(
            body: KadroBadge(
              label: '3 Gün Seri',
              icon: PhosphorIconsFill.flame,
              iconColor: Color(0xFFE28400),
              tone: KadroBadgeTone.neutral,
            ),
          ),
        ),
      );

      final icon = tester.widget<PhosphorIcon>(find.byType(PhosphorIcon));
      expect(icon.color, equals(const Color(0xFFE28400)));
    });
  });
}
