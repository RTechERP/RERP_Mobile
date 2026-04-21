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
  @JsonKey(name: 'StartDate')
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'EndDate')
  DateTime? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'Deadline')
  DateTime? get deadline => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatorId')
  int? get creatorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatorName')
  String? get creatorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'AssigneeId')
  int? get assigneeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'AssigneeName')
  String? get assigneeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsCheckedIn')
  bool get isCheckedIn => throw _privateConstructorUsedError;
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
      @JsonKey(name: 'TaskName') String? taskName,
      @JsonKey(name: 'TaskContent') String? taskContent,
      @JsonKey(name: 'Description') String? description,
      @JsonKey(name: 'Status') int? status,
      @JsonKey(name: 'StatusText') String? statusText,
      @JsonKey(name: 'StartDate') DateTime? startDate,
      @JsonKey(name: 'EndDate') DateTime? endDate,
      @JsonKey(name: 'Deadline') DateTime? deadline,
      @JsonKey(name: 'CreatorId') int? creatorId,
      @JsonKey(name: 'CreatorName') String? creatorName,
      @JsonKey(name: 'AssigneeId') int? assigneeId,
      @JsonKey(name: 'AssigneeName') String? assigneeName,
      @JsonKey(name: 'IsCheckedIn') bool isCheckedIn,
      @JsonKey(name: 'CheckInTime') DateTime? checkInTime,
      @JsonKey(name: 'Priority') int? priority,
      @JsonKey(name: 'PriorityText') String? priorityText,
      @JsonKey(name: 'Progress') double? progress,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate});
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
    Object? taskName = freezed,
    Object? taskContent = freezed,
    Object? description = freezed,
    Object? status = freezed,
    Object? statusText = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? deadline = freezed,
    Object? creatorId = freezed,
    Object? creatorName = freezed,
    Object? assigneeId = freezed,
    Object? assigneeName = freezed,
    Object? isCheckedIn = null,
    Object? checkInTime = freezed,
    Object? priority = freezed,
    Object? priorityText = freezed,
    Object? progress = freezed,
    Object? createdDate = freezed,
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
      isCheckedIn: null == isCheckedIn
          ? _value.isCheckedIn
          : isCheckedIn // ignore: cast_nullable_to_non_nullable
              as bool,
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
      @JsonKey(name: 'TaskName') String? taskName,
      @JsonKey(name: 'TaskContent') String? taskContent,
      @JsonKey(name: 'Description') String? description,
      @JsonKey(name: 'Status') int? status,
      @JsonKey(name: 'StatusText') String? statusText,
      @JsonKey(name: 'StartDate') DateTime? startDate,
      @JsonKey(name: 'EndDate') DateTime? endDate,
      @JsonKey(name: 'Deadline') DateTime? deadline,
      @JsonKey(name: 'CreatorId') int? creatorId,
      @JsonKey(name: 'CreatorName') String? creatorName,
      @JsonKey(name: 'AssigneeId') int? assigneeId,
      @JsonKey(name: 'AssigneeName') String? assigneeName,
      @JsonKey(name: 'IsCheckedIn') bool isCheckedIn,
      @JsonKey(name: 'CheckInTime') DateTime? checkInTime,
      @JsonKey(name: 'Priority') int? priority,
      @JsonKey(name: 'PriorityText') String? priorityText,
      @JsonKey(name: 'Progress') double? progress,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate});
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
    Object? taskName = freezed,
    Object? taskContent = freezed,
    Object? description = freezed,
    Object? status = freezed,
    Object? statusText = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? deadline = freezed,
    Object? creatorId = freezed,
    Object? creatorName = freezed,
    Object? assigneeId = freezed,
    Object? assigneeName = freezed,
    Object? isCheckedIn = null,
    Object? checkInTime = freezed,
    Object? priority = freezed,
    Object? priorityText = freezed,
    Object? progress = freezed,
    Object? createdDate = freezed,
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
      isCheckedIn: null == isCheckedIn
          ? _value.isCheckedIn
          : isCheckedIn // ignore: cast_nullable_to_non_nullable
              as bool,
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
      @JsonKey(name: 'TaskName') this.taskName,
      @JsonKey(name: 'TaskContent') this.taskContent,
      @JsonKey(name: 'Description') this.description,
      @JsonKey(name: 'Status') this.status,
      @JsonKey(name: 'StatusText') this.statusText,
      @JsonKey(name: 'StartDate') this.startDate,
      @JsonKey(name: 'EndDate') this.endDate,
      @JsonKey(name: 'Deadline') this.deadline,
      @JsonKey(name: 'CreatorId') this.creatorId,
      @JsonKey(name: 'CreatorName') this.creatorName,
      @JsonKey(name: 'AssigneeId') this.assigneeId,
      @JsonKey(name: 'AssigneeName') this.assigneeName,
      @JsonKey(name: 'IsCheckedIn') this.isCheckedIn = false,
      @JsonKey(name: 'CheckInTime') this.checkInTime,
      @JsonKey(name: 'Priority') this.priority,
      @JsonKey(name: 'PriorityText') this.priorityText,
      @JsonKey(name: 'Progress') this.progress,
      @JsonKey(name: 'CreatedDate') this.createdDate});

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
  @JsonKey(name: 'StartDate')
  final DateTime? startDate;
  @override
  @JsonKey(name: 'EndDate')
  final DateTime? endDate;
  @override
  @JsonKey(name: 'Deadline')
  final DateTime? deadline;
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
  final bool isCheckedIn;
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
  String toString() {
    return 'WeekPlanTaskItem(id: $id, projectName: $projectName, projectId: $projectId, taskName: $taskName, taskContent: $taskContent, description: $description, status: $status, statusText: $statusText, startDate: $startDate, endDate: $endDate, deadline: $deadline, creatorId: $creatorId, creatorName: $creatorName, assigneeId: $assigneeId, assigneeName: $assigneeName, isCheckedIn: $isCheckedIn, checkInTime: $checkInTime, priority: $priority, priorityText: $priorityText, progress: $progress, createdDate: $createdDate)';
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
            (identical(other.taskName, taskName) ||
                other.taskName == taskName) &&
            (identical(other.taskContent, taskContent) ||
                other.taskContent == taskContent) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusText, statusText) ||
                other.statusText == statusText) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
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
                other.createdDate == createdDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        projectName,
        projectId,
        taskName,
        taskContent,
        description,
        status,
        statusText,
        startDate,
        endDate,
        deadline,
        creatorId,
        creatorName,
        assigneeId,
        assigneeName,
        isCheckedIn,
        checkInTime,
        priority,
        priorityText,
        progress,
        createdDate
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
          @JsonKey(name: 'TaskName') final String? taskName,
          @JsonKey(name: 'TaskContent') final String? taskContent,
          @JsonKey(name: 'Description') final String? description,
          @JsonKey(name: 'Status') final int? status,
          @JsonKey(name: 'StatusText') final String? statusText,
          @JsonKey(name: 'StartDate') final DateTime? startDate,
          @JsonKey(name: 'EndDate') final DateTime? endDate,
          @JsonKey(name: 'Deadline') final DateTime? deadline,
          @JsonKey(name: 'CreatorId') final int? creatorId,
          @JsonKey(name: 'CreatorName') final String? creatorName,
          @JsonKey(name: 'AssigneeId') final int? assigneeId,
          @JsonKey(name: 'AssigneeName') final String? assigneeName,
          @JsonKey(name: 'IsCheckedIn') final bool isCheckedIn,
          @JsonKey(name: 'CheckInTime') final DateTime? checkInTime,
          @JsonKey(name: 'Priority') final int? priority,
          @JsonKey(name: 'PriorityText') final String? priorityText,
          @JsonKey(name: 'Progress') final double? progress,
          @JsonKey(name: 'CreatedDate') final DateTime? createdDate}) =
      _$WeekPlanTaskItemImpl;

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
  @JsonKey(name: 'StartDate')
  DateTime? get startDate;
  @override
  @JsonKey(name: 'EndDate')
  DateTime? get endDate;
  @override
  @JsonKey(name: 'Deadline')
  DateTime? get deadline;
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
  bool get isCheckedIn;
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
  @JsonKey(ignore: true)
  _$$WeekPlanTaskItemImplCopyWith<_$WeekPlanTaskItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
