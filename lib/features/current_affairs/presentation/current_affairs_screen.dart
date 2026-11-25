import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/shared/widgets/kadro_badge.dart';
import 'package:kadro/shared/widgets/kadro_filter_chips.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/current_affairs/data/current_affairs_repository.dart';
import 'package:kadro/features/current_affairs/data/models/current_affairs_bulletin.dart';
import 'package:kadro/features/current_affairs/presentation/widgets/current_affairs_card.dart';
import 'package:kadro/features/flashcards/presentation/flashcards_screen.dart';
import 'package:kadro/features/lessons/data/curriculum_registry.dart';
import 'package:kadro/features/quiz/data/models/quiz_mode.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/shared/widgets/empty_state_view.dart';
import 'package:kadro/shared/widgets/kadro_error_state.dart';
import 'package:kadro/shared/widgets/kadro_skeleton.dart';
import 'package:kadro/shared/widgets/responsive_grid.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Aylık Güncel Bilgiler Bülteni ve Etkileşimli Akış Ekranı (`TASK-160`).
///
/// Angular/Web karşılığı: `/current-affairs` rotasına bağlı, ay seçici + kategori
/// filtreli, okuma ilerleme takipli `CurrentAffairsPageComponent`.
class CurrentAffairsScreen extends ConsumerStatefulWidget {
  final String? initialMonthParam;
  final CurrentAffairsRepository repository;

  const CurrentAffairsScreen({
    super.key,
    this.initialMonthParam,
    this.repository = const CurrentAffairsRepository(),
  });

  @override
  ConsumerState<CurrentAffairsScreen> createState() =>
      _CurrentAffairsScreenState();
}

class _CurrentAffairsScreenState extends ConsumerState<CurrentAffairsScreen> {
  List<CurrentAffairsBulletin> _bulletins = const [];
  String? _selectedYearMonth;
  CurrentAffairsCategory? _selectedCategory;
  bool _bookmarkedOnly = false;
  Set<String> _readIds = <String>{};
  Set<String> _bookmarkedIds = <String>{};
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final results = await Future.wait([
        widget.repository.fetchBulletins(),
        widget.repository.loadReadIds(),
        widget.repository.loadBookmarkedIds(),
      ]);

      final bulletins = results[0] as List<CurrentAffairsBulletin>;
      final readIds = results[1] as Set<String>;
      final bookmarkedIds = results[2] as Set<String>;

      String? initialMonth = _selectedYearMonth;
      final param = widget.initialMonthParam?.trim();
      if (initialMonth == null && param != null && param.isNotEmpty) {
        final match = bulletins.where((b) => b.yearMonth == param);
        if (match.isNotEmpty) {
          initialMonth = match.first.yearMonth;
        }
      }
      initialMonth ??= bulletins.isNotEmpty ? bulletins.last.yearMonth : null;

      if (!mounted) return;
      setState(() {
        _bulletins = bulletins;
        _readIds = readIds;
        _bookmarkedIds = bookmarkedIds;
        _selectedYearMonth = initialMonth;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessage = 'Aylık güncel bülten yüklenirken bir sorun oluştu.';
        _isLoading = false;
      });
    }
  }

  CurrentAffairsBulletin? get _activeBulletin {
    if (_bulletins.isEmpty) return null;
    for (final bulletin in _bulletins) {
      if (bulletin.yearMonth == _selectedYearMonth) {
        return bulletin;
      }
    }
    return _bulletins.last;
  }

  Future<void> _toggleRead(String itemId) async {
    final next = await widget.repository.toggleRead(
      itemId,
      currentIds: _readIds,
    );
    if (!mounted) return;
    setState(() => _readIds = next);
  }

  Future<void> _toggleBookmark(String itemId) async {
    final next = await widget.repository.toggleBookmark(
      itemId,
      currentIds: _bookmarkedIds,
    );
    if (!mounted) return;
    setState(() => _bookmarkedIds = next);
  }

  void _openMonthlyMiniQuiz(CurrentAffairsBulletin bulletin) {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (_) => QuizScreen(
          lessonFilter: 'Güncel Bilgiler',
          customTitle: '${bulletin.monthTitle} · Güncel Mini Test',
          limit: 10,
          mode: QuizMode.learning,
        ),
      ),
    );
  }

  void _openFlashcards() {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (_) =>
            const FlashcardsScreen(initialLesson: 'Güncel Bilgiler'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isLargeTablet = ResponsiveBreakpoints.isLargeTablet(context);
    final activeSelection = readOrWatchExamSelection(ref);
    final bulletin = _activeBulletin;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Aylık Güncel Bilgiler Bülteni'),
        actions: [
          IconButton(
            tooltip: 'Kaydedilenleri Göster',
            icon: PhosphorIcon(
              _bookmarkedOnly
                  ? PhosphorIconsFill.bookmarkSimple
                  : PhosphorIconsRegular.bookmarkSimple,
              color: _bookmarkedOnly ? colorScheme.primary : null,
            ),
            onPressed: () {
              setState(() => _bookmarkedOnly = !_bookmarkedOnly);
            },
          ),
        ],
      ),
      body: ResponsiveContentWrapper(
        maxWidth: isLargeTablet ? 1200 : 760,
        padding: EdgeInsets.zero,
        child: _isLoading
            ? const KadroSkeletonList(itemCount: 5)
            : _errorMessage != null
            ? KadroErrorState.network(
                title: 'Bülten şu anda yüklenemedi',
                description: _errorMessage!,
                onRetry: _loadData,
              )
            : bulletin == null
            ? EmptyStateView(
                icon: PhosphorIconsRegular.newspaper,
                title: 'Bülten bulunamadı',
                description: 'Henüz yayınlanmış güncel bülten bulunmuyor.',
                actionLabel: 'Tekrar Dene',
                onAction: _loadData,
              )
            : _BulletinBody(
                bulletins: _bulletins,
                activeBulletin: bulletin,
                items: widget.repository.filterItems(
                  bulletin,
                  examScope: activeSelection.family.name,
                  category: _selectedCategory,
                  bookmarkedOnly: _bookmarkedOnly,
                  bookmarkedIds: _bookmarkedIds,
                ),
                selectedCategory: _selectedCategory,
                bookmarkedOnly: _bookmarkedOnly,
                readIds: _readIds,
                bookmarkedIds: _bookmarkedIds,
                isDesktop: isLargeTablet,
                onSelectMonth: (ym) => setState(() => _selectedYearMonth = ym),
                onSelectCategory: (cat) =>
                    setState(() => _selectedCategory = cat),
                onToggleBookmarkedOnly: () =>
                    setState(() => _bookmarkedOnly = !_bookmarkedOnly),
                onResetFilters: () => setState(() {
                  _selectedCategory = null;
                  _bookmarkedOnly = false;
                }),
                onToggleRead: _toggleRead,
                onToggleBookmark: _toggleBookmark,
                onStartMiniQuiz: () => _openMonthlyMiniQuiz(bulletin),
                onOpenFlashcards: _openFlashcards,
              ),
      ),
    );
  }
}

class _BulletinBody extends StatelessWidget {
  final List<CurrentAffairsBulletin> bulletins;
  final CurrentAffairsBulletin activeBulletin;
  final List<CurrentAffairsItem> items;
  final CurrentAffairsCategory? selectedCategory;
  final bool bookmarkedOnly;
  final Set<String> readIds;
  final Set<String> bookmarkedIds;
  final bool isDesktop;
  final ValueChanged<String> onSelectMonth;
  final ValueChanged<CurrentAffairsCategory?> onSelectCategory;
  final VoidCallback onToggleBookmarkedOnly;
  final VoidCallback onResetFilters;
  final ValueChanged<String> onToggleRead;
  final ValueChanged<String> onToggleBookmark;
  final VoidCallback onStartMiniQuiz;
  final VoidCallback onOpenFlashcards;

  const _BulletinBody({
    required this.bulletins,
    required this.activeBulletin,
    required this.items,
    required this.selectedCategory,
    required this.bookmarkedOnly,
    required this.readIds,
    required this.bookmarkedIds,
    required this.isDesktop,
    required this.onSelectMonth,
    required this.onSelectCategory,
    required this.onToggleBookmarkedOnly,
    required this.onResetFilters,
    required this.onToggleRead,
    required this.onToggleBookmark,
    required this.onStartMiniQuiz,
    required this.onOpenFlashcards,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final readCount = activeBulletin.readCountFor(readIds);
    final totalCount = activeBulletin.items.length;

    return Scrollbar(
      child: SingleChildScrollView(
        padding: AppSpacing.pagePadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TugrulAvatar(
                  mood: TugrulMood.current,
                  size: isDesktop ? 64 : 52,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 8,
                        runSpacing: 6,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            activeBulletin.monthTitle,
                            style: textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          KadroBadge(
                            key: const ValueKey(
                              'current_affairs_progress_pill',
                            ),
                            label: '$readCount/$totalCount Okundu',
                            tone: KadroBadgeTone.secondary,
                          ),
                        ],
                      ),
                      if (activeBulletin.subtitle.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          activeBulletin.subtitle,
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            KadroFilterChips<String>(
              selectedValue: activeBulletin.yearMonth,
              onSelected: onSelectMonth,
              options: [
                for (final bulletin in bulletins)
                  KadroFilterOption(
                    key: ValueKey('month_chip_${bulletin.yearMonth}'),
                    value: bulletin.yearMonth,
                    label: bulletin.shortMonthLabel,
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ChoiceChip(
                  key: const ValueKey('category_chip_all'),
                  label: const Text('Tümü'),
                  selected: selectedCategory == null && !bookmarkedOnly,
                  onSelected: (_) => onSelectCategory(null),
                ),
                for (final cat in CurrentAffairsCategory.values)
                  ChoiceChip(
                    key: ValueKey('category_chip_${cat.wireKey}'),
                    label: Text(cat.label),
                    selected: selectedCategory == cat,
                    onSelected: (_) => onSelectCategory(cat),
                  ),
                FilterChip(
                  key: const ValueKey('category_chip_bookmarked'),
                  label: const Text('Kaydedilenler'),
                  selected: bookmarkedOnly,
                  avatar: PhosphorIcon(
                    bookmarkedOnly
                        ? PhosphorIconsFill.bookmarkSimple
                        : PhosphorIconsRegular.bookmarkSimple,
                    size: 16,
                    color: bookmarkedOnly
                        ? colorScheme.primary
                        : colorScheme.onSurfaceVariant,
                  ),
                  onSelected: (_) => onToggleBookmarkedOnly(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (items.isEmpty)
              TactileCard(
                padding: const EdgeInsets.all(20),
                backgroundColor: colorScheme.surfaceContainerLow,
                borderColor: colorScheme.outlineVariant,
                child: EmptyStateView(
                  icon: PhosphorIconsRegular.funnel,
                  title: 'Bu filtrede bülten maddesi yok',
                  description: 'Seçtiğin kategori veya kaydedilenler filtresiyle eşleşen içerik bulunamadı.',
                  actionLabel: 'Tümünü Göster',
                  onAction: onResetFilters,
                ),
              )
            else
              ResponsiveGrid(
                columns: isDesktop ? 2 : 1,
                spacing: 12,
                runSpacing: 12,
                children: [
                  for (final item in items)
                    CurrentAffairsCard(
                      item: item,
                      isRead: readIds.contains(item.id),
                      isBookmarked: bookmarkedIds.contains(item.id),
                      onToggleRead: () => onToggleRead(item.id),
                      onToggleBookmark: () => onToggleBookmark(item.id),
                    ),
                ],
              ),
            const SizedBox(height: 20),
            _PracticeCalloutCard(
              monthTitle: activeBulletin.monthTitle,
              onStartMiniQuiz: onStartMiniQuiz,
              onOpenFlashcards: onOpenFlashcards,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _PracticeCalloutCard extends StatelessWidget {
  final String monthTitle;
  final VoidCallback onStartMiniQuiz;
  final VoidCallback onOpenFlashcards;

  const _PracticeCalloutCard({
    required this.monthTitle,
    required this.onStartMiniQuiz,
    required this.onOpenFlashcards,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return TactileCard(
      padding: const EdgeInsets.all(18),
      backgroundColor: Color.alphaBlend(
        colorScheme.primary.withAlpha(18),
        colorScheme.surface,
      ),
      borderColor: colorScheme.primary.withAlpha(120),
      lipColor: colorScheme.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              PhosphorIcon(
                PhosphorIconsFill.exam,
                size: 20,
                color: colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '$monthTitle Bültenini Pekiştir',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'Okuduğun güncel başlıkları ÖSYM tarzı sorularla ve aralıklı tekrar bilgi kartlarıyla hafızana sabitle.',
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              FilledButton.icon(
                key: const ValueKey('current_affairs_mini_test_btn'),
                onPressed: onStartMiniQuiz,
                icon: const PhosphorIcon(PhosphorIconsBold.play, size: 16),
                label: const Text(
                  'Bu Ayın Bülteninden 10 Soruluk Mini Test Çöz',
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
              OutlinedButton.icon(
                key: const ValueKey('current_affairs_flashcards_btn'),
                onPressed: onOpenFlashcards,
                icon: const PhosphorIcon(PhosphorIconsRegular.cards, size: 16),
                label: const Text(
                  'Bilgi Kartlarıyla Tekrar Et',
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
