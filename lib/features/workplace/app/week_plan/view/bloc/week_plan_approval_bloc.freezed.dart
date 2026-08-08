// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'week_plan_approval_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WeekPlanApprovalEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int taskId) toggleSelectTask,
    required TResult Function() clearSelection,
    required TResult Function(int taskId, String? review, int? completionRating)
        approveTask,
    required TResult Function(int taskId, String reason) rejectTask,
    required TResult Function(
            List<int> taskIds, String? review, int? completionRating)
        bulkApproveTasks,
    required TResult Function(List<int> taskIds, String reason) bulkRejectTasks,
    required TResult Function() clearApprovalState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int taskId)? toggleSelectTask,
    TResult? Function()? clearSelection,
    TResult? Function(int taskId, String? review, int? completionRating)?
        approveTask,
    TResult? Function(int taskId, String reason)? rejectTask,
    TResult? Function(List<int> taskIds, String? review, int? completionRating)?
        bulkApproveTasks,
    TResult? Function(List<int> taskIds, String reason)? bulkRejectTasks,
    TResult? Function()? clearApprovalState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int taskId)? toggleSelectTask,
    TResult Function()? clearSelection,
    TResult Function(int taskId, String? review, int? completionRating)?
        approveTask,
    TResult Function(int taskId, String reason)? rejectTask,
    TResult Function(List<int> taskIds, String? review, int? completionRating)?
        bulkApproveTasks,
    TResult Function(List<int> taskIds, String reason)? bulkRejectTasks,
    TResult Function()? clearApprovalState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToggleSelectTask value) toggleSelectTask,
    required TResult Function(_ClearSelection value) clearSelection,
    required TResult Function(_ApproveTask value) approveTask,
    required TResult Function(_RejectTask value) rejectTask,
    required TResult Function(_BulkApproveTasks value) bulkApproveTasks,
    required TResult Function(_BulkRejectTasks value) bulkRejectTasks,
    required TResult Function(_ClearApprovalState value) clearApprovalState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ToggleSelectTask value)? toggleSelectTask,
    TResult? Function(_ClearSelection value)? clearSelection,
    TResult? Function(_ApproveTask value)? approveTask,
    TResult? Function(_RejectTask value)? rejectTask,
    TResult? Function(_BulkApproveTasks value)? bulkApproveTasks,
    TResult? Function(_BulkRejectTasks value)? bulkRejectTasks,
    TResult? Function(_ClearApprovalState value)? clearApprovalState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToggleSelectTask value)? toggleSelectTask,
    TResult Function(_ClearSelection value)? clearSelection,
    TResult Function(_ApproveTask value)? approveTask,
    TResult Function(_RejectTask value)? rejectTask,
    TResult Function(_BulkApproveTasks value)? bulkApproveTasks,
    TResult Function(_BulkRejectTasks value)? bulkRejectTasks,
    TResult Function(_ClearApprovalState value)? clearApprovalState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeekPlanApprovalEventCopyWith<$Res> {
  factory $WeekPlanApprovalEventCopyWith(WeekPlanApprovalEvent value,
          $Res Function(WeekPlanApprovalEvent) then) =
      _$WeekPlanApprovalEventCopyWithImpl<$Res, WeekPlanApprovalEvent>;
}

/// @nodoc
class _$WeekPlanApprovalEventCopyWithImpl<$Res,
        $Val extends WeekPlanApprovalEvent>
    implements $WeekPlanApprovalEventCopyWith<$Res> {
  _$WeekPlanApprovalEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ToggleSelectTaskImplCopyWith<$Res> {
  factory _$$ToggleSelectTaskImplCopyWith(_$ToggleSelectTaskImpl value,
          $Res Function(_$ToggleSelectTaskImpl) then) =
      __$$ToggleSelectTaskImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int taskId});
}

/// @nodoc
class __$$ToggleSelectTaskImplCopyWithImpl<$Res>
    extends _$WeekPlanApprovalEventCopyWithImpl<$Res, _$ToggleSelectTaskImpl>
    implements _$$ToggleSelectTaskImplCopyWith<$Res> {
  __$$ToggleSelectTaskImplCopyWithImpl(_$ToggleSelectTaskImpl _value,
      $Res Function(_$ToggleSelectTaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
  }) {
    return _then(_$ToggleSelectTaskImpl(
      null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ToggleSelectTaskImpl implements _ToggleSelectTask {
  const _$ToggleSelectTaskImpl(this.taskId);

  @override
  final int taskId;

  @override
  String toString() {
    return 'WeekPlanApprovalEvent.toggleSelectTask(taskId: $taskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleSelectTaskImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleSelectTaskImplCopyWith<_$ToggleSelectTaskImpl> get copyWith =>
      __$$ToggleSelectTaskImplCopyWithImpl<_$ToggleSelectTaskImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int taskId) toggleSelectTask,
    required TResult Function() clearSelection,
    required TResult Function(int taskId, String? review, int? completionRating)
        approveTask,
    required TResult Function(int taskId, String reason) rejectTask,
    required TResult Function(
            List<int> taskIds, String? review, int? completionRating)
        bulkApproveTasks,
    required TResult Function(List<int> taskIds, String reason) bulkRejectTasks,
    required TResult Function() clearApprovalState,
  }) {
    return toggleSelectTask(taskId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int taskId)? toggleSelectTask,
    TResult? Function()? clearSelection,
    TResult? Function(int taskId, String? review, int? completionRating)?
        approveTask,
    TResult? Function(int taskId, String reason)? rejectTask,
    TResult? Function(List<int> taskIds, String? review, int? completionRating)?
        bulkApproveTasks,
    TResult? Function(List<int> taskIds, String reason)? bulkRejectTasks,
    TResult? Function()? clearApprovalState,
  }) {
    return toggleSelectTask?.call(taskId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int taskId)? toggleSelectTask,
    TResult Function()? clearSelection,
    TResult Function(int taskId, String? review, int? completionRating)?
        approveTask,
    TResult Function(int taskId, String reason)? rejectTask,
    TResult Function(List<int> taskIds, String? review, int? completionRating)?
        bulkApproveTasks,
    TResult Function(List<int> taskIds, String reason)? bulkRejectTasks,
    TResult Function()? clearApprovalState,
    required TResult orElse(),
  }) {
    if (toggleSelectTask != null) {
      return toggleSelectTask(taskId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToggleSelectTask value) toggleSelectTask,
    required TResult Function(_ClearSelection value) clearSelection,
    required TResult Function(_ApproveTask value) approveTask,
    required TResult Function(_RejectTask value) rejectTask,
    required TResult Function(_BulkApproveTasks value) bulkApproveTasks,
    required TResult Function(_BulkRejectTasks value) bulkRejectTasks,
    required TResult Function(_ClearApprovalState value) clearApprovalState,
  }) {
    return toggleSelectTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ToggleSelectTask value)? toggleSelectTask,
    TResult? Function(_ClearSelection value)? clearSelection,
    TResult? Function(_ApproveTask value)? approveTask,
    TResult? Function(_RejectTask value)? rejectTask,
    TResult? Function(_BulkApproveTasks value)? bulkApproveTasks,
    TResult? Function(_BulkRejectTasks value)? bulkRejectTasks,
    TResult? Function(_ClearApprovalState value)? clearApprovalState,
  }) {
    return toggleSelectTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToggleSelectTask value)? toggleSelectTask,
    TResult Function(_ClearSelection value)? clearSelection,
    TResult Function(_ApproveTask value)? approveTask,
    TResult Function(_RejectTask value)? rejectTask,
    TResult Function(_BulkApproveTasks value)? bulkApproveTasks,
    TResult Function(_BulkRejectTasks value)? bulkRejectTasks,
    TResult Function(_ClearApprovalState value)? clearApprovalState,
    required TResult orElse(),
  }) {
    if (toggleSelectTask != null) {
      return toggleSelectTask(this);
    }
    return orElse();
  }
}

abstract class _ToggleSelectTask implements WeekPlanApprovalEvent {
  const factory _ToggleSelectTask(final int taskId) = _$ToggleSelectTaskImpl;

  int get taskId;
  @JsonKey(ignore: true)
  _$$ToggleSelectTaskImplCopyWith<_$ToggleSelectTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearSelectionImplCopyWith<$Res> {
  factory _$$ClearSelectionImplCopyWith(_$ClearSelectionImpl value,
          $Res Function(_$ClearSelectionImpl) then) =
      __$$ClearSelectionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSelectionImplCopyWithImpl<$Res>
    extends _$WeekPlanApprovalEventCopyWithImpl<$Res, _$ClearSelectionImpl>
    implements _$$ClearSelectionImplCopyWith<$Res> {
  __$$ClearSelectionImplCopyWithImpl(
      _$ClearSelectionImpl _value, $Res Function(_$ClearSelectionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearSelectionImpl implements _ClearSelection {
  const _$ClearSelectionImpl();

  @override
  String toString() {
    return 'WeekPlanApprovalEvent.clearSelection()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearSelectionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int taskId) toggleSelectTask,
    required TResult Function() clearSelection,
    required TResult Function(int taskId, String? review, int? completionRating)
        approveTask,
    required TResult Function(int taskId, String reason) rejectTask,
    required TResult Function(
            List<int> taskIds, String? review, int? completionRating)
        bulkApproveTasks,
    required TResult Function(List<int> taskIds, String reason) bulkRejectTasks,
    required TResult Function() clearApprovalState,
  }) {
    return clearSelection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int taskId)? toggleSelectTask,
    TResult? Function()? clearSelection,
    TResult? Function(int taskId, String? review, int? completionRating)?
        approveTask,
    TResult? Function(int taskId, String reason)? rejectTask,
    TResult? Function(List<int> taskIds, String? review, int? completionRating)?
        bulkApproveTasks,
    TResult? Function(List<int> taskIds, String reason)? bulkRejectTasks,
    TResult? Function()? clearApprovalState,
  }) {
    return clearSelection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int taskId)? toggleSelectTask,
    TResult Function()? clearSelection,
    TResult Function(int taskId, String? review, int? completionRating)?
        approveTask,
    TResult Function(int taskId, String reason)? rejectTask,
    TResult Function(List<int> taskIds, String? review, int? completionRating)?
        bulkApproveTasks,
    TResult Function(List<int> taskIds, String reason)? bulkRejectTasks,
    TResult Function()? clearApprovalState,
    required TResult orElse(),
  }) {
    if (clearSelection != null) {
      return clearSelection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToggleSelectTask value) toggleSelectTask,
    required TResult Function(_ClearSelection value) clearSelection,
    required TResult Function(_ApproveTask value) approveTask,
    required TResult Function(_RejectTask value) rejectTask,
    required TResult Function(_BulkApproveTasks value) bulkApproveTasks,
    required TResult Function(_BulkRejectTasks value) bulkRejectTasks,
    required TResult Function(_ClearApprovalState value) clearApprovalState,
  }) {
    return clearSelection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ToggleSelectTask value)? toggleSelectTask,
    TResult? Function(_ClearSelection value)? clearSelection,
    TResult? Function(_ApproveTask value)? approveTask,
    TResult? Function(_RejectTask value)? rejectTask,
    TResult? Function(_BulkApproveTasks value)? bulkApproveTasks,
    TResult? Function(_BulkRejectTasks value)? bulkRejectTasks,
    TResult? Function(_ClearApprovalState value)? clearApprovalState,
  }) {
    return clearSelection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToggleSelectTask value)? toggleSelectTask,
    TResult Function(_ClearSelection value)? clearSelection,
    TResult Function(_ApproveTask value)? approveTask,
    TResult Function(_RejectTask value)? rejectTask,
    TResult Function(_BulkApproveTasks value)? bulkApproveTasks,
    TResult Function(_BulkRejectTasks value)? bulkRejectTasks,
    TResult Function(_ClearApprovalState value)? clearApprovalState,
    required TResult orElse(),
  }) {
    if (clearSelection != null) {
      return clearSelection(this);
    }
    return orElse();
  }
}

abstract class _ClearSelection implements WeekPlanApprovalEvent {
  const factory _ClearSelection() = _$ClearSelectionImpl;
}

/// @nodoc
abstract class _$$ApproveTaskImplCopyWith<$Res> {
  factory _$$ApproveTaskImplCopyWith(
          _$ApproveTaskImpl value, $Res Function(_$ApproveTaskImpl) then) =
      __$$ApproveTaskImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int taskId, String? review, int? completionRating});
}

/// @nodoc
class __$$ApproveTaskImplCopyWithImpl<$Res>
    extends _$WeekPlanApprovalEventCopyWithImpl<$Res, _$ApproveTaskImpl>
    implements _$$ApproveTaskImplCopyWith<$Res> {
  __$$ApproveTaskImplCopyWithImpl(
      _$ApproveTaskImpl _value, $Res Function(_$ApproveTaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? review = freezed,
    Object? completionRating = freezed,
  }) {
    return _then(_$ApproveTaskImpl(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as int,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
      completionRating: freezed == completionRating
          ? _value.completionRating
          : completionRating // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$ApproveTaskImpl implements _ApproveTask {
  const _$ApproveTaskImpl(
      {required this.taskId, this.review, this.completionRating});

  @override
  final int taskId;
  @override
  final String? review;
  @override
  final int? completionRating;

  @override
  String toString() {
    return 'WeekPlanApprovalEvent.approveTask(taskId: $taskId, review: $review, completionRating: $completionRating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveTaskImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.completionRating, completionRating) ||
                other.completionRating == completionRating));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, taskId, review, completionRating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveTaskImplCopyWith<_$ApproveTaskImpl> get copyWith =>
      __$$ApproveTaskImplCopyWithImpl<_$ApproveTaskImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int taskId) toggleSelectTask,
    required TResult Function() clearSelection,
    required TResult Function(int taskId, String? review, int? completionRating)
        approveTask,
    required TResult Function(int taskId, String reason) rejectTask,
    required TResult Function(
            List<int> taskIds, String? review, int? completionRating)
        bulkApproveTasks,
    required TResult Function(List<int> taskIds, String reason) bulkRejectTasks,
    required TResult Function() clearApprovalState,
  }) {
    return approveTask(taskId, review, completionRating);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int taskId)? toggleSelectTask,
    TResult? Function()? clearSelection,
    TResult? Function(int taskId, String? review, int? completionRating)?
        approveTask,
    TResult? Function(int taskId, String reason)? rejectTask,
    TResult? Function(List<int> taskIds, String? review, int? completionRating)?
        bulkApproveTasks,
    TResult? Function(List<int> taskIds, String reason)? bulkRejectTasks,
    TResult? Function()? clearApprovalState,
  }) {
    return approveTask?.call(taskId, review, completionRating);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int taskId)? toggleSelectTask,
    TResult Function()? clearSelection,
    TResult Function(int taskId, String? review, int? completionRating)?
        approveTask,
    TResult Function(int taskId, String reason)? rejectTask,
    TResult Function(List<int> taskIds, String? review, int? completionRating)?
        bulkApproveTasks,
    TResult Function(List<int> taskIds, String reason)? bulkRejectTasks,
    TResult Function()? clearApprovalState,
    required TResult orElse(),
  }) {
    if (approveTask != null) {
      return approveTask(taskId, review, completionRating);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToggleSelectTask value) toggleSelectTask,
    required TResult Function(_ClearSelection value) clearSelection,
    required TResult Function(_ApproveTask value) approveTask,
    required TResult Function(_RejectTask value) rejectTask,
    required TResult Function(_BulkApproveTasks value) bulkApproveTasks,
    required TResult Function(_BulkRejectTasks value) bulkRejectTasks,
    required TResult Function(_ClearApprovalState value) clearApprovalState,
  }) {
    return approveTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ToggleSelectTask value)? toggleSelectTask,
    TResult? Function(_ClearSelection value)? clearSelection,
    TResult? Function(_ApproveTask value)? approveTask,
    TResult? Function(_RejectTask value)? rejectTask,
    TResult? Function(_BulkApproveTasks value)? bulkApproveTasks,
    TResult? Function(_BulkRejectTasks value)? bulkRejectTasks,
    TResult? Function(_ClearApprovalState value)? clearApprovalState,
  }) {
    return approveTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToggleSelectTask value)? toggleSelectTask,
    TResult Function(_ClearSelection value)? clearSelection,
    TResult Function(_ApproveTask value)? approveTask,
    TResult Function(_RejectTask value)? rejectTask,
    TResult Function(_BulkApproveTasks value)? bulkApproveTasks,
    TResult Function(_BulkRejectTasks value)? bulkRejectTasks,
    TResult Function(_ClearApprovalState value)? clearApprovalState,
    required TResult orElse(),
  }) {
    if (approveTask != null) {
      return approveTask(this);
    }
    return orElse();
  }
}

abstract class _ApproveTask implements WeekPlanApprovalEvent {
  const factory _ApproveTask(
      {required final int taskId,
      final String? review,
      final int? completionRating}) = _$ApproveTaskImpl;

  int get taskId;
  String? get review;
  int? get completionRating;
  @JsonKey(ignore: true)
  _$$ApproveTaskImplCopyWith<_$ApproveTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RejectTaskImplCopyWith<$Res> {
  factory _$$RejectTaskImplCopyWith(
          _$RejectTaskImpl value, $Res Function(_$RejectTaskImpl) then) =
      __$$RejectTaskImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int taskId, String reason});
}

/// @nodoc
class __$$RejectTaskImplCopyWithImpl<$Res>
    extends _$WeekPlanApprovalEventCopyWithImpl<$Res, _$RejectTaskImpl>
    implements _$$RejectTaskImplCopyWith<$Res> {
  __$$RejectTaskImplCopyWithImpl(
      _$RejectTaskImpl _value, $Res Function(_$RejectTaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? reason = null,
  }) {
    return _then(_$RejectTaskImpl(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RejectTaskImpl implements _RejectTask {
  const _$RejectTaskImpl({required this.taskId, required this.reason});

  @override
  final int taskId;
  @override
  final String reason;

  @override
  String toString() {
    return 'WeekPlanApprovalEvent.rejectTask(taskId: $taskId, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RejectTaskImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RejectTaskImplCopyWith<_$RejectTaskImpl> get copyWith =>
      __$$RejectTaskImplCopyWithImpl<_$RejectTaskImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int taskId) toggleSelectTask,
    required TResult Function() clearSelection,
    required TResult Function(int taskId, String? review, int? completionRating)
        approveTask,
    required TResult Function(int taskId, String reason) rejectTask,
    required TResult Function(
            List<int> taskIds, String? review, int? completionRating)
        bulkApproveTasks,
    required TResult Function(List<int> taskIds, String reason) bulkRejectTasks,
    required TResult Function() clearApprovalState,
  }) {
    return rejectTask(taskId, reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int taskId)? toggleSelectTask,
    TResult? Function()? clearSelection,
    TResult? Function(int taskId, String? review, int? completionRating)?
        approveTask,
    TResult? Function(int taskId, String reason)? rejectTask,
    TResult? Function(List<int> taskIds, String? review, int? completionRating)?
        bulkApproveTasks,
    TResult? Function(List<int> taskIds, String reason)? bulkRejectTasks,
    TResult? Function()? clearApprovalState,
  }) {
    return rejectTask?.call(taskId, reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int taskId)? toggleSelectTask,
    TResult Function()? clearSelection,
    TResult Function(int taskId, String? review, int? completionRating)?
        approveTask,
    TResult Function(int taskId, String reason)? rejectTask,
    TResult Function(List<int> taskIds, String? review, int? completionRating)?
        bulkApproveTasks,
    TResult Function(List<int> taskIds, String reason)? bulkRejectTasks,
    TResult Function()? clearApprovalState,
    required TResult orElse(),
  }) {
    if (rejectTask != null) {
      return rejectTask(taskId, reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToggleSelectTask value) toggleSelectTask,
    required TResult Function(_ClearSelection value) clearSelection,
    required TResult Function(_ApproveTask value) approveTask,
    required TResult Function(_RejectTask value) rejectTask,
    required TResult Function(_BulkApproveTasks value) bulkApproveTasks,
    required TResult Function(_BulkRejectTasks value) bulkRejectTasks,
    required TResult Function(_ClearApprovalState value) clearApprovalState,
  }) {
    return rejectTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ToggleSelectTask value)? toggleSelectTask,
    TResult? Function(_ClearSelection value)? clearSelection,
    TResult? Function(_ApproveTask value)? approveTask,
    TResult? Function(_RejectTask value)? rejectTask,
    TResult? Function(_BulkApproveTasks value)? bulkApproveTasks,
    TResult? Function(_BulkRejectTasks value)? bulkRejectTasks,
    TResult? Function(_ClearApprovalState value)? clearApprovalState,
  }) {
    return rejectTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToggleSelectTask value)? toggleSelectTask,
    TResult Function(_ClearSelection value)? clearSelection,
    TResult Function(_ApproveTask value)? approveTask,
    TResult Function(_RejectTask value)? rejectTask,
    TResult Function(_BulkApproveTasks value)? bulkApproveTasks,
    TResult Function(_BulkRejectTasks value)? bulkRejectTasks,
    TResult Function(_ClearApprovalState value)? clearApprovalState,
    required TResult orElse(),
  }) {
    if (rejectTask != null) {
      return rejectTask(this);
    }
    return orElse();
  }
}

abstract class _RejectTask implements WeekPlanApprovalEvent {
  const factory _RejectTask(
      {required final int taskId,
      required final String reason}) = _$RejectTaskImpl;

  int get taskId;
  String get reason;
  @JsonKey(ignore: true)
  _$$RejectTaskImplCopyWith<_$RejectTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BulkApproveTasksImplCopyWith<$Res> {
  factory _$$BulkApproveTasksImplCopyWith(_$BulkApproveTasksImpl value,
          $Res Function(_$BulkApproveTasksImpl) then) =
      __$$BulkApproveTasksImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<int> taskIds, String? review, int? completionRating});
}

/// @nodoc
class __$$BulkApproveTasksImplCopyWithImpl<$Res>
    extends _$WeekPlanApprovalEventCopyWithImpl<$Res, _$BulkApproveTasksImpl>
    implements _$$BulkApproveTasksImplCopyWith<$Res> {
  __$$BulkApproveTasksImplCopyWithImpl(_$BulkApproveTasksImpl _value,
      $Res Function(_$BulkApproveTasksImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskIds = null,
    Object? review = freezed,
    Object? completionRating = freezed,
  }) {
    return _then(_$BulkApproveTasksImpl(
      taskIds: null == taskIds
          ? _value._taskIds
          : taskIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
      completionRating: freezed == completionRating
          ? _value.completionRating
          : completionRating // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$BulkApproveTasksImpl implements _BulkApproveTasks {
  const _$BulkApproveTasksImpl(
      {required final List<int> taskIds, this.review, this.completionRating})
      : _taskIds = taskIds;

  final List<int> _taskIds;
  @override
  List<int> get taskIds {
    if (_taskIds is EqualUnmodifiableListView) return _taskIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_taskIds);
  }

  @override
  final String? review;
  @override
  final int? completionRating;

  @override
  String toString() {
    return 'WeekPlanApprovalEvent.bulkApproveTasks(taskIds: $taskIds, review: $review, completionRating: $completionRating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BulkApproveTasksImpl &&
            const DeepCollectionEquality().equals(other._taskIds, _taskIds) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.completionRating, completionRating) ||
                other.completionRating == completionRating));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_taskIds), review, completionRating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BulkApproveTasksImplCopyWith<_$BulkApproveTasksImpl> get copyWith =>
      __$$BulkApproveTasksImplCopyWithImpl<_$BulkApproveTasksImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int taskId) toggleSelectTask,
    required TResult Function() clearSelection,
    required TResult Function(int taskId, String? review, int? completionRating)
        approveTask,
    required TResult Function(int taskId, String reason) rejectTask,
    required TResult Function(
            List<int> taskIds, String? review, int? completionRating)
        bulkApproveTasks,
    required TResult Function(List<int> taskIds, String reason) bulkRejectTasks,
    required TResult Function() clearApprovalState,
  }) {
    return bulkApproveTasks(taskIds, review, completionRating);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int taskId)? toggleSelectTask,
    TResult? Function()? clearSelection,
    TResult? Function(int taskId, String? review, int? completionRating)?
        approveTask,
    TResult? Function(int taskId, String reason)? rejectTask,
    TResult? Function(List<int> taskIds, String? review, int? completionRating)?
        bulkApproveTasks,
    TResult? Function(List<int> taskIds, String reason)? bulkRejectTasks,
    TResult? Function()? clearApprovalState,
  }) {
    return bulkApproveTasks?.call(taskIds, review, completionRating);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int taskId)? toggleSelectTask,
    TResult Function()? clearSelection,
    TResult Function(int taskId, String? review, int? completionRating)?
        approveTask,
    TResult Function(int taskId, String reason)? rejectTask,
    TResult Function(List<int> taskIds, String? review, int? completionRating)?
        bulkApproveTasks,
    TResult Function(List<int> taskIds, String reason)? bulkRejectTasks,
    TResult Function()? clearApprovalState,
    required TResult orElse(),
  }) {
    if (bulkApproveTasks != null) {
      return bulkApproveTasks(taskIds, review, completionRating);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToggleSelectTask value) toggleSelectTask,
    required TResult Function(_ClearSelection value) clearSelection,
    required TResult Function(_ApproveTask value) approveTask,
    required TResult Function(_RejectTask value) rejectTask,
    required TResult Function(_BulkApproveTasks value) bulkApproveTasks,
    required TResult Function(_BulkRejectTasks value) bulkRejectTasks,
    required TResult Function(_ClearApprovalState value) clearApprovalState,
  }) {
    return bulkApproveTasks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ToggleSelectTask value)? toggleSelectTask,
    TResult? Function(_ClearSelection value)? clearSelection,
    TResult? Function(_ApproveTask value)? approveTask,
    TResult? Function(_RejectTask value)? rejectTask,
    TResult? Function(_BulkApproveTasks value)? bulkApproveTasks,
    TResult? Function(_BulkRejectTasks value)? bulkRejectTasks,
    TResult? Function(_ClearApprovalState value)? clearApprovalState,
  }) {
    return bulkApproveTasks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToggleSelectTask value)? toggleSelectTask,
    TResult Function(_ClearSelection value)? clearSelection,
    TResult Function(_ApproveTask value)? approveTask,
    TResult Function(_RejectTask value)? rejectTask,
    TResult Function(_BulkApproveTasks value)? bulkApproveTasks,
    TResult Function(_BulkRejectTasks value)? bulkRejectTasks,
    TResult Function(_ClearApprovalState value)? clearApprovalState,
    required TResult orElse(),
  }) {
    if (bulkApproveTasks != null) {
      return bulkApproveTasks(this);
    }
    return orElse();
  }
}

abstract class _BulkApproveTasks implements WeekPlanApprovalEvent {
  const factory _BulkApproveTasks(
      {required final List<int> taskIds,
      final String? review,
      final int? completionRating}) = _$BulkApproveTasksImpl;

  List<int> get taskIds;
  String? get review;
  int? get completionRating;
  @JsonKey(ignore: true)
  _$$BulkApproveTasksImplCopyWith<_$BulkApproveTasksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BulkRejectTasksImplCopyWith<$Res> {
  factory _$$BulkRejectTasksImplCopyWith(_$BulkRejectTasksImpl value,
          $Res Function(_$BulkRejectTasksImpl) then) =
      __$$BulkRejectTasksImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<int> taskIds, String reason});
}

/// @nodoc
class __$$BulkRejectTasksImplCopyWithImpl<$Res>
    extends _$WeekPlanApprovalEventCopyWithImpl<$Res, _$BulkRejectTasksImpl>
    implements _$$BulkRejectTasksImplCopyWith<$Res> {
  __$$BulkRejectTasksImplCopyWithImpl(
      _$BulkRejectTasksImpl _value, $Res Function(_$BulkRejectTasksImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskIds = null,
    Object? reason = null,
  }) {
    return _then(_$BulkRejectTasksImpl(
      taskIds: null == taskIds
          ? _value._taskIds
          : taskIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BulkRejectTasksImpl implements _BulkRejectTasks {
  const _$BulkRejectTasksImpl(
      {required final List<int> taskIds, required this.reason})
      : _taskIds = taskIds;

  final List<int> _taskIds;
  @override
  List<int> get taskIds {
    if (_taskIds is EqualUnmodifiableListView) return _taskIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_taskIds);
  }

  @override
  final String reason;

  @override
  String toString() {
    return 'WeekPlanApprovalEvent.bulkRejectTasks(taskIds: $taskIds, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BulkRejectTasksImpl &&
            const DeepCollectionEquality().equals(other._taskIds, _taskIds) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_taskIds), reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BulkRejectTasksImplCopyWith<_$BulkRejectTasksImpl> get copyWith =>
      __$$BulkRejectTasksImplCopyWithImpl<_$BulkRejectTasksImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int taskId) toggleSelectTask,
    required TResult Function() clearSelection,
    required TResult Function(int taskId, String? review, int? completionRating)
        approveTask,
    required TResult Function(int taskId, String reason) rejectTask,
    required TResult Function(
            List<int> taskIds, String? review, int? completionRating)
        bulkApproveTasks,
    required TResult Function(List<int> taskIds, String reason) bulkRejectTasks,
    required TResult Function() clearApprovalState,
  }) {
    return bulkRejectTasks(taskIds, reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int taskId)? toggleSelectTask,
    TResult? Function()? clearSelection,
    TResult? Function(int taskId, String? review, int? completionRating)?
        approveTask,
    TResult? Function(int taskId, String reason)? rejectTask,
    TResult? Function(List<int> taskIds, String? review, int? completionRating)?
        bulkApproveTasks,
    TResult? Function(List<int> taskIds, String reason)? bulkRejectTasks,
    TResult? Function()? clearApprovalState,
  }) {
    return bulkRejectTasks?.call(taskIds, reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int taskId)? toggleSelectTask,
    TResult Function()? clearSelection,
    TResult Function(int taskId, String? review, int? completionRating)?
        approveTask,
    TResult Function(int taskId, String reason)? rejectTask,
    TResult Function(List<int> taskIds, String? review, int? completionRating)?
        bulkApproveTasks,
    TResult Function(List<int> taskIds, String reason)? bulkRejectTasks,
    TResult Function()? clearApprovalState,
    required TResult orElse(),
  }) {
    if (bulkRejectTasks != null) {
      return bulkRejectTasks(taskIds, reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToggleSelectTask value) toggleSelectTask,
    required TResult Function(_ClearSelection value) clearSelection,
    required TResult Function(_ApproveTask value) approveTask,
    required TResult Function(_RejectTask value) rejectTask,
    required TResult Function(_BulkApproveTasks value) bulkApproveTasks,
    required TResult Function(_BulkRejectTasks value) bulkRejectTasks,
    required TResult Function(_ClearApprovalState value) clearApprovalState,
  }) {
    return bulkRejectTasks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ToggleSelectTask value)? toggleSelectTask,
    TResult? Function(_ClearSelection value)? clearSelection,
    TResult? Function(_ApproveTask value)? approveTask,
    TResult? Function(_RejectTask value)? rejectTask,
    TResult? Function(_BulkApproveTasks value)? bulkApproveTasks,
    TResult? Function(_BulkRejectTasks value)? bulkRejectTasks,
    TResult? Function(_ClearApprovalState value)? clearApprovalState,
  }) {
    return bulkRejectTasks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToggleSelectTask value)? toggleSelectTask,
    TResult Function(_ClearSelection value)? clearSelection,
    TResult Function(_ApproveTask value)? approveTask,
    TResult Function(_RejectTask value)? rejectTask,
    TResult Function(_BulkApproveTasks value)? bulkApproveTasks,
    TResult Function(_BulkRejectTasks value)? bulkRejectTasks,
    TResult Function(_ClearApprovalState value)? clearApprovalState,
    required TResult orElse(),
  }) {
    if (bulkRejectTasks != null) {
      return bulkRejectTasks(this);
    }
    return orElse();
  }
}

abstract class _BulkRejectTasks implements WeekPlanApprovalEvent {
  const factory _BulkRejectTasks(
      {required final List<int> taskIds,
      required final String reason}) = _$BulkRejectTasksImpl;

  List<int> get taskIds;
  String get reason;
  @JsonKey(ignore: true)
  _$$BulkRejectTasksImplCopyWith<_$BulkRejectTasksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearApprovalStateImplCopyWith<$Res> {
  factory _$$ClearApprovalStateImplCopyWith(_$ClearApprovalStateImpl value,
          $Res Function(_$ClearApprovalStateImpl) then) =
      __$$ClearApprovalStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearApprovalStateImplCopyWithImpl<$Res>
    extends _$WeekPlanApprovalEventCopyWithImpl<$Res, _$ClearApprovalStateImpl>
    implements _$$ClearApprovalStateImplCopyWith<$Res> {
  __$$ClearApprovalStateImplCopyWithImpl(_$ClearApprovalStateImpl _value,
      $Res Function(_$ClearApprovalStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearApprovalStateImpl implements _ClearApprovalState {
  const _$ClearApprovalStateImpl();

  @override
  String toString() {
    return 'WeekPlanApprovalEvent.clearApprovalState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearApprovalStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int taskId) toggleSelectTask,
    required TResult Function() clearSelection,
    required TResult Function(int taskId, String? review, int? completionRating)
        approveTask,
    required TResult Function(int taskId, String reason) rejectTask,
    required TResult Function(
            List<int> taskIds, String? review, int? completionRating)
        bulkApproveTasks,
    required TResult Function(List<int> taskIds, String reason) bulkRejectTasks,
    required TResult Function() clearApprovalState,
  }) {
    return clearApprovalState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int taskId)? toggleSelectTask,
    TResult? Function()? clearSelection,
    TResult? Function(int taskId, String? review, int? completionRating)?
        approveTask,
    TResult? Function(int taskId, String reason)? rejectTask,
    TResult? Function(List<int> taskIds, String? review, int? completionRating)?
        bulkApproveTasks,
    TResult? Function(List<int> taskIds, String reason)? bulkRejectTasks,
    TResult? Function()? clearApprovalState,
  }) {
    return clearApprovalState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int taskId)? toggleSelectTask,
    TResult Function()? clearSelection,
    TResult Function(int taskId, String? review, int? completionRating)?
        approveTask,
    TResult Function(int taskId, String reason)? rejectTask,
    TResult Function(List<int> taskIds, String? review, int? completionRating)?
        bulkApproveTasks,
    TResult Function(List<int> taskIds, String reason)? bulkRejectTasks,
    TResult Function()? clearApprovalState,
    required TResult orElse(),
  }) {
    if (clearApprovalState != null) {
      return clearApprovalState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToggleSelectTask value) toggleSelectTask,
    required TResult Function(_ClearSelection value) clearSelection,
    required TResult Function(_ApproveTask value) approveTask,
    required TResult Function(_RejectTask value) rejectTask,
    required TResult Function(_BulkApproveTasks value) bulkApproveTasks,
    required TResult Function(_BulkRejectTasks value) bulkRejectTasks,
    required TResult Function(_ClearApprovalState value) clearApprovalState,
  }) {
    return clearApprovalState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ToggleSelectTask value)? toggleSelectTask,
    TResult? Function(_ClearSelection value)? clearSelection,
    TResult? Function(_ApproveTask value)? approveTask,
    TResult? Function(_RejectTask value)? rejectTask,
    TResult? Function(_BulkApproveTasks value)? bulkApproveTasks,
    TResult? Function(_BulkRejectTasks value)? bulkRejectTasks,
    TResult? Function(_ClearApprovalState value)? clearApprovalState,
  }) {
    return clearApprovalState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToggleSelectTask value)? toggleSelectTask,
    TResult Function(_ClearSelection value)? clearSelection,
    TResult Function(_ApproveTask value)? approveTask,
    TResult Function(_RejectTask value)? rejectTask,
    TResult Function(_BulkApproveTasks value)? bulkApproveTasks,
    TResult Function(_BulkRejectTasks value)? bulkRejectTasks,
    TResult Function(_ClearApprovalState value)? clearApprovalState,
    required TResult orElse(),
  }) {
    if (clearApprovalState != null) {
      return clearApprovalState(this);
    }
    return orElse();
  }
}

abstract class _ClearApprovalState implements WeekPlanApprovalEvent {
  const factory _ClearApprovalState() = _$ClearApprovalStateImpl;
}
