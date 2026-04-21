part of 'week_plan_bloc.dart';

@freezed
class WeekPlanEvent with _$WeekPlanEvent {
  const factory WeekPlanEvent.init() = _Init;

  const factory WeekPlanEvent.refresh() = _Refresh;

  const factory WeekPlanEvent.search(String keyword) = _Search;

  const factory WeekPlanEvent.clearSearch() = _ClearSearch;

  const factory WeekPlanEvent.filterByStatus(String status) = _FilterByStatus;

  const factory WeekPlanEvent.clearStatusFilter() = _ClearStatusFilter;

  const factory WeekPlanEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;

  const factory WeekPlanEvent.clearDateFilter() = _ClearDateFilter;

  const factory WeekPlanEvent.checkIn(int taskId) = _CheckIn;
}
