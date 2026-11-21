import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/// Google AdMob Ödüllü Video Reklam (Rewarded Ad) Servisi.
///
/// Günlük 30 soru limiti bittiğinde kullanıcıya +20 soru hakkı kazandırır.
class AdService {
  static bool _isInitialized = false;
  static bool _mockMode = false;
  static RewardedAd? _rewardedAd;
  static bool _isLoading = false;

  static bool get _isMobilePlatform =>
      !kIsWeb && (Platform.isAndroid || Platform.isIOS);
  static bool get _isFlutterTest =>
      !kIsWeb && Platform.environment.containsKey('FLUTTER_TEST');

  /// Test senaryolarında mock modu etkinleştirir.
  static void enableMockMode() {
    _mockMode = true;
  }

  /// Testler arası reklam servis durumunu sıfırlar.
  @visibleForTesting
  static void resetForTest() {
    _isInitialized = false;
    _mockMode = false;
    _rewardedAd = null;
    _isLoading = false;
  }

  /// Ödüllü reklamların mevcut ortamda desteklenip desteklenmediğini döner.
  static bool get isRewardedAdSupported {
    if (_mockMode) return true;
    return _isMobilePlatform || _isFlutterTest || _isInitialized;
  }

  /// Google resmi test reklam birim kimlikleri
  static String get rewardedAdUnitId {
    if (!kIsWeb && Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/5224354917';
    } else if (!kIsWeb && Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/1712485313';
    }
    return '';
  }

  /// Mobile Ads SDK'yı zaman aşımı korumasıyla güvenli şekilde başlatır.
  static Future<void> initializeSafely() async {
    if (_mockMode) return;
    try {
      if (!_isMobilePlatform) {
        _isInitialized = false;
        return;
      }
      await MobileAds.instance.initialize().timeout(const Duration(seconds: 5));
      _isInitialized = true;
      loadRewardedAd();
    } catch (e) {
      debugPrint('AdMob initialize hatası (Mock moda geçiliyor): $e');
      _isInitialized = false;
    }
  }

  /// Bir sonraki ödüllü video reklamı önceden belleğe yükler.
  static void loadRewardedAd() {
    if (_mockMode || !_isInitialized || _isLoading || !_isMobilePlatform) {
      return;
    }
    _isLoading = true;

    RewardedAd.load(
      adUnitId: rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
          _isLoading = false;
        },
        onAdFailedToLoad: (error) {
          debugPrint('Ödüllü reklam yüklenemedi: $error');
          _rewardedAd = null;
          _isLoading = false;
        },
      ),
    );
  }

  /// Ödüllü reklamı gösterir.
  /// Reklam izlendiğinde [onUserEarnedReward] geri çağrılır.
  static Future<void> showRewardedAd({
    required VoidCallback onUserEarnedReward,
    VoidCallback? onAdDismissed,
  }) async {
    if (_mockMode ||
        (!_isInitialized && _isFlutterTest) ||
        (_isInitialized && _rewardedAd == null && _isFlutterTest)) {
      // Test simülasyonu: 100ms sonra ödülü ver
      await Future<void>.delayed(const Duration(milliseconds: 100));
      onUserEarnedReward();
      onAdDismissed?.call();
      return;
    }

    if (!_isInitialized || _rewardedAd == null) {
      onAdDismissed?.call();
      return;
    }

    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        _rewardedAd = null;
        loadRewardedAd();
        onAdDismissed?.call();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        debugPrint('Reklam gösterilemedi: $error');
        ad.dispose();
        _rewardedAd = null;
        loadRewardedAd();
        // Hata durumunda kullanıcıyı mağdur etmemek için ödülü ver
        onUserEarnedReward();
        onAdDismissed?.call();
      },
    );

    await _rewardedAd!.show(
      onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
        onUserEarnedReward();
      },
    );
  }
}
