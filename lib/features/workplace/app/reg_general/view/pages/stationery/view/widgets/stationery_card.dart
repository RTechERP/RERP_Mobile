// Date: 15/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Card hiển thị một dòng đăng ký văn phòng phẩm

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/stationery_model.dart';

/// Badge trạng thái duyệt: "Đã duyệt", "Chờ duyệt", "Từ chối".
class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha:0.55)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

/// Một dòng thông tin: prefix mờ + value đậm.
class _InfoLine extends StatelessWidget {
  const _InfoLine({
    required this.prefix,
    required this.text,
    this.isEmphasis = false,
  });

  final String prefix;
  final String text;
  final bool isEmphasis;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          prefix,
          style: TextStyle(
            fontSize: 12,
            color: AppColors.gray,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black87,
              fontWeight: isEmphasis ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

/// Badge label theo trạng thái duyệt (Admin).
String _approvalTBPBadgeLabel(StationeryItem item) {
  final tbp = item.isApproved;
  if (tbp == true) return 'TBP - Đã duyệt';
  return 'TBP - Chờ duyệt';
}

String _approvalAdminBadgeLabel(StationeryItem item){
  final admin = item.isAdminApproved;
  if (admin == true) return 'Admin - Đã duyệt';
  return 'Admin - Chờ duyệt';
}

/// Màu badge theo trạng thái duyệt.
Color _approvalBadgeColor(StationeryItem item) {
  if (item.isAdminApproved == true) return AppColors.success;
  return AppColors.warning;
}

/// Card một dòng đăng ký văn phòng phẩm.
class StationeryCard extends StatelessWidget {
  const StationeryCard({
    super.key,
    required this.item,
    this.onTap,
  });

  final StationeryItem item;
  final VoidCallback? onTap;

  static final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');
  static final DateFormat _dateTimeFormat = DateFormat('HH:mm - dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    final badgeTBPLabel = _approvalTBPBadgeLabel(item);
    final badgeAdminLabel = _approvalAdminBadgeLabel(item);
    final badgeColor = _approvalBadgeColor(item);

    final dateApprovedDisplay = item.dateApproved != null
        ? _dateTimeFormat.format(item.dateApproved!)
        : '-';

    final dateRequestDisplay = item.dateRequest != null
        ? _dateFormat.format(item.dateRequest!)
        : '-';

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderColor),
          ),
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: badge trạng thái
              Row(
                children: [
                  _StatusBadge(
                    label: badgeAdminLabel,
                    color: badgeColor,
                  ),
                  const SizedBox(width: 8),
                  _StatusBadge(
                    label: badgeTBPLabel,
                    color: badgeColor,
                  ),

                ],
              ),
              const SizedBox(height: 12),
              // Body: thông tin chi tiết
              _InfoLine(
                prefix: 'Ngày TBP duyệt: ',
                text: dateApprovedDisplay,
              ),
              const SizedBox(height: 6),
              _InfoLine(
                prefix: 'Ngày đăng ký: ',
                text: dateRequestDisplay,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
