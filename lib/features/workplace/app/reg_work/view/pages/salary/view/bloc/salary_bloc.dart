import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../../../auth/data/repository/auth_repo.dart';
import '../../data/repository/salary_pin_repo.dart';
import '../../data/repository/salary_repo.dart';
import '../../data/datasource/models/salary_model.dart';


part 'salary_event.dart';
part 'salary_state.dart';
part 'salary_bloc.g.dart';
part 'salary_bloc.freezed.dart';

@injectable
class SalaryBloc extends BaseBloc<SalaryEvent, SalaryState> {
  final SalaryRepo _salaryRepo;
  final SalaryPinRepo _salaryPinRepo;
  final AuthRepo _authRepo;
  final LogUtils _log;

  bool _isPinVerified = false;

  SalaryBloc(this._salaryRepo, this._salaryPinRepo, this._authRepo, this._log)
      : super(SalaryState.init()) {
    on<SalaryEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        fetchPayroll: (year, month) => _onFetchPayroll(emit, year, month),
        initMenu: () => _onInitMenu(emit),
        refresh: () => _onRefresh(emit),
        changeMonth: (month) => _onChangeMonth(emit, month),
        checkPin: () => _onCheckPin(emit),
        verifyPin: (pin) => _onVerifyPin(emit, pin),
        setPin: (pin) => _onSetPin(emit, pin),
        setPinVerified: () => _onSetPinVerified(emit),
        // Forgot PIN
        forgotRequestOtp: () => _onForgotRequestOtp(emit),
        forgotValidateOtp: (otp) => _onForgotValidateOtp(emit, otp),
        forgotResendOtp: () => _onForgotResendOtp(emit),
        forgotResetPin: (newPin, confirmPin) =>
            _onForgotResetPin(emit, newPin, confirmPin),
        forgotUpdateStep: (step) => _onForgotUpdateStep(emit, step),
        clearForgotState: () => _onClearForgotState(emit),
      );
    });
  }

  //---(Init)---//
  Future<void> _onInitMenu(Emitter<SalaryState> emit) async {
    _isPinVerified = false;
    emit(state.copyWith(
      isVerifyingPin: true,
      pinError: null,
      pinVerified: false,
      pinRetryCount: 0,
      isPinLocked: false,
      hasPin: false,
    ));
    final res = await _salaryPinRepo.checkPin();
    res.fold(
      (err) {
        _log.logE('Check PIN failed: $err');
        emit(state.copyWith(
          isVerifyingPin: false,
          hasPin: false,
          pinVerified: true,
          pinError: null,
        ));
      },
      (hasPin) {
        _log.logI('Check PIN success - hasPin: $hasPin');
        emit(state.copyWith(
          isVerifyingPin: false,
          hasPin: hasPin,
          pinVerified: !hasPin,
          pinError: hasPin ? null : 'Vui long nhap ma PIN',
        ));
      },
    );
  }

  //---(PIN)---//
  Future<void> _onCheckPin(Emitter<SalaryState> emit) async {
    emit(state.copyWith(isVerifyingPin: true, pinError: null));
    final res = await _salaryPinRepo.checkPin();
    res.fold(
      (err) {
        _log.logE('Check PIN failed: $err');
        emit(state.copyWith(isVerifyingPin: false, hasPin: false));
      },
      (hasPin) {
        emit(state.copyWith(isVerifyingPin: false, hasPin: hasPin));
      },
    );
  }

  static const int _maxPinRetry = 3;

  Future<void> _onVerifyPin(Emitter<SalaryState> emit, String pin) async {
    emit(state.copyWith(isVerifyingPin: true, pinError: null));
    final res = await _salaryPinRepo.verifyPin(pin: pin);
    res.fold(
      (err) {
        _log.logE('Verify PIN failed: $err');
        final msg = err.getErrorMessage;
        final isLocked = msg.contains('khóa') ||
                         msg.contains('quá 3 lần') ||
                         msg.contains('3 lần') ||
                         msg.contains('thử lại sau');

        if (isLocked) {
          emit(state.copyWith(
            isVerifyingPin: false,
            pinVerified: false,
            pinError: msg,
            pinRetryCount: _maxPinRetry,
            isPinLocked: true,
          ));
        } else {
          emit(state.copyWith(
            isVerifyingPin: false,
            pinVerified: false,
            pinError: msg,
            pinRetryCount: state.pinRetryCount + 1,
            isPinLocked: state.pinRetryCount + 1 >= _maxPinRetry,
          ));
        }
      },
      (data) {
        _log.logI('Verify PIN: verified=${data.verified}, msg=${data.message}, attemptsLeft=${data.attemptsLeft}');

        if (data.verified == true) {
          _isPinVerified = true;
          emit(state.copyWith(
            isVerifyingPin: false,
            pinVerified: true,
            pinError: null,
            pinRetryCount: 0,
            isPinLocked: false,
          ));
        } else {
          final attemptsLeft = data.attemptsLeft ?? 0;
          final newRetryCount = _maxPinRetry - attemptsLeft;
          final isLocked = attemptsLeft <= 0;

          emit(state.copyWith(
            isVerifyingPin: false,
            pinVerified: false,
            pinError: data.message ?? 'Ma PIN khong dung.',
            pinRetryCount: newRetryCount,
            isPinLocked: isLocked,
          ));
        }
      },
    );
  }

  Future<void> _onSetPin(Emitter<SalaryState> emit, String pin) async {
    emit(state.copyWith(isVerifyingPin: true, pinError: null));
    final res = await _salaryPinRepo.setPin(pin: pin);
    res.fold(
      (err) {
        _log.logE('Set PIN failed: $err');
        emit(state.copyWith(
          isVerifyingPin: false,
          pinVerified: false,
          pinError: err.getErrorMessage,
        ));
      },
      (_) {
        _log.logI('Set PIN success');
        _isPinVerified = true;
        emit(state.copyWith(
          isVerifyingPin: false,
          hasPin: true,
          pinVerified: true,
          pinError: null,
        ));
      },
    );
  }

   _onSetPinVerified(Emitter<SalaryState> emit) {
    _isPinVerified = true;
    emit(state.copyWith(pinVerified: true, pinError: null));
  }

  //---(Forgot PIN)---//
  Future<void> _onForgotRequestOtp(Emitter<SalaryState> emit) async {
    emit(state.copyWith(forgotIsLoading: true, forgotError: null));

    final res = await _salaryPinRepo.requestResetPin();
    res.fold(
      (err) {
        _log.logE('Request OTP failed: $err');
        emit(state.copyWith(
          forgotIsLoading: false,
          forgotError: err.getErrorMessage,
        ));
      },
      (message) {
        _log.logI('Request OTP success: $message');
        emit(state.copyWith(
          forgotIsLoading: false,
          forgotStep: 1,
          forgotEmailMessage: message,
        ));
      },
    );
  }

  Future<void> _onForgotValidateOtp(Emitter<SalaryState> emit, String otp) async {
    emit(state.copyWith(forgotIsLoading: true, forgotError: null));

    final res = await _salaryPinRepo.validateToken(token: otp);
    await res.fold(
      (err) async {
        _log.logE('Validate OTP failed: $err');
        emit(state.copyWith(
          forgotIsLoading: false,
          forgotError: err.getErrorMessage,
        ));
      },
      (_) async {
        _log.logI('Validate OTP success');
        emit(state.copyWith(
          forgotIsLoading: false,
          forgotStep: 2,
          forgotError: null,
          otpToken: otp,
        ));
      },
    );
  }

  Future<void> _onForgotResendOtp(Emitter<SalaryState> emit) async {
    emit(state.copyWith(forgotIsLoading: true, forgotError: null));

    final res = await _salaryPinRepo.requestResetPin();
    res.fold(
      (err) {
        _log.logE('Resend OTP failed: $err');
        emit(state.copyWith(
          forgotIsLoading: false,
          forgotError: err.getErrorMessage,
        ));
      },
      (message) {
        _log.logI('Resend OTP success: $message');
        emit(state.copyWith(
          forgotIsLoading: false,
          forgotEmailMessage: message,
          forgotError: null,
        ));
      },
    );
  }

  Future<void> _onForgotResetPin(
    Emitter<SalaryState> emit,
    String newPin,
    String confirmPin,
  ) async {
    emit(state.copyWith(forgotIsLoading: true, forgotError: null));

    final res = await _salaryPinRepo.resetPin(
      newPin: newPin,
      confirmPin: confirmPin,
      token: state.otpToken ?? '',
    );
    await res.fold(
      (err) async {
        _log.logE('Reset PIN failed: $err');
        emit(state.copyWith(
          forgotIsLoading: false,
          forgotError: err.getErrorMessage,
        ));
      },
      (_) async {
        _log.logI('Reset PIN success');
        emit(state.copyWith(
          forgotIsLoading: false,
          forgotError: null,
          forgotStep: -1,
        ));
      },
    );
  }

   _onForgotUpdateStep(Emitter<SalaryState> emit, int step) {
    emit(state.copyWith(forgotStep: step, forgotError: null));
  }

  _onClearForgotState(Emitter<SalaryState> emit) {
    emit(state.copyWith(
      forgotStep: 0,
      forgotIsLoading: false,
      forgotError: null,
      forgotEmailMessage: null,
      otpToken: null,
    ));
  }

  //---(Data)---//

  Future<void> _onFetchPayroll(Emitter<SalaryState> emit, int year, int month) async {
    final res = await _salaryRepo.getPersonalSyntheticByMonth(
      year: year,
      month: month,
    );

    await res.fold(
      (err) async {
        _log.logE('Get payroll failed: $err');
      },
      (data) async {
        _log.logI('Get payroll success - payroll count: ${data.payroll?.length}');
        final payrollList = data.payroll ?? [];
        final p = payrollList.isNotEmpty ? payrollList.first : null;

        emit(state.copyWith(
          payroll: payrollList,
          // Card thu nhập tiêu chuẩn
          basicSalary: p?.basicSalary ?? 0,
          totalWorkday: p?.totalWorkday ?? 0,
          totalMerit: p?.totalMerit ?? 0,
          totalSalaryByDay: p?.totalSalaryByDay ?? 0,
          salaryOneHour: p?.salaryOneHour ?? 0,
          // Card làm thêm
          otHourWD: p?.otHourWD ?? 0,
          otMoneyWD: p?.otMoneyWD ?? 0,
          otHourWK: p?.otHourWK ?? 0,
          otMoneyWK: p?.otMoneyWK ?? 0,
          otHourHD: p?.otHourHD ?? 0,
          otMoneyHD: p?.otMoneyHD ?? 0,
          otTotalSalary: p?.otTotalSalary ?? 0,
          // Card phụ cấp
          allowanceMeal: p?.allowanceMeal ?? 0,
          allowanceOTEarly: p?.allowanceOTEarly ?? 0,
          totalAllowance: p?.totalAllowance ?? 0,
          // Card các khoản cộng khác
          bussinessMoney: p?.bussinessMoney ?? 0,
          nightShiftMoney: p?.nightShiftMoney ?? 0,
          costVehicleBussiness: p?.costVehicleBussiness ?? 0,
          bonus: p?.bonus ?? 0,
          other: p?.other ?? 0,
          totalBonus: p?.totalBonus ?? 0,
          // Card tổng thu nhập
          totalTaxableIncome: (p?.totalSalaryByDay ?? 0) +
              (p?.otTotalSalary ?? 0) +
              (p?.totalAllowance ?? 0) +
              (p?.totalBonus ?? 0),
          // Card các khoản phải trừ
          socialInsurance: p?.socialInsurance ?? 0,
          insurances: p?.insurances ?? 0,
          unionFees: p?.unionFees ?? 0,
          advancePayment: p?.advancePayment ?? 0,
          departmentalFees: p?.departmentalFees ?? 0,
          parkingMoney: p?.parkingMoney ?? 0,
          punish5S: p?.punish5S ?? 0,
          mealUse: p?.mealUse ?? 0,
          otherDeduction: p?.otherDeduction ?? 0,
          totalDeduction: p?.totalDeduction ?? 0,
          // Card giảm trừ thuế
          taxSalaryOT: p?.taxSalaryOT ?? 0,
          taxSalaryMeal: p?.taxSalaryMeal ?? 0,
          taxSalaryPhone: p?.taxSalaryPhone ?? 0,
          taxPersonalDeduction: p?.taxPersonalDeduction ?? 0,
          taxDependentsDeduction: p?.taxDependentsDeduction ?? 0,
          totalTaxDeduction: p?.totalTaxDeduction ?? 0,
          taxAbleIncome: p?.taxAbleIncome ?? 0,
          taxDeduction: p?.taxDeduction ?? 0,
          // Thực lĩnh & Ghi chú
          netSalary: p?.actualAmountReceived ?? p?.realSalary ?? 0,
          note: p?.note,
          listChamcong: data.listChamcong,
        ));
      },
    );
  }

  Future<void> _onInit(Emitter<SalaryState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading, selectedMonth: DateTime.now()));

    final userRes = await _authRepo.getCurrentUser();

    await userRes.fold(
      (err) async {
        _log.logE('Get user failed: $err');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (user) async {
        final now = DateTime.now();
        emit(state.copyWith(
          status: BaseStateStatus.loading,
          employeeName: user?.fullName ?? 'Nguyễn Văn A',
          employeeCode: user?.code ?? 'NV001',
          position: user?.positionName ?? 'Nhân viên',
          contractType: 'Hợp đồng không xác định thời hạn',
          joinDate: DateTime(2023, 6, 15),
          selectedMonth: now,
        ));

        await _onFetchPayroll(emit, now.year, now.month);

        emit(state.copyWith(status: BaseStateStatus.success));
      },
    );
  }

  //---(Filter)---//
  Future<void> _onRefresh(Emitter<SalaryState> emit) async {
    await _onInit(emit);
  }

  Future<void> _onChangeMonth(Emitter<SalaryState> emit, DateTime month) async {
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      selectedMonth: month,
    ));

    await _onFetchPayroll(emit, month.year, month.month);

    emit(state.copyWith(status: BaseStateStatus.success));
  }
}
