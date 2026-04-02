import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/enums/index.dart';
import '../../data/datasource/models/overnight_model.dart';

/// Card hiển thị một đơn qua đêm trong danh sách.
class OvernightCard extends StatelessWidget {
  const OvernightCard({
    super.key,
    required this.item,
    this.onTap,
  });

  final OvernightItem item;
  final VoidCallback? onTap;

  static final _dateFmt = DateFormat('dd/MM/yyyy');
  static final _timeFmt = DateFormat('HH:mm');

  /// Có thể xoá / huỷ: cả TBP và HR đều chưa duyệt.
  static bool canDelete(OvernightItem item) {
    final tbpPending =
        (item.isApprovedTbp ?? 0) == 0;
    final hrPending =
        (item.isApprovedHr ?? 0) == 0;
    return tbpPending && hrPending;
  }

  String _formatDate(DateTime? d) =>
      d == null ? '--/--/----' : _dateFmt.format(d.toLocal());

  String _formatTime(DateTime? d) =>
      d == null ? '--:--' : _timeFmt.format(d.toLocal());

  ApprovalStatus _mapStatus(int? isApproved, String? statusText) {
    final text = (statusText ?? '').toLowerCase();
    if (text.contains('huỷ') || text.contains('hủy') || text.contains('cancel')) {
      return ApprovalStatus.cancelled;
    }
    if (isApproved == 1) return ApprovalStatus.approved;
    if (isApproved == 2) return ApprovalStatus.cancelled;
    if (isApproved == 0) return ApprovalStatus.pending;
    return ApprovalStatus.pending;
  }

  ApprovalStatus _tbpStatus() =>
      _mapStatus(item.isApprovedTbp, item.isApprovedTbpText);

  ApprovalStatus _hrStatus() =>
      _mapStatus(item.isApprovedHr, item.isApprovedHrText);

  @override
  Widget build(BuildContext context) {
    final tbp = _tbpStatus();
    final hr = _hrStatus();

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE0E0E0)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ngày: ${_formatDate(item.dateRegister)}'),
                    const SizedBox(height: 4),
                    Text(
                      'Thời gian: ${_formatTime(item.dateStart)} - ${_formatTime(item.dateEnd)}',
                    ),
                    if (item.workTime != null) ...[
                      const SizedBox(height: 4),
                      Text(
                          'Số giờ làm: ${item.workTime!.toStringAsFixed(2)}'),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 12),
              _OvernightRoleBadges(tbp: tbp, hr: hr),
            ],
          ),
        ),
      ),
    );
  }
}

class _OvernightRoleBadges extends StatelessWidget {
  const _OvernightRoleBadges({required this.tbp, required this.hr});

  final ApprovalStatus tbp;
  final ApprovalStatus hr;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _OvernightRoleBadge(role: 'TBP', status: tbp),
        const SizedBox(height: 6),
        _OvernightRoleBadge(role: 'HR', status: hr),
      ],
    );
  }
}

class _OvernightRoleBadge extends StatelessWidget {
  const _OvernightRoleBadge({required this.role, required this.status});

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
        return Colors.green;
      case ApprovalStatus.pending:
        return Colors.orange;
      case ApprovalStatus.cancelled:
        return Colors.red;
      case ApprovalStatus.prepare:
        return const Color(0xFFF5F7F8);
    }
  }

  Color get _textColor {
    switch (status) {
      case ApprovalStatus.prepare:
        return Colors.black87;
      default:
        return Colors.white;
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
