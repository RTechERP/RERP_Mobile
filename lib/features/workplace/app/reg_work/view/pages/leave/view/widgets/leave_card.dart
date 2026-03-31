import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/enums/index.dart';
import '../../data/datasource/models/leave_model.dart';
import 'leave_add_constants.dart';

/// Card đơn nghỉ (layout tương tự [WfhCard]): nội dung + badge BGD / HR / TBP.
class LeaveCard extends StatelessWidget {
  const LeaveCard({
    super.key,
    required this.item,
    this.onTap,
    this.showEmployee = false,
  });

  final LeaveItem item;
  final VoidCallback? onTap;
  /// Admin / HR: hiển thị thêm dòng tên nhân viên trên card.
  final bool showEmployee;

  static final _dateFmt = DateFormat('dd/MM/yyyy');

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

  ApprovalStatus _hrStatus() {
    if (item.isApprovedHR == true) return ApprovalStatus.approved;
    return _mapHrStatus(item.statusHRNumber, item.statusHRText);
  }

  /// TBP: `IsApprovedTP`; null → chờ duyệt.
  ApprovalStatus _tbpStatus() {
    final v = item.isApprovedTP;
    if (v == true) return ApprovalStatus.approved;
    if (v == false) return ApprovalStatus.pending;
    return ApprovalStatus.pending;
  }

  String _formatDate(DateTime? d) {
    if (d == null) return '--/--/----';
    return _dateFmt.format(d.toLocal());
  }

  String _employeeLine() {
    final code = item.code?.trim() ?? '';
    final name = item.fullName?.trim() ?? '';
    if (code.isNotEmpty && name.isNotEmpty) return '$code - $name';
    if (name.isNotEmpty) return name;
    if (code.isNotEmpty) return code;
    return 'Nhân viên';
  }

  String _typeLine() {
    final t = item.typeText?.trim();
    if (t != null && t.isNotEmpty) return t;
    final code = item.type ?? item.typeIsReal;
    if (code != null) {
      for (final o in kLeaveTypeOptions) {
        if (o.value == code) return o.label;
      }
    }
    return 'Loại nghỉ';
  }

  String _timeOnLeaveLine() {
    final t = item.timeOnLeaveText?.trim();
    if (t != null && t.isNotEmpty) return t;
    final code = item.timeOnLeave;
    for (final o in kLeaveSessionOptions) {
      if (o.value == code) return o.label;
    }
    return '—';
  }

  @override
  Widget build(BuildContext context) {
    final hr = _hrStatus();
    final tbp = _tbpStatus();

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (showEmployee) ...[
                          Text(
                            _employeeLine(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 4),
                        ],
                        Text(
                          'Loại nghỉ: ${_typeLine()}',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4),
                        Text('Từ ngày: ${_formatDate(item.startDate)}'),
                        const SizedBox(height: 4),
                        Text('Đến ngày: ${_formatDate(item.endDate)}'),
                        const SizedBox(height: 4),
                        Text('Thời gian nghỉ: ${_timeOnLeaveLine()}'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  _LeaveRoleBadges(hr: hr, tbp: tbp),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LeaveRoleBadges extends StatelessWidget {
  const _LeaveRoleBadges({
    // required this.bgd,
    required this.hr,
    required this.tbp,
  });

  // final ApprovalStatus bgd;
  final ApprovalStatus hr;
  final ApprovalStatus tbp;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // _LeaveRoleBadge(role: 'BGD', status: bgd),
        // const SizedBox(height: 6),
        _LeaveRoleBadge(role: 'HR', status: hr),
        const SizedBox(height: 6),
        _LeaveRoleBadge(role: 'TBP', status: tbp),
      ],
    );
  }
}

class _LeaveRoleBadge extends StatelessWidget {
  const _LeaveRoleBadge({required this.role, required this.status});

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
