# ⚡ Kadro: Son 1 Saatlik Çalışma Özeti (Claude Handoff)
> **Tarih & Saat:** 20 Kasım 2026, ~19:50 – 20:50  
> **Proje:** `Kadro` (`gunisigi`) — Flutter & Supabase Tabanlı Çoklu KPSS Hazırlık Uygulaması  
> **Kullanım Amacı:** Claude'a aktarılmak üzere yalnızca son 1 saatte incelenen başlıklar, tespit edilen eksikler ve oluşturulan araçlar.

---

## 🎯 Son 1 Saatte Yapılan 5 Temel İş

### 1. Google Play Store Çıkış Denetimi ("Bir App'te Kesinlikle Neler Olmalı?")
* **Mevcut Durum:** Kod mimarisi ve testler %98 hazır (439+ test yeşil, 0 hata, R8/Proguard ve Keystore yapılandırması tamam).
* **Canlıya Çıkış İçin Kesinlikle Yapılması Gereken 5 Eksik:**
  1. **Android 13 Bildirim İzni:** `android/app/src/main/AndroidManifest.xml` dosyasına `<uses-permission android:name="android.permission.POST_NOTIFICATIONS"/>` eklenmeli (aksi halde günlük çalışma hatırlatıcıları sessizce engellenir).
  2. **AdMob Canlı Kimlikleri & UMP:** Test App ID yerine Google AdMob canlı App ID ve Reklam Birim ID'leri girilmeli; AB/KVKK rıza formu (Google UMP SDK) entegre edilmeli.
  3. **RevenueCat & Abonelik:** Mock anahtarlar yerine Google Play Console'da `kadro_pro_monthly` ve `kadro_pro_yearly` abonelik SKU'ları açılıp canlı RevenueCat API anahtarı bağlanmalı.
  4. **Mağaza Görselleri:** 512x512 uygulama simgesi, 1024x500 Feature Graphic ve 8 adet ekran görüntüsü (screenshot) hazırlanmalı.
  5. **14 Günlük Kapalı Test:** Bireysel Play Console hesapları için zorunlu olan 20 test kullanıcısı ile 14 günlük test süreci başlatılmalı.

---

### 2. Mobil Tarafta Kalan Açık Görevler (Task Board Durumu)
* **Tamamlananlar:** Faz 1 – 7 arası tamamen bitti (UI, State, Veri modelleri, Tuğrul Maskot, Hata Defteri, Offline Cache, Eşlenik Test Fixture'ları).
* **Kalan Açık Görevler (Faz 8 - 10):**
  * **Faz 8:** Supabase Bulut Veritabanı ve Realtime geçişi (Yerel mock modundan canlı PostgreSQL'e tam geçiş).
  * **Faz 9:** RevenueCat Abonelik Satın Alma akışı + AdMob ödüllü reklam entegrasyonu (günlük 30 sorudan sonra +20 soru hakkı).
  * **Faz 10:** Mağaza materyallerinin yüklenmesi ve Google Play kapalı test dağıtımı.

---

### 3. Soru Havuzu Envanteri & Eksik Dersler Analizi
Mevcut soru havuzunda toplam **1.524 soru** bulunmaktadır:
* **Hazır Olanlar (Lisans Genel Kültür):**
  * Tarih: **630** soru (Yeşil / Yeterli)
  * Coğrafya: **450** soru (Yeşil / Yeterli)
  * Vatandaşlık: **280** soru (Yeşil / Yeterli)
  * Güncel Bilgiler: **164** soru (Yeşil / Yeterli)
* **Tamamen Eksik (0 Soru Olan) Dersler:**
  * **Türkçe:** 0 Soru (Hedef: 500)
  * **Matematik & Geometri:** 0 Soru (Hedef: 500)
  * **DHBT (Din Hizmetleri):** 0 Soru (Hedef: 400)
  * **MEB-AGS (Öğretmenlik):** 0 Soru (Hedef: 600)
  * **A Grubu (Hukuk, İktisat vb.):** 0 Soru (Hedef: 800)
* **Kural:** Üretilecek tüm yeni sorularda **"⚠️ ÖSYM Çeldirici Tuzağı"** (`distractorTrap`) açıklaması zorunludur.

---

### 4. Graphify Skill'inin Projeye Eklenmesi (Token Tasarrufu)
* Yapay zeka ajanlarının kod tabanında gezinirken on binlerce token harcamasını önlemek için açık kaynak **Graphify** skilli projeye dahil edildi:
  * Dosya: `.agents/skills/graphify/SKILL.md`
  * AST (Tree-sitter) tabanlı bilgi grafiği çıkarır (`graphify-out/graph.json`).
  * Ajan tüm dosyaları okumak yerine grafiği sorgular (`graphify query "..." --budget 1500`), **%70-80 token tasarrufu** sağlar.
  * Bağımlılık CLI paketi: `pip install graphifyy` veya `uv tool install graphifyy`.

---

### 5. Claude Code / CLI Bilgilendirmesi
* Claude Code, Anthropic'in doğrudan terminalde çalışan resmi kodlama ajanıdır (`npm install -g @anthropic-ai/claude-code`).
* Bilgisayarda `Node.js v26.13.1` ve `npm 11.20.0` hazır durumdadır.
* Proje kök dizinindeki `CLAUDE.md` dosyası sayesinde Claude Code açıldığı anda proje kurallarını otomatik olarak tanır.

---

## 📌 Claude İçin Hemen Başlanacak Öncelikli 3 İş:
1. `AndroidManifest.xml` içine `POST_NOTIFICATIONS` iznini eklemek.
2. Faz 9 kapsamındaki RevenueCat veya AdMob canlı kimlik yapılandırmasına başlamak.
3. Eksik olan Türkçe ve Matematik dersleri için soru üretim şablonunu çalıştırmak.

---

## 🧭 Claude İncelemesi: Doğrulama & Ek Öneriler (20 Kasım 2026)

> Yukarıdaki maddeler kod tabanıyla tek tek karşılaştırıldı. **Kesin kaynak her zaman `docs/task-board.md`'dir**; bu dosya yalnızca oturum devri notudur.

### A. Doğrulama Sonuçları

| Madde | Durum | Kodda Görülen |
|---|---|---|
| 1.1 `POST_NOTIFICATIONS` eksik | ✅ Doğru, **ama eksik** | Manifestte yalnızca `INTERNET`, `ACCESS_NETWORK_STATE`, `AD_ID` var. Ayrıca kodda **çalışma anı izin isteği de yok** (`requestNotificationsPermission()` hiç çağrılmıyor). Android 13+'ta yalnızca manifest satırı yetmez; kullanıcıdan izin istenmezse bildirim yine gelmez. Zamanlama `inexactAllowWhileIdle` olduğu için `SCHEDULE_EXACT_ALARM` gerekmez. |
| 1.2 AdMob test kimlikleri | ✅ Doğru | Manifest App ID ve `ad_service.dart` birim ID'leri Google'ın test kimlikleri (`ca-app-pub-3940256099942544…`). UMP rıza akışı yok. **Yeni paket gerekmez:** UMP API'si (`ConsentInformation`, `ConsentForm`) zaten `google_mobile_ads` içinde. |
| 1.3 RevenueCat mock | ✅ Doğru, **ama eksik** | `purchase_service.dart` içinde `apiKey = 'appl_mock_revenuecat_key'` sabit yazılı (ve Android'de `appl_` değil `goog_` anahtar gerekir). Belgede yalnızca 2 SKU geçiyor; kodda **3 ürün** var: `kadro_pro_monthly`, `kadro_pro_yearly` ve **`kadro_pro_lifetime`** ("Sınava Kadar", 349 ₺). Lifetime bir abonelik değil, Play Console'da **tek seferlik uygulama içi ürün** olarak açılmalı. Entitlement adı: `pro` / `kadro_pro`. |
| 1.5 Kapalı test: 20 kullanıcı | ⚠️ Güncel değil | Google, kişisel hesaplar için şartı **12 test kullanıcısı / 14 gün** olarak güncelledi (Aralık 2024). Yayından önce Play Console'daki güncel metinle teyit et. |
| 2. Faz 8–10 "açık" | ❌ **Yanlış** | Task board'a göre Supabase Auth/DB/senkron (`TASK-25`–`TASK-28`, `TASK-35`), RevenueCat paywall (`TASK-40`) ve AdMob ödüllü reklam (`TASK-41`) **tamamlandı** (Mobil ✅). Burada "Faz" numaraları öğrenme rehberinin fazlarıyla karışmış. Açık olan kod değil, **canlı kimliklerin ve mağaza tarafının** yapılandırması. |
| 3. Soru sayıları | ❌ **Sayılar hatalı** | Yerel `assets/data/questions/sample_questions.json` gerçekte: **Tarih 620, Coğrafya 364, Vatandaşlık 300, Güncel 240** (toplam 1.524 doğru, dağılım yanlış). Canlı Supabase'de ise 2.112 çoktan seçmeli soru var (Tarih 665, Coğrafya 360, Vatandaşlık 604, Güncel 483; kaynak: `kadro-web/docs/MOBILE_WEB_PARITY.md`). Yerel yedek ile canlı havuz arasında ~590 soruluk fark var. |
| 4. Graphify | ✅ Kuruldu (20 Kasım 2026) | python.org Python 3.12 + `uv tool install graphifyy` (0.9.113) kullanıcının kendi terminalinden kuruldu; skill `.claude/skills/graphify/` altında. Dart desteklenir (kendi ayrıştırıcısı). **Otomatik hook'lar (`.claude/settings.json`) bilerek kurulmadı**; önce `/graphify .` ile elle denenecek. Kurulum notu: Claude uygulaması içinden kurulum sanal klasöre gider ve Akıllı Uygulama Denetimi imzasız Python DLL'ini engeller; bu yüzden kurulum dış terminalden yapıldı. |
| 5. `CLAUDE.md` | ⚠️ Var ama çelişkili | Yeni eklenen `CLAUDE.md` takip edilmiyor (commit'lenmemiş). (a) `GEMINI.md`'yi içe aktarmıyor, dolayısıyla **Mobil ↔ Web eşleniklik kuralları** Claude'a ulaşmıyor; (b) "her değişiklikten sonra `flutter test`" diyor. Bu, yeni `flutter-verify` kuralıyla (yalnızca etkilenen testler: `node tools/affected_tests.mjs --run`) çelişiyor. Claude Code masaüstü uygulamasında hazır olduğu için `npm install -g` gerekmez. |

### B. Play Store Çıkışı İçin Listede Olmayan Eksikler

1. **Bildirim izin akışı:** Manifest izni + ilk hatırlatıcı açılırken (veya onboarding sonunda) `AndroidFlutterLocalNotificationsPlugin.requestNotificationsPermission()` çağrısı; kullanıcı reddederse Profil'de "Bildirimleri aç" yönlendirmesi.
2. **Gizlilik politikası URL'si:** `docs/store_listing.md` hâlâ yer tutucu (`https://kadro.app/privacy-policy`) kullanıyor. Web'de zaten `/gizlilik` ve `/kullanim-kosullari` sayfaları var; Play Console'a **web alan adındaki `/gizlilik`** adresi verilmeli (tek kaynak, iki platform aynı metin).
3. **Hesap silme web bağlantısı:** Uygulama içinde hesap silme var (`auth_notifier.dart`, `profile_screen.dart`). Google Play ayrıca **uygulamayı silmiş kullanıcılar için web üzerinden silme talebi bağlantısı** istiyor → `kadro-web`'de `/hesap-silme` sayfası (🌐 Web görevi, Mobil 🚫).
4. **Veri Güvenliği (Data Safety) formu:** Supabase (e-posta, ilerleme), AdMob (reklam kimliği), RevenueCat (satın alma) ve Sentry (çökme verisi) beyan edilmeli. `AD_ID` izni olduğu için reklam kimliği beyanı zorunlu.
5. **`app-ads.txt`:** AdMob canlıya geçince web alan adının köküne `app-ads.txt` konmalı (Next.js `public/app-ads.txt` → yine Web görevi).
6. **Gizli anahtarlar koda gömülmemeli:** Canlı RevenueCat ve AdMob kimlikleri `--dart-define` / `String.fromEnvironment` ile verilmeli; mock değerler sadece debug'da kalmalı. Test kimliklerinin yanlışlıkla release'e çıkmaması için release modunda test ID kullanılırsa uyarı/log veren bir koruma eklenmeli.
7. **Web kalıntıları:** `kIsWeb` dalları hâlâ `theme.dart`, `supabase_config.dart`, `ad_service.dart`, `notification_service.dart`, `purchase_service.dart` içinde. Web ayrı depoya taşındığı için temizlenebilir (davranış değişmez, kod sadeleşir).

### C. Çalışma Düzeni Önerileri

1. ✅ **`CLAUDE.md` `GEMINI.md`'ye bağlandı (yapıldı):** `@GEMINI.md` içe aktarılıyor, tekrarlanan kurallar kaldırıldı, test komutu `node tools/affected_tests.mjs --run` oldu; Gemini ve Claude artık aynı kuralları okur.
2. **Bu handoff dosyası her oturumda üzerine yazılsın, büyümesin:** "Son durum + açık sorular + sıradaki 3 iş" formatında kalmalı; tamamlanan işler task board'a taşınır.
3. **Task board'u hafiflet:** 6.500 satırın çoğu tamamlanmış görev paketleri. `TASK-01`–`TASK-155` detay paketleri `docs/task-archive/` altına taşınırsa ana dosya tablo + kurallar + açık görevlere iner; her oturumda okunacak metin ~%85 azalır.
4. **Yeni görevler eşlenik şablonla açılsın:** Aşağıdaki işlerin her biri task board'daki "Eşlenik Görev Şablonu" ile yazılmalı (ör. bildirim izni → 📱 Mobil, Web 🚫; hesap silme sayfası → 🌐 Web, Mobil 🚫; UMP rızası → 📱 Mobil, Web için çerez banner'ı ayrı değerlendirilir).

### D. Güncellenmiş Öncelik Sırası (Önerilen)

1. **Bildirim izni (manifest + çalışma anı isteği)** — küçük, risksiz, hemen yapılabilir. *(📱 Mobil)*
2. **Canlı kimlik altyapısı:** RevenueCat `goog_` anahtarı + AdMob canlı ID'leri `--dart-define` ile; UMP rıza akışı. Anahtarları sen Play Console / RevenueCat / AdMob panelinden alırsın, kod tarafını Claude hazırlar. *(📱 Mobil)*
3. **Mağaza uyumluluğu:** `/gizlilik` URL'si, `/hesap-silme` web sayfası, `app-ads.txt`, Data Safety formu. *(🌐 Web + Play Console)*
4. **Soru üretimi (Türkçe & Matematik):** Önce `TASK-139` (içerik doğrulama/linter). Linter Python tabanlıysa Python kurulmalı veya Node'a taşınmalı; ardından `TASK-140`. Ayrıca yerel `sample_questions.json` ile canlı havuz arasındaki ~590 soruluk farkın kapatılması (çevrimdışı yedeğin güncellenmesi) değerlendirilmeli.
