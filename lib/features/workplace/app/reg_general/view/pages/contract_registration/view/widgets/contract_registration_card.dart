import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/contract_registration_model.dart';

class ContractRegistrationCard extends StatelessWidget {
  const ContractRegistrationCard({super.key, required this.item, this.onTap});

  final ContractResponseItem item;
  final VoidCallback? onTap;

  static final _dateFmt = DateFormat('dd/MM/yyyy');

  String _formatDate(DateTime? d) {
    if (d == null) return '--/--/----';
    return _dateFmt.format(d.toLocal());
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(12),
      elevation: 0,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderColor, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCardTop(),
              _buildDivider(),
              _buildCardBody(),
              _buildCardFooter(),
            ],
          ),
        ),
      ),
    );
  }

  // ===== CARD TOP: header row =====
  Widget _buildCardTop() {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 10, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row 1: Document name + status badge
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  item.documentName?.isNotEmpty == true
                      ? item.documentName!
                      : '—',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: AppColors.heading,
                    height: 1.3,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              _StatusBadge(status: item.status, label: item.statusText),
            ],
          ),

          // Row 2: type chips + isScan
          const SizedBox(height: 6),
          Row(
            children: [
              Flexible(
                child: Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  children: [
                    if (item.documentType?.isNotEmpty == true)
                      _TypeChip(
                        label: item.documentType!,
                        color: AppColors.secondaryERP,
                        bgColor: AppColors.secondaryERP.withValues(alpha: 0.1),
                      ),
                    if (item.contractType?.isNotEmpty == true)
                      _TypeChip(
                        label: item.contractType!,
                        color: AppColors.primaryERP,
                        bgColor: AppColors.primaryERPlight.withValues(
                          alpha: 0.15,
                        ),
                      ),
                  ],
                ),
              ),
              if (item.isScan == true) ...[
                const SizedBox(width: 6),
                _TypeChip(
                  label: 'Đã scan',
                  color: AppColors.stateInfoColor,
                  bgColor: AppColors.stateInfoColor.withValues(alpha: 0.12),
                  icon: Icons.document_scanner_outlined,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  // ===== CARD BODY: info grid =====
  Widget _buildCardBody() {
    final hasRegister = item.employeeRegister?.isNotEmpty == true;
    final hasRecive = item.employeeRecive?.isNotEmpty == true;
    final hasDepartment = item.departmentName?.isNotEmpty == true;
    final hasTaxCompany = item.taxCompany?.isNotEmpty == true;

    // All 4: 2 columns grid
    if (hasRegister && hasRecive && hasDepartment && hasTaxCompany) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _MiniInfo(
                    icon: Icons.person_outline,
                    label: 'Người đăng ký',
                    value: item.employeeRegister!,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _MiniInfo(
                    icon: Icons.assignment_ind_outlined,
                    label: 'Người tiếp nhận',
                    value: item.employeeRecive!,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _MiniInfo(
                    icon: Icons.meeting_room_outlined,
                    label: 'Phòng ban',
                    value: item.departmentName!,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _MiniInfo(
                    icon: Icons.business_outlined,
                    label: 'Công ty thuế',
                    value: item.taxCompany!,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    // 2 people + department: people side-by-side, department full-width
    if (hasRegister && hasRecive && hasDepartment) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _MiniInfo(
                    icon: Icons.person_outline,
                    label: 'Người đăng ký',
                    value: item.employeeRegister!,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _MiniInfo(
                    icon: Icons.assignment_ind_outlined,
                    label: 'Người tiếp nhận',
                    value: item.employeeRecive!,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _MiniInfo(
              icon: Icons.meeting_room_outlined,
              label: 'Phòng ban',
              value: item.departmentName!,
            ),
          ],
        ),
      );
    }

    // 2 people + taxCompany: people side-by-side, taxCompany full-width
    if (hasRegister && hasRecive && hasTaxCompany) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _MiniInfo(
                    icon: Icons.person_outline,
                    label: 'Người đăng ký',
                    value: item.employeeRegister!,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _MiniInfo(
                    icon: Icons.assignment_ind_outlined,
                    label: 'Người tiếp nhận',
                    value: item.employeeRecive!,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _MiniInfo(
              icon: Icons.business_outlined,
              label: 'Công ty thuế',
              value: item.taxCompany!,
            ),
          ],
        ),
      );
    }

    // 2 people only: side-by-side
    if (hasRegister && hasRecive) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: _MiniInfo(
                icon: Icons.person_outline,
                label: 'Người đăng ký',
                value: item.employeeRegister!,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _MiniInfo(
                icon: Icons.assignment_ind_outlined,
                label: 'Người tiếp nhận',
                value: item.employeeRecive!,
              ),
            ),
          ],
        ),
      );
    }

    // department + taxCompany: 2 columns
    if (hasDepartment && hasTaxCompany) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: _MiniInfo(
                icon: Icons.meeting_room_outlined,
                label: 'Phòng ban',
                value: item.departmentName!,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _MiniInfo(
                icon: Icons.business_outlined,
                label: 'Công ty thuế',
                value: item.taxCompany!,
              ),
            ),
          ],
        ),
      );
    }

    // Single row cases
    if (hasRegister) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: _MiniInfo(
          icon: Icons.person_outline,
          label: 'Người đăng ký',
          value: item.employeeRegister!,
        ),
      );
    }
    if (hasRecive) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: _MiniInfo(
          icon: Icons.assignment_ind_outlined,
          label: 'Người tiếp nhận',
          value: item.employeeRecive!,
        ),
      );
    }
    if (hasDepartment) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: _MiniInfo(
          icon: Icons.meeting_room_outlined,
          label: 'Phòng ban',
          value: item.departmentName!,
        ),
      );
    }
    if (hasTaxCompany) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: _MiniInfo(
          icon: Icons.business_outlined,
          label: 'Công ty thuế',
          value: item.taxCompany!,
        ),
      );
    }

    return const SizedBox.shrink();
  }

  // ===== CARD FOOTER: date + quantity =====
  Widget _buildCardFooter() {
    final qty = item.documentQuantity != null
        ? '${item.documentQuantity} bản'
        : null;

    return Container(
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 12),
      decoration: const BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.calendar_today_outlined,
            size: 13,
            color: AppColors.label,
          ),
          const SizedBox(width: 4),
          Text(
            _formatDate(item.registedDate),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.heading,
            ),
          ),
          if (qty != null) ...[
            const SizedBox(width: 14),
            const Icon(Icons.copy_outlined, size: 13, color: AppColors.label),
            const SizedBox(width: 4),
            Text(
              qty,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.heading,
              ),
            ),
          ],
        ],
      ),
    );
  }

  //===== Divider with top/bottom padding =====
  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: SizedBox(
        height: 1,
        child: ColoredBox(color: AppColors.borderColor),
      ),
    );
  }
}

// ===== Small type chip =====
class _TypeChip extends StatelessWidget {
  const _TypeChip({
    required this.label,
    required this.color,
    required this.bgColor,
    this.icon,
  });

  final String label;
  final Color color;
  final Color bgColor;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 11, color: color),
            const SizedBox(width: 3),
          ],
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

// ===== Compact info cell =====
class _MiniInfo extends StatelessWidget {
  const _MiniInfo({
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
        Icon(icon, size: 15, color: AppColors.gray),
        const SizedBox(width: 6),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 10, color: AppColors.gray),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 1),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: AppColors.heading,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ===== Status badge =====
class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status, required this.label});

  final int? status;
  final String? label;

  _StatusColor _getColor() {
    switch (status) {
      case 1:
        return _StatusColor('Đã xác nhận', AppColors.stateSuccessColor);
      case 2:
        return _StatusColor('Từ chối', AppColors.alert);
      case 3:
        return _StatusColor('Đã hủy', AppColors.gray);
      default:
        return _StatusColor(
          label?.isNotEmpty == true ? label! : 'Chờ duyệt',
          AppColors.warning,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = _getColor();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: c.color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: c.color.withValues(alpha: 0.35), width: 0.8),
      ),
      child: Text(
        c.label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: c.color,
        ),
      ),
    );
  }
}

class _StatusColor {
  const _StatusColor(this.label, this.color);
  final String label;
  final Color color;
}
