# Lavanta soru platformu — birleştirilmiş kaynak

Bu paket, mevcut SPK uygulamasındaki 635 soruyu Meslek Hukuku, Vergi Hukuku ve Denetim soru bankalarıyla aynı arayüzde birleştirir.

## Vercel'e yükleme

1. GitHub deposunda mevcut `README.md` dışında bu paketteki `index.html`, `supabase-config.js` ve `supabase-schema.sql` dosyalarını kök dizine ekleyin.
2. Vercel projesinde **Settings → Git** bölümünden bu depoyu bağlayın.
3. Supabase ile cihazlar arası kullanıcı ilerlemesi isteniyorsa önce `supabase-schema.sql` dosyasını Supabase SQL Editor'da çalıştırın; ardından `supabase-config.js` içindeki `url` ve `publishableKey` değerlerini doldurun. `service_role` veya secret anahtar kullanmayın.
4. Vercel'de Build and Deployment için statik HTML proje kökünü kullanın; build command gerekmez. `index.html` kök dizinde olmalıdır.

Supabase bilgileri boş bırakılırsa soru çözme arayüzü çalışır, ancak ilerleme yalnızca o tarayıcıda saklanır.
önizleme dalı
