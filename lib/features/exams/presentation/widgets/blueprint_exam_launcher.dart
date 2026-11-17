import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadro/core/services/offline_download_service.dart';
import 'package:kadro/features/exams/data/models/exam_selection.dart';
import 'package:kadro/features/exams/data/models/mock_exam_blueprint.dart';
import 'package:kadro/features/profile/data/user_preferences_notifier.dart';
import 'package:kadro/features/profile/presentation/paywall_screen.dart';
import 'package:kadro/features/quiz/data/models/quiz_mode.dart';
import 'package:kadro/features/quiz/data/question_repository.dart';
import 'package:kadro/features/quiz/presentation/quiz_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Bir [MockExamBlueprint] şablonu için çevrimdışı indirme paket anahtarını döner.
String blueprintPackageIdFor(MockExamBlueprint blueprint) {
  switch (blueprint.id) {
    case 'gk_deneme_1':
      return 'exam_gk_prova_1';
    case 'gk_deneme_2':
      return 'exam_gk_prova_2';
    case 'gk_deneme_3':
      return 'exam_gk_prova_3';
    case 'b_gk_tarih_cografya_kamp':
      return 'exam_tarih_cografya_kamp';
    case 'b_gk_sprint_15':
      return 'exam_hizli_mola';
    default:
      return 'exam_${blueprint.id}';
  }
}

/// Deneme sınavı başlatılmadan önce PRO erişimi, çevrimdışı durum ve çok bölümlü
/// şablonlarda soru havuzu doluluk kontrolünü ortak yöneten yardımcı.
///
/// Angular/Web Karşılığı: Denemeye girmeden ön koşulları (`ProGuard`, `PoolReadyGuard`)
/// çalıştıran paylaşımlı navigasyon servisi (`ExamLauncherService`).
Future<void> launchBlueprintExamWithGuard({
  required BuildContext context,
  required WidgetRef ref,
  required MockExamBlueprint blueprint,
  required ExamSelection selection,
  String? customTitle,
  bool? applyExtraTime,
  VoidCallback? onCompleted,
}) async {
  final isUserPro = ref.read(userPreferencesProvider).isPro;
  if (blueprint.isProOnly && !isUserPro) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PaywallScreen(
          reasonMessage:
              '${blueprint.title} ve tüm Türkiye Geneli KPSS Deneme Sınavları Kadro PRO üyelerine özeldir.',
        ),
      ),
    );
    return;
  }

  final packageId = blueprintPackageIdFor(blueprint);
  final effectiveTitle = customTitle ?? blueprint.title;
  final isOnline = ref.read(isOnlineProvider);
  final isDownloaded = ref.read(downloadedPackagesProvider).contains(packageId);

  if (!isOnline) {
    if (isDownloaded) {
      final questions = await ref
          .read(offlineDownloadServiceProvider)
          .getDownloadedQuestions(packageId);
      if (!context.mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => QuizScreen(
            questions: questions ?? const [],
            blueprint: blueprint,
            examSelection: selection,
            applyExtraTime: applyExtraTime,
            customTitle: '$effectiveTitle (Çevrimdışı)',
            mode: QuizMode.exam,
            onCompleted: onCompleted,
          ),
        ),
      );
      return;
    }

    await showDialog<void>(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        title: const Row(
          children: [
            PhosphorIcon(PhosphorIconsRegular.wifiSlash),
            SizedBox(width: 8),
            Expanded(child: Text('İnternet Bağlantısı Yok')),
          ],
        ),
        content: const Text(
          'Bu denemeyi internetsiz çözebilmek için internet varken Kadro PRO ile indirmiş olmanız gerekir.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogCtx).pop(),
            child: const Text('Tamam'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(dialogCtx).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const PaywallScreen(
                    reasonMessage: 'Çevrimdışı soru ve deneme indirme özelliği Kadro PRO üyelerine özeldir.',
                  ),
                ),
              );
            },
            child: const Text("Kadro PRO'ya Geç"),
          ),
        ],
      ),
    );
    return;
  }

  final isFastLegacyGk =
      blueprint.scopeKey == 'lisans_gk' &&
      selection.family == KpssExamFamily.bGrubu &&
      selection.bGroupProfile == BGroupProfile.onlyGk &&
      (blueprint.id.startsWith('gk_deneme_') ||
          blueprint.id.startsWith('practice_gk_') ||
          blueprint.id == 'b_gk_tarih_cografya_kamp' ||
          blueprint.id == 'b_gk_sprint_15');

  if (isFastLegacyGk) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => QuizScreen(
          mockExamNumber:
              blueprint.id == 'b_gk_tarih_cografya_kamp' ||
                  blueprint.id == 'b_gk_sprint_15'
              ? null
              : (blueprint.mockNumber ?? 1),
          blueprint:
              blueprint.id == 'b_gk_tarih_cografya_kamp' ||
                  blueprint.id == 'b_gk_sprint_15'
              ? null
              : blueprint,
          examSelection: selection,
          applyExtraTime: applyExtraTime,
          examDuration: blueprint.resolveDuration(
            selection,
            applyExtraTime: applyExtraTime,
          ),
          limit: blueprint.id == 'practice_gk_mini' ? 20 : null,
          customTitle: effectiveTitle,
          mode: QuizMode.exam,
          fetchAllFromPool:
              blueprint.id == 'b_gk_tarih_cografya_kamp' ||
              blueprint.id == 'b_gk_sprint_15',
          onCompleted: onCompleted,
        ),
      ),
    );
    return;
  }

  final generated = await ref
      .read(questionRepositoryProvider)
      .generateMockExamFromBlueprint(blueprint, selection: selection);
  if (!context.mounted) return;

  if (generated.questions.isEmpty) {
    await showDialog<void>(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        title: const Row(
          children: [
            PhosphorIcon(PhosphorIconsRegular.hourglassMedium),
            SizedBox(width: 8),
            Expanded(child: Text('Soru Havuzu Hazırlanıyor')),
          ],
        ),
        content: Text(
          '${blueprint.title} kapsamındaki bölüm soruları henüz yüklenmedi. Şimdilik Genel Kültür ortak oturumunu veya konu çalışmalarını kullanabilirsin.',
        ),
        actions: [
          FilledButton(
            onPressed: () => Navigator.of(dialogCtx).pop(),
            child: const Text('Tamam'),
          ),
        ],
      ),
    );
    return;
  }

  if (generated.hasMissingSections) {
    final missingList = generated.missingSections.join(', ');
    final proceed = await showDialog<bool>(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        title: const Row(
          children: [
            PhosphorIcon(PhosphorIconsRegular.warningCircle),
            SizedBox(width: 8),
            Expanded(child: Text('Eksik Bölüm Uyarısı')),
          ],
        ),
        content: Text(
          'Bu denemedeki bazı bölümler ($missingList) için soru havuzu henüz yüklenmedi. Hazır olan ${generated.questions.length} soru ile devam etmek ister misin?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogCtx).pop(false),
            child: const Text('Vazgeç'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogCtx).pop(true),
            child: const Text('Mevcut Sorularla Başlat'),
          ),
        ],
      ),
    );
    if (proceed != true || !context.mounted) return;
  }

  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => QuizScreen(
        questions: generated.questions,
        prebuiltSectionRanges: generated.sectionRanges,
        blueprint: blueprint,
        examSelection: selection,
        applyExtraTime: applyExtraTime,
        customTitle: effectiveTitle,
        mode: QuizMode.exam,
        onCompleted: onCompleted,
      ),
    ),
  );
}
