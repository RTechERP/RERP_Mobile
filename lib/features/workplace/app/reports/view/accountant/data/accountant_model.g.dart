// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accountant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountantItemImpl _$$AccountantItemImplFromJson(Map<String, dynamic> json) =>
    _$AccountantItemImpl(
      id: (json['id'] as num).toInt(),
      employeeId: (json['EmployeeID'] as num).toInt(),
      reportDate: json['ReportDate'] as String,
      content: json['Content'] as String,
      result: json['Result'] as String,
      nextPlan: json['NextPlan'] as String?,
      pendingIssues: json['PendingIssues'] as String?,
      urgent: json['Urgent'] as String?,
      mistakeOrViolation: json['MistakeOrViolation'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] as String?,
      isDeleted: json['IsDeleted'] as bool? ?? false,
      fullName: json['FullName'] as String?,
      chucVu: json['ChucVu'] as String?,
      rowNum: (json['RowNum'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AccountantItemImplToJson(
        _$AccountantItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'EmployeeID': instance.employeeId,
      'ReportDate': instance.reportDate,
      'Content': instance.content,
      'Result': instance.result,
      'NextPlan': instance.nextPlan,
      'PendingIssues': instance.pendingIssues,
      'Urgent': instance.urgent,
      'MistakeOrViolation': instance.mistakeOrViolation,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate,
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate,
      'IsDeleted': instance.isDeleted,
      'FullName': instance.fullName,
      'ChucVu': instance.chucVu,
      'RowNum': instance.rowNum,
    };
