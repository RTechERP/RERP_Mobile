// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_requirement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkRequirementItemImpl _$$WorkRequirementItemImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkRequirementItemImpl(
      rowIndex: (json['RowIndex'] as num?)?.toInt(),
      id: (json['ID'] as num?)?.toInt(),
      numberRequest: json['NumberRequest'] as String?,
      dateRequest: json['DateRequest'] == null
          ? null
          : DateTime.parse(json['DateRequest'] as String),
      deadlineRequest: json['DeadlineRequest'] == null
          ? null
          : DateTime.parse(json['DeadlineRequest'] as String),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      coordinationDepartmentID:
          (json['CoordinationDepartmentID'] as num?)?.toInt(),
      requiredDepartmentID: (json['RequiredDepartmentID'] as num?)?.toInt(),
      isApprovedTBP: json['IsApprovedTBP'] as bool?,
      dateApprovedTBP: json['DateApprovedTBP'] == null
          ? null
          : DateTime.parse(json['DateApprovedTBP'] as String),
      approvedTBPID: (json['ApprovedTBPID'] as num?)?.toInt(),
      isApprovedHR: json['IsApprovedHR'] as bool?,
      dateApprovedHR: json['DateApprovedHR'] == null
          ? null
          : DateTime.parse(json['DateApprovedHR'] as String),
      approvedHRID: (json['ApprovedHRID'] as num?)?.toInt(),
      isApprovedBGD: json['IsApprovedBGD'] as bool?,
      dateApprovedBGD: json['DateApprovedBGD'] == null
          ? null
          : DateTime.parse(json['DateApprovedBGD'] as String),
      approvedBGDID: (json['ApprovedBGDID'] as num?)?.toInt(),
      evaluateCompletion: json['EvaluateCompletion'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      isRequestBuy: json['IsRequestBuy'] as bool?,
      status: (json['Status'] as num?)?.toInt(),
      isRequestBGDApproved: json['IsRequestBGDApproved'] as bool?,
      coordinationDepartment: json['CoordinationDepartment'] as String?,
      requiredDepartment: json['RequiredDepartment'] as String?,
      employeeName: json['EmployeeName'] as String?,
      employeeDepartment: json['EmployeeDepartment'] as String?,
      step: (json['Step'] as num?)?.toInt(),
      stepApproved: (json['StepApproved'] as num?)?.toInt(),
      isApproved: (json['IsApproved'] as num?)?.toInt(),
      isApprovedText: json['IsApprovedText'] as String?,
      statusText: json['StatusText'] as String?,
      note: json['Note'] as String?,
      fullNameApprovedTBP: json['FullNameApprovedTBP'] as String?,
      reasonCancel: json['ReasonCancel'] as String?,
      isRequestPriceQuote: json['IsRequestPriceQuote'] as bool?,
      departmentID: (json['DepartmentID'] as num?)?.toInt(),
      chucVuHDID: (json['ChucVuHDID'] as num?)?.toInt(),
      chucVu: json['ChucVu'] as String?,
    );

Map<String, dynamic> _$$WorkRequirementItemImplToJson(
        _$WorkRequirementItemImpl instance) =>
    <String, dynamic>{
      'RowIndex': instance.rowIndex,
      'ID': instance.id,
      'NumberRequest': instance.numberRequest,
      'DateRequest': instance.dateRequest?.toIso8601String(),
      'DeadlineRequest': instance.deadlineRequest?.toIso8601String(),
      'EmployeeID': instance.employeeId,
      'CoordinationDepartmentID': instance.coordinationDepartmentID,
      'RequiredDepartmentID': instance.requiredDepartmentID,
      'IsApprovedTBP': instance.isApprovedTBP,
      'DateApprovedTBP': instance.dateApprovedTBP?.toIso8601String(),
      'ApprovedTBPID': instance.approvedTBPID,
      'IsApprovedHR': instance.isApprovedHR,
      'DateApprovedHR': instance.dateApprovedHR?.toIso8601String(),
      'ApprovedHRID': instance.approvedHRID,
      'IsApprovedBGD': instance.isApprovedBGD,
      'DateApprovedBGD': instance.dateApprovedBGD?.toIso8601String(),
      'ApprovedBGDID': instance.approvedBGDID,
      'EvaluateCompletion': instance.evaluateCompletion,
      'IsDeleted': instance.isDeleted,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'IsRequestBuy': instance.isRequestBuy,
      'Status': instance.status,
      'IsRequestBGDApproved': instance.isRequestBGDApproved,
      'CoordinationDepartment': instance.coordinationDepartment,
      'RequiredDepartment': instance.requiredDepartment,
      'EmployeeName': instance.employeeName,
      'EmployeeDepartment': instance.employeeDepartment,
      'Step': instance.step,
      'StepApproved': instance.stepApproved,
      'IsApproved': instance.isApproved,
      'IsApprovedText': instance.isApprovedText,
      'StatusText': instance.statusText,
      'Note': instance.note,
      'FullNameApprovedTBP': instance.fullNameApprovedTBP,
      'ReasonCancel': instance.reasonCancel,
      'IsRequestPriceQuote': instance.isRequestPriceQuote,
      'DepartmentID': instance.departmentID,
      'ChucVuHDID': instance.chucVuHDID,
      'ChucVu': instance.chucVu,
    };
