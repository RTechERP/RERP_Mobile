part of 'lead_marketing_bloc.dart';

/// Các sự kiện cho màn Lead Marketing của CRM.
@freezed
class LeadMarketingEvent with _$LeadMarketingEvent {
  /// Khởi tạo: tải quyền và danh sách phiếu lead.
  const factory LeadMarketingEvent.init() = _Init;

  /// Thay đổi khoảng thời gian lọc.
  const factory LeadMarketingEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;

  /// Thay đổi từ khoá tìm kiếm.
  const factory LeadMarketingEvent.changeKeyword({
    required String keyword,
  }) = _ChangeKeyword;

  /// Refresh: tải lại dữ liệu.
  const factory LeadMarketingEvent.refresh() = _Refresh;
}
