import 'package:flutter/material.dart';
import 'package:kadro/features/quiz/presentation/widgets/option_tile.dart';
import 'package:kadro/features/quiz/data/models/question.dart';

/// Statik Soru Ekranı (Faz 3).
class QuizScreen extends StatelessWidget {
  final Question question;

  const QuizScreen({
    super.key,
    this.question = const Question(
      id: 'tar_001',
      lesson: 'Tarih',
      topic: 'İlk Türk Devletleri',
      text: 'Uygurların yerleşik hayata geçmesiyle birlikte Türk kültür ve devlet yapısında önemli değişimler yaşanmıştır.\n\nAşağıdakilerden hangisi bu değişimlerin doğrudan bir sonucu olarak gösterilemez?',
      options: [
        'Tapınak ve saray mimarisinin gelişmesi',
        'Kalıcı yazılı eserlerin ve kütüphanelerin ortaya çıkması',
        'Hükümdarlığın kut inancına dayandırılması geleneğinin sona ermesi',
        'Minyatür ve fresk gibi süsleme sanatlarının yaygınlaşması',
        'Tarım faaliyetlerinin temel geçim kaynağı hâline gelmesi',
      ],
      correctIndex: 2,
      explanation: 'Kut inancı Türk devlet geleneğinde varlığını sürdürmüştür. Yerleşik hayat bu inancı sona erdirmemiştir.',
    ),
  });

  @override
  Widget build(BuildContext context) {
    const labels = ['A', 'B', 'C', 'D', 'E'];

    return Scaffold(
      appBar: AppBar(title: Text('${question.lesson} Testi')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Konu Başlığı
          Text(question.topic, style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 12),

          // Soru Metni
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                question.text,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Şıklar (A - E)
          for (var i = 0; i < question.options.length; i++)
            OptionTile(label: labels[i], text: question.options[i]),
          const SizedBox(height: 16),

          // Onay Butonu
          const FilledButton(onPressed: null, child: Text('Cevabı Onayla')),
        ],
      ),
    );
  }
}
