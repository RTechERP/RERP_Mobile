part of 'wfh_bloc.dart';

@freezed
class WfhEvent with _$WfhEvent{
  const factory WfhEvent.init() = _Init;
  const factory WfhEvent.initAdd() = _InitAdd;
  /// Chỉ tải danh sách người duyệt, không đổi [BaseStateStatus] (tránh list bị nháy loading).
  const factory WfhEvent.fetchApprovers() = _FetchApprovers;
  const factory WfhEvent.submit({
    required int type,
    required int approvedTP,
    required DateTime dateStart,
    required DateTime dateEnd,
    required int timeRegister,
    required String reason,
  }) = _Submit;
  const factory WfhEvent.onCancelSubmit({
    required int id,
  }) = _OnCancelSubmit;
  const factory WfhEvent.onEditSubmit({
    required int id,
    required int type,
    required int approvedTP,
    required DateTime dateStart,
    required DateTime dateEnd,
    required int timeRegister,
    required String reason,
  }) = _OnEditSubmit;
  const factory WfhEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;
  const factory WfhEvent.clearSubmitState() = _ClearSubmitState;
}