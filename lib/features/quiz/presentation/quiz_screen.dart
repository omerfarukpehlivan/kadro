import 'package:kadro/features/reports/presentation/report_question_bottom_sheet.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/mistakes/data/mistake_repository.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/profile/presentation/paywall_screen.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/data/models/quiz_mode.dart';
import 'package:kadro/features/quiz/data/models/quiz_result.dart';
import 'package:kadro/features/quiz/data/question_repository.dart';
import 'package:kadro/features/quiz/presentation/quiz_result_screen.dart';
import 'package:kadro/features/quiz/presentation/widgets/option_tile.dart';
import 'package:kadro/features/stats/data/cloud_sync_repository.dart';
import 'package:kadro/features/stats/data/models/quiz_session_record.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

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
    distractorTrap: 'Uygurların yerleşik hayata geçmesiyle din ve alfabe değişmiş, tapınak mimarisi başlamıştır. Ancak Kut anlayışı (egemenliğin kaynağının ilahi olması) İslamiyet öncesi Türk devletlerinin tamamında olduğu gibi Uygurlarda da aynen devam etmiştir. ÖSYM adayın \'din değiştiyse yönetim anlayışı da değişmiştir\' ön yargısını en büyük çeldirici olarak kullanır.',
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
    distractorTrap: 'Akdeniz Bölgesi\'nde karstik şekillerin varlığı yağış miktarına DEĞİL, arazinin kolay eriyebilen kalkerli (kireçtaşı) kimyasal tortul kayaç yapısına bağlıdır. Karadeniz Akdeniz\'den çok daha fazla yağış almasına rağmen karstik şekil azdır. ÖSYM \'yağış fazlalığı\' şıkkını en sık kullanılan tuzak olarak koyar.',
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
    distractorTrap: 'Çalışma ve sözleşme hürriyeti ile eğitim hakkı sosyal ve ekonomik haklardır (pozitif statü). Dilekçe ve vergi ise siyasi haklardır (aktif statü). Din ve vicdan hürriyeti ise devletin dahi dokunamayacağı negatif (koruyucu) statü hakkıdır. ÖSYM hak kategorilerini birbiriyle karıştırmayı çok sever.',
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
  final QuizMode? mode;
  final int? limit;

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
    this.mode,
    this.limit,
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

  // İki yönlü soru gezintisi (1..N) için soru durumu hafızası
  final Map<int, int?> _userAnswers = {};
  final Map<int, bool> _answeredStatus = {};
  int _maxReachedIndex = 0;

  // Yanlış Defteri bilgilendirme kartının tek seferlik gösterim durumu
  bool _hasDismissedMistakeNotice = false;
  bool _showMistakeNotice = false;

  QuizMode? _runtimeMode;

  QuizMode get _effectiveMode {
    if (_runtimeMode != null) return _runtimeMode!;
    if (widget.mode != null) return widget.mode!;
    try {
      final prefs = ref.read(userPreferencesProvider);
      final dynamic mode = prefs.defaultQuizMode;
      if (mode is QuizMode) return mode;
    } catch (_) {
      // ProviderScope bulunmayan izole test veya hot-reload fallback
    }
    return QuizMode.learning;
  }

  bool get _isExamMode => _effectiveMode == QuizMode.exam;

  void _toggleQuizMode() {
    setState(() {
      _runtimeMode = _isExamMode ? QuizMode.learning : QuizMode.exam;
    });
    final isNowExam = _isExamMode;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isNowExam
              ? '📝 Sınav Modu devrede: Şıklar gizli, optik form mantığı aktif.'
              : '🎯 Öğrenme Modu devrede: Anında doğru/yanlış ve çözüm açıklaması aktif.',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Question get _currentQuestion => _questions[_currentIndex];
  bool get _isLastQuestion => _currentIndex == _questions.length - 1;

  @override
  void initState() {
    super.initState();
    if (widget.questions != null && widget.questions!.isNotEmpty) {
      _questions = widget.limit != null
          ? widget.questions!.take(widget.limit!).toList()
          : widget.questions!;
    } else {
      _questions = widget.limit != null
          ? defaultSampleQuestions.take(widget.limit!).toList()
          : defaultSampleQuestions;
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
        _questions = widget.limit != null
            ? fetched.take(widget.limit!).toList()
            : fetched;
      }
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    // Bellek sızıntısını önlemek için timer nesnesini hafızadan temizliyoruz.
    _timer?.cancel();
    super.dispose();
  }

  /// Şıkkın mevcut durumuna (normal, seçili, doğru, yanlış) karar veren metot.
  OptionStatus _getOptionStatus(int index) {
    if (_isExamMode) {
      return index == _selectedOptionIndex
          ? OptionStatus.selected
          : OptionStatus.normal;
    }

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
    // Öğrenme modunda onaylanan soru kilitlenir; sınav modunda geri dönülüp şık değiştirilebilir
    if (!_isExamMode && _isAnswered) return;

    setState(() {
      _selectedOptionIndex = index;
      _userAnswers[_currentIndex] = index;
      _answeredStatus[_currentIndex] = true;
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
      _answeredStatus[_currentIndex] = true;
      _userAnswers[_currentIndex] = _selectedOptionIndex;

      if (isCorrect) {
        _correctCount++;
        widget.mistakeRepository.removeMistake(_currentQuestion.id);
        const CloudSyncRepository().markMistakeResolved(
          questionText: _currentQuestion.text,
        );
      } else {
        _wrongCount++;
        widget.mistakeRepository.addMistake(_currentQuestion);
        if (!_hasDismissedMistakeNotice) {
          _showMistakeNotice = true;
        }
      }
    });
  }

  void _previousQuestion() {
    if (_currentIndex <= 0) return;
    setState(() {
      _currentIndex--;
      _selectedOptionIndex = _userAnswers[_currentIndex];
      _isAnswered = _answeredStatus[_currentIndex] ?? false;
      _showMistakeNotice = false;
    });
  }

  void _goToNextQuestion() {
    if (_currentIndex >= _maxReachedIndex) return;
    setState(() {
      _currentIndex++;
      _selectedOptionIndex = _userAnswers[_currentIndex];
      _isAnswered = _answeredStatus[_currentIndex] ?? false;
      _showMistakeNotice = false;
    });
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
      if (_currentIndex > _maxReachedIndex) {
        _maxReachedIndex = _currentIndex;
      }
      _selectedOptionIndex = _userAnswers[_currentIndex];
      _isAnswered = _answeredStatus[_currentIndex] ?? false;
      _showMistakeNotice = false;
    });
  }

  void _finishQuiz() {
    _timer?.cancel();

    // Sınav modunda tüm cevaplar test bitiminde topluca değerlendirilir
    if (_isExamMode) {
      _correctCount = 0;
      _wrongCount = 0;
      for (var i = 0; i < _questions.length; i++) {
        final q = _questions[i];
        final ans = _userAnswers[i];
        if (ans != null) {
          final isCorrect = q.isCorrect(ans);
          if (isCorrect) {
            _correctCount++;
            widget.mistakeRepository.removeMistake(q.id);
            const CloudSyncRepository().markMistakeResolved(
              questionText: q.text,
            );
          } else {
            _wrongCount++;
            widget.mistakeRepository.addMistake(q);
          }
          try {
            ref
                .read(studyStatsProvider.notifier)
                .recordAnswer(
                  lesson: q.lesson,
                  topic: q.topic,
                  questionText: q.text,
                  isCorrect: isCorrect,
                );
          } catch (_) {}
        }
      }
    }

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
      MaterialPageRoute(
        builder: (context) => QuizResultScreen(
          result: result,
          testTitle:
              widget.customTitle ??
              (widget.lessonFilter != null
                  ? '${widget.lessonFilter} Testi'
                  : 'Genel Kültür Testi'),
        ),
      ),
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

    // Alt butonun fonksiyonu, ikonu ve metnini duruma ve çalışma moduna göre belirliyoruz
    final isAtHistory = _currentIndex < _maxReachedIndex;
    final VoidCallback? buttonAction;
    final IconData buttonIcon;
    final String buttonLabel;

    if (_isExamMode) {
      if (isAtHistory) {
        buttonAction = _goToNextQuestion;
        buttonIcon = LucideIcons.arrowRight;
        buttonLabel = 'Sonraki Soru';
      } else if (!_isLastQuestion) {
        buttonAction = _nextQuestion;
        buttonIcon = LucideIcons.arrowRight;
        buttonLabel = 'Sonraki Soru';
      } else {
        buttonAction = _finishQuiz;
        buttonIcon = Icons.emoji_events_outlined;
        buttonLabel = 'Testi Bitir ve Sonucu Gör';
      }
    } else {
      if (isAtHistory) {
        buttonAction = _goToNextQuestion;
        buttonIcon = LucideIcons.arrowRight;
        buttonLabel = 'Sonraki Soru';
      } else if (!_isAnswered) {
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
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.customTitle ?? '${question.lesson} Testi'),
        actions: [
          _QuizModeBadge(mode: _effectiveMode, onToggle: _toggleQuizMode),
          if (widget.examDuration != null)
            _ExamTimerBadge(remainingSeconds: _remainingSeconds),
          IconButton(
            icon: const Icon(LucideIcons.flag, size: 20),
            tooltip: 'Hatalı Soru Bildir',
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                backgroundColor: Theme.of(context).colorScheme.surface,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (ctx) => Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(ctx).viewInsets.bottom,
                  ),
                  child: ReportQuestionBottomSheet(
                    question: _currentQuestion,
                    testTitle:
                        widget.customTitle ??
                        '${_currentQuestion.lesson} Testi',
                  ),
                ),
              );
            },
          ),
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
              onTap: (_isExamMode || !_isAnswered)
                  ? () => _onOptionTap(i)
                  : null,
            ),
          const SizedBox(height: 16),

          // Çözüm Açıklaması Kartı (Yalnızca Öğrenme modunda ve cevaplandıysa gösterilir)
          if (!_isExamMode && _isAnswered) ...[
            _ExplanationCard(
              explanation: question.explanation,
              distractorTrap: question.distractorTrap,
            ),
            const SizedBox(height: 16),
          ],

          // Zarif Yanlış Defteri Bilgilendirme Kartı (Tek seferlik / kapatılabilir, yalnızca Öğrenme modunda)
          if (!_isExamMode &&
              _showMistakeNotice &&
              !_hasDismissedMistakeNotice) ...[
            _MistakeNoticeCard(
              onDismiss: () {
                setState(() {
                  _showMistakeNotice = false;
                  _hasDismissedMistakeNotice = true;
                });
              },
            ),
            const SizedBox(height: 16),
          ],

          // Aksiyon Butonları (Önceki Soru + Birincil Buton)
          if (_currentIndex > 0)
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: OutlinedButton.icon(
                    onPressed: _previousQuestion,
                    icon: const Icon(LucideIcons.arrowLeft, size: 18),
                    label: const Text('Önceki Soru'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 3,
                  child: FilledButton.icon(
                    onPressed: buttonAction,
                    icon: Icon(buttonIcon),
                    label: Text(buttonLabel),
                  ),
                ),
              ],
            )
          else
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

/// Kullanıcı ilk yanlışını yaptığında çıkan tek seferlik zarif Koç bilgilendirme kartı.
class _MistakeNoticeCard extends StatelessWidget {
  final VoidCallback onDismiss;

  const _MistakeNoticeCard({required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TactileCard(
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.primary.withAlpha(120),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(
              LucideIcons.bookmarkCheck,
              size: 20,
              color: colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Yanlış Defterine Eklendi',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'Bu soru Ana Sayfa > Yanlış Defteri\'ne eklendi. Eksiklerini kapatmak için dilediğin zaman oradan tekrar çözebilirsin.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(LucideIcons.x, size: 18),
            color: colorScheme.onSurfaceVariant,
            tooltip: 'Kapat',
            onPressed: onDismiss,
          ),
        ],
      ),
    );
  }
}

/// Soru cevaplandıktan sonra gösterilen çözüm açıklaması kartı.
class _ExplanationCard extends StatelessWidget {
  final String explanation;
  final String? distractorTrap;

  const _ExplanationCard({required this.explanation, this.distractorTrap});

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
          if (distractorTrap != null && distractorTrap!.isNotEmpty) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.tertiaryContainer.withAlpha(90),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: colorScheme.tertiary.withAlpha(150),
                  width: 1.2,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        LucideIcons.triangleAlert,
                        size: 16,
                        color: colorScheme.onTertiaryContainer,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'ÖSYM ÇELDİRİCİ TUZAĞI',
                        style: theme.textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onTertiaryContainer,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    distractorTrap!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onTertiaryContainer,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
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

/// Soru ekranında o anki çalışma modunu gösteren ve tek tıkla Öğrenme/Sınav modu
/// arasında geçiş sağlayan interaktif AppBar rozeti (TASK-48).
class _QuizModeBadge extends StatelessWidget {
  final QuizMode? mode;
  final VoidCallback onToggle;

  const _QuizModeBadge({this.mode, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final effectiveMode = mode ?? QuizMode.learning;
    final isExam = effectiveMode == QuizMode.exam;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      child: Material(
        color: isExam
            ? colorScheme.secondaryContainer
            : colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onToggle,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isExam ? LucideIcons.fileText : LucideIcons.lightbulb,
                  size: 14,
                  color: isExam
                      ? colorScheme.onSecondaryContainer
                      : colorScheme.onPrimaryContainer,
                ),
                const SizedBox(width: 5),
                Text(
                  isExam ? 'Sınav' : 'Öğrenme',
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: isExam
                        ? colorScheme.onSecondaryContainer
                        : colorScheme.onPrimaryContainer,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
