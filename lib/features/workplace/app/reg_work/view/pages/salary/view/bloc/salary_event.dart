part of 'salary_bloc.dart';

@freezed
class SalaryEvent with _$SalaryEvent {
  const factory SalaryEvent.init() = _Init;
  const factory SalaryEvent.initMenu() = _InitMenu;
  const factory SalaryEvent.refresh() = _Refresh;
  const factory SalaryEvent.changeMonth(DateTime month) = _ChangeMonth;
}
