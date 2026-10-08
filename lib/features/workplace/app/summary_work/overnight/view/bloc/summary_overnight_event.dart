part of 'summary_overnight_bloc.dart';

/// Các sự kiện cho màn tổng hợp phiếu làm đêm.
@freezed
class SummaryOvernightEvent with _$SummaryOvernightEvent {
  /// Khởi tạo: load phòng ban + dữ liệu tháng hiện tại.
  const factory SummaryOvernightEvent.init() = _Init;

  /// Thay đổi khoảng ngày lọc.
  const factory SummaryOvernightEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;

  /// Thay đổi từ khoá tìm kiếm.
  const factory SummaryOvernightEvent.changeKeyword({
    required String keyword,
  }) = _ChangeKeyword;

  /// Thay đổi bộ lọc (phòng ban, trạng thái).
  const factory SummaryOvernightEvent.changeFilters({
    int? departmentId,
    int? status,
  }) = _ChangeFilters;

  /// Refresh: tải lại dữ liệu.
  const factory SummaryOvernightEvent.refresh() = _Refresh;
}