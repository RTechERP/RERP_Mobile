part of 'salary_bloc.dart';

@freezed
class SalaryEvent with _$SalaryEvent {
  const factory SalaryEvent.init() = _Init;
  const factory SalaryEvent.initMenu() = _InitMenu;
  const factory SalaryEvent.refresh() = _Refresh;
  const factory SalaryEvent.changeMonth(DateTime month) = _ChangeMonth;
  const factory SalaryEvent.checkPin() = _CheckPin;
  const factory SalaryEvent.verifyPin(String pin) = _VerifyPin;
  const factory SalaryEvent.setPin(String pin) = _SetPin;
  const factory SalaryEvent.setPinVerified() = _SetPinVerified;
}
