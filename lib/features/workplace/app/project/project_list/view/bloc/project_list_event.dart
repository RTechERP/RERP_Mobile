part of 'project_list_bloc.dart';

@freezed
class ProjectListEvent with _$ProjectListEvent {
  const factory ProjectListEvent.init() = _Init;
  const factory ProjectListEvent.refresh() = _Refresh;
  const factory ProjectListEvent.search({
    String? keyword,
  }) = _Search;
  const factory ProjectListEvent.changeKeyword({
    required String keyword,
  }) = _ChangeKeyword;
  const factory ProjectListEvent.changeDateRange({
    DateTime? dateStart,
    DateTime? dateEnd,
  }) = _ChangeDateRange;

  /// Áp dụng bộ lọc mới và tải lại danh sách.
  const factory ProjectListEvent.applyFilters({
    required ProjectFilters filters,
  }) = _ApplyFilters;

  /// Xoá toàn bộ tiêu chí lọc và tải lại danh sách.
  const factory ProjectListEvent.clearFilters() = _ClearFilters;

  /// Tải lại dữ liệu lookup cho bộ lọc (khách hàng, trạng thái, nhân sự).
  const factory ProjectListEvent.reloadLookups() = _ReloadLookups;

  /// Sinh mã dự án tự động từ tên viết tắt khách hàng và kiểu dự án.
  const factory ProjectListEvent.generateProjectCode({
    required String customerShortName,
    required int projectType,
  }) = _GenerateProjectCode;

  /// Xoá mã dự án đã sinh (dùng khi đổi khách hàng hoặc kiểu dự án).
  const factory ProjectListEvent.clearGeneratedCode() = _ClearGeneratedCode;

  /// Lưu dự án. Nếu thành công sẽ tự gọi tiếp API link Gate
  /// (InitMasterTimeline) với ID dự án vừa tạo, sau đó tạo cây dự án.
  const factory ProjectListEvent.saveProject({
    required ProjectSavePayload payload,

    /// Danh sách ID loại dự án đã chọn - dùng cho API tạo cây dự án.
    @Default(<int>[]) List<int> selectedProjectTypeIds,
  }) = _SaveProject;
}
