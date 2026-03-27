part of 'missed_bloc.dart';

@freezed
class MissedEvent with _$MissedEvent{
  const factory MissedEvent.init() = _Init;
  const factory MissedEvent.initAdd() = _InitAdd;
  /// Chỉ tải danh sách người duyệt, không đổi [BaseStateStatus] (tránh list bị nháy loading).
  const factory MissedEvent.fetchApprovers() = _FetchApprovers;
  const factory MissedEvent.submit({
    required int approvedId,
    required DateTime dateMissed,
    required int timeMissed,
    required double totalDay,
    required String contentWork,
    required String reason,
    String? note,
  }) = _Submit;
  const factory MissedEvent.onCancelSubmit({
    required int id,
  }) = _OnCancelSubmit;
  const factory MissedEvent.onEditSubmit({
    required int id,
    required int approvedId,
    required DateTime dateMissed,
    required int timeMissed,
    required double totalDay,
    required String contentWork,
    required String reason,
    String? note,
  }) = _OnEditSubmit;
  const factory MissedEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;
  const factory MissedEvent.clearSubmitState() = _ClearSubmitState;
}