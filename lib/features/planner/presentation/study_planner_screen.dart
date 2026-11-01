import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/flashcards/presentation/flashcards_screen.dart';
import 'package:kadro/features/mistakes/presentation/mistakes_screen.dart';
import 'package:kadro/features/planner/data/models/study_task.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/shared/widgets/mascot_coach_banner.dart';
import 'package:kadro/shared/widgets/section_title.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Tam Ekran Akıllı KPSS Çalışma Planlayıcı.
///
/// Web/Angular karşılığı: Planner/Kanban veya Task Management Component.
class StudyPlannerScreen extends ConsumerWidget {
  const StudyPlannerScreen({super.key});

  void _showAddTaskSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => const _AddTaskBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final planner = ref.watch(studyPlannerProvider);
    final notifier = ref.read(studyPlannerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Çalışma Planlayıcın'),
        actions: [
          if (planner.completedCount > 0)
            TextButton.icon(
              onPressed: () => notifier.clearCompleted(),
              icon: const Icon(LucideIcons.trash2, size: 16),
              label: const Text('Tamamlananları Sil'),
            ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 1. Üst Koç Sahnesi
          const MascotCoachBanner(
            mood: MascotMood.coach,
            badgeLabel: 'GÜNLÜK KAMP PLANI',
            title: 'Bugünkü Görevlerin',
            message: 'Planlı çalışan kadroyu kapar! Görevlerini tikle veya Başla butonuyla doğrudan çalışmaya geç.',
          ),
          const SizedBox(height: 16),

          // 2. Plan İlerleme & Süre Özeti Kartı
          _PlannerSummaryCard(planner: planner),
          const SizedBox(height: 16),

          // 3. Tek Tıkla Hazır KPSS Görev Şablonları
          const SectionTitle('Hızlı Görev Şablonları (Tek Tıkla Ekle)'),
          const SizedBox(height: 8),
          _QuickTemplatesStrip(onAdd: notifier.addTask),
          const SizedBox(height: 16),

          // 4. Görev Listesi
          SectionTitle('Görev Listesi (${planner.tasks.length})'),
          const SizedBox(height: 8),
          if (planner.tasks.isEmpty)
            TactileCard(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 16,
                  ),
                  child: Column(
                    children: [
                      Icon(
                        LucideIcons.calendarCheck2,
                        size: 48,
                        color: colorScheme.primary,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Bugün için planlanmış görev kalmadı! Şablonlardan veya + Görev Ekle butonundan yeni hedef ekleyebilirsin.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium
                            ?.copyWith(color: colorScheme.onSurfaceVariant),
                      ),
                    ],
                  ),
                ),
              ),
            )
          else
            for (final task in planner.tasks)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _PlannerTaskTile(
                  task: task,
                  onToggle: () => notifier.toggleTask(task.id),
                  onRemove: () => notifier.removeTask(task.id),
                ),
              ),
          const SizedBox(height: 64), // FAB için alt boşluk
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddTaskSheet(context),
        icon: const Icon(LucideIcons.plus),
        label: const Text('Görev Ekle'),
      ),
    );
  }
}

/// Plan ilerlemesini ve tahmini toplam süreyi gösteren özet kartı.
class _PlannerSummaryCard extends StatelessWidget {
  final StudyPlannerState planner;

  const _PlannerSummaryCard({required this.planner});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return TactileCard(
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.primary.withAlpha(90),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${planner.completedCount} / ${planner.totalCount} Görev Tamamlandı',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.tertiaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      LucideIcons.clock,
                      size: 14,
                      color: colorScheme.onTertiaryContainer,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Toplam ${planner.totalEstimatedMinutes} dk',
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onTertiaryContainer,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              minHeight: 8,
              value: planner.completionProgress,
            ),
          ),
        ],
      ),
    );
  }
}

/// Yatay kaydırılabilir tek tıkla eklenebilir hazır görev şablonları.
class _QuickTemplatesStrip extends StatelessWidget {
  final void Function({
    required String title,
    required String lessonTag,
    int estimatedMinutes,
    StudyTaskActionType actionType,
  })
  onAdd;

  const _QuickTemplatesStrip({required this.onAdd});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ActionChip(
            avatar: Icon(
              LucideIcons.plus,
              size: 16,
              color: colorScheme.primary,
            ),
            label: const Text('+ 20 Tarih Sorusu'),
            onPressed: () {
              onAdd(
                title: '20 Tarih Sorusu Çöz',
                lessonTag: 'Tarih',
                estimatedMinutes: 25,
                actionType: StudyTaskActionType.quiz,
              );
            },
          ),
          const SizedBox(width: 8),
          ActionChip(
            avatar: Icon(
              LucideIcons.plus,
              size: 16,
              color: colorScheme.tertiary,
            ),
            label: const Text('+ Coğrafya Hap Kart'),
            onPressed: () {
              onAdd(
                title: 'Coğrafya Hap Bilgi Kartları',
                lessonTag: 'Coğrafya',
                estimatedMinutes: 15,
                actionType: StudyTaskActionType.flashcards,
              );
            },
          ),
          const SizedBox(width: 8),
          ActionChip(
            avatar: Icon(
              LucideIcons.plus,
              size: 16,
              color: colorScheme.primary,
            ),
            label: const Text('+ Vatandaşlık Testi'),
            onPressed: () {
              onAdd(
                title: 'Vatandaşlık Konu Testi Çöz',
                lessonTag: 'Vatandaşlık',
                estimatedMinutes: 20,
                actionType: StudyTaskActionType.quiz,
              );
            },
          ),
          const SizedBox(width: 8),
          ActionChip(
            avatar: Icon(LucideIcons.plus, size: 16, color: colorScheme.error),
            label: const Text('+ Yanlışları Temizle'),
            onPressed: () {
              onAdd(
                title: 'Yanlış Defteri Tekrarı Yap',
                lessonTag: 'Genel',
                estimatedMinutes: 15,
                actionType: StudyTaskActionType.mistakes,
              );
            },
          ),
        ],
      ),
    );
  }
}

/// Tek bir çalışma görevini gösteren 3D kart bileşeni.
class _PlannerTaskTile extends StatelessWidget {
  final StudyTask task;
  final VoidCallback onToggle;
  final VoidCallback onRemove;

  const _PlannerTaskTile({
    required this.task,
    required this.onToggle,
    required this.onRemove,
  });

  void _triggerAction(BuildContext context) {
    switch (task.actionType) {
      case StudyTaskActionType.quiz:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const QuizScreen()));
        break;
      case StudyTaskActionType.flashcards:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const FlashcardsScreen()));
        break;
      case StudyTaskActionType.mistakes:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const MistakesScreen()));
        break;
      case StudyTaskActionType.custom:
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Görev: ${task.title}')));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return TactileCard(
      backgroundColor: task.isCompleted
          ? colorScheme.surfaceContainerHighest.withAlpha(50)
          : colorScheme.surface,
      borderColor: task.isCompleted
          ? colorScheme.outlineVariant
          : colorScheme.primary.withAlpha(80),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Sol Onay İkonu
          InkWell(
            onTap: onToggle,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Icon(
                task.isCompleted ? LucideIcons.circleCheck : LucideIcons.circle,
                color: task.isCompleted
                    ? colorScheme.primary
                    : colorScheme.outline,
                size: 24,
              ),
            ),
          ),
          const SizedBox(width: 10),

          // Orta: Ders & Süre Rozetleri ve Görev Başlığı
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        task.lessonTag,
                        style: textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSecondaryContainer,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${task.estimatedMinutes} dk',
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  task.title,
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    decoration: task.isCompleted
                        ? TextDecoration.lineThrough
                        : null,
                    color: task.isCompleted
                        ? colorScheme.onSurfaceVariant
                        : colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),

          // Sağ: "Başla" Aksiyonu ve Silme İkonu
          if (!task.isCompleted &&
              task.actionType != StudyTaskActionType.custom)
            FilledButton.tonal(
              onPressed: () => _triggerAction(context),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(LucideIcons.play, size: 12),
                  SizedBox(width: 4),
                  Text('Başla'),
                ],
              ),
            ),
          IconButton(
            icon: Icon(LucideIcons.trash2, size: 18, color: colorScheme.error),
            onPressed: onRemove,
            tooltip: 'Görevi Sil',
          ),
        ],
      ),
    );
  }
}

/// Yeni Görev Ekleme Alt Formu (Bottom Sheet).
class _AddTaskBottomSheet extends ConsumerStatefulWidget {
  const _AddTaskBottomSheet();

  @override
  ConsumerState<_AddTaskBottomSheet> createState() =>
      _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends ConsumerState<_AddTaskBottomSheet> {
  final _titleController = TextEditingController();
  String _selectedLesson = 'Tarih';
  int _selectedMinutes = 25;

  final _lessons = const [
    'Tarih',
    'Coğrafya',
    'Vatandaşlık',
    'Güncel Bilgiler',
    'Genel',
  ];
  final _durations = const [15, 25, 40, 65];

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _submit() {
    final text = _titleController.text.trim();
    if (text.isEmpty) return;

    ref
        .read(studyPlannerProvider.notifier)
        .addTask(
          title: text,
          lessonTag: _selectedLesson,
          estimatedMinutes: _selectedMinutes,
          actionType: StudyTaskActionType.quiz,
        );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        20,
        20,
        20,
        MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Yeni Görev Ekle',
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              IconButton(
                icon: const Icon(LucideIcons.x),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _titleController,
            autofocus: true,
            decoration: const InputDecoration(
              labelText: 'Görev Başlığı',
              hintText: 'Örn: Osmanlı Yükselme Dönemi 2 Test',
              prefixIcon: Icon(LucideIcons.pencil),
            ),
            onSubmitted: (_) => _submit(),
          ),
          const SizedBox(height: 16),
          Text(
            'Ders Seçimi',
            style: textTheme.labelMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: _lessons.map((lesson) {
              return ChoiceChip(
                label: Text(lesson),
                selected: _selectedLesson == lesson,
                onSelected: (selected) {
                  if (selected) setState(() => _selectedLesson = lesson);
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          Text(
            'Tahmini Süre',
            style: textTheme.labelMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: _durations.map((duration) {
              return ChoiceChip(
                label: Text('$duration dk'),
                selected: _selectedMinutes == duration,
                onSelected: (selected) {
                  if (selected) setState(() => _selectedMinutes = duration);
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: _submit,
            icon: const Icon(LucideIcons.calendarPlus),
            label: const Text('Plana Ekle'),
          ),
        ],
      ),
    );
  }
}
