part of 'approve_timesheet_bloc.dart';

@CopyWith()
class ApproveTimesheetState extends BaseBlocState {
  final List<ApproveTimesheetItem>? items;
  final List<UserTeamItem>? seniorItems;

  /// Role đang dùng bloc — Senior hoặc TBP.
  /// Không dùng để gate UI (screen chọn role khi tạo); chỉ để bloc
  /// phân biệt filter API và payload.
  final ApproveTimesheetRole role;

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

  /// EmployeeID của TBP đang đăng nhập (dùng khi submit TBP approve / decline
  /// để ghi `IDApprovedTP`).
  final int? tbpApproverEmployeeId;

  /// Đang duyệt / từ chối hàng loạt (TBP).
  final bool isTbpApproving;

  const ApproveTimesheetState({
    required super.status,
    super.message,
    this.items,
    this.seniorItems,
    this.role = ApproveTimesheetRole.senior,
    this.selectionMode = false,
    this.selectedIds = const <int>{},
    this.filteredTTypes = const <int>{},
    this.seniorId,
    this.isSeniorApproving = false,
    this.tbpApproverEmployeeId,
    this.isTbpApproving = false,
  });

  factory ApproveTimesheetState.init() => const ApproveTimesheetState(
        status: BaseStateStatus.init,
        items: [],
        role: ApproveTimesheetRole.senior,
        filteredTTypes: <int>{},
        isSeniorApproving: false,
        isTbpApproving: false,
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
      items?.where((e) => e.id != null && selectedIds.contains(e.id!)).toList() ?? const [];

  /// Phiếu chưa được Senior duyệt (isSeniorApproved != 1).
  /// Dùng cho TBP để cảnh báo + bottom sheet bypass.
  List<ApproveTimesheetItem> get notSeniorApprovedItems {
    final list = items ?? const <ApproveTimesheetItem>[];
    return list.where((e) => (e.isSeniorApproved ?? 0) != 1).toList();
  }

  int get notSeniorApprovedCount => notSeniorApprovedItems.length;

  int get seniorApprovedCount {
    final list = items ?? const <ApproveTimesheetItem>[];
    return list.where((e) => (e.isSeniorApproved ?? 0) == 1).length;
  }

  @override
  List get props => [
        status,
        message,
        items,
        seniorItems,
        role,
        selectionMode,
        selectedIds,
        filteredTTypes,
        seniorId,
        isSeniorApproving,
        tbpApproverEmployeeId,
        isTbpApproving,
      ];
}
