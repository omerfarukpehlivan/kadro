import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/mistakes/data/mistake_repository.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/profile/presentation/paywall_screen.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/data/models/quiz_result.dart';
import 'package:kadro/features/quiz/data/question_repository.dart';
import 'package:kadro/features/quiz/presentation/quiz_result_screen.dart';
import 'package:kadro/features/quiz/presentation/widgets/option_tile.dart';
import 'package:kadro/features/stats/data/cloud_sync_repository.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:kadro/features/stats/data/models/quiz_session_record.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';

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
class QuizScreen extends ConsumerStatefulWidget {
  final List<Question>? questions;
  final String? lessonFilter;
  final String? topicFilter;
  final MistakeRepository mistakeRepository;
  final QuestionRepository questionRepository;
  final Duration? examDuration;
  final String? customTitle;
  final bool fetchAllFromPool;

  const QuizScreen({
    super.key,
    this.questions,
    this.lessonFilter,
    this.topicFilter,
    this.mistakeRepository = const MistakeRepository(),
    this.questionRepository = const QuestionRepository(),
    this.examDuration,
    this.customTitle,
    this.fetchAllFromPool = false,
  });

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  late List<Question> _questions;
  bool _isLoading = false;
  int _currentIndex = 0;
  int? _selectedOptionIndex;
  bool _isAnswered = false;
  int _correctCount = 0;
  int _wrongCount = 0;
  Timer? _timer;
  int _remainingSeconds = 0;

  Question get _currentQuestion => _questions[_currentIndex];
  bool get _isLastQuestion => _currentIndex == _questions.length - 1;

  @override
  void initState() {
    super.initState();
    if (widget.questions != null && widget.questions!.isNotEmpty) {
      _questions = widget.questions!;
    } else {
      _questions = defaultSampleQuestions;
      if (widget.fetchAllFromPool ||
          widget.lessonFilter != null ||
          widget.topicFilter != null) {
        _isLoading = true;
        _fetchFilteredQuestions();
      }
    }

    if (widget.examDuration != null) {
      _remainingSeconds = widget.examDuration!.inSeconds;
      // Timer.periodic: JavaScript/Web'deki setInterval() mantığı gibidir.
      // Her saniye kalan süreyi 1 azaltır ve süre bitince sınavı otomatik noktalar.
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_remainingSeconds > 1) {
          setState(() {
            _remainingSeconds--;
          });
        } else {
          _timer?.cancel();
          setState(() {
            _remainingSeconds = 0;
          });
          if (mounted) {
            _finishQuiz();
          }
        }
      });
    }
  }

  Future<void> _fetchFilteredQuestions() async {
    final fetched = await widget.questionRepository.fetchQuestions(
      lesson: widget.lessonFilter,
      topic: widget.topicFilter,
    );
    if (!mounted) return;
    setState(() {
      if (fetched.isNotEmpty) {
        _questions = fetched;
      }
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    // Angular'daki ngOnDestroy / clearInterval() gibi bellek sızıntısını önlemek için
    // timer nesnesini hafızadan temizliyoruz.
    _timer?.cancel();
    super.dispose();
  }

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

    // Riverpod çalışma istatistikleri provider'ına kaydediyoruz
    try {
      ref
          .read(studyStatsProvider.notifier)
          .recordAnswer(
            lesson: _currentQuestion.lesson,
            topic: _currentQuestion.topic,
            questionText: _currentQuestion.text,
            isCorrect: isCorrect,
          );
    } catch (_) {
      // ProviderScope bulunmayan izole test ortamlarında güvenli fallback
    }

    setState(() {
      _isAnswered = true;
      if (isCorrect) {
        _correctCount++;
        widget.mistakeRepository.removeMistake(_currentQuestion.id);
        const CloudSyncRepository().markMistakeResolved(
          questionText: _currentQuestion.text,
        );
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
    try {
      final prefs = ref.read(userPreferencesProvider);
      final stats = ref.read(studyStatsProvider);
      if (!prefs.isPro &&
          stats.dailySolvedCount >= prefs.dailyFreeQuestionLimit) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const PaywallScreen()));
        return;
      }
    } catch (_) {
      // ProviderScope bulunmayan izole test ortamlarında güvenli fallback
    }

    setState(() {
      _currentIndex++;
      _selectedOptionIndex = null;
      _isAnswered = false;
    });
  }

  void _finishQuiz() {
    _timer?.cancel();
    final emptyCount = _questions.length - (_correctCount + _wrongCount);
    final result = QuizResult(
      totalQuestions: _questions.length,
      correctCount: _correctCount,
      wrongCount: _wrongCount,
      emptyCount: emptyCount,
    );

    try {
      final sessionRecord = QuizSessionRecord(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        title: widget.customTitle ?? '${_currentQuestion.lesson} Testi',
        lesson: _currentQuestion.lesson,
        totalQuestions: _questions.length,
        correctCount: _correctCount,
        wrongCount: _wrongCount,
        emptyCount: emptyCount,
        netScore: result.net,
        earnedXp: _correctCount * 15 + _wrongCount * 5,
        durationSeconds: widget.examDuration != null
            ? (widget.examDuration!.inSeconds - _remainingSeconds).clamp(
                0,
                widget.examDuration!.inSeconds,
              )
            : _questions.length * 20,
        completedAt: DateTime.now(),
      );
      ref.read(studyStatsProvider.notifier).recordQuizSession(sessionRecord);
    } catch (_) {
      // ProviderScope bulunmayan izole test ortamlarında güvenli fallback
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => QuizResultScreen(result: result)),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.customTitle ?? 'Test')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

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
      appBar: AppBar(
        title: Text(widget.customTitle ?? '${question.lesson} Testi'),
        actions: [
          if (widget.examDuration != null)
            _ExamTimerBadge(remainingSeconds: _remainingSeconds),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Konu Başlığı ve Soru Sayacı (Meta Bar)
          _QuestionMetaBar(
            topic: question.topic,
            questionNumber: _currentIndex + 1,
            totalQuestions: _questions.length,
          ),
          const SizedBox(height: 8),

          // İlerleme Çubuğu (Progress Indicator)
          LinearProgressIndicator(
            value: (_currentIndex + 1) / _questions.length,
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

    return TactileCard(
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.outlineVariant,
      child: Text(
        text,
        style: theme.textTheme.bodyLarge?.copyWith(
          color: colorScheme.onSurface,
          height: 1.5,
          fontWeight: FontWeight.w600,
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

    return TactileCard(
      backgroundColor: colorScheme.primaryContainer.withAlpha(80),
      borderColor: colorScheme.primary.withAlpha(120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.lightbulb_outline,
                color: colorScheme.onPrimaryContainer,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Çözüm Açıklaması',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onPrimaryContainer,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            explanation,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

/// Süreli sınavlarda kalan süreyi MM:SS formatında gösteren sayaç rozeti.
class _ExamTimerBadge extends StatelessWidget {
  final int remainingSeconds;

  const _ExamTimerBadge({required this.remainingSeconds});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final minutes = (remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (remainingSeconds % 60).toString().padLeft(2, '0');
    final isCritical = remainingSeconds <= 60 && remainingSeconds > 0;

    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: isCritical
                ? colorScheme.errorContainer
                : colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isCritical
                  ? colorScheme.error
                  : colorScheme.outlineVariant,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.timer_outlined,
                size: 16,
                color: isCritical
                    ? colorScheme.error
                    : colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 6),
              Text(
                '$minutes:$seconds',
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontFeatures: const [FontFeature.tabularFigures()],
                  color: isCritical
                      ? colorScheme.onErrorContainer
                      : colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
