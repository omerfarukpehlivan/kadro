import 'package:flutter/material.dart';
import 'package:kadro/shared/widgets/diagram_card_shell.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'population_pyramid.dart';

/// KPSS Nüfus Piramidi Taşıyıcı Kart Bileşeni
///
/// Çerçeve, başlık rozeti, "Büyüt" düğmesi, istatistik rozetleri ve
/// yakınlaştırma diyaloğu ortak [DiagramCardShell] ailesinden gelir.
class PopulationPyramidCard extends StatelessWidget {
  final PopulationPyramidConfig config;
  final String? title;

  const PopulationPyramidCard({super.key, required this.config, this.title});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return DiagramCardShell(
      icon: PhosphorIconsRegular.users,
      badgeLabel: title ?? 'KPSS Demografi & Nüfus Piramidi',
      onZoom: () => showDiagramZoomDialog(
        context,
        icon: PhosphorIconsRegular.users,
        iconColor: colorScheme.primary,
        title: config.title,
        maxHeight: 520,
        chartBuilder: (_) => PopulationPyramid(config: config, height: 320),
      ),
      children: [
        // Şema Başlığı
        DiagramTitle(config.title),

        // Görsel Piramit Tuvali
        Padding(
          padding: const EdgeInsets.fromLTRB(6, 4, 6, 4),
          child: PopulationPyramid(config: config, height: 220),
        ),

        // İstatistik Rozetleri (Ortanca Yaş, Aktif, Yaşlı)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Wrap(
            spacing: 6,
            runSpacing: 4,
            alignment: WrapAlignment.center,
            children: [
              DiagramStatBadge(
                icon: PhosphorIconsRegular.calendar,
                label: 'Ortanca Yaş: ${config.medianAge}',
                color: colorScheme.primary,
              ),
              DiagramStatBadge(
                icon: PhosphorIconsRegular.briefcase,
                label: '15-64 Aktif: %${config.workingAgePercent}',
                color: colorScheme.secondary,
              ),
              DiagramStatBadge(
                icon: PhosphorIconsRegular.heartbeat,
                label: '65+ Yaşlı: %${config.elderlyPercent}',
                color: colorScheme.error,
              ),
            ],
          ),
        ),

        // Alt Eğitici Not Şeridi
        DiagramNoteStrip(
          note: config.educationalNote,
          iconColor: colorScheme.primary,
        ),
      ],
    );
  }
}
