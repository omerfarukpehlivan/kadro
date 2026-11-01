/// KPSS hap bilgi kartını (flashcard) temsil eden model.
///
/// Angular/TypeScript'teki `interface Flashcard { ... }` yapısına benzer.
/// Kartın ön yüzünde soru/kavram, arka yüzünde ise özet hap bilgi yer alır.
class Flashcard {
  final String id;
  final String lesson;
  final String topic;
  final String frontText;
  final String backText;

  const Flashcard({
    required this.id,
    required this.lesson,
    required this.topic,
    required this.frontText,
    required this.backText,
  });
}
