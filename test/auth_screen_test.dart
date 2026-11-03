import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/auth/data/auth_notifier.dart';
import 'package:kadro/features/auth/presentation/auth_screen.dart';
import 'package:kadro/features/profile/presentation/profile_screen.dart';

void main() {
  group('AuthNotifier ve AuthScreen Testleri', () {
    test(
      'AuthNotifier başlangıç durumu ve demo modunda giriş/çıkış akışı',
      () async {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        final notifier = container.read(authProvider.notifier);

        expect(container.read(authProvider).isAuthenticated, isFalse);
        expect(container.read(authProvider).email, isNull);

        // Demo giriş
        final success = await notifier.signIn(
          email: 'test@kadro.com',
          password: 'password123',
        );

        expect(success, isTrue);
        expect(container.read(authProvider).isAuthenticated, isTrue);
        expect(container.read(authProvider).email, equals('test@kadro.com'));

        // Çıkış yap
        await notifier.signOut();
        expect(container.read(authProvider).isAuthenticated, isFalse);
        expect(container.read(authProvider).email, isNull);
      },
    );

    test('Kullanıcı adı ile giriş yapıldığında (@ içermeyen) sanal e-posta üretilmeli ve displayName atanmalı', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(authProvider.notifier);

      // Kullanıcı adı ile giriş
      final success = await notifier.signIn(
        emailOrUsername: 'omer_kpss',
        password: 'password123',
      );

      expect(success, isTrue);
      final state = container.read(authProvider);
      expect(state.isAuthenticated, isTrue);
      expect(state.email, equals('omer_kpss@kadro.internal'));
      expect(state.displayName, equals('omer_kpss'));
    });

    test('signInWithGoogle ve sendPasswordResetEmail demo modunda güvenle çalışmalı', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(authProvider.notifier);

      // Google ile giriş
      final googleSuccess = await notifier.signInWithGoogle();
      expect(googleSuccess, isTrue);
      expect(container.read(authProvider).isAuthenticated, isTrue);
      expect(
        container.read(authProvider).displayName,
        equals('Google ile Giriş Yapan Aday'),
      );

      // Şifre sıfırlama e-postası
      final resetSuccess = await notifier.sendPasswordResetEmail(
        'demo_kpss@gmail.com',
      );
      expect(resetSuccess, isTrue);
    });

    testWidgets(
      'ProfileScreen üzerinden AuthScreen açılmalı, hibrit e-posta ile giriş yapılabilmeli ve çıkış yapılabilmeli',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        final container = ProviderContainer();
        addTearDown(container.dispose);

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(home: ProfileScreen()),
          ),
        );

        // Başlangıçta giriş yapılmamış olmalı
        expect(find.text('İlerlemeni Buluta Kaydet'), findsOneWidget);
        expect(find.text('Giriş Yap / Kayıt Ol'), findsOneWidget);
        expect(find.text('Çıkış Yap'), findsNothing);

        // Giriş butonuna tıkla -> AuthScreen açılmalı
        await tester.tap(find.text('Giriş Yap / Kayıt Ol'));
        await tester.pumpAndSettle();

        expect(find.byType(AuthScreen), findsOneWidget);
        expect(find.text('Hesabına Giriş Yap'), findsOneWidget);
        expect(find.text('E-posta veya Kullanıcı Adı'), findsOneWidget);
        expect(find.text('Şifre (En az 6 karakter)'), findsOneWidget);

        // E-posta ve şifre gir
        await tester.enterText(
          find.widgetWithText(TextFormField, 'E-posta veya Kullanıcı Adı'),
          'ogrenci@kadro.com',
        );
        await tester.enterText(
          find.widgetWithText(TextFormField, 'Şifre (En az 6 karakter)'),
          'kpss2026',
        );

        // Giriş Yap butonuna tıkla
        final submitButton = find.widgetWithText(FilledButton, 'Giriş Yap');
        expect(submitButton, findsOneWidget);
        await tester.tap(submitButton);
        await tester.pumpAndSettle();

        // AuthScreen kapanıp ProfileScreen'e dönmüş olmalı
        expect(find.byType(AuthScreen), findsNothing);
        expect(find.byType(ProfileScreen), findsOneWidget);

        // Artık hesap kartında e-posta ve çıkış butonu görünmeli
        expect(find.text('İlerlemeni Buluta Kaydet'), findsNothing);
        expect(find.text('ogrenci@kadro.com'), findsOneWidget);
        expect(find.text('Çıkış Yap'), findsOneWidget);

        // Çıkış yap butonuna basınca tekrar giriş daveti kartı görünmeli
        await tester.tap(find.text('Çıkış Yap'));
        await tester.pumpAndSettle();

        expect(find.text('İlerlemeni Buluta Kaydet'), findsOneWidget);
        expect(find.text('Çıkış Yap'), findsNothing);
      },
    );

    testWidgets(
      'AuthScreen üzerinde Google ile Giriş butonu ve Şifremi Unuttum modalı eksiksiz çalışmalı',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        final container = ProviderContainer();
        addTearDown(container.dispose);

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(home: AuthScreen()),
          ),
        );
        await tester.pumpAndSettle();

        // Google ile devam et butonu görünmeli
        expect(find.text('Google ile Devam Et'), findsOneWidget);
        expect(find.text('Şifremi Unuttum?'), findsOneWidget);

        // Şifremi unuttum modalını aç
        await tester.tap(find.text('Şifremi Unuttum?'));
        await tester.pumpAndSettle();

        expect(find.text('Şifre Sıfırlama'), findsOneWidget);
        expect(find.text('Sıfırlama Bağlantısı Gönder'), findsOneWidget);

        // E-posta gir ve gönder
        await tester.enterText(
          find.widgetWithText(TextFormField, 'E-posta Adresi'),
          'sifremiunuttum@kadro.com',
        );
        await tester.tap(find.text('Sıfırlama Bağlantısı Gönder'));
        await tester.pumpAndSettle();

        // Modal kapanmış ve SnackBar gösterilmiş olmalı
        expect(find.text('Şifre Sıfırlama'), findsNothing);
        expect(
          find.text(
            '✅ Şifre sıfırlama bağlantısı e-posta adresinize gönderildi.',
          ),
          findsOneWidget,
        );

        // Google ile Devam Et butonuna tıkla
        await tester.tap(find.text('Google ile Devam Et'));
        await tester.pumpAndSettle();

        expect(container.read(authProvider).isAuthenticated, isTrue);
      },
    );
  });
}
