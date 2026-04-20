part of 'wfh_bloc.dart';

@freezed
class WfhEvent with _$WfhEvent{
  const factory WfhEvent.init() = _Init;
  const factory WfhEvent.initAdd() = _InitAdd;
  /// Chỉ tải danh sách người duyệt, không đổi [BaseStateStatus] (tránh list bị nháy loading).
  const factory WfhEvent.fetchApprovers() = _FetchApprovers;
  const factory WfhEvent.submit({
    required int approvedId,
    required DateTime dateWFH,
    required int timeWFH,
    required double totalDay,
    required String contentWork,
    required String reason,
    String? note,
  }) = _Submit;
  const factory WfhEvent.onCancelSubmit({
    required int id,
  }) = _OnCancelSubmit;
  const factory WfhEvent.onEditSubmit({
    required int id,
    required int approvedId,
    required DateTime dateWFH,
    required int timeWFH,
    required double totalDay,
    required String contentWork,
    required String reason,
    String? note,
  }) = _OnEditSubmit;
  const factory WfhEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;
  const factory WfhEvent.clearSubmitState() = _ClearSubmitState;
}