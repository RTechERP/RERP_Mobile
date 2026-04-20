// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wfh_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WfhItemImpl _$$WfhItemImplFromJson(Map<String, dynamic> json) =>
    _$WfhItemImpl(
      id: (json['ID'] as num).toInt(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      approvedId: (json['ApprovedID'] as num?)?.toInt(),
      isApproved: json['IsApproved'] as bool?,
      reason: json['Reason'] as String?,
      dateWFH: json['DateWFH'] == null
          ? null
          : DateTime.parse(json['DateWFH'] as String),
      timeWFH: (json['TimeWFH'] as num?)?.toInt(),
      note: json['Note'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      totalDay: (json['TotalDay'] as num?)?.toDouble(),
      approvedHR: (json['ApprovedHR'] as num?)?.toInt(),
      isApprovedHR: json['IsApprovedHR'] as bool?,
      decilineApprove: (json['DecilineApprove'] as num?)?.toInt(),
      reasonDeciline: json['ReasonDeciline'] as String?,
      reasonHREdit: json['ReasonHREdit'] as String?,
      isProblem: json['IsProblem'] as bool?,
      contentWork: json['ContentWork'] as String?,
      isApprovedBGD: json['IsApprovedBGD'] as bool?,
      approvedBGDID: (json['ApprovedBGDID'] as num?)?.toInt(),
      dateApprovedBGD: json['DateApprovedBGD'] == null
          ? null
          : DateTime.parse(json['DateApprovedBGD'] as String),
      evaluateResults: json['EvaluateResults'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
      isSeniorApproved: (json['IsSeniorApproved'] as num?)?.toInt(),
      approvedSeniorID: (json['ApprovedSeniorID'] as num?)?.toInt(),
      dateApprovedSenior: json['DateApprovedSenior'] == null
          ? null
          : DateTime.parse(json['DateApprovedSenior'] as String),
      decilineApproveSenior: (json['DecilineApproveSenior'] as num?)?.toInt(),
      reasonDecilineSenior: json['ReasonDecilineSenior'] as String?,
      rowNumber: (json['RowNumber'] as num?)?.toInt(),
      creatDay: json['CreatDay'] == null
          ? null
          : DateTime.parse(json['CreatDay'] as String),
      employeeName: json['EmployeeName'] as String?,
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      approvedName: json['ApprovedName'] as String?,
      departmentName: json['DepartmentName'] as String?,
      timeWFHText: json['TimeWFHText'] as String?,
      statusNumber: (json['StatusNumber'] as num?)?.toInt(),
      statusHRNumber: (json['StatusHRNumber'] as num?)?.toInt(),
      fullNameBGD: json['FullNameBGD'] as String?,
      statusText: json['StatusText'] as String?,
      statusHRText: json['StatusHRText'] as String?,
      isApprovedBGDText: json['IsApprovedBGDText'] as String?,
    );

Map<String, dynamic> _$$WfhItemImplToJson(_$WfhItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'EmployeeID': instance.employeeId,
      'ApprovedID': instance.approvedId,
      'IsApproved': instance.isApproved,
      'Reason': instance.reason,
      'DateWFH': instance.dateWFH?.toIso8601String(),
      'TimeWFH': instance.timeWFH,
      'Note': instance.note,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'TotalDay': instance.totalDay,
      'ApprovedHR': instance.approvedHR,
      'IsApprovedHR': instance.isApprovedHR,
      'DecilineApprove': instance.decilineApprove,
      'ReasonDeciline': instance.reasonDeciline,
      'ReasonHREdit': instance.reasonHREdit,
      'IsProblem': instance.isProblem,
      'ContentWork': instance.contentWork,
      'IsApprovedBGD': instance.isApprovedBGD,
      'ApprovedBGDID': instance.approvedBGDID,
      'DateApprovedBGD': instance.dateApprovedBGD?.toIso8601String(),
      'EvaluateResults': instance.evaluateResults,
      'IsDeleted': instance.isDeleted,
      'IsSeniorApproved': instance.isSeniorApproved,
      'ApprovedSeniorID': instance.approvedSeniorID,
      'DateApprovedSenior': instance.dateApprovedSenior?.toIso8601String(),
      'DecilineApproveSenior': instance.decilineApproveSenior,
      'ReasonDecilineSenior': instance.reasonDecilineSenior,
      'RowNumber': instance.rowNumber,
      'CreatDay': instance.creatDay?.toIso8601String(),
      'EmployeeName': instance.employeeName,
      'DepartmentID': instance.departmentId,
      'ApprovedName': instance.approvedName,
      'DepartmentName': instance.departmentName,
      'TimeWFHText': instance.timeWFHText,
      'StatusNumber': instance.statusNumber,
      'StatusHRNumber': instance.statusHRNumber,
      'FullNameBGD': instance.fullNameBGD,
      'StatusText': instance.statusText,
      'StatusHRText': instance.statusHRText,
      'IsApprovedBGDText': instance.isApprovedBGDText,
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

_$FillApproverItemImpl _$$FillApproverItemImplFromJson(
        Map<String, dynamic> json) =>
    _$FillApproverItemImpl(
      approveId: (json['ApproveID'] as num).toInt(),
    );

Map<String, dynamic> _$$FillApproverItemImplToJson(
        _$FillApproverItemImpl instance) =>
    <String, dynamic>{
      'ApproveID': instance.approveId,
    };
