// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week_plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeekPlanTaskItemImpl _$$WeekPlanTaskItemImplFromJson(
        Map<String, dynamic> json) =>
    _$WeekPlanTaskItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      projectName: json['ProjectName'] as String?,
      projectId: (json['ProjectId'] as num?)?.toInt(),
      parentTaskId: (json['ParentTaskId'] as num?)?.toInt(),
      parentTaskName: json['ParentTaskName'] as String?,
      taskName: json['TaskName'] as String?,
      taskContent: json['TaskContent'] as String?,
      description: json['Description'] as String?,
      status: (json['Status'] as num?)?.toInt(),
      statusText: json['StatusText'] as String?,
      workType: (json['WorkType'] as num?)?.toInt(),
      workTypeText: json['WorkTypeText'] as String?,
      taskCategory: (json['TaskCategory'] as num?)?.toInt(),
      taskCategoryText: json['TaskCategoryText'] as String?,
      complexity: (json['Complexity'] as num?)?.toInt(),
      isPersonalTask: json['IsPersonalTask'] as bool?,
      startDate: json['StartDate'] == null
          ? null
          : DateTime.parse(json['StartDate'] as String),
      endDate: json['EndDate'] == null
          ? null
          : DateTime.parse(json['EndDate'] as String),
      deadline: json['Deadline'] == null
          ? null
          : DateTime.parse(json['Deadline'] as String),
      actualStartDate: json['ActualStartDate'] == null
          ? null
          : DateTime.parse(json['ActualStartDate'] as String),
      actualEndDate: json['ActualEndDate'] == null
          ? null
          : DateTime.parse(json['ActualEndDate'] as String),
      creatorId: (json['CreatorId'] as num?)?.toInt(),
      creatorName: json['CreatorName'] as String?,
      assigneeId: (json['AssigneeId'] as num?)?.toInt(),
      assigneeName: json['AssigneeName'] as String?,
      isCheckedIn: json['IsCheckedIn'] as bool?,
      checkInTime: json['CheckInTime'] == null
          ? null
          : DateTime.parse(json['CheckInTime'] as String),
      priority: (json['Priority'] as num?)?.toInt(),
      priorityText: json['PriorityText'] as String?,
      progress: (json['Progress'] as num?)?.toDouble(),
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      result: json['Result'] as String?,
      assignees: (json['Assignees'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      relatedPersons: (json['RelatedPersons'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      subTasks: (json['SubTasks'] as List<dynamic>?)
          ?.map((e) => WeekPlanSubTaskItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      attachments: (json['Attachments'] as List<dynamic>?)
          ?.map(
              (e) => WeekPlanAttachmentItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      incidents: (json['Incidents'] as List<dynamic>?)
          ?.map((e) => WeekPlanIncidentItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WeekPlanTaskItemImplToJson(
        _$WeekPlanTaskItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ProjectName': instance.projectName,
      'ProjectId': instance.projectId,
      'ParentTaskId': instance.parentTaskId,
      'ParentTaskName': instance.parentTaskName,
      'TaskName': instance.taskName,
      'TaskContent': instance.taskContent,
      'Description': instance.description,
      'Status': instance.status,
      'StatusText': instance.statusText,
      'WorkType': instance.workType,
      'WorkTypeText': instance.workTypeText,
      'TaskCategory': instance.taskCategory,
      'TaskCategoryText': instance.taskCategoryText,
      'Complexity': instance.complexity,
      'IsPersonalTask': instance.isPersonalTask,
      'StartDate': instance.startDate?.toIso8601String(),
      'EndDate': instance.endDate?.toIso8601String(),
      'Deadline': instance.deadline?.toIso8601String(),
      'ActualStartDate': instance.actualStartDate?.toIso8601String(),
      'ActualEndDate': instance.actualEndDate?.toIso8601String(),
      'CreatorId': instance.creatorId,
      'CreatorName': instance.creatorName,
      'AssigneeId': instance.assigneeId,
      'AssigneeName': instance.assigneeName,
      'IsCheckedIn': instance.isCheckedIn,
      'CheckInTime': instance.checkInTime?.toIso8601String(),
      'Priority': instance.priority,
      'PriorityText': instance.priorityText,
      'Progress': instance.progress,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'Result': instance.result,
      'Assignees': instance.assignees,
      'RelatedPersons': instance.relatedPersons,
      'SubTasks': instance.subTasks,
      'Attachments': instance.attachments,
      'Incidents': instance.incidents,
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
