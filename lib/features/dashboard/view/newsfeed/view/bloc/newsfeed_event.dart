part of 'newsfeed_bloc.dart';

@freezed
class NewsfeedEvent with _$NewsfeedEvent {
  const factory NewsfeedEvent.init() = _Init;
  const factory NewsfeedEvent.refresh() = _Refresh;
  const factory NewsfeedEvent.loadCalendar() = _LoadCalendar;
  const factory NewsfeedEvent.changeCalendarMonth({required int month, required int year}) = _ChangeCalendarMonth;
  const factory NewsfeedEvent.refreshCalendar() = _RefreshCalendar;
}
