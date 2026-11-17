# 🌐 Kadro Web Yayına Alım & Mimari Kılavuzu (`TASK-145`, `TASK-151`, `TASK-152`)

## 1. Üretim Derlemesi (Wasm + Path URL)

Flutter `3.47+` ile çok iş parçacıklı WebAssembly derlemesi alınabilir:

```bash
flutter build web --wasm --release \
  --dart-define=SUPABASE_URL=https://<proje>.supabase.co \
  --dart-define=SUPABASE_ANON_KEY=<anon-key> \
  --dart-define=WEB_CHECKOUT_URL=https://<proje>.supabase.co/functions/v1/create-web-checkout
```

## 2. Zorunlu HTTP Başlıkları ve SPA Rewrite

Uygulama `usePathUrlStrategy()` ile temiz yollar (`/lessons`, `/exams`, `/calculator`, `/curriculum-preview`) kullanır. Doğrudan yenileme (`F5`) sırasında `404` almamak ve `--wasm` multi-thread desteğini açmak için aşağıdaki kurallar barındırma sağlayıcısına eklenmelidir.

### Cloudflare Pages / Netlify (`_headers` & `_redirects`)
```text
/*    /index.html   200
```
```text
/*
  Cross-Origin-Embedder-Policy: credentialless
  Cross-Origin-Opener-Policy: same-origin
  X-Frame-Options: SAMEORIGIN
```

### Vercel (`vercel.json`)
```json
{
  "rewrites": [{ "source": "/(.*)", "destination": "/index.html" }],
  "headers": [
    {
      "source": "/(.*)",
      "headers": [
        { "key": "Cross-Origin-Opener-Policy", "value": "same-origin" },
        { "key": "Cross-Origin-Embedder-Policy", "value": "credentialless" }
      ]
    }
  ]
}
```

## 3. Web Ödeme Köprüsü (`iyzico` / `RevenueCat Web` -> Supabase `subscriptions`)

1. Kullanıcı Web'de PRO paketi seçtiğinde `PurchaseService.initiatePurchase(...)` `WEB_CHECKOUT_URL` Edge Function adresini `plan_id` ve `user_id` ile açar.
2. Ödeme tamamlandığında `iyzico` / `Stripe` webhook'u Supabase Edge Function'a gelir ve `service_role` ile `public.subscriptions` tablosuna `status = 'active'` satırı yazar (`docs/supabase_migrations/06_web_subscriptions.sql`).
3. Veritabanı tetikleyicisi `public.profiles.is_pro` alanını otomatik olarak `true` yapar.
4. Flutter Web istemcisi dönüşte `PurchaseService.verifyProEntitlement()` çağrısı ile yetkiyi sunucudan teyit eder.

## 4. Opsiyonel SEO Vitrin Köprüsü (`kadro.com` -> `app.kadro.com`)

Google arama trafiği (ör. *"KPSS P3 puan hesapla"*, *"MEB-AGS ÖABT konuları"*) hedeflendiğinde:
- **`kadro.com` (Astro / Next.js Statik Vitrin):** Tanıtım, konu rehberleri, SSS ve blog yazıları barındırır; `"Hemen Başla"` ve `"Puan Hesapla"` CTA butonları doğrudan Flutter Web alt alan adına (`https://app.kadro.com/calculator?exam=meb_ags`, `https://app.kadro.com/curriculum-preview`) yönlenir.
- **Supabase OAuth:** Google Sign-In Redirect URL listesine hem `https://app.kadro.com` hem yerel test için `http://localhost:*` eklenmelidir.
