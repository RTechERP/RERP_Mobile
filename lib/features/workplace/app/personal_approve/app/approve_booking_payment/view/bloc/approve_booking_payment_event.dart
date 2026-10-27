part of 'approve_booking_payment_bloc.dart';

/// Event cho màn Duyệt ĐNTT Đặt xe / Nhà nghỉ.
@freezed
class ApproveBookingPaymentEvent with _$ApproveBookingPaymentEvent {
  /// Tải bộ lookup (bước duyệt, phòng ban, nhân viên) + trang đầu danh sách.
  const factory ApproveBookingPaymentEvent.init() = _Init;

  /// Pull-to-refresh: tải lại từ trang 1 với bộ lọc hiện tại.
  const factory ApproveBookingPaymentEvent.refresh() = _Refresh;

  /// Tải trang kế tiếp (cuộn gần cuối danh sách).
  const factory ApproveBookingPaymentEvent.loadMore() = _LoadMore;

  /// Đổi khoảng ngày lọc — gọi lại API từ trang 1.
  const factory ApproveBookingPaymentEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;

  /// Áp bộ lọc từ sheet: loại nội dung + bước duyệt + phòng ban + người tạo
  /// + từ khoá.
  const factory ApproveBookingPaymentEvent.applyFilter({
    required String? typeName,
    required ApproveBookingPaymentStep? step,
    required ApproveBookingPaymentDepartment? department,
    required ApproveBookingPaymentEmployee? employee,
    required String keyword,
  }) = _ApplyFilter;

  /// Xoá toàn bộ bộ lọc (giữ nguyên khoảng ngày).
  const factory ApproveBookingPaymentEvent.resetFilter() = _ResetFilter;
}
