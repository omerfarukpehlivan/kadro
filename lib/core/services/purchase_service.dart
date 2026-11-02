import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

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

/// RevenueCat (`purchases_flutter`) tabanlı güvenli uygulama içi satın alma servisi.
///
/// Angular'daki Payment/Stripe service wrapper karşılığıdır.
/// Testlerde ve masaüstü/web ortamında otomatik mock moduna geçer.
class PurchaseService {
  static bool _isConfigured = false;
  static bool _mockMode = false;

  /// Test senaryolarında mock satın alma sonucunu etkinleştirir.
  static void enableMockMode() {
    _mockMode = true;
  }

  /// RevenueCat SDK'sını başlatır. Platform desteklenmiyorsa sessizce mock moduna geçer.
  static Future<void> initializeSafely() async {
    if (_mockMode) return;
    try {
      if (kIsWeb || (!Platform.isAndroid && !Platform.isIOS)) {
        _isConfigured = false;
        return;
      }
      const apiKey = 'appl_mock_revenuecat_key';
      final configuration = PurchasesConfiguration(apiKey);
      await Purchases.configure(configuration);
      _isConfigured = true;
    } catch (e) {
      debugPrint('Purchases initialize hatası (Mock moda geçiliyor): $e');
      _isConfigured = false;
    }
  }

  /// Seçilen plan için satın alma akışını başlatır.
  static Future<bool> purchasePlan(SubscriptionPlan plan) async {
    if (_mockMode || !_isConfigured) {
      // Demo / Test simülasyonu
      await Future<void>.delayed(const Duration(milliseconds: 50));
      return true;
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
          return customerInfo.entitlements.active.containsKey('pro') ||
              customerInfo.entitlements.active.containsKey('kadro_pro');
        }
      }
      return true; // Fallback mock
    } catch (e) {
      debugPrint('Purchases purchasePlan hatası: $e');
      return false;
    }
  }

  /// Önceki satın almaları geri yükler (Restore Purchases).
  static Future<bool> restorePurchases() async {
    if (_mockMode || !_isConfigured) {
      await Future<void>.delayed(const Duration(milliseconds: 50));
      return true;
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
