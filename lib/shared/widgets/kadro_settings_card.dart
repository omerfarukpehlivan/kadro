import 'package:flutter/material.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';

/// Ayar satırlarını (`ListTile` / `SwitchListTile`) standart kompakt dolgu
/// ve eşit `Divider` çizgileriyle gruplayan kapsayıcı kart (`TASK-153`).
///
/// Web/Angular Karşılığı: Ayarlar listesi için gruplanmış `<app-settings-card>`.
class KadroSettingsCard extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry padding;
  final Color? borderColor;

  const KadroSettingsCard({
    super.key,
    required this.children,
    this.padding = const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return TactileCard(
      padding: padding,
      borderColor: borderColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < children.length; i++) ...[
            if (i > 0) const Divider(height: 1),
            children[i],
          ],
        ],
      ),
    );
  }
}
