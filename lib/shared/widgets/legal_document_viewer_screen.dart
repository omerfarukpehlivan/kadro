import 'package:flutter/material.dart';
import 'package:kadro/core/legal/legal_documents.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Kullanıcının Gizlilik Politikası, KVKK ve Kullanım Koşullarını internet olmasa dahi
/// uygulama içinde rahatça okuyabilmesini sağlayan resmi yasal belge görüntüleme ekranı.
class LegalDocumentViewerScreen extends StatelessWidget {
  final String title;
  final String content;
  final String lastUpdated;

  const LegalDocumentViewerScreen({
    super.key,
    required this.title,
    required this.content,
    this.lastUpdated = '9 Kasım 2026',
  });

  /// Gizlilik Politikası ve KVKK metnini açan yardımcı metot.
  static void showPrivacyPolicy(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const LegalDocumentViewerScreen(
          title: LegalDocuments.privacyTitle,
          content: LegalDocuments.privacyBody,
        ),
      ),
    );
  }

  /// Kullanım Koşulları ve Sözleşmeyi açan yardımcı metot.
  static void showTermsOfService(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const LegalDocumentViewerScreen(
          title: LegalDocuments.termsTitle,
          content: LegalDocuments.termsBody,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
          icon: const PhosphorIcon(PhosphorIconsRegular.arrowLeft, size: 22),
          onPressed: () => Navigator.of(context).pop(),
          tooltip: 'Geri',
        ),
      ),
      body: ResponsiveContentWrapper(
        maxWidth: 720,
        padding: EdgeInsets.zero,
        child: ListView(
          padding: AppSpacing.pagePadding(context),
          children: [
            TactileCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: colorScheme.primary.withAlpha(20),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: colorScheme.primary.withAlpha(60),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: PhosphorIcon(
                          PhosphorIconsFill.shieldCheck,
                          color: colorScheme.primary,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: colorScheme.onSurface,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Son Güncelleme: $lastUpdated',
                              style: textTheme.labelSmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(height: 1),
                  const SizedBox(height: 16),
                  SelectableText(
                    content,
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface,
                      height: 1.55,
                      letterSpacing: 0.15,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: colorScheme.outlineVariant),
                    ),
                    child: Row(
                      children: [
                        PhosphorIcon(
                          PhosphorIconsRegular.envelopeSimple,
                          size: 18,
                          color: colorScheme.primary,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Sorularınız için: ${LegalDocuments.contactEmail}',
                            style: textTheme.labelMedium?.copyWith(
                              color: colorScheme.onSurface,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
