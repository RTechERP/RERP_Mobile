import 'package:flutter/material.dart';
import 'package:rtc_erp/common/app_theme/index.dart';

/// Error state view cho danh sách material category.
class MaterialCategoryErrorView extends StatelessWidget {
  const MaterialCategoryErrorView({
    super.key,
    required this.message,
  });

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 80,
            color: AppColors.red.withValues(alpha: 0.7),
          ),
          const SizedBox(height: 16),
          Text(
            'Error loading data',
            style: AppStyles.contentText.copyWith(
              color: AppColors.red,
            ),
          ),
          if (message != null && message!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                message!,
                textAlign: TextAlign.center,
                style: AppStyles.body2.copyWith(
                  color: AppColors.gray,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
