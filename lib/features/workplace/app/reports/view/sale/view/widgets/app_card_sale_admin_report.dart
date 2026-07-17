import 'dart:ui';
import 'package:flutter/material.dart';

class SaleAdminReportItem {
  final int? id;
  final String? projectCode;
  final String? reportTypeName;
  final String? reportContent;
  final String? result;
  final String? planNextDay;
  final DateTime? dateReport;
  final String? employeeRequestFullName;
  final String? customerName;

  const SaleAdminReportItem({
    this.id,
    this.projectCode,
    this.reportTypeName,
    this.reportContent,
    this.result,
    this.planNextDay,
    this.dateReport,
    this.employeeRequestFullName,
    this.customerName,
  });
}

class AppCardSaleAdminReport extends StatelessWidget {
  final String? employeeFullName;
  final List<SaleAdminReportItem> reports;
  final Function(int id)? onReportTap;
  final Function(int id)? onDeleteReport;

  const AppCardSaleAdminReport({
    super.key,
    this.employeeFullName,
    this.reports = const [],
    this.onReportTap,
    this.onDeleteReport,
  });

  String _formatTime(DateTime? dt) {
    if (dt == null) return '--/--/----';
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(dt.day)}/${two(dt.month)}/${dt.year}';
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF667eea);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  primaryColor.withValues(alpha:0.15),
                  primaryColor.withValues(alpha:0.08),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withValues(alpha:0.2),
                width: 1.5,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Header: Employee Name + Count
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        primaryColor.withValues(alpha:0.1),
                        primaryColor.withValues(alpha:0.05),
                      ],
                    ),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              employeeFullName ?? 'Nhân viên',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '${reports.length} báo cáo',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: primaryColor.withValues(alpha:0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '${reports.length}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /// Reports List
                if (reports.isNotEmpty)
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(12),
                    itemCount: reports.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, idx) {
                      final report = reports[idx];
                      return _ReportCard(
                        report: report,
                        formatTime: _formatTime,
                        onTap: () => onReportTap?.call(report.id ?? 0),
                        onDelete: () => onDeleteReport?.call(report.id ?? 0),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ReportCard extends StatelessWidget {
  final SaleAdminReportItem report;
  final String Function(DateTime?) formatTime;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const _ReportCard({
    required this.report,
    required this.formatTime,
    this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(report.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.red.shade400,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (_) async {
        return await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Xoá báo cáo'),
                content: const Text('Bạn có muốn xoá báo cáo này?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text('Huỷ'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text('Xoá'),
                  ),
                ],
              ),
            ) ??
            false;
      },
      onDismissed: (_) => onDelete?.call(),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha:0.5),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withValues(alpha:0.3), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Date + Tags: Loại báo cáo - Mã dự án
              Row(
                children: [
                  if (report.dateReport != null) ...[
                    _TagChip(
                      icon: Icons.calendar_today_outlined,
                      text: formatTime(report.dateReport),
                      color: const Color(0xFF667eea),
                    ),
                    const SizedBox(width: 6),
                  ],
                  if (report.projectCode?.isNotEmpty == true) ...[
                    _TagChip(
                      icon: Icons.folder_outlined,
                      text: report.projectCode!,
                      color: const Color(0xFF11998e),
                    ),
                    const SizedBox(width: 6),
                  ],

                ],
              ),
              const SizedBox(height: 6),

              if (report.reportTypeName?.isNotEmpty == true)
                _TagChip(
                  icon: Icons.description_outlined,
                  text: report.reportTypeName!,
                  color: const Color(0xFFeb6434),
                ),

              const SizedBox(height: 10),

              /// Customer Name
              if (report.customerName?.isNotEmpty == true) ...[
                _InfoRow(
                  icon: Icons.business_outlined,
                  label: 'Khách hàng',
                  value: report.customerName!,
                ),
                const SizedBox(height: 6),
              ],

              /// Requester
              if (report.employeeRequestFullName?.isNotEmpty == true) ...[
                _InfoRow(
                  icon: Icons.person_2_outlined,
                  label: 'Người yêu cầu',
                  value: report.employeeRequestFullName!,
                ),
                const SizedBox(height: 6),
              ],

              /// Content
              if (report.reportContent?.isNotEmpty == true) ...[
                _InfoRow(
                  icon: Icons.article_outlined,
                  label: 'Nội dung',
                  value: report.reportContent!,
                ),
                const SizedBox(height: 6),
              ],

              if (report.result?.isNotEmpty == true) ...[
                _InfoRow(
                  icon: Icons.check_circle_outline,
                  label: 'Kết quả',
                  value: report.result!,
                ),
              ],

              /// Arrow
              Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 12,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  final IconData? icon;
  final String text;
  final Color color;

  const _TagChip({this.icon, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha:0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha:0.2), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 11, color: color),
            const SizedBox(width: 4),
          ],
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: color,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData? icon;
  final String label;
  final String value;

  const _InfoRow({this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (icon != null) ...[
          Icon(icon, size: 13, color: Colors.grey[600]),
          const SizedBox(width: 6),
        ],
        Text(
          '$label: ',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
          ),
        ),
        Flexible(
          child: Text(
            value,
            style: const TextStyle(fontSize: 12, color: Colors.black87),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
