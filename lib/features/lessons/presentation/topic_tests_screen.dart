import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/services/offline_download_service.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/data/models/test_difficulty_tier.dart';
import 'package:kadro/features/quiz/data/question_repository.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/mascot_coach_banner.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Bir konuya ait tüm soruları kolaydan zora doğru sıralayan ve
/// 10'ar soruluk numaralandırılmış testlere (Test 1, Test 2, ...) bölen ekran.
///
/// Web/Angular Karşılığı: `TopicTestsComponent`.
/// Kullanıcı konuyu seçtiğinde devasa tek bir test yerine,
/// pedagojik olarak yönetilebilir ve dikkat çekici seviye testleri (Basit Alıştırma,
/// Tam Sınav Ayarı, Net Sıçratan, Kurtlar Sofrası) sunulur.
class TopicTestsScreen extends ConsumerStatefulWidget {
  final String lessonName;
  final String topic;
  final QuestionRepository questionRepository;

  const TopicTestsScreen({
    super.key,
    required this.lessonName,
    required this.topic,
    this.questionRepository = const QuestionRepository(),
  });

  @override
  ConsumerState<TopicTestsScreen> createState() => _TopicTestsScreenState();
}

class _TopicTestsScreenState extends ConsumerState<TopicTestsScreen> {
  bool _isLoading = true;
  List<Question> _allQuestions = [];
  List<List<Question>> _testChunks = [];

  String get packageId => 'topic_${widget.lessonName}_${widget.topic}';

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    final isOnline = ref.read(isOnlineProvider);
    final downloadedPackages = ref.read(downloadedPackagesProvider);
    final isDownloaded = downloadedPackages.contains(packageId);

    List<Question> fetched = [];

    if (!isOnline && isDownloaded) {
      final local = await ref
          .read(offlineDownloadServiceProvider)
          .getDownloadedQuestions(packageId);
      fetched = local ?? [];
    } else {
      try {
        final repo = ref.read(questionRepositoryProvider);
        fetched = await repo.fetchQuestions(
          lesson: widget.lessonName,
          topic: widget.topic,
        );
      } catch (_) {
        // Fallback to widget repository instance
        fetched = await widget.questionRepository.fetchQuestions(
          lesson: widget.lessonName,
          topic: widget.topic,
        );
      }
    }

    // Soruları sırala:
    // 1. Öncelik: Eğer orderIndex tanımlıysa (1..60), doğrudan orderIndex'e göre sırala.
    // 2. Fallback: orderIndex yoksa pedagojik olarak kolaydan zora (difficultyLevel: 1 -> 2 -> 3) sırala.
    fetched.sort((a, b) {
      final aOrder = a.orderIndex;
      final bOrder = b.orderIndex;
      if (aOrder != null && bOrder != null && aOrder > 0 && bOrder > 0) {
        return aOrder.compareTo(bOrder);
      }
      if (aOrder != null && aOrder > 0) return -1;
      if (bOrder != null && bOrder > 0) return 1;
      return a.difficultyLevel.compareTo(b.difficultyLevel);
    });

    // Soruları 10'ar soruluk test paketlerine böl
    final chunks = <List<Question>>[];
    if (fetched.isNotEmpty) {
      const chunkSize = 10;
      for (var i = 0; i < fetched.length; i += chunkSize) {
        chunks.add(fetched.sublist(i, min(i + chunkSize, fetched.length)));
      }
    }

    if (!mounted) return;
    setState(() {
      _allQuestions = fetched;
      _testChunks = chunks;
      _isLoading = false;
    });
  }

  void _startTest(
    int testIndex,
    List<Question> chunkQuestions,
    TestDifficultyTier tier,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => QuizScreen(
          questions: chunkQuestions,
          customTitle:
              '${widget.lessonName} · ${widget.topic} · Test ${testIndex + 1} (${tier.cleanTitle})',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.topic,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              '${widget.lessonName} · ${_testChunks.length} Test (${_allQuestions.length} Soru)',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _testChunks.isEmpty
          ? _buildEmptyState(context)
          : ResponsiveContentWrapper(
              maxWidth: 720,
              padding: EdgeInsets.zero,
              child: ListView(
                padding: AppSpacing.pagePadding(context),
                children: [
                  MascotCoachBanner(
                    mood: MascotMoodExtension.fromLesson(widget.lessonName),
                    badgeLabel:
                        '${widget.lessonName.toUpperCase()} · ${_testChunks.length} TEST',
                    title: '${widget.topic} Testleri',
                    message: 'Bu konudaki sorular kolaydan zora doğru 10\'ar soruluk testlere ayrılmıştır. Sırayla tamamla, netlerini zirveye taşı!',
                  ),
                  AppSpacing.gapMd,
                  for (var i = 0; i < _testChunks.length; i++)
                    _buildTestCard(
                      context: context,
                      index: i,
                      chunk: _testChunks[i],
                    ),
                ],
              ),
            ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: TactileCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const PhosphorIcon(PhosphorIconsDuotone.bookOpenText, size: 48),
              const SizedBox(height: 12),
              Text(
                'Test Bulunamadı',
                style: Theme.of(context).textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Bu konuya ait henüz soru yüklenmemiş veya çevrimdışı paket indirilmemiş.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 16),
              FilledButton.tonal(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Geri Dön'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTestCard({
    required BuildContext context,
    required int index,
    required List<Question> chunk,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final stats = ref.watch(studyStatsProvider);
    final solvedSession = stats.findLatestSessionForTest(
      lesson: widget.lessonName,
      topic: widget.topic,
      testNumber: index + 1,
    );

    // Ortalama zorluk hesabı ve Seviye (Tier) belirleme
    final avgDifficulty = chunk.isNotEmpty
        ? chunk.map((q) => q.difficultyLevel).reduce((a, b) => a + b) /
              chunk.length
        : 2.0;

    final tier = TestDifficultyTierExtension.fromAvgDifficulty(avgDifficulty);
    final badgeBg = tier.backgroundColor(colorScheme);
    final badgeFg = tier.foregroundColor(colorScheme);

    return Padding(
      padding: AppSpacing.cardMarginBottom,
      child: TactileCard(
        onTap: () => _startTest(index, chunk, tier),
        backgroundColor: solvedSession != null
            ? colorScheme.secondaryContainer.withAlpha(35)
            : colorScheme.surface,
        borderColor: solvedSession != null
            ? colorScheme.secondary.withAlpha(160)
            : colorScheme.outlineVariant,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Sol: Test Numarası Rozeti, Seviye Rozeti ve Çözüldü Rozeti
            Expanded(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8,
                runSpacing: 6,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'TEST ${index + 1}',
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: badgeBg,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(tier.icon, size: 12, color: badgeFg),
                        const SizedBox(width: 4),
                        Text(
                          tier.title,
                          style: textTheme.labelSmall?.copyWith(
                            color: badgeFg,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (solvedSession != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PhosphorIcon(
                            PhosphorIconsFill.checkCircle,
                            size: 13,
                            color: colorScheme.onSecondaryContainer,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Çözüldü · ${solvedSession.correctCount}D ${solvedSession.wrongCount}Y (${solvedSession.netScore.toStringAsFixed(1)} Net)',
                            style: textTheme.labelSmall?.copyWith(
                              color: colorScheme.onSecondaryContainer,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Sağ: Aksiyon Butonu
            FilledButton.tonal(
              onPressed: () => _startTest(index, chunk, tier),
              style: FilledButton.styleFrom(
                visualDensity: VisualDensity.compact,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
              ),
              child: Text(solvedSession != null ? 'Tekrar Çöz' : 'Test Çöz'),
            ),
          ],
        ),
      ),
    );
  }
}
