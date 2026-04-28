// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week_plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeekPlanTaskItemImpl _$$WeekPlanTaskItemImplFromJson(
        Map<String, dynamic> json) =>
    _$WeekPlanTaskItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      status: (json['Status'] as num?)?.toInt(),
      statusText: json['StatusText'] as String?,
      stt: (json['STT'] as num?)?.toInt(),
      userId: (json['UserID'] as num?)?.toInt(),
      projectId: (json['ProjectID'] as num?)?.toInt(),
      projectCode: json['ProjectCode'] as String?,
      projectName: json['ProjectName'] as String?,
      mission: json['Mission'] as String?,
      taskName: json['TaskName'] as String?,
      taskContent: json['TaskContent'] as String?,
      planStartDate: json['PlanStartDate'] == null
          ? null
          : DateTime.parse(json['PlanStartDate'] as String),
      planEndDate: json['PlanEndDate'] == null
          ? null
          : DateTime.parse(json['PlanEndDate'] as String),
      startDate: json['StartDate'] == null
          ? null
          : DateTime.parse(json['StartDate'] as String),
      endDate: json['EndDate'] == null
          ? null
          : DateTime.parse(json['EndDate'] as String),
      actualStartDate: json['ActualStartDate'] == null
          ? null
          : DateTime.parse(json['ActualStartDate'] as String),
      actualEndDate: json['ActualEndDate'] == null
          ? null
          : DateTime.parse(json['ActualEndDate'] as String),
      totalDayPlan: (json['TotalDayPlan'] as num?)?.toDouble(),
      percentItem: (json['PercentItem'] as num?)?.toDouble(),
      percentageActual: (json['PercentageActual'] as num?)?.toDouble(),
      progress: (json['Progress'] as num?)?.toDouble(),
      parentId: (json['ParentID'] as num?)?.toInt(),
      typeProjectItem: (json['TypeProjectItem'] as num?)?.toInt(),
      employeeIdRequest: (json['EmployeeIDRequest'] as num?)?.toInt(),
      updatedDateActual: json['UpdatedDateActual'] == null
          ? null
          : DateTime.parse(json['UpdatedDateActual'] as String),
      code: json['Code'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      creatorId: (json['CreatorID'] as num?)?.toInt(),
      creatorName: json['CreatorName'] as String?,
      assigneeId: (json['AssigneeID'] as num?)?.toInt(),
      assigneeName: json['AssigneeName'] as String?,
      asigneeEmployeeId: (json['AsigneeEmployeeID'] as num?)?.toInt(),
      asigneeEmployeeFullName: json['AsigneeEmployeeFullName'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      isUpdateLate: json['IsUpdateLate'] as bool?,
      isDeleted: json['IsDeleted'] as bool?,
      isPersonalProject: json['IsPersonalProject'] as bool?,
      isAdditional: json['IsAdditional'] as bool?,
      isCheckedIn: json['IsCheckIn'] as bool?,
      checkInTime: json['CheckInTime'] == null
          ? null
          : DateTime.parse(json['CheckInTime'] as String),
      taskComplexity: (json['TaskComplexity'] as num?)?.toInt(),
      taskComplexityText: json['TaskComplexityText'] as String?,
      percentOverTime: (json['PercentOverTime'] as num?)?.toDouble(),
      fullName: json['FullName'] as String?,
      parentCode: json['ParentCode'] as String?,
      parentTitle: json['ParentTitle'] as String?,
      secondEmployeeId: (json['SecondEmployeeID'] as num?)?.toInt(),
      secondEmployeeFullName: json['SecondEmployeeFullName'] as String?,
      secondEmployeeType: (json['SecondEmployeeType'] as num?)?.toInt(),
      reviewDiscription: json['ReviewDiscription'] as String?,
      projectTaskTypeName: json['ProjectTaskTypeName'] as String?,
      departmentAssignerId: (json['DepartmentAssignerID'] as num?)?.toInt(),
      departmentAssigneeId: (json['DepartmentAssigneeID'] as num?)?.toInt(),
      departmentAssignerName: json['DepartmentAssignerName'] as String?,
      departmentAssigneeName: json['DepartmentAssigneeName'] as String?,
      projectTaskColor: json['ProjectTaskColor'] as String?,
      totalActualHours: (json['TotalActualHours'] as num?)?.toDouble(),
      reviewCompletionRating:
          (json['ReviewCompletionRating'] as num?)?.toDouble(),
      isCheck: json['IsCheck'] as bool?,
      deadline: json['Deadline'] == null
          ? null
          : DateTime.parse(json['Deadline'] as String),
      projectTaskTypeId: (json['ProjectTaskTypeID'] as num?)?.toInt(),
      approvalStatus: (json['ApprovalStatus'] as num?)?.toInt(),
      priority: (json['Priority'] as num?)?.toInt(),
      priorityText: json['PriorityText'] as String?,
      estimatedTime: (json['EstimatedTime'] as num?)?.toDouble(),
      description: json['Description'] as String?,
    );

Map<String, dynamic> _$$WeekPlanTaskItemImplToJson(
        _$WeekPlanTaskItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Status': instance.status,
      'StatusText': instance.statusText,
      'STT': instance.stt,
      'UserID': instance.userId,
      'ProjectID': instance.projectId,
      'ProjectCode': instance.projectCode,
      'ProjectName': instance.projectName,
      'Mission': instance.mission,
      'TaskName': instance.taskName,
      'TaskContent': instance.taskContent,
      'PlanStartDate': instance.planStartDate?.toIso8601String(),
      'PlanEndDate': instance.planEndDate?.toIso8601String(),
      'StartDate': instance.startDate?.toIso8601String(),
      'EndDate': instance.endDate?.toIso8601String(),
      'ActualStartDate': instance.actualStartDate?.toIso8601String(),
      'ActualEndDate': instance.actualEndDate?.toIso8601String(),
      'TotalDayPlan': instance.totalDayPlan,
      'PercentItem': instance.percentItem,
      'PercentageActual': instance.percentageActual,
      'Progress': instance.progress,
      'ParentID': instance.parentId,
      'TypeProjectItem': instance.typeProjectItem,
      'EmployeeIDRequest': instance.employeeIdRequest,
      'UpdatedDateActual': instance.updatedDateActual?.toIso8601String(),
      'Code': instance.code,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'CreatorID': instance.creatorId,
      'CreatorName': instance.creatorName,
      'AssigneeID': instance.assigneeId,
      'AssigneeName': instance.assigneeName,
      'AsigneeEmployeeID': instance.asigneeEmployeeId,
      'AsigneeEmployeeFullName': instance.asigneeEmployeeFullName,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'IsUpdateLate': instance.isUpdateLate,
      'IsDeleted': instance.isDeleted,
      'IsPersonalProject': instance.isPersonalProject,
      'IsAdditional': instance.isAdditional,
      'IsCheckIn': instance.isCheckedIn,
      'CheckInTime': instance.checkInTime?.toIso8601String(),
      'TaskComplexity': instance.taskComplexity,
      'TaskComplexityText': instance.taskComplexityText,
      'PercentOverTime': instance.percentOverTime,
      'FullName': instance.fullName,
      'ParentCode': instance.parentCode,
      'ParentTitle': instance.parentTitle,
      'SecondEmployeeID': instance.secondEmployeeId,
      'SecondEmployeeFullName': instance.secondEmployeeFullName,
      'SecondEmployeeType': instance.secondEmployeeType,
      'ReviewDiscription': instance.reviewDiscription,
      'ProjectTaskTypeName': instance.projectTaskTypeName,
      'DepartmentAssignerID': instance.departmentAssignerId,
      'DepartmentAssigneeID': instance.departmentAssigneeId,
      'DepartmentAssignerName': instance.departmentAssignerName,
      'DepartmentAssigneeName': instance.departmentAssigneeName,
      'ProjectTaskColor': instance.projectTaskColor,
      'TotalActualHours': instance.totalActualHours,
      'ReviewCompletionRating': instance.reviewCompletionRating,
      'IsCheck': instance.isCheck,
      'Deadline': instance.deadline?.toIso8601String(),
      'ProjectTaskTypeID': instance.projectTaskTypeId,
      'ApprovalStatus': instance.approvalStatus,
      'Priority': instance.priority,
      'PriorityText': instance.priorityText,
      'EstimatedTime': instance.estimatedTime,
      'Description': instance.description,
    };

_$WeekPlanSubTaskItemImpl _$$WeekPlanSubTaskItemImplFromJson(
        Map<String, dynamic> json) =>
    _$WeekPlanSubTaskItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      content: json['Content'] as String?,
      startDate: json['StartDate'] == null
          ? null
          : DateTime.parse(json['StartDate'] as String),
      endDate: json['EndDate'] == null
          ? null
          : DateTime.parse(json['EndDate'] as String),
      assigneeId: (json['AssigneeID'] as num?)?.toInt(),
      assigneeName: json['AssigneeName'] as String?,
      assignerId: (json['AssignerID'] as num?)?.toInt(),
      assignerName: json['AssignerName'] as String?,
      complexity: (json['Complexity'] as num?)?.toInt(),
      workType: (json['WorkType'] as num?)?.toInt(),
      workTypeName: json['WorkTypeName'] as String?,
      taskCategory: (json['TaskCategory'] as num?)?.toInt(),
      taskCategoryName: json['TaskCategoryName'] as String?,
    );

Map<String, dynamic> _$$WeekPlanSubTaskItemImplToJson(
        _$WeekPlanSubTaskItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Content': instance.content,
      'StartDate': instance.startDate?.toIso8601String(),
      'EndDate': instance.endDate?.toIso8601String(),
      'AssigneeID': instance.assigneeId,
      'AssigneeName': instance.assigneeName,
      'AssignerID': instance.assignerId,
      'AssignerName': instance.assignerName,
      'Complexity': instance.complexity,
      'WorkType': instance.workType,
      'WorkTypeName': instance.workTypeName,
      'TaskCategory': instance.taskCategory,
      'TaskCategoryName': instance.taskCategoryName,
    };

_$WeekPlanAttachmentItemImpl _$$WeekPlanAttachmentItemImplFromJson(
        Map<String, dynamic> json) =>
    _$WeekPlanAttachmentItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      fileName: json['FileName'] as String?,
      filePath: json['FilePath'] as String?,
      fileSize: (json['FileSize'] as num?)?.toInt(),
      fileType: json['FileType'] as String?,
      uploadedAt: json['UploadedAt'] == null
          ? null
          : DateTime.parse(json['UploadedAt'] as String),
    );

Map<String, dynamic> _$$WeekPlanAttachmentItemImplToJson(
        _$WeekPlanAttachmentItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'FileName': instance.fileName,
      'FilePath': instance.filePath,
      'FileSize': instance.fileSize,
      'FileType': instance.fileType,
      'UploadedAt': instance.uploadedAt?.toIso8601String(),
    };

_$WeekPlanIncidentItemImpl _$$WeekPlanIncidentItemImplFromJson(
        Map<String, dynamic> json) =>
    _$WeekPlanIncidentItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      description: json['Description'] as String?,
      type: (json['Type'] as num?)?.toInt(),
      typeName: json['TypeName'] as String?,
      severity: (json['Severity'] as num?)?.toInt(),
      severityName: json['SeverityName'] as String?,
      reportedAt: json['ReportedAt'] == null
          ? null
          : DateTime.parse(json['ReportedAt'] as String),
    );

Map<String, dynamic> _$$WeekPlanIncidentItemImplToJson(
        _$WeekPlanIncidentItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Description': instance.description,
      'Type': instance.type,
      'TypeName': instance.typeName,
      'Severity': instance.severity,
      'SeverityName': instance.severityName,
      'ReportedAt': instance.reportedAt?.toIso8601String(),
    };
