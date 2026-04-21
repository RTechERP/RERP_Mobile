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
      isPersonalTask: json['IsPersonalTask'] as bool? ?? false,
      startDate: json['StartDate'] == null
          ? null
          : DateTime.parse(json['StartDate'] as String),
      endDate: json['EndDate'] == null
          ? null
          : DateTime.parse(json['EndDate'] as String),
      deadline: json['Deadline'] == null
          ? null
          : DateTime.parse(json['Deadline'] as String),
      creatorId: (json['CreatorId'] as num?)?.toInt(),
      creatorName: json['CreatorName'] as String?,
      assigneeId: (json['AssigneeId'] as num?)?.toInt(),
      assigneeName: json['AssigneeName'] as String?,
      isCheckedIn: json['IsCheckedIn'] as bool? ?? false,
      checkInTime: json['CheckInTime'] == null
          ? null
          : DateTime.parse(json['CheckInTime'] as String),
      priority: (json['Priority'] as num?)?.toInt(),
      priorityText: json['PriorityText'] as String?,
      progress: (json['Progress'] as num?)?.toDouble(),
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
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
    };
