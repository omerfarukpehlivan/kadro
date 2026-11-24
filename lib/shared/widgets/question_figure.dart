import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kadro/core/utils/figure_svg.dart';
import 'package:kadro/shared/widgets/diagram_card_shell.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Soru veya konu anlatımı şeklini (güvenli SVG) temaya uygun renkte çizer.
///
/// Şekiller renk içermez: çizgi ve yazılar `currentColor` kullanır, burada
/// [SvgTheme] ile temanın `onSurface` rengine bağlanır. Böylece aynı şekil açık
/// ve koyu temada kendiliğinden doğru görünür.
///
/// Web/Angular Karşılığı: `color: var(--fg)` verilmiş bir kapsayıcı içine
/// sanitize edilerek basılan satır içi `<svg>`.
///
/// Yeni paket notu: `flutter_svg` SVG'yi vektör olarak çizer
/// (web'deki `<img src="x.svg">`), `SvgPicture.string` metinden okur.
class QuestionFigure extends StatelessWidget {
  /// SVG metni (`questions.figure_svg`).
  final String svg;

  /// Doğal boyutun en fazla kaç katına büyütülebileceği (tablette daha okunur).
  final double maxScale;

  const QuestionFigure({super.key, required this.svg, this.maxScale = 1.35});

  @override
  Widget build(BuildContext context) {
    if (!isSafeFigureSvg(svg)) return const SizedBox.shrink();
    final colorScheme = Theme.of(context).colorScheme;
    final aspect = figureSvgAspectRatio(svg) ?? 4 / 3;
    final intrinsic = figureSvgIntrinsicWidth(svg) ?? 320;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.hasBoundedWidth
            ? math.min(constraints.maxWidth, intrinsic * maxScale)
            : intrinsic;
        return Center(
          child: SizedBox(
            width: width,
            child: AspectRatio(
              aspectRatio: aspect,
              child: SvgPicture.string(
                svg,
                fit: BoxFit.contain,
                theme: SvgTheme(currentColor: colorScheme.onSurface),
                semanticsLabel: 'Soru şekli',
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Soru ekranındaki şekil kartı: ortak diyagram çerçevesi + "Büyüt" diyaloğu.
///
/// Diğer görsel kartlar (harita, iklim grafiği…) gibi [DiagramCardShell]
/// kullanır; soru metninin üstünde, büyük tablette yanında gösterilir.
class QuestionFigureCard extends StatelessWidget {
  final String svg;

  const QuestionFigureCard({super.key, required this.svg});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return DiagramCardShell(
      icon: PhosphorIconsRegular.compassTool,
      badgeLabel: 'Şekil',
      onZoom: () => showDiagramZoomDialog(
        context,
        icon: PhosphorIconsRegular.compassTool,
        iconColor: colorScheme.primary,
        title: 'Şekil',
        chartBuilder: (_) => QuestionFigure(svg: svg, maxScale: 3),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 4, 12, 14),
          child: QuestionFigure(svg: svg),
        ),
      ],
    );
  }
}
