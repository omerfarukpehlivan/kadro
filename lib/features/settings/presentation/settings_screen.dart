import 'package:flutter/material.dart';
import 'package:gunisigi/shared/widgets/page_header.dart';

/// Ayarlar sayfası. Şimdilik sadece görünüm; ayarların çalışması sonraki fazlarda.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        PageHeader(
          icon: Icons.settings,
          title: 'Uygulama ayarları',
          subtitle: 'Tema, hatırlatma ve uygulama bilgileri.',
        ),
        SizedBox(height: 16),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.palette_outlined),
                title: Text('Tema'),
                trailing: Text('Sistem'),
              ),
              Divider(height: 1), // İnce ayırıcı çizgi (<hr> gibi)
              ListTile(
                leading: Icon(Icons.notifications_outlined),
                title: Text('Günlük hatırlatma'),
                trailing: Text('Kapalı'),
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('Hakkında'),
                subtitle: Text('Günışığı 1.0.0'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
