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
    @JsonKey(name: 'IsPersonalTask') @Default(false) bool isPersonalTask,
    @JsonKey(name: 'StartDate') DateTime? startDate,
    @JsonKey(name: 'EndDate') DateTime? endDate,
    @JsonKey(name: 'Deadline') DateTime? deadline,
    @JsonKey(name: 'CreatorId') int? creatorId,
    @JsonKey(name: 'CreatorName') String? creatorName,
    @JsonKey(name: 'AssigneeId') int? assigneeId,
    @JsonKey(name: 'AssigneeName') String? assigneeName,
    @JsonKey(name: 'IsCheckedIn') @Default(false) bool isCheckedIn,
    @JsonKey(name: 'CheckInTime') DateTime? checkInTime,
    @JsonKey(name: 'Priority') int? priority,
    @JsonKey(name: 'PriorityText') String? priorityText,
    @JsonKey(name: 'Progress') double? progress,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
  }) = _WeekPlanTaskItem;

  factory WeekPlanTaskItem.fromJson(Map<String, dynamic> json) =>
      _$WeekPlanTaskItemFromJson(json);
}
