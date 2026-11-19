import 'package:flutter/material.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/product_return_approval/data/datasource/models/product_return_approval_model.dart';

/// Chip trạng thái của một phiếu trả sản phẩm.
///
/// Màu chip phụ thuộc trạng thái:
/// - đã có ngày trả → "Đã trả" (xanh).
/// - trạng thái 4 → "Đăng ký trả" (cam).
/// - trạng thái 5 → "Chờ duyệt" (xanh dương).
/// - còn lại → dùng nhãn do server trả về (màu mặc định).
class ProductReturnStatusChip extends StatelessWidget {
  const ProductReturnStatusChip({super.key, required this.item});

  /// Phiếu trả sản phẩm cần hiển thị chip.
  final ProductReturnHistoryItem item;

  /// Màu nhận diện của chip.
  Color get _color {
    if (_hasReturned) return AppColors.stateSuccessColor;
    switch (item.statusNew ?? item.status) {
      case 4:
        return AppColors.stateWarningColor;
      case 5:
        return AppColors.stateInfoColor;
      default:
        return AppColors.gray;
    }
  }

  /// Nhãn hiển thị trên chip.
  String get _label {
    if (_hasReturned) return 'Đã trả';
    final text = (item.statusText ?? '').trim();
    if (text.isNotEmpty) return text;
    switch (item.statusNew ?? item.status) {
      case 4:
        return 'Đăng ký trả';
      case 5:
        return 'Chờ duyệt';
      default:
        return 'Không rõ';
    }
  }

  /// Phiếu đã được trả thực tế hay chưa.
  bool get _hasReturned => (item.dateReturn ?? '').trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final color = _color;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.assignment_turned_in_outlined, size: 11, color: color),
          const SizedBox(width: 4),
          Text(
            _label,
            style: TextStyle(
              fontSize: 10.5,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
