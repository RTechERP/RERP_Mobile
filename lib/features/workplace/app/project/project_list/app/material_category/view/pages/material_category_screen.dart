import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/di/injection.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../bloc/material_category_bloc.dart';
import '../bloc/solution_bloc.dart';
import '../bloc/version_bloc.dart';
import 'material_category_tab.dart';
import 'solution_tab.dart';
import 'version_tab.dart';

/// Màn hình chi tiết dự án với 3 tab:
/// - Tab 1: Giải pháp (SolutionTab)
/// - Tab 2: Phiên bản (VersionTab) - lấy solutionId từ solution đầu tiên
/// - Tab 3: Danh mục vật tư (MaterialCategoryTab) - lấy data khi user tap version item
class MaterialCategoryScreen extends StatefulWidget {
  const MaterialCategoryScreen({
    super.key,
    this.projectRequestId,
    this.versionId,
  });

  final int? projectRequestId;
  /// ID phiên bản được chọn từ tab Phiên bản - dùng để load danh sách vật tư.
  final int? versionId;

  @override
  State<MaterialCategoryScreen> createState() =>
      _MaterialCategoryScreenState();
}

class _MaterialCategoryScreenState extends State<MaterialCategoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int? _selectedVersionId;

  /// Tránh dispatch trùng VersionEvent.init cho cùng solutionId.
  int? _lastDispatchedSolutionId;

  /// Tránh dispatch trùng MaterialCategoryEvent.init khi user đã chọn.
  int? _autoDispatchedVersionId;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _selectedVersionId = widget.versionId;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onVersionSelected(int projectId, int versionId) {
    setState(() {
      _selectedVersionId = versionId;
    });
    // Chuyển sang tab Vật tư và load data.
    context.read<MaterialCategoryBloc>().add(MaterialCategoryEvent.init(
          projectId: projectId,
          projectPartListVersionId: versionId,
        ));
    _tabController.animateTo(2);
  }

  /// Dispatch lệnh load vật tư cho 1 version cụ thể, không chuyển tab.
  void _loadMaterialForVersion(BuildContext context, int versionId) {
    context.read<MaterialCategoryBloc>().add(MaterialCategoryEvent.init(
          projectId: widget.projectRequestId ?? 0,
          projectPartListVersionId: versionId,
        ));
  }

  /// Auto-trigger VersionEvent.init khi có solutionId đầu tiên từ SolutionBloc.
  void _onSolutionStateChanged(BuildContext context, SolutionState state) {
    final solutionId =
        state.solutions.isNotEmpty ? state.solutions.first.id : null;
    if (solutionId == null || solutionId == _lastDispatchedSolutionId) return;
    _lastDispatchedSolutionId = solutionId;
    context.read<VersionBloc>().add(VersionEvent.init(
          projectSolutionId: solutionId,
        ));
  }

  /// Khi VersionBloc load xong, lấy phiên bản đầu tiên từ response
  /// `/ProjectPartListVersion/get-all` để fill sẵn dữ liệu vật tư (không
  /// chuyển tab). Nếu user đã chọn version thì thôi.
  void _onVersionStateChanged(BuildContext context, VersionState state) {
    if (_selectedVersionId != null) return;
    if (state.status != BaseStateStatus.success) return;
    if (state.versions.isEmpty) return;
    final first = state.versions.first;
    if (first.id == _autoDispatchedVersionId) return;
    _autoDispatchedVersionId = first.id;
    _loadMaterialForVersion(context, first.id);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text('Danh mục vật tư', style: AppStyles.headingTitle2),
        onBackTap: () => context.pop(),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<SolutionBloc>(
            create: (_) => getIt<SolutionBloc>()
              ..add(SolutionEvent.init(
                projectRequestId: widget.projectRequestId,
              )),
          ),
          BlocProvider<VersionBloc>(
            create: (_) => getIt<VersionBloc>(),
          ),
          BlocProvider<MaterialCategoryBloc>(
            create: (_) => getIt<MaterialCategoryBloc>(),
          ),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<SolutionBloc, SolutionState>(
              listener: _onSolutionStateChanged,
            ),
            BlocListener<VersionBloc, VersionState>(
              listener: _onVersionStateChanged,
            ),
          ],
          child: Column(
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
                    const SolutionTab(),
                    VersionTab(
                      onVersionSelected: _onVersionSelected,
                      projectId: widget.projectRequestId,
                    ),
                    const MaterialCategoryTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
