import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../base/bloc/bloc_status.dart';
import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/utils/dialog/dialog_service.dart';
import '../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../../../common/widgets/date_range_picker.dart';
import '../../../../../../../../routes/route_names.dart';
import '../../data/datasource/models/approve_timesheet_model.dart';
import '../bloc/approve_timesheet_bloc.dart';
import '../widgets/approve_timesheet_section.dart';
import '../widgets/approve_timesheet_selection_bar.dart';

class ApproveTimesheetSeniorScreen extends StatefulWidget {
  const ApproveTimesheetSeniorScreen({super.key});

  @override
  State<ApproveTimesheetSeniorScreen> createState() =>
      _ApproveTimesheetSeniorScreenState();
}

class _ApproveTimesheetSeniorScreenState
    extends
        BaseState<
            ApproveTimesheetSeniorScreen,
            ApproveTimesheetEvent,
            ApproveTimesheetState,
            ApproveTimesheetBloc
        > {
  @override
  void initState() {
    super.initState();
    bloc.add(const ApproveTimesheetEvent.init());
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text(
          'Senior duyệt',
          style: AppStyles.headingTitle2,
        ),
        onBackTap: () => onBack(context),
        actions: [
          IconButton(
            tooltip: 'Chọn khoảng ngày',
            onPressed: () => _openDateRangePicker(context),
            icon: Icon(
              Icons.calendar_month,
              color: AppColors.primaryERP,
            ),
          ),
          blocBuilder(
            (context, state) {
              if (state.totalCount == 0) {
                return const SizedBox.shrink();
              }
              return IconButton(
                tooltip: 'Lọc theo loại phiếu',
                onPressed: () => _openTypeFilterSheet(context, state),
                icon: const Icon(
                  Icons.filter_list_alt,
                  color: AppColors.primaryERP,
                ),
              );
            },
          ),
          blocBuilder(
            (context, state) {
              if (state.totalCount == 0) {
                return const SizedBox.shrink();
              }
              final allSelected = state.isAllSelected;
              final selectedCount = state.selectedIds.length;
              if (allSelected) {
                return TextButton(
                  onPressed: () => bloc.add(
                    const ApproveTimesheetEvent.clearSelection(),
                  ),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    'Bỏ chọn ($selectedCount)',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryERP,
                    ),
                  ),
                );
              }
              return IconButton(
                tooltip: 'Chọn tất cả',
                onPressed: () => bloc.add(
                  const ApproveTimesheetEvent.toggleSelectAll(),
                ),
                icon: const Icon(
                  Icons.checklist_rounded,
                  color: AppColors.primaryERP,
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: blocBuilder((context, state) => _buildBody(state))),
          blocBuilder(
            (context, state) => state.selectedIds.isEmpty
                ? const SizedBox.shrink()
                : ApproveTimesheetSelectionBar(
                    selectedCount: state.selectedIds.length,
                    totalCount: state.totalCount,
                    isAllSelected: state.isAllSelected,
                    onSelectAll: () => bloc.add(
                      state.isAllSelected
                          ? const ApproveTimesheetEvent.clearSelection()
                          : const ApproveTimesheetEvent.toggleSelectAll(),
                    ),
                    onApprove: () => _confirmAndDispatch(
                      context,
                      count: state.selectedIds.length,
                      action: SeniorAction.approve,
                    ),
                    onUnapprove: () => _confirmAndDispatch(
                      context,
                      count: state.selectedIds.length,
                      action: SeniorAction.unapprove,
                    ),
                    onDecline: () => _handleDecline(
                      context,
                      count: state.selectedIds.length,
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(ApproveTimesheetState state) {
    switch (state.status) {
      case BaseStateStatus.init:
      case BaseStateStatus.idle:
        return const SizedBox(height: 200);
      case BaseStateStatus.loading:
        return const SizedBox(
          height: 200,
          child: Center(child: CircularProgressIndicator()),
        );
      case BaseStateStatus.success:
      case BaseStateStatus.loadMoreSuccess:
        return _buildList(state);
      case BaseStateStatus.failed:
        return SizedBox(
          height: 200,
          child: Center(child: Text(state.message ?? 'Error')),
        );
      default:
        return const SizedBox(height: 200);
    }
  }

  /// Nhóm các phiếu theo `TType`, label lấy từ `TypeText` của nhóm.
  ///
  /// Senior không xét các nhóm `tType == 7` (Tạm ứng lương) và `tType == 9`
  /// (Đăng ký đặt xe) — các hạng mục này do TBP/BGD xử lý.
  static const _seniorHiddenTTypes = {7, 9};

  List<({String typeText, int tType, int count, List<ApproveTimesheetItem> items})>
      _groupByType(List<ApproveTimesheetItem> items) {
    final order = <int>[];
    final map = <int, List<ApproveTimesheetItem>>{};
    for (final item in items) {
      final key = item.tType ?? 0;
      if (_seniorHiddenTTypes.contains(key)) continue;
      if (!map.containsKey(key)) order.add(key);
      map.putIfAbsent(key, () => []).add(item);
    }
    return [
      for (final k in order)
        (
          typeText: map[k]!.first.typeText?.isNotEmpty == true
              ? map[k]!.first.typeText!
              : 'Khác',
          tType: k,
          count: map[k]!.length,
          items: map[k]!,
        ),
    ];
  }

  Widget _buildList(ApproveTimesheetState state) {
    final items = state.items ?? const [];
    if (items.isEmpty) {
      return const Center(child: Text('Không có phiếu cần duyệt'));
    }

    final groups = _groupByType(items);

    /// Áp dụng filter hiển thị: nếu `filteredTTypes` không rỗng → chỉ giữ
    /// nhóm thuộc tập TType đó. Rỗng → hiển thị tất cả nhóm.
    final filteredGroups = state.filteredTTypes.isEmpty
        ? groups
        : groups.where((g) => state.filteredTTypes.contains(g.tType)).toList();

    if (filteredGroups.isEmpty) {
      return const Center(child: Text('Không có phiếu cần duyệt'));
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      itemCount: filteredGroups.length,
      separatorBuilder: (_, _) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final g = filteredGroups[index];
        return ApproveTimesheetSection(
          typeText: g.typeText,
          tType: g.tType,
          count: g.items.length,
          items: g.items,
          isGroupAllSelected: state.isGroupAllSelected(g.tType),
          isGroupSomeSelected: state.isGroupSomeSelected(g.tType),
          selectedIds: state.selectedIds,
          onToggleGroup: () => bloc.add(
            ApproveTimesheetEvent.toggleSelectGroup(g.tType),
          ),
          onItemTap: (item) => _openDetail(item),
          onItemCheckboxTap: (item) => _toggleSelection(item),
        );
      },
    );
  }

  void _toggleSelection(ApproveTimesheetItem item) {
    final id = item.id;
    if (id != null) {
      bloc.add(ApproveTimesheetEvent.toggleSelection(id));
    }
  }

  void _openDetail(ApproveTimesheetItem item) {
    context.push(
      RouteNames.personalApproveSeniorTimesheetDetail,
      extra: item,
    );
  }

  /// Hiển thị DialogService xác nhận trước khi gọi API duyệt / huỷ duyệt.
  Future<void> _confirmAndDispatch(
    BuildContext context, {
    required int count,
    required SeniorAction action,
  }) async {
    final isApproved = action == SeniorAction.approve;
    final confirmed = await DialogService.showConfirmSeniorApprove(
      context: context,
      count: count,
      isApproved: isApproved,
    );
    if (!confirmed) return;
    bloc.add(
      isApproved
          ? const ApproveTimesheetEvent.seniorApprove()
          : const ApproveTimesheetEvent.seniorUnapprove(),
    );
  }

  /// Mở dialog nhập lý do từ chối. Trả về lý do nếu user bấm Lưu (không rỗng).
  Future<void> _handleDecline(
    BuildContext context, {
    required int count,
  }) async {
    final reason = await DialogService.showSeniorDeclineReason(
      context: context,
      count: count,
    );
    if (reason == null || reason.trim().isEmpty) return;
    bloc.add(ApproveTimesheetEvent.seniorDecline(reason.trim()));
  }

  /// Mở bottom sheet liệt kê các `typeText` hiện có.
  /// Auto tick theo `state.filteredTTypes` (filter hiển thị hiện tại);
  /// user điều chỉnh rồi bấm "Áp dụng" → cập nhật filter hiển thị,
  /// không ảnh hưởng selection.
  /// Mở `DateRangePicker` để user chọn khoảng ngày lọc dữ liệu.
  ///
  /// Apply → dispatch `setDateRange` → bloc set state + tự động reload.
  Future<void> _openDateRangePicker(BuildContext context) async {
    final initialStart = bloc.state.dateStart ??
        ApproveTimesheetState.defaultDateStart();
    final initialEnd =
        bloc.state.dateEnd ?? ApproveTimesheetState.defaultDateEnd();

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => DateRangePicker(
        initialStart: initialStart,
        initialEnd: initialEnd,
        onApply: (start, end) {
          bloc.add(
            ApproveTimesheetEvent.setDateRange(
              dateStart: DateTime(start.year, start.month, start.day),
              dateEnd: DateTime(end.year, end.month, end.day),
            ),
          );
        },
      ),
    );
  }

  Future<void> _openTypeFilterSheet(
    BuildContext context,
    ApproveTimesheetState state,
  ) async {
    final items = state.items ?? const <ApproveTimesheetItem>[];
    if (items.isEmpty) return;

    final groups = _groupByType(items);
    final initial = {
      for (final g in groups)
        if (state.filteredTTypes.contains(g.tType)) g.tType,
    };

    final picked = await showModalBottomSheet<Set<int>>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) {
        final summary = [
          for (final g in groups)
            (typeText: g.typeText, tType: g.tType, count: g.count),
        ];
        return _TypeFilterSheet(
          groups: summary,
          initial: initial,
        );
      },
    );

    if (picked == null) return;
    bloc.add(ApproveTimesheetEvent.setFilterTTypes(picked));
  }
}

class _TypeFilterSheet extends StatefulWidget {
  const _TypeFilterSheet({
    required this.groups,
    required this.initial,
  });

  final List<({String typeText, int tType, int count})> groups;
  final Set<int> initial;

  @override
  State<_TypeFilterSheet> createState() => _TypeFilterSheetState();
}

class _TypeFilterSheetState extends State<_TypeFilterSheet> {
  late final Set<int> _picked = {...widget.initial};

  void _toggle(int key) {
    setState(() {
      if (_picked.contains(key)) {
        _picked.remove(key);
      } else {
        _picked.add(key);
      }
    });
  }

  void _toggleAll() {
    setState(() {
      final allKeys = {for (final g in widget.groups) g.tType};
      if (_picked.containsAll(allKeys)) {
        _picked.clear();
      } else {
        _picked.addAll(allKeys);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 8,
          bottom: 12 + MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Drag handle
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            // Header
            Text(
              'Lọc theo loại phiếu',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 4),
            // Select-all row (full width, easy tap target)
            _SelectAllRow(
              pickedCount: _picked.length,
              totalCount: widget.groups.length,
              onTap: _toggleAll,
            ),
            const SizedBox(height: 6),
            const Divider(height: 1),
            // Group list
            Flexible(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 4),
                children: [
                  for (final g in widget.groups)
                    _FilterRow(
                      label: g.typeText,
                      count: g.count,
                      selected: _picked.contains(g.tType),
                      onTap: () => _toggle(g.tType),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Footer
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('Huỷ'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(_picked),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryERP,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      _picked.isEmpty
                          ? 'Lọc'
                          : 'Lọc (${_picked.length})',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SelectAllRow extends StatelessWidget {
  const _SelectAllRow({
    required this.pickedCount,
    required this.totalCount,
    required this.onTap,
  });

  final int pickedCount;
  final int totalCount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final allPicked = totalCount > 0 && pickedCount == totalCount;
    final nonePicked = pickedCount == 0;
    final isIndeterminate = !allPicked && !nonePicked;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
        child: Row(
          children: [
            Icon(
              isIndeterminate
                  ? Icons.indeterminate_check_box
                  : (allPicked ? Icons.check_box : Icons.check_box_outline_blank),
              color: allPicked || isIndeterminate
                  ? AppColors.primaryERP
                  : Colors.grey,
              size: 22,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                nonePicked
                    ? 'Chọn tất cả'
                    : (allPicked
                        ? 'Bỏ chọn tất cả'
                        : 'Chọn tất cả ($pickedCount/$totalCount)'),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: allPicked || isIndeterminate
                      ? AppColors.primaryERP
                      : Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterRow extends StatelessWidget {
  const _FilterRow({
    required this.label,
    required this.count,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final int count;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 4),
        child: Row(
          children: [
            Icon(
              selected ? Icons.check_box : Icons.check_box_outline_blank,
              color: selected ? AppColors.primaryERP : Colors.grey,
              size: 22,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                  color: selected ? AppColors.primaryERP : Colors.black87,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                color: AppColors.primaryERP.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '$count',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryERP,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Phân biệt 2 action confirm dialog: Duyệt vs Huỷ duyệt.
/// Từ chối dùng flow riêng (`_handleDecline`) vì cần dialog nhập lý do.
enum SeniorAction { approve, unapprove }
