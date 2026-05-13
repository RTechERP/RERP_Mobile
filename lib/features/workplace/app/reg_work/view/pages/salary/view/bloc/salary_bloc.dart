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
        initMenu: () => _onInitMenu(emit),
        refresh: () => _onRefresh(emit),
        changeMonth: (month) => _onChangeMonth(emit, month),
        checkPin: () => _onCheckPin(emit),
        verifyPin: (pin) => _onVerifyPin(emit, pin),
        setPin: (pin) => _onSetPin(emit, pin),
        setPinVerified: () => _onSetPinVerified(emit),
      );
    });
  }

  //---(Init)---//
  Future<void> _onInitMenu(Emitter<SalaryState> emit) async {
    emit(state.copyWith(isVerifyingPin: true, pinError: null, pinVerified: false));
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

  Future<void> _onVerifyPin(Emitter<SalaryState> emit, String pin) async {
    emit(state.copyWith(isVerifyingPin: true, pinError: null));
    final res = await _salaryPinRepo.verifyPin(pin: pin);
    res.fold(
      (err) {
        _log.logE('Verify PIN failed: $err');
        emit(state.copyWith(
          isVerifyingPin: false,
          pinVerified: false,
          pinError: err.getErrorMessage,
        ));
      },
      (verified) {
        _log.logI('Verify PIN result: $verified');
        if (verified) {
          _isPinVerified = true;
          emit(state.copyWith(
            isVerifyingPin: false,
            pinVerified: true,
            pinError: null,
          ));
        } else {
          emit(state.copyWith(
            isVerifyingPin: false,
            pinVerified: false,
            pinError: 'Ma PIN khong dung. Vui long thu lai.',
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

  //---(Data)---//

  Future<void> _onInit(Emitter<SalaryState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final userRes = await _authRepo.getCurrentUser();

    await userRes.fold(
      (err) async {
        _log.logE('Get user failed: $err');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (user) async {
        emit(state.copyWith(
          status: BaseStateStatus.success,
          employeeName: user?.fullName ?? 'Nguyễn Văn A',
          employeeCode: user?.code ?? 'NV001',
          position: user?.positionName ?? 'Nhân viên',
          contractType: 'Hợp đồng không xác định thời hạn',
          joinDate: DateTime(2023, 6, 15),
          selectedMonth: DateTime.now(),
          // Card thu nhập tiêu chuẩn
          refIncome: 15000000,
          actualWorkDays: 22,
          leaveDays: 2,
          totalWorkDays: 24,
          standardSalary: 15000000,
          hourlyRate: 85227,
          // Card làm thêm
          weekdayHours: 8,
          weekdayOvertimePay: 1022724,
          weekendHours: 0,
          weekendOvertimePay: 0,
          holidayHours: 0,
          holidayOvertimePay: 0,
          totalOvertime: 1022724,
          // Card phụ cấp
          mealAllowance: 200000,
          earlyShiftAllowance: 300000,
          totalAllowance: 500000,
          // Card cộng khác
          travelAllowance: 500000,
          nightWorkPay: 0,
          transportCost: 0,
          kpiBonus: 1500000,
          otherAddition: 0,
          totalOtherAdditions: 2000000,
          // Card tổng
          totalTaxableIncome: 17522724,
          // Card các khoản phải trừ
          socialInsuranceRate: 10.5,
          socialInsuranceAmount: 1575000,
          unionFundRate: 1.0,
          unionFundAmount: 150000,
          salaryAdvance: 0,
          deptCollection: 0,
          carParking: 0,
          fiveSParking: 0,
          mealDeduction: 0,
          otherDeduction: 0,
          totalDeductions: 150000,
          // Card giảm trừ thuế
          taxableSocialInsurance: 1575000,
          taxableOvertime: 1022724,
          taxableMealAllowance: 200000,
          taxablePhoneAllowance: 200000,
          taxablePersonalDeduction: 11000000,
          taxableDependentDeduction: 0,
          totalTaxDeductions: 13997724,
          taxableIncome: 3522724,
          incomeTax: 0,
          // Thực lĩnh & Ghi chú
          netSalary: 15972724,
          note: 'Tháng lương 05/2026',
        ));
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

    emit(state.copyWith(
      status: BaseStateStatus.success,
      refIncome: 15000000,
      actualWorkDays: 22,
      leaveDays: 2,
      totalWorkDays: 24,
      standardSalary: 15000000,
      hourlyRate: 85227,
      weekdayHours: 8,
      weekdayOvertimePay: 1022724,
      weekendHours: 0,
      weekendOvertimePay: 0,
      holidayHours: 0,
      holidayOvertimePay: 0,
      totalOvertime: 1022724,
      mealAllowance: 200000,
      earlyShiftAllowance: 300000,
      totalAllowance: 500000,
      travelAllowance: 500000,
      nightWorkPay: 0,
      transportCost: 0,
      kpiBonus: 1500000,
      otherAddition: 0,
      totalOtherAdditions: 2000000,
      totalTaxableIncome: 17522724,
      // Card các khoản phải trừ
      socialInsuranceRate: 10.5,
      socialInsuranceAmount: 1575000,
      unionFundRate: 1.0,
      unionFundAmount: 150000,
      salaryAdvance: 0,
      deptCollection: 0,
      carParking: 0,
      fiveSParking: 0,
      mealDeduction: 0,
      otherDeduction: 0,
      totalDeductions: 150000,
      // Card giảm trừ thuế
      taxableSocialInsurance: 1575000,
      taxableOvertime: 1022724,
      taxableMealAllowance: 200000,
      taxablePhoneAllowance: 200000,
      taxablePersonalDeduction: 11000000,
      taxableDependentDeduction: 0,
      totalTaxDeductions: 13997724,
      taxableIncome: 3522724,
      incomeTax: 0,
      // Thực lĩnh & Ghi chú
      netSalary: 15972724,
      note: 'Tháng lương 05/2026',
    ));
  }
}
