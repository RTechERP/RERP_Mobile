part of 'personal_summary_bloc.dart';

@freezed
class PersonalSummaryEvent with _$PersonalSummaryEvent {
  /// Khởi tạo lần đầu (mặc định 7 ngày gần nhất).
  const factory PersonalSummaryEvent.init() = _Init;

  /// Đổi khoảng ngày lọc.
  const factory PersonalSummaryEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;

  /// Đổi filter trạng thái duyệt.
  /// - -1: tất cả
  /// - 0: chưa duyệt (chờ duyệt)
  /// - 1: đã duyệt
  /// - 2: huỷ / không duyệt
  const factory PersonalSummaryEvent.changeStatusFilter({
    required int status,
  }) = _ChangeStatusFilter;

  /// Cập nhật từ khoá tìm kiếm (client-side filter).
  const factory PersonalSummaryEvent.changeKeyword({
    required String keyword,
  }) = _ChangeKeyword;

  /// Tải lại dữ liệu giữ nguyên bộ lọc (pull-to-refresh).
  const factory PersonalSummaryEvent.refresh() = _Refresh;
}
