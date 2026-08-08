// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salary_calendar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalaryCalendarItemImpl _$$SalaryCalendarItemImplFromJson(
        Map<String, dynamic> json) =>
    _$SalaryCalendarItemImpl(
      holidays: (json['holidays'] as List<dynamic>?)
          ?.map((e) => SalaryHolidayItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      scheduleWorkSaturdays: (json['scheduleWorkSaturdays'] as List<dynamic>?)
          ?.map(
              (e) => SalaryWorkSaturdayItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SalaryCalendarItemImplToJson(
        _$SalaryCalendarItemImpl instance) =>
    <String, dynamic>{
      'holidays': instance.holidays,
      'scheduleWorkSaturdays': instance.scheduleWorkSaturdays,
    };

_$SalaryHolidayItemImpl _$$SalaryHolidayItemImplFromJson(
        Map<String, dynamic> json) =>
    _$SalaryHolidayItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      holidayDate: json['HolidayDate'] == null
          ? null
          : DateTime.parse(json['HolidayDate'] as String),
      holidayYear: (json['HolidayYear'] as num?)?.toInt(),
      holidayMonth: (json['HolidayMonth'] as num?)?.toInt(),
      holidayDay: (json['HolidayDay'] as num?)?.toInt(),
      dayValue: json['DayValue'] as String?,
      holidayName: json['HolidayName'] as String?,
      holidayCode: json['HolidayCode'] as String?,
      note: json['Note'] as String?,
      typeHoliday: (json['TypeHoliday'] as num?)?.toInt(),
      typeHolidayText: json['TypeHolidayText'] as String?,
    );

Map<String, dynamic> _$$SalaryHolidayItemImplToJson(
        _$SalaryHolidayItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'HolidayDate': instance.holidayDate?.toIso8601String(),
      'HolidayYear': instance.holidayYear,
      'HolidayMonth': instance.holidayMonth,
      'HolidayDay': instance.holidayDay,
      'DayValue': instance.dayValue,
      'HolidayName': instance.holidayName,
      'HolidayCode': instance.holidayCode,
      'Note': instance.note,
      'TypeHoliday': instance.typeHoliday,
      'TypeHolidayText': instance.typeHolidayText,
    };

_$SalaryWorkSaturdayItemImpl _$$SalaryWorkSaturdayItemImplFromJson(
        Map<String, dynamic> json) =>
    _$SalaryWorkSaturdayItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      dateValue: json['DateValue'] == null
          ? null
          : DateTime.parse(json['DateValue'] as String),
      status: json['Status'] as bool?,
      workDay: (json['WorkDay'] as num?)?.toInt(),
      workMonth: (json['WorkMonth'] as num?)?.toInt(),
      workYear: (json['WorkYear'] as num?)?.toInt(),
      isApproved: json['IsApproved'] as bool?,
      approver: (json['Approver'] as num?)?.toInt(),
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
    );

Map<String, dynamic> _$$SalaryWorkSaturdayItemImplToJson(
        _$SalaryWorkSaturdayItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'DateValue': instance.dateValue?.toIso8601String(),
      'Status': instance.status,
      'WorkDay': instance.workDay,
      'WorkMonth': instance.workMonth,
      'WorkYear': instance.workYear,
      'IsApproved': instance.isApproved,
      'Approver': instance.approver,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedBy': instance.updatedBy,
    };
