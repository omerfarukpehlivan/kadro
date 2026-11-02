/// Soru çözüm oturumunun çalışma modu.
///
/// Web/Angular Karşılığı: `type QuizMode = 'learning' | 'exam'`
///
/// [learning]: Öğrenme / Anında Çözüm Modu. Şık onaylanınca doğru/yanlış anında gösterilir,
/// açıklama kartı açılır. Geri dönüldüğünde verilen cevap kilitlidir.
///
/// [exam]: Sınav / Gizli Çözüm Modu. Şık işaretlenir ama doğruluğu hemen söylenmez.
/// Geri dönüldüğünde şık değiştirilebilir. Tüm sonuçlar test bitiminde karneye saklanır.
enum QuizMode {
  learning,
  exam;

  String get label => switch (this) {
    QuizMode.learning => 'Öğrenme Modu (Anında Çözüm)',
    QuizMode.exam => 'Sınav Modu (Gizli Çözüm)',
  };

  String get description => switch (this) {
    QuizMode.learning =>
      'Cevap onaylandığı anda doğru/yanlış ve açıklama görünür.',
    QuizMode.exam =>
      'Cevaplar optik form gibi saklanır, sonuçlar sınav sonunda açılır.',
  };
}
