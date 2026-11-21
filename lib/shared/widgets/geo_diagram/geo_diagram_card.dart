import 'package:flutter/material.dart';
import 'package:kadro/shared/widgets/diagram_card_shell.dart';
import 'package:kadro/shared/widgets/kadro_badge.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'geo_diagram.dart';

/// KPSS Jeomorfoloji ve Yer Şekilleri Taşıyıcı Kart Bileşeni
///
/// Çerçeve, başlık rozeti, "Büyüt" düğmesi ve yakınlaştırma diyaloğu ortak
/// [DiagramCardShell] / [showDiagramZoomDialog] üzerinden gelir.
class GeoDiagramCard extends StatelessWidget {
  final GeoDiagramConfig config;
  final String? title;

  const GeoDiagramCard({super.key, required this.config, this.title});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return DiagramCardShell(
      icon: PhosphorIconsRegular.mountains,
      badgeLabel: title ?? 'KPSS Jeomorfoloji & Yer Şekli',
      badgeTone: KadroBadgeTone.tertiary,
      onZoom: () => showDiagramZoomDialog(
        context,
        icon: PhosphorIconsRegular.mountains,
        iconColor: colorScheme.tertiary,
        title: config.title,
        chartBuilder: (_) => GeoDiagram(config: config, height: 260),
      ),
      children: [
        // Şema Başlığı (Örn. "Kırıklı Dağ Oluşumu (Horst - Graben)")
        DiagramTitle(config.title),

        // Görsel Kesit Tuvali
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 6, 10, 8),
          child: GeoDiagram(config: config, height: 185),
        ),

        // Alt Eğitici Not Şeridi
        DiagramNoteStrip(note: config.educationalNote),
      ],
    );
  }
}
