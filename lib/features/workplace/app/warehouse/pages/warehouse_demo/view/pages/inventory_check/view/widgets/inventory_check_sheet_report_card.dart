import 'package:flutter/material.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/bloc/inventory_check_bloc.dart';

/// Bảng báo cáo tổng hợp phiếu kiểm kê.
///
/// 5 chỉ số: Tổng SP / Đã kiểm / Chưa kiểm / Khớp / Chênh lệch.
class InventoryCheckSheetReportCard extends StatelessWidget {
  const InventoryCheckSheetReportCard({super.key, required this.report});

  /// Số liệu báo cáo của phiếu.
  final InventoryCheckSheetReport report;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ===== TIÊU ĐỀ BẢNG =====
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: const BoxDecoration(
              color: AppColors.backgroundLight,
              borderRadius: BorderRadius.vertical(top: Radius.circular(13)),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.assessment_outlined,
                  size: 15,
                  color: AppColors.secondaryERP,
                ),
                SizedBox(width: 8),
                Text(
                  'Báo cáo kiểm kê',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.enableText,
                  ),
                ),
              ],
            ),
          ),

          /// ===== DÒNG CHỈ SỐ =====
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
            child: Row(
              children: [
                _ReportCell(
                  label: 'Tổng SP',
                  value: '${report.total}',
                  color: AppColors.heading,
                ),
                const _ReportDivider(),
                _ReportCell(
                  label: 'Đã kiểm',
                  value: '${report.counted}',
                  color: AppColors.secondaryERP,
                ),
                const _ReportDivider(),
                _ReportCell(
                  label: 'Chưa kiểm',
                  value: '${report.notCounted}',
                  color: AppColors.stateWarningColor,
                ),
                const _ReportDivider(),
                _ReportCell(
                  label: 'Khớp',
                  value: '${report.matched}',
                  color: AppColors.stateSuccessColor,
                ),
                const _ReportDivider(),
                _ReportCell(
                  label: 'Chênh lệch',
                  value: '${report.difference}',
                  color: report.difference > 0
                      ? AppColors.stateErrorColor
                      : AppColors.enableText,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Một ô chỉ số trong bảng báo cáo: giá trị đậm ở trên, nhãn ở dưới.
class _ReportCell extends StatelessWidget {
  const _ReportCell({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: color,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: const TextStyle(
              fontSize: 9.5,
              fontWeight: FontWeight.w500,
              color: AppColors.gray,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

/// Đường kẻ dọc giữa các ô chỉ số.
class _ReportDivider extends StatelessWidget {
  const _ReportDivider();

  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 28, color: AppColors.borderColor);
  }
}
