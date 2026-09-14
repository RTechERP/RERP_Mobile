import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';

/// Model hiển thị tạm cho một danh mục vật tư.
/// Sẽ thay bằng model thật khi có API.
class MaterialCategory {
  const MaterialCategory({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });

  final int id;
  final String name;
  final IconData icon;
  final Color color;
}

/// Danh sách danh mục vật tư tạm (sẽ thay bằng dữ liệu từ API sau).
const List<MaterialCategory> _placeholderCategories = [
  MaterialCategory(
    id: 1,
    name: 'Danh mục vật tư',
    icon: Icons.electrical_services,
    color: Colors.amber,
  ),
  // MaterialCategory(
  //   id: 2,
  //   name: 'Vật tư cơ khí',
  //   icon: Icons.build_outlined,
  //   color: Colors.blueGrey,
  // ),
  // MaterialCategory(
  //   id: 3,
  //   name: 'Dụng cụ thi công',
  //   icon: Icons.handyman_outlined,
  //   color: Colors.brown,
  // ),
  // MaterialCategory(
  //   id: 4,
  //   name: 'Vật tư tiêu hao',
  //   icon: Icons.inventory_2_outlined,
  //   color: Colors.teal,
  // ),
  // MaterialCategory(
  //   id: 5,
  //   name: 'Phụ kiện',
  //   icon: Icons.extension_outlined,
  //   color: Colors.purple,
  // ),
  // MaterialCategory(
  //   id: 6,
  //   name: 'Vật tư an toàn',
  //   icon: Icons.health_and_safety_outlined,
  //   color: Colors.red,
  // ),
];

/// Bottom sheet hiển thị menu danh mục vật tư khi tap vào card dự án.
class MaterialCategorySheet extends StatelessWidget {
  const MaterialCategorySheet({
    super.key,
    required this.projectCode,
    required this.projectName,
    this.categories = _placeholderCategories,
  });

  final String projectCode;
  final String projectName;
  final List<MaterialCategory> categories;

  static Future<void> show(
    BuildContext context, {
    required String projectCode,
        required String projectName,
    List<MaterialCategory>? categories,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => MaterialCategorySheet(
        projectCode: projectCode,
        projectName: projectName,
        categories: categories ?? _placeholderCategories,
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
          // Grid danh mục
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
                return _CategoryTile(category: cat);
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
  const _CategoryTile({required this.category});

  final MaterialCategory category;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () => Navigator.pop(context, category),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: BoxDecoration(
            color: category.color.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: category.color.withValues(alpha: 0.25),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: category.color.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(category.icon, color: category.color, size: 24),
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
