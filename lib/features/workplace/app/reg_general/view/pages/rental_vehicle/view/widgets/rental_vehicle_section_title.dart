// Widget tiêu đề section (thanh đỏ + chữ đậm) cho form thêm yêu cầu thuê xe.

import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';

/// Tiêu đề section: thanh dọc màu primary + chữ đậm.
///
/// Dùng để phân nhóm các field trong form (Thông tin chung, Hàng hoá, Lộ trình...).
class RentalVehicleSectionTitle extends StatelessWidget {
  const RentalVehicleSectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 18,
          decoration: BoxDecoration(
            color: AppColors.primaryERP,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.enableText,
          ),
        ),
      ],
    );
  }
}
