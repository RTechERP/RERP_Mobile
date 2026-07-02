// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SummarySalaryResponseImpl _$$SummarySalaryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SummarySalaryResponseImpl(
      listSummary: (json['listSummary'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>)
              .map((e) => SalarySummaryItem.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
      fingers: json['fingers'] == null
          ? null
          : SalaryFingers.fromJson(json['fingers'] as Map<String, dynamic>),
      payroll: (json['payroll'] as List<dynamic>?)
          ?.map((e) => SalaryPayrollItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      listChamcong: json['listChamcong'] == null
          ? null
          : SalaryListChamCong.fromJson(
              json['listChamcong'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SummarySalaryResponseImplToJson(
        _$SummarySalaryResponseImpl instance) =>
    <String, dynamic>{
      'listSummary': instance.listSummary,
      'fingers': instance.fingers,
      'payroll': instance.payroll,
      'listChamcong': instance.listChamcong,
    };

_$SalarySummaryItemImpl _$$SalarySummaryItemImplFromJson(
        Map<String, dynamic> json) =>
    _$SalarySummaryItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      typeTable: (json['TypeTable'] as num?)?.toInt(),
      typeText: json['Typetext'] as String?,
      hangMuc: json['HangMuc'] as String?,
      unit: json['Unit'] as String?,
      value: (json['Value'] as num?)?.toDouble(),
      note: json['Note'] as String?,
      valueText: json['ValueText'] as String?,
      hrApproved: json['HRApproved'] as String?,
      tbpApproved: json['TBPApproved'] as String?,
      hrCancel: json['HRCancel'] as String?,
      tbpCancel: json['TBPCancel'] as String?,
      valueReal: (json['ValueReal'] as num?)?.toDouble(),
      valueTextReal: json['ValueTextReal'] as String?,
    );

Map<String, dynamic> _$$SalarySummaryItemImplToJson(
        _$SalarySummaryItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'TypeTable': instance.typeTable,
      'Typetext': instance.typeText,
      'HangMuc': instance.hangMuc,
      'Unit': instance.unit,
      'Value': instance.value,
      'Note': instance.note,
      'ValueText': instance.valueText,
      'HRApproved': instance.hrApproved,
      'TBPApproved': instance.tbpApproved,
      'HRCancel': instance.hrCancel,
      'TBPCancel': instance.tbpCancel,
      'ValueReal': instance.valueReal,
      'ValueTextReal': instance.valueTextReal,
    };

_$SalaryFingersImpl _$$SalaryFingersImplFromJson(Map<String, dynamic> json) =>
    _$SalaryFingersImpl(
      data: json['data'] == null
          ? null
          : SalaryFingerData.fromJson(json['data'] as Map<String, dynamic>),
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => SalaryFingerDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SalaryFingersImplToJson(_$SalaryFingersImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'details': instance.details,
    };

_$SalaryFingerDataImpl _$$SalaryFingerDataImplFromJson(
        Map<String, dynamic> json) =>
    _$SalaryFingerDataImpl(
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      totalLate: (json['TotalLate'] as num?)?.toInt(),
      totalLateCty: (json['TotalLateCty'] as num?)?.toInt(),
      totalEarly: (json['TotalEarly'] as num?)?.toInt(),
      totalEarlyCty: (json['TotalEarlyCty'] as num?)?.toInt(),
      totalRegisterCheckin: (json['TotalRegisterCheckin'] as num?)?.toInt(),
      totalRegisterCheckout: (json['TotalRegisterCheckout'] as num?)?.toInt(),
      totalNoCheckIn: (json['TotalNoCheckIn'] as num?)?.toInt(),
      totalNoCheckOut: (json['TotalNoCheckOut'] as num?)?.toInt(),
      totalDayNoSalary: (json['TotalDayNoSalary'] as num?)?.toDouble(),
      totalDaySalary: (json['TotalDaySalary'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$SalaryFingerDataImplToJson(
        _$SalaryFingerDataImpl instance) =>
    <String, dynamic>{
      'EmployeeID': instance.employeeId,
      'TotalLate': instance.totalLate,
      'TotalLateCty': instance.totalLateCty,
      'TotalEarly': instance.totalEarly,
      'TotalEarlyCty': instance.totalEarlyCty,
      'TotalRegisterCheckin': instance.totalRegisterCheckin,
      'TotalRegisterCheckout': instance.totalRegisterCheckout,
      'TotalNoCheckIn': instance.totalNoCheckIn,
      'TotalNoCheckOut': instance.totalNoCheckOut,
      'TotalDayNoSalary': instance.totalDayNoSalary,
      'TotalDaySalary': instance.totalDaySalary,
    };

_$SalaryFingerDetailImpl _$$SalaryFingerDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$SalaryFingerDetailImpl(
      id: (json['ID'] as num?)?.toInt(),
      idChamCongMoi: json['IDChamCongMoi'] as String?,
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      checkIn: json['CheckIn'] as String?,
      checkOut: json['CheckOut'] as String?,
      isLate: json['IsLate'] as bool?,
      timeLate: (json['TimeLate'] as num?)?.toDouble(),
      isEarly: json['IsEarly'] as bool?,
      timeEarly: (json['TimeEarly'] as num?)?.toDouble(),
      attendanceDate: json['AttendanceDate'] == null
          ? null
          : DateTime.parse(json['AttendanceDate'] as String),
      dayWeek: json['DayWeek'] as String?,
      interval: json['Interval'] as String?,
      stt: (json['STT'] as num?)?.toInt(),
      fullName: json['FullName'] as String?,
      toChuc: json['ToChuc'] as String?,
      chucVu: json['ChucVu'] as String?,
      isLunch: json['IsLunch'] as bool?,
      overtime: json['Overtime'] as bool?,
      bussiness: json['Bussiness'] as bool?,
      noFingerprint: json['NoFingerprint'] as bool?,
      onLeave: json['OnLeave'] as bool?,
      wfh: json['WFH'] as bool?,
      departmentName: json['DepartmentName'] as String?,
      isLateRegister: json['IsLateRegister'] as bool?,
      isEarlyRegister: json['IsEarlyRegister'] as bool?,
      totalDay: (json['TotalDay'] as num?)?.toDouble(),
      holidayDay: (json['HolidayDay'] as num?)?.toInt(),
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      departmentStt: (json['DepartmentSTT'] as num?)?.toInt(),
      overtimeLate: (json['OvertimeLate'] as num?)?.toInt(),
      overtimeEarly: (json['OvertimeEarly'] as num?)?.toInt(),
      isOverEarly: json['IsOverEarly'] as bool?,
      isOverLate: json['IsOverLate'] as bool?,
      checkInDate: json['CheckInDate'] == null
          ? null
          : DateTime.parse(json['CheckInDate'] as String),
      checkOutDate: json['CheckOutDate'] == null
          ? null
          : DateTime.parse(json['CheckOutDate'] as String),
      typeLate: (json['TypeLate'] as num?)?.toInt(),
      typeEarly: (json['TypeEarly'] as num?)?.toInt(),
      code: json['Code'] as String?,
      isLateActual: (json['IsLateActual'] as num?)?.toInt(),
      isEarlyActual: (json['IsEarlyActual'] as num?)?.toInt(),
      totalProblem: (json['TotalProblem'] as num?)?.toInt(),
      maxIsLate: (json['MaxIsLate'] as num?)?.toInt(),
      maxIsEarly: (json['MaxIsEarly'] as num?)?.toInt(),
      isNoFinger: (json['IsNoFinger'] as num?)?.toInt(),
      isNoCheckIn: (json['IsNoCheckIn'] as num?)?.toInt(),
      isNoCheckOut: (json['IsNoCheckOut'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SalaryFingerDetailImplToJson(
        _$SalaryFingerDetailImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'IDChamCongMoi': instance.idChamCongMoi,
      'EmployeeID': instance.employeeId,
      'CheckIn': instance.checkIn,
      'CheckOut': instance.checkOut,
      'IsLate': instance.isLate,
      'TimeLate': instance.timeLate,
      'IsEarly': instance.isEarly,
      'TimeEarly': instance.timeEarly,
      'AttendanceDate': instance.attendanceDate?.toIso8601String(),
      'DayWeek': instance.dayWeek,
      'Interval': instance.interval,
      'STT': instance.stt,
      'FullName': instance.fullName,
      'ToChuc': instance.toChuc,
      'ChucVu': instance.chucVu,
      'IsLunch': instance.isLunch,
      'Overtime': instance.overtime,
      'Bussiness': instance.bussiness,
      'NoFingerprint': instance.noFingerprint,
      'OnLeave': instance.onLeave,
      'WFH': instance.wfh,
      'DepartmentName': instance.departmentName,
      'IsLateRegister': instance.isLateRegister,
      'IsEarlyRegister': instance.isEarlyRegister,
      'TotalDay': instance.totalDay,
      'HolidayDay': instance.holidayDay,
      'DepartmentID': instance.departmentId,
      'DepartmentSTT': instance.departmentStt,
      'OvertimeLate': instance.overtimeLate,
      'OvertimeEarly': instance.overtimeEarly,
      'IsOverEarly': instance.isOverEarly,
      'IsOverLate': instance.isOverLate,
      'CheckInDate': instance.checkInDate?.toIso8601String(),
      'CheckOutDate': instance.checkOutDate?.toIso8601String(),
      'TypeLate': instance.typeLate,
      'TypeEarly': instance.typeEarly,
      'Code': instance.code,
      'IsLateActual': instance.isLateActual,
      'IsEarlyActual': instance.isEarlyActual,
      'TotalProblem': instance.totalProblem,
      'MaxIsLate': instance.maxIsLate,
      'MaxIsEarly': instance.maxIsEarly,
      'IsNoFinger': instance.isNoFinger,
      'IsNoCheckIn': instance.isNoCheckIn,
      'IsNoCheckOut': instance.isNoCheckOut,
    };

_$SalaryListChamCongImpl _$$SalaryListChamCongImplFromJson(
        Map<String, dynamic> json) =>
    _$SalaryListChamCongImpl(
      header: (json['header'] as List<dynamic>?)
          ?.map((e) =>
              SalaryListChamCongHeader.fromJson(e as Map<String, dynamic>))
          .toList(),
      data: json['data'] == null
          ? null
          : SalaryListChamCongData.fromJson(
              json['data'] as Map<String, dynamic>),
      totalworkday: (json['totalworkday'] as num?)?.toInt(),
      detail: (json['detail'] as List<dynamic>?)
          ?.map((e) =>
              SalaryListChamCongDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SalaryListChamCongImplToJson(
        _$SalaryListChamCongImpl instance) =>
    <String, dynamic>{
      'header': instance.header,
      'data': instance.data,
      'totalworkday': instance.totalworkday,
      'detail': instance.detail,
    };

_$SalaryListChamCongHeaderImpl _$$SalaryListChamCongHeaderImplFromJson(
        Map<String, dynamic> json) =>
    _$SalaryListChamCongHeaderImpl(
      fieldname: json['fieldname'] as String?,
      text: json['text'] as String?,
      statuswork: (json['statuswork'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SalaryListChamCongHeaderImplToJson(
        _$SalaryListChamCongHeaderImpl instance) =>
    <String, dynamic>{
      'fieldname': instance.fieldname,
      'text': instance.text,
      'statuswork': instance.statuswork,
    };

_$SalaryListChamCongDataImpl _$$SalaryListChamCongDataImplFromJson(
        Map<String, dynamic> json) =>
    _$SalaryListChamCongDataImpl(
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      fullName: json['FullName'] as String?,
      departmentName: json['DepartmentName'] as String?,
      positionName: json['PositionName'] as String?,
      priorityOrder: (json['PriorityOrder'] as num?)?.toInt(),
      d1: json['D1'] as String?,
      d2: json['D2'] as String?,
      d3: json['D3'] as String?,
      d4: json['D4'] as String?,
      d5: json['D5'] as String?,
      d6: json['D6'] as String?,
      d7: json['D7'] as String?,
      d8: json['D8'] as String?,
      d9: json['D9'] as String?,
      d10: json['D10'] as String?,
      d11: json['D11'] as String?,
      d12: json['D12'] as String?,
      d13: json['D13'] as String?,
      d14: json['D14'] as String?,
      d15: json['D15'] as String?,
      d16: json['D16'] as String?,
      d17: json['D17'] as String?,
      d18: json['D18'] as String?,
      d19: json['D19'] as String?,
      d20: json['D20'] as String?,
      d21: json['D21'] as String?,
      d22: json['D22'] as String?,
      d23: json['D23'] as String?,
      d24: json['D24'] as String?,
      d25: json['D25'] as String?,
      d26: json['D26'] as String?,
      d27: json['D27'] as String?,
      d28: json['D28'] as String?,
      d29: json['D29'] as String?,
      d30: json['D30'] as String?,
      d31: json['D31'] as String?,
      totalDayActual: (json['TotalDayActual'] as num?)?.toDouble(),
      totalHoliday: (json['TotalHoliday'] as num?)?.toInt(),
      totalDayOnleave2: (json['TotalDayOnleave2'] as num?)?.toDouble(),
      totalDayOnleave3: (json['TotalDayOnleave3'] as num?)?.toDouble(),
      totalDayWfh: (json['TotalDayWFH'] as num?)?.toDouble(),
      totalDayGet: (json['TotalDayGet'] as num?)?.toDouble(),
      totalDayOnleave1: (json['TotalDayOnleave1'] as num?)?.toDouble(),
      totalDay: (json['TotalDay'] as num?)?.toDouble(),
      departmentStt: (json['DepartmentSTT'] as num?)?.toInt(),
      stt: (json['STT'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SalaryListChamCongDataImplToJson(
        _$SalaryListChamCongDataImpl instance) =>
    <String, dynamic>{
      'EmployeeID': instance.employeeId,
      'Code': instance.code,
      'FullName': instance.fullName,
      'DepartmentName': instance.departmentName,
      'PositionName': instance.positionName,
      'PriorityOrder': instance.priorityOrder,
      'D1': instance.d1,
      'D2': instance.d2,
      'D3': instance.d3,
      'D4': instance.d4,
      'D5': instance.d5,
      'D6': instance.d6,
      'D7': instance.d7,
      'D8': instance.d8,
      'D9': instance.d9,
      'D10': instance.d10,
      'D11': instance.d11,
      'D12': instance.d12,
      'D13': instance.d13,
      'D14': instance.d14,
      'D15': instance.d15,
      'D16': instance.d16,
      'D17': instance.d17,
      'D18': instance.d18,
      'D19': instance.d19,
      'D20': instance.d20,
      'D21': instance.d21,
      'D22': instance.d22,
      'D23': instance.d23,
      'D24': instance.d24,
      'D25': instance.d25,
      'D26': instance.d26,
      'D27': instance.d27,
      'D28': instance.d28,
      'D29': instance.d29,
      'D30': instance.d30,
      'D31': instance.d31,
      'TotalDayActual': instance.totalDayActual,
      'TotalHoliday': instance.totalHoliday,
      'TotalDayOnleave2': instance.totalDayOnleave2,
      'TotalDayOnleave3': instance.totalDayOnleave3,
      'TotalDayWFH': instance.totalDayWfh,
      'TotalDayGet': instance.totalDayGet,
      'TotalDayOnleave1': instance.totalDayOnleave1,
      'TotalDay': instance.totalDay,
      'DepartmentSTT': instance.departmentStt,
      'STT': instance.stt,
    };

_$SalaryListChamCongDetailImpl _$$SalaryListChamCongDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$SalaryListChamCongDetailImpl(
      value: json['value'] == null
          ? null
          : DateTime.parse(json['value'] as String),
      fieldname: json['fieldname'] as String?,
      text: (json['text'] as num?)?.toInt(),
      disabled: json['disabled'] as bool?,
      statuswork: (json['statuswork'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SalaryListChamCongDetailImplToJson(
        _$SalaryListChamCongDetailImpl instance) =>
    <String, dynamic>{
      'value': instance.value?.toIso8601String(),
      'fieldname': instance.fieldname,
      'text': instance.text,
      'disabled': instance.disabled,
      'statuswork': instance.statuswork,
    };

_$SalaryPayrollItemImpl _$$SalaryPayrollItemImplFromJson(
        Map<String, dynamic> json) =>
    _$SalaryPayrollItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      sign: json['Sign'] as bool?,
      payrollId: (json['PayrollID'] as num?)?.toInt(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      fullName: json['FullName'] as String?,
      departmentSTT: (json['DepartmentSTT'] as num?)?.toInt(),
      departmentName: json['DepartmentName'] as String?,
      priorityOrder: (json['PriorityOrder'] as num?)?.toInt(),
      positionName: json['PositionName'] as String?,
      basicSalary: (json['BasicSalary'] as num?)?.toDouble(),
      totalWorkday: (json['TotalWorkday'] as num?)?.toDouble(),
      totalMerit: (json['TotalMerit'] as num?)?.toDouble(),
      totalSalaryByDay: (json['TotalSalaryByDay'] as num?)?.toDouble(),
      salaryOneHour: (json['SalaryOneHour'] as num?)?.toDouble(),
      otHourWD: (json['OT_Hour_WD'] as num?)?.toDouble(),
      otMoneyWD: (json['OT_Money_WD'] as num?)?.toDouble(),
      otHourWK: (json['OT_Hour_WK'] as num?)?.toDouble(),
      otMoneyWK: (json['OT_Money_WK'] as num?)?.toDouble(),
      otHourHD: (json['OT_Hour_HD'] as num?)?.toDouble(),
      otMoneyHD: (json['OT_Money_HD'] as num?)?.toDouble(),
      otTotalSalary: (json['OT_TotalSalary'] as num?)?.toDouble(),
      referenceIndustry: (json['ReferenceIndustry'] as num?)?.toDouble(),
      realIndustry: (json['RealIndustry'] as num?)?.toDouble(),
      allowanceMeal: (json['AllowanceMeal'] as num?)?.toDouble(),
      allowanceOTEarly: (json['Allowance_OT_Early'] as num?)?.toDouble(),
      totalAllowance: (json['TotalAllowance'] as num?)?.toDouble(),
      bussinessMoney: (json['BussinessMoney'] as num?)?.toDouble(),
      nightShiftMoney: (json['NightShiftMoney'] as num?)?.toDouble(),
      costVehicleBussiness: (json['CostVehicleBussiness'] as num?)?.toDouble(),
      bonus: (json['Bonus'] as num?)?.toDouble(),
      other: (json['Other'] as num?)?.toDouble(),
      totalBonus: (json['TotalBonus'] as num?)?.toDouble(),
      socialInsurance: (json['SocialInsurance'] as num?)?.toDouble(),
      insurances: (json['Insurances'] as num?)?.toDouble(),
      unionFees: (json['UnionFees'] as num?)?.toDouble(),
      advancePayment: (json['AdvancePayment'] as num?)?.toDouble(),
      departmentalFees: (json['DepartmentalFees'] as num?)?.toDouble(),
      parkingMoney: (json['ParkingMoney'] as num?)?.toDouble(),
      punish5S: (json['Punish5S'] as num?)?.toDouble(),
      otherDeduction: (json['OtherDeduction'] as num?)?.toDouble(),
      totalDeduction: (json['TotalDeduction'] as num?)?.toDouble(),
      note: json['Note'] as String?,
      isPublish: json['IsPublish'] as bool?,
      startWorking: json['StartWorking'] == null
          ? null
          : DateTime.parse(json['StartWorking'] as String),
      mealUse: (json['MealUse'] as num?)?.toInt(),
      taxSalaryOT: (json['TaxSalaryOT'] as num?)?.toDouble(),
      taxSalaryMeal: (json['TaxSalaryMeal'] as num?)?.toDouble(),
      taxSalaryPhone: (json['TaxSalaryPhone'] as num?)?.toDouble(),
      taxPersonalDeduction: (json['TaxPersonalDeduction'] as num?)?.toDouble(),
      taxDependentsDeduction:
          (json['TaxDependentsDeduction'] as num?)?.toDouble(),
      totalTaxDeduction: (json['TotalTaxDeduction'] as num?)?.toDouble(),
      taxAbleIncome: (json['TaxAbleIncome'] as num?)?.toDouble(),
      taxCompanyName: json['TaxCompanyName'] as String?,
      statusContract: json['StatusContract'] as String?,
      taxDeduction: (json['TaxDeduction'] as num?)?.toDouble(),
      stt: (json['STT'] as num?)?.toInt(),
      realSalary: (json['RealSalary'] as num?)?.toDouble(),
      actualAmountReceived: (json['ActualAmountReceived'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$SalaryPayrollItemImplToJson(
        _$SalaryPayrollItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Sign': instance.sign,
      'PayrollID': instance.payrollId,
      'EmployeeID': instance.employeeId,
      'Code': instance.code,
      'FullName': instance.fullName,
      'DepartmentSTT': instance.departmentSTT,
      'DepartmentName': instance.departmentName,
      'PriorityOrder': instance.priorityOrder,
      'PositionName': instance.positionName,
      'BasicSalary': instance.basicSalary,
      'TotalWorkday': instance.totalWorkday,
      'TotalMerit': instance.totalMerit,
      'TotalSalaryByDay': instance.totalSalaryByDay,
      'SalaryOneHour': instance.salaryOneHour,
      'OT_Hour_WD': instance.otHourWD,
      'OT_Money_WD': instance.otMoneyWD,
      'OT_Hour_WK': instance.otHourWK,
      'OT_Money_WK': instance.otMoneyWK,
      'OT_Hour_HD': instance.otHourHD,
      'OT_Money_HD': instance.otMoneyHD,
      'OT_TotalSalary': instance.otTotalSalary,
      'ReferenceIndustry': instance.referenceIndustry,
      'RealIndustry': instance.realIndustry,
      'AllowanceMeal': instance.allowanceMeal,
      'Allowance_OT_Early': instance.allowanceOTEarly,
      'TotalAllowance': instance.totalAllowance,
      'BussinessMoney': instance.bussinessMoney,
      'NightShiftMoney': instance.nightShiftMoney,
      'CostVehicleBussiness': instance.costVehicleBussiness,
      'Bonus': instance.bonus,
      'Other': instance.other,
      'TotalBonus': instance.totalBonus,
      'SocialInsurance': instance.socialInsurance,
      'Insurances': instance.insurances,
      'UnionFees': instance.unionFees,
      'AdvancePayment': instance.advancePayment,
      'DepartmentalFees': instance.departmentalFees,
      'ParkingMoney': instance.parkingMoney,
      'Punish5S': instance.punish5S,
      'OtherDeduction': instance.otherDeduction,
      'TotalDeduction': instance.totalDeduction,
      'Note': instance.note,
      'IsPublish': instance.isPublish,
      'StartWorking': instance.startWorking?.toIso8601String(),
      'MealUse': instance.mealUse,
      'TaxSalaryOT': instance.taxSalaryOT,
      'TaxSalaryMeal': instance.taxSalaryMeal,
      'TaxSalaryPhone': instance.taxSalaryPhone,
      'TaxPersonalDeduction': instance.taxPersonalDeduction,
      'TaxDependentsDeduction': instance.taxDependentsDeduction,
      'TotalTaxDeduction': instance.totalTaxDeduction,
      'TaxAbleIncome': instance.taxAbleIncome,
      'TaxCompanyName': instance.taxCompanyName,
      'StatusContract': instance.statusContract,
      'TaxDeduction': instance.taxDeduction,
      'STT': instance.stt,
      'RealSalary': instance.realSalary,
      'ActualAmountReceived': instance.actualAmountReceived,
    };

_$TimekeepingDayItemImpl _$$TimekeepingDayItemImplFromJson(
        Map<String, dynamic> json) =>
    _$TimekeepingDayItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      date:
          json['Date'] == null ? null : DateTime.parse(json['Date'] as String),
      dayOfWeek: (json['DayOfWeek'] as num?)?.toInt(),
      status: (json['Status'] as num?)?.toInt(),
      statusText: json['StatusText'] as String?,
      checkIn: json['CheckIn'] as String?,
      checkOut: json['CheckOut'] as String?,
      workHours: (json['WorkHours'] as num?)?.toDouble(),
      overtimeHours: (json['OvertimeHours'] as num?)?.toDouble(),
      isLate: json['IsLate'] as bool?,
      isEarlyLeave: json['IsEarlyLeave'] as bool?,
      note: json['Note'] as String?,
    );

Map<String, dynamic> _$$TimekeepingDayItemImplToJson(
        _$TimekeepingDayItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'EmployeeID': instance.employeeId,
      'Date': instance.date?.toIso8601String(),
      'DayOfWeek': instance.dayOfWeek,
      'Status': instance.status,
      'StatusText': instance.statusText,
      'CheckIn': instance.checkIn,
      'CheckOut': instance.checkOut,
      'WorkHours': instance.workHours,
      'OvertimeHours': instance.overtimeHours,
      'IsLate': instance.isLate,
      'IsEarlyLeave': instance.isEarlyLeave,
      'Note': instance.note,
    };
