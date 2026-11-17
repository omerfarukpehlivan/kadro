/// Kadro: KPSS Genel Kültür Uygulaması Hukuki & Yasal Metinler.
///
/// Google Play Store, KVKK (6698 sayılı kanun) ve GDPR uyumluluğu için
/// gerekli olan resmi aydınlatma metinlerini, kullanım koşullarını ve telif beyanlarını içerir.
class LegalDocuments {
  LegalDocuments._();

  /// Resmi destek ve veri sorumlusu e-postası.
  static const String contactEmail = 'destek@kadro.app';

  /// Google Play Console'a girilecek resmi web gizlilik sayfası.
  static const String privacyPolicyUrl = 'https://kadro.app/gizlilik';

  /// Google Play Account Deletion kuralı için dış web silme talep linki.
  static const String accountDeletionUrl = 'https://kadro.app/hesap-silme';

  /// ÖSYM ve kamu kurumları telif & bağımsızlık kısa sorumluluk reddi.
  static const String shortOsymDisclaimer =
      'Kadro bağımsız bir KPSS hazırlık platformudur. ÖSYM, MEB veya herhangi bir '
      'resmi devlet kurumu ile doğrudan veya dolaylı bir bağı bulunmamaktadır. '
      'Sorularımız ÖSYM telif hakkına tabi çıkmış sorular değil; sınav formatına '
      'birebir uyumlu özgün sorulardır.';

  /// 6698 Sayılı KVKK Aydınlatma Metni & Gizlilik Politikası Başlığı.
  static const String privacyTitle =
      'Gizlilik Politikası & KVKK Aydınlatma Metni';

  /// 6698 Sayılı KVKK Aydınlatma Metni & Gizlilik Politikası Tam Metni.
  static const String privacyBody =
      '''
SON GÜNCELLEME: 9 KASIM 2026

1. VERİ SORUMLUSU
6698 sayılı Kişisel Verilerin Korunması Kanunu ("KVKK") ve ilgili mevzuat kapsamında, "Kadro: KPSS Genel Kültür" mobil uygulaması ("Uygulama") nezdinde kişisel verileriniz veri sorumlusu sıfatıyla Kadro Geliştirici Ekibi tarafından aşağıda açıklanan çerçevede işlenmektedir.

2. TOPLANAN KİŞİSEL VERİLER
Uygulamamız asgari veri prensibi (data minimization) doğrultusunda sadece eğitiminizi kişiselleştirmek için gereken verileri işler:
• Kimlik & İletişim Bilgileri: İsteğe bağlı olarak hesap açarken paylaştığınız e-posta adresi, kullanıcı adı ve şifrelenmiş kimlik belirteci (Auth UUID).
• Akademik & Kullanım Verileri: Çözülen test ve deneme oturumları, doğru/yanlış/boş sayıları, konu bazlı ustalık yüzdeleri, Yanlış Defteri kayıtları, günlük soru serileri (streak), hedef KPSS puanı ve çalışma süresi tercihleri.
• Cihaz & Performans Verileri: İşletim sistemi sürümü, uygulama versiyonu ve uygulamanın çökmesi durumunda anonim hata logları (Sentry).

3. KİŞİSEL VERİLERİN İŞLENME AMAÇLARI
Kişisel verileriniz şu amaçlarla işlenmektedir:
• Cihazlar arası veri senkronizasyonunu sağlamak (başka bir telefondan giriş yaptığınızda sınav ilerlemenizin korunması).
• Size özel KPSS net karnesi, zayıf konu analizleri ve günlük çalışma programı oluşturmak.
• Kadro PRO abonelik haklarının tanımlanması ve çevrimdışı indirme lisanslarının doğrulanması.
• Uygulama güvenliğini sağlamak, hile ve kötüye kullanımı önlemek.

4. ÜÇÜNCÜ TARAF SERVİSLER VE VERİ AKTARIMI
Kişisel verileriniz hiçbir koşulda ticari amaçla satılmaz veya kiralanmaz. Uygulamanın çalışması için aşağıdaki güvenilir teknik altyapılar kullanılmaktadır:
• Supabase: Veri tabanı, şifrelenmiş bulut depolama ve kimlik doğrulama altyapısı (PostgreSQL RLS politikaları ile korunur).
• Google Play Hizmetleri: Güvenli uygulama içi satın alma, abonelik yönetimi ve lisans kontrolü.
• Google AdMob: Ücretsiz kullanıcılara yönelik ödüllü reklam gösterimi (Kişiselleştirilmemiş veya izne tabi reklam kimliği).
• Sentry: Uygulama çökmelerini ve teknik hataları tespit edip düzeltmek amacıyla anonim hata telemetrisi.

5. VERİ GÜVENLİĞİ VE SAKLAMA SÜRESİ
Verileriniz endüstri standardı 256-bit SSL/TLS şifreleme ve veritabanı düzeyinde Row Level Security (RLS) ile korunmaktadır. Hesabınız aktif olduğu sürece verileriniz saklanır; hesap silme talebinde bulunmanız halinde tüm sınav kayıtlarınız kalıcı olarak tasfiye edilir.

6. HAKLARINIZ (KVKK MADDE 11)
KVKK Madde 11 uyarınca herkes veri sorumlusuna başvurarak;
a) Kişisel verilerinin işlenip işlenmediğini öğrenme,
b) İşlenmişse buna ilişkin bilgi talep etme,
c) Kişisel verilerin silinmesini veya yok edilmesini isteme,
ç) Verilerin kanuna aykırı olarak işlenmesi sebebiyle zarara uğraması hâlinde zararın giderilmesini talep etme haklarına sahiptir.

7. İLETİŞİM
Taleplerinizi ve sorularınızı $contactEmail adresine iletebilirsiniz. Başvurularınız en geç 30 gün içinde ücretsiz olarak sonuçlandırılır.
''';

  /// Kullanım Koşulları & Sözleşme Başlığı.
  static const String termsTitle = 'Kullanım Koşulları & Lisans Sözleşmesi';

  /// Kullanım Koşulları & Sözleşme Tam Metni.
  static const String termsBody =
      '''
SON GÜNCELLEME: 9 KASIM 2026

Lütfen Kadro mobil uygulamasını kullanmadan önce bu Kullanım Koşullarını dikkatlice okuyunuz. Uygulamayı indirerek veya kullanarak bu şartları kabul etmiş sayılırsınız.

1. HİZMETİN KAPSAMI
Kadro, KPSS Genel Kültür (Tarih, Coğrafya, Vatandaşlık, Güncel Bilgiler) sınavına hazırlanan adaylar için özgün soru bankası, deneme sınavları, akıllı çalışma planlayıcı ve pedagojik analiz araçları sunan bir mobil eğitim yazılımıdır.

2. RESMİ KURUM BAĞIMSIZLIĞI VE ÖSYM SORUMLULUK REDDİ
• Kadro bağımsız bir özel eğitim girişimidir; ÖSYM (Ölçme, Seçme ve Yerleştirme Merkezi), MEB veya T.C. resmi kurumları ile hiçbir kurumsal, idari veya ticari bağlantısı yoktur.
• Uygulamadaki sorular ÖSYM'nin geçmiş yıllarda yaptığı telifli sınav sorularının kopyası veya aktarımı DEĞİLDİR. Tamamı alanında uzman eğitmenlerce ÖSYM soru formatı ve kazanımlarına uyumlu olarak hazırlanmış özgün sorulardır.
• Uygulama, kullanıcının KPSS'de belirli bir puan alacağını veya atanacağını garanti etmez; çalışma aracı niteliğindedir.

3. FİKRİ MÜLKİYET HAKLARI
Uygulama arayüzü, grafikler, yazılım kodları, Tuğrul maskot tasarımları, veritabanı, UWorld modeli "ÖSYM Çeldirici Tuzağı" analizleri ve özgün soru metinleri Kadro'nun telif hakkı koruması altındadır. Yazılı izin olmaksızın kopyalanamaz, çoğaltılamaz, kazınamaz (scrape edilemez) veya ticari amaçla satılamaz.

4. HESAP GÜVENLİĞİ VE KULLANIM KURALLARI
• Kullanıcı, hesap giriş bilgilerini üçüncü kişilerle paylaşmamakla yükümlüdür.
• Uygulama güvenliğini bozmaya yönelik tersine mühendislik (reverse engineering), otomatik bot/scraping sorguları veya sunucuya aşırı yük bindirme girişimleri tespit edildiğinde hesap feshedilebilir.

5. KADRO PRO ABONELİK VE ÜCRETLENDİRME ŞARTLARI
• Kadro, günlük 30 soru hakkı içeren ücretsiz bir temel sürüm ile sınırsız soru ve gelişmiş analitik sunan "Kadro PRO" abonelik seçeneğine sahiptir.
• Satın alma işlemleri Google Play Store üzerinden gerçekleştirilir ve Google Play Satış Koşullarına tabidir.
• Abonelikler, dönem bitiminden en az 24 saat önce iptal edilmediği sürece otomatik olarak yenilenir. Aboneliğinizi dilediğiniz an Google Play Store > Abonelikler menüsünden iptal edebilirsiniz.
• İade talepleri Google Play İade Politikaları çerçevesinde değerlendirilir.

6. HESAP VE VERİ SİLME
Kullanıcı dilediği an uygulama içi Profil > Hukuki & Gizlilik > Hesabımı ve Verilerimi Sil adımıyla veya $accountDeletionUrl adresinden hesabını ve tüm sınav geçmişini geri alınamaz şekilde kalıcı olarak silebilir.

7. DEĞİŞİKLİKLER VE YÜRÜRLÜK
Kadro, mevzuat değişiklikleri veya yeni özellikler doğrultusunda bu koşulları güncelleme hakkını saklı tutar. Değişiklikler uygulama içinde yayınlandığı tarihte yürürlüğe girer.
''';
}
