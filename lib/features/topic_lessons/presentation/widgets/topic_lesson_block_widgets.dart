import 'package:flutter/material.dart';
import 'package:kadro/features/mistakes/data/mistake_repository.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/presentation/widgets/option_tile.dart';
import 'package:kadro/features/topic_lessons/data/models/topic_lesson_models.dart';
import 'package:kadro/features/topic_lessons/presentation/widgets/inline_formatted_text.dart';
import 'package:kadro/shared/widgets/kadro_badge.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Bölüm içi alt başlık (`### Başlık`) bloğunu çizen `StatelessWidget`.
///
/// Angular/Web Karşılığı: `<h3 class="topic-unit-heading">`.
class TopicLessonHeadingWidget extends StatelessWidget {
  final TopicLessonHeadingBlock block;

  const TopicLessonHeadingWidget({super.key, required this.block});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 4,
            height: 20,
            decoration: BoxDecoration(
              color: colorScheme.primary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: InlineFormattedText(
              text: block.text,
              style: theme.textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w700,
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Konu anlatımı gövde paragrafını (`paragraph`) yüksek okunabilirlik (`height >= 1.55`)
/// ile çizen `StatelessWidget`.
class TopicLessonParagraphWidget extends StatelessWidget {
  final TopicLessonParagraphBlock block;

  const TopicLessonParagraphWidget({super.key, required this.block});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SelectionArea(
      child: InlineFormattedText(
        text: block.text,
        style: theme.textTheme.bodyLarge?.copyWith(
          color: colorScheme.onSurface,
          height: 1.58,
        ),
      ),
    );
  }
}

/// Madde işaretli listeyi (`bullets`) çizen `StatelessWidget`.
class TopicLessonBulletsWidget extends StatelessWidget {
  final TopicLessonBulletsBlock block;

  const TopicLessonBulletsWidget({super.key, required this.block});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SelectionArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < block.items.length; i++)
            Padding(
              padding: EdgeInsets.only(
                bottom: i == block.items.length - 1 ? 0 : 8,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: InlineFormattedText(
                      text: block.items[i],
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurface,
                        height: 1.55,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

/// Karşılaştırma ve sınıflandırma tablosunu (`table`) taşmasız çizen `StatelessWidget`.
class TopicLessonTableWidget extends StatelessWidget {
  final TopicLessonTableBlock block;

  const TopicLessonTableWidget({super.key, required this.block});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final colCount = block.headers.isNotEmpty
        ? block.headers.length
        : (block.rows.isNotEmpty ? block.rows.first.length : 0);
    if (colCount == 0) return const SizedBox.shrink();

    return TactileCard(
      padding: EdgeInsets.zero,
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.outlineVariant,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: (MediaQuery.sizeOf(context).width - 40).clamp(260, 680),
            ),
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              border: TableBorder(
                horizontalInside: BorderSide(
                  color: colorScheme.outlineVariant.withAlpha(140),
                ),
                verticalInside: BorderSide(
                  color: colorScheme.outlineVariant.withAlpha(90),
                ),
              ),
              columnWidths: {
                for (var c = 0; c < colCount; c++)
                  c: const IntrinsicColumnWidth(flex: 1),
              },
              children: [
                if (block.headers.isNotEmpty)
                  TableRow(
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer.withAlpha(110),
                    ),
                    children: [
                      for (var c = 0; c < colCount; c++)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          child: InlineFormattedText(
                            text: c < block.headers.length
                                ? block.headers[c]
                                : '',
                            style: theme.textTheme.labelLarge?.copyWith(
                              color: colorScheme.onSurface,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                    ],
                  ),
                for (var r = 0; r < block.rows.length; r++)
                  TableRow(
                    decoration: BoxDecoration(
                      color: r.isOdd
                          ? colorScheme.surfaceContainerLowest
                          : colorScheme.surface,
                    ),
                    children: [
                      for (var c = 0; c < colCount; c++)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 260),
                            child: InlineFormattedText(
                              text: c < block.rows[r].length
                                  ? block.rows[r][c]
                                  : '',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurface,
                                height: 1.45,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Dikey kronoloji / zaman çizgisini (`timeline`) çizen `StatelessWidget`.
class TopicLessonTimelineWidget extends StatelessWidget {
  final TopicLessonTimelineBlock block;

  const TopicLessonTimelineWidget({super.key, required this.block});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TactileCard(
      backgroundColor: colorScheme.surfaceContainerLowest,
      borderColor: colorScheme.outlineVariant,
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < block.items.length; i++)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 24,
                  child: Column(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        margin: const EdgeInsets.only(top: 6),
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: colorScheme.primaryContainer,
                            width: 2,
                          ),
                        ),
                      ),
                      if (i < block.items.length - 1)
                        Container(
                          width: 2,
                          height: 44,
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          color: colorScheme.primary.withAlpha(90),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: i == block.items.length - 1 ? 0 : 12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KadroBadge(
                          label: block.items[i].label,
                          tone: KadroBadgeTone.primary,
                        ),
                        const SizedBox(height: 4),
                        InlineFormattedText(
                          text: block.items[i].text,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurface,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

/// Vurgulu kutu (`callout`: `info`, `mnemonic`, `trap`, `example`) bloğunu çizen `StatelessWidget`.
///
/// `kind == TopicLessonCalloutKind.trap` olduğunda soru çözüm ekranındaki
/// `distractorTrap` ("ÖSYM ÇELDİRİCİ TUZAĞI") altın/kehribar uyarı rozeti stilini
/// birebir yeniden kullanır (`TASK-168` Ortak Sözleşme).
class TopicLessonCalloutWidget extends StatelessWidget {
  final TopicLessonCalloutBlock block;

  const TopicLessonCalloutWidget({super.key, required this.block});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (block.kind == TopicLessonCalloutKind.trap) {
      return Container(
        key: const ValueKey('topic_lesson_trap_callout'),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: colorScheme.tertiaryContainer,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: colorScheme.tertiary.withAlpha(140),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: colorScheme.tertiary.withAlpha(120),
              offset: const Offset(0, 3),
              blurRadius: 0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                PhosphorIcon(
                  PhosphorIconsBold.warningCircle,
                  size: 16,
                  color: colorScheme.onTertiaryContainer,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'ÖSYM ÇELDİRİCİ TUZAĞI',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onTertiaryContainer,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            InlineFormattedText(
              text: block.text,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onTertiaryContainer,
                height: 1.5,
              ),
            ),
          ],
        ),
      );
    }

    final (
      String title,
      IconData icon,
      Color bg,
      Color border,
      Color fg,
    ) = switch (block.kind) {
      TopicLessonCalloutKind.mnemonic => (
        'HAFIZA KODU & ŞİFRE',
        PhosphorIconsFill.sparkle,
        colorScheme.primaryContainer.withAlpha(135),
        colorScheme.primary.withAlpha(130),
        colorScheme.onPrimaryContainer,
      ),
      TopicLessonCalloutKind.example => (
        'ÖRNEK & UYGULAMA',
        PhosphorIconsFill.notepad,
        colorScheme.surfaceContainerLow,
        colorScheme.outlineVariant,
        colorScheme.onSurface,
      ),
      _ => (
        'KRİTİK BİLGİ',
        PhosphorIconsFill.info,
        colorScheme.secondaryContainer.withAlpha(120),
        colorScheme.secondary.withAlpha(120),
        colorScheme.onSecondaryContainer,
      ),
    };

    return TactileCard(
      backgroundColor: bg,
      borderColor: border,
      lipColor: border,
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              PhosphorIcon(icon, size: 16, color: fg),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: fg,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          InlineFormattedText(
            text: block.text,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

/// Bölüm sonu "Akılda Kalsın" özet maddelerini (`key_points`) çizen `StatelessWidget`.
class TopicLessonKeyPointsWidget extends StatelessWidget {
  final TopicLessonKeyPointsBlock block;

  const TopicLessonKeyPointsWidget({super.key, required this.block});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TactileCard(
      backgroundColor: colorScheme.secondaryContainer.withAlpha(90),
      borderColor: colorScheme.secondary.withAlpha(140),
      lipColor: colorScheme.secondary.withAlpha(160),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              PhosphorIcon(
                PhosphorIconsFill.checkCircle,
                size: 18,
                color: colorScheme.secondary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Akılda Kalsın',
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          for (var i = 0; i < block.items.length; i++)
            Padding(
              padding: EdgeInsets.only(
                bottom: i == block.items.length - 1 ? 0 : 8,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PhosphorIcon(
                    PhosphorIconsBold.check,
                    size: 15,
                    color: colorScheme.secondary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: InlineFormattedText(
                      text: block.items[i],
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurface,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

/// Bölüm sonu satır içi mini kontrol sorularını (`check_questions`) mevcut
/// [OptionTile] bileşeniyle çizen widget (`TASK-168`).
///
/// Ortak Sözleşme kuralı:
/// - Kontrol soruları günlük soru kotasından **düşmez**.
/// - İstatistiğe konu testi olarak **sayılmaz**.
/// - Yanlış cevaplandığında Yanlış Defteri'ne ([MistakeRepository]) **yazılır**.
class TopicLessonCheckQuestionsWidget extends StatefulWidget {
  final List<Question> questions;
  final String examScope;

  const TopicLessonCheckQuestionsWidget({
    super.key,
    required this.questions,
    this.examScope = 'lisans_gygk',
  });

  @override
  State<TopicLessonCheckQuestionsWidget> createState() =>
      _TopicLessonCheckQuestionsWidgetState();
}

class _TopicLessonCheckQuestionsWidgetState
    extends State<TopicLessonCheckQuestionsWidget> {
  final Map<String, int> _selectedOptionByQuestionId = {};
  static const MistakeRepository _mistakeRepo = MistakeRepository();
  static const List<String> _optionLabels = ['A', 'B', 'C', 'D', 'E'];

  void _selectOption(Question question, int optionIndex) {
    if (_selectedOptionByQuestionId.containsKey(question.id)) {
      return;
    }
    setState(() {
      _selectedOptionByQuestionId[question.id] = optionIndex;
    });
    if (!question.isCorrect(optionIndex)) {
      _mistakeRepo.addMistake(question, examScope: widget.examScope);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.questions.isEmpty) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            PhosphorIcon(
              PhosphorIconsFill.sealQuestion,
              size: 18,
              color: colorScheme.primary,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Kendini Yokla (${widget.questions.length} Mini Kontrol Sorusu)',
                style: theme.textTheme.titleSmall?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const KadroBadge(
              label: 'Kotadan Düşmez',
              tone: KadroBadgeTone.neutral,
            ),
          ],
        ),
        const SizedBox(height: 10),
        for (var qIdx = 0; qIdx < widget.questions.length; qIdx++) ...[
          _InlineCheckQuestionCard(
            index: qIdx + 1,
            question: widget.questions[qIdx],
            selectedIndex:
                _selectedOptionByQuestionId[widget.questions[qIdx].id],
            optionLabels: _optionLabels,
            onSelectOption: (optIdx) =>
                _selectOption(widget.questions[qIdx], optIdx),
          ),
          if (qIdx < widget.questions.length - 1) const SizedBox(height: 12),
        ],
      ],
    );
  }
}

class _InlineCheckQuestionCard extends StatelessWidget {
  final int index;
  final Question question;
  final int? selectedIndex;
  final List<String> optionLabels;
  final ValueChanged<int> onSelectOption;

  const _InlineCheckQuestionCard({
    required this.index,
    required this.question,
    required this.selectedIndex,
    required this.optionLabels,
    required this.onSelectOption,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isAnswered = selectedIndex != null;

    return TactileCard(
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.outlineVariant,
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 6,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              KadroBadge(
                label: 'Kontrol Sorusu $index',
                tone: KadroBadgeTone.primary,
              ),
              if (isAnswered)
                KadroBadge(
                  label: question.isCorrect(selectedIndex)
                      ? 'Doğru'
                      : 'Yanlış Defteri',
                  tone: question.isCorrect(selectedIndex)
                      ? KadroBadgeTone.secondary
                      : KadroBadgeTone.error,
                ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            question.text,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w600,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          for (var i = 0; i < question.options.length; i++)
            OptionTile(
              label: i < optionLabels.length ? optionLabels[i] : '${i + 1}',
              text: question.options[i],
              status: !isAnswered
                  ? OptionStatus.normal
                  : (i == question.correctIndex
                        ? OptionStatus.correct
                        : (i == selectedIndex
                              ? OptionStatus.wrong
                              : OptionStatus.normal)),
              onTap: isAnswered ? null : () => onSelectOption(i),
            ),
          if (isAnswered && question.explanation.trim().isNotEmpty) ...[
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: colorScheme.outlineVariant),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Çözüm Özeti',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    question.explanation,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurface,
                      height: 1.48,
                    ),
                  ),
                  if (question.distractorTrap != null &&
                      question.distractorTrap!.trim().isNotEmpty) ...[
                    const SizedBox(height: 8),
                    TopicLessonCalloutWidget(
                      block: TopicLessonCalloutBlock(
                        kind: TopicLessonCalloutKind.trap,
                        text: question.distractorTrap!,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
