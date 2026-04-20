// Date: 15/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Card widget cho biên bản bàn giao / thu hồi tài sản - có nút duyệt

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../routes/route_names.dart';
import '../../data/datasource/models/personal_asset_model.dart';

class PersonalPropertyCard extends StatelessWidget {
  const PersonalPropertyCard({
    super.key,
    required this.item,
    this.onTap,
    this.isApproving = false,
    this.onApprove,
  });

  final PersonalPropertyItem item;
  final VoidCallback? onTap;
  final bool isApproving;
  final void Function(int approveType)? onApprove;

  static final _dateFmt = DateFormat('dd/MM/yyyy');

  String _formatDate(DateTime? d) {
    if (d == null) return '--/--/----';
    return _dateFmt.format(d.toLocal());
  }

  _ApproveStatus _approveStatus() {
    final personal = item.isApprovedPersonalProperty;
    final accountant = item.isApproveAccountant;

    if (personal! && accountant!) {
      return _ApproveStatus('Đã duyệt', AppColors.stateSuccessColor);
    }
    if (personal) {
      return _ApproveStatus('Chờ Kế toán', AppColors.stateWarningColor);
    }
    return _ApproveStatus('Chờ duyệt', AppColors.stateInfoColor);
  }

  @override
  Widget build(BuildContext context) {
    final si = _approveStatus();

    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          context.push(RouteNames.personalPropertyDetail, extra: item);
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderColor, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Header: Mã biên bản + Trạng thái duyệt ---
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.assetCode ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: AppColors.heading,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.assetCategoryText ?? '—',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.gray,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: si.color.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: si.color.withValues(alpha: 0.4),
                        width: 0.8,
                      ),
                    ),
                    child: Text(
                      si.label,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: si.color,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),
              const Divider(height: 1, color: AppColors.borderColor),
              const SizedBox(height: 12),

              // --- Ngày bàn giao ---
              _InfoRow(
                icon: Icons.calendar_today_outlined,
                label: 'Ngày bàn giao',
                value: _formatDate(item.implementationDate),
              ),

              const SizedBox(height: 8),

              // --- Người giao ---
              _InfoRow(
                icon: Icons.person_outline,
                label: 'Người giao',
                value: item.deliverName ?? '—',
              ),

              const SizedBox(height: 8),

              // --- Phòng ban giao / nhận ---
              _DepartmentRow(
                departmentDeliver: item.departmentDeliver,
                departmentReceiver: item.departmentReceiver,
              ),

              // --- Lý do ---
              if (item.assetNote != null && item.assetNote!.isNotEmpty) ...[
                const SizedBox(height: 8),
                _InfoRow(
                  icon: Icons.note_outlined,
                  label: 'Lý do',
                  value: item.assetNote!,
                ),
              ],

              const SizedBox(height: 14),

              // --- Trạng thái duyệt chi tiết ---
              _ApproveStatusSection(
                isApprovedHr: item.isApproved ?? false,
                isApprovedPersonal: item.isApprovedPersonalProperty ?? false,
                isApprovedAccountant: item.isApproveAccountant ?? false,
                isApproving: isApproving,
                onApprove: onApprove,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Approve Status Section
// ---------------------------------------------------------------------------

class _ApproveStatusSection extends StatelessWidget {
  const _ApproveStatusSection({
    required this.isApprovedHr,
    required this.isApprovedPersonal,
    required this.isApprovedAccountant,
    required this.isApproving,
    required this.onApprove,
  });

  final bool isApprovedHr;
  final bool isApprovedPersonal;
  final bool isApprovedAccountant;
  final bool isApproving;
  final void Function(int approveType)? onApprove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.borderColor, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Trạng thái duyệt',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppColors.heading,
            ),
          ),
          const SizedBox(height: 10),
          _ApproveRow(
            label: 'Hr',
            isApproved: isApprovedHr,
            isApproving: isApproving,
            onApprove: onApprove != null ? () => onApprove!(1) : null,
          ),
          const SizedBox(height: 8),
          _ApproveRow(
            label: 'Kế toán',
            isApproved: isApprovedAccountant,
            isApproving: isApproving,
            onApprove: onApprove != null ? () => onApprove!(2) : null,
          ),
        ],
      ),
    );
  }
}

class _ApproveRow extends StatelessWidget {
  const _ApproveRow({
    required this.label,
    required this.isApproved,
    required this.isApproving,
    this.onApprove,
  });

  final String label;
  final bool isApproved;
  final bool isApproving;
  final VoidCallback? onApprove;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isApproved ? Icons.check_circle : Icons.pending_outlined,
          size: 18,
          color: isApproved ? AppColors.stateSuccessColor : AppColors.gray,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: isApproved ? AppColors.stateSuccessColor : AppColors.gray,
            ),
          ),
        ),
        if (isApproved)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.stateSuccessColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Đã duyệt',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.stateSuccessColor,
              ),
            ),
          )
        else if (onApprove != null)
          SizedBox(
            height: 28,
            child: OutlinedButton(
              onPressed: isApproving ? null : onApprove,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                side: const BorderSide(color: AppColors.primaryERP, width: 1.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: isApproving
                  ? const SizedBox(
                      width: 14,
                      height: 14,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.primaryERP,
                      ),
                    )
                  : const Text(
                      'Duyệt',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryERP,
                      ),
                    ),
            ),
          ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

class _ApproveStatus {
  const _ApproveStatus(this.label, this.color);
  final String label;
  final Color color;
}

class _DepartmentRow extends StatelessWidget {
  const _DepartmentRow({
    required this.departmentDeliver,
    required this.departmentReceiver,
  });

  final String? departmentDeliver;
  final String? departmentReceiver;

  @override
  Widget build(BuildContext context) {
    if (departmentDeliver == null && departmentReceiver == null) {
      return const SizedBox.shrink();
    }

    return Row(
      children: [
        const Icon(Icons.business_outlined, size: 16, color: AppColors.gray),
        const SizedBox(width: 6),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 12.5, color: AppColors.gray),
              children: [
                if (departmentDeliver != null) ...[
                  const TextSpan(text: 'Giao: '),
                  TextSpan(
                    text: departmentDeliver ?? '—',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
                if (departmentDeliver != null && departmentReceiver != null)
                  const TextSpan(text: '  →  '),
                if (departmentReceiver != null) ...[
                  const TextSpan(text: 'Nhận: '),
                  TextSpan(
                    text: departmentReceiver ?? '—',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ],
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
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
        Icon(icon, size: 16, color: AppColors.gray),
        const SizedBox(width: 6),
        Text(
          '$label: ',
          style: const TextStyle(fontSize: 12.5, color: AppColors.gray),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
              color: AppColors.heading,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
