import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/core/legal/legal_documents.dart';
import 'package:kadro/features/auth/data/auth_notifier.dart';
import 'package:kadro/features/profile/presentation/profile_screen.dart';
import 'package:kadro/shared/widgets/legal_document_viewer_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('TASK-113: LegalDocuments Hukuki Metin ve İletişim Sabitleri', () {
    test('Tüm hukuki başlıklar, e-posta ve sorumluluk reddi metinleri tanımlı olmalı', () {
      expect(LegalDocuments.contactEmail, 'destek@kadro.app');
      expect(LegalDocuments.privacyPolicyUrl, contains('kadro.app'));
      expect(LegalDocuments.accountDeletionUrl, contains('kadro.app'));
      expect(LegalDocuments.shortOsymDisclaimer, contains('bağımsız bir KPSS'));
      expect(LegalDocuments.privacyBody, contains('6698'));
      expect(LegalDocuments.termsBody, contains('ÖSYM'));
    });
  });

  group(
    'TASK-113: LegalDocumentViewerScreen Belge Görüntüleyici Widget Testleri',
    () {
      testWidgets(
        'Gizlilik Politikası ekranı başlık, içerik ve e-posta kutusunu çizer',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: LegalDocumentViewerScreen(
                title: LegalDocuments.privacyTitle,
                content: 'Örnek KVKK Metni İçeriği',
              ),
            ),
          );

          await tester.pumpAndSettle();

          expect(find.text(LegalDocuments.privacyTitle), findsWidgets);
          expect(find.text('Örnek KVKK Metni İçeriği'), findsOneWidget);
          expect(find.textContaining('destek@kadro.app'), findsOneWidget);
        },
      );
    },
  );

  group('TASK-113: ProfileScreen Hukuk Merkezi ve Hesap Silme Akışı', () {
    testWidgets(
      'ProfileScreen Hukuki & Gizlilik bölümünü ve yasal linkleri içerir',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(800, 2000);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(home: Scaffold(body: ProfileScreen())),
          ),
        );

        await tester.pumpAndSettle();

        // Aşağı kaydırarak Hukuki & Gizlilik bölümüne git
        await tester.scrollUntilVisible(
          find.text('Hukuki & Gizlilik'),
          200,
          scrollable: find.byType(Scrollable).first,
        );

        // Hukuki bölüm başlığı ve öğeleri
        expect(find.text('Hukuki & Gizlilik'), findsOneWidget);
        expect(find.text('Gizlilik Politikası & KVKK'), findsOneWidget);
        expect(find.text('Kullanım Koşulları & Sözleşme'), findsOneWidget);
        expect(find.text('Açık Kaynak Lisansları'), findsOneWidget);
        expect(find.text('Hesabımı ve Verilerimi Sil'), findsOneWidget);

        // Hesap sil butonuna scroll et
        await tester.scrollUntilVisible(
          find.text('Hesabımı ve Verilerimi Sil'),
          300,
          scrollable: find.byType(Scrollable).first,
        );
        // Butonu ekran merkezine almak için biraz daha yukarı kaydır
        await tester.drag(find.byType(Scrollable).first, const Offset(0, -250));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Hesabımı ve Verilerimi Sil'));
        await tester.pumpAndSettle();

        expect(find.textContaining('Bu işlem geri alınamaz'), findsOneWidget);
        expect(find.text('Vazgeç'), findsOneWidget);
        expect(find.text('Kalıcı Olarak Sil'), findsOneWidget);

        // Vazgeç'e basınca modal kapanır
        await tester.tap(find.text('Vazgeç'));
        await tester.pumpAndSettle();

        expect(find.textContaining('Bu işlem geri alınamaz'), findsNothing);
      },
    );

    test('AuthNotifier deleteAccountAndData fonksiyonu oturumu ve verileri temizler', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(authProvider.notifier);
      final result = await notifier.deleteAccountAndData();

      expect(result, isTrue);
      expect(container.read(authProvider).isAuthenticated, isFalse);
    });
  });
}
