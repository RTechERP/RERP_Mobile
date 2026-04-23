// ignore_for_file: type=lint, unused_element, deprecated_member_use,
// deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters,
// unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named,
// prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target,
// unnecessary_question_mark

import 'package:freezed_annotation/freezed_annotation.dart';

part 'week_plan_model.freezed.dart';
part 'week_plan_model.g.dart';

@freezed
class WeekPlanTaskItem with _$WeekPlanTaskItem {
  const factory WeekPlanTaskItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'ProjectName') String? projectName,
    @JsonKey(name: 'ProjectId') int? projectId,
    @JsonKey(name: 'ParentTaskId') int? parentTaskId,
    @JsonKey(name: 'ParentTaskName') String? parentTaskName,
    @JsonKey(name: 'TaskName') String? taskName,
    @JsonKey(name: 'TaskContent') String? taskContent,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'StatusText') String? statusText,
    @JsonKey(name: 'WorkType') int? workType,
    @JsonKey(name: 'WorkTypeText') String? workTypeText,
    @JsonKey(name: 'TaskCategory') int? taskCategory,
    @JsonKey(name: 'TaskCategoryText') String? taskCategoryText,
    @JsonKey(name: 'Complexity') int? complexity,
    @JsonKey(name: 'IsPersonalTask') bool? isPersonalTask,
    @JsonKey(name: 'StartDate') DateTime? startDate,
    @JsonKey(name: 'EndDate') DateTime? endDate,
    @JsonKey(name: 'Deadline') DateTime? deadline,
    @JsonKey(name: 'ActualStartDate') DateTime? actualStartDate,
    @JsonKey(name: 'ActualEndDate') DateTime? actualEndDate,
    @JsonKey(name: 'CreatorId') int? creatorId,
    @JsonKey(name: 'CreatorName') String? creatorName,
    @JsonKey(name: 'AssigneeId') int? assigneeId,
    @JsonKey(name: 'AssigneeName') String? assigneeName,
    @JsonKey(name: 'IsCheckedIn') bool? isCheckedIn,
    @JsonKey(name: 'CheckInTime') DateTime? checkInTime,
    @JsonKey(name: 'Priority') int? priority,
    @JsonKey(name: 'PriorityText') String? priorityText,
    @JsonKey(name: 'Progress') double? progress,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'Result') String? result,
    @JsonKey(name: 'Assignees') List<int>? assignees,
    @JsonKey(name: 'RelatedPersons') List<int>? relatedPersons,
    @JsonKey(name: 'SubTasks') List<WeekPlanSubTaskItem>? subTasks,
    @JsonKey(name: 'Attachments') List<WeekPlanAttachmentItem>? attachments,
    @JsonKey(name: 'Incidents') List<WeekPlanIncidentItem>? incidents,
  }) = _WeekPlanTaskItem;

  factory WeekPlanTaskItem.fromJson(Map<String, dynamic> json) =>
      _$WeekPlanTaskItemFromJson(json);
}

@freezed
class WeekPlanSubTaskItem with _$WeekPlanSubTaskItem {
  const factory WeekPlanSubTaskItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Content') String? content,
    @JsonKey(name: 'StartDate') DateTime? startDate,
    @JsonKey(name: 'EndDate') DateTime? endDate,
    @JsonKey(name: 'AssigneeID') int? assigneeId,
    @JsonKey(name: 'AssigneeName') String? assigneeName,
    @JsonKey(name: 'AssignerID') int? assignerId,
    @JsonKey(name: 'AssignerName') String? assignerName,
    @JsonKey(name: 'Complexity') int? complexity,
    @JsonKey(name: 'WorkType') int? workType,
    @JsonKey(name: 'WorkTypeName') String? workTypeName,
    @JsonKey(name: 'TaskCategory') int? taskCategory,
    @JsonKey(name: 'TaskCategoryName') String? taskCategoryName,
  }) = _WeekPlanSubTaskItem;

  factory WeekPlanSubTaskItem.fromJson(Map<String, dynamic> json) =>
      _$WeekPlanSubTaskItemFromJson(json);
}

@freezed
class WeekPlanAttachmentItem with _$WeekPlanAttachmentItem {
  const factory WeekPlanAttachmentItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'FileName') String? fileName,
    @JsonKey(name: 'FilePath') String? filePath,
    @JsonKey(name: 'FileSize') int? fileSize,
    @JsonKey(name: 'FileType') String? fileType,
    @JsonKey(name: 'UploadedAt') DateTime? uploadedAt,
  }) = _WeekPlanAttachmentItem;

  factory WeekPlanAttachmentItem.fromJson(Map<String, dynamic> json) =>
      _$WeekPlanAttachmentItemFromJson(json);
}

@freezed
class WeekPlanIncidentItem with _$WeekPlanIncidentItem {
  const factory WeekPlanIncidentItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'Type') int? type,
    @JsonKey(name: 'TypeName') String? typeName,
    @JsonKey(name: 'Severity') int? severity,
    @JsonKey(name: 'SeverityName') String? severityName,
    @JsonKey(name: 'ReportedAt') DateTime? reportedAt,
  }) = _WeekPlanIncidentItem;

  factory WeekPlanIncidentItem.fromJson(Map<String, dynamic> json) =>
      _$WeekPlanIncidentItemFromJson(json);
}
