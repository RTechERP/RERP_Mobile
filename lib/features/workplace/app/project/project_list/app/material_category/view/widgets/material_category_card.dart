import 'package:flutter/material.dart';
import 'package:rtc_erp/common/app_theme/index.dart';

import '../../data/datasource/model/material_category_model.dart';
import 'material_category_style.dart';

/// Card widget hiển thị thông tin một material category.
class MaterialCategoryCard extends StatelessWidget {
  const MaterialCategoryCard({
    super.key,
    required this.category,
    this.onTap,
  });

  final MaterialCategoryItem category;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final style = MaterialCategoryStyle.styleFor(category.id);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: style.color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(style.icon, color: style.color, size: 24),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category.name,
                        style: AppStyles.contentText.copyWith(
                          color: AppColors.enableText,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            category.code,
                            style: AppStyles.body2.copyWith(
                              color: AppColors.gray,
                            ),
                          ),
                          if (category.note != null &&
                              category.note!.isNotEmpty) ...[
                            Text(
                              ' • ',
                              style: AppStyles.body2.copyWith(
                                color: AppColors.gray,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                category.note!,
                                style: AppStyles.body2.copyWith(
                                  color: AppColors.gray.withValues(alpha: 0.8),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: AppColors.gray,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
