// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkCategoryItemImpl _$$WorkCategoryItemImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkCategoryItemImpl(
      id: (json['ID'] as num).toInt(),
      status: (json['Status'] as num).toInt(),
      stt: json['STT'] as String,
      userId: (json['UserID'] as num).toInt(),
      projectId: (json['ProjectID'] as num).toInt(),
      mission: json['Mission'] as String,
      planStartDate: json['PlanStartDate'] == null
          ? null
          : DateTime.parse(json['PlanStartDate'] as String),
      planEndDate: json['PlanEndDate'] == null
          ? null
          : DateTime.parse(json['PlanEndDate'] as String),
      actualStartDate: json['ActualStartDate'] == null
          ? null
          : DateTime.parse(json['ActualStartDate'] as String),
      actualEndDate: json['ActualEndDate'] == null
          ? null
          : DateTime.parse(json['ActualEndDate'] as String),
      note: json['Note'] as String,
      totalDayPlan: (json['TotalDayPlan'] as num).toDouble(),
      percentItem: (json['PercentItem'] as num).toDouble(),
      parentId: (json['ParentID'] as num).toInt(),
      totalDayActual: (json['TotalDayActual'] as num).toDouble(),
      itemLate: (json['ItemLate'] as num).toInt(),
      timeSpan: (json['TimeSpan'] as num).toDouble(),
      typeProjectItem: (json['TypeProjectItem'] as num).toInt(),
      percentageActual: (json['PercentageActual'] as num).toDouble(),
      employeeIdRequest: (json['EmployeeIDRequest'] as num).toInt(),
      updatedDateActual: json['UpdatedDateActual'] == null
          ? null
          : DateTime.parse(json['UpdatedDateActual'] as String),
      isApproved: (json['IsApproved'] as num).toInt(),
      code: json['Code'] as String,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      createdBy: json['CreatedBy'] as String,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String,
      isUpdateLate: json['IsUpdateLate'] as bool,
      reasonLate: json['ReasonLate'] as String,
      updatedDateReasonLate: json['UpdatedDateReasonLate'] == null
          ? null
          : DateTime.parse(json['UpdatedDateReasonLate'] as String),
      isApprovedLate: json['IsApprovedLate'] as bool,
      employeeRequestId: (json['EmployeeRequestID'] as num).toInt(),
      employeeRequestName: json['EmployeeRequestName'] as String?,
      isDeleted: json['IsDeleted'] as bool,
      location: json['Location'] as String,
      employeeCreateId: (json['EmployeeCreateID'] as num?)?.toInt(),
      description: json['Description'] as String?,
      isPersonalProject: json['IsPersonalProject'] as bool?,
      isAdditional: json['IsAdditional'] as bool?,
      taskComplexity: (json['TaskComplexity'] as num?)?.toInt(),
      percentOverTime: (json['PercentOverTime'] as num?)?.toDouble(),
      descriptionSolution: json['DescriptionSolution'] as String?,
      deadline: json['Deadline'] == null
          ? null
          : DateTime.parse(json['Deadline'] as String),
      fullName: json['FullName'] as String,
      statusText: json['StatusText'] as String,
      projectEmployee: json['ProjectEmployee'] as String,
      projectEmployeeName: json['ProjectEmployeeName'] as String,
      employeeRequest: json['EmployeeRequest'] as String,
      isApprovedText: json['IsApprovedText'] as String,
      createdName: json['CreatedName'] as String,
      projectTypeName: json['ProjectTypeName'] as String,
      employeeRequestFullName: json['EmployeeRequestFullName'] as String,
      statusUpdate: (json['StatusUpdate'] as num).toInt(),
      isUpdateProblem: (json['IsUpdateProblem'] as num).toInt(),
      itemLateActual: (json['ItemLateActual'] as num).toInt(),
      totalDayExpridSoon: (json['TotalDayExpridSoon'] as num).toInt(),
    );

Map<String, dynamic> _$$WorkCategoryItemImplToJson(
        _$WorkCategoryItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Status': instance.status,
      'STT': instance.stt,
      'UserID': instance.userId,
      'ProjectID': instance.projectId,
      'Mission': instance.mission,
      'PlanStartDate': instance.planStartDate?.toIso8601String(),
      'PlanEndDate': instance.planEndDate?.toIso8601String(),
      'ActualStartDate': instance.actualStartDate?.toIso8601String(),
      'ActualEndDate': instance.actualEndDate?.toIso8601String(),
      'Note': instance.note,
      'TotalDayPlan': instance.totalDayPlan,
      'PercentItem': instance.percentItem,
      'ParentID': instance.parentId,
      'TotalDayActual': instance.totalDayActual,
      'ItemLate': instance.itemLate,
      'TimeSpan': instance.timeSpan,
      'TypeProjectItem': instance.typeProjectItem,
      'PercentageActual': instance.percentageActual,
      'EmployeeIDRequest': instance.employeeIdRequest,
      'UpdatedDateActual': instance.updatedDateActual?.toIso8601String(),
      'IsApproved': instance.isApproved,
      'Code': instance.code,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'IsUpdateLate': instance.isUpdateLate,
      'ReasonLate': instance.reasonLate,
      'UpdatedDateReasonLate':
          instance.updatedDateReasonLate?.toIso8601String(),
      'IsApprovedLate': instance.isApprovedLate,
      'EmployeeRequestID': instance.employeeRequestId,
      'EmployeeRequestName': instance.employeeRequestName,
      'IsDeleted': instance.isDeleted,
      'Location': instance.location,
      'EmployeeCreateID': instance.employeeCreateId,
      'Description': instance.description,
      'IsPersonalProject': instance.isPersonalProject,
      'IsAdditional': instance.isAdditional,
      'TaskComplexity': instance.taskComplexity,
      'PercentOverTime': instance.percentOverTime,
      'DescriptionSolution': instance.descriptionSolution,
      'Deadline': instance.deadline?.toIso8601String(),
      'FullName': instance.fullName,
      'StatusText': instance.statusText,
      'ProjectEmployee': instance.projectEmployee,
      'ProjectEmployeeName': instance.projectEmployeeName,
      'EmployeeRequest': instance.employeeRequest,
      'IsApprovedText': instance.isApprovedText,
      'CreatedName': instance.createdName,
      'ProjectTypeName': instance.projectTypeName,
      'EmployeeRequestFullName': instance.employeeRequestFullName,
      'StatusUpdate': instance.statusUpdate,
      'IsUpdateProblem': instance.isUpdateProblem,
      'ItemLateActual': instance.itemLateActual,
      'TotalDayExpridSoon': instance.totalDayExpridSoon,
    };

_$WorkProjectItemImpl _$$WorkProjectItemImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkProjectItemImpl(
      id: (json['ID'] as num).toInt(),
      customerId: (json['CustomerID'] as num).toInt(),
      projectCode: json['ProjectCode'] as String,
      projectName: json['ProjectName'] as String,
      projectShortName: json['ProjectShortName'] as String,
      projectStatus: (json['ProjectStatus'] as num).toInt(),
      userId: (json['UserID'] as num).toInt(),
      userTechnicalId: (json['UserTechnicalID'] as num?)?.toInt(),
      note: json['Note'] as String,
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
      createdBy: json['CreatedBy'] as String,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      businessFieldId: (json['BusinessFieldID'] as num?)?.toInt(),
      typeProject: (json['TypeProject'] as num?)?.toInt(),
      isDeleted: json['IsDeleted'] as bool,
    );

Map<String, dynamic> _$$WorkProjectItemImplToJson(
        _$WorkProjectItemImpl instance) =>
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

_$WorkProjectTypeItemImpl _$$WorkProjectTypeItemImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkProjectTypeItemImpl(
      id: (json['ID'] as num).toInt(),
      projectTypeCode: json['ProjectTypeCode'] as String,
      projectTypeName: json['ProjectTypeName'] as String,
      parentId: (json['ParentID'] as num).toInt(),
      rootFolder: json['RootFolder'] as String,
      approvedTBPId: (json['ApprovedTBPID'] as num).toInt(),
      isDeleted: json['IsDeleted'] as bool,
      isHide: json['IsHide'] as bool,
    );

Map<String, dynamic> _$$WorkProjectTypeItemImplToJson(
        _$WorkProjectTypeItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ProjectTypeCode': instance.projectTypeCode,
      'ProjectTypeName': instance.projectTypeName,
      'ParentID': instance.parentId,
      'RootFolder': instance.rootFolder,
      'ApprovedTBPID': instance.approvedTBPId,
      'IsDeleted': instance.isDeleted,
      'IsHide': instance.isHide,
    };

_$WorkParentItemImpl _$$WorkParentItemImplFromJson(Map<String, dynamic> json) =>
    _$WorkParentItemImpl(
      id: (json['ID'] as num).toInt(),
      status: (json['Status'] as num).toInt(),
      stt: json['STT'] as String,
      userId: (json['UserID'] as num).toInt(),
      projectId: (json['ProjectID'] as num).toInt(),
      mission: json['Mission'] as String,
      planStartDate: json['PlanStartDate'] == null
          ? null
          : DateTime.parse(json['PlanStartDate'] as String),
      planEndDate: json['PlanEndDate'] == null
          ? null
          : DateTime.parse(json['PlanEndDate'] as String),
      actualStartDate: json['ActualStartDate'] == null
          ? null
          : DateTime.parse(json['ActualStartDate'] as String),
      actualEndDate: json['ActualEndDate'] == null
          ? null
          : DateTime.parse(json['ActualEndDate'] as String),
      note: json['Note'] as String,
      totalDayPlan: (json['TotalDayPlan'] as num).toDouble(),
      percentItem: (json['PercentItem'] as num).toDouble(),
      parentId: (json['ParentID'] as num).toInt(),
      totalDayActual: (json['TotalDayActual'] as num).toDouble(),
      itemLate: (json['ItemLate'] as num).toInt(),
      timeSpan: (json['TimeSpan'] as num).toDouble(),
      typeProjectItem: (json['TypeProjectItem'] as num).toInt(),
      percentageActual: (json['PercentageActual'] as num).toDouble(),
      employeeIdRequest: (json['EmployeeIDRequest'] as num).toInt(),
      updatedDateActual: json['UpdatedDateActual'] == null
          ? null
          : DateTime.parse(json['UpdatedDateActual'] as String),
      isApproved: (json['IsApproved'] as num).toInt(),
      code: json['Code'] as String,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      createdBy: json['CreatedBy'] as String,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String,
      isUpdateLate: json['IsUpdateLate'] as bool,
      reasonLate: json['ReasonLate'] as String,
      updatedDateReasonLate: json['UpdatedDateReasonLate'] == null
          ? null
          : DateTime.parse(json['UpdatedDateReasonLate'] as String),
      isApprovedLate: json['IsApprovedLate'] as bool,
      employeeRequestId: (json['EmployeeRequestID'] as num).toInt(),
      employeeRequestName: json['EmployeeRequestName'] as String?,
      isDeleted: json['IsDeleted'] as bool,
      location: json['Location'] as String,
      employeeCreateId: (json['EmployeeCreateID'] as num?)?.toInt(),
      description: json['Description'] as String?,
      isPersonalProject: json['IsPersonalProject'] as bool?,
      isAdditional: json['IsAdditional'] as bool?,
      taskComplexity: (json['TaskComplexity'] as num?)?.toInt(),
      percentOverTime: (json['PercentOverTime'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$WorkParentItemImplToJson(
        _$WorkParentItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Status': instance.status,
      'STT': instance.stt,
      'UserID': instance.userId,
      'ProjectID': instance.projectId,
      'Mission': instance.mission,
      'PlanStartDate': instance.planStartDate?.toIso8601String(),
      'PlanEndDate': instance.planEndDate?.toIso8601String(),
      'ActualStartDate': instance.actualStartDate?.toIso8601String(),
      'ActualEndDate': instance.actualEndDate?.toIso8601String(),
      'Note': instance.note,
      'TotalDayPlan': instance.totalDayPlan,
      'PercentItem': instance.percentItem,
      'ParentID': instance.parentId,
      'TotalDayActual': instance.totalDayActual,
      'ItemLate': instance.itemLate,
      'TimeSpan': instance.timeSpan,
      'TypeProjectItem': instance.typeProjectItem,
      'PercentageActual': instance.percentageActual,
      'EmployeeIDRequest': instance.employeeIdRequest,
      'UpdatedDateActual': instance.updatedDateActual?.toIso8601String(),
      'IsApproved': instance.isApproved,
      'Code': instance.code,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'IsUpdateLate': instance.isUpdateLate,
      'ReasonLate': instance.reasonLate,
      'UpdatedDateReasonLate':
          instance.updatedDateReasonLate?.toIso8601String(),
      'IsApprovedLate': instance.isApprovedLate,
      'EmployeeRequestID': instance.employeeRequestId,
      'EmployeeRequestName': instance.employeeRequestName,
      'IsDeleted': instance.isDeleted,
      'Location': instance.location,
      'EmployeeCreateID': instance.employeeCreateId,
      'Description': instance.description,
      'IsPersonalProject': instance.isPersonalProject,
      'IsAdditional': instance.isAdditional,
      'TaskComplexity': instance.taskComplexity,
      'PercentOverTime': instance.percentOverTime,
    };

_$WorkAssignItemImpl _$$WorkAssignItemImplFromJson(Map<String, dynamic> json) =>
    _$WorkAssignItemImpl(
      id: (json['ID'] as num).toInt(),
      code: json['Code'] as String,
      fullName: json['FullName'] as String,
    );

Map<String, dynamic> _$$WorkAssignItemImplToJson(
        _$WorkAssignItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'FullName': instance.fullName,
    };

_$WorkAssignResponseImpl _$$WorkAssignResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkAssignResponseImpl(
      rows: (json['rows'] as List<dynamic>)
          .map((e) => WorkAssignItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      employeeRequest: (json['employeeRequest'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$WorkAssignResponseImplToJson(
        _$WorkAssignResponseImpl instance) =>
    <String, dynamic>{
      'rows': instance.rows,
      'employeeRequest': instance.employeeRequest,
    };
