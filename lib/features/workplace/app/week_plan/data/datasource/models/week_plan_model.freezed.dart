// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'week_plan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeekPlanTaskItem _$WeekPlanTaskItemFromJson(Map<String, dynamic> json) {
  return _WeekPlanTaskItem.fromJson(json);
}

/// @nodoc
mixin _$WeekPlanTaskItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectName')
  String? get projectName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectId')
  int? get projectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ParentTaskId')
  int? get parentTaskId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ParentTaskName')
  String? get parentTaskName => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaskName')
  String? get taskName => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaskContent')
  String? get taskContent => throw _privateConstructorUsedError;
  @JsonKey(name: 'Description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'Status')
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusText')
  String? get statusText => throw _privateConstructorUsedError;
  @JsonKey(name: 'WorkType')
  int? get workType => throw _privateConstructorUsedError;
  @JsonKey(name: 'WorkTypeText')
  String? get workTypeText => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaskCategory')
  int? get taskCategory => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaskCategoryText')
  String? get taskCategoryText => throw _privateConstructorUsedError;
  @JsonKey(name: 'Complexity')
  int? get complexity => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsPersonalTask')
  bool? get isPersonalTask => throw _privateConstructorUsedError;
  @JsonKey(name: 'StartDate')
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'EndDate')
  DateTime? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'Deadline')
  DateTime? get deadline => throw _privateConstructorUsedError;
  @JsonKey(name: 'ActualStartDate')
  DateTime? get actualStartDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'ActualEndDate')
  DateTime? get actualEndDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatorId')
  int? get creatorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatorName')
  String? get creatorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'AssigneeId')
  int? get assigneeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'AssigneeName')
  String? get assigneeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsCheckedIn')
  bool? get isCheckedIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'CheckInTime')
  DateTime? get checkInTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'Priority')
  int? get priority => throw _privateConstructorUsedError;
  @JsonKey(name: 'PriorityText')
  String? get priorityText => throw _privateConstructorUsedError;
  @JsonKey(name: 'Progress')
  double? get progress => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'Result')
  String? get result => throw _privateConstructorUsedError;
  @JsonKey(name: 'Assignees')
  List<int>? get assignees => throw _privateConstructorUsedError;
  @JsonKey(name: 'RelatedPersons')
  List<int>? get relatedPersons => throw _privateConstructorUsedError;
  @JsonKey(name: 'SubTasks')
  List<WeekPlanSubTaskItem>? get subTasks => throw _privateConstructorUsedError;
  @JsonKey(name: 'Attachments')
  List<WeekPlanAttachmentItem>? get attachments =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Incidents')
  List<WeekPlanIncidentItem>? get incidents =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeekPlanTaskItemCopyWith<WeekPlanTaskItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeekPlanTaskItemCopyWith<$Res> {
  factory $WeekPlanTaskItemCopyWith(
          WeekPlanTaskItem value, $Res Function(WeekPlanTaskItem) then) =
      _$WeekPlanTaskItemCopyWithImpl<$Res, WeekPlanTaskItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
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
      @JsonKey(name: 'Incidents') List<WeekPlanIncidentItem>? incidents});
}

/// @nodoc
class _$WeekPlanTaskItemCopyWithImpl<$Res, $Val extends WeekPlanTaskItem>
    implements $WeekPlanTaskItemCopyWith<$Res> {
  _$WeekPlanTaskItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? projectName = freezed,
    Object? projectId = freezed,
    Object? parentTaskId = freezed,
    Object? parentTaskName = freezed,
    Object? taskName = freezed,
    Object? taskContent = freezed,
    Object? description = freezed,
    Object? status = freezed,
    Object? statusText = freezed,
    Object? workType = freezed,
    Object? workTypeText = freezed,
    Object? taskCategory = freezed,
    Object? taskCategoryText = freezed,
    Object? complexity = freezed,
    Object? isPersonalTask = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? deadline = freezed,
    Object? actualStartDate = freezed,
    Object? actualEndDate = freezed,
    Object? creatorId = freezed,
    Object? creatorName = freezed,
    Object? assigneeId = freezed,
    Object? assigneeName = freezed,
    Object? isCheckedIn = freezed,
    Object? checkInTime = freezed,
    Object? priority = freezed,
    Object? priorityText = freezed,
    Object? progress = freezed,
    Object? createdDate = freezed,
    Object? result = freezed,
    Object? assignees = freezed,
    Object? relatedPersons = freezed,
    Object? subTasks = freezed,
    Object? attachments = freezed,
    Object? incidents = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      projectName: freezed == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentTaskId: freezed == parentTaskId
          ? _value.parentTaskId
          : parentTaskId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentTaskName: freezed == parentTaskName
          ? _value.parentTaskName
          : parentTaskName // ignore: cast_nullable_to_non_nullable
              as String?,
      taskName: freezed == taskName
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as String?,
      taskContent: freezed == taskContent
          ? _value.taskContent
          : taskContent // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      statusText: freezed == statusText
          ? _value.statusText
          : statusText // ignore: cast_nullable_to_non_nullable
              as String?,
      workType: freezed == workType
          ? _value.workType
          : workType // ignore: cast_nullable_to_non_nullable
              as int?,
      workTypeText: freezed == workTypeText
          ? _value.workTypeText
          : workTypeText // ignore: cast_nullable_to_non_nullable
              as String?,
      taskCategory: freezed == taskCategory
          ? _value.taskCategory
          : taskCategory // ignore: cast_nullable_to_non_nullable
              as int?,
      taskCategoryText: freezed == taskCategoryText
          ? _value.taskCategoryText
          : taskCategoryText // ignore: cast_nullable_to_non_nullable
              as String?,
      complexity: freezed == complexity
          ? _value.complexity
          : complexity // ignore: cast_nullable_to_non_nullable
              as int?,
      isPersonalTask: freezed == isPersonalTask
          ? _value.isPersonalTask
          : isPersonalTask // ignore: cast_nullable_to_non_nullable
              as bool?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actualStartDate: freezed == actualStartDate
          ? _value.actualStartDate
          : actualStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actualEndDate: freezed == actualEndDate
          ? _value.actualEndDate
          : actualEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      creatorId: freezed == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as int?,
      creatorName: freezed == creatorName
          ? _value.creatorName
          : creatorName // ignore: cast_nullable_to_non_nullable
              as String?,
      assigneeId: freezed == assigneeId
          ? _value.assigneeId
          : assigneeId // ignore: cast_nullable_to_non_nullable
              as int?,
      assigneeName: freezed == assigneeName
          ? _value.assigneeName
          : assigneeName // ignore: cast_nullable_to_non_nullable
              as String?,
      isCheckedIn: freezed == isCheckedIn
          ? _value.isCheckedIn
          : isCheckedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      checkInTime: freezed == checkInTime
          ? _value.checkInTime
          : checkInTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
      priorityText: freezed == priorityText
          ? _value.priorityText
          : priorityText // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String?,
      assignees: freezed == assignees
          ? _value.assignees
          : assignees // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      relatedPersons: freezed == relatedPersons
          ? _value.relatedPersons
          : relatedPersons // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      subTasks: freezed == subTasks
          ? _value.subTasks
          : subTasks // ignore: cast_nullable_to_non_nullable
              as List<WeekPlanSubTaskItem>?,
      attachments: freezed == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<WeekPlanAttachmentItem>?,
      incidents: freezed == incidents
          ? _value.incidents
          : incidents // ignore: cast_nullable_to_non_nullable
              as List<WeekPlanIncidentItem>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeekPlanTaskItemImplCopyWith<$Res>
    implements $WeekPlanTaskItemCopyWith<$Res> {
  factory _$$WeekPlanTaskItemImplCopyWith(_$WeekPlanTaskItemImpl value,
          $Res Function(_$WeekPlanTaskItemImpl) then) =
      __$$WeekPlanTaskItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
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
      @JsonKey(name: 'Incidents') List<WeekPlanIncidentItem>? incidents});
}

/// @nodoc
class __$$WeekPlanTaskItemImplCopyWithImpl<$Res>
    extends _$WeekPlanTaskItemCopyWithImpl<$Res, _$WeekPlanTaskItemImpl>
    implements _$$WeekPlanTaskItemImplCopyWith<$Res> {
  __$$WeekPlanTaskItemImplCopyWithImpl(_$WeekPlanTaskItemImpl _value,
      $Res Function(_$WeekPlanTaskItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? projectName = freezed,
    Object? projectId = freezed,
    Object? parentTaskId = freezed,
    Object? parentTaskName = freezed,
    Object? taskName = freezed,
    Object? taskContent = freezed,
    Object? description = freezed,
    Object? status = freezed,
    Object? statusText = freezed,
    Object? workType = freezed,
    Object? workTypeText = freezed,
    Object? taskCategory = freezed,
    Object? taskCategoryText = freezed,
    Object? complexity = freezed,
    Object? isPersonalTask = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? deadline = freezed,
    Object? actualStartDate = freezed,
    Object? actualEndDate = freezed,
    Object? creatorId = freezed,
    Object? creatorName = freezed,
    Object? assigneeId = freezed,
    Object? assigneeName = freezed,
    Object? isCheckedIn = freezed,
    Object? checkInTime = freezed,
    Object? priority = freezed,
    Object? priorityText = freezed,
    Object? progress = freezed,
    Object? createdDate = freezed,
    Object? result = freezed,
    Object? assignees = freezed,
    Object? relatedPersons = freezed,
    Object? subTasks = freezed,
    Object? attachments = freezed,
    Object? incidents = freezed,
  }) {
    return _then(_$WeekPlanTaskItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      projectName: freezed == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentTaskId: freezed == parentTaskId
          ? _value.parentTaskId
          : parentTaskId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentTaskName: freezed == parentTaskName
          ? _value.parentTaskName
          : parentTaskName // ignore: cast_nullable_to_non_nullable
              as String?,
      taskName: freezed == taskName
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as String?,
      taskContent: freezed == taskContent
          ? _value.taskContent
          : taskContent // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      statusText: freezed == statusText
          ? _value.statusText
          : statusText // ignore: cast_nullable_to_non_nullable
              as String?,
      workType: freezed == workType
          ? _value.workType
          : workType // ignore: cast_nullable_to_non_nullable
              as int?,
      workTypeText: freezed == workTypeText
          ? _value.workTypeText
          : workTypeText // ignore: cast_nullable_to_non_nullable
              as String?,
      taskCategory: freezed == taskCategory
          ? _value.taskCategory
          : taskCategory // ignore: cast_nullable_to_non_nullable
              as int?,
      taskCategoryText: freezed == taskCategoryText
          ? _value.taskCategoryText
          : taskCategoryText // ignore: cast_nullable_to_non_nullable
              as String?,
      complexity: freezed == complexity
          ? _value.complexity
          : complexity // ignore: cast_nullable_to_non_nullable
              as int?,
      isPersonalTask: freezed == isPersonalTask
          ? _value.isPersonalTask
          : isPersonalTask // ignore: cast_nullable_to_non_nullable
              as bool?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actualStartDate: freezed == actualStartDate
          ? _value.actualStartDate
          : actualStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actualEndDate: freezed == actualEndDate
          ? _value.actualEndDate
          : actualEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      creatorId: freezed == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as int?,
      creatorName: freezed == creatorName
          ? _value.creatorName
          : creatorName // ignore: cast_nullable_to_non_nullable
              as String?,
      assigneeId: freezed == assigneeId
          ? _value.assigneeId
          : assigneeId // ignore: cast_nullable_to_non_nullable
              as int?,
      assigneeName: freezed == assigneeName
          ? _value.assigneeName
          : assigneeName // ignore: cast_nullable_to_non_nullable
              as String?,
      isCheckedIn: freezed == isCheckedIn
          ? _value.isCheckedIn
          : isCheckedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      checkInTime: freezed == checkInTime
          ? _value.checkInTime
          : checkInTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
      priorityText: freezed == priorityText
          ? _value.priorityText
          : priorityText // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String?,
      assignees: freezed == assignees
          ? _value._assignees
          : assignees // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      relatedPersons: freezed == relatedPersons
          ? _value._relatedPersons
          : relatedPersons // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      subTasks: freezed == subTasks
          ? _value._subTasks
          : subTasks // ignore: cast_nullable_to_non_nullable
              as List<WeekPlanSubTaskItem>?,
      attachments: freezed == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<WeekPlanAttachmentItem>?,
      incidents: freezed == incidents
          ? _value._incidents
          : incidents // ignore: cast_nullable_to_non_nullable
              as List<WeekPlanIncidentItem>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeekPlanTaskItemImpl implements _WeekPlanTaskItem {
  const _$WeekPlanTaskItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'ProjectName') this.projectName,
      @JsonKey(name: 'ProjectId') this.projectId,
      @JsonKey(name: 'ParentTaskId') this.parentTaskId,
      @JsonKey(name: 'ParentTaskName') this.parentTaskName,
      @JsonKey(name: 'TaskName') this.taskName,
      @JsonKey(name: 'TaskContent') this.taskContent,
      @JsonKey(name: 'Description') this.description,
      @JsonKey(name: 'Status') this.status,
      @JsonKey(name: 'StatusText') this.statusText,
      @JsonKey(name: 'WorkType') this.workType,
      @JsonKey(name: 'WorkTypeText') this.workTypeText,
      @JsonKey(name: 'TaskCategory') this.taskCategory,
      @JsonKey(name: 'TaskCategoryText') this.taskCategoryText,
      @JsonKey(name: 'Complexity') this.complexity,
      @JsonKey(name: 'IsPersonalTask') this.isPersonalTask,
      @JsonKey(name: 'StartDate') this.startDate,
      @JsonKey(name: 'EndDate') this.endDate,
      @JsonKey(name: 'Deadline') this.deadline,
      @JsonKey(name: 'ActualStartDate') this.actualStartDate,
      @JsonKey(name: 'ActualEndDate') this.actualEndDate,
      @JsonKey(name: 'CreatorId') this.creatorId,
      @JsonKey(name: 'CreatorName') this.creatorName,
      @JsonKey(name: 'AssigneeId') this.assigneeId,
      @JsonKey(name: 'AssigneeName') this.assigneeName,
      @JsonKey(name: 'IsCheckedIn') this.isCheckedIn,
      @JsonKey(name: 'CheckInTime') this.checkInTime,
      @JsonKey(name: 'Priority') this.priority,
      @JsonKey(name: 'PriorityText') this.priorityText,
      @JsonKey(name: 'Progress') this.progress,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'Result') this.result,
      @JsonKey(name: 'Assignees') final List<int>? assignees,
      @JsonKey(name: 'RelatedPersons') final List<int>? relatedPersons,
      @JsonKey(name: 'SubTasks') final List<WeekPlanSubTaskItem>? subTasks,
      @JsonKey(name: 'Attachments')
      final List<WeekPlanAttachmentItem>? attachments,
      @JsonKey(name: 'Incidents') final List<WeekPlanIncidentItem>? incidents})
      : _assignees = assignees,
        _relatedPersons = relatedPersons,
        _subTasks = subTasks,
        _attachments = attachments,
        _incidents = incidents;

  factory _$WeekPlanTaskItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeekPlanTaskItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'ProjectName')
  final String? projectName;
  @override
  @JsonKey(name: 'ProjectId')
  final int? projectId;
  @override
  @JsonKey(name: 'ParentTaskId')
  final int? parentTaskId;
  @override
  @JsonKey(name: 'ParentTaskName')
  final String? parentTaskName;
  @override
  @JsonKey(name: 'TaskName')
  final String? taskName;
  @override
  @JsonKey(name: 'TaskContent')
  final String? taskContent;
  @override
  @JsonKey(name: 'Description')
  final String? description;
  @override
  @JsonKey(name: 'Status')
  final int? status;
  @override
  @JsonKey(name: 'StatusText')
  final String? statusText;
  @override
  @JsonKey(name: 'WorkType')
  final int? workType;
  @override
  @JsonKey(name: 'WorkTypeText')
  final String? workTypeText;
  @override
  @JsonKey(name: 'TaskCategory')
  final int? taskCategory;
  @override
  @JsonKey(name: 'TaskCategoryText')
  final String? taskCategoryText;
  @override
  @JsonKey(name: 'Complexity')
  final int? complexity;
  @override
  @JsonKey(name: 'IsPersonalTask')
  final bool? isPersonalTask;
  @override
  @JsonKey(name: 'StartDate')
  final DateTime? startDate;
  @override
  @JsonKey(name: 'EndDate')
  final DateTime? endDate;
  @override
  @JsonKey(name: 'Deadline')
  final DateTime? deadline;
  @override
  @JsonKey(name: 'ActualStartDate')
  final DateTime? actualStartDate;
  @override
  @JsonKey(name: 'ActualEndDate')
  final DateTime? actualEndDate;
  @override
  @JsonKey(name: 'CreatorId')
  final int? creatorId;
  @override
  @JsonKey(name: 'CreatorName')
  final String? creatorName;
  @override
  @JsonKey(name: 'AssigneeId')
  final int? assigneeId;
  @override
  @JsonKey(name: 'AssigneeName')
  final String? assigneeName;
  @override
  @JsonKey(name: 'IsCheckedIn')
  final bool? isCheckedIn;
  @override
  @JsonKey(name: 'CheckInTime')
  final DateTime? checkInTime;
  @override
  @JsonKey(name: 'Priority')
  final int? priority;
  @override
  @JsonKey(name: 'PriorityText')
  final String? priorityText;
  @override
  @JsonKey(name: 'Progress')
  final double? progress;
  @override
  @JsonKey(name: 'CreatedDate')
  final DateTime? createdDate;
  @override
  @JsonKey(name: 'Result')
  final String? result;
  final List<int>? _assignees;
  @override
  @JsonKey(name: 'Assignees')
  List<int>? get assignees {
    final value = _assignees;
    if (value == null) return null;
    if (_assignees is EqualUnmodifiableListView) return _assignees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _relatedPersons;
  @override
  @JsonKey(name: 'RelatedPersons')
  List<int>? get relatedPersons {
    final value = _relatedPersons;
    if (value == null) return null;
    if (_relatedPersons is EqualUnmodifiableListView) return _relatedPersons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<WeekPlanSubTaskItem>? _subTasks;
  @override
  @JsonKey(name: 'SubTasks')
  List<WeekPlanSubTaskItem>? get subTasks {
    final value = _subTasks;
    if (value == null) return null;
    if (_subTasks is EqualUnmodifiableListView) return _subTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<WeekPlanAttachmentItem>? _attachments;
  @override
  @JsonKey(name: 'Attachments')
  List<WeekPlanAttachmentItem>? get attachments {
    final value = _attachments;
    if (value == null) return null;
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<WeekPlanIncidentItem>? _incidents;
  @override
  @JsonKey(name: 'Incidents')
  List<WeekPlanIncidentItem>? get incidents {
    final value = _incidents;
    if (value == null) return null;
    if (_incidents is EqualUnmodifiableListView) return _incidents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WeekPlanTaskItem(id: $id, projectName: $projectName, projectId: $projectId, parentTaskId: $parentTaskId, parentTaskName: $parentTaskName, taskName: $taskName, taskContent: $taskContent, description: $description, status: $status, statusText: $statusText, workType: $workType, workTypeText: $workTypeText, taskCategory: $taskCategory, taskCategoryText: $taskCategoryText, complexity: $complexity, isPersonalTask: $isPersonalTask, startDate: $startDate, endDate: $endDate, deadline: $deadline, actualStartDate: $actualStartDate, actualEndDate: $actualEndDate, creatorId: $creatorId, creatorName: $creatorName, assigneeId: $assigneeId, assigneeName: $assigneeName, isCheckedIn: $isCheckedIn, checkInTime: $checkInTime, priority: $priority, priorityText: $priorityText, progress: $progress, createdDate: $createdDate, result: $result, assignees: $assignees, relatedPersons: $relatedPersons, subTasks: $subTasks, attachments: $attachments, incidents: $incidents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeekPlanTaskItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.parentTaskId, parentTaskId) ||
                other.parentTaskId == parentTaskId) &&
            (identical(other.parentTaskName, parentTaskName) ||
                other.parentTaskName == parentTaskName) &&
            (identical(other.taskName, taskName) ||
                other.taskName == taskName) &&
            (identical(other.taskContent, taskContent) ||
                other.taskContent == taskContent) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusText, statusText) ||
                other.statusText == statusText) &&
            (identical(other.workType, workType) ||
                other.workType == workType) &&
            (identical(other.workTypeText, workTypeText) ||
                other.workTypeText == workTypeText) &&
            (identical(other.taskCategory, taskCategory) ||
                other.taskCategory == taskCategory) &&
            (identical(other.taskCategoryText, taskCategoryText) ||
                other.taskCategoryText == taskCategoryText) &&
            (identical(other.complexity, complexity) ||
                other.complexity == complexity) &&
            (identical(other.isPersonalTask, isPersonalTask) ||
                other.isPersonalTask == isPersonalTask) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.actualStartDate, actualStartDate) ||
                other.actualStartDate == actualStartDate) &&
            (identical(other.actualEndDate, actualEndDate) ||
                other.actualEndDate == actualEndDate) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.creatorName, creatorName) ||
                other.creatorName == creatorName) &&
            (identical(other.assigneeId, assigneeId) ||
                other.assigneeId == assigneeId) &&
            (identical(other.assigneeName, assigneeName) ||
                other.assigneeName == assigneeName) &&
            (identical(other.isCheckedIn, isCheckedIn) ||
                other.isCheckedIn == isCheckedIn) &&
            (identical(other.checkInTime, checkInTime) ||
                other.checkInTime == checkInTime) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.priorityText, priorityText) ||
                other.priorityText == priorityText) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.result, result) || other.result == result) &&
            const DeepCollectionEquality()
                .equals(other._assignees, _assignees) &&
            const DeepCollectionEquality()
                .equals(other._relatedPersons, _relatedPersons) &&
            const DeepCollectionEquality().equals(other._subTasks, _subTasks) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            const DeepCollectionEquality()
                .equals(other._incidents, _incidents));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        projectName,
        projectId,
        parentTaskId,
        parentTaskName,
        taskName,
        taskContent,
        description,
        status,
        statusText,
        workType,
        workTypeText,
        taskCategory,
        taskCategoryText,
        complexity,
        isPersonalTask,
        startDate,
        endDate,
        deadline,
        actualStartDate,
        actualEndDate,
        creatorId,
        creatorName,
        assigneeId,
        assigneeName,
        isCheckedIn,
        checkInTime,
        priority,
        priorityText,
        progress,
        createdDate,
        result,
        const DeepCollectionEquality().hash(_assignees),
        const DeepCollectionEquality().hash(_relatedPersons),
        const DeepCollectionEquality().hash(_subTasks),
        const DeepCollectionEquality().hash(_attachments),
        const DeepCollectionEquality().hash(_incidents)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeekPlanTaskItemImplCopyWith<_$WeekPlanTaskItemImpl> get copyWith =>
      __$$WeekPlanTaskItemImplCopyWithImpl<_$WeekPlanTaskItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeekPlanTaskItemImplToJson(
      this,
    );
  }
}

abstract class _WeekPlanTaskItem implements WeekPlanTaskItem {
  const factory _WeekPlanTaskItem(
      {@JsonKey(name: 'ID') final int? id,
      @JsonKey(name: 'ProjectName') final String? projectName,
      @JsonKey(name: 'ProjectId') final int? projectId,
      @JsonKey(name: 'ParentTaskId') final int? parentTaskId,
      @JsonKey(name: 'ParentTaskName') final String? parentTaskName,
      @JsonKey(name: 'TaskName') final String? taskName,
      @JsonKey(name: 'TaskContent') final String? taskContent,
      @JsonKey(name: 'Description') final String? description,
      @JsonKey(name: 'Status') final int? status,
      @JsonKey(name: 'StatusText') final String? statusText,
      @JsonKey(name: 'WorkType') final int? workType,
      @JsonKey(name: 'WorkTypeText') final String? workTypeText,
      @JsonKey(name: 'TaskCategory') final int? taskCategory,
      @JsonKey(name: 'TaskCategoryText') final String? taskCategoryText,
      @JsonKey(name: 'Complexity') final int? complexity,
      @JsonKey(name: 'IsPersonalTask') final bool? isPersonalTask,
      @JsonKey(name: 'StartDate') final DateTime? startDate,
      @JsonKey(name: 'EndDate') final DateTime? endDate,
      @JsonKey(name: 'Deadline') final DateTime? deadline,
      @JsonKey(name: 'ActualStartDate') final DateTime? actualStartDate,
      @JsonKey(name: 'ActualEndDate') final DateTime? actualEndDate,
      @JsonKey(name: 'CreatorId') final int? creatorId,
      @JsonKey(name: 'CreatorName') final String? creatorName,
      @JsonKey(name: 'AssigneeId') final int? assigneeId,
      @JsonKey(name: 'AssigneeName') final String? assigneeName,
      @JsonKey(name: 'IsCheckedIn') final bool? isCheckedIn,
      @JsonKey(name: 'CheckInTime') final DateTime? checkInTime,
      @JsonKey(name: 'Priority') final int? priority,
      @JsonKey(name: 'PriorityText') final String? priorityText,
      @JsonKey(name: 'Progress') final double? progress,
      @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
      @JsonKey(name: 'Result') final String? result,
      @JsonKey(name: 'Assignees') final List<int>? assignees,
      @JsonKey(name: 'RelatedPersons') final List<int>? relatedPersons,
      @JsonKey(name: 'SubTasks') final List<WeekPlanSubTaskItem>? subTasks,
      @JsonKey(name: 'Attachments')
      final List<WeekPlanAttachmentItem>? attachments,
      @JsonKey(name: 'Incidents')
      final List<WeekPlanIncidentItem>? incidents}) = _$WeekPlanTaskItemImpl;

  factory _WeekPlanTaskItem.fromJson(Map<String, dynamic> json) =
      _$WeekPlanTaskItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'ProjectName')
  String? get projectName;
  @override
  @JsonKey(name: 'ProjectId')
  int? get projectId;
  @override
  @JsonKey(name: 'ParentTaskId')
  int? get parentTaskId;
  @override
  @JsonKey(name: 'ParentTaskName')
  String? get parentTaskName;
  @override
  @JsonKey(name: 'TaskName')
  String? get taskName;
  @override
  @JsonKey(name: 'TaskContent')
  String? get taskContent;
  @override
  @JsonKey(name: 'Description')
  String? get description;
  @override
  @JsonKey(name: 'Status')
  int? get status;
  @override
  @JsonKey(name: 'StatusText')
  String? get statusText;
  @override
  @JsonKey(name: 'WorkType')
  int? get workType;
  @override
  @JsonKey(name: 'WorkTypeText')
  String? get workTypeText;
  @override
  @JsonKey(name: 'TaskCategory')
  int? get taskCategory;
  @override
  @JsonKey(name: 'TaskCategoryText')
  String? get taskCategoryText;
  @override
  @JsonKey(name: 'Complexity')
  int? get complexity;
  @override
  @JsonKey(name: 'IsPersonalTask')
  bool? get isPersonalTask;
  @override
  @JsonKey(name: 'StartDate')
  DateTime? get startDate;
  @override
  @JsonKey(name: 'EndDate')
  DateTime? get endDate;
  @override
  @JsonKey(name: 'Deadline')
  DateTime? get deadline;
  @override
  @JsonKey(name: 'ActualStartDate')
  DateTime? get actualStartDate;
  @override
  @JsonKey(name: 'ActualEndDate')
  DateTime? get actualEndDate;
  @override
  @JsonKey(name: 'CreatorId')
  int? get creatorId;
  @override
  @JsonKey(name: 'CreatorName')
  String? get creatorName;
  @override
  @JsonKey(name: 'AssigneeId')
  int? get assigneeId;
  @override
  @JsonKey(name: 'AssigneeName')
  String? get assigneeName;
  @override
  @JsonKey(name: 'IsCheckedIn')
  bool? get isCheckedIn;
  @override
  @JsonKey(name: 'CheckInTime')
  DateTime? get checkInTime;
  @override
  @JsonKey(name: 'Priority')
  int? get priority;
  @override
  @JsonKey(name: 'PriorityText')
  String? get priorityText;
  @override
  @JsonKey(name: 'Progress')
  double? get progress;
  @override
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate;
  @override
  @JsonKey(name: 'Result')
  String? get result;
  @override
  @JsonKey(name: 'Assignees')
  List<int>? get assignees;
  @override
  @JsonKey(name: 'RelatedPersons')
  List<int>? get relatedPersons;
  @override
  @JsonKey(name: 'SubTasks')
  List<WeekPlanSubTaskItem>? get subTasks;
  @override
  @JsonKey(name: 'Attachments')
  List<WeekPlanAttachmentItem>? get attachments;
  @override
  @JsonKey(name: 'Incidents')
  List<WeekPlanIncidentItem>? get incidents;
  @override
  @JsonKey(ignore: true)
  _$$WeekPlanTaskItemImplCopyWith<_$WeekPlanTaskItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeekPlanSubTaskItem _$WeekPlanSubTaskItemFromJson(Map<String, dynamic> json) {
  return _WeekPlanSubTaskItem.fromJson(json);
}

/// @nodoc
mixin _$WeekPlanSubTaskItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Content')
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'StartDate')
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'EndDate')
  DateTime? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'AssigneeID')
  int? get assigneeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'AssigneeName')
  String? get assigneeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'AssignerID')
  int? get assignerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'AssignerName')
  String? get assignerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Complexity')
  int? get complexity => throw _privateConstructorUsedError;
  @JsonKey(name: 'WorkType')
  int? get workType => throw _privateConstructorUsedError;
  @JsonKey(name: 'WorkTypeName')
  String? get workTypeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaskCategory')
  int? get taskCategory => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaskCategoryName')
  String? get taskCategoryName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeekPlanSubTaskItemCopyWith<WeekPlanSubTaskItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeekPlanSubTaskItemCopyWith<$Res> {
  factory $WeekPlanSubTaskItemCopyWith(
          WeekPlanSubTaskItem value, $Res Function(WeekPlanSubTaskItem) then) =
      _$WeekPlanSubTaskItemCopyWithImpl<$Res, WeekPlanSubTaskItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
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
      @JsonKey(name: 'TaskCategoryName') String? taskCategoryName});
}

/// @nodoc
class _$WeekPlanSubTaskItemCopyWithImpl<$Res, $Val extends WeekPlanSubTaskItem>
    implements $WeekPlanSubTaskItemCopyWith<$Res> {
  _$WeekPlanSubTaskItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? content = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? assigneeId = freezed,
    Object? assigneeName = freezed,
    Object? assignerId = freezed,
    Object? assignerName = freezed,
    Object? complexity = freezed,
    Object? workType = freezed,
    Object? workTypeName = freezed,
    Object? taskCategory = freezed,
    Object? taskCategoryName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      assigneeId: freezed == assigneeId
          ? _value.assigneeId
          : assigneeId // ignore: cast_nullable_to_non_nullable
              as int?,
      assigneeName: freezed == assigneeName
          ? _value.assigneeName
          : assigneeName // ignore: cast_nullable_to_non_nullable
              as String?,
      assignerId: freezed == assignerId
          ? _value.assignerId
          : assignerId // ignore: cast_nullable_to_non_nullable
              as int?,
      assignerName: freezed == assignerName
          ? _value.assignerName
          : assignerName // ignore: cast_nullable_to_non_nullable
              as String?,
      complexity: freezed == complexity
          ? _value.complexity
          : complexity // ignore: cast_nullable_to_non_nullable
              as int?,
      workType: freezed == workType
          ? _value.workType
          : workType // ignore: cast_nullable_to_non_nullable
              as int?,
      workTypeName: freezed == workTypeName
          ? _value.workTypeName
          : workTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      taskCategory: freezed == taskCategory
          ? _value.taskCategory
          : taskCategory // ignore: cast_nullable_to_non_nullable
              as int?,
      taskCategoryName: freezed == taskCategoryName
          ? _value.taskCategoryName
          : taskCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeekPlanSubTaskItemImplCopyWith<$Res>
    implements $WeekPlanSubTaskItemCopyWith<$Res> {
  factory _$$WeekPlanSubTaskItemImplCopyWith(_$WeekPlanSubTaskItemImpl value,
          $Res Function(_$WeekPlanSubTaskItemImpl) then) =
      __$$WeekPlanSubTaskItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
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
      @JsonKey(name: 'TaskCategoryName') String? taskCategoryName});
}

/// @nodoc
class __$$WeekPlanSubTaskItemImplCopyWithImpl<$Res>
    extends _$WeekPlanSubTaskItemCopyWithImpl<$Res, _$WeekPlanSubTaskItemImpl>
    implements _$$WeekPlanSubTaskItemImplCopyWith<$Res> {
  __$$WeekPlanSubTaskItemImplCopyWithImpl(_$WeekPlanSubTaskItemImpl _value,
      $Res Function(_$WeekPlanSubTaskItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? content = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? assigneeId = freezed,
    Object? assigneeName = freezed,
    Object? assignerId = freezed,
    Object? assignerName = freezed,
    Object? complexity = freezed,
    Object? workType = freezed,
    Object? workTypeName = freezed,
    Object? taskCategory = freezed,
    Object? taskCategoryName = freezed,
  }) {
    return _then(_$WeekPlanSubTaskItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      assigneeId: freezed == assigneeId
          ? _value.assigneeId
          : assigneeId // ignore: cast_nullable_to_non_nullable
              as int?,
      assigneeName: freezed == assigneeName
          ? _value.assigneeName
          : assigneeName // ignore: cast_nullable_to_non_nullable
              as String?,
      assignerId: freezed == assignerId
          ? _value.assignerId
          : assignerId // ignore: cast_nullable_to_non_nullable
              as int?,
      assignerName: freezed == assignerName
          ? _value.assignerName
          : assignerName // ignore: cast_nullable_to_non_nullable
              as String?,
      complexity: freezed == complexity
          ? _value.complexity
          : complexity // ignore: cast_nullable_to_non_nullable
              as int?,
      workType: freezed == workType
          ? _value.workType
          : workType // ignore: cast_nullable_to_non_nullable
              as int?,
      workTypeName: freezed == workTypeName
          ? _value.workTypeName
          : workTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      taskCategory: freezed == taskCategory
          ? _value.taskCategory
          : taskCategory // ignore: cast_nullable_to_non_nullable
              as int?,
      taskCategoryName: freezed == taskCategoryName
          ? _value.taskCategoryName
          : taskCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeekPlanSubTaskItemImpl implements _WeekPlanSubTaskItem {
  const _$WeekPlanSubTaskItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Content') this.content,
      @JsonKey(name: 'StartDate') this.startDate,
      @JsonKey(name: 'EndDate') this.endDate,
      @JsonKey(name: 'AssigneeID') this.assigneeId,
      @JsonKey(name: 'AssigneeName') this.assigneeName,
      @JsonKey(name: 'AssignerID') this.assignerId,
      @JsonKey(name: 'AssignerName') this.assignerName,
      @JsonKey(name: 'Complexity') this.complexity,
      @JsonKey(name: 'WorkType') this.workType,
      @JsonKey(name: 'WorkTypeName') this.workTypeName,
      @JsonKey(name: 'TaskCategory') this.taskCategory,
      @JsonKey(name: 'TaskCategoryName') this.taskCategoryName});

  factory _$WeekPlanSubTaskItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeekPlanSubTaskItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'Content')
  final String? content;
  @override
  @JsonKey(name: 'StartDate')
  final DateTime? startDate;
  @override
  @JsonKey(name: 'EndDate')
  final DateTime? endDate;
  @override
  @JsonKey(name: 'AssigneeID')
  final int? assigneeId;
  @override
  @JsonKey(name: 'AssigneeName')
  final String? assigneeName;
  @override
  @JsonKey(name: 'AssignerID')
  final int? assignerId;
  @override
  @JsonKey(name: 'AssignerName')
  final String? assignerName;
  @override
  @JsonKey(name: 'Complexity')
  final int? complexity;
  @override
  @JsonKey(name: 'WorkType')
  final int? workType;
  @override
  @JsonKey(name: 'WorkTypeName')
  final String? workTypeName;
  @override
  @JsonKey(name: 'TaskCategory')
  final int? taskCategory;
  @override
  @JsonKey(name: 'TaskCategoryName')
  final String? taskCategoryName;

  @override
  String toString() {
    return 'WeekPlanSubTaskItem(id: $id, content: $content, startDate: $startDate, endDate: $endDate, assigneeId: $assigneeId, assigneeName: $assigneeName, assignerId: $assignerId, assignerName: $assignerName, complexity: $complexity, workType: $workType, workTypeName: $workTypeName, taskCategory: $taskCategory, taskCategoryName: $taskCategoryName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeekPlanSubTaskItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.assigneeId, assigneeId) ||
                other.assigneeId == assigneeId) &&
            (identical(other.assigneeName, assigneeName) ||
                other.assigneeName == assigneeName) &&
            (identical(other.assignerId, assignerId) ||
                other.assignerId == assignerId) &&
            (identical(other.assignerName, assignerName) ||
                other.assignerName == assignerName) &&
            (identical(other.complexity, complexity) ||
                other.complexity == complexity) &&
            (identical(other.workType, workType) ||
                other.workType == workType) &&
            (identical(other.workTypeName, workTypeName) ||
                other.workTypeName == workTypeName) &&
            (identical(other.taskCategory, taskCategory) ||
                other.taskCategory == taskCategory) &&
            (identical(other.taskCategoryName, taskCategoryName) ||
                other.taskCategoryName == taskCategoryName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      content,
      startDate,
      endDate,
      assigneeId,
      assigneeName,
      assignerId,
      assignerName,
      complexity,
      workType,
      workTypeName,
      taskCategory,
      taskCategoryName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeekPlanSubTaskItemImplCopyWith<_$WeekPlanSubTaskItemImpl> get copyWith =>
      __$$WeekPlanSubTaskItemImplCopyWithImpl<_$WeekPlanSubTaskItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeekPlanSubTaskItemImplToJson(
      this,
    );
  }
}

abstract class _WeekPlanSubTaskItem implements WeekPlanSubTaskItem {
  const factory _WeekPlanSubTaskItem(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'Content') final String? content,
          @JsonKey(name: 'StartDate') final DateTime? startDate,
          @JsonKey(name: 'EndDate') final DateTime? endDate,
          @JsonKey(name: 'AssigneeID') final int? assigneeId,
          @JsonKey(name: 'AssigneeName') final String? assigneeName,
          @JsonKey(name: 'AssignerID') final int? assignerId,
          @JsonKey(name: 'AssignerName') final String? assignerName,
          @JsonKey(name: 'Complexity') final int? complexity,
          @JsonKey(name: 'WorkType') final int? workType,
          @JsonKey(name: 'WorkTypeName') final String? workTypeName,
          @JsonKey(name: 'TaskCategory') final int? taskCategory,
          @JsonKey(name: 'TaskCategoryName') final String? taskCategoryName}) =
      _$WeekPlanSubTaskItemImpl;

  factory _WeekPlanSubTaskItem.fromJson(Map<String, dynamic> json) =
      _$WeekPlanSubTaskItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'Content')
  String? get content;
  @override
  @JsonKey(name: 'StartDate')
  DateTime? get startDate;
  @override
  @JsonKey(name: 'EndDate')
  DateTime? get endDate;
  @override
  @JsonKey(name: 'AssigneeID')
  int? get assigneeId;
  @override
  @JsonKey(name: 'AssigneeName')
  String? get assigneeName;
  @override
  @JsonKey(name: 'AssignerID')
  int? get assignerId;
  @override
  @JsonKey(name: 'AssignerName')
  String? get assignerName;
  @override
  @JsonKey(name: 'Complexity')
  int? get complexity;
  @override
  @JsonKey(name: 'WorkType')
  int? get workType;
  @override
  @JsonKey(name: 'WorkTypeName')
  String? get workTypeName;
  @override
  @JsonKey(name: 'TaskCategory')
  int? get taskCategory;
  @override
  @JsonKey(name: 'TaskCategoryName')
  String? get taskCategoryName;
  @override
  @JsonKey(ignore: true)
  _$$WeekPlanSubTaskItemImplCopyWith<_$WeekPlanSubTaskItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeekPlanAttachmentItem _$WeekPlanAttachmentItemFromJson(
    Map<String, dynamic> json) {
  return _WeekPlanAttachmentItem.fromJson(json);
}

/// @nodoc
mixin _$WeekPlanAttachmentItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'FileName')
  String? get fileName => throw _privateConstructorUsedError;
  @JsonKey(name: 'FilePath')
  String? get filePath => throw _privateConstructorUsedError;
  @JsonKey(name: 'FileSize')
  int? get fileSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'FileType')
  String? get fileType => throw _privateConstructorUsedError;
  @JsonKey(name: 'UploadedAt')
  DateTime? get uploadedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeekPlanAttachmentItemCopyWith<WeekPlanAttachmentItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeekPlanAttachmentItemCopyWith<$Res> {
  factory $WeekPlanAttachmentItemCopyWith(WeekPlanAttachmentItem value,
          $Res Function(WeekPlanAttachmentItem) then) =
      _$WeekPlanAttachmentItemCopyWithImpl<$Res, WeekPlanAttachmentItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'FileName') String? fileName,
      @JsonKey(name: 'FilePath') String? filePath,
      @JsonKey(name: 'FileSize') int? fileSize,
      @JsonKey(name: 'FileType') String? fileType,
      @JsonKey(name: 'UploadedAt') DateTime? uploadedAt});
}

/// @nodoc
class _$WeekPlanAttachmentItemCopyWithImpl<$Res,
        $Val extends WeekPlanAttachmentItem>
    implements $WeekPlanAttachmentItemCopyWith<$Res> {
  _$WeekPlanAttachmentItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fileName = freezed,
    Object? filePath = freezed,
    Object? fileSize = freezed,
    Object? fileType = freezed,
    Object? uploadedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      filePath: freezed == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
      fileSize: freezed == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int?,
      fileType: freezed == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedAt: freezed == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeekPlanAttachmentItemImplCopyWith<$Res>
    implements $WeekPlanAttachmentItemCopyWith<$Res> {
  factory _$$WeekPlanAttachmentItemImplCopyWith(
          _$WeekPlanAttachmentItemImpl value,
          $Res Function(_$WeekPlanAttachmentItemImpl) then) =
      __$$WeekPlanAttachmentItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'FileName') String? fileName,
      @JsonKey(name: 'FilePath') String? filePath,
      @JsonKey(name: 'FileSize') int? fileSize,
      @JsonKey(name: 'FileType') String? fileType,
      @JsonKey(name: 'UploadedAt') DateTime? uploadedAt});
}

/// @nodoc
class __$$WeekPlanAttachmentItemImplCopyWithImpl<$Res>
    extends _$WeekPlanAttachmentItemCopyWithImpl<$Res,
        _$WeekPlanAttachmentItemImpl>
    implements _$$WeekPlanAttachmentItemImplCopyWith<$Res> {
  __$$WeekPlanAttachmentItemImplCopyWithImpl(
      _$WeekPlanAttachmentItemImpl _value,
      $Res Function(_$WeekPlanAttachmentItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fileName = freezed,
    Object? filePath = freezed,
    Object? fileSize = freezed,
    Object? fileType = freezed,
    Object? uploadedAt = freezed,
  }) {
    return _then(_$WeekPlanAttachmentItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      filePath: freezed == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
      fileSize: freezed == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int?,
      fileType: freezed == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedAt: freezed == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeekPlanAttachmentItemImpl implements _WeekPlanAttachmentItem {
  const _$WeekPlanAttachmentItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'FileName') this.fileName,
      @JsonKey(name: 'FilePath') this.filePath,
      @JsonKey(name: 'FileSize') this.fileSize,
      @JsonKey(name: 'FileType') this.fileType,
      @JsonKey(name: 'UploadedAt') this.uploadedAt});

  factory _$WeekPlanAttachmentItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeekPlanAttachmentItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'FileName')
  final String? fileName;
  @override
  @JsonKey(name: 'FilePath')
  final String? filePath;
  @override
  @JsonKey(name: 'FileSize')
  final int? fileSize;
  @override
  @JsonKey(name: 'FileType')
  final String? fileType;
  @override
  @JsonKey(name: 'UploadedAt')
  final DateTime? uploadedAt;

  @override
  String toString() {
    return 'WeekPlanAttachmentItem(id: $id, fileName: $fileName, filePath: $filePath, fileSize: $fileSize, fileType: $fileType, uploadedAt: $uploadedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeekPlanAttachmentItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType) &&
            (identical(other.uploadedAt, uploadedAt) ||
                other.uploadedAt == uploadedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, fileName, filePath, fileSize, fileType, uploadedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeekPlanAttachmentItemImplCopyWith<_$WeekPlanAttachmentItemImpl>
      get copyWith => __$$WeekPlanAttachmentItemImplCopyWithImpl<
          _$WeekPlanAttachmentItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeekPlanAttachmentItemImplToJson(
      this,
    );
  }
}

abstract class _WeekPlanAttachmentItem implements WeekPlanAttachmentItem {
  const factory _WeekPlanAttachmentItem(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'FileName') final String? fileName,
          @JsonKey(name: 'FilePath') final String? filePath,
          @JsonKey(name: 'FileSize') final int? fileSize,
          @JsonKey(name: 'FileType') final String? fileType,
          @JsonKey(name: 'UploadedAt') final DateTime? uploadedAt}) =
      _$WeekPlanAttachmentItemImpl;

  factory _WeekPlanAttachmentItem.fromJson(Map<String, dynamic> json) =
      _$WeekPlanAttachmentItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'FileName')
  String? get fileName;
  @override
  @JsonKey(name: 'FilePath')
  String? get filePath;
  @override
  @JsonKey(name: 'FileSize')
  int? get fileSize;
  @override
  @JsonKey(name: 'FileType')
  String? get fileType;
  @override
  @JsonKey(name: 'UploadedAt')
  DateTime? get uploadedAt;
  @override
  @JsonKey(ignore: true)
  _$$WeekPlanAttachmentItemImplCopyWith<_$WeekPlanAttachmentItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WeekPlanIncidentItem _$WeekPlanIncidentItemFromJson(Map<String, dynamic> json) {
  return _WeekPlanIncidentItem.fromJson(json);
}

/// @nodoc
mixin _$WeekPlanIncidentItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'Type')
  int? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeName')
  String? get typeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Severity')
  int? get severity => throw _privateConstructorUsedError;
  @JsonKey(name: 'SeverityName')
  String? get severityName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReportedAt')
  DateTime? get reportedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeekPlanIncidentItemCopyWith<WeekPlanIncidentItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeekPlanIncidentItemCopyWith<$Res> {
  factory $WeekPlanIncidentItemCopyWith(WeekPlanIncidentItem value,
          $Res Function(WeekPlanIncidentItem) then) =
      _$WeekPlanIncidentItemCopyWithImpl<$Res, WeekPlanIncidentItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Description') String? description,
      @JsonKey(name: 'Type') int? type,
      @JsonKey(name: 'TypeName') String? typeName,
      @JsonKey(name: 'Severity') int? severity,
      @JsonKey(name: 'SeverityName') String? severityName,
      @JsonKey(name: 'ReportedAt') DateTime? reportedAt});
}

/// @nodoc
class _$WeekPlanIncidentItemCopyWithImpl<$Res,
        $Val extends WeekPlanIncidentItem>
    implements $WeekPlanIncidentItemCopyWith<$Res> {
  _$WeekPlanIncidentItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? type = freezed,
    Object? typeName = freezed,
    Object? severity = freezed,
    Object? severityName = freezed,
    Object? reportedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      typeName: freezed == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String?,
      severity: freezed == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as int?,
      severityName: freezed == severityName
          ? _value.severityName
          : severityName // ignore: cast_nullable_to_non_nullable
              as String?,
      reportedAt: freezed == reportedAt
          ? _value.reportedAt
          : reportedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeekPlanIncidentItemImplCopyWith<$Res>
    implements $WeekPlanIncidentItemCopyWith<$Res> {
  factory _$$WeekPlanIncidentItemImplCopyWith(_$WeekPlanIncidentItemImpl value,
          $Res Function(_$WeekPlanIncidentItemImpl) then) =
      __$$WeekPlanIncidentItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Description') String? description,
      @JsonKey(name: 'Type') int? type,
      @JsonKey(name: 'TypeName') String? typeName,
      @JsonKey(name: 'Severity') int? severity,
      @JsonKey(name: 'SeverityName') String? severityName,
      @JsonKey(name: 'ReportedAt') DateTime? reportedAt});
}

/// @nodoc
class __$$WeekPlanIncidentItemImplCopyWithImpl<$Res>
    extends _$WeekPlanIncidentItemCopyWithImpl<$Res, _$WeekPlanIncidentItemImpl>
    implements _$$WeekPlanIncidentItemImplCopyWith<$Res> {
  __$$WeekPlanIncidentItemImplCopyWithImpl(_$WeekPlanIncidentItemImpl _value,
      $Res Function(_$WeekPlanIncidentItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? type = freezed,
    Object? typeName = freezed,
    Object? severity = freezed,
    Object? severityName = freezed,
    Object? reportedAt = freezed,
  }) {
    return _then(_$WeekPlanIncidentItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      typeName: freezed == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String?,
      severity: freezed == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as int?,
      severityName: freezed == severityName
          ? _value.severityName
          : severityName // ignore: cast_nullable_to_non_nullable
              as String?,
      reportedAt: freezed == reportedAt
          ? _value.reportedAt
          : reportedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeekPlanIncidentItemImpl implements _WeekPlanIncidentItem {
  const _$WeekPlanIncidentItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Description') this.description,
      @JsonKey(name: 'Type') this.type,
      @JsonKey(name: 'TypeName') this.typeName,
      @JsonKey(name: 'Severity') this.severity,
      @JsonKey(name: 'SeverityName') this.severityName,
      @JsonKey(name: 'ReportedAt') this.reportedAt});

  factory _$WeekPlanIncidentItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeekPlanIncidentItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'Description')
  final String? description;
  @override
  @JsonKey(name: 'Type')
  final int? type;
  @override
  @JsonKey(name: 'TypeName')
  final String? typeName;
  @override
  @JsonKey(name: 'Severity')
  final int? severity;
  @override
  @JsonKey(name: 'SeverityName')
  final String? severityName;
  @override
  @JsonKey(name: 'ReportedAt')
  final DateTime? reportedAt;

  @override
  String toString() {
    return 'WeekPlanIncidentItem(id: $id, description: $description, type: $type, typeName: $typeName, severity: $severity, severityName: $severityName, reportedAt: $reportedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeekPlanIncidentItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.severityName, severityName) ||
                other.severityName == severityName) &&
            (identical(other.reportedAt, reportedAt) ||
                other.reportedAt == reportedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, description, type, typeName,
      severity, severityName, reportedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeekPlanIncidentItemImplCopyWith<_$WeekPlanIncidentItemImpl>
      get copyWith =>
          __$$WeekPlanIncidentItemImplCopyWithImpl<_$WeekPlanIncidentItemImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeekPlanIncidentItemImplToJson(
      this,
    );
  }
}

abstract class _WeekPlanIncidentItem implements WeekPlanIncidentItem {
  const factory _WeekPlanIncidentItem(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'Description') final String? description,
          @JsonKey(name: 'Type') final int? type,
          @JsonKey(name: 'TypeName') final String? typeName,
          @JsonKey(name: 'Severity') final int? severity,
          @JsonKey(name: 'SeverityName') final String? severityName,
          @JsonKey(name: 'ReportedAt') final DateTime? reportedAt}) =
      _$WeekPlanIncidentItemImpl;

  factory _WeekPlanIncidentItem.fromJson(Map<String, dynamic> json) =
      _$WeekPlanIncidentItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'Description')
  String? get description;
  @override
  @JsonKey(name: 'Type')
  int? get type;
  @override
  @JsonKey(name: 'TypeName')
  String? get typeName;
  @override
  @JsonKey(name: 'Severity')
  int? get severity;
  @override
  @JsonKey(name: 'SeverityName')
  String? get severityName;
  @override
  @JsonKey(name: 'ReportedAt')
  DateTime? get reportedAt;
  @override
  @JsonKey(ignore: true)
  _$$WeekPlanIncidentItemImplCopyWith<_$WeekPlanIncidentItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}
