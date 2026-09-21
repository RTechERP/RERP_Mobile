import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';
import 'package:rtc_erp/common/app_theme/index.dart';

import 'material_category_tab.dart';
import 'solution_tab.dart';
import 'version_tab.dart';

/// Màn hình chi tiết dự án với 3 tab:
/// - Tab 1: Giải pháp (SolutionTab)
/// - Tab 2: Phiên bản (VersionTab)
/// - Tab 3: Danh mục vật tư (dùng MaterialCategoryScreen theo URL)
class MaterialCategoryScreen extends StatefulWidget {
  const MaterialCategoryScreen({
    super.key,
    this.projectRequestId,
  });

  final int? projectRequestId;

  @override
  State<MaterialCategoryScreen> createState() =>
      _MaterialCategoryScreenState();
}

class _MaterialCategoryScreenState extends State<MaterialCategoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text('Danh mục vật tư', style: AppStyles.headingTitle2),
        onBackTap: () => context.pop(),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: AppColors.gray.withValues(alpha: 0.2),
                ),
              ),
            ),
            child: TabBar(
              controller: _tabController,
              indicatorColor: AppColors.primaryERP,
              indicatorWeight: 3,
              labelColor: AppColors.primaryERP,
              unselectedLabelColor: AppColors.gray,
              labelStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              tabs: const [
                Tab(
                  icon: Icon(Icons.lightbulb_outline, size: 18),
                  text: 'Giải pháp',
                  iconMargin: EdgeInsets.only(bottom: 4),
                ),
                Tab(
                  icon: Icon(Icons.layers_outlined, size: 18),
                  text: 'Phiên bản',
                  iconMargin: EdgeInsets.only(bottom: 4),
                ),
                Tab(
                  icon: Icon(Icons.category_outlined, size: 18),
                  text: 'Vật tư',
                  iconMargin: EdgeInsets.only(bottom: 4),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SolutionTab(projectRequestId: widget.projectRequestId),
                const VersionTab(),
                const MaterialCategoryTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

