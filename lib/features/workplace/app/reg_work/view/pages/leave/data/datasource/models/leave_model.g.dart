// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeaveItemImpl _$$LeaveItemImplFromJson(Map<String, dynamic> json) =>
    _$LeaveItemImpl(
      id: (json['ID'] as num).toInt(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      approvedTP: (json['ApprovedTP'] as num?)?.toInt(),
      approvedHR: (json['ApprovedHR'] as num?)?.toInt(),
      timeOnLeave: (json['TimeOnLeave'] as num?)?.toInt(),
      startDate: json['StartDate'] == null
          ? null
          : DateTime.parse(json['StartDate'] as String),
      endDate: json['EndDate'] == null
          ? null
          : DateTime.parse(json['EndDate'] as String),
      totalTime: (json['TotalTime'] as num?)?.toDouble(),
      type: (json['Type'] as num?)?.toInt(),
      typeIsReal: (json['TypeIsReal'] as num?)?.toInt(),
      totalDay: (json['TotalDay'] as num?)?.toDouble(),
      reason: json['Reason'] as String?,
      note: json['Note'] as String?,
      isApprovedTP: json['IsApprovedTP'] as bool?,
      isApprovedHR: json['IsApprovedHR'] as bool?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      isCancelTP: json['IsCancelTP'] as bool?,
      isCancelHR: json['IsCancelHR'] as bool?,
      isCancelRegister: json['IsCancelRegister'] as bool?,
      decilineApprove: (json['DecilineApprove'] as num?)?.toInt(),
      reasonCancel: json['ReasonCancel'] as String?,
      dateCancel: json['DateCancel'] == null
          ? null
          : DateTime.parse(json['DateCancel'] as String),
      deleteFlag: json['DeleteFlag'] as bool?,
      reasonDeciline: json['ReasonDeciline'] as String?,
      reasonHREdit: json['ReasonHREdit'] as String?,
      isProblem: json['IsProblem'] as bool?,
      isApprovedBGD: json['IsApprovedBGD'] as bool?,
      approvedBGDID: (json['ApprovedBGDID'] as num?)?.toInt(),
      dateApprovedBGD: json['DateApprovedBGD'] == null
          ? null
          : DateTime.parse(json['DateApprovedBGD'] as String),
      isSeniorApproved: (json['IsSeniorApproved'] as num?)?.toInt(),
      approvedSeniorID: (json['ApprovedSeniorID'] as num?)?.toInt(),
      dateApprovedSenior: json['DateApprovedSenior'] == null
          ? null
          : DateTime.parse(json['DateApprovedSenior'] as String),
      decilineApproveSenior: (json['DecilineApproveSenior'] as num?)?.toInt(),
      reasonDecilineSenior: json['ReasonDecilineSenior'] as String?,
      employeeOnLeavePhaseId: (json['EmployeeOnLeavePhaseID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      fullName: json['FullName'] as String?,
      idApprovedTP: (json['IDApprovedTP'] as num?)?.toInt(),
      typeText: json['TypeText'] as String?,
      timeOnLeaveText: json['TimeOnLeaveText'] as String?,
      typeHR: json['TypeHR'] as String?,
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      departmentName: json['DepartmentName'] as String?,
      rowNumber: (json['RowNumber'] as num?)?.toInt(),
      approvedName: json['ApprovedName'] as String?,
      statusNumber: (json['StatusNumber'] as num?)?.toInt(),
      statusHRNumber: (json['StatusHRNumber'] as num?)?.toInt(),
      statusText: json['StatusText'] as String?,
      statusHRText: json['StatusHRText'] as String?,
    );

Map<String, dynamic> _$$LeaveItemImplToJson(_$LeaveItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'EmployeeID': instance.employeeId,
      'ApprovedTP': instance.approvedTP,
      'ApprovedHR': instance.approvedHR,
      'TimeOnLeave': instance.timeOnLeave,
      'StartDate': instance.startDate?.toIso8601String(),
      'EndDate': instance.endDate?.toIso8601String(),
      'TotalTime': instance.totalTime,
      'Type': instance.type,
      'TypeIsReal': instance.typeIsReal,
      'TotalDay': instance.totalDay,
      'Reason': instance.reason,
      'Note': instance.note,
      'IsApprovedTP': instance.isApprovedTP,
      'IsApprovedHR': instance.isApprovedHR,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'IsCancelTP': instance.isCancelTP,
      'IsCancelHR': instance.isCancelHR,
      'IsCancelRegister': instance.isCancelRegister,
      'DecilineApprove': instance.decilineApprove,
      'ReasonCancel': instance.reasonCancel,
      'DateCancel': instance.dateCancel?.toIso8601String(),
      'DeleteFlag': instance.deleteFlag,
      'ReasonDeciline': instance.reasonDeciline,
      'ReasonHREdit': instance.reasonHREdit,
      'IsProblem': instance.isProblem,
      'IsApprovedBGD': instance.isApprovedBGD,
      'ApprovedBGDID': instance.approvedBGDID,
      'DateApprovedBGD': instance.dateApprovedBGD?.toIso8601String(),
      'IsSeniorApproved': instance.isSeniorApproved,
      'ApprovedSeniorID': instance.approvedSeniorID,
      'DateApprovedSenior': instance.dateApprovedSenior?.toIso8601String(),
      'DecilineApproveSenior': instance.decilineApproveSenior,
      'ReasonDecilineSenior': instance.reasonDecilineSenior,
      'EmployeeOnLeavePhaseID': instance.employeeOnLeavePhaseId,
      'Code': instance.code,
      'FullName': instance.fullName,
      'IDApprovedTP': instance.idApprovedTP,
      'TypeText': instance.typeText,
      'TimeOnLeaveText': instance.timeOnLeaveText,
      'TypeHR': instance.typeHR,
      'DepartmentID': instance.departmentId,
      'DepartmentName': instance.departmentName,
      'RowNumber': instance.rowNumber,
      'ApprovedName': instance.approvedName,
      'StatusNumber': instance.statusNumber,
      'StatusHRNumber': instance.statusHRNumber,
      'StatusText': instance.statusText,
      'StatusHRText': instance.statusHRText,
    };

_$LeaveTimeItemImpl _$$LeaveTimeItemImplFromJson(Map<String, dynamic> json) =>
    _$LeaveTimeItemImpl(
      fullName: json['FullName'] as String?,
      totalDay: (json['TotalToday'] as num?)?.toInt(),
      totalDayApproved: (json['TotalDayApproved'] as num?)?.toInt(),
      totalDayOnleaveActual: (json['TotalDayOnleaveActual'] as num?)?.toInt(),
      totalDayRemain: (json['TotalDayRemain'] as num?)?.toInt(),
      totalDayUnApproved: (json['TotalDayUnApproved'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$LeaveTimeItemImplToJson(_$LeaveTimeItemImpl instance) =>
    <String, dynamic>{
      'FullName': instance.fullName,
      'TotalToday': instance.totalDay,
      'TotalDayApproved': instance.totalDayApproved,
      'TotalDayOnleaveActual': instance.totalDayOnleaveActual,
      'TotalDayRemain': instance.totalDayRemain,
      'TotalDayUnApproved': instance.totalDayUnApproved,
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
