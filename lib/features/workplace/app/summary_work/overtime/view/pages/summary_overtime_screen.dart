import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/constants/index.dart';
import '../../../../../../../../../common/widgets/date_range_picker.dart';
import '../../../../../../../base/widgets/base_widget.dart';
import '../../data/datasource/models/summary_overtime_model.dart';
import '../../view/bloc/summary_overtime_bloc.dart';
import '../../view/widgets/summary_overtime_card.dart';
import '../../view/widgets/summary_overtime_champion_card.dart';
import '../../view/widgets/summary_overtime_employee_picker_sheet.dart';
import '../../view/widgets/summary_overtime_filter_sheet.dart';
import '../../view/widgets/summary_overtime_rank_item_card.dart';

/// Trang tổng hợp phiếu làm thêm. Bao gồm 2 tab:
/// - Tổng hợp phiếu: danh sách các phiếu OT (có thể nhóm theo phòng ban)
/// - Xếp hạng: ranking nhân viên theo tổng giờ OT
class SummaryOvertimeScreen extends StatefulWidget {
  const SummaryOvertimeScreen({super.key});

  @override
  State<SummaryOvertimeScreen> createState() => _SummaryOvertimeScreenState();
}

class _SummaryOvertimeScreenState extends BaseState<
    SummaryOvertimeScreen,
    SummaryOvertimeEvent,
    SummaryOvertimeState,
    SummaryOvertimeBloc>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  final _searchController = TextEditingController();
  final _searchFocusNode = FocusNode();
  bool _isSearchOpen = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const SummaryOvertimeEvent.init());
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _toggleSearch() {
    setState(() {
      _isSearchOpen = !_isSearchOpen;
      if (_isSearchOpen) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) _searchFocusNode.requestFocus();
        });
      } else {
        _searchFocusNode.unfocus();
        if (_searchController.text.isNotEmpty) {
          _searchController.clear();
          bloc.add(const SummaryOvertimeEvent.changeKeyword(keyword: ''));
        }
      }
    });
  }

  void _clearSearch() {
    _searchController.clear();
    bloc.add(const SummaryOvertimeEvent.changeKeyword(keyword: ''));
  }

  void _onSearchChanged(String value) {
    bloc.add(SummaryOvertimeEvent.changeKeyword(keyword: value));
  }

  void _onSearchSubmitted(String value) {
    bloc.add(SummaryOvertimeEvent.changeKeyword(keyword: value.trim()));
  }

  void _showDateRangePicker(BuildContext context, SummaryOvertimeState state) {
    final now = DateTime.now();
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => DateRangePicker(
        initialStart: state.dateStart ?? DateTime(now.year, now.month, 1),
        initialEnd: state.dateEnd ?? now,
        onApply: (start, end) {
          bloc.add(SummaryOvertimeEvent.changeDateRange(
            dateStart: start,
            dateEnd: end,
          ));
        },
      ),
    );
  }

  void _showFilterSheet(BuildContext context, SummaryOvertimeState state) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => SummaryOvertimeFilterSheet(
        departments: state.departments,
        selectedDepartmentId: state.departmentId,
        selectedTbpStatus: state.filterApprovedTp,
        onApply: (departmentId, tbpStatus) {
          bloc.add(SummaryOvertimeEvent.changeFilters(
            departmentId: departmentId,
            idApprovedTp: tbpStatus,
          ));
        },
        onClear: () {
          bloc.add(const SummaryOvertimeEvent.changeFilters(
            departmentId: null,
            idApprovedTp: null,
          ));
        },
      ),
    );
  }

  /// Mở bottom sheet picker chọn nhân viên. Tải danh sách NV mỗi lần mở.
  void _showEmployeePicker(BuildContext context, SummaryOvertimeState state) {
    bloc.add(const SummaryOvertimeEvent.loadEmployees());

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => SummaryOvertimeEmployeePickerSheet(
        employees: state.employees,
        selectedEmployeeId: state.selectedEmployeeId,
        keyword: state.employeeKeyword,
        onKeywordChanged: (value) {
          bloc.add(SummaryOvertimeEvent.changeEmployeeKeyword(keyword: value));
        },
        onSelect: (emp) {
          bloc.add(SummaryOvertimeEvent.selectEmployee(
            employeeId: emp.id,
            employeeName: emp.fullName,
          ));
        },
      ),
    );
  }

  void _clearSelectedEmployee() {
    bloc.add(const SummaryOvertimeEvent.selectEmployee());
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocBuilder<SummaryOvertimeBloc, SummaryOvertimeState>(
      builder: (context, state) {
        final loading = state.status == BaseStateStatus.loading;
        final failed = state.status == BaseStateStatus.failed;
        final items = state.displayItems;
        final isInitialLoading = loading && items.isEmpty;

        return BaseScaffold(
          appBar: AppBarCommon(
            onBackTap: () => context.pop(),
            centerTitle: false,
            title: Text(
              'Làm thêm',
              style: AppStyles.headingTitle2,
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(64),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
                child: Container(
                  height: 44,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.gray.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.primaryERP,
                          AppColors.primaryERP.withValues(alpha: 0.85),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryERP.withValues(alpha: 0.35),
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    labelColor: Colors.white,
                    unselectedLabelColor: AppColors.gray,
                    labelStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    tabs: const [
                      Tab(text: 'Tổng hợp phiếu'),
                      Tab(text: 'Xếp hạng'),
                    ],
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.calendar_month_outlined),
                tooltip: 'Chọn ngày',
                onPressed: () => _showDateRangePicker(context, state),
              ),
              IconButton(
                icon: Badge(
                  isLabelVisible: state.departmentId != null ||
                      state.filterApprovedTp != null,
                  child: const Icon(Icons.filter_list),
                ),
                tooltip: 'Bộ lọc',
                onPressed: () => _showFilterSheet(context, state),
              ),
              IconButton(
                icon: Badge(
                  isLabelVisible: state.selectedEmployeeId != null,
                  child: const Icon(Icons.person_search_outlined),
                ),
                tooltip: 'Chọn nhân viên',
                onPressed: () => _showEmployeePicker(context, state),
              ),
              IconButton(
                icon: Icon(_isSearchOpen ? Icons.close : Icons.search),
                tooltip: 'Tìm kiếm',
                onPressed: _toggleSearch,
              ),
            ],
          ),
          body: Column(
            children: [
              if (_isSearchOpen) _buildSearchBar(),
              if (state.dateStart != null && state.dateEnd != null)
                _ListHeader(
                  total: items.length,
                  dateStart: state.dateStart,
                  dateEnd: state.dateEnd,
                  isSearching: state.selectedEmployeeId != null || state.keyword.isNotEmpty,
                ),
              if (state.selectedEmployeeId != null ||
                  state.filterApprovedTp != null ||
                  state.departmentId != null)
                _buildActiveFilters(state),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildListTab(
                      context,
                      state,
                      loading,
                      failed,
                      items,
                      isInitialLoading,
                    ),
                    _buildRankTab(context, state, loading, failed),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActiveFilters(SummaryOvertimeState state) {
    final hasFilter = state.filterApprovedTp != null ||
        state.selectedEmployeeId != null ||
        state.keyword.isNotEmpty;
    if (!hasFilter) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          if (state.keyword.isNotEmpty)
            Chip(
              avatar: const Icon(
                Icons.search,
                size: 16,
                color: AppColors.primaryERP,
              ),
              label: Text(
                state.keyword,
                style: const TextStyle(fontSize: 12),
              ),
              deleteIcon: const Icon(Icons.close, size: 16),
              onDeleted: _clearSearch,
              backgroundColor: AppColors.primaryERP.withValues(alpha: 0.1),
              side: const BorderSide(color: AppColors.primaryERP),
              labelStyle: const TextStyle(color: AppColors.primaryERP),
              deleteIconColor: AppColors.primaryERP,
            ),
          if (state.selectedEmployeeId != null)
            Chip(
              avatar: const Icon(
                Icons.person,
                size: 16,
                color: AppColors.primaryERP,
              ),
              label: Text(
                state.selectedEmployeeName ?? 'Nhân viên',
                style: const TextStyle(fontSize: 12),
              ),
              deleteIcon: const Icon(Icons.close, size: 16),
              onDeleted: _clearSelectedEmployee,
              backgroundColor: AppColors.primaryERP.withValues(alpha: 0.1),
              side: const BorderSide(color: AppColors.primaryERP),
              labelStyle: const TextStyle(color: AppColors.primaryERP),
              deleteIconColor: AppColors.primaryERP,
            ),
          if (state.filterApprovedTp != null && state.filterApprovedTp! > 0)
            Chip(
              label: Text(
                _getTbpStatusLabel(state.filterApprovedTp),
                style: const TextStyle(fontSize: 12),
              ),
              deleteIcon: const Icon(Icons.close, size: 16),
              onDeleted: () {
                bloc.add(SummaryOvertimeEvent.changeFilters(
                  departmentId: state.departmentId,
                  idApprovedTp: null,
                ));
              },
              backgroundColor: _getTbpStatusColor(state.filterApprovedTp)
                  .withValues(alpha: 0.1),
              side: BorderSide(color: _getTbpStatusColor(state.filterApprovedTp)),
              labelStyle:
                  TextStyle(color: _getTbpStatusColor(state.filterApprovedTp)),
              deleteIconColor: _getTbpStatusColor(state.filterApprovedTp),
            ),
        ],
      ),
    );
  }

  String _getTbpStatusLabel(int? status) {
    if (status == null) return '';
    switch (status) {
      case 0:
        return 'Tất cả';
      case 1:
        return 'Đã duyệt';
      case 2:
        return 'Chờ duyệt';
      default:
        return 'Trạng thái $status';
    }
  }

  Color _getTbpStatusColor(int? status) {
    switch (status) {
      case 1:
        return AppColors.greenA500;
      case 2:
        return AppColors.orangeA500;
      default:
        return AppColors.primaryERP;
    }
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: SizedBox(
        height: 44,
        child: TextField(
          controller: _searchController,
          focusNode: _searchFocusNode,
          textInputAction: TextInputAction.search,
          onChanged: _onSearchChanged,
          onSubmitted: _onSearchSubmitted,
          style: const TextStyle(fontSize: 14, color: AppColors.heading),
          decoration: InputDecoration(
            hintText: 'Tìm kiếm theo tên hoặc mã phiếu',
            hintStyle: const TextStyle(color: AppColors.hintText, fontSize: 14),
            prefixIcon: const Icon(Icons.search, color: AppColors.gray, size: 20),
            prefixIconConstraints: const BoxConstraints(minWidth: 36, minHeight: 36),
            suffixIcon: ValueListenableBuilder<TextEditingValue>(
              valueListenable: _searchController,
              builder: (context, value, _) {
                if (value.text.isEmpty) return const SizedBox.shrink();
                return IconButton(
                  icon: const Icon(Icons.clear, color: AppColors.gray, size: 18),
                  onPressed: _clearSearch,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                );
              },
            ),
            isDense: true,
            filled: true,
            fillColor: AppColors.background,
            contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.borderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primaryERP, width: 1.5),
            ),
          ),
        ),
      ),
    );
  }

  /// Nhóm items theo phòng ban.
  Map<String, List<SummaryOvertimeItem>> _groupByDepartment(
    List<SummaryOvertimeItem> items,
    List<SummaryOvertimeDepartment> departments,
  ) {
    final grouped = <String, List<SummaryOvertimeItem>>{};
    for (final item in items) {
      final name = item.departmentName?.trim().isNotEmpty == true
          ? item.departmentName!
          : 'Không xác định';
      grouped.putIfAbsent(name, () => []).add(item);
    }

    final sorted = Map<String, List<SummaryOvertimeItem>>.fromEntries(
      grouped.entries.toList()
        ..sort((a, b) {
          final idxA = departments.indexWhere((d) => d.name == a.key);
          final idxB = departments.indexWhere((d) => d.name == b.key);
          if (idxA == -1 && idxB == -1) return a.key.compareTo(b.key);
          if (idxA == -1) return 1;
          if (idxB == -1) return -1;
          return idxA.compareTo(idxB);
        }),
    );
    return sorted;
  }

  /// Đếm số nhân viên distinct theo employeeId trong một nhóm.
  int _countDistinctEmployees(List<SummaryOvertimeItem> items) {
    final seen = <int>{};
    for (final item in items) {
      if (item.employeeId != null) seen.add(item.employeeId!);
    }
    return seen.isEmpty ? items.length : seen.length;
  }

  Widget _buildListTab(
    BuildContext context,
    SummaryOvertimeState state,
    bool loading,
    bool failed,
    List<SummaryOvertimeItem> items,
    bool isInitialLoading,
  ) {
    if (failed && items.isEmpty) {
      return _buildFailedState(state);
    }

    if (items.isEmpty && !isInitialLoading) {
      return _buildEmptyState();
    }

    // Nếu đã chọn phòng ban → hiển thị phẳng.
    if (state.departmentId != null) {
      return RefreshIndicator(
        onRefresh: () async {
          bloc.add(const SummaryOvertimeEvent.refresh());
          await bloc.stream
              .firstWhere((s) => s.status != BaseStateStatus.loading);
        },
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) =>
              SummaryOvertimeCard(item: items[index]),
          separatorBuilder: (_, __) => const SizedBox(height: 8),
        ),
      );
    }

    // Không chọn phòng ban → nhóm theo phòng ban.
    final grouped = _groupByDepartment(items, state.departments);

    return RefreshIndicator(
      onRefresh: () async {
        bloc.add(const SummaryOvertimeEvent.refresh());
        await bloc.stream
            .firstWhere((s) => s.status != BaseStateStatus.loading);
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: grouped.length,
        itemBuilder: (context, index) {
          final entry = grouped.entries.elementAt(index);
          final deptName = entry.key;
          final deptItems = entry.value;
          final empCount = _countDistinctEmployees(deptItems);

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (index > 0) const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.primaryERP.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.primaryERP.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.business_outlined,
                      size: 18,
                      color: AppColors.primaryERP,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        deptName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryERP,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.primaryERP,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '$empCount nhân viên',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              ...deptItems.map((item) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: SummaryOvertimeCard(item: item),
                  )),
            ],
          );
        },
      ),
    );
  }

  Widget _buildRankTab(
    BuildContext context,
    SummaryOvertimeState state,
    bool loading,
    bool failed,
  ) {
    if (failed && state.persons.isEmpty) {
      return _buildFailedState(state);
    }

    final ranked = state.rankedPersons;

    if (ranked.isEmpty) {
      if (loading) {
        return const Center(child: CircularProgressIndicator());
      }
      return _buildEmptyState(message: 'Chưa có dữ liệu xếp hạng');
    }

    return RefreshIndicator(
      onRefresh: () async {
        bloc.add(const SummaryOvertimeEvent.refresh());
        await bloc.stream
            .firstWhere((s) => s.status != BaseStateStatus.loading);
      },
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          // Top 1 — champion card với vòng nguyệt quế lấp lánh
          SummaryOvertimeChampionCard(
            person: ranked.first,
          ),
          // Các vị trí còn lại — card trung tính, không ganh đua
          if (ranked.length > 1) ...[
            const SizedBox(height: 16),
            ...List.generate(ranked.length - 1, (i) {
              final person = ranked[i + 1];
              return Padding(
                padding: EdgeInsets.only(
                  bottom: i == ranked.length - 2 ? 0 : 10,
                ),
                child: SummaryOvertimeRankItemCard(
                  person: person,
                  rank: i + 2,
                ),
              );
            }),
          ],
        ],
      ),
    );
  }

  Widget _buildFailedState(SummaryOvertimeState state) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            Image.asset(AppImages.error, width: 320),
            const SizedBox(height: 12),
            Text(state.message ?? 'Load dữ liệu thất bại'),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => bloc.add(const SummaryOvertimeEvent.refresh()),
              child: const Text('Thử lại'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState({String message = 'Không có dữ liệu'}) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            Image.asset(AppImages.missing, width: 320),
            const SizedBox(height: 10),
            Text(message),
          ],
        ),
      ),
    );
  }
}

class _ListHeader extends StatelessWidget {
  const _ListHeader({
    required this.total,
    required this.dateStart,
    required this.dateEnd,
    required this.isSearching,
  });

  final int total;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final bool isSearching;

  @override
  Widget build(BuildContext context) {
    final df = DateFormat('dd/MM/yyyy');
    final hasRange = dateStart != null && dateEnd != null;
    final isSameDay = hasRange && _isSameDay(dateStart!, dateEnd!);
    final rangeText = hasRange
        ? (isSameDay
            ? df.format(dateStart!)
            : '${df.format(dateStart!)} - ${df.format(dateEnd!)}')
        : null;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryERP,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryERP.withValues(alpha: 0.25),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Flexible(
                            child: Text(
                              '$total',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                height: 1.1,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            'phiếu',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        isSearching ? 'Đang tìm kiếm' : 'Tổng số phiếu',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white.withValues(alpha: 0.85),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (rangeText != null) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.event_outlined, size: 14, color: AppColors.primaryERP),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      rangeText,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryERP,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}