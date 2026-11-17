import 'package:flutter/material.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Seçili sınav türü için atölye/oyun havuzunu çözen ortak sonuç nesnesi (`TASK-138`).
class WorkshopScopeResolution<T> {
  final List<T> items;
  final bool isUsingGkFallback;

  const WorkshopScopeResolution({
    required this.items,
    required this.isUsingGkFallback,
  });

  /// Verilen listeden aktif [selection] ile eşleşen öğeleri filtreler;
  /// henüz o sınava ait özel öğe yoksa ortak Genel Kültür köprü havuzuna düşer.
  static WorkshopScopeResolution<T> resolve<T>({
    required ExamSelection selection,
    required List<T> allItems,
    required bool Function(T item, ExamSelection selection) matchesSelection,
    required bool Function(T item) matchesGkBridge,
  }) {
    final scoped = allItems
        .where((item) => matchesSelection(item, selection))
        .toList(growable: false);
    if (scoped.isNotEmpty) {
      return WorkshopScopeResolution<T>(
        items: scoped,
        isUsingGkFallback: false,
      );
    }

    if (allItems.isEmpty || selection.isDefaultLisansGk) {
      return WorkshopScopeResolution<T>(
        items: allItems,
        isUsingGkFallback: false,
      );
    }

    final gkBridge = allItems.where(matchesGkBridge).toList(growable: false);
    return WorkshopScopeResolution<T>(
      items: gkBridge.isNotEmpty ? gkBridge : allItems,
      isUsingGkFallback: true,
    );
  }
}

/// Seçili sınav için özel atölye verisi henüz yüklenmemişken ortak Genel Kültür
/// köprüsünü açıklayan yeniden kullanılabilir bilgi şeridi (`TASK-138`).
///
/// Angular/Web Karşılığı: Paylaşımlı `ScopeBridgeNoticeBanner` bileşeni.
class WorkshopScopeBridgeBanner extends StatelessWidget {
  final String examTitle;
  final EdgeInsetsGeometry margin;

  const WorkshopScopeBridgeBanner({
    super.key,
    required this.examTitle,
    this.margin = const EdgeInsets.fromLTRB(16, 4, 16, 8),
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      key: const ValueKey('workshop_gk_fallback_banner'),
      padding: margin,
      child: TactileCard(
        isElevated: false,
        backgroundColor: Color.alphaBlend(
          colorScheme.tertiaryContainer.withAlpha(140),
          colorScheme.surface,
        ),
        borderColor: colorScheme.tertiary,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PhosphorIcon(
              PhosphorIconsRegular.info,
              size: 18,
              color: colorScheme.onTertiaryContainer,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                '$examTitle için özel atölye havuzu hazırlanıyor; ortak Genel Kültür / Tarih-Coğrafya atölyesiyle pratik yapabilirsin.',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onTertiaryContainer,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
