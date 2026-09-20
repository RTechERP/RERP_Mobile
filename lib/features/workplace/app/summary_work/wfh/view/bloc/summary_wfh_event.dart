part of 'summary_wfh_bloc.dart';

@freezed
class SummaryWfhEvent with _$SummaryWfhEvent {
  const factory SummaryWfhEvent.init() = _Init;

  const factory SummaryWfhEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;

  const factory SummaryWfhEvent.changeKeyword({
    required String keyword,
  }) = _ChangeKeyword;

  const factory SummaryWfhEvent.changeFilters({
    int? departmentId,
    int? status,
  }) = _ChangeFilters;

  const factory SummaryWfhEvent.refresh() = _Refresh;
}
