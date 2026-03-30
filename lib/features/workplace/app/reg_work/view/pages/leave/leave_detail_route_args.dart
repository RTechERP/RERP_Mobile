/// Tham số mở màn chi tiết/sửa một phiếu nghỉ (một dòng [Details] trong [Phase]).
class LeaveDetailRouteArgs {
  const LeaveDetailRouteArgs({
    required this.phaseId,
    required this.detailId,
    this.listStartDate,
    this.listTimeOnLeave,
  });

  /// EmployeeOnLeavePhaseID
  final int phaseId;

  /// ID dòng detail (EmployeeOnLeave / detail row), ví dụ 28766.
  final int detailId;

  /// Từ dòng list — dùng khi ID list ≠ ID trong get-multi (lọc theo ngày + buổi).
  final DateTime? listStartDate;
  final int? listTimeOnLeave;
}
