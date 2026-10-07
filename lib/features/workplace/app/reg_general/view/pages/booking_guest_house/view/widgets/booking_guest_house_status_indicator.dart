// Indicator trạng thái duyệt TBP — vòng tròn có tích xanh khi đã duyệt,
// vòng tròn có chấm than khi chưa duyệt.
//
// Đặt đầu mỗi tab (Phiếu đăng ký / TT Quyết toán) để người dùng nắm
// trạng thái duyệt mà không cần đọc toàn bộ form. Style đồng bộ với
// pattern "pill" của newsfeed_screen (gradient icon + shadow + border).

import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';

enum BookingGuestHouseApprovalStatus {
  /// Đã được TBP duyệt — hiển thị dấu tròn tích xanh.
  approved,

  /// Chưa được TBP duyệt — hiển thị dấu tròn chấm than.
  notApproved,
}

/// Field hiển thị duy nhất 1 indicator tròn (tích xanh hoặc chấm than)
/// kèm nhãn "Trạng thái duyệt TBP". Toàn bộ widget là 1 container card
/// (border + shadow) đồng bộ với FormCard bên dưới — UI người dùng thấy
/// trạng thái ngay lập tức, không cần đọc form.
class BookingGuestHouseStatusIndicator extends StatelessWidget {
  const BookingGuestHouseStatusIndicator({
    super.key,
    required this.status,
    this.label = 'Trạng thái duyệt TBP',
  });

  final BookingGuestHouseApprovalStatus status;

  /// Nhãn hiển thị phía dưới tiêu đề "Trạng thái duyệt TBP".
  final String label;

  bool get _isApproved => status == BookingGuestHouseApprovalStatus.approved;

  String get _statusMessage => _isApproved
      ? 'Đã được TBP duyệt'
      : 'Chưa được TBP duyệt';

  IconData get _icon => _isApproved ? Icons.check_circle : Icons.error;

  Color get _color => _isApproved ? AppColors.success : AppColors.warning;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: _color.withValues(alpha: 0.35),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: _color.withValues(alpha: 0.10),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon tròn (tích xanh / chấm than) — là field duy nhất của tab.
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  _color.withValues(alpha: 0.95),
                  _color.withValues(alpha: 0.72),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: _color.withValues(alpha: 0.32),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              _icon,
              size: 22,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.gray,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  _statusMessage,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: _color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Helper chuyển `IsApprovedTBP` (bool?) → enum để dùng cho widget.
BookingGuestHouseApprovalStatus
    bookingGuestHouseApprovalStatusFromBool(bool? isApprovedTBP) {
  return isApprovedTBP == true
      ? BookingGuestHouseApprovalStatus.approved
      : BookingGuestHouseApprovalStatus.notApproved;
}