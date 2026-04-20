part of 'leave_bloc.dart';

@freezed
class LeaveEvent with _$LeaveEvent{
  const factory LeaveEvent.init() = _Init;
  const factory LeaveEvent.initAdd() = _InitAdd;
  /// GET get-multi/{phaseId}, lọc đúng [detailId] để hiển thị; giữ full slips để merge khi lưu.
  const factory LeaveEvent.initDetail({
    required int phaseId,
    required int detailId,
    DateTime? listStartDate,
    int? listTimeOnLeave,
  }) = _InitDetail;
  const factory LeaveEvent.clearDetailForm() = _ClearDetailForm;
  /// Chỉ tải danh sách người duyệt, không đổi [BaseStateStatus] (tránh list bị nháy loading).
  const factory LeaveEvent.fetchApprovers() = _FetchApprovers;
  const factory LeaveEvent.submit({
    required int type,
    required int approvedTP,
    required DateTime dateStart,
    required DateTime dateEnd,
    required int timeRegister,
    required String reason,
  }) = _Submit;
  const factory LeaveEvent.submitBatch({
    required int approvedTP,
    required List<LeaveAddSlip> slips,
  }) = _SubmitBatch;
  const factory LeaveEvent.onCancelSubmit({
    required int id,
  }) = _OnCancelSubmit;
  /// Cập nhật đơn (body giống tạo mới, có Phase/Detail ID, IsPartialUpdate).
  const factory LeaveEvent.onEditSubmit({
    required int phaseId,
    required int approvedTP,
    required List<LeaveEditSlip> slips,
  }) = _OnEditSubmit;
  const factory LeaveEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;
  const factory LeaveEvent.clearSubmitState() = _ClearSubmitState;
}