import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:kadro/features/flashcards/data/sample_flashcards.dart';
import 'package:kadro/features/games/data/models/concept_match_set.dart';
import 'package:kadro/features/games/data/models/true_false_item.dart';
import 'package:kadro/features/map_practice/data/map_practice_data.dart';

String escapeSql(String? str) {
  if (str == null) return '';
  return str.replaceAll("'", "''");
}

void main() {
  test('Export All Interactive Learning & Master Seed to Supabase SQL', () async {
    final buffer = StringBuffer();

    buffer.writeln(
      '-- =============================================================================',
    );
    buffer.writeln(
      '-- KADRO KPSS LİSANS GENEL KÜLTÜR — İNTERAKTİF ÖĞRENME & OYUNLAR SUPABASE MİGRASYONU',
    );
    buffer.writeln('-- Oluşturulma: ${DateTime.now().toIso8601String()}');
    buffer.writeln('-- İçerik:');
    buffer.writeln(
      '--   1. public.flashcards (200 Adet KPSS Şifre & Hap Bilgi Kartı)',
    );
    buffer.writeln(
      '--   2. public.questions - true_false (100 Adet 60 Saniyede Pençe Şimşek Önermesi)',
    );
    buffer.writeln(
      '--   3. public.questions - matching (20 Tematik Set, 80 Kavram Çifti)',
    );
    buffer.writeln(
      '--   4. public.map_challenges (50 Adet Uzman KPSS Harita Pratik Sorusu)',
    );
    buffer.writeln(
      '-- =============================================================================\n',
    );

    buffer.writeln('BEGIN;\n');

    // 1. DDL Statements
    buffer.writeln(
      '-- -------------------------------------------------------------',
    );
    buffer.writeln('-- 1. TABLO TANIMLARI & GÜVENLİK (RLS)');
    buffer.writeln(
      '-- -------------------------------------------------------------',
    );
    buffer.writeln('''
create extension if not exists "uuid-ossp";

-- Flashcards tablosu
create table if not exists public.flashcards (
  id text primary key,
  lesson text not null,
  topic text not null,
  front_text text not null,
  back_text text not null,
  order_index integer,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

alter table public.flashcards enable row level security;

do \$\$ begin
  if not exists (select 1 from pg_policies where tablename = 'flashcards' and policyname = 'Flashcards public read') then
    create policy "Flashcards public read" on public.flashcards for select using (true);
  end if;
end \$\$;

create index if not exists idx_flashcards_lesson_topic on public.flashcards (lesson, topic);
create index if not exists idx_flashcards_order on public.flashcards (order_index);

-- Map Challenges tablosu
create table if not exists public.map_challenges (
  id text primary key,
  category text not null,
  interaction_type text not null,
  difficulty integer default 2 not null,
  title text not null,
  question_text text not null,
  target_province_id text not null,
  hint text,
  explanation text not null,
  distractor_trap text,
  tag text,
  order_index integer,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

alter table public.map_challenges enable row level security;

do \$\$ begin
  if not exists (select 1 from pg_policies where tablename = 'map_challenges' and policyname = 'Map challenges public read') then
    create policy "Map challenges public read" on public.map_challenges for select using (true);
  end if;
end \$\$;

create index if not exists idx_map_challenges_category on public.map_challenges (category);

-- Questions tablosu indeks ve order_index güncellemesi
alter table public.questions add column if not exists order_index integer;
alter table public.questions alter column explanation drop not null;
create index if not exists idx_questions_type_lesson_topic on public.questions (question_type, lesson, topic);
create index if not exists idx_questions_order_index on public.questions (order_index);
''');

    // 2. FLASHCARDS (200 items)
    buffer.writeln(
      '\n-- -------------------------------------------------------------',
    );
    buffer.writeln('-- 2. HAP BİLGİ KARTLARI (200 ADET)');
    buffer.writeln(
      '-- -------------------------------------------------------------\n',
    );
    for (var i = 0; i < sampleFlashcards.length; i++) {
      final fc = sampleFlashcards[i];
      final id = escapeSql(fc.id);
      final lesson = escapeSql(fc.lesson);
      final topic = escapeSql(fc.topic);
      final front = escapeSql(fc.frontText);
      final back = escapeSql(fc.backText);
      final order = i + 1;

      buffer.writeln(
        "insert into public.flashcards (id, lesson, topic, front_text, back_text, order_index) values ('$id', '$lesson', '$topic', '$front', '$back', $order) on conflict (id) do update set front_text = excluded.front_text, back_text = excluded.back_text, order_index = excluded.order_index;",
      );
    }

    // 3. TRUE / FALSE ITEMS (100 items into public.questions)
    buffer.writeln(
      '\n-- -------------------------------------------------------------',
    );
    buffer.writeln(
      '-- 3. 60 SANİYEDE PENÇE — DOĞRU / YANLIŞ ŞİMŞEK ÖNERMELERİ (100 ADET)',
    );
    buffer.writeln(
      '-- -------------------------------------------------------------\n',
    );
    for (var i = 0; i < sampleTrueFalseItems.length; i++) {
      final tf = sampleTrueFalseItems[i];
      final lesson = escapeSql(tf.lesson);
      final topic = escapeSql(tf.topic);
      final prompt = escapeSql(tf.statement);
      final explanation = escapeSql(tf.explanation);
      final interaction = escapeSql(jsonEncode({'isTrue': tf.isTrue}));
      final order = i + 1;

      buffer.writeln("""insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  '$lesson',
  '$topic',
  'true_false',
  2,
  '$prompt',
  '$interaction'::jsonb,
  '$explanation',
  $order
);""");
    }

    // 4. CONCEPT MATCH SETS (20 sets into public.questions)
    buffer.writeln(
      '\n-- -------------------------------------------------------------',
    );
    buffer.writeln(
      '-- 4. KAVRAM EŞLEŞTİRME — TEMATİK SETLER (20 SET, 80 KAVRAM ÇİFTİ)',
    );
    buffer.writeln(
      '-- -------------------------------------------------------------\n',
    );
    for (var i = 0; i < sampleConceptMatchSets.length; i++) {
      final cms = sampleConceptMatchSets[i];
      final lesson = escapeSql(cms.lesson);
      final prompt = escapeSql(cms.title);
      final pairsJson = cms.pairs
          .map(
            (p) => {
              'id': p.id,
              'leftTerm': p.leftTerm,
              'rightMatch': p.rightMatch,
            },
          )
          .toList();
      final interaction = escapeSql(jsonEncode({'pairs': pairsJson}));
      final pairsExplanation = cms.pairs
          .map((p) => '${p.leftTerm} ➔ ${p.rightMatch}')
          .join('; ');
      final explanation = escapeSql(
        'Kadro Kavram Eşleştirme Çözümü: $pairsExplanation',
      );
      final order = i + 1;

      buffer.writeln("""insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  order_index
) values (
  '$lesson',
  'Kavram Eşleştirme',
  'matching',
  2,
  '$prompt',
  '$interaction'::jsonb,
  '$explanation',
  $order
);""");
    }

    // 5. MAP CHALLENGES (50 challenges into public.map_challenges)
    buffer.writeln(
      '\n-- -------------------------------------------------------------',
    );
    buffer.writeln(
      '-- 5. İNTERAKTİF HARİTA ATÖLYESİ — UZMAN SORULARI (50 ADET)',
    );
    buffer.writeln(
      '-- -------------------------------------------------------------\n',
    );
    for (var i = 0; i < MapPracticeData.predefinedChallenges.length; i++) {
      final mc = MapPracticeData.predefinedChallenges[i];
      final id = escapeSql(mc.id);
      final category = escapeSql(mc.category.name);
      final interactionType = escapeSql(mc.interactionType.name);
      final diff = mc.difficulty;
      final title = escapeSql(mc.title);
      final qText = escapeSql(mc.questionText);
      final target = escapeSql(mc.targetProvinceId);
      final hint = escapeSql(mc.hint);
      final explanation = escapeSql(mc.explanation);
      final trap = escapeSql(mc.distractorTrap);
      final tag = escapeSql(mc.tag);
      final order = i + 1;

      buffer.writeln("""insert into public.map_challenges (
  id,
  category,
  interaction_type,
  difficulty,
  title,
  question_text,
  target_province_id,
  hint,
  explanation,
  distractor_trap,
  tag,
  order_index
) values (
  '$id',
  '$category',
  '$interactionType',
  $diff,
  '$title',
  '$qText',
  '$target',
  '$hint',
  '$explanation',
  '$trap',
  '$tag',
  $order
) on conflict (id) do update set
  title = excluded.title,
  question_text = excluded.question_text,
  explanation = excluded.explanation,
  distractor_trap = excluded.distractor_trap;""");
    }

    buffer.writeln('\nCOMMIT;\n');

    final outputSql = buffer.toString();
    final targetFile = File(
      'docs/supabase_migrations/01_interactive_learning_seed.sql',
    );
    await targetFile.writeAsString(outputSql);

    expect(targetFile.existsSync(), isTrue);
    expect(outputSql.contains('insert into public.flashcards'), isTrue);
    expect(outputSql.contains('insert into public.map_challenges'), isTrue);

    // Desktop export for convenience
    final desktopDir = Directory(r'C:\Users\omere\Desktop\kpss-supabase-sql');
    if (!desktopDir.existsSync()) {
      desktopDir.createSync(recursive: true);
    }
    await File(
      r'C:\Users\omere\Desktop\kpss-supabase-sql\01_interactive_learning_seed.sql',
    ).writeAsString(outputSql);
  });
}
