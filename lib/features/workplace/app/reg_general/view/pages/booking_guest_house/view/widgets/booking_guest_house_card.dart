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

    final (arrangementBadge, arrangementColor) = _paymentStatusBadge();

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
                  Row(
                    children: [
                      _TbpBadge(item: item),
                      const SizedBox(width: 6),
                      _TinyBadge(
                        text: arrangementBadge,
                        color: arrangementColor,
                      ),
                    ],
                  ),
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

  /// Nhãn + màu cho badge trạng thái thanh toán dựa trên
  /// `paymentDetailStatus` của phiếu. Quy ước 5 giá trị BE trả về:
  /// - 0: Chưa có           → xám (chưa tạo TTQT)
  /// - 2: Chờ duyệt file    → vàng (đã submit, chờ Kế toán duyệt)
  /// - 3: File đã duyệt     → xanh lá (Kế toán đã duyệt file)
  /// - 4: Đã tạo ĐNTT       → xanh dương (đã tạo đề nghị thanh toán)
  /// - 5: Yêu cầu bổ sung   → cam (Kế toán yêu cầu bổ sung file)
  ///
  /// Mọi giá trị khác (1, 6, 7...) hoặc `null` → fallback "Chưa có" (xám).
  (String, Color) _paymentStatusBadge() {
    final s = item.paymentDetailStatus;
    return switch (s) {
      2 => ('Chờ duyệt file', AppColors.warning),
      3 => ('File đã duyệt', AppColors.success),
      4 => ('Đã tạo ĐNTT', AppColors.secondaryERP),
      5 => ('Yêu cầu bổ sung', AppColors.warning),
      _ => ('Chưa có', AppColors.gray),
    };
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

/// Badge trạng thái duyệt TBP hiển thị trên card. Đồng bộ style với
/// `_TinyBadge` (pill tròn, alpha 12% nền + 40% viền, chữ 9px đậm).
/// - `IsApprovedTBP == true`  → "Đã duyệt TBP" (xanh lá)
/// - ngược lại               → "Chờ duyệt TBP" (vàng)
class _TbpBadge extends StatelessWidget {
  const _TbpBadge({required this.item});

  final BookingGuestHouseItem item;

  @override
  Widget build(BuildContext context) {
    final approved = item.isApprovedTBP == true;
    final color = approved
        ? AppColors.success
        : AppColors.warning;
    final label = approved ? 'TBP đã duyệt' : 'Chờ duyệt TBP';
    return _TinyBadge(text: label, color: color);
  }
}