part of 'summary_missed_bloc.dart';

/// Các sự kiện cho màn tổng hợp phiếu quên chấm công.
@freezed
class SummaryMissedEvent with _$SummaryMissedEvent {
  /// Khởi tạo: load phòng ban + dữ liệu tháng hiện tại.
  const factory SummaryMissedEvent.init() = _Init;

  /// Thay đổi khoảng ngày lọc.
  const factory SummaryMissedEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;

  /// Thay đổi từ khoá tìm kiếm.
  const factory SummaryMissedEvent.changeKeyword({
    required String keyword,
  }) = _ChangeKeyword;

  /// Thay đổi bộ lọc (phòng ban, trạng thái).
  const factory SummaryMissedEvent.changeFilters({
    int? departmentId,
    int? status,
  }) = _ChangeFilters;

  /// Refresh: tải lại dữ liệu.
  const factory SummaryMissedEvent.refresh() = _Refresh;
}