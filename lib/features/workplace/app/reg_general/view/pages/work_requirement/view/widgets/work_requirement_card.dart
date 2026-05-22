// Date: 22/05/2026
// Work Requirement card - enterprise style

import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/work_requirement_model.dart';

class WorkRequirementCard extends StatelessWidget {
  const WorkRequirementCard({
    super.key,
    required this.item,
    this.onTap,
  });

  final WorkRequirementItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final accentColor = _accentColor;

    final inner = Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Left accent bar
            Container(
              width: 5,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(14),
                  bottomLeft: Radius.circular(14),
                ),
              ),
            ),
            // Main content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHeader(accentColor),
                    const SizedBox(height: 10),
                    _buildDivider(),
                    const SizedBox(height: 10),
                    _buildBody(accentColor),
                    const SizedBox(height: 10),
                    _buildFooter(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    if (onTap == null) return inner;
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: inner,
      ),
    );
  }

  //---(_Card)---//
  Widget _buildHeader(Color accentColor) {
    return Row(
      children: [
        // Icon container
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: accentColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.assignment_outlined,
            size: 20,
            color: accentColor,
          ),
        ),
        const SizedBox(width: 10),
        // Title + subtitle
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.numberRequest?.isNotEmpty == true
                    ? item.numberRequest!
                    : '—',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: accentColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (item.employeeName?.isNotEmpty == true) ...[
                const SizedBox(height: 2),
                Text(
                  item.employeeName!,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.gray,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
        // Status badge
        _TinyBadge(
          text: item.statusText?.isNotEmpty == true
              ? item.statusText!
              : _defaultStatusText,
          color: _statusColor,
        ),
      ],
    );
  }

  //---(_Card)---//
  Widget _buildBody(Color accentColor) {
    return _InfoRow(
      icon: Icons.approval_outlined,
      label: 'TBP duyệt',
      value: item.fullNameApprovedTBP?.isNotEmpty == true
          ? item.fullNameApprovedTBP!
          : '—',
      valueColor: item.fullNameApprovedTBP?.isNotEmpty == true
          ? AppColors.heading
          : AppColors.hintText,
    );
  }

  //---(_Card)---//
  Widget _buildFooter() {
    return Row(
      children: [
        _FooterItem(
          icon: Icons.calendar_today_outlined,
          label: 'Tạo',
          value: _fmtDt(item.createdDate),
        ),
        const SizedBox(width: 16),
        _FooterItem(
          icon: Icons.flag_outlined,
          label: 'Cần xử lý',
          value: _fmtDt(item.deadlineRequest),
          valueColor: _isOverdue ? AppColors.alert : null,
        ),
        const Spacer(),
        Icon(
          Icons.chevron_right,
          size: 18,
          color: AppColors.gray.withValues(alpha: 0.4),
        ),
      ],
    );
  }

  //---(_Color)---//
  bool get _isOverdue {
    if (item.deadlineRequest == null) return false;
    if (item.status == 1) return false;
    return item.deadlineRequest!.isBefore(DateTime.now());
  }

  //---(_Helper)---//
  Widget _buildDivider() {
    return Container(
      height: 1,
      color: AppColors.borderColor.withValues(alpha: 0.5),
    );
  }

  String _fmtDt(DateTime? d) {
    if (d == null) return '--/--/---- --:--';
    return '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';
  }

  //---(_Color)---//
  Color get _accentColor {
    switch (item.status) {
      case 1:
        return AppColors.stateSuccessColor;
      case 2:
        return AppColors.alert;
      case 3:
        return AppColors.gray;
      default:
        return AppColors.primaryERP;
    }
  }

  Color get _statusColor {
    switch (item.status) {
      case 1:
        return AppColors.stateSuccessColor;
      case 2:
        return AppColors.alert;
      case 3:
        return AppColors.gray;
      default:
        return AppColors.warning;
    }
  }

  String get _defaultStatusText {
    switch (item.status) {
      case 1:
        return 'Hoàn thành';
      case 2:
        return 'Từ chối';
      case 3:
        return 'Đã hủy';
      default:
        return 'Chờ duyệt';
    }
  }
}

// ===== Tiny badge =====
class _TinyBadge extends StatelessWidget {
  const _TinyBadge({required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final safeText = text.trim().isEmpty ? '-' : text.trim();
    return Container(
      constraints: const BoxConstraints(maxWidth: 90),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        safeText,
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
    );
  }
}

// ===== Info row =====
class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: AppColors.hintText),
        const SizedBox(width: 6),
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.hintText,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: valueColor ?? AppColors.heading,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

// ===== Footer item =====
class _FooterItem extends StatelessWidget {
  const _FooterItem({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 13, color: AppColors.hintText),
        const SizedBox(width: 4),
        Text(
          '$label: ',
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: AppColors.hintText,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: valueColor ?? AppColors.hintText,
          ),
        ),
      ],
    );
  }
}
