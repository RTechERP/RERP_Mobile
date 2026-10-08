import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../data/datasource/models/summary_overtime_model.dart';

/// Card hiển thị một phiếu làm thêm trong danh sách summary.
class SummaryOvertimeCard extends StatelessWidget {
  const SummaryOvertimeCard({super.key, required this.item});

  final SummaryOvertimeItem item;

  static final _dateFmt = DateFormat('dd/MM/yyyy');
  static final _dateTimeFmt = DateFormat('HH:mm');

  /// Trạng thái duyệt cuối — dựa trên isApproved. null/false → "Chờ duyệt".
  ApprovalStatus get _approvalStatus {
    return item.isApproved == true
        ? ApprovalStatus.approved
        : ApprovalStatus.pending;
  }

  String _formatTime(DateTime? d) {
    if (d == null) return '--:--';
    return _dateTimeFmt.format(d.toLocal());
  }

  String _formatDate(DateTime? d) {
    if (d == null) return '--/--/----';
    return _dateFmt.format(d.toLocal());
  }

  String _hoursLine() {
    final h = item.timeReality;
    if (h == null) return '-';
    return h.toStringAsFixed(h.truncateToDouble() == h ? 0 : 1);
  }

  String? _costLine() {
    final c = item.costOvertime;
    if (c == null) return null;
    return '${_formatMoney(c)} đ';
  }

  String _formatMoney(double value) {
    final fixed = value.toStringAsFixed(0);
    final withSep = fixed.replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]}.',
    );
    return withSep;
  }

  @override
  Widget build(BuildContext context) {
    final approval = _approvalStatus;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        border: Border.all(
          color: AppColors.primaryERP.withValues(alpha: 0.06),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: AppColors.primaryERP.withValues(alpha: 0.03),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Hàng đầu: badge trạng thái + loại OT
            Row(
              children: [
                _ApprovalBadge(status: approval),
                const SizedBox(width: 8),
                if ((item.type?.trim().isNotEmpty ?? false))
                  _TypeTag(
                    icon: Icons.label_outline,
                    label: item.type!,
                    color: AppColors.primaryERP,
                  ),
                const Spacer(),
                if (item.timeReality != null)
                  _HoursHighlight(hours: _hoursLine()),
              ],
            ),
            const SizedBox(height: 12),
            // Nhân viên
            Row(
              children: [
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    (item.fullName?.trim().isNotEmpty == true)
                        ? item.fullName!
                        : '-',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.heading,
                      height: 1.2,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Thời gian bắt đầu / kết thúc
            if (item.timeStart != null || item.endTime != null)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    if (item.timeStart != null)
                      Expanded(
                        child: _TimeBlock(
                          icon: Icons.play_arrow_rounded,
                          iconColor: AppColors.greenA500,
                          label: 'Bắt đầu',
                          value:
                              '${_formatTime(item.timeStart)} • ${_formatDate(item.timeStart)}',
                        ),
                      ),
                    if (item.timeStart != null && item.endTime != null)
                      Container(
                        width: 1,
                        height: 28,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        color: AppColors.borderColor,
                      ),
                    if (item.endTime != null)
                      Expanded(
                        child: _TimeBlock(
                          icon: Icons.stop_rounded,
                          iconColor: AppColors.redA500,
                          label: 'Kết thúc',
                          value:
                              '${_formatTime(item.endTime)} • ${_formatDate(item.endTime)}',
                        ),
                      ),
                  ],
                ),
              ),
            // Chi phí
            if (_costLine() != null) ...[
              const SizedBox(height: 8),
              _CostRow(amount: _costLine()!),
            ],
            // Thông tin phụ: địa điểm, người duyệt
            if ((item.locationText?.isNotEmpty ?? false) ||
                (item.nguoiDuyet?.isNotEmpty ?? false)) ...[
              const SizedBox(height: 10),
              Container(
                height: 1,
                color: AppColors.borderColor.withValues(alpha: 0.5),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 16,
                runSpacing: 6,
                children: [
                  if (item.locationText?.isNotEmpty ?? false)
                    _MetaItem(
                      icon: Icons.location_on_outlined,
                      text: item.locationText!,
                    ),
                  if (item.nguoiDuyet?.isNotEmpty ?? false)
                    _MetaItem(
                      icon: Icons.verified_user_outlined,
                      text: 'Duyệt: ${item.nguoiDuyet!}',
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Badge thống kê giờ OT nổi bật ở góc phải header.
class _HoursHighlight extends StatelessWidget {
  const _HoursHighlight({required this.hours});
  final String hours;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFC800), Color(0xFFFF9C09)],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.schedule, size: 12, color: Colors.white),
          const SizedBox(width: 4),
          Text(
            '$hours giờ',
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}

/// Khối thời gian (bắt đầu / kết thúc) trong card.
class _TimeBlock extends StatelessWidget {
  const _TimeBlock({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: iconColor.withValues(alpha: 0.12),
          ),
          alignment: Alignment.center,
          child: Icon(icon, size: 14, color: iconColor),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 9,
                  color: AppColors.gray,
                  height: 1,
                  letterSpacing: 0.3,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: AppColors.heading,
                  height: 1.1,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Dòng hiển thị chi phí OT.
class _CostRow extends StatelessWidget {
  const _CostRow({required this.amount});
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.greenA500.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.greenA500.withValues(alpha: 0.2),
          width: 0.8,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.greenA500.withValues(alpha: 0.18),
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.payments_outlined,
              size: 13,
              color: AppColors.greenA500,
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'Chi phí OT',
            style: TextStyle(
              fontSize: 11,
              color: AppColors.gray,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Text(
            amount,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w800,
              color: AppColors.greenA500,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}

/// Tag loại OT (chip nhỏ ở header).
class _TypeTag extends StatelessWidget {
  const _TypeTag({
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color.withValues(alpha: 0.25),
          width: 0.8,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: color,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}

/// Meta item (địa điểm, người duyệt, ...).
class _MetaItem extends StatelessWidget {
  const _MetaItem({required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 13, color: AppColors.gray),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.enableText,
              fontWeight: FontWeight.w500,
              height: 1.2,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}

class _ApprovalBadge extends StatelessWidget {
  const _ApprovalBadge({required this.status});

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

  IconData get _icon {
    switch (status) {
      case ApprovalStatus.approved:
        return Icons.check_circle;
      case ApprovalStatus.pending:
        return Icons.schedule;
      case ApprovalStatus.cancelled:
        return Icons.cancel;
      case ApprovalStatus.prepare:
        return Icons.help_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(_icon, size: 11, color: _textColor),
          const SizedBox(width: 4),
          Text(
            _statusText,
            style: TextStyle(
              fontSize: 10,
              color: _textColor,
              fontWeight: FontWeight.w700,
              height: 1,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}