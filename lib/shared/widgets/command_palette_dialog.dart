import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/flashcards/presentation/flashcards_screen.dart';
import 'package:kadro/features/lessons/data/curriculum_registry.dart';
import 'package:kadro/features/lessons/presentation/lesson_topics_screen.dart';
import 'package:kadro/features/lessons/presentation/topic_tests_screen.dart';
import 'package:kadro/features/map_practice/presentation/map_practice_hub_screen.dart';
import 'package:kadro/features/mistakes/presentation/mistakes_screen.dart';
import 'package:kadro/features/planner/presentation/study_planner_screen.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/score_calculator/presentation/kpss_score_calculator_screen.dart';
import 'package:kadro/shared/widgets/target_exam_selector_bottom_sheet.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Komut paleti aksiyon öğesi (`Ctrl+K` / `Cmd+K` Spotlight araması, `TASK-146`).
class _PaletteEntry {
  final String title;
  final String subtitle;
  final String category;
  final IconData icon;
  final String? shortcutHint;
  final VoidCallback onExecute;

  const _PaletteEntry({
    required this.title,
    required this.subtitle,
    required this.category,
    required this.icon,
    required this.onExecute,
    this.shortcutHint,
  });

  bool matches(String query) {
    if (query.isEmpty) return true;
    final q = query.toLowerCase().trim();
    return title.toLowerCase().contains(q) ||
        subtitle.toLowerCase().contains(q) ||
        category.toLowerCase().contains(q);
  }
}

/// Ödüllü Web SaaS standartlarında klavye öncelikli (`Ctrl+K / Cmd+K`)
/// küresel komut ve hızlı navigasyon paleti (`TASK-146`).
///
/// Angular/Web karşılığı: Linear / Notion tarzı `CommandPaletteModalComponent`.
class KadroCommandPalette extends ConsumerStatefulWidget {
  final ValueChanged<int>? onSelectShellTab;

  const KadroCommandPalette({super.key, this.onSelectShellTab});

  /// Komut paleti modalını açar.
  static Future<void> show(
    BuildContext context, {
    ValueChanged<int>? onSelectShellTab,
  }) {
    return showDialog<void>(
      context: context,
      builder: (_) => KadroCommandPalette(onSelectShellTab: onSelectShellTab),
    );
  }

  @override
  ConsumerState<KadroCommandPalette> createState() =>
      _KadroCommandPaletteState();
}

class _KadroCommandPaletteState extends ConsumerState<KadroCommandPalette> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _inputFocusNode = FocusNode();
  int _selectedIndex = 0;

  @override
  void dispose() {
    _searchController.dispose();
    _inputFocusNode.dispose();
    super.dispose();
  }

  List<_PaletteEntry> _buildEntries(BuildContext rootContext) {
    final selection = readOrWatchExamSelection(ref, watch: false);
    final curriculum = CurriculumRegistry.resolve(selection);
    final navigator = Navigator.of(rootContext);
    final prefs = ref.read(userPreferencesProvider);
    final entries = <_PaletteEntry>[];

    void navigateTab(int index) {
      navigator.pop();
      widget.onSelectShellTab?.call(index);
    }

    void pushScreen(Widget screen) {
      navigator.pop();
      navigator.push(MaterialPageRoute(builder: (_) => screen));
    }

    if (widget.onSelectShellTab != null) {
      entries.addAll([
        _PaletteEntry(
          title: 'Ana Sayfa (Kokpit)',
          subtitle: 'Günlük plan, seri ve çalışma özeti',
          category: 'Gezinti',
          icon: PhosphorIconsRegular.house,
          shortcutHint: 'Sekme 1',
          onExecute: () => navigateTab(0),
        ),
        _PaletteEntry(
          title: 'Dersler & Müfredat',
          subtitle: '${curriculum.title} ders ağırlıkları ve konular',
          category: 'Gezinti',
          icon: PhosphorIconsRegular.books,
          shortcutHint: 'Sekme 2',
          onExecute: () => navigateTab(1),
        ),
        _PaletteEntry(
          title: 'Çalışma Türleri (Pratik)',
          subtitle: 'Atölyeler, bilgi kartları ve mini oyunlar',
          category: 'Gezinti',
          icon: PhosphorIconsRegular.target,
          shortcutHint: 'Sekme 3',
          onExecute: () => navigateTab(2),
        ),
        _PaletteEntry(
          title: 'Deneme Sınavları',
          subtitle: 'Süreli ÖSYM deneme provaları',
          category: 'Gezinti',
          icon: PhosphorIconsRegular.timer,
          shortcutHint: 'Sekme 4',
          onExecute: () => navigateTab(3),
        ),
        _PaletteEntry(
          title: 'İstatistikler & Başarım',
          subtitle: 'Konu ustalığı, grafikler ve performans karnesi',
          category: 'Gezinti',
          icon: PhosphorIconsRegular.chartBar,
          shortcutHint: 'Sekme 5',
          onExecute: () => navigateTab(4),
        ),
        _PaletteEntry(
          title: 'Profil & Ayarlar',
          subtitle: 'Hedef, yüksek okunabilirlik, PRO ve senkronizasyon',
          category: 'Gezinti',
          icon: PhosphorIconsRegular.userCircle,
          shortcutHint: 'Sekme 6',
          onExecute: () => navigateTab(5),
        ),
      ]);
    }

    // Hızlı Çalışma Araçları
    entries.addAll([
      _PaletteEntry(
        title: 'KPSS / MEB-AGS Puan Hesaplayıcı',
        subtitle: 'B Grubu P1–P3, E-KPSS, DHBT, MEB-AGS ve A Grubu simülatörü',
        category: 'Araçlar',
        icon: PhosphorIconsRegular.calculator,
        onExecute: () => pushScreen(const KpssScoreCalculatorScreen()),
      ),
      _PaletteEntry(
        title: 'Çalışma Planlayıcı',
        subtitle: 'Günlük hedefler ve adaptif çalışma programı',
        category: 'Araçlar',
        icon: PhosphorIconsRegular.calendarCheck,
        onExecute: () => pushScreen(const StudyPlannerScreen()),
      ),
      _PaletteEntry(
        title: 'Yanlış Defteri',
        subtitle: 'Hatalı çözülen soruları incele ve tekrar et',
        category: 'Araçlar',
        icon: PhosphorIconsRegular.warningCircle,
        onExecute: () => pushScreen(const MistakesScreen()),
      ),
      _PaletteEntry(
        title: 'Türkiye Harita Atölyesi',
        subtitle: 'Coğrafya & tarih interaktif harita pratikleri',
        category: 'Araçlar',
        icon: PhosphorIconsRegular.mapTrifold,
        onExecute: () => pushScreen(const MapPracticeHubScreen()),
      ),
      _PaletteEntry(
        title: 'Hap Bilgi Kartları',
        subtitle: 'Hızlı kavram tekrarı',
        category: 'Araçlar',
        icon: PhosphorIconsRegular.cards,
        onExecute: () => pushScreen(const FlashcardsScreen()),
      ),
    ]);

    // Aktif müfredattaki dersler ve konular
    for (final spec in curriculum.activeLessons) {
      final lesson = spec.toLesson();
      entries.add(
        _PaletteEntry(
          title: lesson.name,
          subtitle:
              '${lesson.topics.length} konu · ${lesson.questionCount} soru',
          category: 'Aktif Ders',
          icon: lesson.icon,
          onExecute: () => pushScreen(LessonTopicsScreen(lesson: lesson)),
        ),
      );
      for (final topic in lesson.topics) {
        entries.add(
          _PaletteEntry(
            title: topic,
            subtitle: '${lesson.name} konu testleri',
            category: 'Konu',
            icon: PhosphorIconsRegular.bookOpenText,
            onExecute: () => pushScreen(
              TopicTestsScreen(
                lessonName: lesson.name,
                topic: topic,
                selection: selection,
              ),
            ),
          ),
        );
      }
    }

    // Hızlı Sınav Hedefi Değiştirme
    entries.addAll([
      _PaletteEntry(
        title: 'Sınavı Değiştir: KPSS Lisans GY-GK (120 Soru)',
        subtitle: 'B Grubu Tam Genel Yetenek + Genel Kültür',
        category: 'Sınav Hedefi',
        icon: PhosphorIconsRegular.graduationCap,
        onExecute: () {
          TargetExamSelectorBottomSheet.applySelection(
            ref,
            const ExamSelection.bGrubu(),
          );
          navigator.pop();
        },
      ),
      _PaletteEntry(
        title: 'Sınavı Değiştir: E-KPSS Lisans',
        subtitle: '30 GY + 30 GK · Erişilebilir okuma modu desteği',
        category: 'Sınav Hedefi',
        icon: PhosphorIconsRegular.wheelchair,
        onExecute: () {
          TargetExamSelectorBottomSheet.applySelection(
            ref,
            const ExamSelection.ekpss(),
          );
          navigator.pop();
        },
      ),
      _PaletteEntry(
        title: 'Sınavı Değiştir: KPSS DHBT',
        subtitle: 'DHBT-1 + DHBT-2 Din Hizmetleri Alan Bilgisi',
        category: 'Sınav Hedefi',
        icon: PhosphorIconsRegular.mosque,
        onExecute: () {
          TargetExamSelectorBottomSheet.applySelection(
            ref,
            const ExamSelection.dhbt(),
          );
          navigator.pop();
        },
      ),
      _PaletteEntry(
        title: 'Sınavı Değiştir: MEB-AGS + ÖABT (Türkçe)',
        subtitle: '1. Oturum 80 Soru + ÖABT 50 Soru',
        category: 'Sınav Hedefi',
        icon: PhosphorIconsRegular.chalkboardTeacher,
        onExecute: () {
          TargetExamSelectorBottomSheet.applySelection(
            ref,
            const ExamSelection.mebAgs(oabtBranch: OabtBranch.turkce),
          );
          navigator.pop();
        },
      ),
      _PaletteEntry(
        title: 'Sınavı Değiştir: KPSS A Grubu (P48)',
        subtitle: 'Hukuk, İktisat, Maliye, Muhasebe kariyer paketi',
        category: 'Sınav Hedefi',
        icon: PhosphorIconsRegular.scales,
        onExecute: () {
          TargetExamSelectorBottomSheet.applySelection(
            ref,
            const ExamSelection.aGrubu(),
          );
          navigator.pop();
        },
      ),
      _PaletteEntry(
        title: prefs.themeMode == ThemeMode.dark
            ? 'Açık Temaya Geç'
            : 'Koyu Temaya Geç',
        subtitle: 'Görünüm temasını anında değiştir',
        category: 'Görünüm',
        icon: prefs.themeMode == ThemeMode.dark
            ? PhosphorIconsRegular.sun
            : PhosphorIconsRegular.moon,
        onExecute: () {
          final next = prefs.themeMode == ThemeMode.dark
              ? ThemeMode.light
              : ThemeMode.dark;
          ref.read(userPreferencesProvider.notifier).setThemeMode(next);
          navigator.pop();
        },
      ),
    ]);

    return entries;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final allEntries = _buildEntries(context);
    final query = _searchController.text;
    final filtered = allEntries
        .where((entry) => entry.matches(query))
        .take(24)
        .toList(growable: false);

    final safeSelected = filtered.isEmpty
        ? 0
        : _selectedIndex.clamp(0, filtered.length - 1);

    return CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        const SingleActivator(LogicalKeyboardKey.arrowDown): () {
          if (filtered.isEmpty) return;
          setState(() {
            _selectedIndex = (safeSelected + 1) % filtered.length;
          });
        },
        const SingleActivator(LogicalKeyboardKey.arrowUp): () {
          if (filtered.isEmpty) return;
          setState(() {
            _selectedIndex =
                (safeSelected - 1 + filtered.length) % filtered.length;
          });
        },
        const SingleActivator(LogicalKeyboardKey.enter): () {
          if (filtered.isNotEmpty) {
            filtered[safeSelected].onExecute();
          }
        },
      },
      child: Dialog(
        backgroundColor: colorScheme.surface,
        insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: colorScheme.outlineVariant, width: 1.5),
        ),
        clipBehavior: Clip.antiAlias,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 620, maxHeight: 520),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 12, 10),
                child: Row(
                  children: [
                    PhosphorIcon(
                      PhosphorIconsRegular.magnifyingGlass,
                      size: 20,
                      color: colorScheme.primary,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        key: const ValueKey('command_palette_search_field'),
                        controller: _searchController,
                        focusNode: _inputFocusNode,
                        autofocus: true,
                        onChanged: (_) => setState(() => _selectedIndex = 0),
                        onSubmitted: (_) {
                          if (filtered.isNotEmpty) {
                            filtered[safeSelected].onExecute();
                          }
                        },
                        decoration: const InputDecoration(
                          hintText: 'Ders, konu, sınav türü veya araç ara...',
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: colorScheme.outlineVariant),
                      ),
                      child: Text(
                        'ESC',
                        style: textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: filtered.isEmpty
                    ? Center(
                        child: Text(
                          'Eşleşen ders, konu veya komut bulunamadı.',
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        itemCount: filtered.length,
                        itemBuilder: (context, index) {
                          final item = filtered[index];
                          final isActive = index == safeSelected;
                          return MouseRegion(
                            cursor: SystemMouseCursors.click,
                            onEnter: (_) {
                              if (_selectedIndex != index) {
                                setState(() => _selectedIndex = index);
                              }
                            },
                            child: InkWell(
                              onTap: item.onExecute,
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 4),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: isActive
                                      ? colorScheme.primaryContainer.withAlpha(
                                          120,
                                        )
                                      : colorScheme.surface.withAlpha(0),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: isActive
                                        ? colorScheme.primary.withAlpha(110)
                                        : colorScheme.surface.withAlpha(0),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    PhosphorIcon(
                                      item.icon,
                                      size: 18,
                                      color: isActive
                                          ? colorScheme.primary
                                          : colorScheme.onSurfaceVariant,
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.title,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: textTheme.bodyMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: colorScheme.onSurface,
                                                ),
                                          ),
                                          Text(
                                            item.subtitle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: textTheme.bodySmall
                                                ?.copyWith(
                                                  color: colorScheme
                                                      .onSurfaceVariant,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 3,
                                      ),
                                      decoration: BoxDecoration(
                                        color: colorScheme.surfaceContainerLow,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        item.shortcutHint ?? item.category,
                                        style: textTheme.labelSmall?.copyWith(
                                          color: colorScheme.onSurfaceVariant,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
