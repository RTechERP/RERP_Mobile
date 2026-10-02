// Card hiển thị một phiếu đặt phòng nhà nghỉ trong danh sách.

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/booking_guest_house_model.dart';

/// Card thông tin phiếu đặt phòng nhà nghỉ (style glassmorphism đồng bộ
/// với các module khác trong app).
class BookingGuestHouseCard extends StatelessWidget {
  const BookingGuestHouseCard({
    super.key,
    required this.item,
    this.onTap,
  });

  final BookingGuestHouseItem item;
  final VoidCallback? onTap;

  static final DateFormat _dateFmt = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    final employee = _displayEmployee();
    final project = _displayProject();
    final dateRange = _formatDateRange();

    final arrangementBadge = _arrangementBadgeLabel();
    final arrangementColor = _arrangementBadgeColor(arrangementBadge);

    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withValues(alpha: 0.9),
                  Colors.white.withValues(alpha: 0.7),
                ],
              ),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.6),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryERP.withValues(alpha: 0.08),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TinyBadge(text: arrangementBadge, color: arrangementColor),
                  const SizedBox(height: 12),
                  _InfoRow(
                    icon: Icons.person_outline,
                    label: 'Nhân viên',
                    value: employee,
                  ),
                  const SizedBox(height: 8),
                  if (project.isNotEmpty) ...[
                    _InfoRow(
                      icon: Icons.folder_outlined,
                      label: 'Dự án',
                      value: project,
                    ),
                    const SizedBox(height: 8),
                  ],
                  if (dateRange.isNotEmpty) ...[
                    _InfoRow(
                      icon: Icons.calendar_month_outlined,
                      label: 'Thời gian',
                      value: dateRange,
                      valueColor: AppColors.primaryERP,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //---(Display helpers)---//

  String _displayEmployee() {
    final name = (item.fullName ?? '').trim();
    if (name.isEmpty) return 'Nhân viên';
    return name;
  }

  String _displayProject() {
    final code = (item.projectCode ?? '').trim();
    final name = (item.projectName ?? '').trim();
    if (code.isEmpty && name.isEmpty) return '';
    if (code.isEmpty) return name;
    if (name.isEmpty) return code;
    return '$code - $name';
  }

  String _formatDateRange() {
    final s = item.startDate;
    final e = item.endDate;
    if (s == null && e == null) return '';
    if (s != null && e != null) {
      return '${_dateFmt.format(s)} → ${_dateFmt.format(e)}';
    }
    return _dateFmt.format(s ?? e!);
  }

  //---(Badge)---//

  String _arrangementBadgeLabel() {
    final hotel = (item.paymentHotelName ?? '').trim();
    final amount = item.paymentTotalAmountWithInvoice;
    if (hotel.isNotEmpty || (amount != null && amount > 0)) {
      return 'Đã thanh toán';
    }
    return 'Chưa thanh toán';
  }

  Color _arrangementBadgeColor(String label) {
    return label == 'Đã thanh toán'
        ? AppColors.success
        : AppColors.warning;
  }
}

//---( Info Row )---//

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 14, color: AppColors.gray),
        const SizedBox(width: 6),
        Text(
          '$label: ',
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.gray,
            height: 1.2,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: valueColor ?? AppColors.enableText,
              height: 1.2,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

//---( Tiny Badge )---//

class _TinyBadge extends StatelessWidget {
  const _TinyBadge({required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final safeText = text.trim().isEmpty ? '-' : text.trim();
    final bg = color.withValues(alpha: 0.12);
    final border = color.withValues(alpha: 0.4);

    return Container(
      constraints: const BoxConstraints(maxWidth: 140),
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
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
          fontSize: 9,
          fontWeight: FontWeight.w700,
          color: color,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}