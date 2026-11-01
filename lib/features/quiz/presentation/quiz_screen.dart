import 'package:flutter/material.dart';
import 'package:kadro/features/mistakes/data/mistake_repository.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/data/models/quiz_result.dart';
import 'package:kadro/features/quiz/presentation/quiz_result_screen.dart';
import 'package:kadro/features/quiz/presentation/widgets/option_tile.dart';

/// Varsayılan olarak gösterilen 3 özgün KPSS Lisans Genel Kültür sorusu.
const List<Question> defaultSampleQuestions = [
  Question(
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
    explanation: 'Kut inancı (hükümdarlığın tanrısal kaynaklı olduğuna inanılması) Türk devlet geleneğinde varlığını sürdürmüştür. Yerleşik hayat bu inancı sona erdirmemiştir.',
  ),
  Question(
    id: 'cog_001',
    lesson: 'Coğrafya',
    topic: 'Türkiye\'nin Fiziki Özellikleri',
    text: 'Türkiye\'de karstik şekiller en yaygın olarak Akdeniz Bölgesi\'nde, özellikle Teke ve Taşeli platolarında görülür.\n\nBu durumun ortaya çıkmasında bölgenin hangi temel özelliği en fazla etkili olmuştur?',
    options: [
      'Yıllık yağış miktarının fazla olması',
      'Kolay eriyebilen kalkerli (kireçtaşı) kayaç yapısına sahip olması',
      'Ortalama yükseltisinin fazla olması',
      'Bitki örtüsünün maki olması',
      'Fay hatlarının yoğun bulunması',
    ],
    correctIndex: 1,
    explanation: 'Karstik şekillerin oluşabilmesi için kimyasal tortul kayaçların (kalker, jips gibi eriyebilen taşların) bulunması şarttır. Akdeniz\'deki temel etken kalkerli kayaç yapısıdır.',
  ),
  Question(
    id: 'vat_001',
    lesson: 'Vatandaşlık',
    topic: 'Temel Hak ve Ödevler',
    text: '1982 Anayasası\'na göre aşağıdakilerden hangisi \'Kişinin Hakları ve Ödevleri\' (Koruyucu / Negatif Statü Hakları) arasında yer alır?',
    options: [
      'Din ve vicdan hürriyeti',
      'Çalışma ve sözleşme hürriyeti',
      'Dilekçe hakkı',
      'Eğitim ve öğrenim hakkı ve ödevi',
      'Vergi ödevi',
    ],
    correctIndex: 0,
    explanation: 'Din ve vicdan hürriyeti kişinin temel hak ve ödevleri (koruyucu/negatif statü) arasındadır. Çalışma ve eğitim sosyal-ekonomik haklar; dilekçe ve vergi ise siyasi haklardır.',
  ),
];

/// Etkileşimli ve Çoklu Sorulu Test Ekranı (Faz 4).
///
/// StatefulWidget, Flutter'da iç durumu (state) değişebilen bileşenlerdir.
/// Angular'daki Component state / Signal yapısına benzer. `setState()` çağrıldığında
/// Flutter bu widget'ın `build()` metodunu yeniden tetikleyerek (Change Detection gibi)
/// arayüzü günceller.
class QuizScreen extends StatefulWidget {
  final List<Question> questions;
  final MistakeRepository mistakeRepository;

  const QuizScreen({
    super.key,
    this.questions = defaultSampleQuestions,
    this.mistakeRepository = const MistakeRepository(),
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  int? _selectedOptionIndex;
  bool _isAnswered = false;
  int _correctCount = 0;
  int _wrongCount = 0;

  Question get _currentQuestion => widget.questions[_currentIndex];
  bool get _isLastQuestion => _currentIndex == widget.questions.length - 1;

  /// Şıkkın mevcut durumuna (normal, seçili, doğru, yanlış) karar veren metot.
  OptionStatus _getOptionStatus(int index) {
    if (!_isAnswered) {
      return index == _selectedOptionIndex
          ? OptionStatus.selected
          : OptionStatus.normal;
    }

    if (index == _currentQuestion.correctIndex) {
      return OptionStatus.correct;
    }

    if (index == _selectedOptionIndex) {
      return OptionStatus.wrong;
    }

    return OptionStatus.normal;
  }

  void _onOptionTap(int index) {
    if (_isAnswered) return;

    setState(() {
      _selectedOptionIndex = index;
    });
  }

  void _submitAnswer() {
    if (_selectedOptionIndex == null || _isAnswered) return;

    final isCorrect = _currentQuestion.isCorrect(_selectedOptionIndex);

    setState(() {
      _isAnswered = true;
      if (isCorrect) {
        _correctCount++;
        widget.mistakeRepository.removeMistake(_currentQuestion.id);
      } else {
        _wrongCount++;
        widget.mistakeRepository.addMistake(_currentQuestion);
      }
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

  void _nextQuestion() {
    setState(() {
      _currentIndex++;
      _selectedOptionIndex = null;
      _isAnswered = false;
    });
  }

  void _finishQuiz() {
    final emptyCount = widget.questions.length - (_correctCount + _wrongCount);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => QuizResultScreen(
          result: QuizResult(
            totalQuestions: widget.questions.length,
            correctCount: _correctCount,
            wrongCount: _wrongCount,
            emptyCount: emptyCount,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const labels = ['A', 'B', 'C', 'D', 'E'];
    final question = _currentQuestion;

    // Alt butonun fonksiyonu, ikonu ve metnini duruma göre belirliyoruz
    final VoidCallback? buttonAction;
    final IconData buttonIcon;
    final String buttonLabel;

    if (!_isAnswered) {
      buttonAction = _selectedOptionIndex != null ? _submitAnswer : null;
      buttonIcon = Icons.check_circle_outline;
      buttonLabel = 'Cevabı Onayla';
    } else if (!_isLastQuestion) {
      buttonAction = _nextQuestion;
      buttonIcon = Icons.arrow_forward;
      buttonLabel = 'Sonraki Soru';
    } else {
      buttonAction = _finishQuiz;
      buttonIcon = Icons.emoji_events_outlined;
      buttonLabel = 'Testi Bitir ve Sonucu Gör';
    }

    return Scaffold(
      appBar: AppBar(title: Text('${question.lesson} Testi')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Konu Başlığı ve Soru Sayacı (Meta Bar)
          _QuestionMetaBar(
            topic: question.topic,
            questionNumber: _currentIndex + 1,
            totalQuestions: widget.questions.length,
          ),
          const SizedBox(height: 8),

          // İlerleme Çubuğu (Progress Indicator)
          LinearProgressIndicator(
            value: (_currentIndex + 1) / widget.questions.length,
          ),
          const SizedBox(height: 16),

          // Soru Metni Kartı
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

          // Aksiyon Butonu (Onayla / Sonraki Soru / Testi Bitir)
          FilledButton.icon(
            onPressed: buttonAction,
            icon: Icon(buttonIcon),
            label: Text(buttonLabel),
          ),
        ],
      ),
    );
  }
}

/// Sorunun ait olduğu konuyu ve testteki sırasını gösteren meta bilgi çubuğu.
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
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          'Soru $questionNumber / $totalQuestions',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

/// Soru metnini gösteren kart bileşeni.
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
