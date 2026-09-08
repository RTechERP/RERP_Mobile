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

  // ===== Form đăng ký (màn add) =====
  /// Khởi tạo state cho màn add: load currentUser + lookup data (cache-aware).
  const factory TestTableEvent.initAdd() = _InitAdd;

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

  /// Tải danh sách máy test thuộc một bàn test (gọi khi chọn bàn test).
  const factory TestTableEvent.loadTestMachines({
    required int testTableId,
  }) = _LoadTestMachines;
}
