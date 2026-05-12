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
  final double refIncome;         // (4) Thu nhập tiêu chuẩn tham chiếu
  final double actualWorkDays;    // (5) Công thực tế
  final double leaveDays;         // (5b) Phép
  final double totalWorkDays;     // (5a) Tổng công (actualWorkDays + leaveDays)
  final double standardSalary;    // (6) Thu nhập thực lĩnh = (4) / F4 * (5)
  final double hourlyRate;        // (7) Đơn giá/giờ = (4) / F4 / 8

  // Card làm thêm
  final double weekdayHours;          // (8) Giờ ngày thường
  final double weekdayOvertimePay;    // (9) = (8) * (7) * 1.5
  final double weekendHours;          // (10) Giờ cuối tuần
  final double weekendOvertimePay;    // (11) = (10) * (7) * 2
  final double holidayHours;          // (12) Giờ ngày lễ/Tết
  final double holidayOvertimePay;     // (13) = (12) * (7) * 3
  final double totalOvertime;         // (14) Tổng làm thêm = (9)+(11)+(13)

  // Card phụ cấp
  final double mealAllowance;      // (17) Cơm ca sau 20H/theo loại ca tác
  final double earlyShiftAllowance; // (18) Đi làm trước 7h15
  final double totalAllowance;     // (19) = (16)+(17)+(18)

  // Card các khoản cộng khác
  final double travelAllowance;   // (20) Công tác phí
  final double nightWorkPay;      // (21) Làm đêm
  final double transportCost;     // (22) Chi phí phương tiện công tác
  final double kpiBonus;         // (23) Thưởng KPIs/doanh số
  final double otherAddition;    // (24) Khác
  final double totalOtherAdditions; // (25) = (20)+(21)+(22)+(23)+(24)

  // Card Tổng thu nhập
  final double totalTaxableIncome; // (26) = (6)+(14)+(19)+(25)

  // Card các khoản phải trừ
  final double socialInsuranceRate;      // (29a) Mức đóng BHXH, BHYT, BHTN
  final double socialInsuranceAmount;   // (29) = 10.5% * (27)
  final double unionFundRate;            // (30a) Mức đóng Quỹ BĐS
  final double unionFundAmount;          // (31) = 1% * (27)
  final double salaryAdvance;            // (32) Ứng lương
  final double deptCollection;            // (33) Thu hộ phòng ban
  final double carParking;               // (34) Gửi xe ô tô
  final double fiveSParking;             // (35) 5S
  final double mealDeduction;            // (36) Cơm ca tại VP
  final double otherDeduction;           // (37) Khác
  final double totalDeductions;          // (38) = (31)+(32)+(33)+(34)+(35)+(36)+(37)

  // Card tổng thu nhập tính thuế (card lớn, collapsible)
  // Card con: Giảm trừ thuế TNCN
  final double taxableSocialInsurance;     // (39) Lương BHXH 10.5%
  final double taxableOvertime;           // (40) = (14)+(21)
  final double taxableMealAllowance;      // (41) PC cơm ca
  final double taxablePhoneAllowance;      // (42) PC điện thoại
  final double taxablePersonalDeduction;   // (43) Giảm trừ bản thân
  final double taxableDependentDeduction;  // (44) Giảm trừ người phụ thuộc
  final double totalTaxDeductions;        // (45) = (39)+(40)+(41)+(42)+(43)+(44)
  final double taxableIncome;             // (46) = (26)-(30)-(44)
  final double incomeTax;                 // (47) Khấu trừ Thuế TNCN

  // Thực lĩnh & Ghi chú
  final double netSalary;                 // (48) = (28)-(30)-(38)-(45)
  final String? note;                     // (49) Ghi chú

  const SalaryState({
    required super.status,
    super.message,
    this.employeeName,
    this.employeeCode,
    this.position,
    this.contractType,
    this.joinDate,
    this.selectedMonth,
    this.refIncome = 0,
    this.actualWorkDays = 0,
    this.leaveDays = 0,
    this.totalWorkDays = 0,
    this.standardSalary = 0,
    this.hourlyRate = 0,
    this.weekdayHours = 0,
    this.weekdayOvertimePay = 0,
    this.weekendHours = 0,
    this.weekendOvertimePay = 0,
    this.holidayHours = 0,
    this.holidayOvertimePay = 0,
    this.totalOvertime = 0,
    this.mealAllowance = 0,
    this.earlyShiftAllowance = 0,
    this.totalAllowance = 0,
    this.travelAllowance = 0,
    this.nightWorkPay = 0,
    this.transportCost = 0,
    this.kpiBonus = 0,
    this.otherAddition = 0,
    this.totalOtherAdditions = 0,
    this.totalTaxableIncome = 0,
    // Card các khoản phải trừ
    this.socialInsuranceRate = 0,
    this.socialInsuranceAmount = 0,
    this.unionFundRate = 0,
    this.unionFundAmount = 0,
    this.salaryAdvance = 0,
    this.deptCollection = 0,
    this.carParking = 0,
    this.fiveSParking = 0,
    this.mealDeduction = 0,
    this.otherDeduction = 0,
    this.totalDeductions = 0,
    // Card giảm trừ thuế
    this.taxableSocialInsurance = 0,
    this.taxableOvertime = 0,
    this.taxableMealAllowance = 0,
    this.taxablePhoneAllowance = 0,
    this.taxablePersonalDeduction = 0,
    this.taxableDependentDeduction = 0,
    this.totalTaxDeductions = 0,
    this.taxableIncome = 0,
    this.incomeTax = 0,
    // Thực lĩnh & Ghi chú
    this.netSalary = 0,
    this.note,
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
        refIncome,
        actualWorkDays,
        leaveDays,
        totalWorkDays,
        standardSalary,
        hourlyRate,
        weekdayHours,
        weekdayOvertimePay,
        weekendHours,
        weekendOvertimePay,
        holidayHours,
        holidayOvertimePay,
        totalOvertime,
        mealAllowance,
        earlyShiftAllowance,
        totalAllowance,
        travelAllowance,
        nightWorkPay,
        transportCost,
        kpiBonus,
        otherAddition,
        totalOtherAdditions,
        totalTaxableIncome,
        // Card các khoản phải trừ
        socialInsuranceRate,
        socialInsuranceAmount,
        unionFundRate,
        unionFundAmount,
        salaryAdvance,
        deptCollection,
        carParking,
        fiveSParking,
        mealDeduction,
        otherDeduction,
        totalDeductions,
        // Card giảm trừ thuế
        taxableSocialInsurance,
        taxableOvertime,
        taxableMealAllowance,
        taxablePhoneAllowance,
        taxablePersonalDeduction,
        taxableDependentDeduction,
        totalTaxDeductions,
        taxableIncome,
        incomeTax,
        // Thực lĩnh & Ghi chú
        netSalary,
        note,
      ];
}
