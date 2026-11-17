import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/map_practice/data/models/map_challenge.dart';
import 'package:kadro/shared/widgets/turkey_map/turkey_map.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// İnteraktif Harita Pratiği ve Soru Çözüm Ekranı
///
/// Angular/Web benzetmesi: Bu ekran, etkileşimli SVG haritası ile adayların
/// il, maden, tarım ve yer şekilleri sorularını harita üzerinde dokunarak
/// veya şıklardan seçerek çözdüğü `MapChallengeComponent` görünümüdür.
class MapChallengeScreen extends ConsumerStatefulWidget {
  final List<MapChallenge> challenges;
  final String sessionTitle;
  final VoidCallback? onCompleted;

  const MapChallengeScreen({
    super.key,
    required this.challenges,
    this.sessionTitle = 'Harita Atölyesi',
    this.onCompleted,
  });

  @override
  ConsumerState<MapChallengeScreen> createState() => _MapChallengeScreenState();
}

class _MapChallengeScreenState extends ConsumerState<MapChallengeScreen> {
  final TransformationController _mapTransformController =
      TransformationController();
  double _currentZoom = 1.0;

  int _currentIndex = 0;
  int _score = 0;
  int _streak = 0;
  bool _hasAnswered = false;
  bool _isCorrect = false;
  String? _tappedProvinceId;
  int? _selectedOptionIndex;
  bool _showHint = false;

  MapChallenge get _current => widget.challenges[_currentIndex];

  @override
  void dispose() {
    _mapTransformController.dispose();
    super.dispose();
  }

  /// Haritayı kart içinde yakınlaştırır (`InteractiveViewer` dönüşüm matrisini günceller).
  ///
  /// Web/Angular karşılığı: CSS `transform: scale(...)` değerini bir pan/zoom
  /// direktifi üzerinden kontrol etmek gibidir.
  void _zoomBy(double factor) {
    final nextZoom = (_currentZoom * factor).clamp(1.0, 4.5);
    setState(() {
      _currentZoom = nextZoom;
      _mapTransformController.value = nextZoom <= 1.0
          ? Matrix4.identity()
          : Matrix4.diagonal3Values(nextZoom, nextZoom, 1.0);
    });
  }

  /// Harita yakınlaştırmasını varsayılan `1.0x` düzeyine sıfırlar.
  void _resetZoom() {
    setState(() {
      _currentZoom = 1.0;
      _mapTransformController.value = Matrix4.identity();
    });
  }

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
        _currentZoom = 1.0;
        _mapTransformController.value = Matrix4.identity();
      });
    } else {
      _showCompletionDialog();
    }
  }

  void _showCompletionDialog() {
    try {
      widget.onCompleted?.call();
    } catch (_) {}
    final theme = Theme.of(context);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        final ctxScheme = Theme.of(ctx).colorScheme;
        return AlertDialog(
          backgroundColor: ctxScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: ctxScheme.outlineVariant),
          ),
          title: Row(
            children: [
              PhosphorIcon(
                PhosphorIconsRegular.trophy,
                color: ctxScheme.tertiary,
                size: 26,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Antrenman Tamamlandı!',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
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
            fontWeight: FontWeight.w700,
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

  /// Haritayı neredeyse tam ekran genişliğinde ve `5.0x`'e kadar yakınlaştırılabilir
  /// modal pencerede açar; küçük illerin seçimini kolaylaştırır.
  void _openFullscreenMapDialog(
    BuildContext context,
    MapChallenge challenge,
    TurkeyMapConfig mapConfig,
  ) {
    final dialogController = TransformationController();
    var dialogZoom = 1.0;

    showDialog<void>(
      context: context,
      barrierColor: Theme.of(context).colorScheme.scrim.withValues(alpha: 0.72),
      builder: (ctx) {
        final ctxTheme = Theme.of(ctx);
        final ctxScheme = ctxTheme.colorScheme;
        final ctxText = ctxTheme.textTheme;

        return Dialog(
          backgroundColor: ctxScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: ctxScheme.outlineVariant),
          ),
          insetPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
          child: StatefulBuilder(
            builder: (ctx, setDialogState) {
              void applyDialogZoom(double nextZoom) {
                final clamped = nextZoom.clamp(1.0, 5.0);
                setDialogState(() {
                  dialogZoom = clamped;
                  dialogController.value = clamped <= 1.0
                      ? Matrix4.identity()
                      : Matrix4.diagonal3Values(clamped, clamped, 1.0);
                });
              }

              final viewportHeight = MediaQuery.sizeOf(ctx).height;
              return ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 1120,
                  maxHeight: viewportHeight * 0.88,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4, left: 4),
                              child: Text(
                                challenge.questionText,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: ctxText.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          IconButton(
                            icon: PhosphorIcon(
                              PhosphorIconsRegular.x,
                              color: ctxScheme.onSurface,
                            ),
                            onPressed: () => Navigator.of(ctx).pop(),
                            tooltip: 'Kapat',
                            style: IconButton.styleFrom(
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity.compact,
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Row(
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              child: Text(
                                ResponsiveBreakpoints.zoomHintText(
                                  ctx,
                                  selectProvince: true,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: ctxText.labelSmall?.copyWith(
                                  color: ctxScheme.onSurfaceVariant,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            IconButton(
                              key: const ValueKey(
                                'fullscreen_map_zoom_out_button',
                              ),
                              onPressed: dialogZoom > 1.0
                                  ? () => applyDialogZoom(dialogZoom / 1.5)
                                  : null,
                              icon: PhosphorIcon(
                                PhosphorIconsRegular.magnifyingGlassMinus,
                                size: 16,
                                color: dialogZoom > 1.0
                                    ? ctxScheme.primary
                                    : ctxScheme.onSurfaceVariant,
                              ),
                              tooltip: 'Uzaklaştır',
                              style: IconButton.styleFrom(
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                padding: const EdgeInsets.all(4),
                                minimumSize: const Size(28, 28),
                                visualDensity: VisualDensity.compact,
                              ),
                            ),
                            IconButton(
                              key: const ValueKey(
                                'fullscreen_map_zoom_in_button',
                              ),
                              onPressed: dialogZoom < 5.0
                                  ? () => applyDialogZoom(dialogZoom * 1.5)
                                  : null,
                              icon: PhosphorIcon(
                                PhosphorIconsRegular.magnifyingGlassPlus,
                                size: 16,
                                color: ctxScheme.primary,
                              ),
                              tooltip: 'Yakınlaştır',
                              style: IconButton.styleFrom(
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                padding: const EdgeInsets.all(4),
                                minimumSize: const Size(28, 28),
                                visualDensity: VisualDensity.compact,
                              ),
                            ),
                            TextButton(
                              key: const ValueKey(
                                'fullscreen_map_reset_button',
                              ),
                              onPressed: dialogZoom > 1.0
                                  ? () => applyDialogZoom(1.0)
                                  : null,
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 4,
                                ),
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                'Sıfırla',
                                style: ctxText.labelSmall?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Flexible(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            color: ctxScheme.surfaceContainerLow,
                            padding: const EdgeInsets.all(6),
                            child: InteractiveViewer(
                              transformationController: dialogController,
                              minScale: 1.0,
                              maxScale: 5.0,
                              onInteractionEnd: (_) {
                                final scale = dialogController.value
                                    .getMaxScaleOnAxis();
                                if ((scale - dialogZoom).abs() > 0.05) {
                                  setDialogState(
                                    () => dialogZoom = scale.clamp(1.0, 5.0),
                                  );
                                }
                              },
                              child: TurkeyMap(
                                padding: EdgeInsets.zero,
                                config: mapConfig,
                                onProvinceTap: (provinceId) {
                                  if (challenge.interactionType ==
                                          MapInteractionType.tapProvince &&
                                      !_hasAnswered) {
                                    Navigator.of(ctx).pop();
                                    _onProvinceTapped(provinceId);
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    ).whenComplete(dialogController.dispose);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final hPad = ResponsiveBreakpoints.horizontalPadding(context);
    final challenge = _current;

    // Harita dinamik renklendirme konfigürasyonu
    final highlightedMap = <String, Color>{};

    if (!_hasAnswered) {
      // Cevaplanmadan önce: Soru tarafından tanımlanan vurgulu iller parlasın
      for (final pId in challenge.highlightedProvinceIds) {
        highlightedMap[pId] = challenge.highlightColor ?? colorScheme.tertiary;
      }
    } else {
      // Cevaplandıktan sonra:
      if (challenge.interactionType == MapInteractionType.tapProvince) {
        if (_isCorrect) {
          // Doğru il yeşil
          highlightedMap[_tappedProvinceId!] = colorScheme.secondary;
        } else {
          // Yanlış dokunulan il kırmızı
          if (_tappedProvinceId != null) {
            highlightedMap[_tappedProvinceId!] = colorScheme.error;
          }
          // Olması gereken doğru il parlasın (altın sarısı / yeşil)
          highlightedMap[challenge.targetProvinceId] = colorScheme.secondary;
          for (final v in challenge.validProvinceIds) {
            highlightedMap[v] = colorScheme.secondary;
          }
        }
      } else {
        // Çoktan seçmeli modda doğru hedef il yeşil parlasın
        highlightedMap[challenge.targetProvinceId] = colorScheme.secondary;
      }
    }

    final mapConfig = TurkeyMapConfig(
      highlightedProvinces: highlightedMap,
      markers: challenge.markers,
    );
    final isSplitPane = ResponsiveBreakpoints.usesSplitPane(context);

    final headerSection = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'Soru ${_currentIndex + 1}/${widget.challenges.length} • ${challenge.tag}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ),
            if (challenge.hint.isNotEmpty && !_hasAnswered) ...[
              const SizedBox(width: 8),
              TextButton.icon(
                onPressed: () {
                  setState(() => _showHint = !_showHint);
                },
                icon: const PhosphorIcon(
                  PhosphorIconsRegular.lightbulb,
                  size: 14,
                ),
                label: Text(
                  _showHint ? 'İpucunu Gizle' : 'İpucu',
                  style: textTheme.labelSmall,
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
          ],
        ),
        if (_showHint) ...[
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: colorScheme.tertiary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: colorScheme.tertiary.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              children: [
                PhosphorIcon(
                  PhosphorIconsRegular.info,
                  size: 16,
                  color: colorScheme.onTertiaryContainer,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    challenge.hint,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onTertiaryContainer,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        const SizedBox(height: 12),
        Text(
          challenge.questionText,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            height: 1.4,
          ),
        ),
      ],
    );

    final mapCard = Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 0, 2, 4),
            child: Row(
              children: [
                PhosphorIcon(
                  challenge.interactionType == MapInteractionType.tapProvince
                      ? PhosphorIconsRegular.handPointing
                      : PhosphorIconsRegular.mapTrifold,
                  size: 13,
                  color: colorScheme.primary,
                ),
                const SizedBox(width: 5),
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    challenge.interactionType == MapInteractionType.tapProvince
                        ? 'Cevaplamak için haritadaki ile tıklayın'
                        : 'Haritayı yakınlaştırıp inceleyebilirsiniz',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                IconButton(
                  key: const ValueKey('map_zoom_in_button'),
                  onPressed: () => _zoomBy(1.5),
                  icon: PhosphorIcon(
                    PhosphorIconsRegular.magnifyingGlassPlus,
                    size: 16,
                    color: colorScheme.primary,
                  ),
                  tooltip: 'Yakınlaştır',
                  style: IconButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: const EdgeInsets.all(4),
                    minimumSize: const Size(28, 28),
                    visualDensity: VisualDensity.compact,
                  ),
                ),
                if (_currentZoom > 1.0)
                  IconButton(
                    key: const ValueKey('map_zoom_reset_button'),
                    onPressed: _resetZoom,
                    icon: PhosphorIcon(
                      PhosphorIconsRegular.arrowsInSimple,
                      size: 16,
                      color: colorScheme.secondary,
                    ),
                    tooltip: 'Sıfırla',
                    style: IconButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: const EdgeInsets.all(4),
                      minimumSize: const Size(28, 28),
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                InkWell(
                  key: const ValueKey('map_fullscreen_button'),
                  onTap: () =>
                      _openFullscreenMapDialog(context, challenge, mapConfig),
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 4,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PhosphorIcon(
                          PhosphorIconsRegular.cornersOut,
                          size: 14,
                          color: colorScheme.primary,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          'Büyüt',
                          style: textTheme.labelSmall?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: InteractiveViewer(
              transformationController: _mapTransformController,
              minScale: 1.0,
              maxScale: 4.5,
              onInteractionEnd: (_) {
                final scale = _mapTransformController.value.getMaxScaleOnAxis();
                if ((scale - _currentZoom).abs() > 0.05) {
                  setState(() => _currentZoom = scale.clamp(1.0, 4.5));
                }
              },
              child: TurkeyMap(
                padding: EdgeInsets.zero,
                config: mapConfig,
                onProvinceTap: _onProvinceTapped,
              ),
            ),
          ),
        ],
      ),
    );

    final optionsAndFeedback = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (challenge.interactionType ==
                MapInteractionType.identifyHighlighted &&
            challenge.options.isNotEmpty) ...[
          Column(
            children: List.generate(challenge.options.length, (idx) {
              final optionText = challenge.options[idx];
              final isSelected = _selectedOptionIndex == idx;
              final isCorrectOption = idx == challenge.correctOptionIndex;

              Color? btnBg;
              Color? btnBorder;
              Color? textColor;

              if (_hasAnswered) {
                if (isCorrectOption) {
                  btnBg = colorScheme.secondary.withValues(alpha: 0.15);
                  btnBorder = colorScheme.secondary;
                  textColor = colorScheme.secondary;
                } else if (isSelected) {
                  btnBg = colorScheme.error.withValues(alpha: 0.15);
                  btnBorder = colorScheme.error;
                  textColor = colorScheme.error;
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
                        color: btnBorder ?? colorScheme.outlineVariant,
                        width: isSelected || isCorrectOption ? 1.5 : 1.0,
                      ),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: (textColor ?? colorScheme.primary)
                              .withValues(alpha: 0.12),
                          child: Text(
                            String.fromCharCode(65 + idx),
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: textColor ?? colorScheme.primary,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            optionText,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: textColor ?? colorScheme.onSurface,
                            ),
                          ),
                        ),
                        if (_hasAnswered && isCorrectOption)
                          PhosphorIcon(
                            PhosphorIconsFill.checkCircle,
                            size: 18,
                            color: colorScheme.secondary,
                          ),
                        if (_hasAnswered && isSelected && !isCorrectOption)
                          PhosphorIcon(
                            PhosphorIconsFill.xCircle,
                            size: 18,
                            color: colorScheme.error,
                          ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ] else if (isSplitPane && !_hasAnswered) ...[
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colorScheme.outlineVariant),
            ),
            child: Row(
              children: [
                PhosphorIcon(
                  PhosphorIconsRegular.handPointing,
                  size: 18,
                  color: colorScheme.primary,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Soldaki Türkiye haritası üzerinde ilgili ili seçin.',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        if (_hasAnswered) ...[
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _isCorrect
                  ? colorScheme.secondary.withValues(alpha: 0.08)
                  : colorScheme.error.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: _isCorrect
                    ? colorScheme.secondary.withValues(alpha: 0.3)
                    : colorScheme.error.withValues(alpha: 0.3),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    PhosphorIcon(
                      _isCorrect
                          ? PhosphorIconsRegular.checks
                          : PhosphorIconsRegular.info,
                      size: 20,
                      color: _isCorrect
                          ? colorScheme.secondary
                          : colorScheme.error,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        _isCorrect
                            ? 'Tebrikler! Doğru Cevap'
                            : 'Doğru Cevap: ${challenge.targetProvinceId.toUpperCase()}',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: _isCorrect
                              ? colorScheme.secondary
                              : colorScheme.error,
                        ),
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
                      color: colorScheme.tertiaryContainer,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: colorScheme.tertiary.withValues(alpha: 0.45),
                      ),
                    ),
                    child: Text(
                      challenge.distractorTrap!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onTertiaryContainer,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: _nextChallenge,
            icon: const PhosphorIcon(PhosphorIconsRegular.arrowRight, size: 18),
            label: Text(
              _currentIndex < widget.challenges.length - 1
                  ? 'Sonraki Soru'
                  : 'Sonuçları Gör',
            ),
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ],
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
                    color: colorScheme.tertiaryContainer,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: colorScheme.tertiary),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PhosphorIcon(
                        PhosphorIconsFill.flame,
                        size: 14,
                        color: colorScheme.tertiary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$_streak Seri',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: colorScheme.tertiary,
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
        maxWidth: isSplitPane ? 1360 : 720,
        padding: EdgeInsets.zero,
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
              child: isSplitPane
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: hPad),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 60,
                            child: Center(
                              child: SingleChildScrollView(
                                padding: const EdgeInsets.fromLTRB(
                                  0,
                                  16,
                                  20,
                                  16,
                                ),
                                child: mapCard,
                              ),
                            ),
                          ),
                          VerticalDivider(
                            width: 1,
                            thickness: 1.5,
                            color: colorScheme.outlineVariant,
                          ),
                          Expanded(
                            flex: 40,
                            child: Scrollbar(
                              child: ListView(
                                padding: const EdgeInsets.fromLTRB(
                                  20,
                                  18,
                                  0,
                                  24,
                                ),
                                children: [
                                  headerSection,
                                  const SizedBox(height: 18),
                                  optionsAndFeedback,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: hPad),
                          child: headerSection,
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: mapCard,
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: hPad),
                          child: optionsAndFeedback,
                        ),
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
