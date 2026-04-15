// Date: 13/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Card báo cáo tech - gọn, đẹp, swipe để xóa

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/features/workplace/app/reports/data/datasource/models/report_model.dart';

class TechReportCard extends StatelessWidget {
  const TechReportCard({
    super.key,
    required this.report,
    required this.onTap,
    required this.onDelete,
  });

  final ReportResponse report;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  String _formatDateFull(String? iso) {
    final dt = DateTime.tryParse(iso ?? '');
    if (dt == null) return '';
    final weekdays = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];
    return '${weekdays[dt.weekday - 1]}, ngày ${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year}';
  }

  @override
  Widget build(BuildContext context) {
    final progress = (report.percentComplete / 100).clamp(0.0, 1.0);
    final percent = (progress * 100).round();
    final progressColor = _progressColor(percent);
    final hasProject =
        report.projectCode?.isNotEmpty == true &&
        report.projectName?.isNotEmpty == true;

    final card = Opacity(
      opacity: hasProject ? 1.0 : 0.55,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade100, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
        child: InkWell(
          onTap: hasProject ? onTap : null,
          borderRadius: BorderRadius.circular(16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      // LEFT: date + project info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Date label
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  size: 13,
                                  color: AppColors.primaryERP,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  _formatDateFull(report.dateReport),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.primaryERP,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),

                            // Project code badge
                            if (report.projectCode?.isNotEmpty == true)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 6),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryERP.withValues(
                                      alpha: 0.1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    report.projectCode!,
                                    style: TextStyle(
                                      fontSize: 11.5,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.primaryERP,
                                    ),
                                  ),
                                ),
                              ),

                            // Project name
                            Text(
                              report.projectName ?? '—',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF1A1C1E),
                                height: 1.3,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),

                            const SizedBox(height: 8),

                            // Position + hours row
                            Row(
                              children: [
                                if (report.totalHours > 0) ...[
                                  if (report.positionName.isNotEmpty)
                                    Icon(
                                      Icons.schedule_outlined,
                                      size: 13,
                                      color: AppColors.label,
                                    ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${report.totalHours.toStringAsFixed(1)}h',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.label,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 14),

                      // Progress ring
                      Column(
                        children: [
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: CircularProgressIndicator(
                                    value: progress,
                                    strokeWidth: 6,
                                    backgroundColor: Colors.grey.shade200,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      progressColor,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '$percent%',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: progressColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // Swipe to delete — chỉ active khi có dữ liệu dự án
    if (!hasProject) return card;

    return Slidable(
      key: ValueKey(report.id),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.2,
        children: [
          SlidableAction(
            onPressed: (_) => onDelete(),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Xóa',
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
        ],
      ),
      child: card,
    );
  }

  Color _progressColor(int percent) {
    if (percent >= 80) return AppColors.success;
    if (percent >= 50) return AppColors.warning;
    if (percent > 0) return AppColors.alert;
    return Colors.grey;
  }
}
