import 'package:flutter/material.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/presentation/widgets/option_tile.dart';

/// Etkileşimli Soru Ekranı (Faz 4).
///
/// StatefulWidget, Flutter'da iç durumu (state) değişebilen bileşenlerdir.
/// Angular'daki Component state / Signal yapısına benzer. `setState()` çağrıldığında
/// Flutter bu widget'ın `build()` metodunu yeniden tetikleyerek (Change Detection gibi)
/// arayüzü günceller.
class QuizScreen extends StatefulWidget {
  final Question question;

  const QuizScreen({
    super.key,
    this.question = const Question(
      id: 'tar_001',
      lesson: 'Tarih',
      topic: 'İlk Türk Devletleri',
      text: 'Uygurların yerleşik hayata geçmesiyle birlikte Türk kültür ve devlet yapısında önemli değişimler yaşanmıştır.\n\nAşağıdakilerden hangisi bu değişimlerin doğrudan bir sonucu olarak gösterilemez?',
      options: [
        'Tapınak ve saray mimarisinin gelişmesi',
        'Kalıcı yazılı eserlerin ve kütüphanelerin ortaya çıkması',
        'Hükümdarlığın kut inancına dayandırılması geleneğinin sona ermesi',
        'Minyatür ve fresk gibi süsleme sanatlarının yaygınlaşması',
        'Tarım faaliyetlerinin temel geçim kaynağı hâline gelmesi',
      ],
      correctIndex: 2,
      explanation: 'Kut inancı Türk devlet geleneğinde varlığını sürdürmüştür. Yerleşik hayat bu inancı sona erdirmemiştir.',
    ),
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? _selectedOptionIndex;
  bool _isAnswered = false;

  /// Şıkkın mevcut durumuna (normal, seçili, doğru, yanlış) karar veren metot.
  OptionStatus _getOptionStatus(int index) {
    if (!_isAnswered) {
      return index == _selectedOptionIndex
          ? OptionStatus.selected
          : OptionStatus.normal;
    }

    if (index == widget.question.correctIndex) {
      return OptionStatus.correct;
    }

    if (index == _selectedOptionIndex) {
      return OptionStatus.wrong;
    }

    return OptionStatus.normal;
  }

  void _onOptionTap(int index) {
    // Cevap onaylandıktan sonra şık değiştirilemesin
    if (_isAnswered) return;

    setState(() {
      _selectedOptionIndex = index;
    });
  }

  void _submitAnswer() {
    if (_selectedOptionIndex == null || _isAnswered) return;

    final isCorrect = widget.question.isCorrect(_selectedOptionIndex);

    setState(() {
      _isAnswered = true;
    });

    if (!isCorrect) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Bu soru Yanlış Defteri listene eklendi.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const labels = ['A', 'B', 'C', 'D', 'E'];
    final question = widget.question;

    return Scaffold(
      appBar: AppBar(title: Text('${question.lesson} Testi')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 1. Üst Bilgi Rozeti (Konu ve Soru Sayısı)
          _QuestionMetaBar(
            topic: question.topic,
            questionNumber: 1,
            totalQuestions: 1,
          ),
          const SizedBox(height: 16),

          // 2. Soru Metni Kartı
          _QuestionCard(text: question.text),
          const SizedBox(height: 16),

          // Şıklar (A - E)
          for (var i = 0; i < question.options.length; i++)
            OptionTile(
              label: labels[i],
              text: question.options[i],
              status: _getOptionStatus(i),
              onTap: _isAnswered ? null : () => _onOptionTap(i),
            ),
          const SizedBox(height: 16),

          // Çözüm Açıklaması Kartı (Cevaplandıysa gösterilir)
          if (_isAnswered) ...[
            _ExplanationCard(explanation: question.explanation),
            const SizedBox(height: 16),
          ],

          // Onay Butonu
          FilledButton.icon(
            onPressed: (_selectedOptionIndex != null && !_isAnswered)
                ? _submitAnswer
                : null,
            icon: Icon(_isAnswered ? Icons.check : Icons.check_circle_outline),
            label: Text(_isAnswered ? 'Cevaplandı' : 'Cevabı Onayla'),
          ),
        ],
      ),
    );
  }
}

/// Soru konusunu ve soru numarasını gösteren üst şerit.
class _QuestionMetaBar extends StatelessWidget {
  final String topic;
  final int questionNumber;
  final int totalQuestions;

  const _QuestionMetaBar({
    required this.topic,
    required this.questionNumber,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              topic,
              style: theme.textTheme.labelMedium?.copyWith(
                color: colorScheme.onSecondaryContainer,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          'Soru $questionNumber / $totalQuestions',
          style: theme.textTheme.labelLarge?.copyWith(
            color: colorScheme.outline,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

/// Soru metnini içeren kart bileşeni.
class _QuestionCard extends StatelessWidget {
  final String text;

  const _QuestionCard({required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 0,
      color: colorScheme.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: colorScheme.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          text,
          style: theme.textTheme.bodyLarge?.copyWith(
            height: 1.5,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

/// Soru cevaplandıktan sonra gösterilen çözüm açıklaması kartı.
class _ExplanationCard extends StatelessWidget {
  final String explanation;

  const _ExplanationCard({required this.explanation});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      color: colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.lightbulb_outline,
                  color: colorScheme.primary,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Çözüm Açıklaması',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              explanation,
              style: theme.textTheme.bodyMedium?.copyWith(height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}
