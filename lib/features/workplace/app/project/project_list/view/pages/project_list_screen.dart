import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/base/bloc/index.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';
import 'package:rtc_erp/base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/widgets/date_range_picker.dart';
import '../../../../../../../../../routes/route_names.dart' show RouteNames;
import '../bloc/project_list_bloc.dart';
import '../widgets/project_active_filters.dart';
import '../widgets/project_card.dart';
import '../widgets/project_empty_view.dart';
import '../widgets/project_error_view.dart';
import '../widgets/project_filter_sheet.dart';
import '../widgets/project_list_header.dart';

/// Màn hình danh sách project.
class ProjectListScreen extends StatefulWidget {
  const ProjectListScreen({super.key});

  @override
  State<ProjectListScreen> createState() => _ProjectListScreenState();
}

class _ProjectListScreenState extends BaseState<
    ProjectListScreen,
    ProjectListEvent,
    ProjectListState,
    ProjectListBloc> {
  final _searchController = TextEditingController();
  bool _isSearchVisible = false;

  void _toggleSearch() {
    setState(() {
      _isSearchVisible = !_isSearchVisible;
      if (!_isSearchVisible) {
        _searchController.clear();
        bloc.add(const ProjectListEvent.changeKeyword(keyword: ''));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    bloc.add(const ProjectListEvent.init());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(
          '${RouteNames.projectMenu}/${RouteNames.projectList}/${RouteNames.projectAdd}',
        ),
        backgroundColor: AppColors.primaryERP,
        elevation: 6,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBarCommon(
        title: Text('project.list'.tr(), style: AppStyles.headingTitle2),
        actions: [
          IconButton(
            icon: Icon(_isSearchVisible ? Icons.close : Icons.search),
            onPressed: _toggleSearch,
          ),
          BlocBuilder<ProjectListBloc, ProjectListState>(
            bloc: bloc,
            buildWhen: (prev, curr) => prev.filters != curr.filters,
            builder: (context, state) {
              final count = state.filters.activeCount;
              return Stack(
                alignment: Alignment.center,
                children: [
              IconButton(
                icon: const Icon(Icons.tune),
                onPressed: _openFilterSheet,
              ),
                  if (count > 0)
                    Positioned(
                      top: 8,
                      right: 6,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: AppColors.primaryERP,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1.5),
                        ),
                        child: Text(
                          '$count',
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.calendar_month),
            onPressed: () => _openDateRangePicker(bloc.state),
          ),
          const SizedBox(width: 8),
        ],
        onBackTap: () => context.pop(),
      ),
      body: Column(
        children: [
          // Search bar chỉ hiện khi bấm icon tìm kiếm
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            child: _isSearchVisible
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Tìm theo từ khóa...',
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  _searchController.clear();
                                  bloc.add(
                                    const ProjectListEvent.changeKeyword(
                                        keyword: ''),
                                  );
                                },
                              )
                            : null,
                        filled: true,
                        fillColor: AppColors.bgCard,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                      onChanged: (value) {
                        bloc.add(
                          ProjectListEvent.changeKeyword(keyword: value),
                        );
                      },
                      onSubmitted: (value) {
                        bloc.add(ProjectListEvent.search(keyword: value));
                      },
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          Expanded(
            child: BlocBuilder<ProjectListBloc, ProjectListState>(
              bloc: bloc,
              builder: (context, state) => _buildBody(state),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(ProjectListState state) {
    if (state.status == BaseStateStatus.loading && state.projects.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.status == BaseStateStatus.failed && state.projects.isEmpty) {
      return ProjectErrorView(message: state.message);
    }

    final projects = state.filteredProjects;

    if (projects.isEmpty) {
      return const ProjectEmptyView();
    }

    final isSearching = state.searchKeyword.isNotEmpty;
    final activeFilters = _buildActiveFilters(state);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: ProjectListHeader(
            total: projects.length,
            dateStart: state.dateStart,
            dateEnd: state.dateEnd,
            isSearching: isSearching,
          ),
        ),
        if (activeFilters.isNotEmpty)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: ProjectActiveFilters(
              entries: activeFilters,
              onRemove: (key) => _removeFilter(state, key),
              onClearAll: () =>
                  bloc.add(const ProjectListEvent.clearFilters()),
            ),
          ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              bloc.add(const ProjectListEvent.refresh());
              await bloc.stream.firstWhere(
                (s) => s.status != BaseStateStatus.loading,
              );
            },
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: projects.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                return ProjectCard(project: projects[index]);
              },
            ),
          ),
        ),
      ],
    );
  }

  /// Gom các tiêu chí đang lọc thành danh sách hiển thị trên chip.
  List<({ProjectFilterKey key, String value})> _buildActiveFilters(
    ProjectListState state,
  ) {
    final entries = <({ProjectFilterKey key, String value})>[];

    final customer = state.filteredCustomerName;
    if (customer != null) {
      entries.add((key: ProjectFilterKey.customer, value: customer));
    }

    final type = state.filteredProjectTypeName;
    if (type != null) {
      entries.add((key: ProjectFilterKey.type, value: type));
    }

    final status = state.filteredStatusName;
    if (status != null) {
      entries.add((key: ProjectFilterKey.status, value: status));
    }

    final sale = state.filteredSaleName;
    if (sale != null) {
      entries.add((key: ProjectFilterKey.sale, value: sale));
    }

    final tech = state.filteredTechName;
    if (tech != null) {
      entries.add((key: ProjectFilterKey.tech, value: tech));
    }

    final pm = state.filteredPmName;
    if (pm != null) {
      entries.add((key: ProjectFilterKey.pm, value: pm));
    }

    final businessField = state.filteredBusinessFieldName;
    if (businessField != null) {
      entries.add(
        (key: ProjectFilterKey.businessField, value: businessField),
      );
    }

    return entries;
  }

  /// Bỏ một tiêu chí lọc và tải lại danh sách.
  void _removeFilter(ProjectListState state, ProjectFilterKey key) {
    final current = state.filters;
    final ProjectFilters filters;

    switch (key) {
      case ProjectFilterKey.customer:
        filters = current.copyWith(customerId: null);
        break;
      case ProjectFilterKey.type:
        filters = current.copyWith(projectType: null);
        break;
      case ProjectFilterKey.status:
        filters = current.copyWith(projectStatus: null);
        break;
      case ProjectFilterKey.sale:
        filters = current.copyWith(saleId: null);
        break;
      case ProjectFilterKey.tech:
        filters = current.copyWith(techId: null);
        break;
      case ProjectFilterKey.pm:
        filters = current.copyWith(pmId: null);
        break;
      case ProjectFilterKey.businessField:
        filters = current.copyWith(businessFieldId: null);
        break;
    }

    bloc.add(ProjectListEvent.applyFilters(filters: filters));
  }

  /// Mở bottom sheet bộ lọc.
  ///
  /// Đọc `bloc.state` tại thời điểm bấm thay vì dùng state trong closure,
  /// vì `BlocBuilder` ở appBar chỉ rebuild khi `filters` thay đổi - nếu lấy
  /// state cũ thì danh sách lookup (khách hàng, trạng thái...) có thể còn
  /// rỗng và sheet sẽ không mở được.
  void _openFilterSheet() {
    final state = bloc.state;

    ProjectFilterSheet.show(
      context,
      bloc: bloc,
      currentFilters: state.filters,
      onApply: (filters) =>
          bloc.add(ProjectListEvent.applyFilters(filters: filters)),
      onClear: () => bloc.add(const ProjectListEvent.clearFilters()),
      onRetryLookup: () => bloc.add(const ProjectListEvent.reloadLookups()),
    );
  }

  /// Mở bộ chọn khoảng ngày để lọc danh sách dự án.
  void _openDateRangePicker(ProjectListState state) {
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);
    final defaultStart = DateTime(2025, 1, 1);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => DateRangePicker(
        initialStart: state.dateStart ?? defaultStart,
        initialEnd: state.dateEnd ?? todayStart,
        onApply: (start, end) {
          bloc.add(
            ProjectListEvent.changeDateRange(
              dateStart: start,
              dateEnd: end,
            ),
          );
        },
      ),
    );
  }
}
