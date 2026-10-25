import 'package:flutter/material.dart';
import 'package:kadro/shared/widgets/page_header.dart';
import 'package:kadro/shared/widgets/section_title.dart';

/// Profil sekmesi: hedef sınav ve uygulama ayarları. Şimdilik sadece görünüm.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        PageHeader(
          icon: Icons.person,
          title: 'Profilin',
          subtitle: 'Hedef sınavın ve uygulama ayarların.',
        ),
        SizedBox(height: 16),
        SectionTitle('Hedef'),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.flag_outlined),
                title: Text('Hedef sınav'),
                trailing: Text('KPSS Lisans'),
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.today_outlined),
                title: Text('Günlük hedef'),
                trailing: Text('30 soru'),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        SectionTitle('Uygulama'),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.palette_outlined),
                title: Text('Tema'),
                trailing: Text('Sistem'),
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.notifications_outlined),
                title: Text('Günlük hatırlatma'),
                trailing: Text('Kapalı'),
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('Hakkında'),
                subtitle: Text('Kadro 1.0.0'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
