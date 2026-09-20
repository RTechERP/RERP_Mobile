part of 'summary_overtime_bloc.dart';

/// Các sự kiện cho màn tổng hợp phiếu làm thêm.
@freezed
class SummaryOvertimeEvent with _$SummaryOvertimeEvent {
  /// Khởi tạo: load phòng ban + dữ liệu tháng hiện tại.
  const factory SummaryOvertimeEvent.init() = _Init;

  /// Thay đổi khoảng ngày lọc.
  const factory SummaryOvertimeEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;

  /// Thay đổi từ khoá tìm kiếm NV trong picker.
  const factory SummaryOvertimeEvent.changeEmployeeKeyword({
    required String keyword,
  }) = _ChangeEmployeeKeyword;

  /// Load danh sách nhân viên phục vụ picker.
  const factory SummaryOvertimeEvent.loadEmployees({
    @Default('') String keyword,
  }) = _LoadEmployees;

  /// Chọn nhân viên để lọc danh sách phiếu.
  const factory SummaryOvertimeEvent.selectEmployee({
    int? employeeId,
    String? employeeName,
  }) = _SelectEmployee;

  /// Thay đổi bộ lọc (phòng ban, trạng thái TBP).
  const factory SummaryOvertimeEvent.changeFilters({
    int? departmentId,
    int? idApprovedTp,
  }) = _ChangeFilters;

  /// Refresh: tải lại dữ liệu.
  const factory SummaryOvertimeEvent.refresh() = _Refresh;

  /// Thay đổi từ khoá tìm kiếm phiếu OT.
  const factory SummaryOvertimeEvent.changeKeyword({
    required String keyword,
  }) = _ChangeKeyword;
}