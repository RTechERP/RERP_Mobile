// Date: 14/04/2026 - Dev: Claude
// Nội dung/Chức năng: Card widget cho biên bản bàn giao / thu hồi tài sản

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/personal_asset_model.dart';

class PersonalPropertyCard extends StatelessWidget {
  const PersonalPropertyCard({
    super.key,
    required this.item,
    this.onTap,
  });

  final PersonalPropertyItem item;
  final VoidCallback? onTap;

  static final _dateFmt = DateFormat('dd/MM/yyyy');

  String _formatDate(DateTime? d) {
    if (d == null) return '--/--/----';
    return _dateFmt.format(d.toLocal());
  }

  /// Trạng thái duyệt: kết hợp IsApproved + IsApprovedPersonalProperty + IsApproveAccountant.
  _ApproveStatus _approveStatus() {
    final personal = item.isApprovedPersonalProperty ?? false;
    final accountant = item.isApproveAccountant ?? false;

    if (personal && accountant) {
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
        onTap: onTap,
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
                        // Mã biên bản
                        Text(
                          item.assetCode ?? '—',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: AppColors.heading,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Loại biên bản
                        if (item.assetCategoryText != null)
                          Text(
                            item.assetCategoryText!,
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.gray,
                            ),
                          ),
                      ],
                    ),
                  ),
                  // Trạng thái duyệt badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
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

              // --- Thông tin: Ngày bàn giao ---
              _InfoRow(
                icon: Icons.calendar_today_outlined,
                label: 'Ngày bàn giao',
                value: _formatDate(item.implementationDate),
              ),

              const SizedBox(height: 10),

              // --- Thông tin: Người giao ---
              _InfoRow(
                icon: Icons.person_outline,
                label: 'Người giao',
                value: item.deliverName ?? '—',
              ),

              const SizedBox(height: 10),

              // --- Thông tin: Người nhận ---
              _InfoRow(
                icon: Icons.person_pin_circle_outlined,
                label: 'Người nhận',
                value: _receiverText(),
              ),

              const SizedBox(height: 10),

              // --- Thông tin: Phòng ban liên quan ---
              Row(
                children: [
                  const Icon(
                    Icons.business_outlined,
                    size: 16,
                    color: AppColors.gray,
                  ),
                  const SizedBox(width: 6),
                  if (item.departmentDeliver != null && item.departmentReceiver != null)
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 12.5,
                            color: AppColors.gray,
                          ),
                          children: [
                            const TextSpan(text: 'Giao: '),
                            TextSpan(
                              text: item.departmentDeliver ?? '—',
                              style: const TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const TextSpan(text: '  →  Nhận: '),
                            TextSpan(
                              text: item.departmentReceiver ?? '—',
                              style: const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  else if (item.departmentDeliver != null)
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 12.5,
                            color: AppColors.gray,
                          ),
                          children: [
                            const TextSpan(text: 'Phòng: '),
                            TextSpan(
                              text: item.departmentDeliver ?? '—',
                              style: const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _receiverText() {
    final parts = <String>[];
    if (item.deliverName != null) parts.add(item.deliverName!);
    if (item.possitionDeliver != null && item.possitionDeliver!.isNotEmpty) {
      parts.add(item.possitionDeliver!);
    }
    return parts.isEmpty ? '—' : parts.join(' - ');
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
          style: const TextStyle(
            fontSize: 12.5,
            color: AppColors.gray,
          ),
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
