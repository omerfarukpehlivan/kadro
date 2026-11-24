import 'package:flutter/material.dart';
import 'package:kadro/shared/widgets/kadro_badge.dart';
import 'package:kadro/core/theme/app_spacing.dart';
import 'package:kadro/core/utils/responsive_layout.dart';
import 'package:kadro/features/reports/data/models/question_report.dart';
import 'package:kadro/features/reports/data/question_report_repository.dart';
import 'package:kadro/shared/widgets/empty_state_view.dart';
import 'package:kadro/shared/widgets/page_header.dart';
import 'package:kadro/shared/widgets/responsive_grid.dart';
import 'package:kadro/shared/widgets/math_text.dart';
import 'package:kadro/shared/widgets/tactile_card.dart';
import 'package:kadro/shared/widgets/tugrul_avatar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// İçerik editörü ve yönetici için bildirilen hatalı soruları inceleme ekranı (TASK-47).
class AdminReportsScreen extends StatefulWidget {
  final QuestionReportRepository repository;

  const AdminReportsScreen({
    super.key,
    this.repository = const QuestionReportRepository(),
  });

  @override
  State<AdminReportsScreen> createState() => _AdminReportsScreenState();
}

class _AdminReportsScreenState extends State<AdminReportsScreen> {
  late Future<List<QuestionReport>> _reportsFuture;

  @override
  void initState() {
    super.initState();
    _loadReports();
  }

  void _loadReports() {
    setState(() {
      _reportsFuture = widget.repository.fetchPendingReports();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hatalı Soru Raporları'),
        actions: [
          IconButton(
            icon: const PhosphorIcon(
              PhosphorIconsRegular.arrowsCounterClockwise,
              size: 18,
            ),
            tooltip: 'Yenile',
            onPressed: _loadReports,
          ),
        ],
      ),
      body: FutureBuilder<List<QuestionReport>>(
        future: _reportsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return EmptyStateView(
              mascotMood: TugrulMood.detective,
              icon: PhosphorIconsRegular.warningCircle,
              title: 'Raporlar yüklenemedi',
              description: 'Bağlantı veya sunucu yanıtı alınamadı. Tekrar deneyebilirsin.',
              actionLabel: 'Tekrar Dene',
              onAction: _loadReports,
            );
          }

          final reports = snapshot.data ?? [];

          if (reports.isEmpty) {
            return const EmptyStateView(
              mascotMood: TugrulMood.detective,
              icon: PhosphorIconsRegular.shieldCheck,
              title: 'Henüz bildirilmiş soru yok',
              description: 'Kullanıcılar test esnasında bayrak butonuna basarak soru bildirdiğinde burada listelenir.',
            );
          }

          final isSplitPane = ResponsiveBreakpoints.usesSplitPane(context);

          Widget buildReportCard(
            QuestionReport report, {
            EdgeInsetsGeometry margin = const EdgeInsets.only(bottom: 12),
          }) {
            return Padding(
              padding: margin,
              child: TactileCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 8,
                        runSpacing: 6,
                        children: [
                          KadroBadge(
                            label: '${report.lesson} · ${report.topic}',
                            tone: KadroBadgeTone.error,
                          ),
                          Text(
                            report.testTitle,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: [
                          PhosphorIcon(
                            PhosphorIconsBold.warning,
                            size: 15,
                            color: colorScheme.error,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              report.reason,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSurface,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (report.userNote != null &&
                        report.userNote!.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        'Kullanıcı Notu: "${report.userNote}"',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontStyle: FontStyle.italic,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                    const SizedBox(height: 10),
                    Text(
                      'Soru Metni:',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 4),
                    MathText(
                      report.questionText,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          final headerWidget = Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: PageHeader(
              icon: PhosphorIconsRegular.warningCircle,
              title: 'Soru Denetim Masası',
              subtitle:
                  'Toplam ${reports.length} adet incelenmeyi bekleyen bildirim bulunuyor.',
            ),
          );

          return ResponsiveContentWrapper(
            maxWidth: isSplitPane ? 1200 : 720,
            padding: EdgeInsets.zero,
            child: RefreshIndicator(
              onRefresh: () async => _loadReports(),
              child: Scrollbar(
                child: isSplitPane
                    ? SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: AppSpacing.pagePadding(context),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            headerWidget,
                            ResponsiveGrid(
                              columns: 2,
                              spacing: 12,
                              runSpacing: 12,
                              children: [
                                for (final report in reports)
                                  buildReportCard(
                                    report,
                                    margin: EdgeInsets.zero,
                                  ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        padding: AppSpacing.pagePadding(context),
                        itemCount: reports.length + 1,
                        itemBuilder: (context, index) {
                          if (index == 0) return headerWidget;
                          return buildReportCard(reports[index - 1]);
                        },
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
