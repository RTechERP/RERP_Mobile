// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timekeeping_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimekeepingItemImpl _$$TimekeepingItemImplFromJson(
        Map<String, dynamic> json) =>
    _$TimekeepingItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      employeeName: json['EmployeeName'] as String?,
      employeeCode: json['EmployeeCode'] as String?,
      departmentName: json['DepartmentName'] as String?,
      month: (json['Month'] as num?)?.toInt(),
      year: (json['Year'] as num?)?.toInt(),
      workDays: (json['WorkDays'] as num?)?.toDouble(),
      holidayDays: (json['HolidayDays'] as num?)?.toDouble(),
      tetDays: (json['TetDays'] as num?)?.toDouble(),
      leaveDays: (json['LeaveDays'] as num?)?.toDouble(),
      privateDays: (json['PrivateDays'] as num?)?.toDouble(),
      wfhDays: (json['WfhDays'] as num?)?.toDouble(),
      unpaidLeaveDays: (json['UnpaidLeaveDays'] as num?)?.toDouble(),
      totalWorkDays: (json['TotalWorkDays'] as num?)?.toDouble(),
      paidWorkDays: (json['PaidWorkDays'] as num?)?.toDouble(),
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
    );

Map<String, dynamic> _$$TimekeepingItemImplToJson(
        _$TimekeepingItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'EmployeeID': instance.employeeId,
      'EmployeeName': instance.employeeName,
      'EmployeeCode': instance.employeeCode,
      'DepartmentName': instance.departmentName,
      'Month': instance.month,
      'Year': instance.year,
      'WorkDays': instance.workDays,
      'HolidayDays': instance.holidayDays,
      'TetDays': instance.tetDays,
      'LeaveDays': instance.leaveDays,
      'PrivateDays': instance.privateDays,
      'WfhDays': instance.wfhDays,
      'UnpaidLeaveDays': instance.unpaidLeaveDays,
      'TotalWorkDays': instance.totalWorkDays,
      'PaidWorkDays': instance.paidWorkDays,
      'CreatedDate': instance.createdDate?.toIso8601String(),
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

_$TimekeepingSummaryImpl _$$TimekeepingSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$TimekeepingSummaryImpl(
      actualWorkDays: (json['ActualWorkDays'] as num?)?.toDouble(),
      holidayDays: (json['HolidayDays'] as num?)?.toDouble(),
      tetDays: (json['TetDays'] as num?)?.toDouble(),
      leaveDays: (json['LeaveDays'] as num?)?.toDouble(),
      privatePaidDays: (json['PrivatePaidDays'] as num?)?.toDouble(),
      wfhDays: (json['WfhDays'] as num?)?.toDouble(),
      paidWorkDays: (json['PaidWorkDays'] as num?)?.toDouble(),
      unpaidLeaveDays: (json['UnpaidLeaveDays'] as num?)?.toDouble(),
      totalDays: (json['TotalDays'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$TimekeepingSummaryImplToJson(
        _$TimekeepingSummaryImpl instance) =>
    <String, dynamic>{
      'ActualWorkDays': instance.actualWorkDays,
      'HolidayDays': instance.holidayDays,
      'TetDays': instance.tetDays,
      'LeaveDays': instance.leaveDays,
      'PrivatePaidDays': instance.privatePaidDays,
      'WfhDays': instance.wfhDays,
      'PaidWorkDays': instance.paidWorkDays,
      'UnpaidLeaveDays': instance.unpaidLeaveDays,
      'TotalDays': instance.totalDays,
    };
