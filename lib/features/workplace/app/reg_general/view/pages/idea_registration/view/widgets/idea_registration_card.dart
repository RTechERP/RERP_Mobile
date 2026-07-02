import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/idea_registration_model.dart';

class IdeaRegistrationCard extends StatelessWidget {
  const IdeaRegistrationCard({
    super.key,
    required this.item,
    this.onTap,
  });

  final IdeaItem item;
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
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: accentColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.lightbulb_outline,
            size: 20,
            color: accentColor,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.description?.isNotEmpty == true
                    ? item.description!
                    : '—',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: accentColor,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              if (item.registerTypeName?.isNotEmpty == true) ...[
                const SizedBox(height: 2),
                Text(
                  item.registerTypeName!,
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
        _TinyBadge(
          text: _statusText,
          color: _statusColor,
        ),
      ],
    );
  }

  //---(_Card)---//
  Widget _buildBody(Color accentColor) {
    return Column(
      children: [
        _InfoRow(
          icon: Icons.person_outline,
          label: 'Người đề xuất',
          value: item.employeeName?.isNotEmpty == true
              ? item.employeeName!
              : '—',
          valueColor: item.employeeName?.isNotEmpty == true
              ? AppColors.heading
              : AppColors.hintText,
        ),
        const SizedBox(height: 6),
        _InfoRow(
          icon: Icons.business_outlined,
          label: 'Phòng ban',
          value: item.departmentOrganization?.isNotEmpty == true
              ? item.departmentOrganization!
              : '—',
          valueColor: item.departmentOrganization?.isNotEmpty == true
              ? AppColors.heading
              : AppColors.hintText,
        ),
      ],
    );
  }

  //---(_Card)---//
  Widget _buildFooter() {
    return Row(
      children: [
        _FooterItem(
          icon: Icons.calendar_today_outlined,
          label: 'Đăng ký',
          value: _fmtDt(item.dateRegister),
        ),
        const Spacer(),
        if (item.avgScore != null) ...[
          Icon(Icons.star, size: 14, color: AppColors.warning),
          const SizedBox(width: 3),
          Text(
            item.avgScore!.toStringAsFixed(1),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.warning,
            ),
          ),
          const SizedBox(width: 12),
        ],
        Icon(
          Icons.chevron_right,
          size: 18,
          color: AppColors.gray.withValues(alpha: 0.4),
        ),
      ],
    );
  }

  //---(_Helper)---//
  Widget _buildDivider() {
    return Container(
      height: 1,
      color: AppColors.borderColor.withValues(alpha: 0.5),
    );
  }

  String _fmtDt(DateTime? d) {
    if (d == null) return '--/--/----';
    return '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';
  }

  String get _statusText {
    if (item.isApproved == true) return 'Đã duyệt';
    if (item.isApprovedTBP == true) return 'TBP duyệt';
    return 'Chờ duyệt';
  }

  Color get _accentColor {
    if (item.isApproved == true) return AppColors.stateSuccessColor;
    if (item.isApprovedTBP == true) return AppColors.stateInfoColor;
    return AppColors.primaryERP;
  }

  Color get _statusColor {
    if (item.isApproved == true) return AppColors.stateSuccessColor;
    if (item.isApprovedTBP == true) return AppColors.stateInfoColor;
    return AppColors.warning;
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
          width: 100,
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
  });

  final IconData icon;
  final String label;
  final String value;

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
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: AppColors.hintText,
          ),
        ),
      ],
    );
  }
}
