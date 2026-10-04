part of 'booking_guest_house_bloc.dart';

/// Event cho màn Đặt phòng nhà nghỉ.
@freezed
class BookingGuestHouseEvent with _$BookingGuestHouseEvent {
  /// Tải danh sách phiếu đặt phòng nhà nghỉ theo khoảng ngày.
  /// Nếu [dateStart]/[dateEnd] không truyền thì sử dụng giá trị trong state
  /// (mặc định = ngày hiện tại).
  const factory BookingGuestHouseEvent.init({
    DateTime? dateStart,
    DateTime? dateEnd,
  }) = _Init;

  /// Thay đổi khoảng ngày lọc — gọi lại API.
  const factory BookingGuestHouseEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;

  /// Cập nhật chuỗi tìm kiếm (debounce ở UI, gửi trực tiếp khi cần).
  const factory BookingGuestHouseEvent.changeFilterText({
    required String filterText,
  }) = _ChangeFilterText;

  /// Reload lại dữ liệu với state hiện tại.
  const factory BookingGuestHouseEvent.refresh() = _Refresh;

  /// Tải danh sách dự án + nhân viên phục vụ bộ lọc.
  /// Gọi song song 2 API `/ProjectTask/get-all-project` và
  /// `/Employee?status=0&departmentID=0&keyword=`.
  const factory BookingGuestHouseEvent.loadFilters() = _LoadFilters;

  /// Chọn dự án lọc. Truyền `null` để bỏ chọn (hiển thị tất cả).
  const factory BookingGuestHouseEvent.changeProjectFilter({
    required ProjectFilterItem? project,
  }) = _ChangeProjectFilter;

  /// Chọn người đăng ký lọc. Truyền `null` để bỏ chọn (hiển thị tất cả).
  const factory BookingGuestHouseEvent.changeEmployeeFilter({
    required EmployeeFilterItem? employee,
  }) = _ChangeEmployeeFilter;

  /// Gửi payload lưu phiếu đặt phòng nhà nghỉ.
  /// Body: `{ "accommodationBooking": {...}, "accommodationBookingDetails": [...], "idDeleteds": [] }`.
  const factory BookingGuestHouseEvent.submit({
    required Map<String, dynamic> payload,
  }) = _Submit;

  /// Xoá phiếu đặt phòng nhà nghỉ.
  /// [id] - ID phiếu cần xoá (API nhận mảng `[id]`).
  const factory BookingGuestHouseEvent.deleteBooking({required int id}) =
      _DeleteBooking;
}