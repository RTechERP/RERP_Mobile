import 'package:flutter/material.dart';
import 'package:rtc_erp/common/app_theme/index.dart';

/// Header hiển thị số lượng danh mục vật tư.
class MaterialCategoryHeader extends StatelessWidget {
  const MaterialCategoryHeader({
    super.key,
    required this.total,
  });

  final int total;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primaryERP.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.category_outlined,
            color: AppColors.primaryERP,
            size: 18,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          '$total items',
          style: AppStyles.contentText.copyWith(
            color: AppColors.enableText,
          ),
        ),
      ],
    );
  }
}
