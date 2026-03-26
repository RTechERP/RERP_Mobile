// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_out_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InOutItemImpl _$$InOutItemImplFromJson(Map<String, dynamic> json) =>
    _$InOutItemImpl(
      id: (json['ID'] as num).toInt(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      approvedId: (json['ApprovedID'] as num?)?.toInt(),
      isApproved: json['IsApproved'] as bool?,
      dateRegister: json['DateRegister'] == null
          ? null
          : DateTime.parse(json['DateRegister'] as String),
      unit: json['Unit'] as String?,
      type: (json['Type'] as num?)?.toInt(),
      reason: json['Reason'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      approvedTP: (json['ApprovedTP'] as num?)?.toInt(),
      isApprovedTP: json['IsApprovedTP'] as bool?,
      decilineApprove: json['DecilineApprove'] as String?,
      dateStart: json['DateStart'] == null
          ? null
          : DateTime.parse(json['DateStart'] as String),
      dateEnd: json['DateEnd'] == null
          ? null
          : DateTime.parse(json['DateEnd'] as String),
      reasonDeciline: json['ReasonDeciline'] as String?,
      reasonHREdit: json['ReasonHREdit'] as String?,
      isProblem: json['IsProblem'] as bool?,
      typeText: json['TypeText'] as String?,
      rowNum: (json['RowNum'] as num?)?.toInt(),
      fullName: json['FullName'] as String?,
      code: json['Code'] as String?,
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      departmentName: json['DepartmentName'] as String?,
      approvedName: json['ApprovedName'] as String?,
      statusNumber: (json['StatusNumber'] as num?)?.toInt(),
      statusHRNumber: (json['StatusHRNumber'] as num?)?.toInt(),
      timeRegister: (json['TimeRegister'] as num?)?.toInt(),
      isSeniorApprovedText: json['IsSeniorApprovedText'] as String?,
      approvedSeniorName: json['ApprovedSđreniorName'] as String?,
      fileName: json['FileName'] as String?,
      filePath: json['FilePath'] as String?,
      checkIn: json['CheckIn'] == null
          ? null
          : DateTime.parse(json['CheckIn'] as String),
      checkOut: json['CheckOut'] == null
          ? null
          : DateTime.parse(json['CheckOut'] as String),
      isNotValid: (json['IsNotValid'] as num?)?.toInt(),
      statusText: json['StatusText'] as String?,
      statusHRText: json['StatusHRText'] as String?,
      totalPage: (json['TotalPage'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$InOutItemImplToJson(_$InOutItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'EmployeeID': instance.employeeId,
      'ApprovedID': instance.approvedId,
      'IsApproved': instance.isApproved,
      'DateRegister': instance.dateRegister?.toIso8601String(),
      'Unit': instance.unit,
      'Type': instance.type,
      'Reason': instance.reason,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'ApprovedTP': instance.approvedTP,
      'IsApprovedTP': instance.isApprovedTP,
      'DecilineApprove': instance.decilineApprove,
      'DateStart': instance.dateStart?.toIso8601String(),
      'DateEnd': instance.dateEnd?.toIso8601String(),
      'ReasonDeciline': instance.reasonDeciline,
      'ReasonHREdit': instance.reasonHREdit,
      'IsProblem': instance.isProblem,
      'TypeText': instance.typeText,
      'RowNum': instance.rowNum,
      'FullName': instance.fullName,
      'Code': instance.code,
      'DepartmentID': instance.departmentId,
      'DepartmentName': instance.departmentName,
      'ApprovedName': instance.approvedName,
      'StatusNumber': instance.statusNumber,
      'StatusHRNumber': instance.statusHRNumber,
      'TimeRegister': instance.timeRegister,
      'IsSeniorApprovedText': instance.isSeniorApprovedText,
      'ApprovedSđreniorName': instance.approvedSeniorName,
      'FileName': instance.fileName,
      'FilePath': instance.filePath,
      'CheckIn': instance.checkIn?.toIso8601String(),
      'CheckOut': instance.checkOut?.toIso8601String(),
      'IsNotValid': instance.isNotValid,
      'StatusText': instance.statusText,
      'StatusHRText': instance.statusHRText,
      'TotalPage': instance.totalPage,
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
