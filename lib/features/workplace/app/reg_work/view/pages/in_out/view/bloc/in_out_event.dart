part of 'in_out_bloc.dart';

@freezed
class InOutEvent with _$InOutEvent{
  const factory InOutEvent.init() = _Init;
  const factory InOutEvent.initAdd() = _InitAdd;
  /// Chỉ tải danh sách người duyệt, không đổi [BaseStateStatus] (tránh list bị nháy loading).
  const factory InOutEvent.fetchApprovers() = _FetchApprovers;
  const factory InOutEvent.submit({
    required int type,
    required int approvedTP,
    required DateTime dateStart,
    required DateTime dateEnd,
    required int timeRegister,
    required String reason,
  }) = _Submit;
  const factory InOutEvent.onCancelSubmit({
    required int id,
  }) = _OnCancelSubmit;
  const factory InOutEvent.onEditSubmit({
    required int id,
    required int type,
    required int approvedTP,
    required DateTime dateStart,
    required DateTime dateEnd,
    required int timeRegister,
    required String reason,
  }) = _OnEditSubmit;
  const factory InOutEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;
  const factory InOutEvent.clearSubmitState() = _ClearSubmitState;
}