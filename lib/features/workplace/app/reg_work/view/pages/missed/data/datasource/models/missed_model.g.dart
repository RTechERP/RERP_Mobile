// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'missed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MissedItemImpl _$$MissedItemImplFromJson(Map<String, dynamic> json) =>
    _$MissedItemImpl(
      id: (json['ID'] as num).toInt(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      approvedTP: (json['ApprovedTP'] as num?)?.toInt(),
      dayWork: json['DayWork'] == null
          ? null
          : DateTime.parse(json['DayWork'] as String),
      isApprovedTP: json['IsApprovedTP'] as bool?,
      note: json['Note'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      approvedHR: (json['ApprovedHR'] as num?)?.toInt(),
      isApprovedHR: json['IsApprovedHR'] as bool?,
      type: (json['Type'] as num?)?.toInt(),
      decilineApprove: (json['DecilineApprove'] as num?)?.toInt(),
      reasonDeciline: json['ReasonDeciline'] as String?,
      reasonHREdit: json['ReasonHREdit'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
      isSeniorApproved: (json['IsSeniorApproved'] as num?)?.toInt(),
      approvedSeniorID: (json['ApprovedSeniorID'] as num?)?.toInt(),
      dateApprovedSenior: json['DateApprovedSenior'] == null
          ? null
          : DateTime.parse(json['DateApprovedSenior'] as String),
      decilineApproveSenior: (json['DecilineApproveSenior'] as num?)?.toInt(),
      reasonDecilineSenior: json['ReasonDecilineSenior'] as String?,
      code: json['Code'] as String?,
      fullName: json['FullName'] as String?,
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      departmentName: json['DepartmentName'] as String?,
      rowNumber: (json['RowNumber'] as num?)?.toInt(),
      approvedName: json['ApprovedName'] as String?,
      statusNumber: (json['StatusNumber'] as num?)?.toInt(),
      statusHRNumber: (json['StatusHRNumber'] as num?)?.toInt(),
      typeText: json['TypeText'] as String?,
      statusText: json['StatusText'] as String?,
      statusHRText: json['StatusHRText'] as String?,
    );

Map<String, dynamic> _$$MissedItemImplToJson(_$MissedItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'EmployeeID': instance.employeeId,
      'ApprovedTP': instance.approvedTP,
      'DayWork': instance.dayWork?.toIso8601String(),
      'IsApprovedTP': instance.isApprovedTP,
      'Note': instance.note,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'ApprovedHR': instance.approvedHR,
      'IsApprovedHR': instance.isApprovedHR,
      'Type': instance.type,
      'DecilineApprove': instance.decilineApprove,
      'ReasonDeciline': instance.reasonDeciline,
      'ReasonHREdit': instance.reasonHREdit,
      'IsDeleted': instance.isDeleted,
      'IsSeniorApproved': instance.isSeniorApproved,
      'ApprovedSeniorID': instance.approvedSeniorID,
      'DateApprovedSenior': instance.dateApprovedSenior?.toIso8601String(),
      'DecilineApproveSenior': instance.decilineApproveSenior,
      'ReasonDecilineSenior': instance.reasonDecilineSenior,
      'Code': instance.code,
      'FullName': instance.fullName,
      'DepartmentID': instance.departmentId,
      'DepartmentName': instance.departmentName,
      'RowNumber': instance.rowNumber,
      'ApprovedName': instance.approvedName,
      'StatusNumber': instance.statusNumber,
      'StatusHRNumber': instance.statusHRNumber,
      'TypeText': instance.typeText,
      'StatusText': instance.statusText,
      'StatusHRText': instance.statusHRText,
    };

_$ApproverItemImpl _$$ApproverItemImplFromJson(Map<String, dynamic> json) =>
    _$ApproverItemImpl(
      id: (json['ID'] as num).toInt(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      fullName: json['FullName'] as String?,
      type: (json['Type'] as num?)?.toInt(),
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      usersId: (json['UsersID'] as num?)?.toInt(),
      isPassed: json['IsPassed'] as bool?,
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$ApproverItemImplToJson(_$ApproverItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'EmployeeID': instance.employeeId,
      'Code': instance.code,
      'FullName': instance.fullName,
      'Type': instance.type,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UsersID': instance.usersId,
      'IsPassed': instance.isPassed,
      'IsDeleted': instance.isDeleted,
    };
