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

  /// Tải chi tiết TT Quyết toán (TTQT) theo `accommodationBookingId`.
  /// Gọi API
  /// `GET /AccommodationBookingPaymentOrder/get-detail-by-booking-id?accommodationBookingId=<id>`.
  /// Kết quả lưu vào `state.paymentDetail` (null = chưa có TTQT).
  /// Dùng để pre-fill form Cập nhật TTQT — thay thế cho việc
  /// truyền `BookingGuestHouseItem` qua widget.
  const factory BookingGuestHouseEvent.loadPaymentDetail({
    required int id,
  }) = _LoadPaymentDetail;

  /// Reset chi tiết TTQT (paymentDetail, paymentDetailMessage,
  /// isLoadingPaymentDetail). UI gọi trước khi load lại hoặc khi
  /// đóng màn settlement để tránh hiển thị data cũ.
  const factory BookingGuestHouseEvent.clearPaymentDetail() =
      _ClearPaymentDetail;

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

  /// Gửi form lưu cập nhật TT Quyết toán (TTQT) standalone cho 1 phiếu
  /// đặt phòng nhà nghỉ — UI truyền 19 trường thuần từ form. Bloc tự
  /// resolve `currentUser` + `detailData` + build payload
  /// `Map<String, dynamic>` theo `AccommodationBookingPaymentOrderRequest`
  /// (mục 4.7 spec) + validate.
  ///
  /// Tại sao dùng event thuần (không DTO):
  /// - Event chỉ chứa data form, bloc mới là nơi xử lý business logic
  ///   (resolve user, build payload, validate). Theo pattern của màn
  ///   `submitAdvanceForm` cùng module.
  /// - ID luôn = 0 (chưa có lần lưu nào trước đó trong flow này).
  const factory BookingGuestHouseEvent.submitSettlementForm({
    /// ID phiếu đặt phòng — UI lấy từ `widget.id`.
    required int accommodationBookingId,

    /// Tổng tiền (VNĐ) — đã parse từ "x.xxx.xxx" → int.
    required int totalAmount,

    /// Tổng tiền có hóa đơn (VNĐ) — đã parse từ "x.xxx.xxx" → int.
    required int totalAmountWithInvoice,

    /// Số hóa đơn (text rỗng → BE lưu null/rỗng tuỳ ý).
    required String invoiceNumber,

    /// Số tài khoản ngân hàng (chỉ chữ số).
    required String bankAccount,

    /// ID ngân hàng; bloc lookup `BankName` chuẩn hoá từ `state.banks`.
    required int bankListId,

    /// Tên ngân hàng (text hiển thị — fallback khi không lookup được).
    required String bankName,

    /// Loại chuyển khoản (1..6 theo enum `TransferType`).
    required int transferType,

    /// ID TBP duyệt (ưu tiên). Null → bloc fallback `detail.info.approvedTBP`.
    int? approvedTbpId,

    /// Lý do quyết toán.
    required String reason,

    /// ID dự án (ưu tiên). Null → bloc fallback `detail.info.projectId`.
    int? projectId,

    /// ID công ty. Null → bloc fallback `currentUser.taxCompanyId`.
    int? companyId,

    /// Tên công ty (auto-fill từ currentUser + lookup state.taxCompanies).
    required String companyName,

    /// Tên bộ phận (auto-fill từ currentUser).
    required String departmentName,

    /// Ghi chú (optional).
    String? note,

    /// Tên khách sạn.
    required String hotelName,

    /// Mã số thuế khách sạn.
    required String hotelTaxCode,

    /// File hóa đơn đính kèm (optional, mặc định rỗng = không upload).
    /// Sau khi save-detail OK, bloc sẽ lặp từng file upload
    /// `?fileType=INVOICE`. Format cho phép: PDF / ảnh / excel.
    @Default(<PlatformFile>[]) List<PlatformFile> invoiceFiles,

    /// File bill CK đính kèm (optional, mặc định rỗng = không upload).
    /// Sau khi save-detail OK, bloc sẽ lặp từng file upload
    /// `?fileType=BILL_CK`. Format cho phép: PDF / ảnh.
    @Default(<PlatformFile>[]) List<PlatformFile> billCkFiles,
  }) = _SubmitSettlementForm;

  /// Reset các cờ + state liên quan đến flow "Cập nhật TTQT":
  /// `settlementSuccess = false`, `lastSettlementResponse = null`,
  /// `settlementMessage = null`. UI gọi sau khi đã xử lý xong
  /// success (hiện toast + pop).
  const factory BookingGuestHouseEvent.clearSettlementSubmitState() =
      _ClearSettlementSubmitState;

  /// Xoá 1 file đính kèm đã upload (TTQT). Permission: chỉ user
  /// khớp `CreatedBy` của file mới được xoá — UI ẩn nút 🗑️, BE
  /// cũng validate server-side. Sau khi xoá OK, bloc tự lọc
  /// `state.paymentDetail.files` để bỏ entry tương ứng (UI rebuild
  /// thấy danh sách mới ngay).
  const factory BookingGuestHouseEvent.removeFile({
    /// ID file cần xoá (lấy từ `BookingGuestHouseFileItem.id`).
    required int fileId,

    /// ID phiếu đặt phòng — dùng để gọi lại `loadPaymentDetail`
    /// sau khi xoá để đảm bảo state đồng bộ với server (BE có thể
    /// trả thêm field audit hoặc thay đổi status).
    required int accommodationBookingId,
  }) = _RemoveFile;

  /// Reset cờ `removeFileSuccess` + `removeFileMessage` sau khi UI
  /// đã xử lý xong (xoá entry khỏi list, hiện toast).
  const factory BookingGuestHouseEvent.clearRemoveFileState() =
      _ClearRemoveFileState;
}