// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overtime_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OvertimeItemImpl _$$OvertimeItemImplFromJson(Map<String, dynamic> json) =>
    _$OvertimeItemImpl(
      id: (json['ID'] as num).toInt(),
      isApprovedTbp: json['IsApprovedTBP'] as bool?,
      isApprovedHr: json['IsApprovedHR'] as bool?,
      employeeFullName: json['EmployeeFullName'] as String?,
      approvedTbp: json['ApprovedTBP'] as String?,
      approvedHr: json['ApprovedHR'] as String?,
      dateRegister: json['DateRegister'] == null
          ? null
          : DateTime.parse(json['DateRegister'] as String),
      typeId: (json['TypeID'] as num?)?.toInt(),
      timeStart: json['TimeStart'] == null
          ? null
          : DateTime.parse(json['TimeStart'] as String),
      endTime: json['EndTime'] == null
          ? null
          : DateTime.parse(json['EndTime'] as String),
      timeReality: (json['TimeReality'] as num?)?.toDouble(),
      totalTime: (json['TotalTime'] as num?)?.toDouble(),
      location: (json['Location'] as num?)?.toInt(),
      locationText: json['LocationText'] as String?,
      typeName: json['TypeName'] as String?,
      note: json['Note'] as String?,
      isApprovedText: json['IsApprovedText'] as String?,
      reason: json['Reason'] as String?,
      statusHr: (json['StatusHR'] as num?)?.toInt(),
      statusTbp: (json['StatusTBP'] as num?)?.toInt(),
      costOvernight: (json['CostOvernight'] as num?)?.toDouble(),
      projectName: json['ProjectName'] as String?,
      reasonDeciline: json['ReasonDeciline'] as String?,
      overnight: json['Overnight'] as bool?,
      isProblem: json['IsProblem'] as bool?,
      fileName: json['FileName'] as String?,
      statusTbpText: json['StatusTBPText'] as String?,
      statusHrText: json['StatusHRText'] as String?,
      projectId: (json['ProjectID'] as num?)?.toInt(),
      approvedId: (json['ApprovedID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$OvertimeItemImplToJson(_$OvertimeItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'IsApprovedTBP': instance.isApprovedTbp,
      'IsApprovedHR': instance.isApprovedHr,
      'EmployeeFullName': instance.employeeFullName,
      'ApprovedTBP': instance.approvedTbp,
      'ApprovedHR': instance.approvedHr,
      'DateRegister': instance.dateRegister?.toIso8601String(),
      'TypeID': instance.typeId,
      'TimeStart': instance.timeStart?.toIso8601String(),
      'EndTime': instance.endTime?.toIso8601String(),
      'TimeReality': instance.timeReality,
      'TotalTime': instance.totalTime,
      'Location': instance.location,
      'LocationText': instance.locationText,
      'TypeName': instance.typeName,
      'Note': instance.note,
      'IsApprovedText': instance.isApprovedText,
      'Reason': instance.reason,
      'StatusHR': instance.statusHr,
      'StatusTBP': instance.statusTbp,
      'CostOvernight': instance.costOvernight,
      'ProjectName': instance.projectName,
      'ReasonDeciline': instance.reasonDeciline,
      'Overnight': instance.overnight,
      'IsProblem': instance.isProblem,
      'FileName': instance.fileName,
      'StatusTBPText': instance.statusTbpText,
      'StatusHRText': instance.statusHrText,
      'ProjectID': instance.projectId,
      'ApprovedID': instance.approvedId,
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

_$OvertimeProjectImpl _$$OvertimeProjectImplFromJson(
        Map<String, dynamic> json) =>
    _$OvertimeProjectImpl(
      id: (json['ID'] as num).toInt(),
      customerId: (json['CustomerID'] as num?)?.toInt(),
      projectCode: json['ProjectCode'] as String?,
      projectName: json['ProjectName'] as String?,
      projectShortName: json['ProjectShortName'] as String?,
      projectStatus: (json['ProjectStatus'] as num?)?.toInt(),
      userId: (json['UserID'] as num?)?.toInt(),
      userTechnicalId: (json['UserTechnicalID'] as num?)?.toInt(),
      note: json['Note'] as String?,
      isApproved: json['IsApproved'] as bool?,
      contactId: (json['ContactID'] as num?)?.toInt(),
      po: json['PO'] as String?,
      projectType: (json['ProjectType'] as num?)?.toInt(),
      listCostId: (json['ListCostID'] as num?)?.toInt(),
      planDateStart: json['PlanDateStart'] == null
          ? null
          : DateTime.parse(json['PlanDateStart'] as String),
      planDateEnd: json['PlanDateEnd'] == null
          ? null
          : DateTime.parse(json['PlanDateEnd'] as String),
      actualDateStart: json['ActualDateStart'] == null
          ? null
          : DateTime.parse(json['ActualDateStart'] as String),
      actualDateEnd: json['ActualDateEnd'] == null
          ? null
          : DateTime.parse(json['ActualDateEnd'] as String),
      eu: json['EU'] as String?,
      projectManager: (json['ProjectManager'] as num?)?.toInt(),
      currentState: json['CurrentState'] as String?,
      priotity: (json['Priotity'] as num?)?.toDouble(),
      poDate: json['PODate'] == null
          ? null
          : DateTime.parse(json['PODate'] as String),
      endUser: (json['EndUser'] as num?)?.toInt(),
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      businessFieldId: (json['BusinessFieldID'] as num?)?.toInt(),
      typeProject: (json['TypeProject'] as num?)?.toInt(),
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$OvertimeProjectImplToJson(
        _$OvertimeProjectImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'CustomerID': instance.customerId,
      'ProjectCode': instance.projectCode,
      'ProjectName': instance.projectName,
      'ProjectShortName': instance.projectShortName,
      'ProjectStatus': instance.projectStatus,
      'UserID': instance.userId,
      'UserTechnicalID': instance.userTechnicalId,
      'Note': instance.note,
      'IsApproved': instance.isApproved,
      'ContactID': instance.contactId,
      'PO': instance.po,
      'ProjectType': instance.projectType,
      'ListCostID': instance.listCostId,
      'PlanDateStart': instance.planDateStart?.toIso8601String(),
      'PlanDateEnd': instance.planDateEnd?.toIso8601String(),
      'ActualDateStart': instance.actualDateStart?.toIso8601String(),
      'ActualDateEnd': instance.actualDateEnd?.toIso8601String(),
      'EU': instance.eu,
      'ProjectManager': instance.projectManager,
      'CurrentState': instance.currentState,
      'Priotity': instance.priotity,
      'PODate': instance.poDate?.toIso8601String(),
      'EndUser': instance.endUser,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'BusinessFieldID': instance.businessFieldId,
      'TypeProject': instance.typeProject,
      'IsDeleted': instance.isDeleted,
    };

_$OvertimeTypeImpl _$$OvertimeTypeImplFromJson(Map<String, dynamic> json) =>
    _$OvertimeTypeImpl(
      id: (json['ID'] as num).toInt(),
      typeCode: json['TypeCode'] as String?,
      type: json['Type'] as String?,
      ratio: (json['Ratio'] as num?)?.toDouble(),
      cost: (json['Cost'] as num?)?.toDouble(),
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      note: json['Note'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$OvertimeTypeImplToJson(_$OvertimeTypeImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'TypeCode': instance.typeCode,
      'Type': instance.type,
      'Ratio': instance.ratio,
      'Cost': instance.cost,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'Note': instance.note,
      'IsDeleted': instance.isDeleted,
    };

_$OvertimeDetailItemImpl _$$OvertimeDetailItemImplFromJson(
        Map<String, dynamic> json) =>
    _$OvertimeDetailItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      isApprovedTbp: json['IsApprovedTBP'] as bool?,
      isApprovedHr: json['IsApprovedHR'] as bool?,
      employeeFullName: json['EmployeeFullName'] as String?,
      approvedTbp: json['ApprovedTBP'] as String?,
      approvedHr: json['ApprovedHR'] as String?,
      dateRegister: json['DateRegister'] == null
          ? null
          : DateTime.parse(json['DateRegister'] as String),
      typeId: (json['TypeID'] as num?)?.toInt(),
      timeStart: json['TimeStart'] == null
          ? null
          : DateTime.parse(json['TimeStart'] as String),
      endTime: json['EndTime'] == null
          ? null
          : DateTime.parse(json['EndTime'] as String),
      timeReality: (json['TimeReality'] as num?)?.toDouble(),
      totalTime: (json['TotalTime'] as num?)?.toDouble(),
      location: (json['Location'] as num?)?.toInt(),
      locationText: json['LocationText'] as String?,
      typeName: json['TypeName'] as String?,
      note: json['Note'] as String?,
      isApprovedText: json['IsApprovedText'] as String?,
      reason: json['Reason'] as String?,
      statusHr: (json['StatusHR'] as num?)?.toInt(),
      statusTbp: (json['StatusTBP'] as num?)?.toInt(),
      costOvernight: (json['CostOvernight'] as num?)?.toDouble(),
      projectName: json['ProjectName'] as String?,
      reasonDeciline: json['ReasonDeciline'] as String?,
      overnight: json['Overnight'] as bool?,
      isProblem: json['IsProblem'] as bool?,
      fileName: json['FileName'] as String?,
      statusTbpText: json['StatusTBPText'] as String?,
      statusHrText: json['StatusHRText'] as String?,
      projectId: (json['ProjectID'] as num?)?.toInt(),
      approvedId: (json['ApprovedID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$OvertimeDetailItemImplToJson(
        _$OvertimeDetailItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'IsApprovedTBP': instance.isApprovedTbp,
      'IsApprovedHR': instance.isApprovedHr,
      'EmployeeFullName': instance.employeeFullName,
      'ApprovedTBP': instance.approvedTbp,
      'ApprovedHR': instance.approvedHr,
      'DateRegister': instance.dateRegister?.toIso8601String(),
      'TypeID': instance.typeId,
      'TimeStart': instance.timeStart?.toIso8601String(),
      'EndTime': instance.endTime?.toIso8601String(),
      'TimeReality': instance.timeReality,
      'TotalTime': instance.totalTime,
      'Location': instance.location,
      'LocationText': instance.locationText,
      'TypeName': instance.typeName,
      'Note': instance.note,
      'IsApprovedText': instance.isApprovedText,
      'Reason': instance.reason,
      'StatusHR': instance.statusHr,
      'StatusTBP': instance.statusTbp,
      'CostOvernight': instance.costOvernight,
      'ProjectName': instance.projectName,
      'ReasonDeciline': instance.reasonDeciline,
      'Overnight': instance.overnight,
      'IsProblem': instance.isProblem,
      'FileName': instance.fileName,
      'StatusTBPText': instance.statusTbpText,
      'StatusHRText': instance.statusHrText,
      'ProjectID': instance.projectId,
      'ApprovedID': instance.approvedId,
    };
