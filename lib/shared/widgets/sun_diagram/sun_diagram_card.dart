import 'package:flutter/material.dart';
import 'package:kadro/shared/widgets/diagram_card_shell.dart';
import 'package:kadro/shared/widgets/kadro_badge.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'sun_diagram.dart';

/// KPSS Güneş Açısı ve Mevsim Şeması Taşıyıcı Kart Bileşeni
///
/// Çerçeve, başlık rozeti, "Büyüt" düğmesi ve yakınlaştırma diyaloğu ortak
/// [DiagramCardShell] / [showDiagramZoomDialog] üzerinden gelir.
class SunDiagramCard extends StatelessWidget {
  final SunDiagramConfig config;
  final String? title;

  const SunDiagramCard({super.key, required this.config, this.title});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return DiagramCardShell(
      icon: PhosphorIconsRegular.sun,
      badgeLabel: title ?? 'KPSS Güneş Açısı & Mevsim Şeması',
      badgeTone: KadroBadgeTone.tertiary,
      onZoom: () => showDiagramZoomDialog(
        context,
        icon: PhosphorIconsRegular.sun,
        iconColor: colorScheme.tertiary,
        title: config.title,
        chartBuilder: (_) => SunDiagram(config: config, height: 260),
      ),
      children: [
        // Şema Başlığı
        DiagramTitle(config.title),

        // Görsel Güneş Şeması Tuvali
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 4, 10, 6),
          child: SunDiagram(config: config, height: 185),
        ),

        // Alt Eğitici Not Şeridi
        DiagramNoteStrip(note: config.educationalNote),
      ],
    );
  }
}
