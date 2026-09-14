import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/base/bloc/index.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';
import 'package:rtc_erp/base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/widgets/date_range_picker.dart';
import '../bloc/project_list_bloc.dart';
import '../widgets/project_card.dart';
import '../widgets/project_empty_view.dart';
import '../widgets/project_error_view.dart';
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
      appBar: AppBarCommon(
        title: Text('project.list'.tr(), style: AppStyles.headingTitle2),
        actions: [
          IconButton(
            icon: Icon(_isSearchVisible ? Icons.close : Icons.search),
            onPressed: _toggleSearch,
          ),
          IconButton(
            icon: const Icon(Icons.calendar_month),
            onPressed: () {
              final now = DateTime.now();
              final todayStart = DateTime(now.year, now.month, now.day);
              final tomorrow = todayStart.add(const Duration(days: 1));

              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (_) => DateRangePicker(
                  initialStart: bloc.state.dateStart ?? todayStart,
                  initialEnd: bloc.state.dateEnd ?? tomorrow,
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
            },
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
}
