import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/constants/index.dart';
import '../../../../../../../../../common/utils/dialog/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../routes/route_names.dart';
import '../../data/datasource/models/work_category_model.dart';
import '../bloc/work_category_bloc.dart';
import '../widgets/work_category_card.dart';

// ---------------------------------------------------------------------------
// Status filter tabs
// ---------------------------------------------------------------------------
enum _WorkStatusTab {
  all(-1, 'Tất cả'),
  inProgress(1, 'Đang làm'),
  done(2, 'Hoàn thành'),
  notStarted(0, 'Chưa làm'),
  pending(3, 'Pending');

  const _WorkStatusTab(this.statusCode, this.label);
  final int statusCode;
  final String label;
}

// ---------------------------------------------------------------------------
// Screen
// ---------------------------------------------------------------------------
class WorkCategoryScreen extends StatefulWidget {
  const WorkCategoryScreen({super.key});

  @override
  State<WorkCategoryScreen> createState() => _WorkCategoryScreenState();
}

class _WorkCategoryScreenState
    extends BaseState<WorkCategoryScreen, WorkCategoryEvent, WorkCategoryState,
        WorkCategoryBloc>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _WorkStatusTab.values.length,
      vsync: this,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const WorkCategoryEvent.init());
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _openAdd(BuildContext context) async {
    final reload =
        await context.push<bool?>(RouteNames.workCategoryAdd);
    if (!mounted) return;
    if (reload == true) bloc.add(const WorkCategoryEvent.init());
  }

  Future<void> _openDetail(BuildContext context, WorkCategoryItem item) async {
    final reload = await context.push<bool?>(
      RouteNames.workCategoryDetail,
      extra: item,
    );
    if (!mounted) return;
    if (reload == true) bloc.add(const WorkCategoryEvent.init());
  }

  // ---------------------------------------------------------------------------
  // Skeleton placeholder
  // ---------------------------------------------------------------------------
  static WorkCategoryItem _skeletonItem(int i) => WorkCategoryItem(
        id: i,
        status: 1,
        stt: '',
        userId: 0,
        projectId: 0,
        mission: 'Skeleton mission text',
        note: '',
        totalDayPlan: 5,
        percentItem: 60,
        parentId: 0,
        totalDayActual: 3,
        itemLate: 0,
        timeSpan: 0,
        typeProjectItem: 0,
        percentageActual: 0,
        employeeIdRequest: 0,
        isApproved: 0,
        code: 'WC-SKEL-00$i',
        createdBy: '',
        updatedBy: '',
        isUpdateLate: false,
        reasonLate: '',
        isApprovedLate: false,
        employeeRequestId: 0,
        isDeleted: false,
        location: '',
        fullName: '',
        statusText: 'Đang làm',
        projectEmployee: '',
        projectEmployeeName: '',
        employeeRequest: '',
        isApprovedText: '',
        createdName: '',
        projectTypeName: 'Kiểu dự án skeleton',
        employeeRequestFullName: '',
        statusUpdate: 0,
        isUpdateProblem: 0,
        itemLateActual: 0,
        totalDayExpridSoon: 0,
        planStartDate: DateTime.now(),
        planEndDate: DateTime.now().add(const Duration(days: 30)),
      );

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------
  @override
  Widget renderUI(BuildContext context) {
    return BlocListener<WorkCategoryBloc, WorkCategoryState>(
      listenWhen: (prev, curr) =>
          prev.deleteSuccess != curr.deleteSuccess ||
          (curr.message != null &&
              curr.message!.isNotEmpty &&
              prev.message != curr.message &&
              !curr.isDeleting),
      listener: (context, state) {
        if (state.deleteSuccess) {
          showMessage(context, 'Xoá thành công', type: SnackBarType.success);
          return;
        }
        if ((state.message ?? '').isNotEmpty) {
          showMessage(context, state.message!, type: SnackBarType.error);
        }
      },
      child: BlocBuilder<WorkCategoryBloc, WorkCategoryState>(
        bloc: bloc,
        builder: (context, state) {
          final items = state.workCategories;
          final loading = state.status == BaseStateStatus.loading;
          final failed = state.status == BaseStateStatus.failed;
          final isInitialLoading =
              loading && items.isEmpty && !state.isDeleting;

          return BaseScaffold(
            appBar: AppBarCommon(
              onBackTap: () => context.pop(),
              title: Text(
                'Hạng mục công việc',
                style: AppStyles.headingTitle2,
              ),
              bottom: TabBar(
                controller: _tabController,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                labelColor: AppColors.primaryERP,
                unselectedLabelColor: AppColors.gray,
                indicatorColor: AppColors.primaryERP,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
                tabs: _WorkStatusTab.values
                    .map((t) => Tab(text: t.label))
                    .toList(),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => _openAdd(context),
              backgroundColor: AppColors.primaryERP,
              elevation: 6,
              shape: const CircleBorder(),
              child: const Icon(Icons.add, color: Colors.white, size: 28),
            ),
            body: TabBarView(
              controller: _tabController,
              children: _WorkStatusTab.values.map((tab) {
                return _WorkCategoryTabBody(
                  tab: tab,
                  allItems: items,
                  isInitialLoading: isInitialLoading,
                  failed: failed,
                  message: state.message,
                  isDeleting: state.isDeleting,
                  onRetry: () => bloc.add(const WorkCategoryEvent.init()),
                  onRefresh: () async {
                    bloc.add(const WorkCategoryEvent.init());
                    await bloc.stream.firstWhere(
                      (s) => s.status != BaseStateStatus.loading,
                    );
                  },
                  onTap: (item) => _openDetail(context, item),
                  onDelete: (item) async {
                    Slidable.of(context)?.close();
                    final confirmed =
                        await DialogService.showConfirmDelete(context: context);
                    if (!mounted) return;
                    if (confirmed) {
                      bloc.add(WorkCategoryEvent.onCancelSubmit(id: item.id));
                    }
                  },
                  skeletonItem: _skeletonItem,
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Tab body widget
// ---------------------------------------------------------------------------
class _WorkCategoryTabBody extends StatelessWidget {
  const _WorkCategoryTabBody({
    required this.tab,
    required this.allItems,
    required this.isInitialLoading,
    required this.failed,
    required this.message,
    required this.isDeleting,
    required this.onRetry,
    required this.onRefresh,
    required this.onTap,
    required this.onDelete,
    required this.skeletonItem,
  });

  final _WorkStatusTab tab;
  final List<WorkCategoryItem> allItems;
  final bool isInitialLoading;
  final bool failed;
  final String? message;
  final bool isDeleting;
  final VoidCallback onRetry;
  final Future<void> Function() onRefresh;
  final void Function(WorkCategoryItem) onTap;
  final void Function(WorkCategoryItem) onDelete;
  final WorkCategoryItem Function(int) skeletonItem;

  List<WorkCategoryItem> get _filtered {
    if (tab == _WorkStatusTab.all) return allItems;
    return allItems.where((e) => e.status == tab.statusCode).toList();
  }

  @override
  Widget build(BuildContext context) {
    // Error state
    if (failed && allItems.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.error, width: 280),
            const SizedBox(height: 12),
            Text(message ?? 'Load dữ liệu thất bại'),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: onRetry,
              child: const Text('Thử lại'),
            ),
          ],
        ),
      );
    }

    final displayItems = isInitialLoading
        ? List.generate(3, skeletonItem)
        : _filtered;

    // Empty state (not loading)
    if (displayItems.isEmpty && !isInitialLoading) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.missing, width: 280),
            const SizedBox(height: 10),
            const Text('Không có dữ liệu'),
          ],
        ),
      );
    }

    // Compute which item IDs are parents (at least one child points to them)
    final parentIds = <int>{};
    for (final it in allItems) {
      if (it.parentId > 0) parentIds.add(it.parentId);
    }

    return Skeletonizer(
      containersColor: AppColors.white,
      enabled: isInitialLoading,
      child: RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView.separated(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 80),
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: displayItems.length,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final item = displayItems[index];
            // return Slidable(
            //   key: ValueKey('wc_${item.id}'),
            //   groupTag: 'wc_slidable',
            //   endActionPane: ActionPane(
            //     motion: const DrawerMotion(),
            //     extentRatio: 0.28,
            //     children: [
            //       SlidableAction(
            //         onPressed: (_) => onDelete(item),
            //         backgroundColor: AppColors.alert,
            //         foregroundColor: Colors.white,
            //         icon: Icons.delete_outline,
            //         label: 'Xoá',
            //       ),
            //     ],
            //   ),
            //   child: WorkCategoryCard(
            //     item: item,
            //     isParent: parentIds.contains(item.id),
            //     onTap: () => onTap(item),
            //   ),
            // );
            return WorkCategoryCard(
              item: item,
              isParent: parentIds.contains(item.id),
              onTap: () => onTap(item),
            );
          },
        ),
      ),
    );
  }
}
