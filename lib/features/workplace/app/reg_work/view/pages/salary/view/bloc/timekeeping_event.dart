part of 'timekeeping_bloc.dart';

@freezed
class TimekeepingEvent with _$TimekeepingEvent {
  const factory TimekeepingEvent.init() = _Init;
  const factory TimekeepingEvent.changeMonth(DateTime month) = _ChangeMonth;
  const factory TimekeepingEvent.refresh() = _Refresh;
}
