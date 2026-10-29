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

  /// Áp dụng bộ lọc: nguồn, NV marketing, NV sale, trạng thái lead đang mở
  /// và giai đoạn.
  const factory LeadMarketingEvent.applyFilter({
    required int leadSourceId,
    required int marketingEmployeeId,
    required int saleEmployeeId,
    required bool includeOpen,
    required LeadStage? stage,
  }) = _ApplyFilter;

  /// Xóa toàn bộ bộ lọc và tải lại danh sách.
  const factory LeadMarketingEvent.clearFilter() = _ClearFilter;

  /// Tải chi tiết phiếu lead (kèm hoạt động, lịch sử và quyền thao tác).
  const factory LeadMarketingEvent.loadDetail({
    required int id,
  }) = _LoadDetail;

  /// Tải danh sách file đính kèm của phiếu lead.
  const factory LeadMarketingEvent.loadFiles({
    required int customerContactId,
  }) = _LoadFiles;

  /// Tải danh sách file PO đính kèm của phiếu lead.
  const factory LeadMarketingEvent.loadFilesPo({
    required int customerContactId,
  }) = _LoadFilesPo;
}
