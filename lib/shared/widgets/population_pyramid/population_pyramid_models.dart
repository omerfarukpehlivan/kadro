/// Nüfus piramidindeki tek bir yaş dilimi verisi
class AgeGroupData {
  final String label;
  final double malePercent;
  final double femalePercent;

  const AgeGroupData({
    required this.label,
    required this.malePercent,
    required this.femalePercent,
  });

  Map<String, dynamic> toJson() => {
    'label': label,
    'malePercent': malePercent,
    'femalePercent': femalePercent,
  };

  factory AgeGroupData.fromJson(Map<String, dynamic> json) {
    return AgeGroupData(
      label: json['label'] as String? ?? '',
      malePercent: (json['malePercent'] as num?)?.toDouble() ?? 0.0,
      femalePercent: (json['femalePercent'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

/// Nüfus piramidi konfigürasyon modeli
class PopulationPyramidConfig {
  final String title;
  final String? subtitle;
  final List<AgeGroupData> ageGroups;
  final double medianAge;
  final double workingAgePercent; // 15-64
  final double elderlyPercent; // 65+
  final double childPercent; // 0-14
  final String educationalNote;

  const PopulationPyramidConfig({
    required this.title,
    this.subtitle,
    required this.ageGroups,
    required this.medianAge,
    required this.workingAgePercent,
    required this.elderlyPercent,
    required this.childPercent,
    required this.educationalNote,
  });

  Map<String, dynamic> toJson() => {
    'title': title,
    if (subtitle != null) 'subtitle': subtitle,
    'ageGroups': ageGroups.map((e) => e.toJson()).toList(),
    'medianAge': medianAge,
    'workingAgePercent': workingAgePercent,
    'elderlyPercent': elderlyPercent,
    'childPercent': childPercent,
    'educationalNote': educationalNote,
  };

  factory PopulationPyramidConfig.fromJson(Map<String, dynamic> json) {
    final rawList = json['ageGroups'] as List? ?? [];
    final groups = rawList
        .map((e) => AgeGroupData.fromJson(e as Map<String, dynamic>))
        .toList();

    return PopulationPyramidConfig(
      title: json['title'] as String? ?? 'Nüfus Piramidi',
      subtitle: json['subtitle'] as String?,
      ageGroups: groups,
      medianAge: (json['medianAge'] as num?)?.toDouble() ?? 34.0,
      workingAgePercent:
          (json['workingAgePercent'] as num?)?.toDouble() ?? 68.4,
      elderlyPercent: (json['elderlyPercent'] as num?)?.toDouble() ?? 10.2,
      childPercent: (json['childPercent'] as num?)?.toDouble() ?? 21.4,
      educationalNote: json['educationalNote'] as String? ?? '',
    );
  }
}

/// ÖSYM KPSS Referans Nüfus Piramidi Verileri (TÜİK Güncel Demografi)
class PopulationPresets {
  /// Modern Türkiye Nüfus Piramidi:
  /// - Tabanı belirgin biçimde daralan (doğum oranları hızla düşen)
  /// - Çalışma çağındaki nüfus payı zirvede (%68+)
  /// - 65+ yaşlı nüfus oranı %10'u aşmış ("Çok Yaşlı Nüfuslu Ülke")
  /// - Ortanca yaş: 34.0
  static const turkeyCurrent = PopulationPyramidConfig(
    title: 'Türkiye Nüfus Piramidi (Güncel Demografik Dönüşüm)',
    subtitle:
        'TÜİK verilerine göre tabanı daralan arı kovanı / gelişmiş ülke modeli',
    medianAge: 34.0,
    workingAgePercent: 68.4,
    elderlyPercent: 10.2,
    childPercent: 21.4,
    educationalNote:
        'Türkiye nüfusunda doğurganlık hızı düşmekte, taban daralmaktadır.\nOrtanca yaş 34'
        'e yükselmiş, 65+ yaşlı nüfus %10 barajını aşarak ülkemiz "çok yaşlı nüfus" sınıfına girmiştir.',
    ageGroups: [
      AgeGroupData(label: '80+', malePercent: 0.8, femalePercent: 1.2),
      AgeGroupData(label: '75-79', malePercent: 1.1, femalePercent: 1.4),
      AgeGroupData(label: '70-74', malePercent: 1.7, femalePercent: 1.9),
      AgeGroupData(label: '65-69', malePercent: 2.3, femalePercent: 2.5),
      AgeGroupData(label: '60-64', malePercent: 2.7, femalePercent: 2.8),
      AgeGroupData(label: '55-59', malePercent: 3.2, femalePercent: 3.1),
      AgeGroupData(label: '50-54', malePercent: 3.4, femalePercent: 3.3),
      AgeGroupData(label: '45-49', malePercent: 3.7, femalePercent: 3.6),
      AgeGroupData(label: '40-44', malePercent: 3.9, femalePercent: 3.8),
      AgeGroupData(label: '35-39', malePercent: 3.8, femalePercent: 3.7),
      AgeGroupData(label: '30-34', malePercent: 3.7, femalePercent: 3.6),
      AgeGroupData(label: '25-29', malePercent: 3.6, femalePercent: 3.5),
      AgeGroupData(label: '20-24', malePercent: 3.7, femalePercent: 3.5),
      AgeGroupData(label: '15-19', malePercent: 3.8, femalePercent: 3.6),
      AgeGroupData(label: '10-14', malePercent: 3.8, femalePercent: 3.6),
      AgeGroupData(label: '5-9', malePercent: 3.6, femalePercent: 3.4),
      AgeGroupData(label: '0-4', malePercent: 3.2, femalePercent: 3.0),
    ],
  );
}
