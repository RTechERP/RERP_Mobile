part of 'leave_bloc.dart';

@freezed
class LeaveEvent with _$LeaveEvent{
  const factory LeaveEvent.init() = _Init;
  const factory LeaveEvent.initAdd() = _InitAdd;
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
  const factory LeaveEvent.onEditSubmit({
    required int id,
    required int type,
    required int approvedTP,
    required DateTime dateStart,
    required DateTime dateEnd,
    required int timeRegister,
    required String reason,
  }) = _OnEditSubmit;
  const factory LeaveEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;
  const factory LeaveEvent.clearSubmitState() = _ClearSubmitState;
}