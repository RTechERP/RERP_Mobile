import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../app/material_category/data/datasource/model/material_category_model.dart';
import '../../app/material_category/data/datasource/service/material_category_service.dart';
import '../../app/material_category/view/widgets/material_category_style.dart';

/// Bottom sheet hiển thị menu danh mục vật tư khi tap vào card dự án.
/// Tap vào một danh mục sẽ navigate tới màn MaterialCategoryScreen.
class MaterialCategorySheet extends StatelessWidget {
  const MaterialCategorySheet({
    super.key,
    required this.projectCode,
    required this.projectName,
    required this.categories,
  });

  final String projectCode;
  final String projectName;
  final List<MaterialCategoryItem> categories;

  static Future<void> show(
    BuildContext context, {
    required String projectCode,
    required String projectName,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => MaterialCategorySheet(
        projectCode: projectCode,
        projectName: projectName,
        categories: MaterialCategoryService.previewCategories(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 12, 12),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primaryERP.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.category_outlined,
                    color: AppColors.primaryERP,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        projectName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.enableText,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        projectCode,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.gray,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, color: AppColors.gray),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Grid danh mục - tap để điều hướng đến MaterialCategoryScreen
          Flexible(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.95,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final cat = categories[index];
                return _CategoryTile(
                  category: cat,
                  onTap: () {
                    Navigator.pop(context);
                    context.push('/project/menu/list/material-category');
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// Một ô danh mục trong grid.
class _CategoryTile extends StatelessWidget {
  const _CategoryTile({
    required this.category,
    required this.onTap,
  });

  final MaterialCategoryItem category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final style = MaterialCategoryStyle.styleFor(category.id);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: BoxDecoration(
            color: style.color.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: style.color.withValues(alpha: 0.25),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: style.color.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(style.icon, color: style.color, size: 24),
              ),
              const SizedBox(height: 8),
              Text(
                category.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.enableText,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
