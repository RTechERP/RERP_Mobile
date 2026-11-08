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
      projectItemId: (json['ProjectItemID'] as num?)?.toInt(),
      approvedId: (json['ApprovedID'] as num?)?.toInt(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      declineApprove: (json['DecilineApprove'] as num?)?.toInt(),
      costOvertime: (json['CostOvertime'] as num?)?.toDouble(),
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      reasonHrEdit: json['ReasonHREdit'] as String?,
      isApprovedBgd: json['IsApprovedBGD'] as bool?,
      approvedBgdId: (json['ApprovedBGDID'] as num?)?.toInt(),
      dateApprovedBgd: json['DateApprovedBGD'] == null
          ? null
          : DateTime.parse(json['DateApprovedBGD'] as String),
      isSeniorApproved: json['IsSeniorApproved'] as bool?,
      approvedSeniorId: (json['ApprovedSeniorID'] as num?)?.toInt(),
      dateApprovedSenitor: json['DateApprovedSenitor'] == null
          ? null
          : DateTime.parse(json['DateApprovedSenitor'] as String),
      isDeleted: json['IsDeleted'] as bool?,
      reasonDecilineSenior: json['ReasonDecilineSenior'] as String?,
      declineApproveSenior: (json['DecilineApproveSenior'] as num?)?.toInt(),
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
      'ProjectItemID': instance.projectItemId,
      'ApprovedID': instance.approvedId,
      'EmployeeID': instance.employeeId,
      'DecilineApprove': instance.declineApprove,
      'CostOvertime': instance.costOvertime,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'ReasonHREdit': instance.reasonHrEdit,
      'IsApprovedBGD': instance.isApprovedBgd,
      'ApprovedBGDID': instance.approvedBgdId,
      'DateApprovedBGD': instance.dateApprovedBgd?.toIso8601String(),
      'IsSeniorApproved': instance.isSeniorApproved,
      'ApprovedSeniorID': instance.approvedSeniorId,
      'DateApprovedSenitor': instance.dateApprovedSenitor?.toIso8601String(),
      'IsDeleted': instance.isDeleted,
      'ReasonDecilineSenior': instance.reasonDecilineSenior,
      'DecilineApproveSenior': instance.declineApproveSenior,
    };

_$OvertimeProjectItemLinkImpl _$$OvertimeProjectItemLinkImplFromJson(
        Map<String, dynamic> json) =>
    _$OvertimeProjectItemLinkImpl(
      id: (json['ID'] as num?)?.toInt(),
      employeeOvertimeId: (json['EmployeeOvertimeID'] as num?)?.toInt(),
      projectItemId: (json['ProjectItemID'] as num?)?.toInt(),
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
    );

Map<String, dynamic> _$$OvertimeProjectItemLinkImplToJson(
        _$OvertimeProjectItemLinkImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'EmployeeOvertimeID': instance.employeeOvertimeId,
      'ProjectItemID': instance.projectItemId,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
    };

_$OvertimeFileItemImpl _$$OvertimeFileItemImplFromJson(
        Map<String, dynamic> json) =>
    _$OvertimeFileItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      employeeOvertimeId: (json['EmployeeOvertimeID'] as num?)?.toInt(),
      fileName: json['FileName'] as String?,
      originPath: json['OriginPath'] as String?,
      serverPath: json['ServerPath'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$OvertimeFileItemImplToJson(
        _$OvertimeFileItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'EmployeeOvertimeID': instance.employeeOvertimeId,
      'FileName': instance.fileName,
      'OriginPath': instance.originPath,
      'ServerPath': instance.serverPath,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'IsDeleted': instance.isDeleted,
    };

_$OvertimeDetailResponseImpl _$$OvertimeDetailResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$OvertimeDetailResponseImpl(
      employeeOvertime: json['employeeOverTime'] == null
          ? null
          : OvertimeDetailItem.fromJson(
              json['employeeOverTime'] as Map<String, dynamic>),
      overTimeFile: json['overTimeFile'] == null
          ? null
          : OvertimeFileItem.fromJson(
              json['overTimeFile'] as Map<String, dynamic>),
      overTimeProjectItem: json['overTimeProjectItem'] == null
          ? null
          : OvertimeProjectItemLink.fromJson(
              json['overTimeProjectItem'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OvertimeDetailResponseImplToJson(
        _$OvertimeDetailResponseImpl instance) =>
    <String, dynamic>{
      'employeeOverTime': instance.employeeOvertime,
      'overTimeFile': instance.overTimeFile,
      'overTimeProjectItem': instance.overTimeProjectItem,
    };

_$OvertimeProjectItemImpl _$$OvertimeProjectItemImplFromJson(
        Map<String, dynamic> json) =>
    _$OvertimeProjectItemImpl(
      id: (json['ID'] as num).toInt(),
      code: json['Code'] as String?,
      mission: json['Mission'] as String?,
      percentageActual: (json['PercentageActual'] as num?)?.toDouble(),
      planStartDate: json['PlanStartDate'] == null
          ? null
          : DateTime.parse(json['PlanStartDate'] as String),
      planEndDate: json['PlanEndDate'] == null
          ? null
          : DateTime.parse(json['PlanEndDate'] as String),
      totalDayPlan: (json['TotalDayPlan'] as num?)?.toDouble(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      isCheckedToday: (json['IsCheckedToday'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$OvertimeProjectItemImplToJson(
        _$OvertimeProjectItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'Mission': instance.mission,
      'PercentageActual': instance.percentageActual,
      'PlanStartDate': instance.planStartDate?.toIso8601String(),
      'PlanEndDate': instance.planEndDate?.toIso8601String(),
      'TotalDayPlan': instance.totalDayPlan,
      'EmployeeID': instance.employeeId,
      'IsCheckedToday': instance.isCheckedToday,
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
