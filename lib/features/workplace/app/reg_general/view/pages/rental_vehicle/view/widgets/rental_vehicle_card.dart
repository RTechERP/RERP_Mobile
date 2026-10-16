// Date: 16/10/2026
// Nội dung/Chức năng: Card hiển thị một dòng yêu cầu thuê xe tải.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/rental_vehicle_model.dart';

/// Badge trạng thái duyệt.
class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

/// Một dòng thông tin: prefix mờ + value đậm.
class _InfoLine extends StatelessWidget {
  const _InfoLine({
    required this.prefix,
    required this.text,
    this.isEmphasis = false,
  });

  final String prefix;
  final String text;
  final bool isEmphasis;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          prefix,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.gray,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black87,
              fontWeight: isEmphasis ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

/// Label trạng thái duyệt: "Đã duyệt" / "Chưa duyệt".
String _approvalLabel(RentalVehicleItem item) {
  if (item.isApproved == true) return 'Đã duyệt';
  return 'Chưa duyệt';
}

Color _approvalColor(RentalVehicleItem item) {
  return item.isApproved == true ? AppColors.success : AppColors.warning;
}

/// Card một dòng yêu cầu thuê xe tải.
class RentalVehicleCard extends StatelessWidget {
  const RentalVehicleCard({super.key, required this.item, this.onTap});

  final RentalVehicleItem item;
  final VoidCallback? onTap;

  static final DateFormat _dateTimeFormat = DateFormat('HH:mm - dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    final approvalLabel = _approvalLabel(item);
    final approvalColor = _approvalColor(item);

    final requester =
        (item.employeeRequestName ?? '').trim().isNotEmpty
            ? item.employeeRequestName!.trim()
            : '-';
    final department =
        (item.departmentName ?? '').trim().isNotEmpty
            ? item.departmentName!.trim()
            : '-';
    final project =
        (item.projectName ?? '').trim().isNotEmpty
            ? item.projectName!.trim()
            : '-';
    final package =
        (item.packageName ?? '').trim().isNotEmpty
            ? item.packageName!.trim()
            : '-';
    final packageInfo = _formatPackageInfo();
    final fromTo = _formatFromTo();
    final ncc =
        (item.nameNcc ?? '').trim().isNotEmpty ? item.nameNcc!.trim() : '-';
    final costText = _formatCost();
    final dateRequestText = item.dateRequest != null
        ? _dateTimeFormat.format(item.dateRequest!)
        : '-';

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
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: badge trạng thái duyệt + STT
              Row(
                children: [
                  _StatusBadge(label: approvalLabel, color: approvalColor),
                  const Spacer(),
                  if (item.stt != null)
                    Text(
                      'STT: ${item.stt}',
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.gray,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 10),
              // Người yêu cầu
              _InfoLine(prefix: 'Người yêu cầu: ', text: requester, isEmphasis: true),
              const SizedBox(height: 4),
              // Bộ phận
              _InfoLine(prefix: 'Bộ phận: ', text: department),
              const SizedBox(height: 4),
              // Dự án
              _InfoLine(prefix: 'Dự án: ', text: project),
              const SizedBox(height: 4),
              // Hàng hoá
              _InfoLine(prefix: 'Hàng hoá: ', text: package),
              if (packageInfo.isNotEmpty) ...[
                const SizedBox(height: 4),
                _InfoLine(prefix: 'SL/Kích thước: ', text: packageInfo),
              ],
              if (fromTo.isNotEmpty) ...[
                const SizedBox(height: 4),
                _InfoLine(prefix: 'Tuyến: ', text: fromTo),
              ],
              const SizedBox(height: 4),
              // Nhà cung cấp
              _InfoLine(prefix: 'Nhà cung cấp: ', text: ncc),
              // Chi phí
              if (costText.isNotEmpty) ...[
                const SizedBox(height: 4),
                _InfoLine(
                  prefix: 'Chi phí: ',
                  text: costText,
                  isEmphasis: true,
                ),
              ],
              const SizedBox(height: 4),
              // Ngày đăng ký
              _InfoLine(prefix: 'Ngày đăng ký: ', text: dateRequestText),
              if ((item.note ?? '').trim().isNotEmpty) ...[
                const SizedBox(height: 4),
                _InfoLine(
                  prefix: 'Ghi chú: ',
                  text: item.note!.trim(),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  String _formatPackageInfo() {
    final parts = <String>[];
    final qty = item.packageQuantity;
    if (qty != null && qty > 0) parts.add('SL: $qty');

    final l = item.packageLengthCm;
    final w = item.packageWidthCm;
    final h = item.packageHeightCm;
    final hasSize = (l != null && l > 0) ||
        (w != null && w > 0) ||
        (h != null && h > 0);
    if (hasSize) {
      parts.add(
        '${_fmt(l)} x ${_fmt(w)} x ${_fmt(h)} cm',
      );
    }

    final weight = item.packageWeightKg;
    if (weight != null && weight > 0) {
      parts.add('$weight kg');
    }

    return parts.join(' · ');
  }

  String _formatFromTo() {
    final from = (item.departureLocation ?? '').trim();
    final to = (item.addressLocation ?? '').trim();
    if (from.isEmpty && to.isEmpty) return '';
    final distance = item.distanceKm;
    final distStr = (distance != null && distance > 0)
        ? ' (${_fmt(distance)} km)'
        : '';
    if (from.isNotEmpty && to.isNotEmpty) {
      return '$from → $to$distStr';
    }
    return '${from.isNotEmpty ? from : to}$distStr';
  }

  String _formatCost() {
    final cost = item.cost;
    if (cost == null || cost == 0) return '';
    final formatted = NumberFormat('#,###').format(cost);
    return '$formatted đ';
  }

  String _fmt(num? v) {
    if (v == null) return '0';
    if (v == v.roundToDouble()) return v.toInt().toString();
    return v.toString();
  }
}
