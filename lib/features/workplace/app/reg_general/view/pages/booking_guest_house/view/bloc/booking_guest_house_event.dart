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

  /// Tải chi tiết 1 phiếu (kèm danh sách người ở).
  /// Gọi API `GET /AccommodationBooking/accommodation-booking-by-id?id=<id>`.
  const factory BookingGuestHouseEvent.loadDetail({required int id}) =
      _LoadDetail;

  /// Gửi đề nghị tạm ứng (ĐNTU) cho 1 phiếu.
  /// [payload] là Map theo schema `AccommodationBookingAdvanceRequest`
  /// (mục 4.6) — UI build sẵn rồi dispatch.
  const factory BookingGuestHouseEvent.submitAdvance({
    required Map<String, dynamic> payload,
  }) = _SubmitAdvance;

  /// Gửi đề nghị tạm ứng (ĐNTU) cho 1 phiếu — UI truyền 13 trường
  /// thuần từ form. Bloc tự resolve `currentUser` + `detailData` + build
  /// payload `Map<String, dynamic>` theo schema
  /// `AccommodationBookingAdvanceRequest` (mục 4.6) + validate.
  ///
  /// Tại sao dùng event thuần (không DTO):
  /// - Event chỉ chứa data form, bloc mới là nơi xử lý business logic.
  /// - Theo pattern của màn `lunch` (cùng BaseState pattern): event chỉ
  ///   chứa tham số form thuần.
  const factory BookingGuestHouseEvent.submitAdvanceForm({
    /// ID phiếu đặt phòng — UI lấy từ `widget.id`.
    required int accommodationBookingId,

    /// ID TBP duyệt (ưu tiên). Null → bloc fallback `detail.info.approvedTBP`.
    int? approvedTbpId,

    /// ID dự án (ưu tiên). Null → bloc fallback `detail.info.projectId`.
    int? projectId,

    /// ID công ty. Null → bloc fallback `currentUser.taxCompanyId`.
    int? companyId,

    /// Tên công ty (auto-fill từ currentUser + lookup state.taxCompanies).
    required String companyName,

    /// Tên bộ phận (auto-fill từ currentUser).
    required String departmentName,

    /// Lý do tạm ứng.
    required String reason,

    /// Loại chuyển khoản (1..6 theo enum `TransferType`).
    required int transferType,

    /// Số tài khoản ngân hàng (chỉ chữ số).
    required String bankAccount,

    /// ID ngân hàng; bloc lookup `BankName` chuẩn hoá từ `state.banks`.
    required int bankListId,

    /// Tên ngân hàng (text hiển thị — fallback khi không lookup được).
    required String bankName,

    /// Số tiền tạm ứng (đã parse từ "x.xxx.xxx" → int).
    required int totalAmount,

    /// Ghi chú (optional).
    String? note,
  }) = _SubmitAdvanceForm;

  /// Reset các cờ + state liên quan đến flow "đề nghị tạm ứng":
  /// `advanceSuccess = false`, `lastAdvanceResponse = null`,
  /// `detailData = null`, `detailMessage = null`. UI gọi sau khi đã
  /// xử lý xong success (hiện toast + pop), để lần sau mở lại màn
  /// thấy form sạch sẽ.
  const factory BookingGuestHouseEvent.clearAdvanceSubmitState() =
      _ClearAdvanceSubmitState;
}