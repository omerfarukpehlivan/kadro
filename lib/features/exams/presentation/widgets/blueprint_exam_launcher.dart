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
import 'package:kadro/shared/widgets/kadro_confirm_dialog.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Bir [MockExamBlueprint] şablonu için çevrimdışı indirme paket anahtarını döner.
String blueprintPackageIdFor(MockExamBlueprint blueprint) {
  switch (blueprint.id) {
    case 'gk_deneme_1':
    case 'b_gk_oturum_1':
      return 'exam_gk_prova_1';
    case 'gk_deneme_2':
    case 'b_gk_oturum_2':
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
  bool isBranchMock = false,
  VoidCallback? onCompleted,
  String? taskId,
}) async {
  if (blueprint.isComingSoon) {
    await KadroConfirmDialog.alert(
      context,
      icon: PhosphorIconsRegular.hourglassMedium,
      title: 'Çok Yakında',
      message:
          '${blueprint.title} kapsamındaki Matematik & Geometri soru havuzu hazırlanıyor. Şimdilik Genel Kültür Bölümü Denemesi veya Türkçe Branş Denemesi çözebilirsin.',
      buttonLabel: 'Tamam',
    );
    return;
  }

  final isUserPro = ref.read(userPreferencesProvider).isPro;
  if (blueprint.isProOnly && !isUserPro) {
    Navigator.of(context, rootNavigator: true).push(
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
      Navigator.of(context, rootNavigator: true).push(
        MaterialPageRoute(
          builder: (_) => QuizScreen(
            questions: questions ?? const [],
            blueprint: blueprint,
            examSelection: selection,
            applyExtraTime: applyExtraTime,
            isBranchMock: isBranchMock,
            customTitle: '$effectiveTitle (Çevrimdışı)',
            mode: QuizMode.exam,
            onCompleted: onCompleted,
            taskId: taskId,
          ),
        ),
      );
      return;
    }

    await KadroConfirmDialog.alert(
      context,
      icon: PhosphorIconsRegular.wifiSlash,
      title: 'İnternet Bağlantısı Yok',
      message: 'Bu denemeyi internetsiz çözebilmek için internet varken Kadro PRO ile indirmiş olmanız gerekir.',
      buttonLabel: 'Tamam',
      secondaryButtonLabel: "Kadro PRO'ya Geç",
      onSecondaryPressed: () {
        if (!context.mounted) return;
        Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(
            builder: (_) => const PaywallScreen(
              reasonMessage: 'Çevrimdışı soru ve deneme indirme özelliği Kadro PRO üyelerine özeldir.',
            ),
          ),
        );
      },
    );
    return;
  }

  final isFastLegacyGk =
      blueprint.scopeKey == 'lisans_gk' &&
      selection.family == KpssExamFamily.bGrubu &&
      selection.educationLevel == EducationLevel.lisans &&
      (blueprint.id.startsWith('gk_deneme_') ||
          blueprint.id.startsWith('practice_gk_') ||
          blueprint.id.startsWith('b_gk_oturum_') ||
          blueprint.id == 'b_gk_tarih_cografya_kamp' ||
          blueprint.id == 'b_gk_sprint_15');

  if (isFastLegacyGk) {
    Navigator.of(context, rootNavigator: true).push(
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
          isBranchMock: isBranchMock,
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
          taskId: taskId,
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
    await KadroConfirmDialog.alert(
      context,
      icon: PhosphorIconsRegular.hourglassMedium,
      title: 'Soru Havuzu Hazırlanıyor',
      message:
          '${blueprint.title} kapsamındaki bölüm soruları henüz yüklenmedi. Şimdilik Genel Kültür ortak oturumunu veya konu çalışmalarını kullanabilirsin.',
      buttonLabel: 'Tamam',
    );
    return;
  }

  if (generated.hasMissingSections) {
    final missingList = generated.missingSections.join(', ');
    final proceed = await KadroConfirmDialog.confirm(
      context,
      icon: PhosphorIconsRegular.warningCircle,
      title: 'Eksik Bölüm Uyarısı',
      message:
          'Bu denemedeki bazı bölümler ($missingList) için soru havuzu henüz yüklenmedi. Hazır olan ${generated.questions.length} soru ile devam etmek ister misin?',
      cancelLabel: 'Vazgeç',
      confirmLabel: 'Mevcut Sorularla Başlat',
    );
    if (!proceed || !context.mounted) return;
  }

  Navigator.of(context, rootNavigator: true).push(
    MaterialPageRoute(
      builder: (_) => QuizScreen(
        questions: generated.questions,
        prebuiltSectionRanges: generated.sectionRanges,
        blueprint: blueprint,
        examSelection: selection,
        applyExtraTime: applyExtraTime,
        isBranchMock: isBranchMock,
        customTitle: effectiveTitle,
        mode: QuizMode.exam,
        onCompleted: onCompleted,
        taskId: taskId,
      ),
    ),
  );
}
