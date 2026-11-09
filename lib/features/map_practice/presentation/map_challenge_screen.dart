import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/map_practice/data/models/map_challenge.dart';
import 'package:kadro/shared/widgets/turkey_map/turkey_map.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// İnteraktif Harita Pratiği ve Soru Çözüm Ekranı
///
/// Angular/Web benzetmesi: Bu ekran, etkileşimli SVG haritası ile adayların
/// il, maden, tarım ve yer şekilleri sorularını harita üzerinde dokunarak
/// veya şıklardan seçerek çözdüğü `MapChallengeComponent` görünümüdür.
class MapChallengeScreen extends ConsumerStatefulWidget {
  final List<MapChallenge> challenges;
  final String sessionTitle;

  const MapChallengeScreen({
    super.key,
    required this.challenges,
    this.sessionTitle = 'Harita Atölyesi',
  });

  @override
  ConsumerState<MapChallengeScreen> createState() => _MapChallengeScreenState();
}

class _MapChallengeScreenState extends ConsumerState<MapChallengeScreen> {
  int _currentIndex = 0;
  int _score = 0;
  int _streak = 0;
  bool _hasAnswered = false;
  bool _isCorrect = false;
  String? _tappedProvinceId;
  int? _selectedOptionIndex;
  bool _showHint = false;

  MapChallenge get _current => widget.challenges[_currentIndex];

  void _onProvinceTapped(String provinceId) {
    if (_hasAnswered) return;
    if (_current.interactionType != MapInteractionType.tapProvince) return;

    final correct = _current.isProvinceCorrect(provinceId);
    setState(() {
      _hasAnswered = true;
      _tappedProvinceId = provinceId;
      _isCorrect = correct;
      if (correct) {
        _score += 10 + (_streak * 2);
        _streak++;
      } else {
        _streak = 0;
      }
    });
  }

  void _onOptionSelected(int index) {
    if (_hasAnswered) return;
    final correct = _current.isOptionCorrect(index);
    setState(() {
      _hasAnswered = true;
      _selectedOptionIndex = index;
      _isCorrect = correct;
      if (correct) {
        _score += 10 + (_streak * 2);
        _streak++;
      } else {
        _streak = 0;
      }
    });
  }

  void _nextChallenge() {
    if (_currentIndex < widget.challenges.length - 1) {
      setState(() {
        _currentIndex++;
        _hasAnswered = false;
        _isCorrect = false;
        _tappedProvinceId = null;
        _selectedOptionIndex = null;
        _showHint = false;
      });
    } else {
      _showCompletionDialog();
    }
  }

  void _showCompletionDialog() {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: isDark ? const Color(0xFF1E293B) : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              const Icon(
                LucideIcons.trophy,
                color: Color(0xFFD97706),
                size: 26,
              ),
              const SizedBox(width: 10),
              Text(
                'Antrenman Tamamlandı!',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Harita üzerinde görsel hafızanı güçlendirdin!',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: theme.colorScheme.primary.withValues(alpha: 0.2),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem('Soru', '${widget.challenges.length}'),
                    _buildStatItem('Kazanılan Puan', '+$_score XP'),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            FilledButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                Navigator.of(context).pop();
              },
              child: const Text('Antrenmanı Bitir'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatItem(String label, String value) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          value,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w800,
            color: theme.colorScheme.primary,
          ),
        ),
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    final challenge = _current;

    // Harita dinamik renklendirme konfigürasyonu
    final highlightedMap = <String, Color>{};

    if (!_hasAnswered) {
      // Cevaplanmadan önce: Soru tarafından tanımlanan vurgulu iller parlasın
      for (final pId in challenge.highlightedProvinceIds) {
        highlightedMap[pId] =
            challenge.highlightColor ?? const Color(0xFFD97706);
      }
    } else {
      // Cevaplandıktan sonra:
      if (challenge.interactionType == MapInteractionType.tapProvince) {
        if (_isCorrect) {
          // Doğru il yeşil
          highlightedMap[_tappedProvinceId!] = const Color(0xFF10B981);
        } else {
          // Yanlış dokunulan il kırmızı
          if (_tappedProvinceId != null) {
            highlightedMap[_tappedProvinceId!] = const Color(0xFFEF4444);
          }
          // Olması gereken doğru il parlasın (altın sarısı / yeşil)
          highlightedMap[challenge.targetProvinceId] = const Color(0xFF10B981);
          for (final v in challenge.validProvinceIds) {
            highlightedMap[v] = const Color(0xFF10B981);
          }
        }
      } else {
        // Çoktan seçmeli modda doğru hedef il yeşil parlasın
        highlightedMap[challenge.targetProvinceId] = const Color(0xFF10B981);
      }
    }

    final mapConfig = TurkeyMapConfig(
      highlightedProvinces: highlightedMap,
      markers: challenge.markers,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.sessionTitle),
        actions: [
          // Seri / Kombo Göstergesi
          if (_streak > 1)
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD97706).withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFD97706)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        LucideIcons.flame,
                        size: 14,
                        color: Color(0xFFD97706),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$_streak Seri',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFD97706),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
      body: ResponsiveContentWrapper(
        maxWidth: 720,
        child: Column(
          children: [
            // İlerleme Çubuğu
            LinearProgressIndicator(
              value: (_currentIndex + 1) / widget.challenges.length,
              backgroundColor: colorScheme.surfaceContainerHighest,
              color: colorScheme.primary,
              minHeight: 4,
            ),

            Expanded(
              child: ListView(
                padding: AppSpacing.pagePadding(context),
                children: [
                  // 1. Soru Başlığı ve Etiket Çubuğu
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
                          'Soru ${_currentIndex + 1}/${widget.challenges.length} • ${challenge.tag}',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ),
                      const Spacer(),
                      if (challenge.hint.isNotEmpty && !_hasAnswered)
                        TextButton.icon(
                          onPressed: () {
                            setState(() => _showHint = !_showHint);
                          },
                          icon: const Icon(LucideIcons.lightbulb, size: 14),
                          label: Text(
                            _showHint ? 'İpucunu Gizle' : 'İpucu',
                            style: const TextStyle(fontSize: 12),
                          ),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            minimumSize: Size.zero,
                          ),
                        ),
                    ],
                  ),

                  if (_showHint) ...[
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD97706).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xFFD97706).withValues(alpha: 0.3),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            LucideIcons.sparkles,
                            size: 16,
                            color: Color(0xFFD97706),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              challenge.hint,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: const Color(0xFFD97706),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ).animate().fadeIn(duration: 200.ms),
                  ],

                  const SizedBox(height: 12),

                  // 2. Soru Metni
                  Text(
                    challenge.questionText,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // 3. İnteraktif Türkiye Haritası Kartı
                  Container(
                    decoration: BoxDecoration(
                      color: isDark
                          ? const Color(0xFF1E293B)
                          : const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: theme.colorScheme.outlineVariant.withValues(
                          alpha: 0.5,
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (challenge.interactionType ==
                            MapInteractionType.tapProvince)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  LucideIcons.hand,
                                  size: 13,
                                  color: Color(0xFF2563EB),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  'Cevaplamak için haritadaki ile dokunun',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: isDark
                                        ? const Color(0xFF94A3B8)
                                        : const Color(0xFF475569),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        // Türkiye Vektör Haritası
                        TurkeyMap(
                          config: mapConfig,
                          onProvinceTap: _onProvinceTapped,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // 4. Çoktan Seçmeli Seçenekler (Eğer varsa)
                  if (challenge.interactionType ==
                          MapInteractionType.identifyHighlighted &&
                      challenge.options.isNotEmpty) ...[
                    Column(
                      children: List.generate(challenge.options.length, (idx) {
                        final optionText = challenge.options[idx];
                        final isSelected = _selectedOptionIndex == idx;
                        final isCorrectOption =
                            idx == challenge.correctOptionIndex;

                        Color? btnBg;
                        Color? btnBorder;
                        Color? textColor;

                        if (_hasAnswered) {
                          if (isCorrectOption) {
                            btnBg = const Color(0xFF10B981)
                                .withValues(alpha: 0.15);
                            btnBorder = const Color(0xFF10B981);
                            textColor = const Color(0xFF10B981);
                          } else if (isSelected) {
                            btnBg = const Color(0xFFEF4444)
                                .withValues(alpha: 0.15);
                            btnBorder = const Color(0xFFEF4444);
                            textColor = const Color(0xFFEF4444);
                          }
                        }

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: InkWell(
                            onTap: () => _onOptionSelected(idx),
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: btnBg ?? colorScheme.surface,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color:
                                      btnBorder ?? colorScheme.outlineVariant,
                                  width: isSelected || isCorrectOption
                                      ? 1.5
                                      : 1.0,
                                ),
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 12,
                                    backgroundColor:
                                        (textColor ?? colorScheme.primary)
                                            .withValues(alpha: 0.12),
                                    child: Text(
                                      String.fromCharCode(65 + idx),
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: textColor ?? colorScheme.primary,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      optionText,
                                      style: theme.textTheme.bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color:
                                                textColor ??
                                                colorScheme.onSurface,
                                          ),
                                    ),
                                  ),
                                  if (_hasAnswered && isCorrectOption)
                                    const Icon(
                                      LucideIcons.checkCircle2,
                                      size: 18,
                                      color: Color(0xFF10B981),
                                    ),
                                  if (_hasAnswered &&
                                      isSelected &&
                                      !isCorrectOption)
                                    const Icon(
                                      LucideIcons.xCircle,
                                      size: 18,
                                      color: Color(0xFFEF4444),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],

                  // 5. Cevaplandıktan Sonra Açılan UWorld Açıklama Kartı
                  if (_hasAnswered) ...[
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: _isCorrect
                            ? const Color(0xFF10B981).withValues(alpha: 0.08)
                            : const Color(0xFFEF4444).withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: _isCorrect
                              ? const Color(0xFF10B981).withValues(alpha: 0.3)
                              : const Color(0xFFEF4444).withValues(alpha: 0.3),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                _isCorrect
                                    ? LucideIcons.checkCheck
                                    : LucideIcons.info,
                                size: 20,
                                color: _isCorrect
                                    ? const Color(0xFF10B981)
                                    : const Color(0xFFEF4444),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                _isCorrect
                                    ? 'Tebrikler! Doğru Cevap'
                                    : 'Doğru Cevap: ${challenge.targetProvinceId.toUpperCase()}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  color: _isCorrect
                                      ? const Color(0xFF10B981)
                                      : const Color(0xFFEF4444),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            challenge.explanation,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              height: 1.45,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          if (challenge.distractorTrap != null) ...[
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xFFD97706)
                                    .withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: const Color(0xFFD97706)
                                      .withValues(alpha: 0.3),
                                ),
                              ),
                              child: Text(
                                challenge.distractorTrap!,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: const Color(0xFFD97706),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ).animate().fadeIn(duration: 250.ms).slideY(begin: 0.1),

                    const SizedBox(height: 20),

                    // "Sonraki Soru" Butonu
                    FilledButton.icon(
                      onPressed: _nextChallenge,
                      icon: const Icon(LucideIcons.arrowRight, size: 18),
                      label: Text(
                        _currentIndex < widget.challenges.length - 1
                            ? 'Sonraki Soru'
                            : 'Sonuçları Gör',
                      ),
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ],

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
