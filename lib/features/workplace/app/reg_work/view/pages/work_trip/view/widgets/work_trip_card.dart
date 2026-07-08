import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/extensions/number_extension.dart';
import '../../data/datasource/models/work_trip_model.dart';

/// Card hiển thị một đơn công tác trong danh sách với style glassmorphism.
class WorkTripCard extends StatelessWidget {
  const WorkTripCard({
    super.key,
    required this.item,
    this.onTap,
    this.onLongPress,
    this.onCopy,
  });

  final WorkTripItem item;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final VoidCallback? onCopy;

  static final _dateFmt = DateFormat('dd/MM/yyyy');

  static bool canDelete(WorkTripItem item) {
    final tbpPending = item.isApprovedTbp != true && (item.statusTbp ?? 0) == 0;
    final hrPending = item.isApprovedHr != true && (item.statusHr ?? 0) == 0;
    return tbpPending && hrPending;
  }

  String _formatDate(DateTime? d) =>
      d == null ? '--/--/----' : _dateFmt.format(d.toLocal());

  ApprovalStatus _mapStatus(bool? isApproved, int? status, String? statusText) {
    if (isApproved == true) return ApprovalStatus.approved;
    if (isApproved == false && status == 2) return ApprovalStatus.cancelled;
    final text = (statusText ?? '').toLowerCase();
    if (text.contains('huỷ') ||
        text.contains('hủy') ||
        text.contains('cancel')) {
      return ApprovalStatus.cancelled;
    }
    if (status != null) {
      if (status == 1) return ApprovalStatus.approved;
      if (status == 2) return ApprovalStatus.cancelled;
    }
    return ApprovalStatus.pending;
  }

  ApprovalStatus _tbpStatus() =>
      _mapStatus(item.isApprovedTbp, item.statusTbp, item.statusTbpText);

  ApprovalStatus _hrStatus() =>
      _mapStatus(item.isApprovedHr, item.statusHr, item.statusHrText);

  @override
  Widget build(BuildContext context) {
    final tbp = _tbpStatus();
    final hr = _hrStatus();

    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
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
                      // Header: badges
                      Row(
                        children: [
                          const SizedBox(width: 8),
                          _ApprovalBadge(role: 'TBP', status: tbp),
                          const SizedBox(width: 6),
                          _ApprovalBadge(role: 'HR', status: hr),
                        ],
                      ),

                      const SizedBox(height: 14),
                      _TypeChip(
                        label: 'Loại',
                        value: item.typeName ?? '—',
                        color: AppColors.blueMain,
                      ),

                      const SizedBox(height: 14),

                      // Content row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _InfoRow(
                                  icon: Icons.calendar_today_outlined,
                                  label: 'Ngày',
                                  value: _formatDate(item.dayBussiness),
                                ),
                                if (item.location != null &&
                                    item.location!.isNotEmpty) ...[
                                  const SizedBox(height: 8),
                                  _InfoRow(
                                    icon: Icons.location_on_outlined,
                                    label: 'Địa điểm',
                                    value: item.location!,
                                  ),
                                ],
                                if (item.totalMoney != null) ...[
                                  const SizedBox(height: 8),
                                  _InfoRow(
                                    icon: Icons.attach_money_outlined,
                                    label: 'Tổng',
                                    value: '${item.totalMoney!.toInt().formatVND} đ',
                                    isBold: true,
                                    valueColor: AppColors.primaryERP,
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onCopy,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.gray.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.copy_outlined,
                        size: 20,
                        color: AppColors.gray,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TypeChip extends StatelessWidget {
  const _TypeChip({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

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
          Icon(Icons.category_outlined, size: 16, color: color),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 10,
                    color: AppColors.gray,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
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

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.isBold = false,
    this.valueColor,
  });

  final IconData icon;
  final String label;
  final String value;
  final bool isBold;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: AppColors.gray),
        const SizedBox(width: 6),
        Text(
          '$label: ',
          style: TextStyle(
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
              fontWeight: isBold ? FontWeight.w600 : FontWeight.w500,
              color: valueColor ?? AppColors.enableText,
              height: 1.2,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _ApprovalBadge extends StatelessWidget {
  const _ApprovalBadge({required this.role, required this.status});

  final String role;
  final ApprovalStatus status;

  String get _statusText {
    switch (status) {
      case ApprovalStatus.approved:
        return 'Đã duyệt';
      case ApprovalStatus.pending:
        return 'Chờ duyệt';
      case ApprovalStatus.cancelled:
        return 'Đã huỷ';
      case ApprovalStatus.prepare:
        return '';
    }
  }

  Color get _bgColor {
    switch (status) {
      case ApprovalStatus.approved:
        return AppColors.greenA500;
      case ApprovalStatus.pending:
        return AppColors.orangeA500;
      case ApprovalStatus.cancelled:
        return AppColors.redA500;
      case ApprovalStatus.prepare:
        return AppColors.gray.withValues(alpha: 0.15);
    }
  }

  Color get _textColor {
    switch (status) {
      case ApprovalStatus.prepare:
        return AppColors.enableText;
      default:
        return Colors.white;
    }
  }

  Color get _borderColor {
    switch (status) {
      case ApprovalStatus.approved:
        return AppColors.greenA400;
      case ApprovalStatus.pending:
        return AppColors.orangeA400;
      case ApprovalStatus.cancelled:
        return AppColors.redA400;
      case ApprovalStatus.prepare:
        return AppColors.gray.withValues(alpha: 0.3);
    }
  }

  @override
  Widget build(BuildContext context) {
    final label = _statusText.isEmpty ? role : '$role - $_statusText';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: _borderColor, width: 0.8),
        boxShadow: [
          BoxShadow(
            color: _bgColor.withValues(alpha: 0.3),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          color: _textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
