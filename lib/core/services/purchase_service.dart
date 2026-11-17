import 'package:flutter/foundation.dart';
import 'package:kadro/core/config/supabase_config.dart';
import 'package:kadro/core/utils/platform_env.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

/// Platform bazlı satın alma kanalının çalışma durumunu belirtir (`TASK-145`).
enum PurchaseAvailability { mobileIap, webCheckout, testMock, unavailable }

/// Satın alma başlatma sonucunu taşıyan değişmez (immutable) yanıt modeli.
@immutable
class PurchaseAttemptResult {
  final bool isProGranted;
  final bool launchedExternalCheckout;
  final String? errorMessage;

  const PurchaseAttemptResult({
    required this.isProGranted,
    this.launchedExternalCheckout = false,
    this.errorMessage,
  });
}

/// Kadro PRO abonelik planları.
enum SubscriptionPlan {
  monthly(
    id: 'kadro_pro_monthly',
    title: 'Aylık Abonelik',
    priceText: '89 ₺ / Ay',
    subText: 'İstediğin zaman iptal et',
    badge: null,
  ),
  yearly(
    id: 'kadro_pro_yearly',
    title: 'Yıllık Abonelik',
    priceText: '499 ₺ / Yıl',
    subText: 'Aylık ~41 ₺ (%53 Tasarruf)',
    badge: 'En Çok Tercih Edilen',
  ),
  lifetime(
    id: 'kadro_pro_lifetime',
    title: '2026 Sınava Kadar',
    priceText: '349 ₺',
    subText: 'Sınav gününe kadar tek seferlik',
    badge: 'Öğrenci Dostu',
  );

  final String id;
  final String title;
  final String priceText;
  final String subText;
  final String? badge;

  const SubscriptionPlan({
    required this.id,
    required this.title,
    required this.priceText,
    required this.subText,
    this.badge,
  });
}

/// RevenueCat (`purchases_flutter`) + Web Checkout (`iyzico` / `Stripe` Edge Function)
/// tabanlı çapraz platform güvenli satın alma ve yetki doğrulama servisi (`TASK-145`, `TASK-152`).
///
/// Angular/Web karşılığı: Platforma göre IAP veya Web Checkout yönlendiren `BillingService`.
/// ÖNEMLİ: Canlı Web ortamında SDK veya checkout URL tanımlı değilse ASLA ücretsiz PRO
/// yükseltmesi döndürmez; yalnızca açık test/mock ortamında simülasyona izin verir.
class PurchaseService {
  static bool _isConfigured = false;
  static bool _mockMode = false;

  /// `--dart-define=WEB_CHECKOUT_URL=https://...` ile tanımlanan iyzico / RevenueCat Web
  /// ödeme başlatma uç noktası.
  static const String webCheckoutEndpoint = String.fromEnvironment(
    'WEB_CHECKOUT_URL',
    defaultValue: '',
  );

  @visibleForTesting
  static String? debugWebCheckoutUrlOverride;

  static String get _effectiveWebCheckoutUrl =>
      (debugWebCheckoutUrlOverride ?? webCheckoutEndpoint).trim();

  /// Web Checkout (iyzico / RevenueCat Web Billing) yapılandırılmış mı?
  static bool get isWebCheckoutConfigured =>
      _effectiveWebCheckoutUrl.isNotEmpty;

  /// Test senaryolarında mock satın alma sonucunu etkinleştirir.
  static void enableMockMode() {
    _mockMode = true;
  }

  /// Testler arası servis durumunu sıfırlar.
  @visibleForTesting
  static void resetForTest() {
    _isConfigured = false;
    _mockMode = false;
    debugWebCheckoutUrlOverride = null;
  }

  /// Aktif platform için kullanılabilir ödeme kanalını döner.
  static PurchaseAvailability get availability {
    if (_mockMode) return PurchaseAvailability.testMock;
    if (PlatformEnv.isWeb) {
      return isWebCheckoutConfigured
          ? PurchaseAvailability.webCheckout
          : PurchaseAvailability.unavailable;
    }
    if (_isConfigured && PlatformEnv.isMobile) {
      return PurchaseAvailability.mobileIap;
    }
    if (PlatformEnv.isFlutterTest) {
      return PurchaseAvailability.testMock;
    }
    return PurchaseAvailability.unavailable;
  }

  /// RevenueCat SDK'sını başlatır. Web veya masaüstünde native IAP başlatılmaz.
  static Future<void> initializeSafely() async {
    if (_mockMode) return;
    try {
      if (!PlatformEnv.isMobile) {
        _isConfigured = false;
        return;
      }
      const apiKey = 'appl_mock_revenuecat_key';
      final configuration = PurchasesConfiguration(apiKey);
      await Purchases.configure(configuration);
      _isConfigured = true;
    } catch (e) {
      debugPrint('Purchases initialize hatası (güvenli fallback): $e');
      _isConfigured = false;
    }
  }

  /// Seçilen plan için platforma uygun güvenli satın alma akışını başlatır.
  static Future<PurchaseAttemptResult> initiatePurchase(
    SubscriptionPlan plan, {
    String? userId,
    String? email,
  }) async {
    if (_mockMode || (PlatformEnv.isFlutterTest && !PlatformEnv.isWeb)) {
      await Future<void>.delayed(const Duration(milliseconds: 50));
      return const PurchaseAttemptResult(isProGranted: true);
    }

    if (PlatformEnv.isWeb) {
      if (!isWebCheckoutConfigured) {
        return const PurchaseAttemptResult(
          isProGranted: false,
          errorMessage: 'Web üzerinden kart/abonelik ödemesi henüz aktif edilmedi. Mobilde açılan PRO üyeliğiniz aynı hesapla otomatik eşitlenir.',
        );
      }

      final base = Uri.tryParse(_effectiveWebCheckoutUrl);
      if (base == null || !(base.isScheme('https') || base.isScheme('http'))) {
        return const PurchaseAttemptResult(
          isProGranted: false,
          errorMessage: 'Web ödeme bağlantısı geçersiz.',
        );
      }

      final checkoutUri = base.replace(
        queryParameters: <String, String>{
          ...base.queryParameters,
          'plan_id': plan.id,
          if (userId != null && userId.isNotEmpty) 'user_id': userId,
          if (email != null && email.isNotEmpty) 'email': email,
        },
      );

      try {
        final launched = await launchUrl(
          checkoutUri,
          mode: LaunchMode.externalApplication,
        );
        if (!launched) {
          return const PurchaseAttemptResult(
            isProGranted: false,
            errorMessage: 'Ödeme penceresi açılamadı.',
          );
        }
        return const PurchaseAttemptResult(
          isProGranted: false,
          launchedExternalCheckout: true,
        );
      } catch (e) {
        return PurchaseAttemptResult(
          isProGranted: false,
          errorMessage: 'Ödeme başlatılırken hata oluştu: $e',
        );
      }
    }

    if (!_isConfigured) {
      return const PurchaseAttemptResult(
        isProGranted: false,
        errorMessage: 'Mağaza ödeme servisi şu an kullanılamıyor.',
      );
    }

    try {
      final offerings = await Purchases.getOfferings();
      final current = offerings.current;
      if (current != null) {
        Package? packageToBuy;
        switch (plan) {
          case SubscriptionPlan.monthly:
            packageToBuy = current.monthly;
            break;
          case SubscriptionPlan.yearly:
            packageToBuy = current.annual;
            break;
          case SubscriptionPlan.lifetime:
            packageToBuy = current.lifetime;
            break;
        }

        if (packageToBuy != null) {
          final purchaseResult = await Purchases.purchase(
            PurchaseParams.package(packageToBuy),
          );
          final customerInfo = purchaseResult.customerInfo;
          final active =
              customerInfo.entitlements.active.containsKey('pro') ||
              customerInfo.entitlements.active.containsKey('kadro_pro');
          return PurchaseAttemptResult(isProGranted: active);
        }
      }
      return const PurchaseAttemptResult(
        isProGranted: false,
        errorMessage: 'Seçilen abonelik paketi mağazada bulunamadı.',
      );
    } catch (e) {
      debugPrint('Purchases purchasePlan hatası: $e');
      return const PurchaseAttemptResult(
        isProGranted: false,
        errorMessage: 'Satın alma işlemi tamamlanamadı veya iptal edildi.',
      );
    }
  }

  /// Seçilen plan için satın alma akışını başlatır (geriye dönük uyumlu bool sarmalayıcı).
  static Future<bool> purchasePlan(SubscriptionPlan plan) async {
    final res = await initiatePurchase(plan);
    return res.isProGranted;
  }

  /// Sunucudaki (`public.subscriptions` ve `public.profiles.is_pro`) gerçek PRO
  /// yetkisini kontrol eder (`TASK-152`).
  static Future<bool> verifyProEntitlement({
    SupabaseClient? clientOverride,
    String? userId,
  }) async {
    final client = clientOverride ?? SupabaseConfig.clientOrNull;
    if (client == null) return false;

    final uid = userId ?? client.auth.currentUser?.id;
    if (uid == null || uid.isEmpty) return false;

    try {
      final sub = await client
          .from('subscriptions')
          .select('status, expires_at')
          .eq('user_id', uid)
          .eq('status', 'active')
          .order('created_at', ascending: false)
          .limit(1)
          .maybeSingle();

      if (sub != null) {
        final rawExpires = sub['expires_at'] as String?;
        if (rawExpires == null || rawExpires.isEmpty) return true;
        final expiresAt = DateTime.tryParse(rawExpires);
        if (expiresAt != null && expiresAt.isAfter(DateTime.now().toUtc())) {
          return true;
        }
      }

      final profile = await client
          .from('profiles')
          .select('is_pro')
          .eq('id', uid)
          .maybeSingle();
      return profile?['is_pro'] == true;
    } catch (e) {
      debugPrint('verifyProEntitlement hatası: $e');
      return false;
    }
  }

  /// Önceki satın almaları geri yükler (`Restore Purchases` veya Web sunucu doğrulaması).
  static Future<bool> restorePurchases() async {
    if (_mockMode || (PlatformEnv.isFlutterTest && !PlatformEnv.isWeb)) {
      await Future<void>.delayed(const Duration(milliseconds: 50));
      return true;
    }

    if (PlatformEnv.isWeb || !_isConfigured) {
      return verifyProEntitlement();
    }

    try {
      final customerInfo = await Purchases.restorePurchases();
      return customerInfo.entitlements.active.containsKey('pro') ||
          customerInfo.entitlements.active.containsKey('kadro_pro');
    } catch (e) {
      debugPrint('Purchases restorePurchases hatası: $e');
      return false;
    }
  }
}
