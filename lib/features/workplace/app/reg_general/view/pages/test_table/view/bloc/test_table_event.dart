part of 'test_table_bloc.dart';

/// Sự kiện màn danh sách và form đăng ký bàn test.
@freezed
class TestTableEvent with _$TestTableEvent {
  // ===== Danh sách =====
  /// Tải danh sách phiếu đăng ký (màn list).
  const factory TestTableEvent.init() = _Init;

  /// Làm mới danh sách.
  const factory TestTableEvent.refresh() = _Refresh;

  /// Đổi từ khóa tìm kiếm.
  const factory TestTableEvent.changeKeyword({
    required String keyword,
  }) = _ChangeKeyword;

  /// Đổi bộ lọc trạng thái phiếu.
  /// [status] = -1 (tất cả) / 0 / 1 / 2.
  const factory TestTableEvent.changeStatus({
    required int status,
  }) = _ChangeStatus;

  /// Đổi khoảng ngày lọc danh sách.
  /// Truyền null ở cả 2 phía để bỏ filter ngày.
  const factory TestTableEvent.changeDateRange({
    DateTime? dateStart,
    DateTime? dateEnd,
  }) = _ChangeDateRange;

  // ===== Form đăng ký (màn add) =====
  /// Khởi tạo state cho màn add: load currentUser + lookup data (cache-aware).
  /// [prefillTestTableId] = nếu có (vd từ QR scan) thì tự động điền vào form.
  const factory TestTableEvent.initAdd({
    int? prefillTestTableId,
  }) = _InitAdd;

  /// Cập nhật một hoặc nhiều field của form. Dùng `clearX: true` để reset về null.
  /// Form data được UI điều khiển thông qua event này — bloc không tự ý set.
  /// `registrationContent` không nhận từ UI — bloc tự derive từ `project.projectName`.
  const factory TestTableEvent.updateForm({
    ProjectItem? project,
    int? testTableId,
    List<int>? selectedMachineIds,
    int? ownerId,
    int? approverId,
    DateTime? startDate,
    @Default(false) bool clearProject,
    @Default(false) bool clearTestTableId,
    @Default(false) bool clearSelectedMachineIds,
    @Default(false) bool clearOwnerId,
    @Default(false) bool clearApproverId,
    @Default(false) bool clearStartDate,
  }) = _UpdateForm;

  /// Gọi API check-conflict với current formData (chỉ check, chưa save).
  const factory TestTableEvent.checkConflict() = _CheckConflict;

  /// Submit phiếu đăng ký (sau khi đã check-conflict thành công).
  const factory TestTableEvent.submitRegistration() = _SubmitRegistration;

  /// Reset các cờ submit/checkConflict sau khi màn add đã pop.
  const factory TestTableEvent.resetSubmitFlags() = _ResetSubmitFlags;

  /// Reset cờ `deletedMasterId` / `deleteError` sau khi UI đã xử lý.
  const factory TestTableEvent.clearDeleteFeedback() = _ClearDeleteFeedback;

  /// Xóa phiếu đăng ký theo [masterId]. Trigger từ swipe-to-delete trên card.
  const factory TestTableEvent.deleteCard({
    required int masterId,
  }) = _DeleteCard;

  /// Tải danh sách máy test thuộc một bàn test (gọi khi chọn bàn test).
  const factory TestTableEvent.loadTestMachines({
    required int testTableId,
  }) = _LoadTestMachines;

  // ===== QR / Deep link =====
  /// Tra cứu bàn test theo [barcode] + [tableSide] trong cache lookup
  /// (`state.testTable`). Trả kết quả qua `state.foundTestTable` + `message`.
  const factory TestTableEvent.findTestTableByBarcode({
    required String barcode,
    required int tableSide,
  }) = _FindTestTableByBarcode;

  // ===== Edit =====
  /// Khởi tạo state cho màn edit: load chi tiết phiếu card từ API.
  const factory TestTableEvent.initEdit({
    required int registrationId,
    TestCardItem? cardItem,
  }) = _InitEdit;

  /// Submit cập nhật phiếu đăng ký (từ màn edit).
  const factory TestTableEvent.editSubmit() = _EditSubmit;
}
