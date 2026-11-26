import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../app/material_category/data/datasource/model/material_category_model.dart';
import '../../app/material_category/view/widgets/material_category_style.dart';
import '../../data/datasource/model/project_list_model.dart';
import 'project_detail_sheet.dart';

/// Menu tĩnh các danh mục - không lấy từ API.
const _menuItems = [
  MaterialCategoryItem(id: 1, code: 'DMVT', name: 'DM vật tư'),
];

/// Bottom sheet hiển thị menu của một dự án khi tap vào card dự án.
///
/// Gồm lưới menu: các danh mục vật tư (tap để điều hướng tới
/// MaterialCategoryScreen) và ô "Chi tiết dự án" (mở sheet thông tin chi tiết).
class MaterialCategorySheet extends StatelessWidget {
  const MaterialCategorySheet({
    super.key,
    required this.project,
    required this.categories,
  });

  /// Dự án đang mở menu.
  final ProjectItem project;

  /// Danh sách danh mục hiển thị trong lưới.
  final List<MaterialCategoryItem> categories;

  /// Mở bottom sheet menu của dự án.
  static Future<void> show(
    BuildContext context, {
    required ProjectItem project,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => MaterialCategorySheet(
        project: project,
        categories: _menuItems,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final projectCode = (project.projectCode ?? '').trim();
    final projectName = (project.projectName ?? '').trim();

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.72,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHandle(),
            _buildHeader(context, projectCode, projectName),
            const Divider(height: 1, color: AppColors.borderColor),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                children: [
                  _buildMenuGrid(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Thanh kéo ở đầu sheet.
  Widget _buildHandle() {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      width: 44,
      height: 4,
      decoration: BoxDecoration(
        color: AppColors.borderColor,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  /// Header: icon dự án + mã dự án + tên dự án + nút đóng.
  Widget _buildHeader(
    BuildContext context,
    String projectCode,
    String projectName,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 8, 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primaryERP.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.folder_outlined,
              color: AppColors.primaryERP,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (projectCode.isNotEmpty)
                  Text(
                    projectCode.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: AppColors.gray,
                      letterSpacing: 0.6,
                      height: 1.2,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                if (projectCode.isNotEmpty && projectName.isNotEmpty)
                  const SizedBox(height: 3),
                if (projectName.isNotEmpty)
                  Text(
                    projectName,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.enableText,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close, color: AppColors.gray, size: 20),
          ),
        ],
      ),
    );
  }

  /// Lưới menu: các danh mục vật tư và ô chi tiết dự án.
  Widget _buildMenuGrid(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.95,
      ),
      itemCount: categories.length + 1,
      itemBuilder: (context, index) {
        // Ô đầu tiên là "Chi tiết dự án", sau đó tới các danh mục vật tư.
        if (index == 0) {
          return _MenuTile(
            icon: Icons.info_outline,
            label: 'Chi tiết dự án',
            color: AppColors.primaryERP,
            onTap: () {
              // Dùng context của root navigator để tránh dùng context của
              // sheet đang bị đóng (deactivate) khi mở sheet chi tiết.
              final rootContext = Navigator.of(
                context,
                rootNavigator: true,
              ).context;
              Navigator.pop(context);
              ProjectDetailSheet.show(rootContext, project: project);
            },
          );
        }

        final cat = categories[index - 1];
        return _CategoryTile(
          category: cat,
          onTap: () {
            Navigator.pop(context);
            final query = project.id != null
                ? '?projectRequestId=${project.id}'
                : '';
            context.push('/project/menu/list/material-category$query');
          },
        );
      },
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

/// Một ô menu dùng chung kiểu với ô danh mục, dùng cho "Chi tiết dự án".
class _MenuTile extends StatelessWidget {
  const _MenuTile({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: color.withValues(alpha: 0.25),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(height: 8),
              Text(
                label,
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
