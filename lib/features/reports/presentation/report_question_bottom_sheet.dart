import 'package:flutter/material.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/reports/data/models/question_report.dart';
import 'package:kadro/features/reports/data/question_report_repository.dart';
import 'package:kadro/shared/widgets/kadro_dropdown.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Test esnasında kullanıcının hatalı soruyu sebep ve isteğe bağlı not ile
/// bildirmesini sağlayan alt sayfa bileşeni.
class ReportQuestionBottomSheet extends StatefulWidget {
  final Question question;
  final String testTitle;
  final QuestionReportRepository? repository;

  const ReportQuestionBottomSheet({
    super.key,
    required this.question,
    required this.testTitle,
    this.repository,
  });

  @override
  State<ReportQuestionBottomSheet> createState() =>
      _ReportQuestionBottomSheetState();
}

class _ReportQuestionBottomSheetState extends State<ReportQuestionBottomSheet> {
  static const List<String> _reportReasons = [
    'Cevap anahtarı hatalı',
    'Soru kökünde / öncüllerde bilgi hatası',
    'Birden fazla doğru şık var',
    'Çözüm açıklaması yetersiz / yanlış',
    'Yazım / İmla hatası',
    'Diğer',
  ];

  late final QuestionReportRepository _repository;
  String _selectedReason = _reportReasons.first;
  final TextEditingController _noteController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _repository = widget.repository ?? const QuestionReportRepository();
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _submitReport() async {
    setState(() {
      _isSubmitting = true;
    });

    final report = QuestionReport(
      id: '',
      questionId: widget.question.id,
      lesson: widget.question.lesson,
      topic: widget.question.topic,
      testTitle: widget.testTitle,
      questionText: widget.question.text,
      reason: _selectedReason,
      userNote: _noteController.text.trim().isEmpty
          ? null
          : _noteController.text.trim(),
      createdAt: DateTime.now(),
    );

    final success = await _repository.submitReport(report);

    if (!mounted) return;

    Navigator.of(context).pop();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          success
              ? 'Bildirimin için teşekkürler. Soru incelemeye alındı.'
              : 'Çok hızlı bildirim gönderiyorsunuz. Lütfen biraz bekleyin.',
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final previewText = widget.question.text.length > 80
        ? '${widget.question.text.substring(0, 80)}...'
        : widget.question.text;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              width: 36,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  PhosphorIcon(
                    PhosphorIconsRegular.flag,
                    color: colorScheme.error,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Hatalı Soru Bildir',
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: const PhosphorIcon(PhosphorIconsBold.x, size: 18),
                onPressed: () => Navigator.of(context).pop(),
                tooltip: 'Kapat',
              ),
            ],
          ),
          const SizedBox(height: 14),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: colorScheme.outlineVariant),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        '${widget.question.lesson} · ${widget.question.topic}',
                        style: textTheme.labelSmall?.copyWith(
                          color: colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        widget.testTitle,
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  previewText,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          Text(
            'Hata Sebebi Nedir?',
            style: textTheme.titleSmall?.copyWith(color: colorScheme.onSurface),
          ),
          const SizedBox(height: 8),

          KadroDropdown<String>(
            dropdownKey: const ValueKey('report_reason_dropdown'),
            value: _selectedReason,
            items: _reportReasons,
            leadingIcon: PhosphorIconsRegular.warningCircle,
            enabled: !_isSubmitting,
            itemLabelBuilder: (reason) => reason,
            itemKeyBuilder: (reason) => ValueKey('report_reason_$reason'),
            onChanged: (reason) {
              setState(() {
                _selectedReason = reason;
              });
            },
          ),
          const SizedBox(height: 16),

          TextField(
            controller: _noteController,
            maxLines: 3,
            maxLength: 250,
            decoration: InputDecoration(
              hintText: 'Detay eklemek ister misiniz? (Opsiyonel)',
              hintStyle: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 16),

          FilledButton.icon(
            onPressed: _isSubmitting ? null : _submitReport,
            icon: _isSubmitting
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const PhosphorIcon(
                    PhosphorIconsRegular.paperPlaneTilt,
                    size: 16,
                  ),
            label: Text(_isSubmitting ? 'İletiliyor...' : 'Bildirimi Gönder'),
          ),
        ],
      ),
    );
  }
}
