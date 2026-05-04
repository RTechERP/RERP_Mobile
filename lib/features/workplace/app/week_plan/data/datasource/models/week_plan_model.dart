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
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'StatusText') String? statusText,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'UserID') int? userId,
    @JsonKey(name: 'ProjectID') int? projectId,
    @JsonKey(name: 'ProjectCode') String? projectCode,
    @JsonKey(name: 'ProjectName') String? projectName,
    @JsonKey(name: 'Mission') String? mission,
    @JsonKey(name: 'TaskName') String? taskName,
    @JsonKey(name: 'TaskContent') String? taskContent,
    @JsonKey(name: 'PlanStartDate') DateTime? planStartDate,
    @JsonKey(name: 'PlanEndDate') DateTime? planEndDate,
    @JsonKey(name: 'StartDate') DateTime? startDate,
    @JsonKey(name: 'EndDate') DateTime? endDate,
    @JsonKey(name: 'ActualStartDate') DateTime? actualStartDate,
    @JsonKey(name: 'ActualEndDate') DateTime? actualEndDate,
    @JsonKey(name: 'TotalDayPlan') double? totalDayPlan,
    @JsonKey(name: 'PercentItem') double? percentItem,
    @JsonKey(name: 'PercentageActual') double? percentageActual,
    @JsonKey(name: 'Progress') double? progress,
    @JsonKey(name: 'ParentID') int? parentId,
    @JsonKey(name: 'TypeProjectItem') int? typeProjectItem,
    @JsonKey(name: 'EmployeeIDRequest') int? employeeIdRequest,
    @JsonKey(name: 'UpdatedDateActual') DateTime? updatedDateActual,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatorID') int? creatorId,
    @JsonKey(name: 'CreatorName') String? creatorName,
    @JsonKey(name: 'AssigneeID') int? assigneeId,
    @JsonKey(name: 'AssigneeName') String? assigneeName,
    @JsonKey(name: 'AsigneeEmployeeID') int? asigneeEmployeeId,
    @JsonKey(name: 'AsigneeEmployeeFullName') String? asigneeEmployeeFullName,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'IsUpdateLate') bool? isUpdateLate,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'IsPersonalProject') bool? isPersonalProject,
    @JsonKey(name: 'IsAdditional') bool? isAdditional,
    @JsonKey(name: 'IsCheckIn') bool? isCheckedIn,
    @JsonKey(name: 'CheckInTime') DateTime? checkInTime,
    @JsonKey(name: 'TaskComplexity') int? taskComplexity,
    @JsonKey(name: 'TaskComplexityText') String? taskComplexityText,
    @JsonKey(name: 'PercentOverTime') double? percentOverTime,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'ParentCode') String? parentCode,
    @JsonKey(name: 'ParentTitle') String? parentTitle,
    @JsonKey(name: 'SecondEmployeeID') int? secondEmployeeId,
    @JsonKey(name: 'SecondEmployeeFullName') String? secondEmployeeFullName,
    @JsonKey(name: 'SecondEmployeeType') int? secondEmployeeType,
    @JsonKey(name: 'ReviewDiscription') String? reviewDiscription,
    @JsonKey(name: 'ProjectTaskTypeName') String? projectTaskTypeName,
    @JsonKey(name: 'DepartmentAssignerID') int? departmentAssignerId,
    @JsonKey(name: 'DepartmentAssigneeID') int? departmentAssigneeId,
    @JsonKey(name: 'DepartmentAssignerName') String? departmentAssignerName,
    @JsonKey(name: 'DepartmentAssigneeName') String? departmentAssigneeName,
    @JsonKey(name: 'ProjectTaskColor') String? projectTaskColor,
    @JsonKey(name: 'TotalActualHours') double? totalActualHours,
    @JsonKey(name: 'ReviewCompletionRating') double? reviewCompletionRating,
    @JsonKey(name: 'IsCheck') bool? isCheck,
    @JsonKey(name: 'Deadline') DateTime? deadline,
    @JsonKey(name: 'ProjectTaskTypeID') int? projectTaskTypeId,
    @JsonKey(name: 'ApprovalStatus') int? approvalStatus,
    @JsonKey(name: 'Priority') int? priority,
    @JsonKey(name: 'PriorityText') String? priorityText,
    @JsonKey(name: 'EstimatedTime') double? estimatedTime,
    @JsonKey(name: 'Description') String? description,
  }) = _WeekPlanTaskItem;

  factory WeekPlanTaskItem.fromJson(Map<String, dynamic> json) =>
      _$WeekPlanTaskItemFromJson(json);
}

@freezed
class TaskTypeItem with _$TaskTypeItem {
  const factory TaskTypeItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'TypeName') String? typeName,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'Color') String? color,
  }) = _TaskTypeItem;

  factory TaskTypeItem.fromJson(Map<String, dynamic> json) =>
      _$TaskTypeItemFromJson(json);
}

@freezed
class ProjectTaskItem with _$ProjectTaskItem {
  const factory ProjectTaskItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'ProjectCode') String? projectCode,
    @JsonKey(name: 'ProjectName') String? projectName,
  }) = _ProjectTaskItem;

  factory ProjectTaskItem.fromJson(Map<String, dynamic> json) =>
      _$ProjectTaskItemFromJson(json);
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
