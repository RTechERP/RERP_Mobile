part of 'approve_booking_guest_house_bloc.dart';

/// Event cho màn Duyệt phiếu Đặt phòng nhà nghỉ.
@freezed
class ApproveBookingGuestHouseEvent
    with _$ApproveBookingGuestHouseEvent {
  /// Tải danh sách phiếu đặt phòng nhà nghỉ theo khoảng ngày.
  /// Nếu [dateStart]/[dateEnd] không truyền thì sử dụng giá trị trong state
  /// (mặc định = tháng hiện tại).
  const factory ApproveBookingGuestHouseEvent.init({
    DateTime? dateStart,
    DateTime? dateEnd,
  }) = _Init;

  /// Thay đổi khoảng ngày lọc — gọi lại API.
  const factory ApproveBookingGuestHouseEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;

  /// Cập nhật chuỗi tìm kiếm (UI debounce rồi gửi event này).
  const factory ApproveBookingGuestHouseEvent.changeFilterText({
    required String filterText,
  }) = _ChangeFilterText;

  /// Reload lại dữ liệu với state hiện tại.
  const factory ApproveBookingGuestHouseEvent.refresh() = _Refresh;

  /// Tải danh sách dự án + nhân viên phục vụ bộ lọc.
  /// Gọi song song 2 API `/ProjectTask/get-all-project` và
  /// `/Employee?status=0&departmentID=0&keyword=`.
  const factory ApproveBookingGuestHouseEvent.loadFilters() = _LoadFilters;

  /// Chọn dự án lọc. Truyền `null` để bỏ chọn (hiển thị tất cả).
  const factory ApproveBookingGuestHouseEvent.changeProjectFilter({
    required ApproveProjectFilterItem? project,
  }) = _ChangeProjectFilter;

  /// Chọn người đăng ký lọc. Truyền `null` để bỏ chọn (hiển thị tất cả).
  const factory ApproveBookingGuestHouseEvent.changeEmployeeFilter({
    required ApproveEmployeeFilterItem? employee,
  }) = _ChangeEmployeeFilter;
}
