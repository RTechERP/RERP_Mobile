part of 'personal_summary_bloc.dart';

@freezed
class PersonalSummaryEvent with _$PersonalSummaryEvent {
  /// Khởi tạo lần đầu (mặc định 2 ngày gần nhất).
  const factory PersonalSummaryEvent.init() = _Init;

  /// Đổi khoảng ngày lọc.
  const factory PersonalSummaryEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;

  /// Đổi bộ lọc (phòng ban + trạng thái duyệt bổ sung).
  /// - [departmentId]: null = theo user hiện tại.
  /// - [status]:
  ///   - -1: tất cả
  ///   - 0: chờ duyệt
  ///   - 1: đã duyệt
  ///   - 2: từ chối
  const factory PersonalSummaryEvent.changeFilters({
    int? departmentId,
    int? status,
  }) = _ChangeFilters;

  /// Cập nhật từ khoá tìm kiếm (client-side filter).
  const factory PersonalSummaryEvent.changeKeyword({
    required String keyword,
  }) = _ChangeKeyword;

  /// Tải lại dữ liệu giữ nguyên bộ lọc (pull-to-refresh).
  const factory PersonalSummaryEvent.refresh() = _Refresh;
}
