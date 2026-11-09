import 'dart:collection';

/// İstemci (Client) Seviyesinde Hız Sınırlandırıcı (Rate Limiter & Anti-Spam Kalkanı).
///
/// Web/Angular Karşılığı: Angular HTTP Interceptor içinde token-bucket / throttle
/// mantığı ile çalışan koruma servisi.
///
/// Kullanım Amaçları:
/// 1. Soru bildirme, sınav bitirme ve bulut senkronizasyonunda kullanıcıların/botların
///    arka arkaya seri istek atarak sunucu kotasını doldurmasını engeller.
/// 2. Ağ trafiğini ve Supabase Egress (veri çıkış) maliyetlerini korur.
/// 3. İstemci seviyesinde anında yanıt vererek gereksiz HTTP isteklerinin internete çıkmasını önler.
class ClientRateLimiter {
  ClientRateLimiter._();

  static final ClientRateLimiter instance = ClientRateLimiter._();

  /// Her aksiyon anahtarı (`actionKey`) için son istek zamanlarını tutan liste.
  final Map<String, Queue<DateTime>> _requestHistory = {};

  /// Belirli bir aksiyonun son tetiklenme zamanı (Cooldown takibi için).
  final Map<String, DateTime> _lastActionTime = {};

  /// Belirtilen [actionKey] için [window] süresi içinde [maxRequests] sınırının aşılıp aşılmadığını denetler.
  ///
  /// Limit aşılmadıysa `true` döner ve isteği kaydeder.
  /// Limit aşıldıysa `false` döner ve isteğin sunucuya gitmesi engellenir.
  bool checkAndRecord(
    String actionKey, {
    int maxRequests = 3,
    Duration window = const Duration(minutes: 1),
  }) {
    final now = DateTime.now();
    final cutoff = now.subtract(window);

    final queue = _requestHistory.putIfAbsent(
      actionKey,
      () => Queue<DateTime>(),
    );

    // Süresi dolmuş eski istekleri temizle
    while (queue.isNotEmpty && queue.first.isBefore(cutoff)) {
      queue.removeFirst();
    }

    if (queue.length >= maxRequests) {
      return false; // Limit aşıldı!
    }

    queue.addLast(now);
    _lastActionTime[actionKey] = now;
    return true;
  }

  /// Belirtilen [actionKey] için zorunlu bekleme süresinin (Cooldown) dolup dolmadığını denetler.
  ///
  /// Kalan süre varsa `Duration` olarak döner, bekleme süresi dolmuşsa `Duration.zero` döner.
  Duration getRemainingCooldown(String actionKey, Duration cooldown) {
    final lastTime = _lastActionTime[actionKey];
    if (lastTime == null) return Duration.zero;

    final elapsed = DateTime.now().difference(lastTime);
    if (elapsed >= cooldown) {
      return Duration.zero;
    }
    return cooldown - elapsed;
  }

  /// Belirtilen [actionKey] için cooldown başlatır/günceller.
  void recordCooldown(String actionKey) {
    _lastActionTime[actionKey] = DateTime.now();
  }

  /// Test senaryoları ve oturum temizliği için geçmişi sıfırlar.
  void reset([String? actionKey]) {
    if (actionKey != null) {
      _requestHistory.remove(actionKey);
      _lastActionTime.remove(actionKey);
    } else {
      _requestHistory.clear();
      _lastActionTime.clear();
    }
  }
}
