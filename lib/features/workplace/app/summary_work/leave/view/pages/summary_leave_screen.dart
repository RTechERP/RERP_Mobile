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
import '../../data/datasource/models/summary_leave_model.dart';
import '../../view/bloc/summary_leave_bloc.dart';
import '../../view/widgets/summary_leave_card.dart';
import '../../view/widgets/summary_leave_filter_sheet.dart';

class SummaryLeaveScreen extends StatefulWidget {
  const SummaryLeaveScreen({super.key});

  @override
  State<SummaryLeaveScreen> createState() => _SummaryLeaveScreenState();
}

class _SummaryLeaveScreenState
    extends BaseState<SummaryLeaveScreen, SummaryLeaveEvent, SummaryLeaveState, SummaryLeaveBloc> {
  final _searchController = TextEditingController();
  final _searchFocusNode = FocusNode();
  bool _isSearchOpen = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const SummaryLeaveEvent.init());
    });
  }

  @override
  void dispose() {
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
          bloc.add(const SummaryLeaveEvent.changeKeyword(keyword: ''));
        }
      }
    });
  }

  void _clearSearch() {
    _searchController.clear();
    bloc.add(const SummaryLeaveEvent.changeKeyword(keyword: ''));
  }

  void _showDateRangePicker(BuildContext context, SummaryLeaveState state) {
    final now = DateTime.now();
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => DateRangePicker(
        initialStart: state.dateStart ?? DateTime(now.year, now.month, 1),
        initialEnd: state.dateEnd ?? now,
        onApply: (start, end) {
          bloc.add(SummaryLeaveEvent.changeDateRange(
            dateStart: start,
            dateEnd: end,
          ));
        },
      ),
    );
  }

  void _showFilterSheet(BuildContext context, SummaryLeaveState state) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => SummaryLeaveFilterSheet(
        departments: state.departments,
        selectedDepartmentId: state.departmentId,
        selectedStatus: state.filterStatus,
        onApply: (departmentId, status) {
          bloc.add(SummaryLeaveEvent.changeFilters(
            departmentId: departmentId,
            status: status,
          ));
        },
        onClear: () {
          bloc.add(const SummaryLeaveEvent.changeFilters(
            departmentId: null,
            status: null,
          ));
        },
      ),
    );
  }

  void _onSearchChanged(String value) {
    bloc.add(SummaryLeaveEvent.changeKeyword(keyword: value));
  }

  void _onSearchSubmitted(String value) {
    bloc.add(SummaryLeaveEvent.changeKeyword(keyword: value.trim()));
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocBuilder<SummaryLeaveBloc, SummaryLeaveState>(
      builder: (context, state) {
        final loading = state.status == BaseStateStatus.loading;
        final failed = state.status == BaseStateStatus.failed;
        final items = state.displayItems;
        final isInitialLoading = loading && items.isEmpty;

        return BaseScaffold(
          appBar: AppBarCommon(
            onBackTap: () => context.pop(),
            title: Text(
              'Đăng ký nghỉ',
              style: AppStyles.headingTitle2,
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.calendar_month_outlined),
                tooltip: 'Chọn ngày',
                onPressed: () => _showDateRangePicker(context, state),
              ),
              IconButton(
                icon: Badge(
                  isLabelVisible: state.departmentId != null || state.filterStatus != null,
                  child: const Icon(Icons.filter_list),
                ),
                tooltip: 'Bộ lọc',
                onPressed: () => _showFilterSheet(context, state),
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
                  isSearching: state.keyword.isNotEmpty,
                ),
              if (state.filterStatus != null)
                _buildActiveFilters(state),
              Expanded(
                child: _buildContent(context, state, loading, failed, items, isInitialLoading),
              ),
            ],
          ),
        );
      },
    );
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
            hintText: 'Tìm kiếm',
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

  Widget _buildActiveFilters(SummaryLeaveState state) {
    final hasFilter = state.departmentId != null || state.filterStatus != null;
    if (!hasFilter) return const SizedBox.shrink();

    String? deptName;
    if (state.departmentId != null) {
      final dept = state.departments.where((d) => d.id == state.departmentId).firstOrNull;
      deptName = dept?.name;
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          if (state.departmentId != null)
            Chip(
              label: Text(deptName ?? 'Phòng ban', style: const TextStyle(fontSize: 12)),
              deleteIcon: const Icon(Icons.close, size: 16),
              onDeleted: () {
                bloc.add(SummaryLeaveEvent.changeFilters(
                  departmentId: null,
                  status: state.filterStatus,
                ));
              },
              backgroundColor: AppColors.primaryERP.withValues(alpha: 0.1),
              side: const BorderSide(color: AppColors.primaryERP),
              labelStyle: const TextStyle(color: AppColors.primaryERP),
              deleteIconColor: AppColors.primaryERP,
            ),
          if (state.filterStatus != null)
            Chip(
              label: Text(_getStatusLabel(state.filterStatus), style: const TextStyle(fontSize: 12)),
              deleteIcon: const Icon(Icons.close, size: 16),
              onDeleted: () {
                bloc.add(SummaryLeaveEvent.changeFilters(
                  departmentId: state.departmentId,
                  status: null,
                ));
              },
              backgroundColor: _getStatusColor(state.filterStatus).withValues(alpha: 0.1),
              side: BorderSide(color: _getStatusColor(state.filterStatus)),
              labelStyle: TextStyle(color: _getStatusColor(state.filterStatus)),
              deleteIconColor: _getStatusColor(state.filterStatus),
            ),
        ],
      ),
    );
  }

  String _getStatusLabel(int? status) {
    if (status == null) return '';
    switch (status) {
      case -1:
        return 'Tất cả';
      case 0:
        return 'Chưa duyệt';
      case 1:
        return 'Đã duyệt';
      default:
        return 'Trạng thái $status';
    }
  }

  Color _getStatusColor(int? status) {
    switch (status) {
      case -1:
        return AppColors.primaryERP;
      case 0:
        return AppColors.orangeA500;
      case 1:
        return AppColors.greenA500;
      default:
        return AppColors.gray;
    }
  }

  /// Nhóm items theo phòng ban (departmentId → danh sách items).
  /// Trả về map đã sort theo departmentName.
  Map<String, List<SummaryLeaveItem>> _groupByDepartment(
    List<SummaryLeaveItem> items,
    List<SummaryDepartment> departments,
  ) {
    final grouped = <String, List<SummaryLeaveItem>>{};
    for (final item in items) {
      final name = item.departmentName?.trim().isNotEmpty == true
          ? item.departmentName!
          : 'Không xác định';
      grouped.putIfAbsent(name, () => []).add(item);
    }

    // Sort groups by department name matching departments list order
    final sorted = Map<String, List<SummaryLeaveItem>>.fromEntries(
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
  int _countDistinctEmployees(List<SummaryLeaveItem> items) {
    final seen = <int>{};
    for (final item in items) {
      if (item.employeeId != null) seen.add(item.employeeId!);
    }
    return seen.isEmpty ? items.length : seen.length;
  }

  Widget _buildContent(
    BuildContext context,
    SummaryLeaveState state,
    bool loading,
    bool failed,
    List<SummaryLeaveItem> items,
    bool isInitialLoading,
  ) {
    if (failed && items.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.error, width: 320),
            const SizedBox(height: 12),
            Text(state.message ?? 'Load dữ liệu thất bại'),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => bloc.add(const SummaryLeaveEvent.refresh()),
              child: const Text('Thử lại'),
            ),
          ],
        ),
      );
    }

    if (items.isEmpty && !isInitialLoading) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.missing, width: 320),
            const SizedBox(height: 10),
            const Text('Không có dữ liệu'),
          ],
        ),
      );
    }

    // Nếu chọn phòng ban cụ thể → hiển thị phẳng
    if (state.departmentId != null) {
      return RefreshIndicator(
        onRefresh: () async {
          bloc.add(const SummaryLeaveEvent.refresh());
          await bloc.stream.firstWhere((s) => s.status != BaseStateStatus.loading);
        },
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) => SummaryLeaveCard(item: items[index]),
          separatorBuilder: (_, __) => const SizedBox(height: 8),
        ),
      );
    }

    // Không chọn phòng ban → nhóm theo phòng ban
    final grouped = _groupByDepartment(items, state.departments);

    return RefreshIndicator(
      onRefresh: () async {
        bloc.add(const SummaryLeaveEvent.refresh());
        await bloc.stream.firstWhere((s) => s.status != BaseStateStatus.loading);
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (index > 0) const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
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
                    child: SummaryLeaveCard(item: item),
                  )),
            ],
          );
        },
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
