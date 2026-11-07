import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/features/planner/data/models/study_task.dart';
import 'package:kadro/features/planner/data/study_planner_notifier.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/stats/data/study_stats_notifier.dart';
import 'package:kadro/shared/widgets/mascot_coach_banner.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// 3 Adımlı Kişiselleştirilmiş KPSS Hedef ve Çalışma Rotası Sihirbazı.
///
/// Web/Angular Karşılığı: Multi-Step Onboarding / Goal Setup Wizard.
/// Kullanıcının hedef puanı, zorlandığı odak dersi ve günlük soru temposunu
/// toplayarak otomatik çalışma görevi ve çalışma planı rotası kurar.
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  int _step = 0;
  int _selectedScore = 85;
  String _selectedLesson = 'Tarih';
  int _selectedDailyGoal = 30;

  void _completeOnboarding() {
    ref
        .read(userPreferencesProvider.notifier)
        .saveOnboardingGoals(
          targetKpssScore: _selectedScore,
          focusLesson: _selectedLesson,
          dailyGoalQuestions: _selectedDailyGoal,
        );

    ref.read(studyStatsProvider.notifier).updateDailyGoal(_selectedDailyGoal);

    ref
        .read(studyPlannerProvider.notifier)
        .addTask(
          title: '$_selectedLesson Odak Testi ($_selectedScore+ Hedef)',
          lessonTag: _selectedLesson,
          estimatedMinutes: 20,
          actionType: StudyTaskActionType.quiz,
        );

    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('KPSS Hedef Sihirbazı')),
      body: SafeArea(
        child: Column(
          children: [
            // Üst Adım İlerleme Göstergesi
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Adım ${_step + 1} / 3',
                        style: textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: colorScheme.primary,
                        ),
                      ),
                      Text(
                        _step == 0
                            ? 'Hedef Puan'
                            : (_step == 1 ? 'Odak Ders' : 'Günlük Tempo'),
                        style: textTheme.labelMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: (_step + 1) / 3,
                      minHeight: 6,
                    ),
                  ),
                ],
              ),
            ),

            // Adıma Özel Koç Balonu ve Seçenekler
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildCoachBanner(),
                  const SizedBox(height: 16),
                  _buildStepContent(colorScheme, textTheme),
                ],
              ),
            ),

            // Alt Navigasyon Butonları
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                border: Border(
                  top: BorderSide(
                    color: colorScheme.outlineVariant.withAlpha(80),
                  ),
                ),
              ),
              child: Row(
                children: [
                  if (_step > 0) ...[
                    Expanded(
                      flex: 1,
                      child: OutlinedButton(
                        onPressed: () => setState(() => _step--),
                        child: const Text('Geri'),
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    flex: 2,
                    child: _step < 2
                        ? FilledButton(
                            onPressed: () => setState(() => _step++),
                            child: const Text('Devam Et'),
                          )
                        : FilledButton.icon(
                            onPressed: _completeOnboarding,
                            icon: const PhosphorIcon(
                              PhosphorIconsBold.compass,
                              size: 18,
                            ),
                            label: const Text('Rotamı Oluştur'),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCoachBanner() {
    switch (_step) {
      case 0:
        return const MascotCoachBanner(
          mood: MascotMood.coach,
          badgeLabel: 'KADRO ROTASI',
          title: 'Hedef KPSS Puanın Kaç?',
          message: 'Atanmak istediğin kadro için hedef puanını seç, çalışma rotanı ona göre kuralım.',
        );
      case 1:
        return const MascotCoachBanner(
          mood: MascotMood.detective,
          badgeLabel: 'STRATEJİK ODAK',
          title: 'En Çok Hangi Derste Zorlanıyorsun?',
          message: 'Öncelikli odak dersini seç; günlük çalışma planına özel görev ekleyelim.',
        );
      case 2:
      default:
        return const MascotCoachBanner(
          mood: MascotMood.pro,
          badgeLabel: 'DİSİPLİN & SERİ',
          title: 'Günlük Kaç Soru Çözmek İstiyorsun?',
          message: 'İstikrarlı bir seri (streak) yakalamak için günlük soru hedefini belirle.',
        );
    }
  }

  Widget _buildStepContent(ColorScheme colorScheme, TextTheme textTheme) {
    switch (_step) {
      case 0:
        return Column(
          children: [
            _SelectableOptionCard(
              title: '80+ Puan · B Grubu Memurluk',
              subtitle: 'Genel İdare Hizmetleri, VHKİ, Düz Memurluk',
              icon: PhosphorIconsDuotone.sealCheck,
              isSelected: _selectedScore == 80,
              onTap: () => setState(() => _selectedScore = 80),
            ),
            const SizedBox(height: 10),
            _SelectableOptionCard(
              title: '85+ Puan · Merkez & Kurum Kadroları',
              subtitle: 'Bakanlıklar, Gelir Uzmanlığı, Bölge Müdürlükleri',
              icon: PhosphorIconsFill.trophy,
              isSelected: _selectedScore == 85,
              onTap: () => setState(() => _selectedScore = 85),
            ),
            const SizedBox(height: 10),
            _SelectableOptionCard(
              title: '90+ Puan · Derece & A Grubu Kadrolar',
              subtitle: 'Müfettişlik, Uzmanlık ve İlk 1000 Derece Hedefi',
              icon: PhosphorIconsFill.crown,
              isSelected: _selectedScore == 90,
              onTap: () => setState(() => _selectedScore = 90),
            ),
          ],
        );
      case 1:
        return Column(
          children: [
            _SelectableOptionCard(
              title: 'Tarih · 27 Soru (%45 Ağırlık)',
              subtitle: 'İlk Türk Devletleri, Osmanlı ve İnkılap Tarihi',
              icon: PhosphorIconsDuotone.scroll,
              isSelected: _selectedLesson == 'Tarih',
              onTap: () => setState(() => _selectedLesson = 'Tarih'),
            ),
            const SizedBox(height: 10),
            _SelectableOptionCard(
              title: 'Coğrafya · 18 Soru (%30 Ağırlık)',
              subtitle: 'Fiziki Özellikler, İklim, Nüfus ve Ekonomik Coğrafya',
              icon: PhosphorIconsDuotone.globeHemisphereEast,
              isSelected: _selectedLesson == 'Coğrafya',
              onTap: () => setState(() => _selectedLesson = 'Coğrafya'),
            ),
            const SizedBox(height: 10),
            _SelectableOptionCard(
              title: 'Vatandaşlık · 9 Soru (%15 Ağırlık)',
              subtitle: 'Temel Hukuk, Anayasa, Yasama, Yürütme ve İdare',
              icon: PhosphorIconsDuotone.scales,
              isSelected: _selectedLesson == 'Vatandaşlık',
              onTap: () => setState(() => _selectedLesson = 'Vatandaşlık'),
            ),
            const SizedBox(height: 10),
            _SelectableOptionCard(
              title: 'Güncel Bilgiler · 6 Soru (%10 Ağırlık)',
              subtitle: 'Uluslararası Kuruluşlar, Bilim, Kültür ve Sanat',
              icon: PhosphorIconsDuotone.newspaperClipping,
              isSelected: _selectedLesson == 'Güncel Bilgiler',
              onTap: () => setState(() => _selectedLesson = 'Güncel Bilgiler'),
            ),
          ],
        );
      case 2:
      default:
        return Column(
          children: [
            _SelectableOptionCard(
              title: '30 Soru / Gün · İstikrarlı Tempo',
              subtitle: 'Günde 25-35 dakika düzenli soru çözümü',
              icon: PhosphorIconsFill.fire,
              isSelected: _selectedDailyGoal == 30,
              onTap: () => setState(() => _selectedDailyGoal = 30),
            ),
            const SizedBox(height: 10),
            _SelectableOptionCard(
              title: '50 Soru / Gün · Yoğun Tempo',
              subtitle: 'Günde 45-60 dakika konu pekiştirme',
              icon: PhosphorIconsFill.lightning,
              isSelected: _selectedDailyGoal == 50,
              onTap: () => setState(() => _selectedDailyGoal = 50),
            ),
            const SizedBox(height: 10),
            _SelectableOptionCard(
              title: '100 Soru / Gün · Derece Kampı',
              subtitle: 'Günde 90+ dakika yoğun deneme ve kamp maratonu',
              icon: PhosphorIconsBold.trendUp,
              isSelected: _selectedDailyGoal == 100,
              onTap: () => setState(() => _selectedDailyGoal = 100),
            ),
          ],
        );
    }
  }
}

class _SelectableOptionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _SelectableOptionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return TactileCard(
      onTap: onTap,
      backgroundColor: isSelected
          ? colorScheme.primaryContainer.withAlpha(70)
          : colorScheme.surface,
      borderColor: isSelected
          ? colorScheme.primary
          : colorScheme.outlineVariant.withAlpha(120),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: isSelected
                  ? colorScheme.primary
                  : colorScheme.surfaceContainerHighest,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 20,
              color: isSelected
                  ? colorScheme.onPrimary
                  : colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: isSelected
                        ? colorScheme.primary
                        : colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          PhosphorIcon(
            isSelected
                ? PhosphorIconsFill.checkCircle
                : PhosphorIconsBold.circle,
            size: 22,
            color: isSelected ? colorScheme.primary : colorScheme.outline,
          ),
        ],
      ),
    );
  }
}
