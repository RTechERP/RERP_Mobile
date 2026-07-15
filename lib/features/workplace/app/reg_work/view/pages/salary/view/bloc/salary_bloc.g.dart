// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salary_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SalaryStateCWProxy {
  SalaryState status(BaseStateStatus status);

  SalaryState message(String? message);

  SalaryState employeeName(String? employeeName);

  SalaryState employeeCode(String? employeeCode);

  SalaryState position(String? position);

  SalaryState contractType(String? contractType);

  SalaryState joinDate(DateTime? joinDate);

  SalaryState selectedMonth(DateTime? selectedMonth);

  SalaryState basicSalary(double basicSalary);

  SalaryState totalWorkday(double totalWorkday);

  SalaryState totalMerit(double totalMerit);

  SalaryState totalSalaryByDay(double totalSalaryByDay);

  SalaryState salaryOneHour(double salaryOneHour);

  SalaryState otHourWD(double otHourWD);

  SalaryState otMoneyWD(double otMoneyWD);

  SalaryState otHourWKNight(double otHourWKNight);

  SalaryState otMoneyWKNight(double otMoneyWKNight);

  SalaryState otHourWK(double otHourWK);

  SalaryState otMoneyWK(double otMoneyWK);

  SalaryState otHourWKNightWeekend(double otHourWKNightWeekend);

  SalaryState otMoneyWKNightWeekend(double otMoneyWKNightWeekend);

  SalaryState otHourHD(double otHourHD);

  SalaryState otMoneyHD(double otMoneyHD);

  SalaryState otTotalSalary(double otTotalSalary);

  SalaryState allowanceMeal(double allowanceMeal);

  SalaryState allowanceOTEarly(double allowanceOTEarly);

  SalaryState totalAllowance(double totalAllowance);

  SalaryState bussinessMoney(double bussinessMoney);

  SalaryState nightShiftMoney(double nightShiftMoney);

  SalaryState costVehicleBussiness(double costVehicleBussiness);

  SalaryState bonus(double bonus);

  SalaryState other(double other);

  SalaryState totalBonus(double totalBonus);

  SalaryState totalTaxableIncome(double totalTaxableIncome);

  SalaryState socialInsurance(double socialInsurance);

  SalaryState insurances(double insurances);

  SalaryState unionFees(double unionFees);

  SalaryState advancePayment(double advancePayment);

  SalaryState departmentalFees(double departmentalFees);

  SalaryState parkingMoney(double parkingMoney);

  SalaryState punish5S(double punish5S);

  SalaryState mealUse(int mealUse);

  SalaryState otherDeduction(double otherDeduction);

  SalaryState totalDeduction(double totalDeduction);

  SalaryState taxSalaryOT(double taxSalaryOT);

  SalaryState taxSalaryMeal(double taxSalaryMeal);

  SalaryState taxSalaryPhone(double taxSalaryPhone);

  SalaryState taxPersonalDeduction(double taxPersonalDeduction);

  SalaryState taxDependentsDeduction(double taxDependentsDeduction);

  SalaryState totalTaxDeduction(double totalTaxDeduction);

  SalaryState taxAbleIncome(double taxAbleIncome);

  SalaryState taxDeduction(double taxDeduction);

  SalaryState netSalary(double netSalary);

  SalaryState note(String? note);

  SalaryState hasPin(bool hasPin);

  SalaryState pinVerified(bool pinVerified);

  SalaryState isVerifyingPin(bool isVerifyingPin);

  SalaryState pinError(String? pinError);

  SalaryState pinRetryCount(int pinRetryCount);

  SalaryState isPinLocked(bool isPinLocked);

  SalaryState forgotStep(int forgotStep);

  SalaryState forgotIsLoading(bool forgotIsLoading);

  SalaryState forgotError(String? forgotError);

  SalaryState forgotEmailMessage(String? forgotEmailMessage);

  SalaryState otpToken(String? otpToken);

  SalaryState payroll(List<SalaryPayrollItem> payroll);

  SalaryState listChamcong(SalaryListChamCong? listChamcong);

  SalaryState listSummary(List<List<SalarySummaryItem>>? listSummary);

  SalaryState fingers(SalaryFingers? fingers);

  SalaryState fingerData(SalaryFingerData? fingerData);

  SalaryState fingerDetails(List<SalaryFingerDetail> fingerDetails);

  SalaryState selectedFingerMonth(int? selectedFingerMonth);

  SalaryState selectedFingerMonthDt(DateTime? selectedFingerMonthDt);

  SalaryState overtimeItems(List<OvertimeItem> overtimeItems);

  SalaryState overnightItems(List<OvertimeItem> overnightItems);

  SalaryState holidays(List<DateTime> holidays);

  SalaryState workSaturdays(List<DateTime> workSaturdays);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SalaryState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SalaryState(...).copyWith(id: 12, name: "My name")
  /// ````
  SalaryState call({
    BaseStateStatus? status,
    String? message,
    String? employeeName,
    String? employeeCode,
    String? position,
    String? contractType,
    DateTime? joinDate,
    DateTime? selectedMonth,
    double? basicSalary,
    double? totalWorkday,
    double? totalMerit,
    double? totalSalaryByDay,
    double? salaryOneHour,
    double? otHourWD,
    double? otMoneyWD,
    double? otHourWKNight,
    double? otMoneyWKNight,
    double? otHourWK,
    double? otMoneyWK,
    double? otHourWKNightWeekend,
    double? otMoneyWKNightWeekend,
    double? otHourHD,
    double? otMoneyHD,
    double? otTotalSalary,
    double? allowanceMeal,
    double? allowanceOTEarly,
    double? totalAllowance,
    double? bussinessMoney,
    double? nightShiftMoney,
    double? costVehicleBussiness,
    double? bonus,
    double? other,
    double? totalBonus,
    double? totalTaxableIncome,
    double? socialInsurance,
    double? insurances,
    double? unionFees,
    double? advancePayment,
    double? departmentalFees,
    double? parkingMoney,
    double? punish5S,
    int? mealUse,
    double? otherDeduction,
    double? totalDeduction,
    double? taxSalaryOT,
    double? taxSalaryMeal,
    double? taxSalaryPhone,
    double? taxPersonalDeduction,
    double? taxDependentsDeduction,
    double? totalTaxDeduction,
    double? taxAbleIncome,
    double? taxDeduction,
    double? netSalary,
    String? note,
    bool? hasPin,
    bool? pinVerified,
    bool? isVerifyingPin,
    String? pinError,
    int? pinRetryCount,
    bool? isPinLocked,
    int? forgotStep,
    bool? forgotIsLoading,
    String? forgotError,
    String? forgotEmailMessage,
    String? otpToken,
    List<SalaryPayrollItem>? payroll,
    SalaryListChamCong? listChamcong,
    List<List<SalarySummaryItem>>? listSummary,
    SalaryFingers? fingers,
    SalaryFingerData? fingerData,
    List<SalaryFingerDetail>? fingerDetails,
    int? selectedFingerMonth,
    DateTime? selectedFingerMonthDt,
    List<OvertimeItem>? overtimeItems,
    List<OvertimeItem>? overnightItems,
    List<DateTime>? holidays,
    List<DateTime>? workSaturdays,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSalaryState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSalaryState.copyWith.fieldName(...)`
class _$SalaryStateCWProxyImpl implements _$SalaryStateCWProxy {
  const _$SalaryStateCWProxyImpl(this._value);

  final SalaryState _value;

  @override
  SalaryState status(BaseStateStatus status) => this(status: status);

  @override
  SalaryState message(String? message) => this(message: message);

  @override
  SalaryState employeeName(String? employeeName) =>
      this(employeeName: employeeName);

  @override
  SalaryState employeeCode(String? employeeCode) =>
      this(employeeCode: employeeCode);

  @override
  SalaryState position(String? position) => this(position: position);

  @override
  SalaryState contractType(String? contractType) =>
      this(contractType: contractType);

  @override
  SalaryState joinDate(DateTime? joinDate) => this(joinDate: joinDate);

  @override
  SalaryState selectedMonth(DateTime? selectedMonth) =>
      this(selectedMonth: selectedMonth);

  @override
  SalaryState basicSalary(double basicSalary) => this(basicSalary: basicSalary);

  @override
  SalaryState totalWorkday(double totalWorkday) =>
      this(totalWorkday: totalWorkday);

  @override
  SalaryState totalMerit(double totalMerit) => this(totalMerit: totalMerit);

  @override
  SalaryState totalSalaryByDay(double totalSalaryByDay) =>
      this(totalSalaryByDay: totalSalaryByDay);

  @override
  SalaryState salaryOneHour(double salaryOneHour) =>
      this(salaryOneHour: salaryOneHour);

  @override
  SalaryState otHourWD(double otHourWD) => this(otHourWD: otHourWD);

  @override
  SalaryState otMoneyWD(double otMoneyWD) => this(otMoneyWD: otMoneyWD);

  @override
  SalaryState otHourWKNight(double otHourWKNight) =>
      this(otHourWKNight: otHourWKNight);

  @override
  SalaryState otMoneyWKNight(double otMoneyWKNight) =>
      this(otMoneyWKNight: otMoneyWKNight);

  @override
  SalaryState otHourWK(double otHourWK) => this(otHourWK: otHourWK);

  @override
  SalaryState otMoneyWK(double otMoneyWK) => this(otMoneyWK: otMoneyWK);

  @override
  SalaryState otHourWKNightWeekend(double otHourWKNightWeekend) =>
      this(otHourWKNightWeekend: otHourWKNightWeekend);

  @override
  SalaryState otMoneyWKNightWeekend(double otMoneyWKNightWeekend) =>
      this(otMoneyWKNightWeekend: otMoneyWKNightWeekend);

  @override
  SalaryState otHourHD(double otHourHD) => this(otHourHD: otHourHD);

  @override
  SalaryState otMoneyHD(double otMoneyHD) => this(otMoneyHD: otMoneyHD);

  @override
  SalaryState otTotalSalary(double otTotalSalary) =>
      this(otTotalSalary: otTotalSalary);

  @override
  SalaryState allowanceMeal(double allowanceMeal) =>
      this(allowanceMeal: allowanceMeal);

  @override
  SalaryState allowanceOTEarly(double allowanceOTEarly) =>
      this(allowanceOTEarly: allowanceOTEarly);

  @override
  SalaryState totalAllowance(double totalAllowance) =>
      this(totalAllowance: totalAllowance);

  @override
  SalaryState bussinessMoney(double bussinessMoney) =>
      this(bussinessMoney: bussinessMoney);

  @override
  SalaryState nightShiftMoney(double nightShiftMoney) =>
      this(nightShiftMoney: nightShiftMoney);

  @override
  SalaryState costVehicleBussiness(double costVehicleBussiness) =>
      this(costVehicleBussiness: costVehicleBussiness);

  @override
  SalaryState bonus(double bonus) => this(bonus: bonus);

  @override
  SalaryState other(double other) => this(other: other);

  @override
  SalaryState totalBonus(double totalBonus) => this(totalBonus: totalBonus);

  @override
  SalaryState totalTaxableIncome(double totalTaxableIncome) =>
      this(totalTaxableIncome: totalTaxableIncome);

  @override
  SalaryState socialInsurance(double socialInsurance) =>
      this(socialInsurance: socialInsurance);

  @override
  SalaryState insurances(double insurances) => this(insurances: insurances);

  @override
  SalaryState unionFees(double unionFees) => this(unionFees: unionFees);

  @override
  SalaryState advancePayment(double advancePayment) =>
      this(advancePayment: advancePayment);

  @override
  SalaryState departmentalFees(double departmentalFees) =>
      this(departmentalFees: departmentalFees);

  @override
  SalaryState parkingMoney(double parkingMoney) =>
      this(parkingMoney: parkingMoney);

  @override
  SalaryState punish5S(double punish5S) => this(punish5S: punish5S);

  @override
  SalaryState mealUse(int mealUse) => this(mealUse: mealUse);

  @override
  SalaryState otherDeduction(double otherDeduction) =>
      this(otherDeduction: otherDeduction);

  @override
  SalaryState totalDeduction(double totalDeduction) =>
      this(totalDeduction: totalDeduction);

  @override
  SalaryState taxSalaryOT(double taxSalaryOT) => this(taxSalaryOT: taxSalaryOT);

  @override
  SalaryState taxSalaryMeal(double taxSalaryMeal) =>
      this(taxSalaryMeal: taxSalaryMeal);

  @override
  SalaryState taxSalaryPhone(double taxSalaryPhone) =>
      this(taxSalaryPhone: taxSalaryPhone);

  @override
  SalaryState taxPersonalDeduction(double taxPersonalDeduction) =>
      this(taxPersonalDeduction: taxPersonalDeduction);

  @override
  SalaryState taxDependentsDeduction(double taxDependentsDeduction) =>
      this(taxDependentsDeduction: taxDependentsDeduction);

  @override
  SalaryState totalTaxDeduction(double totalTaxDeduction) =>
      this(totalTaxDeduction: totalTaxDeduction);

  @override
  SalaryState taxAbleIncome(double taxAbleIncome) =>
      this(taxAbleIncome: taxAbleIncome);

  @override
  SalaryState taxDeduction(double taxDeduction) =>
      this(taxDeduction: taxDeduction);

  @override
  SalaryState netSalary(double netSalary) => this(netSalary: netSalary);

  @override
  SalaryState note(String? note) => this(note: note);

  @override
  SalaryState hasPin(bool hasPin) => this(hasPin: hasPin);

  @override
  SalaryState pinVerified(bool pinVerified) => this(pinVerified: pinVerified);

  @override
  SalaryState isVerifyingPin(bool isVerifyingPin) =>
      this(isVerifyingPin: isVerifyingPin);

  @override
  SalaryState pinError(String? pinError) => this(pinError: pinError);

  @override
  SalaryState pinRetryCount(int pinRetryCount) =>
      this(pinRetryCount: pinRetryCount);

  @override
  SalaryState isPinLocked(bool isPinLocked) => this(isPinLocked: isPinLocked);

  @override
  SalaryState forgotStep(int forgotStep) => this(forgotStep: forgotStep);

  @override
  SalaryState forgotIsLoading(bool forgotIsLoading) =>
      this(forgotIsLoading: forgotIsLoading);

  @override
  SalaryState forgotError(String? forgotError) =>
      this(forgotError: forgotError);

  @override
  SalaryState forgotEmailMessage(String? forgotEmailMessage) =>
      this(forgotEmailMessage: forgotEmailMessage);

  @override
  SalaryState otpToken(String? otpToken) => this(otpToken: otpToken);

  @override
  SalaryState payroll(List<SalaryPayrollItem> payroll) =>
      this(payroll: payroll);

  @override
  SalaryState listChamcong(SalaryListChamCong? listChamcong) =>
      this(listChamcong: listChamcong);

  @override
  SalaryState listSummary(List<List<SalarySummaryItem>>? listSummary) =>
      this(listSummary: listSummary);

  @override
  SalaryState fingers(SalaryFingers? fingers) => this(fingers: fingers);

  @override
  SalaryState fingerData(SalaryFingerData? fingerData) =>
      this(fingerData: fingerData);

  @override
  SalaryState fingerDetails(List<SalaryFingerDetail> fingerDetails) =>
      this(fingerDetails: fingerDetails);

  @override
  SalaryState selectedFingerMonth(int? selectedFingerMonth) =>
      this(selectedFingerMonth: selectedFingerMonth);

  @override
  SalaryState selectedFingerMonthDt(DateTime? selectedFingerMonthDt) =>
      this(selectedFingerMonthDt: selectedFingerMonthDt);

  @override
  SalaryState overtimeItems(List<OvertimeItem> overtimeItems) =>
      this(overtimeItems: overtimeItems);

  @override
  SalaryState overnightItems(List<OvertimeItem> overnightItems) =>
      this(overnightItems: overnightItems);

  @override
  SalaryState holidays(List<DateTime> holidays) => this(holidays: holidays);

  @override
  SalaryState workSaturdays(List<DateTime> workSaturdays) =>
      this(workSaturdays: workSaturdays);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SalaryState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SalaryState(...).copyWith(id: 12, name: "My name")
  /// ````
  SalaryState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? employeeName = const $CopyWithPlaceholder(),
    Object? employeeCode = const $CopyWithPlaceholder(),
    Object? position = const $CopyWithPlaceholder(),
    Object? contractType = const $CopyWithPlaceholder(),
    Object? joinDate = const $CopyWithPlaceholder(),
    Object? selectedMonth = const $CopyWithPlaceholder(),
    Object? basicSalary = const $CopyWithPlaceholder(),
    Object? totalWorkday = const $CopyWithPlaceholder(),
    Object? totalMerit = const $CopyWithPlaceholder(),
    Object? totalSalaryByDay = const $CopyWithPlaceholder(),
    Object? salaryOneHour = const $CopyWithPlaceholder(),
    Object? otHourWD = const $CopyWithPlaceholder(),
    Object? otMoneyWD = const $CopyWithPlaceholder(),
    Object? otHourWKNight = const $CopyWithPlaceholder(),
    Object? otMoneyWKNight = const $CopyWithPlaceholder(),
    Object? otHourWK = const $CopyWithPlaceholder(),
    Object? otMoneyWK = const $CopyWithPlaceholder(),
    Object? otHourWKNightWeekend = const $CopyWithPlaceholder(),
    Object? otMoneyWKNightWeekend = const $CopyWithPlaceholder(),
    Object? otHourHD = const $CopyWithPlaceholder(),
    Object? otMoneyHD = const $CopyWithPlaceholder(),
    Object? otTotalSalary = const $CopyWithPlaceholder(),
    Object? allowanceMeal = const $CopyWithPlaceholder(),
    Object? allowanceOTEarly = const $CopyWithPlaceholder(),
    Object? totalAllowance = const $CopyWithPlaceholder(),
    Object? bussinessMoney = const $CopyWithPlaceholder(),
    Object? nightShiftMoney = const $CopyWithPlaceholder(),
    Object? costVehicleBussiness = const $CopyWithPlaceholder(),
    Object? bonus = const $CopyWithPlaceholder(),
    Object? other = const $CopyWithPlaceholder(),
    Object? totalBonus = const $CopyWithPlaceholder(),
    Object? totalTaxableIncome = const $CopyWithPlaceholder(),
    Object? socialInsurance = const $CopyWithPlaceholder(),
    Object? insurances = const $CopyWithPlaceholder(),
    Object? unionFees = const $CopyWithPlaceholder(),
    Object? advancePayment = const $CopyWithPlaceholder(),
    Object? departmentalFees = const $CopyWithPlaceholder(),
    Object? parkingMoney = const $CopyWithPlaceholder(),
    Object? punish5S = const $CopyWithPlaceholder(),
    Object? mealUse = const $CopyWithPlaceholder(),
    Object? otherDeduction = const $CopyWithPlaceholder(),
    Object? totalDeduction = const $CopyWithPlaceholder(),
    Object? taxSalaryOT = const $CopyWithPlaceholder(),
    Object? taxSalaryMeal = const $CopyWithPlaceholder(),
    Object? taxSalaryPhone = const $CopyWithPlaceholder(),
    Object? taxPersonalDeduction = const $CopyWithPlaceholder(),
    Object? taxDependentsDeduction = const $CopyWithPlaceholder(),
    Object? totalTaxDeduction = const $CopyWithPlaceholder(),
    Object? taxAbleIncome = const $CopyWithPlaceholder(),
    Object? taxDeduction = const $CopyWithPlaceholder(),
    Object? netSalary = const $CopyWithPlaceholder(),
    Object? note = const $CopyWithPlaceholder(),
    Object? hasPin = const $CopyWithPlaceholder(),
    Object? pinVerified = const $CopyWithPlaceholder(),
    Object? isVerifyingPin = const $CopyWithPlaceholder(),
    Object? pinError = const $CopyWithPlaceholder(),
    Object? pinRetryCount = const $CopyWithPlaceholder(),
    Object? isPinLocked = const $CopyWithPlaceholder(),
    Object? forgotStep = const $CopyWithPlaceholder(),
    Object? forgotIsLoading = const $CopyWithPlaceholder(),
    Object? forgotError = const $CopyWithPlaceholder(),
    Object? forgotEmailMessage = const $CopyWithPlaceholder(),
    Object? otpToken = const $CopyWithPlaceholder(),
    Object? payroll = const $CopyWithPlaceholder(),
    Object? listChamcong = const $CopyWithPlaceholder(),
    Object? listSummary = const $CopyWithPlaceholder(),
    Object? fingers = const $CopyWithPlaceholder(),
    Object? fingerData = const $CopyWithPlaceholder(),
    Object? fingerDetails = const $CopyWithPlaceholder(),
    Object? selectedFingerMonth = const $CopyWithPlaceholder(),
    Object? selectedFingerMonthDt = const $CopyWithPlaceholder(),
    Object? overtimeItems = const $CopyWithPlaceholder(),
    Object? overnightItems = const $CopyWithPlaceholder(),
    Object? holidays = const $CopyWithPlaceholder(),
    Object? workSaturdays = const $CopyWithPlaceholder(),
  }) {
    return SalaryState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      employeeName: employeeName == const $CopyWithPlaceholder()
          ? _value.employeeName
          // ignore: cast_nullable_to_non_nullable
          : employeeName as String?,
      employeeCode: employeeCode == const $CopyWithPlaceholder()
          ? _value.employeeCode
          // ignore: cast_nullable_to_non_nullable
          : employeeCode as String?,
      position: position == const $CopyWithPlaceholder()
          ? _value.position
          // ignore: cast_nullable_to_non_nullable
          : position as String?,
      contractType: contractType == const $CopyWithPlaceholder()
          ? _value.contractType
          // ignore: cast_nullable_to_non_nullable
          : contractType as String?,
      joinDate: joinDate == const $CopyWithPlaceholder()
          ? _value.joinDate
          // ignore: cast_nullable_to_non_nullable
          : joinDate as DateTime?,
      selectedMonth: selectedMonth == const $CopyWithPlaceholder()
          ? _value.selectedMonth
          // ignore: cast_nullable_to_non_nullable
          : selectedMonth as DateTime?,
      basicSalary:
          basicSalary == const $CopyWithPlaceholder() || basicSalary == null
              ? _value.basicSalary
              // ignore: cast_nullable_to_non_nullable
              : basicSalary as double,
      totalWorkday:
          totalWorkday == const $CopyWithPlaceholder() || totalWorkday == null
              ? _value.totalWorkday
              // ignore: cast_nullable_to_non_nullable
              : totalWorkday as double,
      totalMerit:
          totalMerit == const $CopyWithPlaceholder() || totalMerit == null
              ? _value.totalMerit
              // ignore: cast_nullable_to_non_nullable
              : totalMerit as double,
      totalSalaryByDay: totalSalaryByDay == const $CopyWithPlaceholder() ||
              totalSalaryByDay == null
          ? _value.totalSalaryByDay
          // ignore: cast_nullable_to_non_nullable
          : totalSalaryByDay as double,
      salaryOneHour:
          salaryOneHour == const $CopyWithPlaceholder() || salaryOneHour == null
              ? _value.salaryOneHour
              // ignore: cast_nullable_to_non_nullable
              : salaryOneHour as double,
      otHourWD: otHourWD == const $CopyWithPlaceholder() || otHourWD == null
          ? _value.otHourWD
          // ignore: cast_nullable_to_non_nullable
          : otHourWD as double,
      otMoneyWD: otMoneyWD == const $CopyWithPlaceholder() || otMoneyWD == null
          ? _value.otMoneyWD
          // ignore: cast_nullable_to_non_nullable
          : otMoneyWD as double,
      otHourWKNight:
          otHourWKNight == const $CopyWithPlaceholder() || otHourWKNight == null
              ? _value.otHourWKNight
              // ignore: cast_nullable_to_non_nullable
              : otHourWKNight as double,
      otMoneyWKNight: otMoneyWKNight == const $CopyWithPlaceholder() ||
              otMoneyWKNight == null
          ? _value.otMoneyWKNight
          // ignore: cast_nullable_to_non_nullable
          : otMoneyWKNight as double,
      otHourWK: otHourWK == const $CopyWithPlaceholder() || otHourWK == null
          ? _value.otHourWK
          // ignore: cast_nullable_to_non_nullable
          : otHourWK as double,
      otMoneyWK: otMoneyWK == const $CopyWithPlaceholder() || otMoneyWK == null
          ? _value.otMoneyWK
          // ignore: cast_nullable_to_non_nullable
          : otMoneyWK as double,
      otHourWKNightWeekend:
          otHourWKNightWeekend == const $CopyWithPlaceholder() ||
                  otHourWKNightWeekend == null
              ? _value.otHourWKNightWeekend
              // ignore: cast_nullable_to_non_nullable
              : otHourWKNightWeekend as double,
      otMoneyWKNightWeekend:
          otMoneyWKNightWeekend == const $CopyWithPlaceholder() ||
                  otMoneyWKNightWeekend == null
              ? _value.otMoneyWKNightWeekend
              // ignore: cast_nullable_to_non_nullable
              : otMoneyWKNightWeekend as double,
      otHourHD: otHourHD == const $CopyWithPlaceholder() || otHourHD == null
          ? _value.otHourHD
          // ignore: cast_nullable_to_non_nullable
          : otHourHD as double,
      otMoneyHD: otMoneyHD == const $CopyWithPlaceholder() || otMoneyHD == null
          ? _value.otMoneyHD
          // ignore: cast_nullable_to_non_nullable
          : otMoneyHD as double,
      otTotalSalary:
          otTotalSalary == const $CopyWithPlaceholder() || otTotalSalary == null
              ? _value.otTotalSalary
              // ignore: cast_nullable_to_non_nullable
              : otTotalSalary as double,
      allowanceMeal:
          allowanceMeal == const $CopyWithPlaceholder() || allowanceMeal == null
              ? _value.allowanceMeal
              // ignore: cast_nullable_to_non_nullable
              : allowanceMeal as double,
      allowanceOTEarly: allowanceOTEarly == const $CopyWithPlaceholder() ||
              allowanceOTEarly == null
          ? _value.allowanceOTEarly
          // ignore: cast_nullable_to_non_nullable
          : allowanceOTEarly as double,
      totalAllowance: totalAllowance == const $CopyWithPlaceholder() ||
              totalAllowance == null
          ? _value.totalAllowance
          // ignore: cast_nullable_to_non_nullable
          : totalAllowance as double,
      bussinessMoney: bussinessMoney == const $CopyWithPlaceholder() ||
              bussinessMoney == null
          ? _value.bussinessMoney
          // ignore: cast_nullable_to_non_nullable
          : bussinessMoney as double,
      nightShiftMoney: nightShiftMoney == const $CopyWithPlaceholder() ||
              nightShiftMoney == null
          ? _value.nightShiftMoney
          // ignore: cast_nullable_to_non_nullable
          : nightShiftMoney as double,
      costVehicleBussiness:
          costVehicleBussiness == const $CopyWithPlaceholder() ||
                  costVehicleBussiness == null
              ? _value.costVehicleBussiness
              // ignore: cast_nullable_to_non_nullable
              : costVehicleBussiness as double,
      bonus: bonus == const $CopyWithPlaceholder() || bonus == null
          ? _value.bonus
          // ignore: cast_nullable_to_non_nullable
          : bonus as double,
      other: other == const $CopyWithPlaceholder() || other == null
          ? _value.other
          // ignore: cast_nullable_to_non_nullable
          : other as double,
      totalBonus:
          totalBonus == const $CopyWithPlaceholder() || totalBonus == null
              ? _value.totalBonus
              // ignore: cast_nullable_to_non_nullable
              : totalBonus as double,
      totalTaxableIncome: totalTaxableIncome == const $CopyWithPlaceholder() ||
              totalTaxableIncome == null
          ? _value.totalTaxableIncome
          // ignore: cast_nullable_to_non_nullable
          : totalTaxableIncome as double,
      socialInsurance: socialInsurance == const $CopyWithPlaceholder() ||
              socialInsurance == null
          ? _value.socialInsurance
          // ignore: cast_nullable_to_non_nullable
          : socialInsurance as double,
      insurances:
          insurances == const $CopyWithPlaceholder() || insurances == null
              ? _value.insurances
              // ignore: cast_nullable_to_non_nullable
              : insurances as double,
      unionFees: unionFees == const $CopyWithPlaceholder() || unionFees == null
          ? _value.unionFees
          // ignore: cast_nullable_to_non_nullable
          : unionFees as double,
      advancePayment: advancePayment == const $CopyWithPlaceholder() ||
              advancePayment == null
          ? _value.advancePayment
          // ignore: cast_nullable_to_non_nullable
          : advancePayment as double,
      departmentalFees: departmentalFees == const $CopyWithPlaceholder() ||
              departmentalFees == null
          ? _value.departmentalFees
          // ignore: cast_nullable_to_non_nullable
          : departmentalFees as double,
      parkingMoney:
          parkingMoney == const $CopyWithPlaceholder() || parkingMoney == null
              ? _value.parkingMoney
              // ignore: cast_nullable_to_non_nullable
              : parkingMoney as double,
      punish5S: punish5S == const $CopyWithPlaceholder() || punish5S == null
          ? _value.punish5S
          // ignore: cast_nullable_to_non_nullable
          : punish5S as double,
      mealUse: mealUse == const $CopyWithPlaceholder() || mealUse == null
          ? _value.mealUse
          // ignore: cast_nullable_to_non_nullable
          : mealUse as int,
      otherDeduction: otherDeduction == const $CopyWithPlaceholder() ||
              otherDeduction == null
          ? _value.otherDeduction
          // ignore: cast_nullable_to_non_nullable
          : otherDeduction as double,
      totalDeduction: totalDeduction == const $CopyWithPlaceholder() ||
              totalDeduction == null
          ? _value.totalDeduction
          // ignore: cast_nullable_to_non_nullable
          : totalDeduction as double,
      taxSalaryOT:
          taxSalaryOT == const $CopyWithPlaceholder() || taxSalaryOT == null
              ? _value.taxSalaryOT
              // ignore: cast_nullable_to_non_nullable
              : taxSalaryOT as double,
      taxSalaryMeal:
          taxSalaryMeal == const $CopyWithPlaceholder() || taxSalaryMeal == null
              ? _value.taxSalaryMeal
              // ignore: cast_nullable_to_non_nullable
              : taxSalaryMeal as double,
      taxSalaryPhone: taxSalaryPhone == const $CopyWithPlaceholder() ||
              taxSalaryPhone == null
          ? _value.taxSalaryPhone
          // ignore: cast_nullable_to_non_nullable
          : taxSalaryPhone as double,
      taxPersonalDeduction:
          taxPersonalDeduction == const $CopyWithPlaceholder() ||
                  taxPersonalDeduction == null
              ? _value.taxPersonalDeduction
              // ignore: cast_nullable_to_non_nullable
              : taxPersonalDeduction as double,
      taxDependentsDeduction:
          taxDependentsDeduction == const $CopyWithPlaceholder() ||
                  taxDependentsDeduction == null
              ? _value.taxDependentsDeduction
              // ignore: cast_nullable_to_non_nullable
              : taxDependentsDeduction as double,
      totalTaxDeduction: totalTaxDeduction == const $CopyWithPlaceholder() ||
              totalTaxDeduction == null
          ? _value.totalTaxDeduction
          // ignore: cast_nullable_to_non_nullable
          : totalTaxDeduction as double,
      taxAbleIncome:
          taxAbleIncome == const $CopyWithPlaceholder() || taxAbleIncome == null
              ? _value.taxAbleIncome
              // ignore: cast_nullable_to_non_nullable
              : taxAbleIncome as double,
      taxDeduction:
          taxDeduction == const $CopyWithPlaceholder() || taxDeduction == null
              ? _value.taxDeduction
              // ignore: cast_nullable_to_non_nullable
              : taxDeduction as double,
      netSalary: netSalary == const $CopyWithPlaceholder() || netSalary == null
          ? _value.netSalary
          // ignore: cast_nullable_to_non_nullable
          : netSalary as double,
      note: note == const $CopyWithPlaceholder()
          ? _value.note
          // ignore: cast_nullable_to_non_nullable
          : note as String?,
      hasPin: hasPin == const $CopyWithPlaceholder() || hasPin == null
          ? _value.hasPin
          // ignore: cast_nullable_to_non_nullable
          : hasPin as bool,
      pinVerified:
          pinVerified == const $CopyWithPlaceholder() || pinVerified == null
              ? _value.pinVerified
              // ignore: cast_nullable_to_non_nullable
              : pinVerified as bool,
      isVerifyingPin: isVerifyingPin == const $CopyWithPlaceholder() ||
              isVerifyingPin == null
          ? _value.isVerifyingPin
          // ignore: cast_nullable_to_non_nullable
          : isVerifyingPin as bool,
      pinError: pinError == const $CopyWithPlaceholder()
          ? _value.pinError
          // ignore: cast_nullable_to_non_nullable
          : pinError as String?,
      pinRetryCount:
          pinRetryCount == const $CopyWithPlaceholder() || pinRetryCount == null
              ? _value.pinRetryCount
              // ignore: cast_nullable_to_non_nullable
              : pinRetryCount as int,
      isPinLocked:
          isPinLocked == const $CopyWithPlaceholder() || isPinLocked == null
              ? _value.isPinLocked
              // ignore: cast_nullable_to_non_nullable
              : isPinLocked as bool,
      forgotStep:
          forgotStep == const $CopyWithPlaceholder() || forgotStep == null
              ? _value.forgotStep
              // ignore: cast_nullable_to_non_nullable
              : forgotStep as int,
      forgotIsLoading: forgotIsLoading == const $CopyWithPlaceholder() ||
              forgotIsLoading == null
          ? _value.forgotIsLoading
          // ignore: cast_nullable_to_non_nullable
          : forgotIsLoading as bool,
      forgotError: forgotError == const $CopyWithPlaceholder()
          ? _value.forgotError
          // ignore: cast_nullable_to_non_nullable
          : forgotError as String?,
      forgotEmailMessage: forgotEmailMessage == const $CopyWithPlaceholder()
          ? _value.forgotEmailMessage
          // ignore: cast_nullable_to_non_nullable
          : forgotEmailMessage as String?,
      otpToken: otpToken == const $CopyWithPlaceholder()
          ? _value.otpToken
          // ignore: cast_nullable_to_non_nullable
          : otpToken as String?,
      payroll: payroll == const $CopyWithPlaceholder() || payroll == null
          ? _value.payroll
          // ignore: cast_nullable_to_non_nullable
          : payroll as List<SalaryPayrollItem>,
      listChamcong: listChamcong == const $CopyWithPlaceholder()
          ? _value.listChamcong
          // ignore: cast_nullable_to_non_nullable
          : listChamcong as SalaryListChamCong?,
      listSummary: listSummary == const $CopyWithPlaceholder()
          ? _value.listSummary
          // ignore: cast_nullable_to_non_nullable
          : listSummary as List<List<SalarySummaryItem>>?,
      fingers: fingers == const $CopyWithPlaceholder()
          ? _value.fingers
          // ignore: cast_nullable_to_non_nullable
          : fingers as SalaryFingers?,
      fingerData: fingerData == const $CopyWithPlaceholder()
          ? _value.fingerData
          // ignore: cast_nullable_to_non_nullable
          : fingerData as SalaryFingerData?,
      fingerDetails:
          fingerDetails == const $CopyWithPlaceholder() || fingerDetails == null
              ? _value.fingerDetails
              // ignore: cast_nullable_to_non_nullable
              : fingerDetails as List<SalaryFingerDetail>,
      selectedFingerMonth: selectedFingerMonth == const $CopyWithPlaceholder()
          ? _value.selectedFingerMonth
          // ignore: cast_nullable_to_non_nullable
          : selectedFingerMonth as int?,
      selectedFingerMonthDt:
          selectedFingerMonthDt == const $CopyWithPlaceholder()
              ? _value.selectedFingerMonthDt
              // ignore: cast_nullable_to_non_nullable
              : selectedFingerMonthDt as DateTime?,
      overtimeItems:
          overtimeItems == const $CopyWithPlaceholder() || overtimeItems == null
              ? _value.overtimeItems
              // ignore: cast_nullable_to_non_nullable
              : overtimeItems as List<OvertimeItem>,
      overnightItems: overnightItems == const $CopyWithPlaceholder() ||
              overnightItems == null
          ? _value.overnightItems
          // ignore: cast_nullable_to_non_nullable
          : overnightItems as List<OvertimeItem>,
      holidays: holidays == const $CopyWithPlaceholder() || holidays == null
          ? _value.holidays
          // ignore: cast_nullable_to_non_nullable
          : holidays as List<DateTime>,
      workSaturdays:
          workSaturdays == const $CopyWithPlaceholder() || workSaturdays == null
              ? _value.workSaturdays
              // ignore: cast_nullable_to_non_nullable
              : workSaturdays as List<DateTime>,
    );
  }
}

extension $SalaryStateCopyWith on SalaryState {
  /// Returns a callable class that can be used as follows: `instanceOfSalaryState.copyWith(...)` or like so:`instanceOfSalaryState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SalaryStateCWProxy get copyWith => _$SalaryStateCWProxyImpl(this);
}
