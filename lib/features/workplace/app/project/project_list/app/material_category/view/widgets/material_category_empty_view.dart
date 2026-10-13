import 'package:flutter/material.dart';
import 'package:rtc_erp/common/app_theme/index.dart';

/// Empty state view cho danh sách material category.
class MaterialCategoryEmptyView extends StatelessWidget {
  const MaterialCategoryEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.category_outlined,
            size: 80,
            color: AppColors.gray.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'No material categories found',
            style: AppStyles.contentText.copyWith(
              color: AppColors.gray,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try adjusting your search',
            style: AppStyles.body2.copyWith(
              color: AppColors.gray.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}
