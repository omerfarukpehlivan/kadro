import 'package:kadro/shared/widgets/kadro_badge.dart';
import 'package:kadro/features/reports/presentation/report_question_bottom_sheet.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/config/supabase_config.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/exams/data/models/mock_exam_blueprint.dart';
import 'package:kadro/features/lessons/data/curriculum_registry.dart';
import 'package:kadro/features/mistakes/data/mistake_repository.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/profile/presentation/paywall_screen.dart';
import 'package:kadro/features/quiz/data/models/question.dart';
import 'package:kadro/features/quiz/data/models/quiz_mode.dart';
import 'package:kadro/features/quiz/data/models/quiz_result.dart';
import 'package:kadro/features/quiz/data/question_repository.dart';
import 'package:kadro/features/quiz/presentation/quiz_result_screen.dart';
import 'package:kadro/features/quiz/presentation/widgets/option_tile.dart';
import 'package:kadro/features/stats/data/models/quiz_session_record.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/adaptive_overlay.dart';
import 'package:kadro/shared/widgets/climate_chart/climate_chart_card.dart';
import 'package:kadro/shared/widgets/geo_diagram/geo_diagram_card.dart';
import 'package:kadro/shared/widgets/population_pyramid/population_pyramid_card.dart';
import 'package:kadro/shared/widgets/sun_diagram/sun_diagram_card.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:kadro/shared/widgets/turkey_map/turkey_map.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
  final bool onlyDistractorTraps;
  final int? mockExamNumber;
  final int? topicTestNumber;
  final QuizMode? mode;
  final int? limit;
  final VoidCallback? onCompleted;

  /// Çoklu ders/bölüm deneme şablonu (`TASK-130`). Sağlandığında süre, kapsam ve
  /// soru gezinti paleti sekmeleri şablondan dinamik olarak çözümlenir.
  final MockExamBlueprint? blueprint;
  final ExamSelection? examSelection;
  final bool? applyExtraTime;
  final bool isBranchMock;
  final List<BlueprintSectionRange>? prebuiltSectionRanges;
  final String? taskId;

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
    this.onlyDistractorTraps = false,
    this.mockExamNumber,
    this.topicTestNumber,
    this.mode,
    this.limit,
    this.onCompleted,
    this.blueprint,
    this.examSelection,
    this.applyExtraTime,
    this.isBranchMock = false,
    this.prebuiltSectionRanges,
    this.taskId,
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
  Duration? _effectiveExamDuration;
  int _extraTimeMinutes = 0;
  List<BlueprintSectionRange> _sectionRanges = const [];

  // İki yönlü soru gezintisi (1..N) için soru durumu hafızası
  final Map<int, int?> _userAnswers = {};
  final Map<int, bool> _answeredStatus = {};
  final Map<int, Set<int>> _eliminatedOptions = {};
  final Set<int> _flaggedQuestions = {};
  int _maxReachedIndex = 0;

  // Yanlış Defteri bilgilendirme kartının tek seferlik gösterim durumu
  bool _hasDismissedMistakeNotice = false;
  bool _showMistakeNotice = false;

  QuizMode? _runtimeMode;

  ExamSelection _activeExamSelection() {
    if (widget.examSelection != null) return widget.examSelection!;
    try {
      return ref.read(activeExamSelectionProvider);
    } catch (_) {
      return ExamSelection.initial;
    }
  }

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
              ? 'Sınav Modu devrede: Şıklar gizli, optik form mantığı aktif.'
              : 'Öğrenme Modu devrede: Anında doğru/yanlış ve çözüm açıklaması aktif.',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Question get _currentQuestion => _questions[_currentIndex];
  bool get _isLastQuestion => _currentIndex == _questions.length - 1;

  List<BlueprintSectionRange> _deriveLessonRanges(List<Question> questions) {
    if (questions.isEmpty) return const [];
    final ranges = <BlueprintSectionRange>[];
    var start = 0;
    var currentLesson = questions.first.lesson;
    for (var i = 1; i <= questions.length; i++) {
      final isEnd =
          i == questions.length || questions[i].lesson != currentLesson;
      if (isEnd) {
        final spec = ExamSectionSpec(
          id: 'section_${ranges.length}',
          lesson: currentLesson,
          title: currentLesson == 'Güncel Bilgiler'
              ? 'Güncel'
              : currentLesson == 'Matematik & Geometri'
              ? 'Matematik'
              : currentLesson,
          questionCount: i - start,
        );
        ranges.add(
          BlueprintSectionRange(section: spec, startIndex: start, endIndex: i),
        );
        if (i < questions.length) {
          start = i;
          currentLesson = questions[i].lesson;
        }
      }
    }
    return ranges;
  }

  @override
  void initState() {
    super.initState();
    final selection = _activeExamSelection();

    if (widget.blueprint != null) {
      _extraTimeMinutes = widget.blueprint!.extraMinutesFor(
        selection,
        applyExtraTime: widget.applyExtraTime,
      );
      _effectiveExamDuration =
          widget.examDuration ??
          widget.blueprint!.resolveDuration(
            selection,
            applyExtraTime: widget.applyExtraTime,
          );
    } else if (widget.examDuration != null) {
      final extraEnabled = widget.applyExtraTime ?? selection.includeExtraTime;
      final extra = extraEnabled && selection.family == KpssExamFamily.ekpss
          ? (selection.disabilityGroup.standardExtraMinutes > 0
                ? selection.disabilityGroup.standardExtraMinutes
                : 20)
          : 0;
      _extraTimeMinutes = extra;
      _effectiveExamDuration = extra > 0
          ? widget.examDuration! + Duration(minutes: extra)
          : widget.examDuration!;
    }

    if (widget.questions != null && widget.questions!.isNotEmpty) {
      _questions = widget.limit != null
          ? widget.questions!.take(widget.limit!).toList()
          : widget.questions!;
      _sectionRanges =
          widget.prebuiltSectionRanges ?? _deriveLessonRanges(_questions);
    } else {
      _questions = widget.limit != null
          ? defaultSampleQuestions.take(widget.limit!).toList()
          : defaultSampleQuestions;
      _sectionRanges = _deriveLessonRanges(_questions);
      if (widget.blueprint != null) {
        _isLoading = !SupabaseConfig.isFlutterTest;
        _fetchBlueprintMockExam();
      } else if (widget.mockExamNumber != null) {
        _isLoading = !SupabaseConfig.isFlutterTest;
        _fetchMockExam();
      } else if (widget.onlyDistractorTraps ||
          widget.fetchAllFromPool ||
          widget.lessonFilter != null ||
          widget.topicFilter != null) {
        _isLoading = !SupabaseConfig.isFlutterTest;
        _fetchFilteredQuestions();
      }
    }

    if (_effectiveExamDuration != null) {
      _remainingSeconds = _effectiveExamDuration!.inSeconds;
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

  Future<void> _fetchBlueprintMockExam() async {
    final blueprint = widget.blueprint;
    if (blueprint == null) return;
    final generated = await widget.questionRepository
        .generateMockExamFromBlueprint(
          blueprint,
          selection: _activeExamSelection(),
          mockNumber: widget.mockExamNumber,
        );
    if (!mounted) return;
    setState(() {
      if (generated.questions.isNotEmpty) {
        _questions = widget.limit != null
            ? generated.questions.take(widget.limit!).toList()
            : generated.questions;
        _sectionRanges = generated.sectionRanges.isNotEmpty
            ? generated.sectionRanges
            : _deriveLessonRanges(_questions);
      }
      _isLoading = false;
    });
  }

  Future<void> _fetchMockExam() async {
    final fetched = await widget.questionRepository
        .generateGeneralCultureMockExam(examNumber: widget.mockExamNumber ?? 1);
    if (!mounted) return;
    setState(() {
      if (fetched.isNotEmpty) {
        _questions = widget.limit != null
            ? fetched.take(widget.limit!).toList()
            : fetched;
        _sectionRanges = _deriveLessonRanges(_questions);
      }
      _isLoading = false;
    });
  }

  Future<void> _fetchFilteredQuestions() async {
    final selection = _activeExamSelection();
    final variant = QuestionRepository.preferredSourceVariantFor(selection);
    final fetched = widget.onlyDistractorTraps
        ? await widget.questionRepository.fetchDistractorHuntQuestions(
            lesson: widget.lessonFilter,
            limit: widget.limit ?? 10,
          )
        : await widget.questionRepository.fetchQuestions(
            lesson: widget.lessonFilter,
            topic: widget.topicFilter,
            selection: selection,
            preferredSourceVariant: variant,
            limit: widget.topicTestNumber != null ? 500 : 60,
          );
    if (!mounted) return;
    setState(() {
      if (fetched.isNotEmpty) {
        if (widget.topicTestNumber != null) {
          final chunks = QuestionRepository.chunkTopicQuestions(fetched);
          if (chunks.isNotEmpty) {
            final safeIdx = (widget.topicTestNumber! - 1).clamp(
              0,
              chunks.length - 1,
            );
            _questions = chunks[safeIdx];
          }
        } else {
          _questions = widget.limit != null
              ? fetched.take(widget.limit!).toList()
              : fetched;
        }
        _sectionRanges = _deriveLessonRanges(_questions);
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
    // Öğrenme modunda onaylanan soru kilitlenir; sınav modunda geri dönülüp şık değiştirilebilir veya boş bırakılabilir
    if (!_isExamMode && _isAnswered) return;

    setState(() {
      _eliminatedOptions[_currentIndex]?.remove(index);
      if (_isExamMode && _selectedOptionIndex == index) {
        // Tekrar basıldığında seçimi temizle (boş bırakma desteği)
        _selectedOptionIndex = null;
        _userAnswers.remove(_currentIndex);
        _answeredStatus[_currentIndex] = false;
      } else {
        _selectedOptionIndex = index;
        _userAnswers[_currentIndex] = index;
        _answeredStatus[_currentIndex] = true;
      }
    });
  }

  void _toggleEliminateOption(int index) {
    if (!_isExamMode && _isAnswered) return;
    if (index < 0 || index >= _currentQuestion.options.length) return;
    setState(() {
      final current = _eliminatedOptions.putIfAbsent(_currentIndex, () => {});
      if (current.contains(index)) {
        current.remove(index);
      } else {
        current.add(index);
        if (_selectedOptionIndex == index) {
          _selectedOptionIndex = null;
          _userAnswers.remove(_currentIndex);
          _answeredStatus[_currentIndex] = false;
        }
      }
    });
  }

  void _toggleFlagQuestion() {
    setState(() {
      if (_flaggedQuestions.contains(_currentIndex)) {
        _flaggedQuestions.remove(_currentIndex);
      } else {
        _flaggedQuestions.add(_currentIndex);
      }
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
            examScope: _activeExamSelection().scopeKey,
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
        widget.mistakeRepository.recordReviewOutcome(
          _currentQuestion.id,
          isCorrect: true,
          examScope: _activeExamSelection().scopeKey,
        );
      } else {
        _wrongCount++;
        widget.mistakeRepository.addMistake(
          _currentQuestion,
          examScope: _activeExamSelection().scopeKey,
        );
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
    final maxAllowed = _isExamMode ? _questions.length - 1 : _maxReachedIndex;
    if (_currentIndex >= maxAllowed) return;
    setState(() {
      _currentIndex++;
      _selectedOptionIndex = _userAnswers[_currentIndex];
      _isAnswered = _answeredStatus[_currentIndex] ?? false;
      _showMistakeNotice = false;
    });
  }

  void _goToQuestion(int index) {
    if (index < 0 || index >= _questions.length) return;
    setState(() {
      _currentIndex = index;
      if (_currentIndex > _maxReachedIndex) {
        _maxReachedIndex = _currentIndex;
      }
      _selectedOptionIndex = _userAnswers[_currentIndex];
      _isAnswered = _answeredStatus[_currentIndex] ?? false;
      _showMistakeNotice = false;
    });
  }

  void _showQuestionPaletteBottomSheet() {
    final ranges = _sectionRanges.isNotEmpty
        ? _sectionRanges
        : _deriveLessonRanges(_questions);

    AdaptiveOverlay.showModal<void>(
      context: context,
      title: 'Soru Gezinti Paleti',
      dialogMaxWidth: 560,
      builder: (ctx) {
        final maxH = ResponsiveBreakpoints.usesDialogOverlay(ctx)
            ? 460.0
            : MediaQuery.sizeOf(ctx).height * 0.62;
        return SizedBox(
          height: maxH,
          child: _QuizQuestionPaletteContent(
            questions: _questions,
            ranges: ranges,
            currentIndex: _currentIndex,
            userAnswers: _userAnswers,
            flaggedQuestions: _flaggedQuestions,
            showHeaderTitle: true,
            onSelectQuestion: (idx) {
              Navigator.pop(ctx);
              _goToQuestion(idx);
            },
            onFinishQuiz: () {
              Navigator.pop(ctx);
              _finishQuiz();
            },
          ),
        );
      },
    );
  }

  /// Geliştirme ve UX testleri sürecinde günlük 30 soru limiti kapısını
  /// geçici olarak devre dışı bırakan bayrak (Feature Flag).
  /// Canlıya çıkarken `false` yapıldığında limit kontrolü tekrar devreye girer.
  static const bool _bypassDailyQuestionLimit = true;

  void _nextQuestion() {
    if (!_bypassDailyQuestionLimit) {
      try {
        final prefs = ref.read(userPreferencesProvider);
        final stats = ref.read(studyStatsProvider);
        if (!prefs.isPro &&
            stats.effectiveDailySolvedCount() >=
                prefs.effectiveDailyFreeLimit()) {
          Navigator.of(
            context,
            rootNavigator: true,
          ).push(MaterialPageRoute(builder: (_) => const PaywallScreen()));
          return;
        }
      } catch (_) {
        // ProviderScope bulunmayan izole test ortamlarında güvenli fallback
      }
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
            widget.mistakeRepository.recordReviewOutcome(
              q.id,
              isCorrect: true,
              examScope: _activeExamSelection().scopeKey,
            );
          } else {
            _wrongCount++;
            widget.mistakeRepository.addMistake(
              q,
              examScope: _activeExamSelection().scopeKey,
            );
          }
          try {
            ref
                .read(studyStatsProvider.notifier)
                .recordAnswer(
                  lesson: q.lesson,
                  topic: q.topic,
                  questionText: q.text,
                  isCorrect: isCorrect,
                  examScope: _activeExamSelection().scopeKey,
                );
          } catch (_) {}
        }
      }
    }

    // Ders ve konu bazında net ve performans dökümünü hesapla
    final lessonGrouped = <String, List<int>>{};
    final topicGrouped =
        <String, ({String lesson, String topic, int c, int w, int e})>{};
    for (var i = 0; i < _questions.length; i++) {
      final q = _questions[i];
      lessonGrouped.putIfAbsent(q.lesson, () => [0, 0, 0]);
      final topicKey = '${q.lesson}::${q.topic}';
      final prevTopic =
          topicGrouped[topicKey] ??
          (lesson: q.lesson, topic: q.topic, c: 0, w: 0, e: 0);
      final ans = _userAnswers[i];
      if (ans == null) {
        lessonGrouped[q.lesson]![2]++;
        topicGrouped[topicKey] = (
          lesson: q.lesson,
          topic: q.topic,
          c: prevTopic.c,
          w: prevTopic.w,
          e: prevTopic.e + 1,
        );
      } else if (q.isCorrect(ans)) {
        lessonGrouped[q.lesson]![0]++;
        topicGrouped[topicKey] = (
          lesson: q.lesson,
          topic: q.topic,
          c: prevTopic.c + 1,
          w: prevTopic.w,
          e: prevTopic.e,
        );
      } else {
        lessonGrouped[q.lesson]![1]++;
        topicGrouped[topicKey] = (
          lesson: q.lesson,
          topic: q.topic,
          c: prevTopic.c,
          w: prevTopic.w + 1,
          e: prevTopic.e,
        );
      }
    }

    final lessonBreakdown = <String, LessonResult>{};
    lessonGrouped.forEach((lesson, stats) {
      final c = stats[0];
      final w = stats[1];
      final e = stats[2];
      lessonBreakdown[lesson] = LessonResult(
        lesson: lesson,
        totalQuestions: c + w + e,
        correctCount: c,
        wrongCount: w,
        emptyCount: e,
      );
    });

    final topicBreakdown = <String, TopicResult>{};
    topicGrouped.forEach((topicKey, entry) {
      topicBreakdown[topicKey] = TopicResult(
        topic: entry.topic,
        lesson: entry.lesson,
        totalQuestions: entry.c + entry.w + entry.e,
        correctCount: entry.c,
        wrongCount: entry.w,
        emptyCount: entry.e,
      );
    });

    final emptyCount = _questions.length - (_correctCount + _wrongCount);
    final result = QuizResult(
      totalQuestions: _questions.length,
      correctCount: _correctCount,
      wrongCount: _wrongCount,
      emptyCount: emptyCount,
      lessonBreakdown: lessonBreakdown,
      topicBreakdown: (topicBreakdown.length > 1 || widget.isBranchMock)
          ? topicBreakdown
          : null,
    );

    final activeSelection = _activeExamSelection();
    try {
      final scopeKey = widget.blueprint?.scopeKey ?? activeSelection.scopeKey;
      final effectiveDuration = _effectiveExamDuration;
      final sessionRecord = QuizSessionRecord(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        title:
            widget.customTitle ??
            widget.blueprint?.title ??
            '${_currentQuestion.lesson} Testi',
        lesson: _currentQuestion.lesson,
        examScope: scopeKey,
        totalQuestions: _questions.length,
        correctCount: _correctCount,
        wrongCount: _wrongCount,
        emptyCount: emptyCount,
        netScore: result.net,
        earnedXp: _correctCount * 15 + _wrongCount * 5,
        durationSeconds: effectiveDuration != null
            ? (effectiveDuration.inSeconds - _remainingSeconds).clamp(
                0,
                effectiveDuration.inSeconds,
              )
            : _questions.length * 20,
        completedAt: DateTime.now(),
      );
      ref.read(studyStatsProvider.notifier).recordQuizSession(sessionRecord);
      ref
          .read(studyPlannerProvider.notifier)
          .markMatchingTestCompleted(
            lesson: widget.lessonFilter ?? _currentQuestion.lesson,
            topic: widget.topicFilter,
            testNumber: widget.topicTestNumber,
            mockExamNumber:
                widget.mockExamNumber ?? widget.blueprint?.mockNumber,
            isBranchMock: widget.isBranchMock,
          );
    } catch (_) {
      // ProviderScope bulunmayan izole test ortamlarında güvenli fallback
    }

    try {
      widget.onCompleted?.call();
    } catch (_) {}

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => QuizResultScreen(
          result: result,
          examSelection: activeSelection,
          testTitle:
              widget.customTitle ??
              (widget.lessonFilter != null
                  ? '${widget.lessonFilter} Testi'
                  : 'Genel Kültür Testi'),
          taskId: widget.taskId,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Text(
            widget.customTitle ?? 'Test',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    const labels = ['A', 'B', 'C', 'D', 'E'];
    final question = _currentQuestion;
    final highReadabilityMode = ref.watch(
      userPreferencesProvider.select((s) => s.highReadabilityMode),
    );
    final baseMediaQuery = MediaQuery.of(context);
    final baseScale = baseMediaQuery.textScaler.scale(10) / 10.0;
    final readableMediaQuery = highReadabilityMode
        ? baseMediaQuery.copyWith(
            textScaler: TextScaler.linear(baseScale * 1.2),
          )
        : baseMediaQuery;

    // Alt butonun fonksiyonu, ikonu ve metnini duruma ve çalışma moduna göre belirliyoruz
    final isAtHistory = _currentIndex < _maxReachedIndex;
    final VoidCallback? buttonAction;
    final IconData buttonIcon;
    final String buttonLabel;

    if (_isExamMode) {
      if (isAtHistory) {
        buttonAction = _goToNextQuestion;
        buttonIcon = PhosphorIconsBold.arrowRight;
        buttonLabel = 'Sonraki Soru';
      } else if (!_isLastQuestion) {
        buttonAction = _nextQuestion;
        buttonIcon = PhosphorIconsBold.arrowRight;
        buttonLabel = 'Sonraki Soru';
      } else {
        buttonAction = _finishQuiz;
        buttonIcon = PhosphorIconsFill.trophy;
        buttonLabel = 'Testi Bitir ve Sonucu Gör';
      }
    } else {
      if (isAtHistory) {
        buttonAction = _goToNextQuestion;
        buttonIcon = PhosphorIconsBold.arrowRight;
        buttonLabel = 'Sonraki Soru';
      } else if (!_isAnswered) {
        buttonAction = _selectedOptionIndex != null ? _submitAnswer : null;
        buttonIcon = PhosphorIconsFill.checkCircle;
        buttonLabel = 'Cevabı Onayla';
      } else if (!_isLastQuestion) {
        buttonAction = _nextQuestion;
        buttonIcon = PhosphorIconsBold.arrowRight;
        buttonLabel = 'Sonraki Soru';
      } else {
        buttonAction = _finishQuiz;
        buttonIcon = PhosphorIconsFill.trophy;
        buttonLabel = 'Testi Bitir ve Sonucu Gör';
      }
    }

    final isLargeTablet = ResponsiveBreakpoints.isLargeTablet(context);
    final isWideViewport = ResponsiveBreakpoints.usesDialogOverlay(context);
    final isFlagged = _flaggedQuestions.contains(_currentIndex);
    final eliminatedSet = _eliminatedOptions[_currentIndex] ?? const <int>{};

    final Widget? visualAidCard;
    if (question.effectiveMapConfig != null) {
      visualAidCard = TurkeyMapCard(config: question.effectiveMapConfig!);
    } else if (question.effectiveClimateConfig != null) {
      visualAidCard = ClimateChartCard(
        config: question.effectiveClimateConfig!,
      );
    } else if (question.effectiveGeoConfig != null) {
      visualAidCard = GeoDiagramCard(config: question.effectiveGeoConfig!);
    } else if (question.effectivePyramidConfig != null) {
      visualAidCard = PopulationPyramidCard(
        config: question.effectivePyramidConfig!,
      );
    } else if (question.effectiveSunConfig != null) {
      visualAidCard = SunDiagramCard(config: question.effectiveSunConfig!);
    } else if (question.imageUrl != null && question.imageUrl!.isNotEmpty) {
      visualAidCard = _QuestionImageCard(imageUrl: question.imageUrl!);
    } else {
      visualAidCard = null;
    }

    final questionAndOptionsColumn = MediaQuery(
      data: readableMediaQuery,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _QuestionCard(
            text: question.text,
            highContrast: highReadabilityMode,
            isCompactDesktop: isWideViewport,
          ),
          if (isWideViewport) const SizedBox(height: 10) else AppSpacing.gapMd,
          for (var i = 0; i < question.options.length; i++)
            OptionTile(
              label: labels[i],
              text: question.options[i],
              status: _getOptionStatus(i),
              highContrast: highReadabilityMode,
              isEliminated: eliminatedSet.contains(i),
              onToggleEliminate: (_isExamMode || !_isAnswered)
                  ? () => _toggleEliminateOption(i)
                  : null,
              onTap: (_isExamMode || !_isAnswered)
                  ? () => _onOptionTap(i)
                  : null,
            ),
        ],
      ),
    );

    final actionButtons = _currentIndex > 0
        ? Row(
            children: [
              Expanded(
                flex: 2,
                child: OutlinedButton.icon(
                  onPressed: _previousQuestion,
                  icon: const PhosphorIcon(
                    PhosphorIconsBold.arrowLeft,
                    size: 18,
                  ),
                  label: const Text('Önceki Soru'),
                ),
              ),
              AppSpacing.gapHorizontalSm,
              Expanded(
                flex: 3,
                child: FilledButton.icon(
                  onPressed: buttonAction,
                  icon: PhosphorIcon(buttonIcon),
                  label: Text(buttonLabel),
                ),
              ),
            ],
          )
        : FilledButton.icon(
            onPressed: buttonAction,
            icon: PhosphorIcon(buttonIcon),
            label: Text(buttonLabel),
          );

    final hasSideVisualAid = isLargeTablet && visualAidCard != null;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          widget.customTitle ?? '${question.lesson} Testi',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        actions: [
          _QuizModeBadge(mode: _effectiveMode, onToggle: _toggleQuizMode),
          if (_effectiveExamDuration != null)
            _ExamTimerBadge(
              remainingSeconds: _remainingSeconds,
              extraMinutes: _extraTimeMinutes,
            ),
          IconButton(
            icon: const PhosphorIcon(PhosphorIconsBold.squaresFour, size: 20),
            tooltip: 'Soru Gezinti Paleti',
            onPressed: _showQuestionPaletteBottomSheet,
          ),
          IconButton(
            icon: const PhosphorIcon(PhosphorIconsBold.flag, size: 20),
            tooltip: 'Hatalı Soru Bildir',
            onPressed: () {
              AdaptiveOverlay.showModal<void>(
                context: context,
                title: 'Hatalı Soru Bildir',
                headerIcon: PhosphorIconsRegular.flag,
                headerIconColor: Theme.of(context).colorScheme.error,
                showMobileHeader: true,
                dialogMaxWidth: 520,
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
      body: ResponsiveContentWrapper(
        maxWidth: hasSideVisualAid ? 1140 : (isWideViewport ? 920 : 720),
        padding: EdgeInsets.zero,
        child: Scrollbar(
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: isWideViewport
                  ? 24
                  : ResponsiveBreakpoints.horizontalPadding(context),
              vertical: isWideViewport ? 10 : 12,
            ),
            children: [
              // Konu Başlığı ve Soru Sayacı (Meta Bar)
              _QuestionMetaBar(
                topic: question.topic,
                questionNumber: _currentIndex + 1,
                totalQuestions: _questions.length,
                isFlagged: isFlagged,
                onToggleFlag: _toggleFlagQuestion,
                onOpenPalette: _showQuestionPaletteBottomSheet,
              ),
              AppSpacing.gapXs,

              // İlerleme Çubuğu (Progress Indicator)
              LinearProgressIndicator(
                value: (_currentIndex + 1) / _questions.length,
              ),
              if (isWideViewport) AppSpacing.gapSm else AppSpacing.gapMd,

              if (hasSideVisualAid)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 42, child: visualAidCard),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 58,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          questionAndOptionsColumn,
                          AppSpacing.gapSm,
                          actionButtons,
                        ],
                      ),
                    ),
                  ],
                )
              else ...[
                if (visualAidCard != null) ...[visualAidCard, AppSpacing.gapMd],

                // Soru Metni Kartı + Şıklar (Yüksek Okunabilirlik aktifse ~1.2x ölçek + 2px çerçeve)
                questionAndOptionsColumn,
                if (isWideViewport) AppSpacing.gapSm else AppSpacing.gapMd,

                // Aksiyon Butonları (Önceki Soru + Birincil Buton)
                actionButtons,
              ],

              if (!_isExamMode && _isAnswered) ...[
                AppSpacing.gapMd,
                _ExplanationCard(
                  explanation: question.explanation,
                  distractorTrap: question.distractorTrap,
                ),
              ],

              // Zarif Yanlış Defteri Bilgilendirme Kartı (Tek seferlik / kapatılabilir, yalnızca Öğrenme modunda)
              if (!_isExamMode &&
                  _showMistakeNotice &&
                  !_hasDismissedMistakeNotice) ...[
                AppSpacing.gapMd,
                _MistakeNoticeCard(
                  onDismiss: () {
                    setState(() {
                      _showMistakeNotice = false;
                      _hasDismissedMistakeNotice = true;
                    });
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Sorunun ait olduğu konuyu, bayrak durumunu ve testteki sırasını gösteren meta bilgi çubuğu.
class _QuestionMetaBar extends StatelessWidget {
  final String topic;
  final int questionNumber;
  final int totalQuestions;
  final bool isFlagged;
  final VoidCallback? onToggleFlag;
  final VoidCallback? onOpenPalette;

  const _QuestionMetaBar({
    required this.topic,
    required this.questionNumber,
    required this.totalQuestions,
    this.isFlagged = false,
    this.onToggleFlag,
    this.onOpenPalette,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: KadroBadge(label: topic, tone: KadroBadgeTone.secondary),
        ),
        const SizedBox(width: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (onToggleFlag != null)
              Semantics(
                button: true,
                toggled: isFlagged,
                label: isFlagged
                    ? 'Sorunun işaretini kaldır'
                    : 'Soruyu tekrar için işaretle',
                child: Tooltip(
                  message: isFlagged
                      ? 'İşareti Kaldır'
                      : 'Tekrar İçin İşaretle',
                  child: InkWell(
                    onTap: onToggleFlag,
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: isFlagged
                            ? colorScheme.tertiaryContainer
                            : colorScheme.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isFlagged
                              ? colorScheme.tertiary
                              : colorScheme.outlineVariant,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PhosphorIcon(
                            isFlagged
                                ? PhosphorIconsFill.bookmarkSimple
                                : PhosphorIconsRegular.bookmarkSimple,
                            size: 14,
                            color: isFlagged
                                ? colorScheme.onTertiaryContainer
                                : colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            isFlagged ? 'İşaretli' : 'İşaretle',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: isFlagged
                                  ? colorScheme.onTertiaryContainer
                                  : colorScheme.onSurfaceVariant,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            Semantics(
              button: onOpenPalette != null,
              label:
                  'Soru $questionNumber / $totalQuestions. Soru gezinti paletini açmak için dokunun.',
              child: Tooltip(
                message: 'Soru Gezinti Paletini Aç',
                child: InkWell(
                  onTap: onOpenPalette,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: colorScheme.outlineVariant),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PhosphorIcon(
                          PhosphorIconsBold.squaresFour,
                          size: 14,
                          color: colorScheme.primary,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Soru $questionNumber / $totalQuestions',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                            fontFeatures: const [FontFeature.tabularFigures()],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Soru metnini gösteren kart bileşeni.
class _QuestionCard extends StatelessWidget {
  final String text;
  final bool highContrast;
  final bool isCompactDesktop;

  const _QuestionCard({
    required this.text,
    this.highContrast = false,
    this.isCompactDesktop = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TactileCard(
      backgroundColor: colorScheme.surface,
      borderColor: highContrast
          ? colorScheme.outline
          : colorScheme.outlineVariant,
      borderWidth: highContrast ? 2.0 : 1.5,
      padding: isCompactDesktop
          ? const EdgeInsets.symmetric(horizontal: 18, vertical: 12)
          : const EdgeInsets.all(16),
      child: SelectionArea(
        child: Text(
          text,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurface,
            height: highContrast ? 1.6 : 1.5,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

/// Soruda yer alan harita, şema veya grafik görselini gösteren ve
/// tıklandığında tam ekran pinch-to-zoom (yakınlaştırma) imkanı tanıyan kart bileşeni.
class _QuestionImageCard extends StatelessWidget {
  final String imageUrl;

  const _QuestionImageCard({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TactileCard(
      padding: EdgeInsets.zero,
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.outlineVariant,
      onTap: () => _showZoomableImageDialog(context, imageUrl),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: _buildImage(context, imageUrl),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: colorScheme.scrim.withAlpha(180),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PhosphorIcon(
                    PhosphorIconsRegular.magnifyingGlassPlus,
                    size: 14,
                    color: colorScheme.onPrimary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Büyüt',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context, String url) {
    if (url.startsWith('assets/')) {
      return Image.asset(
        url,
        fit: BoxFit.contain,
        errorBuilder: (ctx, error, stackTrace) => _buildErrorWidget(ctx),
      );
    }
    return Image.network(
      url,
      fit: BoxFit.contain,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const Center(child: CircularProgressIndicator(strokeWidth: 2));
      },
      errorBuilder: (ctx, error, stackTrace) => _buildErrorWidget(ctx),
    );
  }

  Widget _buildErrorWidget(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Container(
      color: colorScheme.surfaceContainerLow,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PhosphorIcon(
            PhosphorIconsRegular.imageBroken,
            size: 28,
            color: colorScheme.outline,
          ),
          const SizedBox(height: 6),
          Text(
            'Görsel yüklenemedi',
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  void _showZoomableImageDialog(BuildContext context, String url) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    showDialog<void>(
      context: context,
      barrierColor: colorScheme.scrim.withAlpha(220),
      builder: (dialogContext) {
        return Dialog(
          insetPadding: const EdgeInsets.all(12),
          backgroundColor: colorScheme.surface.withAlpha(0),
          child: Stack(
            children: [
              InteractiveViewer(
                minScale: 1.0,
                maxScale: 4.0,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: _buildImage(context, url),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton.filled(
                  style: IconButton.styleFrom(
                    backgroundColor: colorScheme.scrim.withAlpha(160),
                    foregroundColor: colorScheme.onPrimary,
                  ),
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  icon: const PhosphorIcon(PhosphorIconsRegular.x),
                ),
              ),
              Positioned(
                bottom: 12,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.scrim.withAlpha(160),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      ResponsiveBreakpoints.zoomHintText(
                        context,
                        includePan: true,
                      ),
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
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
            child: PhosphorIcon(
              PhosphorIconsFill.bookmarks,
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
            icon: const PhosphorIcon(PhosphorIconsBold.x, size: 18),
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
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.primary.withAlpha(110),
      lipColor: colorScheme.primary.withAlpha(150),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: PhosphorIcon(
                  PhosphorIconsFill.bookOpenText,
                  color: colorScheme.primary,
                  size: 16,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Çözüm Açıklaması',
                style: theme.textTheme.titleSmall?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SelectionArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  explanation,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface,
                    height: 1.48,
                  ),
                ),
                if (distractorTrap != null && distractorTrap!.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colorScheme.tertiaryContainer,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: colorScheme.tertiary.withAlpha(120),
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            PhosphorIcon(
                              PhosphorIconsBold.warningCircle,
                              size: 15,
                              color: colorScheme.onTertiaryContainer,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'ÖSYM ÇELDİRİCİ TUZAĞI',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.onTertiaryContainer,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          distractorTrap!,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onTertiaryContainer,
                            height: 1.42,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
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
  final int extraMinutes;

  const _ExamTimerBadge({
    required this.remainingSeconds,
    this.extraMinutes = 0,
  });

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
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: isCritical
                ? colorScheme.errorContainer
                : colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isCritical
                  ? colorScheme.error
                  : colorScheme.outlineVariant,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              PhosphorIcon(
                PhosphorIconsRegular.timer,
                size: 15,
                color: isCritical
                    ? colorScheme.error
                    : colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 6),
              Text(
                '$minutes:$seconds',
                style: theme.textTheme.labelMedium?.copyWith(
                  fontFeatures: const [FontFeature.tabularFigures()],
                  color: isCritical
                      ? colorScheme.onErrorContainer
                      : colorScheme.onSurfaceVariant,
                ),
              ),
              if (extraMinutes > 0) ...[
                const SizedBox(width: 4),
                Text(
                  '+$extraMinutes dk',
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: colorScheme.primary,
                  ),
                ),
              ],
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
                PhosphorIcon(
                  isExam
                      ? PhosphorIconsBold.fileText
                      : PhosphorIconsBold.lightbulb,
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

/// Optik form ve soru gezinti paleti; mobilde alt sayfa (bottom sheet), masaüstünde
/// merkezî dialog modalı olarak açılır (`TASK-149`).
class _QuizQuestionPaletteContent extends StatefulWidget {
  final List<Question> questions;
  final List<BlueprintSectionRange> ranges;
  final int currentIndex;
  final Map<int, int?> userAnswers;
  final Set<int> flaggedQuestions;
  final ValueChanged<int> onSelectQuestion;
  final VoidCallback onFinishQuiz;
  final bool showHeaderTitle;

  const _QuizQuestionPaletteContent({
    required this.questions,
    required this.ranges,
    required this.currentIndex,
    required this.userAnswers,
    required this.flaggedQuestions,
    required this.onSelectQuestion,
    required this.onFinishQuiz,
    this.showHeaderTitle = false,
  });

  @override
  State<_QuizQuestionPaletteContent> createState() =>
      _QuizQuestionPaletteContentState();
}

class _QuizQuestionPaletteContentState
    extends State<_QuizQuestionPaletteContent> {
  int? _selectedRangeIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final showSectionTabs =
        widget.ranges.length > 1 || widget.questions.length > 30;
    final answeredCount = widget.userAnswers.values
        .where((v) => v != null)
        .length;
    final emptyCount = widget.questions.length - answeredCount;
    final flaggedCount = widget.flaggedQuestions.length;
    const optionLetters = ['A', 'B', 'C', 'D', 'E'];

    final activeRange =
        _selectedRangeIndex != null &&
            _selectedRangeIndex! >= 0 &&
            _selectedRangeIndex! < widget.ranges.length
        ? widget.ranges[_selectedRangeIndex!]
        : null;
    final visibleStart = activeRange?.startIndex ?? 0;
    final visibleEnd = activeRange?.endIndex ?? widget.questions.length;
    final visibleCount = visibleEnd - visibleStart;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.showHeaderTitle)
                      Text(
                        'Optik Form & Soru Gezintisi',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    Text(
                      flaggedCount > 0
                          ? '$answeredCount Dolu · $emptyCount Boş · $flaggedCount İşaretli'
                          : '$answeredCount Dolu · $emptyCount Boş',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton.icon(
                onPressed: widget.onFinishQuiz,
                icon: const PhosphorIcon(
                  PhosphorIconsBold.checkCircle,
                  size: 16,
                ),
                label: const Text('Sınavı Bitir'),
              ),
            ],
          ),
        ),
        if (showSectionTabs && widget.ranges.isNotEmpty)
          SizedBox(
            height: 42,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: widget.ranges.length + 1,
              separatorBuilder: (_, _) => const SizedBox(width: 8),
              itemBuilder: (_, tabIdx) {
                if (tabIdx == 0) {
                  final isSelected = _selectedRangeIndex == null;
                  return ChoiceChip(
                    key: const ValueKey('palette_section_all'),
                    label: Text('Tümü (${widget.questions.length})'),
                    selected: isSelected,
                    onSelected: (_) {
                      setState(() => _selectedRangeIndex = null);
                    },
                  );
                }
                final rangeIdx = tabIdx - 1;
                final range = widget.ranges[rangeIdx];
                final isSelected = _selectedRangeIndex == rangeIdx;
                return ChoiceChip(
                  key: ValueKey('palette_section_${range.section.id}'),
                  label: Text(
                    '${range.section.title} (${range.startIndex + 1}-${range.endIndex})',
                  ),
                  selected: isSelected,
                  onSelected: (_) {
                    setState(() => _selectedRangeIndex = rangeIdx);
                  },
                );
              },
            ),
          ),
        const SizedBox(height: 4),
        const Divider(height: 1),
        Expanded(
          child: Scrollbar(
            child: GridView.builder(
              padding: const EdgeInsets.all(14),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1,
              ),
              itemCount: visibleCount,
              itemBuilder: (context, localIdx) {
                final idx = visibleStart + localIdx;
                final isCurrent = idx == widget.currentIndex;
                final isFlagged = widget.flaggedQuestions.contains(idx);
                final ansIndex = widget.userAnswers[idx];
                final isAnswered = ansIndex != null;
                final letter =
                    isAnswered &&
                        ansIndex >= 0 &&
                        ansIndex < optionLetters.length
                    ? optionLetters[ansIndex]
                    : '';

                return InkWell(
                  onTap: () => widget.onSelectQuestion(idx),
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: isCurrent
                              ? colorScheme.primaryContainer
                              : isAnswered
                              ? colorScheme.primary
                              : colorScheme.surfaceContainerLow,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isCurrent
                                ? colorScheme.primary
                                : isAnswered
                                ? colorScheme.primary
                                : isFlagged
                                ? colorScheme.tertiary
                                : colorScheme.outlineVariant,
                            width: isCurrent || isFlagged ? 1.5 : 1,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${idx + 1}',
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: isCurrent
                                    ? colorScheme.onPrimaryContainer
                                    : isAnswered
                                    ? colorScheme.onPrimary
                                    : colorScheme.onSurface,
                                fontFeatures: const [
                                  FontFeature.tabularFigures(),
                                ],
                              ),
                            ),
                            if (isAnswered)
                              Text(
                                letter,
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: colorScheme.onPrimary.withValues(
                                    alpha: 0.9,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (isFlagged)
                        Positioned(
                          top: 3,
                          right: 3,
                          child: Container(
                            width: 7,
                            height: 7,
                            decoration: BoxDecoration(
                              color: colorScheme.tertiary,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
