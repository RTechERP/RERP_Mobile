import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../base/bloc/bloc_status.dart';
import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/utils/dialog/dialog_service.dart';
import '../../../../../../../../common/utils/navigation/navigation_utils.dart';
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
  const ApproveTimesheetTbpScreen({super.key});

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
    ));
  }

  @override
  Widget renderUI(BuildContext context) {
    // Đợi AuthRepository load xong employeeId.
    if (_approverEmployeeId == null) {
      return const BaseScaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text(
          'TBP duyệt',
          style: AppStyles.headingTitle2,
        ),
        onBackTap: () => onBack(context),
        actions: [
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
          blocBuilder(
            (context, state) => state.notSeniorApprovedCount > 0
                ? _SeniorBypassBanner(state: state)
                : const SizedBox.shrink(),
          ),
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

  /// Xác nhận TBP duyệt / huỷ duyệt. Trước khi gọi API:
  /// - Nếu có phiếu Senior chưa duyệt trong selection → hỏi user:
  ///   + "Duyệt hộ Senior" → mở bottom sheet chọn → submit bypass rồi duyệt TBP.
  ///   + "Bỏ qua" → chỉ duyệt TBP các phiếu Senior đã duyệt (loại bỏ senior-chưa-duyệt).
  ///   + "Huỷ" → không làm gì.
  Future<void> _confirmAndDispatch(
    BuildContext context, {
    required int count,
    required TbpAction action,
    required ApproveTimesheetState state,
  }) async {
    final isApproved = action == TbpAction.approve;
    final confirmed = await DialogService.showConfirmTBPApprove(
      context: context,
      count: count,
      isApproved: isApproved,
    );
    if (!confirmed) return;

    final selected = state.selectedItems;
    final notSeniorApproved =
        selected.where((e) => (e.isSeniorApproved ?? 0) != 1).toList();

    if (notSeniorApproved.isNotEmpty) {
      await _handleSeniorBypass(
        context,
        bypassItems: notSeniorApproved,
        remaining: selected
            .where((e) => (e.isSeniorApproved ?? 0) == 1)
            .toList(),
        isApproved: isApproved,
      );
      return;
    }

    bloc.add(
      isApproved
          ? const ApproveTimesheetEvent.tbpApprove()
          : const ApproveTimesheetEvent.tbpUnapprove(),
    );
  }

  /// Xử lý khi selection có phiếu Senior chưa duyệt:
  /// - Mở dialog 3 lựa chọn (Duyệt hộ / Bỏ qua / Huỷ).
  /// - Duyệt hộ → bottom sheet chọn items cần bypass → submit bypass rồi
  ///   submit TBP approve với các items còn lại.
  /// - Bỏ qua → TBP approve với chỉ các phiếu Senior đã duyệt.
  Future<void> _handleSeniorBypass(
    BuildContext context, {
    required List<ApproveTimesheetItem> bypassItems,
    required List<ApproveTimesheetItem> remaining,
    required bool isApproved,
  }) async {
    // Mở dialog chọn cách xử lý
    final choice = await _showSeniorBypassChoiceDialog(
      context,
      notSeniorApprovedCount: bypassItems.length,
    );

    switch (choice) {
      case null:
        return;
      case SeniorBypassChoice.cancel:
        return;
      case SeniorBypassChoice.skip:
        // Bỏ qua: chỉ duyệt TBP các phiếu Senior đã duyệt
        // Cập nhật selection trước khi submit
        final seniorApprovedIds = remaining
            .where((e) => e.id != null)
            .map((e) => e.id!)
            .toSet();
        bloc.add(ApproveTimesheetEvent.setSelectionByTypes({}));
        bloc.add(const ApproveTimesheetEvent.clearSelection());
        if (seniorApprovedIds.isEmpty) return;
        // Set selection lại theo các id đã duyệt Senior
        for (final id in seniorApprovedIds) {
          bloc.add(ApproveTimesheetEvent.toggleSelection(id));
        }
        bloc.add(
          isApproved
              ? const ApproveTimesheetEvent.tbpApprove()
              : const ApproveTimesheetEvent.tbpUnapprove(),
        );
        return;
      case SeniorBypassChoice.bypass:
        // Mở bottom sheet chọn items cần bypass
        final picked = await _openBypassSelectSheet(
          context,
          allCandidates: bypassItems,
        );
        if (picked == null || picked.isEmpty) return;
        bloc.add(ApproveTimesheetEvent.tbpSeniorBypassApprove(picked));
        // Sau khi bypass xong, user sẽ thấy nút "Tiếp tục duyệt TBP" xuất hiện
        // (selection giữ nguyên). Nếu muốn duyệt TBP luôn các phiếu vừa bypass,
        // có thể chọn lại rồi bấm Duyệt.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Đã duyệt Senior hộ ${picked.length} phiếu. Hãy chọn lại để duyệt TBP.',
            ),
            duration: const Duration(seconds: 3),
          ),
        );
        return;
    }
  }

  Future<SeniorBypassChoice?> _showSeniorBypassChoiceDialog(
    BuildContext context, {
    required int notSeniorApprovedCount,
  }) async {
    SeniorBypassChoice? result;
    await showDialog<void>(
      context: context,
      builder: (_) => SimpleDialog(
        title: const Text('Có phiếu Senior chưa duyệt'),
        contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              'Có $notSeniorApprovedCount phiếu trong lựa chọn chưa được Senior duyệt. Bạn muốn xử lý thế nào?',
              style: const TextStyle(fontSize: 13.5, height: 1.4),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    result = SeniorBypassChoice.cancel;
                    Navigator.of(context).pop();
                  },
                  child: const Text('Huỷ'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    result = SeniorBypassChoice.skip;
                    Navigator.of(context).pop();
                  },
                  child: const Text('Bỏ qua'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryERP,
                  ),
                  onPressed: () {
                    result = SeniorBypassChoice.bypass;
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Duyệt hộ',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    return result;
  }

  Future<List<ApproveTimesheetItem>?> _openBypassSelectSheet(
    BuildContext context, {
    required List<ApproveTimesheetItem> allCandidates,
  }) async {
    return await showModalBottomSheet<List<ApproveTimesheetItem>>(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) => _SeniorBypassSelectSheet(items: allCandidates),
    );
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

/// Banner cảnh báo có phiếu Senior chưa duyệt.
class _SeniorBypassBanner extends StatelessWidget {
  const _SeniorBypassBanner({required this.state});

  final ApproveTimesheetState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      color: AppColors.stateWarningColor.withValues(alpha: 0.12),
      child: Row(
        children: [
          const Icon(
            Icons.info_outline,
            size: 18,
            color: AppColors.stateWarningColor,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Có ${state.notSeniorApprovedCount} phiếu Senior chưa duyệt / '
              '${state.totalCount} tổng',
              style: const TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w600,
                color: AppColors.heading,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum TbpAction { approve, unapprove }

enum SeniorBypassChoice { cancel, skip, bypass }

// ===== Type filter sheet =====

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
            Text(
              'Lọc theo loại phiếu',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 4),
            _SelectAllRow(
              pickedCount: _picked.length,
              totalCount: widget.groups.length,
              onTap: _toggleAll,
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
                      onTap: () => _toggle(g.tType),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 8),
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

// ===== Senior bypass select sheet =====

class _SeniorBypassSelectSheet extends StatefulWidget {
  const _SeniorBypassSelectSheet({required this.items});

  final List<ApproveTimesheetItem> items;

  @override
  State<_SeniorBypassSelectSheet> createState() =>
      _SeniorBypassSelectSheetState();
}

class _SeniorBypassSelectSheetState extends State<_SeniorBypassSelectSheet> {
  late final Set<int> _picked = {
    for (final e in widget.items)
      if (e.id != null) e.id!,
  };

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
              'Chọn phiếu Senior duyệt hộ',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 4),
            Text(
              'Tick các phiếu muốn duyệt Senior hộ rồi bấm "Duyệt hộ".',
              style: TextStyle(
                fontSize: 12.5,
                color: AppColors.textTertiaryColor,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 8),
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
                    onPressed: () {
                      final pickedItems = widget.items
                          .where((e) => e.id != null && _picked.contains(e.id))
                          .toList();
                      Navigator.of(context).pop(pickedItems);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.stateSuccessColor,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      'Duyệt hộ (${_picked.length})',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(height: 1),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
