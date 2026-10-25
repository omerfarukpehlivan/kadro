import 'package:flutter/material.dart';

/// Ana sayfanın sadece kendi iç içeriğini tutan saf görünüm bileşeni.
/// Kapsayıcı Scaffold, AppBar ve Footer `MainLayout` içinde yönetilir.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          padding: const EdgeInsets.all(0), // Kaydırılabilir alana padding
          child: Column( // 2 parçayı dikeyde tutan ana kolon

            children: [
              // 📌 1. BÖLÜM: <div class="padding"> <div class="flex-column">
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(

                  children: [
                    const Icon(Icons.wb_sunny_rounded, size: 80, color: Colors.amber),
                    const Text('Günaydın', style: TextStyle(fontSize: 24)),
                    const SizedBox(height: 8),
                    // Badge (Rozet)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      constraints: const BoxConstraints(
                        minWidth: 80,  // En az 80px olsun
                        maxWidth: 200, // En fazla 200px olsun, aşarsa alt satıra geçsin
                      ),

                      decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4), // Gölge rengi ve şeffaflığı (%10 siyah)
                            blurRadius: 10,   // Bulanıklık derecesi (CSS'teki blur)
                            spreadRadius: 2,  // Gölgenin yayılma genişliği
                            offset: const Offset(0, 4), // X ve Y kayması (X: 0, Y: 4px aşağı)
                          ),
                        ],
                      ),
                      child: const Text('🔥 3 Günlük Seri'),
                    ),

                    const SizedBox(height: 24),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      constraints: const BoxConstraints(
                        minWidth: 80,  // En az 80px olsun
                        maxWidth: 200, // En fazla 200px olsun, aşarsa alt satıra geçsin
                      ),

                      decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4), // Gölge rengi ve şeffaflığı (%10 siyah)
                            blurRadius: 10,   // Bulanıklık derecesi (CSS'teki blur)
                            spreadRadius: 2,  // Gölgenin yayılma genişliği
                            offset: const Offset(0, 4), // X ve Y kayması (X: 0, Y: 4px aşağı)
                          ),
                        ],
                      ),
                      child: const Text('🔥 Tebrikler'),
                    ),

                    const SizedBox(height: 24),

                    ElevatedButton(onPressed: () {}, child: const Text('Ekle')),
                  ],
                ),
              ),

              const SizedBox(height: 24), // İki bölüm arasındaki dikey boşluk

              // 📌 2. BÖLÜM: <div class="padding"> <div class="flex-row">

              Center(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFAB00FF), // Kenarlık rengi
                      width: 1,           // Kenarlık kalınlığı
                    ),
                  ),

                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.favorite, color: Color(0xFF003CFF)),
                      SizedBox(width: 8),
                      Text('Örnek metin', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ),
            ],
          ),
    );


  }
}
