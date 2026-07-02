import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/widgets/form/form_left_border_card.dart';
import '../../../../data/datasource/models/report_model.dart';
class HrReportCard extends StatelessWidget {
  final ReportResponse report;
  final VoidCallback? onTap;

  const HrReportCard({
    super.key,
    required this.report,
    this.onTap,
  });

  String _formatDate(String? raw) {
    if (raw == null || raw.isEmpty) return '--/--/----';
    final dt = DateTime.tryParse(raw);
    if (dt == null) return '--/--/----';
    final t = dt.toLocal();
    return '${t.day.toString().padLeft(2, '0')}/'
        '${t.month.toString().padLeft(2, '0')}/'
        '${t.year}';
  }

  String _orDash(String? v) {
    if (v == null || v.trim().isEmpty) return '- Không có';
    return v.trim();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: FormLeftBorderCard(
          borderColor: AppColors.primaryERP,
          backgroundColor: Colors.white,
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header: Tên + Chức vụ | Ngày báo cáo
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          report.fullName,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.heading,
                          ),
                        ),
                        if (report.positionName.isNotEmpty) ...[
                          const SizedBox(height: 2),
                          Text(
                            report.positionName,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.gray,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primaryERP.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          size: 12,
                          color: AppColors.primaryERP,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _formatDate(report.dateReport),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryERP,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),
              const Divider(height: 1, color: AppColors.borderColor),
              const SizedBox(height: 12),

              /// Nội dung công việc
              _FieldRow(
                icon: Icons.assignment_outlined,
                iconColor: AppColors.stateErrorColor,
                label: 'Nội dung công việc',
                value: _orDash(report.mission),
              ),

              const SizedBox(height: 10),

              /// Kết quả công việc
              _FieldRow(
                icon: Icons.check_circle_outline,
                iconColor: AppColors.stateSuccessColor,
                label: 'Kết quả công việc',
                value: _orDash(report.results),
              ),

              const SizedBox(height: 10),

              /// Kế hoạch tiếp theo
              _FieldRow(
                icon: Icons.arrow_forward_ios,
                iconColor: AppColors.stateInfoColor,
                label: 'Kế hoạch tiếp theo',
                value: _orDash(report.planNextDay),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FieldRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;

  const _FieldRow({
    required this.icon,
    Color? iconColor,
    required this.label,
    required this.value,
  }) : iconColor = iconColor ?? AppColors.gray;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 13, color: iconColor),
            const SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: iconColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.text,
              height: 1.4,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
