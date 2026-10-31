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

  /// Tải toàn bộ danh mục cần cho form tạo phiếu lead: nhóm hàng, lĩnh vực,
  /// ngành nghề, business field, tỉnh/thành và khách hàng.
  const factory LeadMarketingEvent.loadFormOptions() = _LoadFormOptions;

  /// Tải chi tiết khách hàng để fill sẵn lĩnh vực, ngành nghề, tỉnh/thành
  /// và địa chỉ lên form tạo phiếu lead.
  const factory LeadMarketingEvent.loadCustomerDetail({
    required int id,
  }) = _LoadCustomerDetail;

  /// Kiểm tra trùng lặp rồi lưu phiếu lead.
  ///
  /// Bloc sẽ gọi `POST /Lead/check-duplicate` trước; nếu API phát hiện bản ghi
  /// trùng thì dừng lại để UI hỏi người dùng, nếu không mới gọi tiếp
  /// `POST /Lead/save-data`.
  const factory LeadMarketingEvent.submitLead({
    required Map<String, dynamic> payload,
  }) = _SubmitLead;

  /// Người dùng đã xác nhận lưu phiếu lead bị trùng.
  ///
  /// Gửi lại payload để bloc gọi thẳng API lưu, bỏ qua bước kiểm tra
  /// trùng lặp.
  const factory LeadMarketingEvent.confirmDuplicateSave({
    required Map<String, dynamic> payload,
  }) = _ConfirmDuplicateSave;

  /// Người dùng huỷ lưu phiếu lead bị trùng — quay lại màn form.
  const factory LeadMarketingEvent.cancelDuplicateSave() =
      _CancelDuplicateSave;

  /// Xóa trạng thái kết quả lưu phiếu lead.
  ///
  /// Bloc là singleton nên state còn sót lại sẽ khiến màn add hiển thị lại
  /// thông báo và đẩy người dùng ra khỏi màn khi vào lại.
  const factory LeadMarketingEvent.clearSubmitState() = _ClearSubmitState;

  /// Xoá phiếu lead.
  ///
  /// [id] là ID của phiếu lead cần xoá.
  const factory LeadMarketingEvent.deleteLead({
    required int id,
  }) = _DeleteLead;

  /// Xóa trạng thái kết quả xoá phiếu lead.
  const factory LeadMarketingEvent.clearDeleteState() = _ClearDeleteState;

  /// Tải danh sách loại nhóm dùng cho form ghi hoạt động.
  const factory LeadMarketingEvent.loadActivityTypes() = _LoadActivityTypes;

  /// Ghi hoạt động lên phiếu lead.
  const factory LeadMarketingEvent.saveActivity({
    required Map<String, dynamic> payload,
  }) = _SaveActivity;

  /// Xóa trạng thái kết quả ghi hoạt động.
  const factory LeadMarketingEvent.clearActivityState() = _ClearActivityState;

  /// Xác nhận TT không phù hợp — loại bỏ lead.
  const factory LeadMarketingEvent.disqualifyLead({
    required int id,
    required String note,
  }) = _DisqualifyLead;

  /// Huỷ xác nhận TT không phù hợp — mở lại lead.
  const factory LeadMarketingEvent.reopenLead({
    required int id,
    required String note,
  }) = _ReopenLead;

  /// Xóa trạng thái kết quả loại bỏ / mở lại lead.
  const factory LeadMarketingEvent.clearStageActionState() = _ClearStageActionState;

  /// Tải danh sách Leader Sale và Admin Sale dùng cho thao tác bàn giao.
  const factory LeadMarketingEvent.loadHandoverOptions() =
      _LoadHandoverOptions;

  /// Lấy Admin Sale tương ứng với Leader Sale đã chọn.
  ///
  /// [leaderSaleId] là ID của Leader Sale được chọn.
  const factory LeadMarketingEvent.loadAdminSaleId({
    required int leaderSaleId,
  }) = _LoadAdminSaleId;

  /// Bàn giao phiếu lead cho Leader Sale.
  ///
  /// [id] là ID phiếu lead cần bàn giao.
  const factory LeadMarketingEvent.handoverLead({
    required int id,
    required int leaderEmployeeId,
    required int adminSaleId,
    required String note,
  }) = _HandoverLead;

  /// Xóa trạng thái kết quả bàn giao lead.
  const factory LeadMarketingEvent.clearHandoverState() = _ClearHandoverState;
}
