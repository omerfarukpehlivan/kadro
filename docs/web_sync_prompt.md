Sen kıdemli bir full-stack mühendissin. Kadro adlı KPSS hazırlık uygulamasının **web sürümünü** geliştiriyoruz. Mobil uygulama (Flutter) zaten var ve **Supabase** kullanıyor. Web uygulaması **aynı Supabase projesine, aynı tablolara ve aynı veri formatlarına** bağlanacak. Aynı hesapla hem mobilde hem web'de giriş yapıldığında kullanıcı ilerlemesine kaldığı yerden devam edebilmeli. Mobildeki eşitleme davranışını **birebir** uygula. Yeni backend yazma, yeni tablo veya yeni alan icat etme.

## 0. Kurallar

- Yalnızca `supabase-js` ve **anon key** kullan. `service_role` anahtarını asla istemciye koyma.
- URL ve anon key'i ortam değişkeninden oku (`SUPABASE_URL`, `SUPABASE_ANON_KEY`). Mobil ile aynı proje olmalı.
- Tablo/kolon adlarını aşağıda yazıldığı gibi kullan (snake_case). Şemada olmayan alan ekleme.
- Tüm sorgular giriş yapmış kullanıcıya (`auth.uid()`) göre çalışır. Her yazma/okumada `user_id` = `auth.user.id`.
- Yeni kolonlar eski şemada yoksa hata gelebilir. Mobil bu durumda "kolonu çıkarıp tekrar dene" yapıyor. Aynı fallback'i uygula (aşağıda belirtildi).
- Yerel önbellek kullanırsan anahtarları hesaba göre ayır (`accountKey = email.toLowerCase()`). Çıkışta tüm yerel veriyi sil.

## 1. Oturum ve hidrasyon akışı

`supabase.auth.onAuthStateChange` dinle:

- `SIGNED_IN` veya `INITIAL_SESSION` ve kullanıcı varsa: `isHydrating = true` yap, `hydrateAllFromCloud()` çalıştır, bitince `isHydrating = false`. Aynı anda ikinci hidrasyon başlatma (devam eden varsa onu bekle).
- `SIGNED_OUT`: auth state'i sıfırla, yerel stats, tercihler, plan, yanlış defteri ve flashcard verilerini temizle.
- Sayfa yenilenince oturum varsa (`getSession`) hidrasyonu yine çalıştır.

`hydrateAllFromCloud()` **şu sırayla** (sıralı, her adım try/catch içinde, bir adım hata verirse sonrakine devam):

1. Tercihler (`fetchUserPreferences`)
2. İstatistikler (`studyStats.loadFromCloud`)
3. Çalışma planı (`planner.loadTasksFromCloud`)
4. Yanlış defteri (`mistakes.hydrateFromCloud`)
5. Bilgi kartı tekrarları (`flashcards.hydrateFromCloud(activeScope)`), `activeScope` adım 1'deki `exam_selection.scopeKey`

Her adımdan önce oturumun hâlâ aynı kullanıcıya ait olup olmadığını kontrol et.

## 2. Veri sözleşmesi

### 2.1 `profiles` tablosu (satır id = auth user id)

Kullanılan kolonlar:
`target_exam`, `exam_selection` (jsonb), `study_pace`, `target_kpss_score`, `focus_lesson`, `has_active_study_program`, `is_pro`, `daily_goal_questions`, `daily_free_limit`, `last_study_date`, `total_xp`, `league_tier`, `current_streak_days`, `daily_solved_count`, `planner_state` (jsonb), `updated_at`.

**Tercihleri yazma** (`syncUserPreferences`), iki katmana:
1. `supabase.auth.updateUser({ data: prefMap })`. `prefMap` anahtarları: `target_exam`, `exam_selection`, `study_pace`, `target_kpss_score`, `focus_lesson`, `has_active_study_program`, `has_completed_onboarding`, `daily_free_limit`, `daily_quota_date`.
2. `profiles` tablosunda `update(...)`.eq('id', userId). Bu payload'tan `has_completed_onboarding` ve `daily_quota_date` çıkarılır. `daily_quota_date` varsa `last_study_date` olarak yazılır. Hata mesajı `exam_selection` içeriyorsa o alanı çıkarıp tekrar dene.

**Tercihleri okuma** (`fetchUserPreferences`):
- Önce `user.user_metadata` değerlerini al, sonra `profiles` satırındakilerle üzerine yaz (`target_exam`, `exam_selection` (boş değilse), `study_pace`, `target_kpss_score`, `focus_lesson`, `has_active_study_program`, `is_pro`, `daily_goal_questions`, `daily_free_limit`, `planner_state` (boş değilse)).
- Günlük kota tarihi: `user_metadata.daily_quota_date` veya `profiles.last_study_date` (ilk 10 karakter, `YYYY-MM-DD`).
- `has_completed_onboarding = true` sayılır: metadata'da `true` ise VEYA `has_active_study_program == true` ise VEYA `planner_state` boş olmayan bir obje ise. Aksi halde `false`. DB varsayılan `target_exam='lisans'` veya boş `{}` planner_state onboarding sayılmaz.

**Profil istatistiklerini yazma** (`syncProfileStats`): `profiles.update({ total_xp, league_tier, daily_goal_questions, last_study_date: bugün(YYYY-MM-DD), updated_at, current_streak_days (yalnızca >0 ise), daily_solved_count, daily_free_limit })`.eq('id', userId). 5 saniyede en fazla 1 istek (rate limit), `force` hariç.

### 2.2 Çalışma planı (`planner_state` JSON, `PlannerSyncSnapshot`)

Aynı JSON, hem `auth.user_metadata.planner_state` hem `profiles.planner_state` içine yazılır (iki katman).

```json
{
  "cycle_day": 1,
  "max_unlocked_day": 1,
  "completed_task_ids": ["task_id"],
  "custom_tasks_by_day": { "3": [ StudyTaskJson ] },
  "tasks_by_day": { "1": [ StudyTaskJson ] },
  "exam_scope": "lisans_gk",
  "last_planned_date": "YYYY-MM-DD",
  "is_sprint_mode_active": false,
  "weekly_study_days": [1,2,3,4,5,6,7],
  "updated_at": "ISO-8601 UTC"
}
```

`StudyTaskJson` (camelCase): `id`, `title`, `lessonTag`, `estimatedMinutes`, `isCompleted`, `actionType` (`quiz|flashcards|mistakes|custom|exam|map|game`), opsiyonel `targetTopic`, `targetTestNumber`, `targetCount`, `startIndex`, `targetExamNumber`, `examScope` (varsayılan `lisans_gk` ise yazılmaz).

Okurken hem snake_case hem camelCase anahtarları kabul et (`cycle_day`/`cycleDay`, `max_unlocked_day`/`maxUnlockedDay`, `completed_task_ids`/`completedTaskIds`, `tasks_by_day`/`tasksByDay`, `exam_scope`/`examScope`, vb.). `cycle_day` en az 1. `max_unlocked_day = max(cycle_day, max_unlocked_day)`. `tasks_by_day` içinde `isCompleted` olan görev id'lerini `completed_task_ids`'e ekle.

**`fetchPlannerSnapshot`:** `user_metadata.planner_state` ve `profiles.planner_state` ikisini de oku. Profilde en az bir `cycle_day`/`max_unlocked_day`/`completed_task_ids` anahtarı olmalı, yoksa yok say. İkisi de varsa `mergeWith` ile birleştir.

**`mergeWith` (High-Water Mark), birebir uygula:**
1. `completed_task_ids` = iki tarafın birleşimi (union).
2. `exam_scope` farklıysa: `updated_at`'i yeni (eşitse `this`) olan kazanır. Kazanan boş ilerlemeyse ve kaybeden doluysa kaybeden kazanır. Sonuç, kazanan + birleşik `completed_task_ids` + büyük `updated_at`.
3. Aynı kapsamda: `max_unlocked_day = max(a, b)`. `cycle_day`: `max_unlocked_day`'i büyük olanın `cycle_day`'i. Eşitse `max(cycle_day)`. Sonra `[1, max_unlocked_day]` aralığına kısılır.
4. `custom_tasks_by_day`: gün bazında `id` ile tekilleştir. İki tarafta da varsa tamamlanmış olan tercih edilir.
5. `tasks_by_day`: gün bazında. Yalnızca bir tarafta varsa o liste (tamamlananlar birleşik kümeyle işaretlenir). İki tarafta da varsa: daha çok göreve sahip liste, eşitse `updated_at` yeni olan liste baz alınır. Baz listedeki her görev şu durumlarda `isCompleted=true` olur: kendisi tamamlanmış, id birleşik kümede, veya diğer listedeki tamamlanmış bir görevle `isSameTaskItem`. Diğer listede tamamlanmış olup bazda eşleşmesi olmayan görevler de eklenir.
6. `is_sprint_mode_active` = OR. `weekly_study_days` ve `last_planned_date` = `updated_at`'i yeni olan taraftan. `updated_at` = max.

`isSameTaskItem(a,b)`: `examScope` farklıysa false. `id` eşitse true. `contentIdentity` eşitse true. İkisi de `quiz`/`custom` değil ve `actionType` aynıysa true.
`contentIdentity`: `scopePrefix = examScope=='lisans_gk' ? '' : examScope+':'`. `quiz` ve `targetTopic` ve `targetTestNumber` varsa `${scopePrefix}quiz:${lessonTag}:${targetTopic}:${targetTestNumber}`. `exam` ve `targetExamNumber` varsa `${scopePrefix}exam:${targetExamNumber}`. Aksi halde `${scopePrefix}${actionType}:${lessonTag}:${title}`.

`isEmptyProgress`: `cycle_day<=1 && max_unlocked_day<=1 && completed boş && custom boş && tasks_by_day boş && !sprint`.

**`loadTasksFromCloud` birleştirme sırası:** bulut snapshot (boş değilse) → hesaba bağlı yerel snapshot ile `mergeWith` → anlık yerel durum (boş değilse) ile `mergeWith`. Sonuç boş değilse uygula. Bulut boşsa veya yerelde ilerleme varsa sonucu buluta geri yaz. Hiç snapshot yoksa `study_tasks` tablosundan görevleri çek.

**Her değişiklikten sonra:** yerel kaydet, ardından buluta yaz (`syncPlannerSnapshot`: önce `auth.updateUser({ data: { planner_state } })`, sonra `profiles.update({ planner_state, updated_at })`). Hiç dokunulmamış varsayılan görevler (`task_1..3`) için boş snapshot yaz.

`study_tasks` tablosu: `insert({ user_id, title, lesson_tag, estimated_minutes, action_type, is_completed })` (özel görev ekleyince). Tamamlama değişince `title` ve `user_id` ile `is_completed` güncelle.

### 2.3 Quiz oturumları, soru logları, ustalık

- `quiz_sessions` insert: `user_id, session_title, session_mode('topic_quiz'), lesson, exam_scope, total_questions, correct_count, wrong_count, empty_count, net_score, earned_xp, duration_seconds, completed_at`. `exam_scope` kolonu yoksa çıkarıp tekrar dene.
- `question_attempt_logs` **toplu** insert (kuyrukta 10 kayıt olunca veya oturum bitince): `user_id, question_text, lesson, topic, exam_scope, is_correct, time_spent_seconds` + opsiyonel `question_id, selected_answer, correct_answer`. `exam_scope` yoksa çıkarıp tekrar dene.
- `user_topic_mastery` upsert, `onConflict: 'user_id,exam_scope,lesson,topic'`. Alanlar: `total_solved, total_correct, total_time_seconds, mastery_percent = round(correct/solved*100), last_studied_at`. Conflict hatası gelirse `exam_scope`'suz, `onConflict: 'user_id,lesson,topic'` ile tekrar dene.
- Hidrasyonda: `quiz_sessions` (oturum geçmişi), `user_topic_mastery` (`select * where user_id`) ve `profiles` (XP, lig, seri, günlük sayaç) okunur.

### 2.4 Yanlış defteri (Leitner)

Kaynak `question_attempt_logs`. Okuma: `select question_id, question_text, lesson, topic, exam_scope, review_box, next_review_at, box4_streak where user_id = me and is_correct = false and is_resolved_in_mistakes = false order by attempted_at desc limit 100`. Yeni kolonlar yoksa yalnızca `question_id, question_text, lesson, topic` ile tekrar dene.

Güncelleme: `update({ review_box, next_review_at, box4_streak, is_resolved_in_mistakes })` `user_id` ve `question_text` eşleşmesiyle. Yeni kolon hatasında yalnızca çözüldüyse `is_resolved_in_mistakes=true` yaz.

**Leitner kuralı (`lib/core/utils/leitner_scheduler.dart` ile birebir):** kutu aralıkları `[1, 3, 7, 14]` gün (kutu 1..4). `advance(currentBox, box4Streak, isCorrect)`:
- Yanlış: `reviewBox=1`, `nextReviewAt = şimdi + 1 gün`, `box4Streak=0`, `isGraduated=false`.
- Doğru ve kutu < 4: `reviewBox = kutu+1`, `nextReviewAt = şimdi + aralık(yeni kutu)`, `box4Streak=0`, `isGraduated=false`.
- Doğru ve kutu = 4: `reviewBox=4`, `nextReviewAt = şimdi + 14 gün`, `box4Streak = eski+1`, `isGraduated = (box4Streak >= 2)`.
- Vadesi gelmiş (`isDue`): `nextReviewAt <= şimdi`. "Bugün tekrar" kuyruğu bunlardan oluşur.

Yanlış defterinde `isGraduated` olan soru çözülmüş sayılır (`is_resolved_in_mistakes=true`). Bu eşleme için `lib/features/mistakes/data/mistake_repository.dart` dosyasını port referansı al.

### 2.5 Bilgi kartları

`user_flashcard_reviews` upsert, `onConflict: 'user_id,exam_scope,card_id'`: `user_id, exam_scope, card_id, review_box, next_review_at, last_reviewed_at (varsa), box4_streak, is_graduated`. Okuma: `select card_id, exam_scope, review_box, next_review_at, last_reviewed_at, box4_streak, is_graduated where user_id = me and exam_scope = activeScope`. Aynı Leitner kurallarını kullan.

### 2.6 PRO

`profiles.is_pro` ve `subscriptions` tablosundan oku. Web'de satın alma akışı ayrıdır. PRO durumu hesap üzerinden iki platformda ortaktır.

## 3. Çakışma ve canlı eşitleme (mobilde eksik olan, web'de yap)

- Uygulama öne gelince (`visibilitychange` visible, pencere focus) ve her 60 sn'de bir, kullanıcı aktifken, `hydrateAllFromCloud()`'u **sessizce** (yükleme göstergesi olmadan) tekrar çalıştır.
- Mümkünse `profiles` (kendi satırı), `question_attempt_logs`, `user_flashcard_reviews`, `quiz_sessions` için Supabase Realtime aboneliği ekle ve değişiklikte ilgili store'u yeniden yükle.
- Birleştirme kuralları yukarıdaki `mergeWith` ile aynı kalır. Yerelden bulutu körlemesine ezme.
- Çevrimdışıyken yazma başarısız olursa kuyruğa al ve bağlantı gelince yeniden dene.

## 4. Plan görevlerinin üretimi (mobille aynı olmalı)

Günlük görevler, mobildeki `AutoStudyProgramGenerator.generateDailyTasks` ile **aynı kurallara** göre üretilmelidir. Yoksa görev id'leri uyuşmaz ve tamamlanma eşleşmez. Görev id biçimi: `auto_${pace}_d${day}_quiz_${i}`, kapsam `lisans_gk` değilse `auto_${scope}_${pace}_d${day}_...`. Mantığı mobil kodundan (`lib/features/planner/data/services/auto_study_program_generator.dart`) port et, değiştirme. Referans: `docs/home_daily_tasks.md`.

Görev tamamlama: manuel işaretleme, oturum bitişi veya bağımsız çözülen test eşleşmesi (`ders + konu + test no`, deneme için `targetExamNumber`). Gün kilidi: günün tüm görevleri bitmeden `cycle_day + 1`'e geçilemez (`canAdvanceToNextDay = allCompleted || cycleDay < maxUnlockedDay`).

## 5. Kabul kriterleri (hepsini test et)

1. Mobilde 3 görev tamamla, web'de aynı hesapla giriş yap: görevler tamamlanmış, aynı `cycle_day` ve `max_unlocked_day` görünür.
2. Web'de bir test çöz, mobilde uygulamayı öne getir: istatistik, XP, konu ustalığı ve plandaki eşleşen görev güncellenir.
3. Mobilde yanlış yapılan soru web yanlış defterinde aynı `review_box` ve `next_review_at` ile görünür. Web'de doğru çözülünce mobilde kutu ilerler.
4. İki cihazda aynı anda farklı görevler tamamlanınca hiçbiri geri alınmaz (union).
5. Çıkış yapınca web'de hiçbir yerel veri kalmaz. Başka hesapla girişte eski hesabın verisi görünmez.
6. Tercihler (hedef sınav, tempo, odak ders) iki platformda aynıdır.
7. Eski şemada olmayan kolonlarda (`exam_scope`, `review_box` vb.) uygulama çökmeden fallback ile çalışır.
8. RLS: başka kullanıcının satırlarına erişim yok. Bunu iki test hesabıyla doğrula.

## 6. Teslim

- Önce hangi dosyaları/modülleri oluşturacağını kısaca listele, sonra uygula.
- Bu doküman ile mobil kod arasında çelişki görürsen **mobil kod doğrudur**, çelişkiyi raporla.
- Sözleşmede belirsiz bir nokta varsa tahmin etme, soru olarak listele.
