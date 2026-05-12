// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalaryItemImpl _$$SalaryItemImplFromJson(Map<String, dynamic> json) =>
    _$SalaryItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      employeeName: json['EmployeeName'] as String?,
      employeeCode: json['EmployeeCode'] as String?,
      basicSalary: (json['BasicSalary'] as num?)?.toDouble(),
      allowance: (json['Allowance'] as num?)?.toDouble(),
      deduction: (json['Deduction'] as num?)?.toDouble(),
      grossSalary: (json['GrossSalary'] as num?)?.toDouble(),
      tax: (json['Tax'] as num?)?.toDouble(),
      insurance: (json['Insurance'] as num?)?.toDouble(),
      netSalary: (json['NetSalary'] as num?)?.toDouble(),
      month: (json['Month'] as num?)?.toInt(),
      year: (json['Year'] as num?)?.toInt(),
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
    );

Map<String, dynamic> _$$SalaryItemImplToJson(_$SalaryItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'EmployeeID': instance.employeeId,
      'EmployeeName': instance.employeeName,
      'EmployeeCode': instance.employeeCode,
      'BasicSalary': instance.basicSalary,
      'Allowance': instance.allowance,
      'Deduction': instance.deduction,
      'GrossSalary': instance.grossSalary,
      'Tax': instance.tax,
      'Insurance': instance.insurance,
      'NetSalary': instance.netSalary,
      'Month': instance.month,
      'Year': instance.year,
      'CreatedDate': instance.createdDate?.toIso8601String(),
    };
