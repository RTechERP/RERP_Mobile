part of 'salary_bloc.dart';

@CopyWith()
class SalaryState extends BaseBlocState {
  // Thông tin nhân viên
  final String? employeeName;
  final String? employeeCode;
  final String? position;
  final String? contractType;
  final DateTime? joinDate;
  final DateTime? selectedMonth;

  // Card thu nhập tiêu chuẩn
  final double basicSalary;         // (4) Lương cơ bản
  final double totalWorkday;        // (5) Tổng công
  final double totalMerit;          // (5b) Công thưởng/phạt
  final double totalSalaryByDay;    // (6) Lương theo ngày công
  final double salaryOneHour;       // (7) Lương 1 giờ

  // Card làm thêm
  final double otHourWD;           // (8) Giờ ngày thường
  final double otMoneyWD;           // (9) Tiền OT ngày thường
  final double otHourWKNight;      // Giờ ngày thường - Đêm
  final double otMoneyWKNight;      // Tiền OT ngày thường - Đêm
  final double otHourWK;           // (10) Giờ cuối tuần
  final double otMoneyWK;          // (11) Tiền OT cuối tuần
  final double otHourWKNightWeekend; // Giờ cuối tuần - Đêm
  final double otMoneyWKNightWeekend; // Tiền OT cuối tuần - Đêm
  final double otHourHD;           // (12) Giờ ngày lễ/Tết
  final double otMoneyHD;          // (13) Tiền OT ngày lễ/Tết
  final double otTotalSalary;      // (14) Tổng tiền OT

  // Card phụ cấp
  final double allowanceMeal;      // (17) Phụ cấp cơm ca
  final double allowanceOTEarly;     // (18) Phụ cấp đi sớm
  final double totalAllowance;      // (19) Tổng phụ cấp

  // Card các khoản cộng khác
  final double bussinessMoney;     // (20) Công tác phí
  final double nightShiftMoney;     // (21) Làm đêm
  final double costVehicleBussiness; // (22) Chi phí phương tiện
  final double bonus;              // (23) Thưởng KPIs/doanh số
  final double other;              // (24) Khác
  final double totalBonus;         // (25) Tổng các khoản cộng khác

  // Card Tổng thu nhập
  final double totalTaxableIncome;  // (26) Tổng thu nhập chịu thuế

  // Card các khoản phải trừ
  final double socialInsurance;     // (29) Mức đống BHXH, BHYT, BHTN
  final double insurances;          // (30) Phải thu BHXH
  final double unionFees;           // (31) Quỹ BĐS
  final double advancePayment;      // (32) Ứng lương
  final double departmentalFees;    // (33) Thu hộ phòng ban
  final double parkingMoney;       // (34) Gửi xe ô tô
  final double punish5S;           // (35) 5S
  final int mealUse;            // (36) Cơm ca tại VP
  final double otherDeduction;     // (37) Khác
  final double totalDeduction;     // (38) Tổng các khoản trừ

  // Card giảm trừ thuế TNCN
  final double taxSalaryOT;         // (40) Thu nhập OT chịu thuế
  final double taxSalaryMeal;      // (41) PC cơm ca chịu thuế
  final double taxSalaryPhone;     // (42) PC điện thoại chịu thuế
  final double taxPersonalDeduction; // (43) Giảm trừ bản thân
  final double taxDependentsDeduction; // (44) Giảm trừ người phụ thuộc
  final double totalTaxDeduction;  // (45) Tổng giảm trừ thuế
  final double taxAbleIncome;      // (46) Thu nhập tính thuế
  final double taxDeduction;       // (47) Thuế TNCN

  // Thực lĩnh & Ghi chú
  final double netSalary;           // (48) Thực lĩnh
  final String? note;              // (49) Ghi chú

  // PIN verification
  final bool hasPin;
  final bool pinVerified;
  final bool isVerifyingPin;
  final String? pinError;
  final int pinRetryCount;
  final bool isPinLocked;

  // Forgot PIN flow
  final int forgotStep;
  final bool forgotIsLoading;
  final String? forgotError;
  final String? forgotEmailMessage;
  final String? otpToken;

  // Payroll data
  final List<SalaryPayrollItem> payroll;
  final SalaryListChamCong? listChamcong;
  final List<List<SalarySummaryItem>>? listSummary;

  // Fingerprint data
  final SalaryFingers? fingers;
  final SalaryFingerData? fingerData;
  final List<SalaryFingerDetail> fingerDetails;
  final int? selectedFingerMonth;
  final DateTime? selectedFingerMonthDt;

  // Overtime data
  final List<OvertimeItem> overtimeItems;
  final List<OvertimeItem> overnightItems;

  const SalaryState({
    required super.status,
    super.message,
    this.employeeName,
    this.employeeCode,
    this.position,
    this.contractType,
    this.joinDate,
    this.selectedMonth,
    this.basicSalary = 0,
    this.totalWorkday = 0,
    this.totalMerit = 0,
    this.totalSalaryByDay = 0,
    this.salaryOneHour = 0,
    this.otHourWD = 0,
    this.otMoneyWD = 0,
    this.otHourWKNight = 0,
    this.otMoneyWKNight = 0,
    this.otHourWK = 0,
    this.otMoneyWK = 0,
    this.otHourWKNightWeekend = 0,
    this.otMoneyWKNightWeekend = 0,
    this.otHourHD = 0,
    this.otMoneyHD = 0,
    this.otTotalSalary = 0,
    this.allowanceMeal = 0,
    this.allowanceOTEarly = 0,
    this.totalAllowance = 0,
    this.bussinessMoney = 0,
    this.nightShiftMoney = 0,
    this.costVehicleBussiness = 0,
    this.bonus = 0,
    this.other = 0,
    this.totalBonus = 0,
    this.totalTaxableIncome = 0,
    this.socialInsurance = 0,
    this.insurances = 0,
    this.unionFees = 0,
    this.advancePayment = 0,
    this.departmentalFees = 0,
    this.parkingMoney = 0,
    this.punish5S = 0,
    this.mealUse = 0,
    this.otherDeduction = 0,
    this.totalDeduction = 0,
    this.taxSalaryOT = 0,
    this.taxSalaryMeal = 0,
    this.taxSalaryPhone = 0,
    this.taxPersonalDeduction = 0,
    this.taxDependentsDeduction = 0,
    this.totalTaxDeduction = 0,
    this.taxAbleIncome = 0,
    this.taxDeduction = 0,
    this.netSalary = 0,
    this.note,
    this.hasPin = false,
    this.pinVerified = false,
    this.isVerifyingPin = false,
    this.pinError,
    this.pinRetryCount = 0,
    this.isPinLocked = false,
    this.forgotStep = 0,
    this.forgotIsLoading = false,
    this.forgotError,
    this.forgotEmailMessage,
    this.otpToken,
    this.payroll = const [],
    this.listChamcong,
    this.listSummary,
    this.fingers,
    this.fingerData,
    this.fingerDetails = const [],
    this.selectedFingerMonth,
    this.selectedFingerMonthDt,
    this.overtimeItems = const [],
    this.overnightItems = const [],
  });

  factory SalaryState.init() => const SalaryState(
        status: BaseStateStatus.init,
      );

  @override
  List get props => [
        status,
        message,
        employeeName,
        employeeCode,
        position,
        contractType,
        joinDate,
        selectedMonth,
        basicSalary,
        totalWorkday,
        totalMerit,
        totalSalaryByDay,
        salaryOneHour,
        otHourWD,
        otMoneyWD,
        otHourWKNight,
        otMoneyWKNight,
        otHourWK,
        otMoneyWK,
        otHourWKNightWeekend,
        otMoneyWKNightWeekend,
        otHourHD,
        otMoneyHD,
        otTotalSalary,
        allowanceMeal,
        allowanceOTEarly,
        totalAllowance,
        bussinessMoney,
        nightShiftMoney,
        costVehicleBussiness,
        bonus,
        other,
        totalBonus,
        totalTaxableIncome,
        socialInsurance,
        insurances,
        unionFees,
        advancePayment,
        departmentalFees,
        parkingMoney,
        punish5S,
        mealUse,
        otherDeduction,
        totalDeduction,
        taxSalaryOT,
        taxSalaryMeal,
        taxSalaryPhone,
        taxPersonalDeduction,
        taxDependentsDeduction,
        totalTaxDeduction,
        taxAbleIncome,
        taxDeduction,
        netSalary,
        note,
        hasPin,
        pinVerified,
        isVerifyingPin,
        pinError,
        pinRetryCount,
        isPinLocked,
        forgotStep,
        forgotIsLoading,
        forgotError,
        forgotEmailMessage,
        otpToken,
        payroll,
        listChamcong,
        listSummary,
        fingers,
        fingerData,
        fingerDetails,
        selectedFingerMonth,
        selectedFingerMonthDt,
        overtimeItems,
        overnightItems,
      ];
}
