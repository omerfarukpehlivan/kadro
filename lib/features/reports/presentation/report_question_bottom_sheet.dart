import 'package:flutter/material.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/reports/data/models/question_report.dart';
import 'package:kadro/features/reports/data/question_report_repository.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Test esnasında kullanıcının hatalı soruyu sebep ve isteğe bağlı not ile
/// bildirmesini sağlayan modern alt sayfa bileşeni (BottomSheet - TASK-47).
///
/// Angular Karşılığı: Modal Dialog / Bottom Sheet bileşenidir.
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

    await _repository.submitReport(report);

    if (!mounted) return;

    Navigator.of(context).pop();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Bildirimin için teşekkürler! Soru incelemeye alındı.'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    // Sorunun ilk 80 karakteri
    final previewText = widget.question.text.length > 80
        ? '${widget.question.text.substring(0, 80)}...'
        : widget.question.text;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Sürükleme Tutacağı
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // Başlık ve Kapat Butonu
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: colorScheme.errorContainer,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      LucideIcons.flag,
                      color: colorScheme.onErrorContainer,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Hatalı Soru Bildir',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
                tooltip: 'Kapat',
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Soru Bağlam Özeti Kartı
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest.withAlpha(120),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colorScheme.outlineVariant),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        '${widget.question.lesson} · ${widget.question.topic}',
                        style: textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.bold,
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

          // Rapor Sebebi Başlığı
          Text(
            'Hata Sebebi Nedir?',
            style: textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),

          // Hazır Sebepler (ChoiceChip Sarmalı)
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _reportReasons.map((reason) {
              final isSelected = reason == _selectedReason;
              return ChoiceChip(
                label: Text(reason),
                selected: isSelected,
                onSelected: (selected) {
                  if (selected) {
                    setState(() {
                      _selectedReason = reason;
                    });
                  }
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 16),

          // İsteğe Bağlı Detay Alanı
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

          // Bildirimi Gönder Butonu
          FilledButton.icon(
            onPressed: _isSubmitting ? null : _submitReport,
            icon: _isSubmitting
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(LucideIcons.send, size: 18),
            label: Text(_isSubmitting ? 'İletiliyor...' : 'Bildirimi Gönder'),
          ),
        ],
      ),
    );
  }
}
