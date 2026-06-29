part of 'approve_timesheet_bloc.dart';

@CopyWith()
class ApproveTimesheetState extends BaseBlocState {
  final List<ApproveTimesheetItem>? items;
  final List<UserTeamItem>? seniorItems;

  /// Đang ở chế độ chọn nhiều (long-press để vào).
  final bool selectionMode;

  /// Set các id (`ApproveTimesheetItem.id`) đang được chọn.
  final Set<int> selectedIds;

  /// Tập `tType` đang được filter hiển thị. Rỗng/không có → hiển thị tất cả nhóm.
  final Set<int> filteredTTypes;

  /// ID của Senior (dùng khi gửi duyệt/từ chối).
  final int? seniorId;

  /// Đang duyệt / từ chối hàng loạt (Senior).
  final bool isSeniorApproving;

  const ApproveTimesheetState({
    required super.status,
    super.message,
    this.items,
    this.seniorItems,
    this.selectionMode = false,
    this.selectedIds = const <int>{},
    this.filteredTTypes = const <int>{},
    this.seniorId,
    this.isSeniorApproving = false,
  });

  factory ApproveTimesheetState.init() => const ApproveTimesheetState(
        status: BaseStateStatus.init,
        items: [],
        filteredTTypes: <int>{},
        isSeniorApproving: false,
      );

  /// Tổng số phiếu có id hợp lệ đang hiển thị (dùng cho "chọn tất cả").
  int get totalCount => items?.where((e) => e.id != null).length ?? 0;

  /// Tất cả phiếu đã được chọn (đủ để hiển thị trạng thái "chọn tất cả").
  bool get isAllSelected =>
      totalCount > 0 && selectedIds.length >= totalCount;

  /// Tất cả phiếu của 1 nhóm `TType` đã được chọn.
  bool isGroupAllSelected(int tType) {
    final list = items?.where((e) => e.tType == tType) ?? const [];
    final ids = list.where((e) => e.id != null).map((e) => e.id!).toList();
    if (ids.isEmpty) return false;
    return ids.every(selectedIds.contains);
  }

  /// Ít nhất 1 phiếu trong nhóm đã chọn (dùng cho trạng thái indeterminate).
  bool isGroupSomeSelected(int tType) {
    final list = items?.where((e) => e.tType == tType) ?? const [];
    return list.any((e) => e.id != null && selectedIds.contains(e.id!));
  }

  bool isSelected(int? id) =>
      id != null && selectedIds.contains(id);

  /// Lấy các item đang được chọn.
  List<ApproveTimesheetItem> get selectedItems =>
      items?.where((e) => e.id != null && selectedIds.contains(e.id!)).toList() ?? [];

  @override
  List get props => [
        status,
        message,
        items,
        seniorItems,
        selectionMode,
        selectedIds,
        filteredTTypes,
        seniorId,
        isSeniorApproving,
      ];
}
