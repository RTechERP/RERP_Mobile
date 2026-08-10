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
import '../../../../../../../auth/data/repository/auth_repository.dart';
import '../../data/datasource/models/approve_timesheet_model.dart';
import '../bloc/approve_timesheet_bloc.dart';
import '../widgets/approve_timesheet_section.dart';
import '../widgets/approve_timesheet_selection_bar.dart';

/// Màn hình TBP duyệt phiếu.
///
/// Khác Senior:
/// - Submit qua `/approve-tbp-new` (ghi `IsApprovedTP` + `IDApprovedTP`).
/// - Có cảnh báo khi chọn phiếu Senior chưa duyệt + bottom sheet bypass.
/// - Không ẩn TType nào (hiển thị tất cả nhóm).
class ApproveTimesheetTbpScreen extends StatefulWidget {
  const ApproveTimesheetTbpScreen({super.key, this.initialTType});

  /// `TType` ban đầu (từ menu Phê duyệt). Khi có giá trị (>0),
  /// API `getApproveTimesheet` sẽ chỉ trả về phiếu của loại đó.
  /// `null` → lấy tất cả các loại (TBP xem toàn bộ).
  final int? initialTType;

  @override
  State<ApproveTimesheetTbpScreen> createState() =>
      _ApproveTimesheetTbpScreenState();
}

class _ApproveTimesheetTbpScreenState
    extends
        BaseState<
            ApproveTimesheetTbpScreen,
            ApproveTimesheetEvent,
            ApproveTimesheetState,
            ApproveTimesheetBloc
        > {
  int? _approverEmployeeId;

  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    final user = await AuthRepository.getCurrentUser();
    if (!mounted) return;
    final empId = user?.employeeId ?? 0;
    setState(() => _approverEmployeeId = empId);
    if (empId == 0) return;
    bloc.add(ApproveTimesheetEvent.init(
      role: ApproveTimesheetRole.tbp,
      employeeId: empId,
      status: 0,
      tType: widget.initialTType,
    ));
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text(
          'TBP duyệt',
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
          IconButton(
            tooltip: 'Lọc',
            onPressed: () => _openFilterSheet(context, bloc.state),
            icon: Icon(
              Icons.filter_list_alt,
              color: (bloc.state.filteredStatus != null ||
                      bloc.state.filteredTTypes.isNotEmpty)
                  ? AppColors.primaryERP
                  : Colors.grey,
            ),
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
      body: _approverEmployeeId == null
          ? const Center(child: CircularProgressIndicator())
          : blocBuilder((context, state) => Column(
                children: [
                  Expanded(child: _buildBody(state)),
                  state.selectedIds.isEmpty
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
                            action: TbpAction.approve,
                            state: state,
                          ),
                          onUnapprove: () => _confirmAndDispatch(
                            context,
                            count: state.selectedIds.length,
                            action: TbpAction.unapprove,
                            state: state,
                          ),
                          onDecline: () => _handleDecline(
                            context,
                            count: state.selectedIds.length,
                          ),
                        ),
                ],
              )),
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

  /// TBP hiển thị tất cả nhóm — không ẩn TType nào.
  List<({String typeText, int tType, int count, List<ApproveTimesheetItem> items})>
      _groupByType(List<ApproveTimesheetItem> items) {
    final order = <int>[];
    final map = <int, List<ApproveTimesheetItem>>{};
    for (final item in items) {
      final key = item.tType ?? 0;
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
          showSeniorStage: false,
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
      RouteNames.personalApproveTimesheetDetail,
      extra: item,
    );
  }

  /// Xác nhận TBP duyệt / huỷ duyệt:
  /// - Chỉ hiện dialog + bottom sheet khi action = approve (duyệt).
  /// - Huỷ duyệt / từ chối → submit thẳng không cần xác nhận Senior.
  /// - Dialog hiển thị số đã/chưa duyệt Senior với màu khác nhau.
  /// - Senior đã duyệt → submit TBP approve ngay sau khi confirm.
  /// - Senior chưa duyệt → mở bottom sheet tick chọn để duyệt hộ.
  Future<void> _confirmAndDispatch(
    BuildContext context, {
    required int count,
    required TbpAction action,
    required ApproveTimesheetState state,
  }) async {
    final isApproved = action == TbpAction.approve;
    final selected = state.selectedItems;

    // Huỷ duyệt → kiểm tra trạng thái trước
    if (!isApproved) {
      final approvedItems = selected.where((e) => (e.isApprovedTP ?? 0) != 0).toList();

      // Tất cả đều đang chờ duyệt → không hợp lệ
      if (approvedItems.isEmpty) {
        DialogService.showMessage(
          context: context,
          message: 'Không có bản ghi nào hợp lệ để huỷ duyệt',
        );
        return;
      }

      // Có bản ghi đã duyệt → confirm dialog
      final confirmed = await DialogService.showConfirmDialog(
        context: context,
        title: 'Huỷ duyệt',
        message: 'Bạn có muốn huỷ duyệt $count bản ghi này không?',
      );
      if (!confirmed) return;

      bloc.add(const ApproveTimesheetEvent.tbpUnapprove());
      return;
    }

    // Duyệt → dialog thông báo Senior
    final seniorApproved = selected.where((e) => (e.isSeniorApproved ?? 0) == 1).toList();
    final notSeniorApproved = selected.where((e) => (e.isSeniorApproved ?? 0) != 1).toList();

    final confirmed = await DialogService.showConfirmTBPApprove(
      context: context,
      count: count,
      isApproved: isApproved,
      seniorApprovedCount: seniorApproved.length,
      notSeniorApprovedCount: notSeniorApproved.length,
    );
    if (!confirmed) return;

    // Senior đã duyệt → submit TBP ngay
    if (seniorApproved.isNotEmpty) {
      bloc.add(const ApproveTimesheetEvent.clearSelection());
      for (final id in seniorApproved.where((e) => e.id != null).map((e) => e.id!)) {
        bloc.add(ApproveTimesheetEvent.toggleSelection(id));
      }
      bloc.add(const ApproveTimesheetEvent.tbpApprove());
    }

    // Senior chưa duyệt → mở sheet tick chọn để duyệt hộ
    if (notSeniorApproved.isNotEmpty) {
      await _openBypassSheet(context, notSeniorApproved);
    }
  }

  Future<void> _openBypassSheet(
    BuildContext context,
    List<ApproveTimesheetItem> items,
  ) async {
    final result = await showModalBottomSheet<_BypassSheetResult>(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) => _SeniorBypassSheet(items: items),
    );

    if (result == null || result.selected.isEmpty) return;

    if (result.selectAll) {
      bloc.add(ApproveTimesheetEvent.tbpSeniorBypassApprove(items, true));
    } else {
      bloc.add(ApproveTimesheetEvent.tbpSeniorBypassApprove(result.selected, true));
    }
  }

  Future<void> _handleDecline(
    BuildContext context, {
    required int count,
  }) async {
    final reason = await DialogService.showTBPDeclineReason(
      context: context,
      count: count,
    );
    if (reason == null || reason.trim().isEmpty) return;
    bloc.add(ApproveTimesheetEvent.tbpDecline(reason.trim()));
  }

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

  Future<void> _openFilterSheet(
    BuildContext context,
    ApproveTimesheetState state,
  ) async {
    final items = state.items ?? const <ApproveTimesheetItem>[];
    final groups = _groupByType(items);
    final initialTTypes = {
      for (final g in groups)
        if (state.filteredTTypes.contains(g.tType)) g.tType,
    };

    final result = await showModalBottomSheet<_FilterResult>(
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
        return _FilterSheet(
          groups: summary,
          initialTTypes: initialTTypes.isEmpty && groups.isNotEmpty
              ? {for (final g in groups) g.tType}
              : initialTTypes,
          initialStatus: state.filteredStatus ?? 0,
        );
      },
    );

    if (result == null) return;

    if (result.statusChanged && result.status != (state.filteredStatus ?? 0)) {
      bloc.add(ApproveTimesheetEvent.setFilterStatus(result.status));
    }
    if (result.ttypesChanged && result.ttypes != state.filteredTTypes) {
      bloc.add(ApproveTimesheetEvent.setFilterTTypes(result.ttypes));
    }
  }
}

enum TbpAction { approve, unapprove }

// ===== Filter sheet (status + type) =====

class _FilterResult {
  final int? status;
  final Set<int> ttypes;
  final bool statusChanged;
  final bool ttypesChanged;

  _FilterResult({
    required this.status,
    required this.ttypes,
    required this.statusChanged,
    required this.ttypesChanged,
  });
}

class _FilterSheet extends StatefulWidget {
  const _FilterSheet({
    required this.groups,
    required this.initialTTypes,
    required this.initialStatus,
  });

  final List<({String typeText, int tType, int count})> groups;
  final Set<int> initialTTypes;
  final int initialStatus;

  @override
  State<_FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<_FilterSheet> {
  late int _status;
  late Set<int> _picked;

  static const _statusOptions = [
    (value: 0, label: 'Chờ duyệt'),
    (value: 1, label: 'Đã duyệt'),
    (value: 2, label: 'Từ chối'),
    (value: 3, label: 'Chờ huỷ'),
    (value: 4, label: 'Đã duyệt huỷ'),
  ];

  @override
  void initState() {
    super.initState();
    _status = widget.initialStatus;
    _picked = {...widget.initialTTypes};
  }

  void _toggleType(int key) {
    setState(() {
      if (_picked.contains(key)) {
        _picked.remove(key);
      } else {
        _picked.add(key);
      }
    });
  }

  void _toggleAllTypes() {
    setState(() {
      final allKeys = {for (final g in widget.groups) g.tType};
      if (_picked.containsAll(allKeys)) {
        _picked.clear();
      } else {
        _picked.addAll(allKeys);
      }
    });
  }

  bool get _hasChanges =>
      _status != widget.initialStatus ||
      !_setEquals(_picked, widget.initialTTypes);

  static bool _setEquals<T>(Set<T> a, Set<T> b) {
    if (a.length != b.length) return false;
    for (final e in a) {
      if (!b.contains(e)) return false;
    }
    return true;
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Lọc',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Trạng thái
            Text(
              'Trạng thái',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final opt in _statusOptions)
                  _StatusChip(
                    label: opt.label,
                    selected: _status == opt.value,
                    onTap: () => setState(() => _status = opt.value),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            // Loại phiếu
            Text(
              'Loại phiếu',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 4),
            _SelectAllRow(
              pickedCount: _picked.length,
              totalCount: widget.groups.length,
              onTap: _toggleAllTypes,
            ),
            const SizedBox(height: 6),
            const Divider(height: 1),
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
                      onTap: () => _toggleType(g.tType),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(
                  _FilterResult(
                    status: _status,
                    ttypes: _picked,
                    statusChanged: _status != widget.initialStatus,
                    ttypesChanged: !_setEquals(_picked, widget.initialTTypes),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryERP,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(
                  'Áp dụng',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? AppColors.primaryERP : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: selected ? Colors.white : Colors.grey.shade700,
          ),
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

// ===== Senior bypass sheet =====

class _BypassSheetResult {
  const _BypassSheetResult({required this.selected, required this.selectAll});
  final List<ApproveTimesheetItem> selected;
  final bool selectAll;
}

class _SeniorBypassSheet extends StatefulWidget {
  const _SeniorBypassSheet({required this.items});

  final List<ApproveTimesheetItem> items;

  @override
  State<_SeniorBypassSheet> createState() => _SeniorBypassSheetState();
}

class _SeniorBypassSheetState extends State<_SeniorBypassSheet> {
  late final Set<int> _picked = {
    for (final e in widget.items)
      if (e.id != null) e.id!,
  };

  bool get _allSelected => _picked.length == widget.items.length;

  void _toggleAll() {
    setState(() {
      if (_allSelected) {
        _picked.clear();
      } else {
        _picked.addAll(widget.items.where((e) => e.id != null).map((e) => e.id!));
      }
    });
  }

  List<ApproveTimesheetItem> get _selectedItems =>
      widget.items.where((e) => e.id != null && _picked.contains(e.id)).toList();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
            const Text(
              'Danh sách chưa đươc Senior duyệt',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            CheckboxListTile(
              value: _allSelected,
              onChanged: (_) => _toggleAll(),
              title: Text(
                'Chọn tất cả (${widget.items.length} phiếu)',
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              dense: true,
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
            ),
            const Divider(height: 1),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 4),
                itemCount: widget.items.length,
                separatorBuilder: (_, _) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final item = widget.items[index];
                  final id = item.id;
                  if (id == null) return const SizedBox.shrink();
                  final selected = _picked.contains(id);
                  return CheckboxListTile(
                    value: selected,
                    onChanged: (_) {
                      setState(() {
                        if (selected) {
                          _picked.remove(id);
                        } else {
                          _picked.add(id);
                        }
                      });
                    },
                    title: Text(
                      '${item.code ?? ''} - ${item.fullName ?? ''}',
                      style: const TextStyle(fontSize: 13.5),
                    ),
                    subtitle: Text(
                      'Loại: ${item.typeText ?? 'Khác'}',
                      style: const TextStyle(
                        fontSize: 11.5,
                        color: AppColors.textTertiaryColor,
                      ),
                    ),
                    dense: true,
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
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
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _picked.isEmpty
                        ? null
                        : () => Navigator.of(context).pop(
                              _BypassSheetResult(selected: _selectedItems, selectAll: false),
                            ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryERP,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      'Duyệt đã chọn',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(
                      _BypassSheetResult(selected: widget.items, selectAll: true),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.stateSuccessColor,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      'Duyệt tất cả',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
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
