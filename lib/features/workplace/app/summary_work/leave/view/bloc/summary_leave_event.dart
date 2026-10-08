part of 'summary_leave_bloc.dart';

@freezed
class SummaryLeaveEvent with _$SummaryLeaveEvent {
  const factory SummaryLeaveEvent.init() = _Init;

  const factory SummaryLeaveEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;

  const factory SummaryLeaveEvent.changeKeyword({
    required String keyword,
  }) = _ChangeKeyword;

  const factory SummaryLeaveEvent.changeFilters({
    int? departmentId,
    int? status,
  }) = _ChangeFilters;

  const factory SummaryLeaveEvent.refresh() = _Refresh;
}
