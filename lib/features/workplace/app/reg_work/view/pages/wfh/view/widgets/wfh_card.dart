import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../data/datasource/models/wfh_model.dart';

/// Card hiển thị một đơn WFH trong danh sách với style glassmorphism.
class WfhCard extends StatelessWidget {
  final WfhItem item;
  final VoidCallback? onTap;

  const WfhCard({super.key, required this.item, this.onTap});

  ApprovalStatus _mapBoolToStatus(bool? v) {
    if (v == true) return ApprovalStatus.approved;
    if (v == false) return ApprovalStatus.pending;
    return ApprovalStatus.prepare;
  }

  ApprovalStatus _mapHrStatus(int? statusHRNumber, String? statusHRText) {
    final text = (statusHRText ?? '').toLowerCase();

    if (statusHRNumber != null) {
      if (statusHRNumber == 1) return ApprovalStatus.approved;
      if (statusHRNumber == 0) return ApprovalStatus.pending;
    }

    if (text.contains('huỷ') ||
        text.contains('hủy') ||
        text.contains('cancel')) {
      return ApprovalStatus.cancelled;
    }
    if (text.contains('duyệt') && !text.contains('chờ')) {
      return ApprovalStatus.approved;
    }
    if (text.contains('chờ')) return ApprovalStatus.pending;
    return ApprovalStatus.prepare;
  }

  ApprovalStatus _bgdStatus() => _mapBoolToStatus(item.isApproved);

  ApprovalStatus _tbpStatus() {
    final v = item.isApproved;
    if (v == true) return ApprovalStatus.approved;
    if (v == false) return ApprovalStatus.pending;
    return ApprovalStatus.pending;
  }

  ApprovalStatus _hrStatus() =>
      _mapHrStatus(item.statusHRNumber, item.statusHRText);

  String _formatDate(DateTime? d) {
    if (d == null) return '--/--/----';
    return DateFormat('dd/MM/yyyy').format(d);
  }

  @override
  Widget build(BuildContext context) {
    final bgd = _bgdStatus();
    final tbp = _tbpStatus();
    final hr = _hrStatus();

    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
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
                  // Header: badges
                  Row(
                    children: [
                      const SizedBox(width: 8),
                      _ApprovalBadge(role: 'TBP', status: tbp),
                      const SizedBox(width: 6),
                      _ApprovalBadge(role: 'HR', status: hr),
                      const SizedBox(width: 6),
                      _ApprovalBadge(role: 'BGD', status: bgd),
                    ],
                  ),

                  const SizedBox(height: 14),

                  // Time range chip
                  _TypeChip(
                    label: 'Khoảng thời gian',
                    value: item.timeWFHText ?? '—',
                    color: AppColors.blueMain,
                  ),

                  const SizedBox(height: 14),

                  // Content
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
                              value: _formatDate(item.dateWFH),
                            ),
                            if ((item.contentWork ?? '').trim().isNotEmpty) ...[
                              const SizedBox(height: 8),
                              _InfoRow(
                                icon: Icons.work_outline,
                                label: 'ND/KH công việc',
                                value: item.contentWork!,
                              ),
                            ],
                            if ((item.reason ?? '').trim().isNotEmpty) ...[
                              const SizedBox(height: 8),
                              _InfoRow(
                                icon: Icons.note_outlined,
                                label: 'Lý do',
                                value: item.reason!,
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
          Icon(Icons.schedule_outlined, size: 16, color: color),
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
  });

  final IconData icon;
  final String label;
  final String value;

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
              fontWeight: FontWeight.w500,
              color: AppColors.enableText,
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
