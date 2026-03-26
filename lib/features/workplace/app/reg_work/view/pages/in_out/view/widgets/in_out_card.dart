import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../features/workplace/app/reg_work/view/pages/in_out/data/datasource/models/in_out_model.dart';

class InOutCard extends StatelessWidget {
  final InOutItem item;
  final VoidCallback? onTap;

  const InOutCard({
    super.key,
    required this.item,
    this.onTap,
  });

  ApprovalStatus _mapBoolToStatus(bool? v) {
    if (v == true) return ApprovalStatus.approved;
    if (v == false) return ApprovalStatus.pending;
    return ApprovalStatus.prepare;
  }

  ApprovalStatus _mapHrStatus(int? statusHRNumber, String? statusHRText) {
    final text = (statusHRText ?? '').toLowerCase();

    // Heuristic: nếu API trả số rõ ràng thì ưu tiên số.
    if (statusHRNumber != null) {
      if (statusHRNumber == 1) return ApprovalStatus.approved;
      if (statusHRNumber == 0) return ApprovalStatus.pending;
      // Không chắc contract BE về giá trị cancelled; dùng fallback theo text.
    }

    if (text.contains('huỷ') || text.contains('hủy') || text.contains('cancel')) {
      return ApprovalStatus.cancelled;
    }
    if (text.contains('duyệt') && !text.contains('chờ')) {
      return ApprovalStatus.approved;
    }
    if (text.contains('chờ')) return ApprovalStatus.pending;
    return ApprovalStatus.prepare;
  }

  ApprovalStatus _seniorStatus() => _mapBoolToStatus(item.isApproved);
  /// TBP: nếu BE trả `null` cho `IsApprovedTP` thì coi như đang "Chờ duyệt".
  ApprovalStatus _tbpStatus() {
    final v = item.isApprovedTP;
    if (v == true) return ApprovalStatus.approved;
    if (v == false) return ApprovalStatus.pending;
    return ApprovalStatus.pending;
  }
  ApprovalStatus _hrStatus() => _mapHrStatus(item.statusHRNumber, item.statusHRText);

  String _formatDate(DateTime? d) {
    if (d == null) return '--/--/----';
    return DateFormat('dd/MM/yyyy').format(d);
  }

  String _formatTime(DateTime? d) {
    if (d == null) return '--:--';
    return DateFormat('HH:mm').format(d);
  }

  @override
  Widget build(BuildContext context) {
    final senior = _seniorStatus();
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
                        Text(
                          'Loại: ${item.typeText ?? '--'}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text('Ngày: ${_formatDate(item.dateStart)}'),
                        const SizedBox(height: 4),
                        Text(
                          'Giờ: ${_formatTime(item.dateStart)} - ${_formatTime(item.dateEnd)}',
                        ),
                        if ((item.reason ?? '').trim().isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text('Lý do: ${item.reason}'),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  _RoleBadges(
                    senior: senior,
                    tbp: tbp,
                    hr: hr,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleBadges extends StatelessWidget {
  final ApprovalStatus senior;
  final ApprovalStatus tbp;
  final ApprovalStatus hr;

  const _RoleBadges({
    required this.senior,
    required this.tbp,
    required this.hr,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _RoleBadge(role: 'Senior', status: senior),
        const SizedBox(height: 6),
        _RoleBadge(role: 'TBP', status: tbp),
        const SizedBox(height: 6),
        _RoleBadge(role: 'HR', status: hr),
      ],
    );
  }
}

class _RoleBadge extends StatelessWidget {
  final String role;
  final ApprovalStatus status;

  const _RoleBadge({
    required this.role,
    required this.status,
  });

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

