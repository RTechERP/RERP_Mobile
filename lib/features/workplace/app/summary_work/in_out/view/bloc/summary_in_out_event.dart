part of 'summary_in_out_bloc.dart';

@freezed
class SummaryInOutEvent with _$SummaryInOutEvent {
  const factory SummaryInOutEvent.init() = _Init;

  const factory SummaryInOutEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;

  const factory SummaryInOutEvent.changeKeyword({
    required String keyword,
  }) = _ChangeKeyword;

  const factory SummaryInOutEvent.changeFilters({
    int? departmentId,
    int? status,
  }) = _ChangeFilters;

  const factory SummaryInOutEvent.refresh() = _Refresh;
}
