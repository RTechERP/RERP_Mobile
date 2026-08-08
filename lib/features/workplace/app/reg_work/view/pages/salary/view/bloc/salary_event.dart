part of 'salary_bloc.dart';

@freezed
class SalaryEvent with _$SalaryEvent {
  const factory SalaryEvent.init() = _Init;
  const factory SalaryEvent.fetchPayroll(int year, int month) = _FetchPayroll;
  const factory SalaryEvent.initMenu() = _InitMenu;
  const factory SalaryEvent.refresh() = _Refresh;
  const factory SalaryEvent.changeMonth(DateTime month) = _ChangeMonth;
  const factory SalaryEvent.checkPin() = _CheckPin;
  const factory SalaryEvent.verifyPin(String pin) = _VerifyPin;
  const factory SalaryEvent.setPin(String pin) = _SetPin;
  const factory SalaryEvent.setPinVerified() = _SetPinVerified;
  // Forgot PIN
  const factory SalaryEvent.forgotRequestOtp() = _ForgotRequestOtp;
  const factory SalaryEvent.forgotValidateOtp(String otp) = _ForgotValidateOtp;
  const factory SalaryEvent.forgotResendOtp() = _ForgotResendOtp;
  const factory SalaryEvent.forgotResetPin({
    required String newPin,
    required String confirmPin,
  }) = _ForgotResetPin;
  const factory SalaryEvent.forgotUpdateStep(int step) = _ForgotUpdateStep;
  const factory SalaryEvent.clearForgotState() = _ClearForgotState;
  // Confirm Payroll
  const factory SalaryEvent.confirmPayroll(int payrollId) = _ConfirmPayroll;
  const factory SalaryEvent.cancelPayroll(int payrollId) = _CancelPayroll;
  const factory SalaryEvent.clearConfirmState() = _ClearConfirmState;
  const factory SalaryEvent.confirmInit() = _ConfirmInit;
}
