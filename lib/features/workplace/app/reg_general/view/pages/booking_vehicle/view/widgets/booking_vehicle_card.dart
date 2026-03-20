import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/booking_vehicle_model.dart';

/// Card một dòng đặt xe: cột thông tin + badge trạng thái góc trên phải.
class BookingVehicleCard extends StatelessWidget {
  const BookingVehicleCard({
    super.key,
    required this.item,
    this.dateFormatPattern = 'dd/MM/yyyy',
  });

  final BookingVehicleItem item;

  /// Pattern cho [DateFormat], mặc định `dd/MM/yyyy`.
  final String dateFormatPattern;

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormat(dateFormatPattern);

    final employeeName =
        (item.fullName ?? item.bookerVehicles ?? '-').trim();
    final departmentName =
        (item.departmentName ?? item.passengerDepartment ?? '-').trim();

    final projectParts = _splitProjectFullName(item.projectFullName);
    final projectCode = projectParts.$1;
    final projectName = projectParts.$2;

    final statusText = (item.statusText ?? '-').trim();
    final statusColor = _resolveStatusColor(statusText, item.status);
    final createdLabel = item.createdDate != null
        ? dateFormatter.format(item.createdDate!)
        : '-';

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 132),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _InfoLine(text: employeeName, isPrimary: true),
                  const SizedBox(height: 6),
                  _InfoLine(text: departmentName),
                  const SizedBox(height: 6),
                  _InfoLine(text: projectCode, isEmphasis: true),
                  const SizedBox(height: 6),
                  _InfoLine(text: projectName),
                  const SizedBox(height: 6),
                  _InfoLine(
                    text: createdLabel,
                    prefix: 'Ngày tạo: ',
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: _StatusBadge(
                text: statusText,
                color: statusColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoLine extends StatelessWidget {
  const _InfoLine({
    required this.text,
    this.prefix = '',
    this.isPrimary = false,
    this.isEmphasis = false,
  });

  final String text;
  final String prefix;
  final bool isPrimary;
  final bool isEmphasis;

  @override
  Widget build(BuildContext context) {
    final display = text.isEmpty ? '-' : text;
    final style = isPrimary
        ? const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.neutralText,
            height: 1.25,
          )
        : isEmphasis
            ? const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.secondaryERP,
                height: 1.25,
              )
            : const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondaryColor,
                height: 1.25,
              );

    return Text.rich(
      TextSpan(
        children: [
          if (prefix.isNotEmpty)
            TextSpan(
              text: prefix,
              style: TextStyle(
                fontSize: style.fontSize,
                fontWeight: FontWeight.w500,
                color: AppColors.textTertiaryColor,
                height: style.height,
              ),
            ),
          TextSpan(text: display, style: style),
        ],
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({
    required this.text,
    required this.color,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final safeText = text.trim().isEmpty ? '-' : text.trim();
    final bg = color.withOpacity(0.12);
    final border = color.withOpacity(0.55);

    return Container(
      constraints: const BoxConstraints(maxWidth: 160),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: border),
      ),
      child: Text(
        safeText,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

/// Trả về (projectCode, projectName).
(String, String) _splitProjectFullName(String? full) {
  final value = (full ?? '').trim();
  if (value.isEmpty) return ('-', '-');

  final dashParts = value.split(RegExp(r'\s[-–]\s'));
  if (dashParts.length >= 2) {
    final code = dashParts.first.trim();
    final name = dashParts.sublist(1).join(' - ').trim();
    return (code.isNotEmpty ? code : '-', name.isNotEmpty ? name : '-');
  }

  final lines = value
      .split('\n')
      .map((e) => e.trim())
      .where((e) => e.isNotEmpty)
      .toList();
  if (lines.length >= 2) {
    return (lines.first, lines.sublist(1).join(' ').trim());
  }

  return (value, value);
}

Color _resolveStatusColor(String statusText, int? status) {
  final t = statusText.toLowerCase();
  if (t.isEmpty || t == '-') return AppColors.gray;

  if (t.contains('chờ') || t.contains('cho') || t.contains('pending')) {
    return AppColors.warning;
  }

  if (t.contains('duyệt') ||
      t.contains('duyet') ||
      t.contains('phê duyệt') ||
      t.contains('phe duyet') ||
      t.contains('approved')) {
    return AppColors.success;
  }

  if (t.contains('từ chối') ||
      t.contains('tu choi') ||
      t.contains('hủy') ||
      t.contains('huy') ||
      t.contains('cancel') ||
      t.contains('rejected') ||
      t.contains('từ bỏ')) {
    return AppColors.alert;
  }

  if (status != null) {
    if (status >= 3) return AppColors.success;
    if (status <= 1) return AppColors.warning;
    return AppColors.stateInfoColor;
  }

  return AppColors.stateInfoColor;
}
