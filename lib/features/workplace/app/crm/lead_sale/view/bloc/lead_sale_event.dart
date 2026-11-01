part of 'lead_sale_bloc.dart';

/// Các sự kiện cho màn Lead Marketing của CRM.
@freezed
class LeadSaleEvent with _$LeadSaleEvent {
  /// Khởi tạo: tải quyền và danh sách phiếu lead.
  const factory LeadSaleEvent.init() = _Init;

  /// Thay đổi khoảng thời gian lọc.
  const factory LeadSaleEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;

  /// Thay đổi từ khoá tìm kiếm.
  const factory LeadSaleEvent.changeKeyword({required String keyword}) =
      _ChangeKeyword;

  /// Refresh: tải lại dữ liệu.
  const factory LeadSaleEvent.refresh() = _Refresh;

  /// Áp dụng bộ lọc: nguồn, NV marketing, NV sale, trạng thái lead đang mở
  /// và giai đoạn.
  const factory LeadSaleEvent.applyFilter({
    required int leadSourceId,
    required int marketingEmployeeId,
    required int saleEmployeeId,
    required bool includeOpen,
    required LeadSaleStage? stage,
  }) = _ApplyFilter;

  /// Xóa toàn bộ bộ lọc và tải lại danh sách.
  const factory LeadSaleEvent.clearFilter() = _ClearFilter;

  /// Tải chi tiết phiếu lead (kèm hoạt động, lịch sử và quyền thao tác).
  const factory LeadSaleEvent.loadDetail({required int id}) = _LoadDetail;

  /// Tải danh sách file đính kèm của phiếu lead.
  const factory LeadSaleEvent.loadFiles({required int customerContactId}) =
      _LoadFiles;

  /// Tải danh sách file PO đính kèm của phiếu lead.
  const factory LeadSaleEvent.loadFilesPo({required int customerContactId}) =
      _LoadFilesPo;

  /// Lưu file đính kèm mới lên phiếu lead.
  ///
  /// [files] là danh sách file người dùng chọn, [fileType] là nhóm file
  /// (1 = file thường, 2 = file PO).
  const factory LeadSaleEvent.saveFiles({
    required int customerContactId,
    required int fileType,
    required List<PlatformFile> files,
    @Default('') String note,
  }) = _SaveFiles;

  /// Xoá file đính kèm của phiếu lead.
  ///
  /// [fileId] là ID của file cần xoá, [fileType] là nhóm file chứa file đó
  /// (1 = file thường, 2 = file PO) để tải lại đúng danh sách.
  const factory LeadSaleEvent.deleteFile({
    required int fileId,
    @Default(1) int fileType,
  }) = _DeleteFile;

  /// Xoá trạng thái kết quả lưu / xoá file đính kèm.
  ///
  /// Được gọi sau khi UI đã hiển thị thông báo. Bloc là singleton nên nếu
  /// không xoá, lần mở màn sau sẽ hiện lại thông báo cũ.
  const factory LeadSaleEvent.clearFileActionState() = _ClearFileActionState;

  /// Tải toàn bộ danh mục cần cho form tạo phiếu lead: nhóm hàng, lĩnh vực,
  /// ngành nghề, business field, tỉnh/thành và khách hàng.
  const factory LeadSaleEvent.loadFormOptions() = _LoadFormOptions;

  /// Tải chi tiết khách hàng để fill sẵn lĩnh vực, ngành nghề, tỉnh/thành
  /// và địa chỉ lên form tạo phiếu lead.
  const factory LeadSaleEvent.loadCustomerDetail({required int id}) =
      _LoadCustomerDetail;

  /// Kiểm tra trùng lặp rồi lưu phiếu lead.
  ///
  /// Bloc sẽ gọi `POST /Lead/check-duplicate` trước; nếu API phát hiện bản ghi
  /// trùng thì dừng lại để UI hỏi người dùng, nếu không mới gọi tiếp
  /// `POST /Lead/save-data`.
  const factory LeadSaleEvent.submitLead({
    required Map<String, dynamic> payload,
  }) = _SubmitLead;

  /// Người dùng đã xác nhận lưu phiếu lead bị trùng.
  ///
  /// Gửi lại payload để bloc gọi thẳng API lưu, bỏ qua bước kiểm tra
  /// trùng lặp.
  const factory LeadSaleEvent.confirmDuplicateSave({
    required Map<String, dynamic> payload,
  }) = _ConfirmDuplicateSave;

  /// Người dùng huỷ lưu phiếu lead bị trùng — quay lại màn form.
  const factory LeadSaleEvent.cancelDuplicateSave() = _CancelDuplicateSave;

  /// Xóa trạng thái kết quả lưu phiếu lead.
  ///
  /// Bloc là singleton nên state còn sót lại sẽ khiến màn add hiển thị lại
  /// thông báo và đẩy người dùng ra khỏi màn khi vào lại.
  const factory LeadSaleEvent.clearSubmitState() = _ClearSubmitState;

  /// Xoá phiếu lead.
  ///
  /// [id] là ID của phiếu lead cần xoá.
  const factory LeadSaleEvent.deleteLead({required int id}) = _DeleteLead;

  /// Xóa trạng thái kết quả xoá phiếu lead.
  const factory LeadSaleEvent.clearDeleteState() = _ClearDeleteState;

  /// Tải danh sách loại nhóm dùng cho form ghi hoạt động.
  const factory LeadSaleEvent.loadActivityTypes() = _LoadActivityTypes;

  /// Ghi hoạt động lên phiếu lead.
  const factory LeadSaleEvent.saveActivity({
    required Map<String, dynamic> payload,
  }) = _SaveActivity;

  /// Xóa trạng thái kết quả ghi hoạt động.
  const factory LeadSaleEvent.clearActivityState() = _ClearActivityState;

  /// Mở lại lead đã không thành công.
  const factory LeadSaleEvent.reopenLead({
    required int id,
    required String note,
  }) = _ReopenLead;

  /// Hoàn trả lead về cho Marketing.
  ///
  /// [id] là ID phiếu lead, [reason] là lý do hoàn trả.
  const factory LeadSaleEvent.returnLead({
    required int id,
    required String reason,
  }) = _ReturnLead;

  /// Xác nhận lead không thành công — chuyển lead sang Thất bại.
  ///
  /// [id] là ID phiếu lead, [reason] là lý do không thành công.
  const factory LeadSaleEvent.closeLead({
    required int id,
    required String reason,
  }) = _CloseLead;

  /// Chuyển PO — đẩy file PO (`fileType = 2`) lên phiếu lead.
  ///
  /// [files] là danh sách file PO người dùng chọn, [note] là ghi chú.
  const factory LeadSaleEvent.transferPo({
    required int id,
    required List<PlatformFile> files,
    @Default('') String note,
  }) = _TransferPo;

  /// Xóa trạng thái kết quả loại bỏ / mở lại lead.
  const factory LeadSaleEvent.clearStageActionState() = _ClearStageActionState;

  /// Tải danh sách Leader Sale và Admin Sale dùng cho thao tác bàn giao.
  const factory LeadSaleEvent.loadHandoverOptions() = _LoadHandoverOptions;

  /// Lấy Admin Sale tương ứng với Leader Sale đã chọn.
  ///
  /// [leaderSaleId] là ID của Leader Sale được chọn.
  const factory LeadSaleEvent.loadAdminSaleId({required int leaderSaleId}) =
      _LoadAdminSaleId;

  /// Bàn giao phiếu lead cho Leader Sale.
  ///
  /// [id] là ID phiếu lead cần bàn giao.
  const factory LeadSaleEvent.handoverLead({
    required int id,
    required int leaderEmployeeId,
    required int adminSaleId,
    required String note,
  }) = _HandoverLead;

  /// Xóa trạng thái kết quả bàn giao lead.
  const factory LeadSaleEvent.clearHandoverState() = _ClearHandoverState;
}
