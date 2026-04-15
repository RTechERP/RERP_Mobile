// Date: 15/04/2026 - Dev: admin
// Nội dung/Chức năng: Widget card hiển thị một dòng VPP trong chi tiết đơn đăng ký

import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/stationery_model.dart';

/// Card một dòng VPP trong màn chi tiết.
class StationeryDetailCard extends StatelessWidget {
  const StationeryDetailCard({
    super.key,
    required this.item,
    required this.index,
  });

  final StationeryDetailItem item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: STT + Tên VPP
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 28,
                height: 28,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primaryERP.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryERP,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.officeSupplyName ?? item.codeName ?? '-',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    if (item.code != null)
                      Text(
                        'Mã: ${item.code ?? ''}',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.gray,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                  ],
                ),
              ),
              // Badge vượt định mức
              if (item.exceedsLimit == true)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.warning.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: AppColors.warning.withValues(alpha: 0.55)),
                  ),
                  child: Text(
                    'Vượt định mức',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: AppColors.warning,
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(height: 12),
          Divider(color: AppColors.borderColor, height: 1),
          const SizedBox(height: 12),

          // Hàng thông tin: SL | ĐVT | SL nhận
          Row(
            children: [
              Expanded(
                child: _DetailCell(
                  label: 'Số lượng',
                  value: '${item.quantity ?? '-'}',
                ),
              ),
              Container(
                width: 1,
                height: 36,
                color: AppColors.borderColor,
              ),
              Expanded(
                child: _DetailCell(
                  label: 'ĐVT',
                  value: item.unit ?? '-',
                ),
              ),
              Container(
                width: 1,
                height: 36,
                color: AppColors.borderColor,
              ),
              Expanded(
                child: _DetailCell(
                  label: 'SL nhận',
                  value: '${item.quantity ?? '-'}',
                ),
              ),
            ],
          ),

          // Lý do vượt (nếu có)
          if (item.reason != null && item.reason!.isNotEmpty) ...[
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.warning_amber_rounded,
                    size: 16, color: AppColors.warning),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'Lý do vượt: ${item.reason}',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.warning,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],

          // Ghi chú (nếu có)
          if (item.note != null && item.note!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.note_outlined, size: 16, color: AppColors.gray),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    item.note!,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.gray,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

/// Ô hiển thị label + value.
class _DetailCell extends StatelessWidget {
  const _DetailCell({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: AppColors.gray,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
