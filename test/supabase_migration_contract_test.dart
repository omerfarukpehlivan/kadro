import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'TASK-128: Supabase Çoklu Sınav Şeması & Migrasyon Sözleşme Testleri',
    () {
      test('05_multi_exam_architecture.sql gerekli sütunları, indeksleri, kısıtları ve RPC imzasını içerir', () {
        final migrationFile = File(
          'docs/supabase_migrations/05_multi_exam_architecture.sql',
        );
        expect(migrationFile.existsSync(), isTrue);

        final sql = migrationFile.readAsStringSync().toLowerCase();

        // 1. public.questions çoklu sınav kapsam sütunları ve güvenlik
        expect(sql, contains('exam_scopes text[] not null default'));
        expect(sql, contains('sub_branch text null'));
        expect(sql, contains('education_level text null'));
        expect(sql, contains('disability_variant text null'));
        expect(sql, contains('source_variant text null'));
        expect(sql, contains('is_active boolean not null default true'));

        // 2. GIN, composite ve partial performans indeksleri
        expect(
          sql,
          contains(
            'idx_questions_exam_scopes_gin\n  on public.questions using gin (exam_scopes)',
          ),
        );
        expect(
          sql,
          contains(
            'idx_questions_scope_lesson_topic\n  on public.questions (lesson, topic, order_index)',
          ),
        );
        expect(
          sql,
          contains(
            'idx_questions_sub_branch\n  on public.questions (sub_branch)\n  where sub_branch is not null',
          ),
        );

        // 3. user_topic_mastery unique çakışma düzeltmesi
        expect(sql, contains('unique (user_id, exam_scope, lesson, topic)'));

        // 4. Oturum / Log / Çalışma görevleri exam_scope desteği
        expect(sql, contains('idx_quiz_sessions_user_scope_date'));
        expect(sql, contains('idx_attempt_logs_user_scope_mistakes'));
        expect(sql, contains('idx_study_tasks_user_scope_date'));

        // 5. profiles JSONB doğrulama ve trigger korumaları
        expect(sql, contains("jsonb_typeof(exam_selection) = 'object'"));
        expect(sql, contains('octet_length(exam_selection::text) <= 4096'));
        expect(sql, contains('prevent_direct_is_pro_escalation'));
        expect(sql, contains('prevent_xp_and_league_tampering'));

        // 6. app_config ve get_weekly_leaderboard RPC
        expect(sql, contains('exam_date_overrides jsonb not null default'));
        expect(
          sql,
          contains('drop function if exists public.get_weekly_leaderboard();'),
        );
        expect(
          sql,
          contains(
            'create or replace function public.get_weekly_leaderboard(\n  p_exam_family text default null',
          ),
        );
        expect(sql, contains('using (is_active = true)'));
      });

      test('docs/supabase_schema.sql çoklu sınav migrasyonu ile senkronize edilmelidir', () {
        final schemaFile = File('docs/supabase_schema.sql');
        expect(schemaFile.existsSync(), isTrue);

        final sql = schemaFile.readAsStringSync().toLowerCase();

        expect(sql, contains('exam_scopes text[] not null default'));
        expect(sql, contains('idx_questions_exam_scopes_gin'));
        expect(sql, contains('unique(user_id, exam_scope, lesson, topic)'));
        expect(sql, contains('exam_selection jsonb not null default'));
        expect(sql, contains('create table if not exists public.app_config'));
        expect(sql, contains('exam_date_overrides jsonb not null default'));
        expect(sql, contains('p_exam_family text default null'));
      });

      test('07_leitner_and_current_affairs.sql ve supabase_schema.sql Leitner sütun, tablo ve RLS kurallarını içerir', () {
        final migrationFile = File(
          'docs/supabase_migrations/07_leitner_and_current_affairs.sql',
        );
        expect(migrationFile.existsSync(), isTrue);

        final migrationSql = migrationFile.readAsStringSync().toLowerCase();
        expect(migrationSql, contains('review_box int not null default 1'));
        expect(migrationSql, contains('next_review_at timestamptz'));
        expect(migrationSql, contains('box4_streak int not null default 0'));
        expect(migrationSql, contains('idx_attempt_logs_leitner_due'));
        expect(
          migrationSql,
          contains('create table if not exists public.user_flashcard_reviews'),
        );
        expect(migrationSql, contains('enable row level security'));
        expect(migrationSql, contains('(select auth.uid())'));
        expect(
          migrationSql,
          contains(
            'create table if not exists public.current_affairs_bulletins',
          ),
        );
        expect(migrationSql, contains('idx_current_affairs_active_month'));
        expect(
          migrationSql,
          contains(
            'revoke insert, update, delete on public.current_affairs_bulletins from anon, authenticated',
          ),
        );

        final schemaSql = File('docs/supabase_schema.sql')
            .readAsStringSync()
            .toLowerCase();
        expect(schemaSql, contains('idx_attempt_logs_leitner_due'));
        expect(schemaSql, contains('user_flashcard_reviews'));
        expect(schemaSql, contains('current_affairs_bulletins'));
        expect(schemaSql, contains('idx_current_affairs_active_month'));
      });
    },
  );
}
