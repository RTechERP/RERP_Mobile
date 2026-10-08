// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_in_out_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SummaryInOutItemImpl _$$SummaryInOutItemImplFromJson(
        Map<String, dynamic> json) =>
    _$SummaryInOutItemImpl(
      id: (json['ID'] as num).toInt(),
      totalPage: (json['TotalPage'] as num?)?.toInt(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      approvedID: (json['ApprovedID'] as num?)?.toInt(),
      isApprovedTP: json['IsApprovedTP'] as bool?,
      isApproved: json['IsApproved'] as bool?,
      dateRegister: json['DateRegister'] as String?,
      timeRegister: (json['TimeRegister'] as num?)?.toDouble(),
      unit: json['Unit'] as String?,
      type: (json['Type'] as num?)?.toInt(),
      reason: json['Reason'] as String?,
      typeText: json['TypeText'] as String?,
      rowNum: (json['RowNum'] as num?)?.toInt(),
      fullName: json['FullName'] as String?,
      code: json['Code'] as String?,
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      departmentName: json['DepartmentName'] as String?,
    );

Map<String, dynamic> _$$SummaryInOutItemImplToJson(
        _$SummaryInOutItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'TotalPage': instance.totalPage,
      'EmployeeID': instance.employeeId,
      'ApprovedID': instance.approvedID,
      'IsApprovedTP': instance.isApprovedTP,
      'IsApproved': instance.isApproved,
      'DateRegister': instance.dateRegister,
      'TimeRegister': instance.timeRegister,
      'Unit': instance.unit,
      'Type': instance.type,
      'Reason': instance.reason,
      'TypeText': instance.typeText,
      'RowNum': instance.rowNum,
      'FullName': instance.fullName,
      'Code': instance.code,
      'DepartmentID': instance.departmentId,
      'DepartmentName': instance.departmentName,
    };

_$SummaryInOutDepartmentImpl _$$SummaryInOutDepartmentImplFromJson(
        Map<String, dynamic> json) =>
    _$SummaryInOutDepartmentImpl(
      id: (json['ID'] as num).toInt(),
      code: json['Code'] as String?,
      name: json['Name'] as String?,
      description: json['Description'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] as String?,
      status: (json['Status'] as num?)?.toInt(),
      email: json['Email'] as String?,
      headOfDepartment: (json['HeadofDepartment'] as num?)?.toInt(),
      isShowHotline: json['IsShowHotline'] as bool?,
      pId: json['PId'] as String?,
      stt: (json['STT'] as num?)?.toInt(),
      isDeleted: json['IsDeleted'] as bool?,
      parentID: (json['ParentID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SummaryInOutDepartmentImplToJson(
        _$SummaryInOutDepartmentImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'Name': instance.name,
      'Description': instance.description,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate,
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate,
      'Status': instance.status,
      'Email': instance.email,
      'HeadofDepartment': instance.headOfDepartment,
      'IsShowHotline': instance.isShowHotline,
      'PId': instance.pId,
      'STT': instance.stt,
      'IsDeleted': instance.isDeleted,
      'ParentID': instance.parentID,
    };
