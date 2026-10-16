// Date: 16/10/2026
// Nội dung/Chức năng: Card hiển thị một dòng yêu cầu thuê xe tải.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/rental_vehicle_model.dart';

/// Card một dòng yêu cầu thuê xe tải — flat, label:value dọc, 2 cột ngang.
class RentalVehicleCard extends StatelessWidget {
  const RentalVehicleCard({
    super.key,
    required this.item,
    this.onTap,
    this.onDelete,
  });

  final RentalVehicleItem item;
  final VoidCallback? onTap;

  /// Callback khi user vuốt card sang trái và chạm nút Xoá.
  final VoidCallback? onDelete;

  static final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');
  static final NumberFormat _moneyFormat = NumberFormat('#,###');

  @override
  Widget build(BuildContext context) {
    final v = item;
    final approved = v.isApproved == true;
    final accent = approved ? AppColors.success : AppColors.warning;

    final fromTo = _formatFromTo();
    final cost = _formatCost();

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderColor),
          ),
          padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sub-header: badge trạng thái + STT
              Row(
                children: [
                  _StatusBadge(
                    label: _approvalLabel(v),
                    color: accent,
                    approved: approved,
                  ),
                  const Spacer(),
                  if (v.stt != null)
                    Text(
                      '#${v.stt}',
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.gray,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 10),

              // ===== HEADER — Tên nổi bật + ngày phải =====
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Expanded(
                    child: Text(
                      _val(v.employeeRequestName),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.enableText,
                        height: 1.1,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    v.dateRequest != null
                        ? _dateFormat.format(v.dateRequest!)
                        : '—',
                    style: const TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w600,
                      color: AppColors.gray,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),

              // ===== HÀNH TRÌNH — nổi bật (block riêng) =====
              if (fromTo.isNotEmpty) ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: accent.withValues(alpha: 0.06),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: accent.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.alt_route_rounded, size: 14, color: accent),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          fromTo,
                          style: const TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w600,
                            color: AppColors.enableText,
                            height: 1.2,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],

              // ===== 2 CỘT NGANG — Hàng hoá / Dự án =====
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _Field(
                      icon: Icons.inventory_2_outlined,
                      label: 'Hàng hoá',
                      value: _val(v.packageName),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _Field(
                      icon: Icons.folder_outlined,
                      label: 'Dự án',
                      value: _val(v.projectName),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),

              // ===== 2 CỘT NGANG — Loại xe / NCC =====
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _Field(
                      icon: Icons.local_shipping_outlined,
                      label: 'Loại xe',
                      value: _vehicleType(v.vehicleType),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _Field(
                      icon: Icons.business_outlined,
                      label: 'Đơn vị vận chuyển',
                      value: _val(v.nameNcc),
                    ),
                  ),
                ],
              ),

              if (cost.isNotEmpty) ...[
                const SizedBox(height: 6),
                _Field(
                  icon: Icons.payments_outlined,
                  label: 'Chi phí',
                  value: cost,
                  valueColor: AppColors.success,
                  bold: true,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // ===== Helpers =====

  String _formatFromTo() {
    final from = (item.departureLocation ?? '').trim();
    final to = (item.addressLocation ?? '').trim();
    if (from.isEmpty && to.isEmpty) return '';
    final distance = item.distanceKm;
    final distStr = (distance != null && distance > 0)
        ? ' · ${_fmt(distance)} km'
        : '';
    if (from.isNotEmpty && to.isNotEmpty) {
      return '$from  →  $to$distStr';
    }
    return '${from.isNotEmpty ? from : to}$distStr';
  }

  String _formatCost() {
    final cost = item.cost;
    if (cost == null || cost == 0) return '';
    return '${_moneyFormat.format(cost)} đ';
  }

  String _val(String? s) {
    final t = (s ?? '').trim();
    return t.isEmpty ? '—' : t;
  }

  String _fmt(num? n) {
    if (n == null) return '0';
    if (n == n.roundToDouble()) return n.toInt().toString();
    return n.toString();
  }

  String _vehicleType(int? t) => switch (t) {
        1 => 'Xe tải',
        2 => 'Xe tải có cẩu',
        3 => 'Xe nâng',
        _ => 'Xe tải',
      };

  String _approvalLabel(RentalVehicleItem i) =>
      i.isApproved == true ? 'Đã duyệt' : 'Chưa duyệt';
}

// ===== Sub-widgets =====

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({
    required this.label,
    required this.color,
    required this.approved,
  });

  final String label;
  final Color color;
  final bool approved;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            approved ? Icons.verified_rounded : Icons.pending_outlined,
            size: 10,
            color: color,
          ),
          const SizedBox(width: 3),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

/// Một field: icon + label nhỏ phía trên, value đậm phía dưới.
class _Field extends StatelessWidget {
  const _Field({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
    this.bold = false,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 11, color: AppColors.gray.withValues(alpha: 0.7)),
            const SizedBox(width: 3),
            Text(
              label,
              style: const TextStyle(
                fontSize: 10,
                color: AppColors.gray,
                fontWeight: FontWeight.w500,
                height: 1.1,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
            fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
            color: valueColor ?? AppColors.enableText,
            height: 1.2,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
