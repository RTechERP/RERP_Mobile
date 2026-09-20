// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_missed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SummaryMissedItemImpl _$$SummaryMissedItemImplFromJson(
        Map<String, dynamic> json) =>
    _$SummaryMissedItemImpl(
      id: (json['ID'] as num).toInt(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      approvedTP: (json['ApprovedTP'] as num?)?.toInt(),
      dayWork: json['DayWork'] as String?,
      isApprovedTP: json['IsApprovedTP'] as bool?,
      note: json['Note'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] as String?,
      approvedHR: (json['ApprovedHR'] as num?)?.toInt(),
      isApprovedHR: json['IsApprovedHR'] as bool?,
      type: (json['Type'] as num?)?.toInt(),
      decilineApprove: (json['DecilineApprove'] as num?)?.toInt(),
      reasonDeciline: json['ReasonDeciline'] as String?,
      reasonHREdit: json['ReasonHREdit'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
      isSeniorApproved: (json['IsSeniorApproved'] as num?)?.toInt(),
      approvedSeniorID: (json['ApprovedSeniorID'] as num?)?.toInt(),
      dateApprovedSenior: json['DateApprovedSenior'] as String?,
      reasonDecilineSenior: json['ReasonDecilineSenior'] as String?,
      decilineApproveSenior: (json['DecilineApproveSenior'] as num?)?.toInt(),
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

Map<String, dynamic> _$$SummaryMissedItemImplToJson(
        _$SummaryMissedItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'EmployeeID': instance.employeeId,
      'ApprovedTP': instance.approvedTP,
      'DayWork': instance.dayWork,
      'IsApprovedTP': instance.isApprovedTP,
      'Note': instance.note,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate,
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate,
      'ApprovedHR': instance.approvedHR,
      'IsApprovedHR': instance.isApprovedHR,
      'Type': instance.type,
      'DecilineApprove': instance.decilineApprove,
      'ReasonDeciline': instance.reasonDeciline,
      'ReasonHREdit': instance.reasonHREdit,
      'IsDeleted': instance.isDeleted,
      'IsSeniorApproved': instance.isSeniorApproved,
      'ApprovedSeniorID': instance.approvedSeniorID,
      'DateApprovedSenior': instance.dateApprovedSenior,
      'ReasonDecilineSenior': instance.reasonDecilineSenior,
      'DecilineApproveSenior': instance.decilineApproveSenior,
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

_$SummaryMissedDepartmentImpl _$$SummaryMissedDepartmentImplFromJson(
        Map<String, dynamic> json) =>
    _$SummaryMissedDepartmentImpl(
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

Map<String, dynamic> _$$SummaryMissedDepartmentImplToJson(
        _$SummaryMissedDepartmentImpl instance) =>
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
