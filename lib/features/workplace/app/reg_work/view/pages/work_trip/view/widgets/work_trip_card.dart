import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/extensions/number_extension.dart';
import '../../data/datasource/models/work_trip_model.dart';

class WorkTripCard extends StatelessWidget {
  const WorkTripCard({
    super.key,
    required this.item,
    this.onTap,
    this.onLongPress,
  });

  final WorkTripItem item;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

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

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
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
                    Text(
                      'Loại: ${item.typeName ?? '—'}',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Text('Ngày: ${_formatDate(item.dayBussiness)}'),
                    if (item.location != null &&
                        item.location!.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text('Địa điểm: ${item.location}'),
                    ],
                    // if (item.vehicleName != null &&
                    //     item.vehicleName!.isNotEmpty) ...[
                    //   const SizedBox(height: 4),
                    //   Text('Phương tiện: ${item.vehicleName}'),
                    // ],
                    if (item.totalMoney != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        'Tổng: ${item.totalMoney!.toInt().formatVND} đ',
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _WorkTripBadge(role: 'TBP', status: tbp),
                  const SizedBox(height: 6),
                  _WorkTripBadge(role: 'HR', status: hr),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WorkTripBadge extends StatelessWidget {
  const _WorkTripBadge({required this.role, required this.status});

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
