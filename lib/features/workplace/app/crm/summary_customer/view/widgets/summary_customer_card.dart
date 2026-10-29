import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/summary_customer_model.dart';

/// Card hiển thị thông tin tổng hợp của một khách hàng trong danh sách CRM.
///
/// Gồm: Loại KH, Mã KH, Tên khách hàng, Địa chỉ, MST, Lĩnh vực,
/// Ngành nghề và Số dự án.
class SummaryCustomerCard extends StatelessWidget {
  const SummaryCustomerCard({super.key, required this.group});

  /// Thông tin khách hàng đã gom nhóm kèm số dự án.
  final SummaryCustomerGroup group;

  /// Hiển thị giá trị hoặc '-' khi rỗng.
  String _orDash(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? '-' : trimmed;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withValues(alpha: 0.9),
                Colors.white.withValues(alpha: 0.7),
              ],
            ),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.6),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryERP.withValues(alpha: 0.08),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Loại KH + Mã KH + Số dự án
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _InfoRow(
                            icon: Icons.badge_outlined,
                            label: 'Loại KH',
                            value: _orDash(group.typeName),
                          ),
                          const SizedBox(height: 6),
                          _InfoRow(
                            icon: Icons.tag,
                            label: 'Mã KH',
                            value: _orDash(group.customerCode),
                            valueColor: AppColors.primaryERP,
                            isBold: true,
                          ),
                        ],
                      ),
                    ),
                    _ProjectCountBadge(count: group.projectCount),
                  ],
                ),
                const SizedBox(height: 10),
                // Tên khách hàng
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Icon(
                        Icons.business_outlined,
                        size: 14,
                        color: AppColors.gray,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        _orDash(group.customerName),
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.enableText,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                // Địa chỉ
                _InfoRow(
                  icon: Icons.location_on_outlined,
                  label: 'Địa chỉ',
                  value: _orDash(group.address),
                  maxLines: null,
                ),
                const SizedBox(height: 6),
                // MST
                _InfoRow(
                  icon: Icons.receipt_long_outlined,
                  label: 'MST',
                  value: _orDash(group.taxCode),
                ),
                const SizedBox(height: 10),
                // Lĩnh vực + Ngành nghề
                Column(
                  children: [
                    _TypeChip(
                      label: 'Lĩnh vực',
                      value: _orDash(group.industriesNameVi),
                      color: AppColors.tealA400,
                      icon: Icons.category_outlined,
                    ),
                    const SizedBox(height: 8),
                    _TypeChip(
                      label: 'Ngành nghề',
                      value: _orDash(group.industryProduct),
                      color: AppColors.blueMain,
                      icon: Icons.inventory_2_outlined,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Badge hiển thị số dự án của khách hàng.
class _ProjectCountBadge extends StatelessWidget {
  const _ProjectCountBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primaryERP.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.work_outline,
            size: 14,
            color: AppColors.primaryERP,
          ),
          const SizedBox(width: 4),
          Text(
            '$count',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryERP,
              height: 1,
            ),
          ),
          const SizedBox(width: 4),
          const Text(
            'dự án',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryERP,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}

/// Chip hiển thị nhãn + giá trị ngắn.
class _TypeChip extends StatelessWidget {
  const _TypeChip({
    required this.label,
    required this.value,
    required this.color,
    required this.icon,
  });

  final String label;
  final String value;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: color.withValues(alpha: 0.15),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.gray,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.enableText,
                    height: 1,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Row hiển thị một thông tin dạng `label: value`.
class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
    this.isBold = false,
    this.maxLines = 2,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;
  final bool isBold;

  /// Số dòng tối đa của giá trị — `null` để co giãn theo độ dài text.
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Icon(icon, size: 14, color: AppColors.gray),
        ),
        const SizedBox(width: 6),
        Text(
          '$label: ',
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.gray,
            height: 1.2,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
              color: valueColor ?? AppColors.enableText,
              height: 1.2,
            ),
            maxLines: maxLines,
            overflow: maxLines == null ? null : TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
