import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kadro/core/utils/platform_env.dart';

/// Google AdMob Ödüllü Video Reklam (Rewarded Ad) Servisi.
///
/// Günlük 30 soru limiti bittiğinde kullanıcıya +20 soru hakkı kazandırır.
/// Web canlı ortamında ödüllü reklam SDK'sı olmadığından ücretsiz kota suistimalini
/// önlemek amacıyla gizlenir; yalnızca test/mobil ortamlarda etkinleşir (`TASK-145`).
class AdService {
  static bool _isInitialized = false;
  static bool _mockMode = false;
  static RewardedAd? _rewardedAd;
  static bool _isLoading = false;

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

  /// Web tarayıcısında (mock açık değilse) sahte ödüllü reklam butonunun
  /// gösterilip gösterilmeyeceğini belirler (`TASK-145`).
  static bool get isRewardedAdSupported {
    if (_mockMode) return true;
    if (PlatformEnv.isWeb) return false;
    return PlatformEnv.isMobile || PlatformEnv.isFlutterTest || _isInitialized;
  }

  /// Google resmi test reklam birim kimlikleri
  static String get rewardedAdUnitId {
    if (PlatformEnv.isAndroid) {
      return 'ca-app-pub-3940256099942544/5224354917';
    } else if (PlatformEnv.isIos) {
      return 'ca-app-pub-3940256099942544/1712485313';
    }
    return '';
  }

  /// Mobile Ads SDK'yı güvenli şekilde başlatır.
  static Future<void> initializeSafely() async {
    if (_mockMode) return;
    try {
      if (!PlatformEnv.isMobile) {
        _isInitialized = false;
        return;
      }
      await MobileAds.instance.initialize();
      _isInitialized = true;
      loadRewardedAd();
    } catch (e) {
      debugPrint('AdMob initialize hatası (Mock moda geçiliyor): $e');
      _isInitialized = false;
    }
  }

  /// Bir sonraki ödüllü video reklamı önceden belleğe yükler.
  static void loadRewardedAd() {
    if (_mockMode || !_isInitialized || _isLoading || !PlatformEnv.isMobile) {
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
  /// Canlı Web tarayıcısında ücretsiz +20 soru açığı oluşmaması için ödül verilmez.
  static Future<void> showRewardedAd({
    required VoidCallback onUserEarnedReward,
    VoidCallback? onAdDismissed,
  }) async {
    if (!_mockMode && PlatformEnv.isWeb) {
      onAdDismissed?.call();
      return;
    }

    if (_mockMode ||
        (!_isInitialized && PlatformEnv.isFlutterTest) ||
        (_isInitialized && _rewardedAd == null && PlatformEnv.isFlutterTest)) {
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
