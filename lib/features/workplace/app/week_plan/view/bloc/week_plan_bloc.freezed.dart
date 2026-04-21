// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'week_plan_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WeekPlanEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(String status) filterByStatus,
    required TResult Function() clearStatusFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearDateFilter,
    required TResult Function(int taskId) checkIn,
    required TResult Function() initAdd,
    required TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)
        createTask,
    required TResult Function() clearSubmitState,
    required TResult Function(int projectId, String projectName)
        updateHeaderProject,
    required TResult Function(int parentTaskId, String parentTaskName)
        updateHeaderParentTask,
    required TResult Function(bool isPersonal) updateHeaderPersonalTask,
    required TResult Function(int complexity) updateHeaderComplexity,
    required TResult Function(int categoryId, String categoryName)
        updateHeaderTaskCategory,
    required TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)
        updateHeaderWorkTypeAndStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(String status)? filterByStatus,
    TResult? Function()? clearStatusFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearDateFilter,
    TResult? Function(int taskId)? checkIn,
    TResult? Function()? initAdd,
    TResult? Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult? Function()? clearSubmitState,
    TResult? Function(int projectId, String projectName)? updateHeaderProject,
    TResult? Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult? Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult? Function(int complexity)? updateHeaderComplexity,
    TResult? Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult? Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(String status)? filterByStatus,
    TResult Function()? clearStatusFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearDateFilter,
    TResult Function(int taskId)? checkIn,
    TResult Function()? initAdd,
    TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult Function()? clearSubmitState,
    TResult Function(int projectId, String projectName)? updateHeaderProject,
    TResult Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult Function(int complexity)? updateHeaderComplexity,
    TResult Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearStatusFilter value) clearStatusFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearDateFilter value) clearDateFilter,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_CreateTask value) createTask,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_UpdateHeaderProject value) updateHeaderProject,
    required TResult Function(_UpdateHeaderParentTask value)
        updateHeaderParentTask,
    required TResult Function(_UpdateHeaderPersonalTask value)
        updateHeaderPersonalTask,
    required TResult Function(_UpdateHeaderComplexity value)
        updateHeaderComplexity,
    required TResult Function(_UpdateHeaderTaskCategory value)
        updateHeaderTaskCategory,
    required TResult Function(_UpdateHeaderWorkTypeAndStatus value)
        updateHeaderWorkTypeAndStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearDateFilter value)? clearDateFilter,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult? Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult? Function(_UpdateHeaderPersonalTask value)?
        updateHeaderPersonalTask,
    TResult? Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult? Function(_UpdateHeaderTaskCategory value)?
        updateHeaderTaskCategory,
    TResult? Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearDateFilter value)? clearDateFilter,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult Function(_UpdateHeaderPersonalTask value)? updateHeaderPersonalTask,
    TResult Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult Function(_UpdateHeaderTaskCategory value)? updateHeaderTaskCategory,
    TResult Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeekPlanEventCopyWith<$Res> {
  factory $WeekPlanEventCopyWith(
          WeekPlanEvent value, $Res Function(WeekPlanEvent) then) =
      _$WeekPlanEventCopyWithImpl<$Res, WeekPlanEvent>;
}

/// @nodoc
class _$WeekPlanEventCopyWithImpl<$Res, $Val extends WeekPlanEvent>
    implements $WeekPlanEventCopyWith<$Res> {
  _$WeekPlanEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitImplCopyWith<$Res> {
  factory _$$InitImplCopyWith(
          _$InitImpl value, $Res Function(_$InitImpl) then) =
      __$$InitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitImplCopyWithImpl<$Res>
    extends _$WeekPlanEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl implements _Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'WeekPlanEvent.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(String status) filterByStatus,
    required TResult Function() clearStatusFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearDateFilter,
    required TResult Function(int taskId) checkIn,
    required TResult Function() initAdd,
    required TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)
        createTask,
    required TResult Function() clearSubmitState,
    required TResult Function(int projectId, String projectName)
        updateHeaderProject,
    required TResult Function(int parentTaskId, String parentTaskName)
        updateHeaderParentTask,
    required TResult Function(bool isPersonal) updateHeaderPersonalTask,
    required TResult Function(int complexity) updateHeaderComplexity,
    required TResult Function(int categoryId, String categoryName)
        updateHeaderTaskCategory,
    required TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)
        updateHeaderWorkTypeAndStatus,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(String status)? filterByStatus,
    TResult? Function()? clearStatusFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearDateFilter,
    TResult? Function(int taskId)? checkIn,
    TResult? Function()? initAdd,
    TResult? Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult? Function()? clearSubmitState,
    TResult? Function(int projectId, String projectName)? updateHeaderProject,
    TResult? Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult? Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult? Function(int complexity)? updateHeaderComplexity,
    TResult? Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult? Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(String status)? filterByStatus,
    TResult Function()? clearStatusFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearDateFilter,
    TResult Function(int taskId)? checkIn,
    TResult Function()? initAdd,
    TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult Function()? clearSubmitState,
    TResult Function(int projectId, String projectName)? updateHeaderProject,
    TResult Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult Function(int complexity)? updateHeaderComplexity,
    TResult Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearStatusFilter value) clearStatusFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearDateFilter value) clearDateFilter,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_CreateTask value) createTask,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_UpdateHeaderProject value) updateHeaderProject,
    required TResult Function(_UpdateHeaderParentTask value)
        updateHeaderParentTask,
    required TResult Function(_UpdateHeaderPersonalTask value)
        updateHeaderPersonalTask,
    required TResult Function(_UpdateHeaderComplexity value)
        updateHeaderComplexity,
    required TResult Function(_UpdateHeaderTaskCategory value)
        updateHeaderTaskCategory,
    required TResult Function(_UpdateHeaderWorkTypeAndStatus value)
        updateHeaderWorkTypeAndStatus,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearDateFilter value)? clearDateFilter,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult? Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult? Function(_UpdateHeaderPersonalTask value)?
        updateHeaderPersonalTask,
    TResult? Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult? Function(_UpdateHeaderTaskCategory value)?
        updateHeaderTaskCategory,
    TResult? Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearDateFilter value)? clearDateFilter,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult Function(_UpdateHeaderPersonalTask value)? updateHeaderPersonalTask,
    TResult Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult Function(_UpdateHeaderTaskCategory value)? updateHeaderTaskCategory,
    TResult Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements WeekPlanEvent {
  const factory _Init() = _$InitImpl;
}

/// @nodoc
abstract class _$$RefreshImplCopyWith<$Res> {
  factory _$$RefreshImplCopyWith(
          _$RefreshImpl value, $Res Function(_$RefreshImpl) then) =
      __$$RefreshImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshImplCopyWithImpl<$Res>
    extends _$WeekPlanEventCopyWithImpl<$Res, _$RefreshImpl>
    implements _$$RefreshImplCopyWith<$Res> {
  __$$RefreshImplCopyWithImpl(
      _$RefreshImpl _value, $Res Function(_$RefreshImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RefreshImpl implements _Refresh {
  const _$RefreshImpl();

  @override
  String toString() {
    return 'WeekPlanEvent.refresh()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(String status) filterByStatus,
    required TResult Function() clearStatusFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearDateFilter,
    required TResult Function(int taskId) checkIn,
    required TResult Function() initAdd,
    required TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)
        createTask,
    required TResult Function() clearSubmitState,
    required TResult Function(int projectId, String projectName)
        updateHeaderProject,
    required TResult Function(int parentTaskId, String parentTaskName)
        updateHeaderParentTask,
    required TResult Function(bool isPersonal) updateHeaderPersonalTask,
    required TResult Function(int complexity) updateHeaderComplexity,
    required TResult Function(int categoryId, String categoryName)
        updateHeaderTaskCategory,
    required TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)
        updateHeaderWorkTypeAndStatus,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(String status)? filterByStatus,
    TResult? Function()? clearStatusFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearDateFilter,
    TResult? Function(int taskId)? checkIn,
    TResult? Function()? initAdd,
    TResult? Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult? Function()? clearSubmitState,
    TResult? Function(int projectId, String projectName)? updateHeaderProject,
    TResult? Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult? Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult? Function(int complexity)? updateHeaderComplexity,
    TResult? Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult? Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(String status)? filterByStatus,
    TResult Function()? clearStatusFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearDateFilter,
    TResult Function(int taskId)? checkIn,
    TResult Function()? initAdd,
    TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult Function()? clearSubmitState,
    TResult Function(int projectId, String projectName)? updateHeaderProject,
    TResult Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult Function(int complexity)? updateHeaderComplexity,
    TResult Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearStatusFilter value) clearStatusFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearDateFilter value) clearDateFilter,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_CreateTask value) createTask,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_UpdateHeaderProject value) updateHeaderProject,
    required TResult Function(_UpdateHeaderParentTask value)
        updateHeaderParentTask,
    required TResult Function(_UpdateHeaderPersonalTask value)
        updateHeaderPersonalTask,
    required TResult Function(_UpdateHeaderComplexity value)
        updateHeaderComplexity,
    required TResult Function(_UpdateHeaderTaskCategory value)
        updateHeaderTaskCategory,
    required TResult Function(_UpdateHeaderWorkTypeAndStatus value)
        updateHeaderWorkTypeAndStatus,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearDateFilter value)? clearDateFilter,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult? Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult? Function(_UpdateHeaderPersonalTask value)?
        updateHeaderPersonalTask,
    TResult? Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult? Function(_UpdateHeaderTaskCategory value)?
        updateHeaderTaskCategory,
    TResult? Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearDateFilter value)? clearDateFilter,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult Function(_UpdateHeaderPersonalTask value)? updateHeaderPersonalTask,
    TResult Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult Function(_UpdateHeaderTaskCategory value)? updateHeaderTaskCategory,
    TResult Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements WeekPlanEvent {
  const factory _Refresh() = _$RefreshImpl;
}

/// @nodoc
abstract class _$$SearchImplCopyWith<$Res> {
  factory _$$SearchImplCopyWith(
          _$SearchImpl value, $Res Function(_$SearchImpl) then) =
      __$$SearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String keyword});
}

/// @nodoc
class __$$SearchImplCopyWithImpl<$Res>
    extends _$WeekPlanEventCopyWithImpl<$Res, _$SearchImpl>
    implements _$$SearchImplCopyWith<$Res> {
  __$$SearchImplCopyWithImpl(
      _$SearchImpl _value, $Res Function(_$SearchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
  }) {
    return _then(_$SearchImpl(
      null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchImpl implements _Search {
  const _$SearchImpl(this.keyword);

  @override
  final String keyword;

  @override
  String toString() {
    return 'WeekPlanEvent.search(keyword: $keyword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchImpl &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keyword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      __$$SearchImplCopyWithImpl<_$SearchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(String status) filterByStatus,
    required TResult Function() clearStatusFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearDateFilter,
    required TResult Function(int taskId) checkIn,
    required TResult Function() initAdd,
    required TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)
        createTask,
    required TResult Function() clearSubmitState,
    required TResult Function(int projectId, String projectName)
        updateHeaderProject,
    required TResult Function(int parentTaskId, String parentTaskName)
        updateHeaderParentTask,
    required TResult Function(bool isPersonal) updateHeaderPersonalTask,
    required TResult Function(int complexity) updateHeaderComplexity,
    required TResult Function(int categoryId, String categoryName)
        updateHeaderTaskCategory,
    required TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)
        updateHeaderWorkTypeAndStatus,
  }) {
    return search(keyword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(String status)? filterByStatus,
    TResult? Function()? clearStatusFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearDateFilter,
    TResult? Function(int taskId)? checkIn,
    TResult? Function()? initAdd,
    TResult? Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult? Function()? clearSubmitState,
    TResult? Function(int projectId, String projectName)? updateHeaderProject,
    TResult? Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult? Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult? Function(int complexity)? updateHeaderComplexity,
    TResult? Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult? Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return search?.call(keyword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(String status)? filterByStatus,
    TResult Function()? clearStatusFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearDateFilter,
    TResult Function(int taskId)? checkIn,
    TResult Function()? initAdd,
    TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult Function()? clearSubmitState,
    TResult Function(int projectId, String projectName)? updateHeaderProject,
    TResult Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult Function(int complexity)? updateHeaderComplexity,
    TResult Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(keyword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearStatusFilter value) clearStatusFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearDateFilter value) clearDateFilter,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_CreateTask value) createTask,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_UpdateHeaderProject value) updateHeaderProject,
    required TResult Function(_UpdateHeaderParentTask value)
        updateHeaderParentTask,
    required TResult Function(_UpdateHeaderPersonalTask value)
        updateHeaderPersonalTask,
    required TResult Function(_UpdateHeaderComplexity value)
        updateHeaderComplexity,
    required TResult Function(_UpdateHeaderTaskCategory value)
        updateHeaderTaskCategory,
    required TResult Function(_UpdateHeaderWorkTypeAndStatus value)
        updateHeaderWorkTypeAndStatus,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearDateFilter value)? clearDateFilter,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult? Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult? Function(_UpdateHeaderPersonalTask value)?
        updateHeaderPersonalTask,
    TResult? Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult? Function(_UpdateHeaderTaskCategory value)?
        updateHeaderTaskCategory,
    TResult? Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearDateFilter value)? clearDateFilter,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult Function(_UpdateHeaderPersonalTask value)? updateHeaderPersonalTask,
    TResult Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult Function(_UpdateHeaderTaskCategory value)? updateHeaderTaskCategory,
    TResult Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class _Search implements WeekPlanEvent {
  const factory _Search(final String keyword) = _$SearchImpl;

  String get keyword;
  @JsonKey(ignore: true)
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearSearchImplCopyWith<$Res> {
  factory _$$ClearSearchImplCopyWith(
          _$ClearSearchImpl value, $Res Function(_$ClearSearchImpl) then) =
      __$$ClearSearchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSearchImplCopyWithImpl<$Res>
    extends _$WeekPlanEventCopyWithImpl<$Res, _$ClearSearchImpl>
    implements _$$ClearSearchImplCopyWith<$Res> {
  __$$ClearSearchImplCopyWithImpl(
      _$ClearSearchImpl _value, $Res Function(_$ClearSearchImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearSearchImpl implements _ClearSearch {
  const _$ClearSearchImpl();

  @override
  String toString() {
    return 'WeekPlanEvent.clearSearch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearSearchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(String status) filterByStatus,
    required TResult Function() clearStatusFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearDateFilter,
    required TResult Function(int taskId) checkIn,
    required TResult Function() initAdd,
    required TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)
        createTask,
    required TResult Function() clearSubmitState,
    required TResult Function(int projectId, String projectName)
        updateHeaderProject,
    required TResult Function(int parentTaskId, String parentTaskName)
        updateHeaderParentTask,
    required TResult Function(bool isPersonal) updateHeaderPersonalTask,
    required TResult Function(int complexity) updateHeaderComplexity,
    required TResult Function(int categoryId, String categoryName)
        updateHeaderTaskCategory,
    required TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)
        updateHeaderWorkTypeAndStatus,
  }) {
    return clearSearch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(String status)? filterByStatus,
    TResult? Function()? clearStatusFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearDateFilter,
    TResult? Function(int taskId)? checkIn,
    TResult? Function()? initAdd,
    TResult? Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult? Function()? clearSubmitState,
    TResult? Function(int projectId, String projectName)? updateHeaderProject,
    TResult? Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult? Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult? Function(int complexity)? updateHeaderComplexity,
    TResult? Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult? Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return clearSearch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(String status)? filterByStatus,
    TResult Function()? clearStatusFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearDateFilter,
    TResult Function(int taskId)? checkIn,
    TResult Function()? initAdd,
    TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult Function()? clearSubmitState,
    TResult Function(int projectId, String projectName)? updateHeaderProject,
    TResult Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult Function(int complexity)? updateHeaderComplexity,
    TResult Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (clearSearch != null) {
      return clearSearch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearStatusFilter value) clearStatusFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearDateFilter value) clearDateFilter,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_CreateTask value) createTask,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_UpdateHeaderProject value) updateHeaderProject,
    required TResult Function(_UpdateHeaderParentTask value)
        updateHeaderParentTask,
    required TResult Function(_UpdateHeaderPersonalTask value)
        updateHeaderPersonalTask,
    required TResult Function(_UpdateHeaderComplexity value)
        updateHeaderComplexity,
    required TResult Function(_UpdateHeaderTaskCategory value)
        updateHeaderTaskCategory,
    required TResult Function(_UpdateHeaderWorkTypeAndStatus value)
        updateHeaderWorkTypeAndStatus,
  }) {
    return clearSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearDateFilter value)? clearDateFilter,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult? Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult? Function(_UpdateHeaderPersonalTask value)?
        updateHeaderPersonalTask,
    TResult? Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult? Function(_UpdateHeaderTaskCategory value)?
        updateHeaderTaskCategory,
    TResult? Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return clearSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearDateFilter value)? clearDateFilter,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult Function(_UpdateHeaderPersonalTask value)? updateHeaderPersonalTask,
    TResult Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult Function(_UpdateHeaderTaskCategory value)? updateHeaderTaskCategory,
    TResult Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (clearSearch != null) {
      return clearSearch(this);
    }
    return orElse();
  }
}

abstract class _ClearSearch implements WeekPlanEvent {
  const factory _ClearSearch() = _$ClearSearchImpl;
}

/// @nodoc
abstract class _$$FilterByStatusImplCopyWith<$Res> {
  factory _$$FilterByStatusImplCopyWith(_$FilterByStatusImpl value,
          $Res Function(_$FilterByStatusImpl) then) =
      __$$FilterByStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String status});
}

/// @nodoc
class __$$FilterByStatusImplCopyWithImpl<$Res>
    extends _$WeekPlanEventCopyWithImpl<$Res, _$FilterByStatusImpl>
    implements _$$FilterByStatusImplCopyWith<$Res> {
  __$$FilterByStatusImplCopyWithImpl(
      _$FilterByStatusImpl _value, $Res Function(_$FilterByStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$FilterByStatusImpl(
      null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FilterByStatusImpl implements _FilterByStatus {
  const _$FilterByStatusImpl(this.status);

  @override
  final String status;

  @override
  String toString() {
    return 'WeekPlanEvent.filterByStatus(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterByStatusImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterByStatusImplCopyWith<_$FilterByStatusImpl> get copyWith =>
      __$$FilterByStatusImplCopyWithImpl<_$FilterByStatusImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(String status) filterByStatus,
    required TResult Function() clearStatusFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearDateFilter,
    required TResult Function(int taskId) checkIn,
    required TResult Function() initAdd,
    required TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)
        createTask,
    required TResult Function() clearSubmitState,
    required TResult Function(int projectId, String projectName)
        updateHeaderProject,
    required TResult Function(int parentTaskId, String parentTaskName)
        updateHeaderParentTask,
    required TResult Function(bool isPersonal) updateHeaderPersonalTask,
    required TResult Function(int complexity) updateHeaderComplexity,
    required TResult Function(int categoryId, String categoryName)
        updateHeaderTaskCategory,
    required TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)
        updateHeaderWorkTypeAndStatus,
  }) {
    return filterByStatus(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(String status)? filterByStatus,
    TResult? Function()? clearStatusFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearDateFilter,
    TResult? Function(int taskId)? checkIn,
    TResult? Function()? initAdd,
    TResult? Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult? Function()? clearSubmitState,
    TResult? Function(int projectId, String projectName)? updateHeaderProject,
    TResult? Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult? Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult? Function(int complexity)? updateHeaderComplexity,
    TResult? Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult? Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return filterByStatus?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(String status)? filterByStatus,
    TResult Function()? clearStatusFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearDateFilter,
    TResult Function(int taskId)? checkIn,
    TResult Function()? initAdd,
    TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult Function()? clearSubmitState,
    TResult Function(int projectId, String projectName)? updateHeaderProject,
    TResult Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult Function(int complexity)? updateHeaderComplexity,
    TResult Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (filterByStatus != null) {
      return filterByStatus(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearStatusFilter value) clearStatusFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearDateFilter value) clearDateFilter,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_CreateTask value) createTask,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_UpdateHeaderProject value) updateHeaderProject,
    required TResult Function(_UpdateHeaderParentTask value)
        updateHeaderParentTask,
    required TResult Function(_UpdateHeaderPersonalTask value)
        updateHeaderPersonalTask,
    required TResult Function(_UpdateHeaderComplexity value)
        updateHeaderComplexity,
    required TResult Function(_UpdateHeaderTaskCategory value)
        updateHeaderTaskCategory,
    required TResult Function(_UpdateHeaderWorkTypeAndStatus value)
        updateHeaderWorkTypeAndStatus,
  }) {
    return filterByStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearDateFilter value)? clearDateFilter,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult? Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult? Function(_UpdateHeaderPersonalTask value)?
        updateHeaderPersonalTask,
    TResult? Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult? Function(_UpdateHeaderTaskCategory value)?
        updateHeaderTaskCategory,
    TResult? Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return filterByStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearDateFilter value)? clearDateFilter,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult Function(_UpdateHeaderPersonalTask value)? updateHeaderPersonalTask,
    TResult Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult Function(_UpdateHeaderTaskCategory value)? updateHeaderTaskCategory,
    TResult Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (filterByStatus != null) {
      return filterByStatus(this);
    }
    return orElse();
  }
}

abstract class _FilterByStatus implements WeekPlanEvent {
  const factory _FilterByStatus(final String status) = _$FilterByStatusImpl;

  String get status;
  @JsonKey(ignore: true)
  _$$FilterByStatusImplCopyWith<_$FilterByStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearStatusFilterImplCopyWith<$Res> {
  factory _$$ClearStatusFilterImplCopyWith(_$ClearStatusFilterImpl value,
          $Res Function(_$ClearStatusFilterImpl) then) =
      __$$ClearStatusFilterImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearStatusFilterImplCopyWithImpl<$Res>
    extends _$WeekPlanEventCopyWithImpl<$Res, _$ClearStatusFilterImpl>
    implements _$$ClearStatusFilterImplCopyWith<$Res> {
  __$$ClearStatusFilterImplCopyWithImpl(_$ClearStatusFilterImpl _value,
      $Res Function(_$ClearStatusFilterImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearStatusFilterImpl implements _ClearStatusFilter {
  const _$ClearStatusFilterImpl();

  @override
  String toString() {
    return 'WeekPlanEvent.clearStatusFilter()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearStatusFilterImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(String status) filterByStatus,
    required TResult Function() clearStatusFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearDateFilter,
    required TResult Function(int taskId) checkIn,
    required TResult Function() initAdd,
    required TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)
        createTask,
    required TResult Function() clearSubmitState,
    required TResult Function(int projectId, String projectName)
        updateHeaderProject,
    required TResult Function(int parentTaskId, String parentTaskName)
        updateHeaderParentTask,
    required TResult Function(bool isPersonal) updateHeaderPersonalTask,
    required TResult Function(int complexity) updateHeaderComplexity,
    required TResult Function(int categoryId, String categoryName)
        updateHeaderTaskCategory,
    required TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)
        updateHeaderWorkTypeAndStatus,
  }) {
    return clearStatusFilter();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(String status)? filterByStatus,
    TResult? Function()? clearStatusFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearDateFilter,
    TResult? Function(int taskId)? checkIn,
    TResult? Function()? initAdd,
    TResult? Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult? Function()? clearSubmitState,
    TResult? Function(int projectId, String projectName)? updateHeaderProject,
    TResult? Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult? Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult? Function(int complexity)? updateHeaderComplexity,
    TResult? Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult? Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return clearStatusFilter?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(String status)? filterByStatus,
    TResult Function()? clearStatusFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearDateFilter,
    TResult Function(int taskId)? checkIn,
    TResult Function()? initAdd,
    TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult Function()? clearSubmitState,
    TResult Function(int projectId, String projectName)? updateHeaderProject,
    TResult Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult Function(int complexity)? updateHeaderComplexity,
    TResult Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (clearStatusFilter != null) {
      return clearStatusFilter();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearStatusFilter value) clearStatusFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearDateFilter value) clearDateFilter,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_CreateTask value) createTask,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_UpdateHeaderProject value) updateHeaderProject,
    required TResult Function(_UpdateHeaderParentTask value)
        updateHeaderParentTask,
    required TResult Function(_UpdateHeaderPersonalTask value)
        updateHeaderPersonalTask,
    required TResult Function(_UpdateHeaderComplexity value)
        updateHeaderComplexity,
    required TResult Function(_UpdateHeaderTaskCategory value)
        updateHeaderTaskCategory,
    required TResult Function(_UpdateHeaderWorkTypeAndStatus value)
        updateHeaderWorkTypeAndStatus,
  }) {
    return clearStatusFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearDateFilter value)? clearDateFilter,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult? Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult? Function(_UpdateHeaderPersonalTask value)?
        updateHeaderPersonalTask,
    TResult? Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult? Function(_UpdateHeaderTaskCategory value)?
        updateHeaderTaskCategory,
    TResult? Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return clearStatusFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearDateFilter value)? clearDateFilter,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult Function(_UpdateHeaderPersonalTask value)? updateHeaderPersonalTask,
    TResult Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult Function(_UpdateHeaderTaskCategory value)? updateHeaderTaskCategory,
    TResult Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (clearStatusFilter != null) {
      return clearStatusFilter(this);
    }
    return orElse();
  }
}

abstract class _ClearStatusFilter implements WeekPlanEvent {
  const factory _ClearStatusFilter() = _$ClearStatusFilterImpl;
}

/// @nodoc
abstract class _$$ChangeDateRangeImplCopyWith<$Res> {
  factory _$$ChangeDateRangeImplCopyWith(_$ChangeDateRangeImpl value,
          $Res Function(_$ChangeDateRangeImpl) then) =
      __$$ChangeDateRangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime dateStart, DateTime dateEnd});
}

/// @nodoc
class __$$ChangeDateRangeImplCopyWithImpl<$Res>
    extends _$WeekPlanEventCopyWithImpl<$Res, _$ChangeDateRangeImpl>
    implements _$$ChangeDateRangeImplCopyWith<$Res> {
  __$$ChangeDateRangeImplCopyWithImpl(
      _$ChangeDateRangeImpl _value, $Res Function(_$ChangeDateRangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateStart = null,
    Object? dateEnd = null,
  }) {
    return _then(_$ChangeDateRangeImpl(
      dateStart: null == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateEnd: null == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$ChangeDateRangeImpl implements _ChangeDateRange {
  const _$ChangeDateRangeImpl({required this.dateStart, required this.dateEnd});

  @override
  final DateTime dateStart;
  @override
  final DateTime dateEnd;

  @override
  String toString() {
    return 'WeekPlanEvent.changeDateRange(dateStart: $dateStart, dateEnd: $dateEnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeDateRangeImpl &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.dateEnd, dateEnd) || other.dateEnd == dateEnd));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateStart, dateEnd);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeDateRangeImplCopyWith<_$ChangeDateRangeImpl> get copyWith =>
      __$$ChangeDateRangeImplCopyWithImpl<_$ChangeDateRangeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(String status) filterByStatus,
    required TResult Function() clearStatusFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearDateFilter,
    required TResult Function(int taskId) checkIn,
    required TResult Function() initAdd,
    required TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)
        createTask,
    required TResult Function() clearSubmitState,
    required TResult Function(int projectId, String projectName)
        updateHeaderProject,
    required TResult Function(int parentTaskId, String parentTaskName)
        updateHeaderParentTask,
    required TResult Function(bool isPersonal) updateHeaderPersonalTask,
    required TResult Function(int complexity) updateHeaderComplexity,
    required TResult Function(int categoryId, String categoryName)
        updateHeaderTaskCategory,
    required TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)
        updateHeaderWorkTypeAndStatus,
  }) {
    return changeDateRange(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(String status)? filterByStatus,
    TResult? Function()? clearStatusFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearDateFilter,
    TResult? Function(int taskId)? checkIn,
    TResult? Function()? initAdd,
    TResult? Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult? Function()? clearSubmitState,
    TResult? Function(int projectId, String projectName)? updateHeaderProject,
    TResult? Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult? Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult? Function(int complexity)? updateHeaderComplexity,
    TResult? Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult? Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return changeDateRange?.call(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(String status)? filterByStatus,
    TResult Function()? clearStatusFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearDateFilter,
    TResult Function(int taskId)? checkIn,
    TResult Function()? initAdd,
    TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult Function()? clearSubmitState,
    TResult Function(int projectId, String projectName)? updateHeaderProject,
    TResult Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult Function(int complexity)? updateHeaderComplexity,
    TResult Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (changeDateRange != null) {
      return changeDateRange(dateStart, dateEnd);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearStatusFilter value) clearStatusFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearDateFilter value) clearDateFilter,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_CreateTask value) createTask,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_UpdateHeaderProject value) updateHeaderProject,
    required TResult Function(_UpdateHeaderParentTask value)
        updateHeaderParentTask,
    required TResult Function(_UpdateHeaderPersonalTask value)
        updateHeaderPersonalTask,
    required TResult Function(_UpdateHeaderComplexity value)
        updateHeaderComplexity,
    required TResult Function(_UpdateHeaderTaskCategory value)
        updateHeaderTaskCategory,
    required TResult Function(_UpdateHeaderWorkTypeAndStatus value)
        updateHeaderWorkTypeAndStatus,
  }) {
    return changeDateRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearDateFilter value)? clearDateFilter,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult? Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult? Function(_UpdateHeaderPersonalTask value)?
        updateHeaderPersonalTask,
    TResult? Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult? Function(_UpdateHeaderTaskCategory value)?
        updateHeaderTaskCategory,
    TResult? Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return changeDateRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearDateFilter value)? clearDateFilter,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult Function(_UpdateHeaderPersonalTask value)? updateHeaderPersonalTask,
    TResult Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult Function(_UpdateHeaderTaskCategory value)? updateHeaderTaskCategory,
    TResult Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (changeDateRange != null) {
      return changeDateRange(this);
    }
    return orElse();
  }
}

abstract class _ChangeDateRange implements WeekPlanEvent {
  const factory _ChangeDateRange(
      {required final DateTime dateStart,
      required final DateTime dateEnd}) = _$ChangeDateRangeImpl;

  DateTime get dateStart;
  DateTime get dateEnd;
  @JsonKey(ignore: true)
  _$$ChangeDateRangeImplCopyWith<_$ChangeDateRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearDateFilterImplCopyWith<$Res> {
  factory _$$ClearDateFilterImplCopyWith(_$ClearDateFilterImpl value,
          $Res Function(_$ClearDateFilterImpl) then) =
      __$$ClearDateFilterImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearDateFilterImplCopyWithImpl<$Res>
    extends _$WeekPlanEventCopyWithImpl<$Res, _$ClearDateFilterImpl>
    implements _$$ClearDateFilterImplCopyWith<$Res> {
  __$$ClearDateFilterImplCopyWithImpl(
      _$ClearDateFilterImpl _value, $Res Function(_$ClearDateFilterImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearDateFilterImpl implements _ClearDateFilter {
  const _$ClearDateFilterImpl();

  @override
  String toString() {
    return 'WeekPlanEvent.clearDateFilter()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearDateFilterImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(String status) filterByStatus,
    required TResult Function() clearStatusFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearDateFilter,
    required TResult Function(int taskId) checkIn,
    required TResult Function() initAdd,
    required TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)
        createTask,
    required TResult Function() clearSubmitState,
    required TResult Function(int projectId, String projectName)
        updateHeaderProject,
    required TResult Function(int parentTaskId, String parentTaskName)
        updateHeaderParentTask,
    required TResult Function(bool isPersonal) updateHeaderPersonalTask,
    required TResult Function(int complexity) updateHeaderComplexity,
    required TResult Function(int categoryId, String categoryName)
        updateHeaderTaskCategory,
    required TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)
        updateHeaderWorkTypeAndStatus,
  }) {
    return clearDateFilter();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(String status)? filterByStatus,
    TResult? Function()? clearStatusFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearDateFilter,
    TResult? Function(int taskId)? checkIn,
    TResult? Function()? initAdd,
    TResult? Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult? Function()? clearSubmitState,
    TResult? Function(int projectId, String projectName)? updateHeaderProject,
    TResult? Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult? Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult? Function(int complexity)? updateHeaderComplexity,
    TResult? Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult? Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return clearDateFilter?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(String status)? filterByStatus,
    TResult Function()? clearStatusFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearDateFilter,
    TResult Function(int taskId)? checkIn,
    TResult Function()? initAdd,
    TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult Function()? clearSubmitState,
    TResult Function(int projectId, String projectName)? updateHeaderProject,
    TResult Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult Function(int complexity)? updateHeaderComplexity,
    TResult Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (clearDateFilter != null) {
      return clearDateFilter();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearStatusFilter value) clearStatusFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearDateFilter value) clearDateFilter,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_CreateTask value) createTask,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_UpdateHeaderProject value) updateHeaderProject,
    required TResult Function(_UpdateHeaderParentTask value)
        updateHeaderParentTask,
    required TResult Function(_UpdateHeaderPersonalTask value)
        updateHeaderPersonalTask,
    required TResult Function(_UpdateHeaderComplexity value)
        updateHeaderComplexity,
    required TResult Function(_UpdateHeaderTaskCategory value)
        updateHeaderTaskCategory,
    required TResult Function(_UpdateHeaderWorkTypeAndStatus value)
        updateHeaderWorkTypeAndStatus,
  }) {
    return clearDateFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearDateFilter value)? clearDateFilter,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult? Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult? Function(_UpdateHeaderPersonalTask value)?
        updateHeaderPersonalTask,
    TResult? Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult? Function(_UpdateHeaderTaskCategory value)?
        updateHeaderTaskCategory,
    TResult? Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return clearDateFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearDateFilter value)? clearDateFilter,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult Function(_UpdateHeaderPersonalTask value)? updateHeaderPersonalTask,
    TResult Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult Function(_UpdateHeaderTaskCategory value)? updateHeaderTaskCategory,
    TResult Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (clearDateFilter != null) {
      return clearDateFilter(this);
    }
    return orElse();
  }
}

abstract class _ClearDateFilter implements WeekPlanEvent {
  const factory _ClearDateFilter() = _$ClearDateFilterImpl;
}

/// @nodoc
abstract class _$$CheckInImplCopyWith<$Res> {
  factory _$$CheckInImplCopyWith(
          _$CheckInImpl value, $Res Function(_$CheckInImpl) then) =
      __$$CheckInImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int taskId});
}

/// @nodoc
class __$$CheckInImplCopyWithImpl<$Res>
    extends _$WeekPlanEventCopyWithImpl<$Res, _$CheckInImpl>
    implements _$$CheckInImplCopyWith<$Res> {
  __$$CheckInImplCopyWithImpl(
      _$CheckInImpl _value, $Res Function(_$CheckInImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
  }) {
    return _then(_$CheckInImpl(
      null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CheckInImpl implements _CheckIn {
  const _$CheckInImpl(this.taskId);

  @override
  final int taskId;

  @override
  String toString() {
    return 'WeekPlanEvent.checkIn(taskId: $taskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckInImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInImplCopyWith<_$CheckInImpl> get copyWith =>
      __$$CheckInImplCopyWithImpl<_$CheckInImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(String status) filterByStatus,
    required TResult Function() clearStatusFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearDateFilter,
    required TResult Function(int taskId) checkIn,
    required TResult Function() initAdd,
    required TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)
        createTask,
    required TResult Function() clearSubmitState,
    required TResult Function(int projectId, String projectName)
        updateHeaderProject,
    required TResult Function(int parentTaskId, String parentTaskName)
        updateHeaderParentTask,
    required TResult Function(bool isPersonal) updateHeaderPersonalTask,
    required TResult Function(int complexity) updateHeaderComplexity,
    required TResult Function(int categoryId, String categoryName)
        updateHeaderTaskCategory,
    required TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)
        updateHeaderWorkTypeAndStatus,
  }) {
    return checkIn(taskId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(String status)? filterByStatus,
    TResult? Function()? clearStatusFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearDateFilter,
    TResult? Function(int taskId)? checkIn,
    TResult? Function()? initAdd,
    TResult? Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult? Function()? clearSubmitState,
    TResult? Function(int projectId, String projectName)? updateHeaderProject,
    TResult? Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult? Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult? Function(int complexity)? updateHeaderComplexity,
    TResult? Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult? Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return checkIn?.call(taskId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(String status)? filterByStatus,
    TResult Function()? clearStatusFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearDateFilter,
    TResult Function(int taskId)? checkIn,
    TResult Function()? initAdd,
    TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult Function()? clearSubmitState,
    TResult Function(int projectId, String projectName)? updateHeaderProject,
    TResult Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult Function(int complexity)? updateHeaderComplexity,
    TResult Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (checkIn != null) {
      return checkIn(taskId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearStatusFilter value) clearStatusFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearDateFilter value) clearDateFilter,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_CreateTask value) createTask,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_UpdateHeaderProject value) updateHeaderProject,
    required TResult Function(_UpdateHeaderParentTask value)
        updateHeaderParentTask,
    required TResult Function(_UpdateHeaderPersonalTask value)
        updateHeaderPersonalTask,
    required TResult Function(_UpdateHeaderComplexity value)
        updateHeaderComplexity,
    required TResult Function(_UpdateHeaderTaskCategory value)
        updateHeaderTaskCategory,
    required TResult Function(_UpdateHeaderWorkTypeAndStatus value)
        updateHeaderWorkTypeAndStatus,
  }) {
    return checkIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearDateFilter value)? clearDateFilter,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult? Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult? Function(_UpdateHeaderPersonalTask value)?
        updateHeaderPersonalTask,
    TResult? Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult? Function(_UpdateHeaderTaskCategory value)?
        updateHeaderTaskCategory,
    TResult? Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return checkIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearDateFilter value)? clearDateFilter,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult Function(_UpdateHeaderPersonalTask value)? updateHeaderPersonalTask,
    TResult Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult Function(_UpdateHeaderTaskCategory value)? updateHeaderTaskCategory,
    TResult Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (checkIn != null) {
      return checkIn(this);
    }
    return orElse();
  }
}

abstract class _CheckIn implements WeekPlanEvent {
  const factory _CheckIn(final int taskId) = _$CheckInImpl;

  int get taskId;
  @JsonKey(ignore: true)
  _$$CheckInImplCopyWith<_$CheckInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitAddImplCopyWith<$Res> {
  factory _$$InitAddImplCopyWith(
          _$InitAddImpl value, $Res Function(_$InitAddImpl) then) =
      __$$InitAddImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitAddImplCopyWithImpl<$Res>
    extends _$WeekPlanEventCopyWithImpl<$Res, _$InitAddImpl>
    implements _$$InitAddImplCopyWith<$Res> {
  __$$InitAddImplCopyWithImpl(
      _$InitAddImpl _value, $Res Function(_$InitAddImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitAddImpl implements _InitAdd {
  const _$InitAddImpl();

  @override
  String toString() {
    return 'WeekPlanEvent.initAdd()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitAddImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(String status) filterByStatus,
    required TResult Function() clearStatusFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearDateFilter,
    required TResult Function(int taskId) checkIn,
    required TResult Function() initAdd,
    required TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)
        createTask,
    required TResult Function() clearSubmitState,
    required TResult Function(int projectId, String projectName)
        updateHeaderProject,
    required TResult Function(int parentTaskId, String parentTaskName)
        updateHeaderParentTask,
    required TResult Function(bool isPersonal) updateHeaderPersonalTask,
    required TResult Function(int complexity) updateHeaderComplexity,
    required TResult Function(int categoryId, String categoryName)
        updateHeaderTaskCategory,
    required TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)
        updateHeaderWorkTypeAndStatus,
  }) {
    return initAdd();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(String status)? filterByStatus,
    TResult? Function()? clearStatusFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearDateFilter,
    TResult? Function(int taskId)? checkIn,
    TResult? Function()? initAdd,
    TResult? Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult? Function()? clearSubmitState,
    TResult? Function(int projectId, String projectName)? updateHeaderProject,
    TResult? Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult? Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult? Function(int complexity)? updateHeaderComplexity,
    TResult? Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult? Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return initAdd?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(String status)? filterByStatus,
    TResult Function()? clearStatusFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearDateFilter,
    TResult Function(int taskId)? checkIn,
    TResult Function()? initAdd,
    TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult Function()? clearSubmitState,
    TResult Function(int projectId, String projectName)? updateHeaderProject,
    TResult Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult Function(int complexity)? updateHeaderComplexity,
    TResult Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (initAdd != null) {
      return initAdd();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearStatusFilter value) clearStatusFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearDateFilter value) clearDateFilter,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_CreateTask value) createTask,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_UpdateHeaderProject value) updateHeaderProject,
    required TResult Function(_UpdateHeaderParentTask value)
        updateHeaderParentTask,
    required TResult Function(_UpdateHeaderPersonalTask value)
        updateHeaderPersonalTask,
    required TResult Function(_UpdateHeaderComplexity value)
        updateHeaderComplexity,
    required TResult Function(_UpdateHeaderTaskCategory value)
        updateHeaderTaskCategory,
    required TResult Function(_UpdateHeaderWorkTypeAndStatus value)
        updateHeaderWorkTypeAndStatus,
  }) {
    return initAdd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearDateFilter value)? clearDateFilter,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult? Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult? Function(_UpdateHeaderPersonalTask value)?
        updateHeaderPersonalTask,
    TResult? Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult? Function(_UpdateHeaderTaskCategory value)?
        updateHeaderTaskCategory,
    TResult? Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return initAdd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearDateFilter value)? clearDateFilter,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult Function(_UpdateHeaderPersonalTask value)? updateHeaderPersonalTask,
    TResult Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult Function(_UpdateHeaderTaskCategory value)? updateHeaderTaskCategory,
    TResult Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (initAdd != null) {
      return initAdd(this);
    }
    return orElse();
  }
}

abstract class _InitAdd implements WeekPlanEvent {
  const factory _InitAdd() = _$InitAddImpl;
}

/// @nodoc
abstract class _$$CreateTaskImplCopyWith<$Res> {
  factory _$$CreateTaskImplCopyWith(
          _$CreateTaskImpl value, $Res Function(_$CreateTaskImpl) then) =
      __$$CreateTaskImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String taskName,
      String projectName,
      String content,
      DateTime startDate,
      DateTime endDate,
      DateTime deadline,
      int priority,
      String? description});
}

/// @nodoc
class __$$CreateTaskImplCopyWithImpl<$Res>
    extends _$WeekPlanEventCopyWithImpl<$Res, _$CreateTaskImpl>
    implements _$$CreateTaskImplCopyWith<$Res> {
  __$$CreateTaskImplCopyWithImpl(
      _$CreateTaskImpl _value, $Res Function(_$CreateTaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskName = null,
    Object? projectName = null,
    Object? content = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? deadline = null,
    Object? priority = null,
    Object? description = freezed,
  }) {
    return _then(_$CreateTaskImpl(
      taskName: null == taskName
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as String,
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CreateTaskImpl implements _CreateTask {
  const _$CreateTaskImpl(
      {required this.taskName,
      required this.projectName,
      required this.content,
      required this.startDate,
      required this.endDate,
      required this.deadline,
      required this.priority,
      this.description});

  @override
  final String taskName;
  @override
  final String projectName;
  @override
  final String content;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final DateTime deadline;
  @override
  final int priority;
  @override
  final String? description;

  @override
  String toString() {
    return 'WeekPlanEvent.createTask(taskName: $taskName, projectName: $projectName, content: $content, startDate: $startDate, endDate: $endDate, deadline: $deadline, priority: $priority, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTaskImpl &&
            (identical(other.taskName, taskName) ||
                other.taskName == taskName) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskName, projectName, content,
      startDate, endDate, deadline, priority, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTaskImplCopyWith<_$CreateTaskImpl> get copyWith =>
      __$$CreateTaskImplCopyWithImpl<_$CreateTaskImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(String status) filterByStatus,
    required TResult Function() clearStatusFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearDateFilter,
    required TResult Function(int taskId) checkIn,
    required TResult Function() initAdd,
    required TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)
        createTask,
    required TResult Function() clearSubmitState,
    required TResult Function(int projectId, String projectName)
        updateHeaderProject,
    required TResult Function(int parentTaskId, String parentTaskName)
        updateHeaderParentTask,
    required TResult Function(bool isPersonal) updateHeaderPersonalTask,
    required TResult Function(int complexity) updateHeaderComplexity,
    required TResult Function(int categoryId, String categoryName)
        updateHeaderTaskCategory,
    required TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)
        updateHeaderWorkTypeAndStatus,
  }) {
    return createTask(taskName, projectName, content, startDate, endDate,
        deadline, priority, description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(String status)? filterByStatus,
    TResult? Function()? clearStatusFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearDateFilter,
    TResult? Function(int taskId)? checkIn,
    TResult? Function()? initAdd,
    TResult? Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult? Function()? clearSubmitState,
    TResult? Function(int projectId, String projectName)? updateHeaderProject,
    TResult? Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult? Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult? Function(int complexity)? updateHeaderComplexity,
    TResult? Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult? Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return createTask?.call(taskName, projectName, content, startDate, endDate,
        deadline, priority, description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(String status)? filterByStatus,
    TResult Function()? clearStatusFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearDateFilter,
    TResult Function(int taskId)? checkIn,
    TResult Function()? initAdd,
    TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult Function()? clearSubmitState,
    TResult Function(int projectId, String projectName)? updateHeaderProject,
    TResult Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult Function(int complexity)? updateHeaderComplexity,
    TResult Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (createTask != null) {
      return createTask(taskName, projectName, content, startDate, endDate,
          deadline, priority, description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearStatusFilter value) clearStatusFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearDateFilter value) clearDateFilter,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_CreateTask value) createTask,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_UpdateHeaderProject value) updateHeaderProject,
    required TResult Function(_UpdateHeaderParentTask value)
        updateHeaderParentTask,
    required TResult Function(_UpdateHeaderPersonalTask value)
        updateHeaderPersonalTask,
    required TResult Function(_UpdateHeaderComplexity value)
        updateHeaderComplexity,
    required TResult Function(_UpdateHeaderTaskCategory value)
        updateHeaderTaskCategory,
    required TResult Function(_UpdateHeaderWorkTypeAndStatus value)
        updateHeaderWorkTypeAndStatus,
  }) {
    return createTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearDateFilter value)? clearDateFilter,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult? Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult? Function(_UpdateHeaderPersonalTask value)?
        updateHeaderPersonalTask,
    TResult? Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult? Function(_UpdateHeaderTaskCategory value)?
        updateHeaderTaskCategory,
    TResult? Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return createTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearDateFilter value)? clearDateFilter,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult Function(_UpdateHeaderPersonalTask value)? updateHeaderPersonalTask,
    TResult Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult Function(_UpdateHeaderTaskCategory value)? updateHeaderTaskCategory,
    TResult Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (createTask != null) {
      return createTask(this);
    }
    return orElse();
  }
}

abstract class _CreateTask implements WeekPlanEvent {
  const factory _CreateTask(
      {required final String taskName,
      required final String projectName,
      required final String content,
      required final DateTime startDate,
      required final DateTime endDate,
      required final DateTime deadline,
      required final int priority,
      final String? description}) = _$CreateTaskImpl;

  String get taskName;
  String get projectName;
  String get content;
  DateTime get startDate;
  DateTime get endDate;
  DateTime get deadline;
  int get priority;
  String? get description;
  @JsonKey(ignore: true)
  _$$CreateTaskImplCopyWith<_$CreateTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearSubmitStateImplCopyWith<$Res> {
  factory _$$ClearSubmitStateImplCopyWith(_$ClearSubmitStateImpl value,
          $Res Function(_$ClearSubmitStateImpl) then) =
      __$$ClearSubmitStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSubmitStateImplCopyWithImpl<$Res>
    extends _$WeekPlanEventCopyWithImpl<$Res, _$ClearSubmitStateImpl>
    implements _$$ClearSubmitStateImplCopyWith<$Res> {
  __$$ClearSubmitStateImplCopyWithImpl(_$ClearSubmitStateImpl _value,
      $Res Function(_$ClearSubmitStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearSubmitStateImpl implements _ClearSubmitState {
  const _$ClearSubmitStateImpl();

  @override
  String toString() {
    return 'WeekPlanEvent.clearSubmitState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearSubmitStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(String status) filterByStatus,
    required TResult Function() clearStatusFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearDateFilter,
    required TResult Function(int taskId) checkIn,
    required TResult Function() initAdd,
    required TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)
        createTask,
    required TResult Function() clearSubmitState,
    required TResult Function(int projectId, String projectName)
        updateHeaderProject,
    required TResult Function(int parentTaskId, String parentTaskName)
        updateHeaderParentTask,
    required TResult Function(bool isPersonal) updateHeaderPersonalTask,
    required TResult Function(int complexity) updateHeaderComplexity,
    required TResult Function(int categoryId, String categoryName)
        updateHeaderTaskCategory,
    required TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)
        updateHeaderWorkTypeAndStatus,
  }) {
    return clearSubmitState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(String status)? filterByStatus,
    TResult? Function()? clearStatusFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearDateFilter,
    TResult? Function(int taskId)? checkIn,
    TResult? Function()? initAdd,
    TResult? Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult? Function()? clearSubmitState,
    TResult? Function(int projectId, String projectName)? updateHeaderProject,
    TResult? Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult? Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult? Function(int complexity)? updateHeaderComplexity,
    TResult? Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult? Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return clearSubmitState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(String status)? filterByStatus,
    TResult Function()? clearStatusFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearDateFilter,
    TResult Function(int taskId)? checkIn,
    TResult Function()? initAdd,
    TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult Function()? clearSubmitState,
    TResult Function(int projectId, String projectName)? updateHeaderProject,
    TResult Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult Function(int complexity)? updateHeaderComplexity,
    TResult Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (clearSubmitState != null) {
      return clearSubmitState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearStatusFilter value) clearStatusFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearDateFilter value) clearDateFilter,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_CreateTask value) createTask,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_UpdateHeaderProject value) updateHeaderProject,
    required TResult Function(_UpdateHeaderParentTask value)
        updateHeaderParentTask,
    required TResult Function(_UpdateHeaderPersonalTask value)
        updateHeaderPersonalTask,
    required TResult Function(_UpdateHeaderComplexity value)
        updateHeaderComplexity,
    required TResult Function(_UpdateHeaderTaskCategory value)
        updateHeaderTaskCategory,
    required TResult Function(_UpdateHeaderWorkTypeAndStatus value)
        updateHeaderWorkTypeAndStatus,
  }) {
    return clearSubmitState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearDateFilter value)? clearDateFilter,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult? Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult? Function(_UpdateHeaderPersonalTask value)?
        updateHeaderPersonalTask,
    TResult? Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult? Function(_UpdateHeaderTaskCategory value)?
        updateHeaderTaskCategory,
    TResult? Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return clearSubmitState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearDateFilter value)? clearDateFilter,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult Function(_UpdateHeaderPersonalTask value)? updateHeaderPersonalTask,
    TResult Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult Function(_UpdateHeaderTaskCategory value)? updateHeaderTaskCategory,
    TResult Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (clearSubmitState != null) {
      return clearSubmitState(this);
    }
    return orElse();
  }
}

abstract class _ClearSubmitState implements WeekPlanEvent {
  const factory _ClearSubmitState() = _$ClearSubmitStateImpl;
}

/// @nodoc
abstract class _$$UpdateHeaderProjectImplCopyWith<$Res> {
  factory _$$UpdateHeaderProjectImplCopyWith(_$UpdateHeaderProjectImpl value,
          $Res Function(_$UpdateHeaderProjectImpl) then) =
      __$$UpdateHeaderProjectImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int projectId, String projectName});
}

/// @nodoc
class __$$UpdateHeaderProjectImplCopyWithImpl<$Res>
    extends _$WeekPlanEventCopyWithImpl<$Res, _$UpdateHeaderProjectImpl>
    implements _$$UpdateHeaderProjectImplCopyWith<$Res> {
  __$$UpdateHeaderProjectImplCopyWithImpl(_$UpdateHeaderProjectImpl _value,
      $Res Function(_$UpdateHeaderProjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? projectName = null,
  }) {
    return _then(_$UpdateHeaderProjectImpl(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateHeaderProjectImpl implements _UpdateHeaderProject {
  const _$UpdateHeaderProjectImpl(
      {required this.projectId, required this.projectName});

  @override
  final int projectId;
  @override
  final String projectName;

  @override
  String toString() {
    return 'WeekPlanEvent.updateHeaderProject(projectId: $projectId, projectName: $projectName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateHeaderProjectImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectId, projectName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateHeaderProjectImplCopyWith<_$UpdateHeaderProjectImpl> get copyWith =>
      __$$UpdateHeaderProjectImplCopyWithImpl<_$UpdateHeaderProjectImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(String status) filterByStatus,
    required TResult Function() clearStatusFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearDateFilter,
    required TResult Function(int taskId) checkIn,
    required TResult Function() initAdd,
    required TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)
        createTask,
    required TResult Function() clearSubmitState,
    required TResult Function(int projectId, String projectName)
        updateHeaderProject,
    required TResult Function(int parentTaskId, String parentTaskName)
        updateHeaderParentTask,
    required TResult Function(bool isPersonal) updateHeaderPersonalTask,
    required TResult Function(int complexity) updateHeaderComplexity,
    required TResult Function(int categoryId, String categoryName)
        updateHeaderTaskCategory,
    required TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)
        updateHeaderWorkTypeAndStatus,
  }) {
    return updateHeaderProject(projectId, projectName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(String status)? filterByStatus,
    TResult? Function()? clearStatusFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearDateFilter,
    TResult? Function(int taskId)? checkIn,
    TResult? Function()? initAdd,
    TResult? Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult? Function()? clearSubmitState,
    TResult? Function(int projectId, String projectName)? updateHeaderProject,
    TResult? Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult? Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult? Function(int complexity)? updateHeaderComplexity,
    TResult? Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult? Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return updateHeaderProject?.call(projectId, projectName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(String status)? filterByStatus,
    TResult Function()? clearStatusFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearDateFilter,
    TResult Function(int taskId)? checkIn,
    TResult Function()? initAdd,
    TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult Function()? clearSubmitState,
    TResult Function(int projectId, String projectName)? updateHeaderProject,
    TResult Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult Function(int complexity)? updateHeaderComplexity,
    TResult Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (updateHeaderProject != null) {
      return updateHeaderProject(projectId, projectName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearStatusFilter value) clearStatusFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearDateFilter value) clearDateFilter,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_CreateTask value) createTask,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_UpdateHeaderProject value) updateHeaderProject,
    required TResult Function(_UpdateHeaderParentTask value)
        updateHeaderParentTask,
    required TResult Function(_UpdateHeaderPersonalTask value)
        updateHeaderPersonalTask,
    required TResult Function(_UpdateHeaderComplexity value)
        updateHeaderComplexity,
    required TResult Function(_UpdateHeaderTaskCategory value)
        updateHeaderTaskCategory,
    required TResult Function(_UpdateHeaderWorkTypeAndStatus value)
        updateHeaderWorkTypeAndStatus,
  }) {
    return updateHeaderProject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearDateFilter value)? clearDateFilter,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult? Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult? Function(_UpdateHeaderPersonalTask value)?
        updateHeaderPersonalTask,
    TResult? Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult? Function(_UpdateHeaderTaskCategory value)?
        updateHeaderTaskCategory,
    TResult? Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return updateHeaderProject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearDateFilter value)? clearDateFilter,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult Function(_UpdateHeaderPersonalTask value)? updateHeaderPersonalTask,
    TResult Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult Function(_UpdateHeaderTaskCategory value)? updateHeaderTaskCategory,
    TResult Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (updateHeaderProject != null) {
      return updateHeaderProject(this);
    }
    return orElse();
  }
}

abstract class _UpdateHeaderProject implements WeekPlanEvent {
  const factory _UpdateHeaderProject(
      {required final int projectId,
      required final String projectName}) = _$UpdateHeaderProjectImpl;

  int get projectId;
  String get projectName;
  @JsonKey(ignore: true)
  _$$UpdateHeaderProjectImplCopyWith<_$UpdateHeaderProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateHeaderParentTaskImplCopyWith<$Res> {
  factory _$$UpdateHeaderParentTaskImplCopyWith(
          _$UpdateHeaderParentTaskImpl value,
          $Res Function(_$UpdateHeaderParentTaskImpl) then) =
      __$$UpdateHeaderParentTaskImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int parentTaskId, String parentTaskName});
}

/// @nodoc
class __$$UpdateHeaderParentTaskImplCopyWithImpl<$Res>
    extends _$WeekPlanEventCopyWithImpl<$Res, _$UpdateHeaderParentTaskImpl>
    implements _$$UpdateHeaderParentTaskImplCopyWith<$Res> {
  __$$UpdateHeaderParentTaskImplCopyWithImpl(
      _$UpdateHeaderParentTaskImpl _value,
      $Res Function(_$UpdateHeaderParentTaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parentTaskId = null,
    Object? parentTaskName = null,
  }) {
    return _then(_$UpdateHeaderParentTaskImpl(
      parentTaskId: null == parentTaskId
          ? _value.parentTaskId
          : parentTaskId // ignore: cast_nullable_to_non_nullable
              as int,
      parentTaskName: null == parentTaskName
          ? _value.parentTaskName
          : parentTaskName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateHeaderParentTaskImpl implements _UpdateHeaderParentTask {
  const _$UpdateHeaderParentTaskImpl(
      {required this.parentTaskId, required this.parentTaskName});

  @override
  final int parentTaskId;
  @override
  final String parentTaskName;

  @override
  String toString() {
    return 'WeekPlanEvent.updateHeaderParentTask(parentTaskId: $parentTaskId, parentTaskName: $parentTaskName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateHeaderParentTaskImpl &&
            (identical(other.parentTaskId, parentTaskId) ||
                other.parentTaskId == parentTaskId) &&
            (identical(other.parentTaskName, parentTaskName) ||
                other.parentTaskName == parentTaskName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, parentTaskId, parentTaskName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateHeaderParentTaskImplCopyWith<_$UpdateHeaderParentTaskImpl>
      get copyWith => __$$UpdateHeaderParentTaskImplCopyWithImpl<
          _$UpdateHeaderParentTaskImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(String status) filterByStatus,
    required TResult Function() clearStatusFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearDateFilter,
    required TResult Function(int taskId) checkIn,
    required TResult Function() initAdd,
    required TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)
        createTask,
    required TResult Function() clearSubmitState,
    required TResult Function(int projectId, String projectName)
        updateHeaderProject,
    required TResult Function(int parentTaskId, String parentTaskName)
        updateHeaderParentTask,
    required TResult Function(bool isPersonal) updateHeaderPersonalTask,
    required TResult Function(int complexity) updateHeaderComplexity,
    required TResult Function(int categoryId, String categoryName)
        updateHeaderTaskCategory,
    required TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)
        updateHeaderWorkTypeAndStatus,
  }) {
    return updateHeaderParentTask(parentTaskId, parentTaskName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(String status)? filterByStatus,
    TResult? Function()? clearStatusFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearDateFilter,
    TResult? Function(int taskId)? checkIn,
    TResult? Function()? initAdd,
    TResult? Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult? Function()? clearSubmitState,
    TResult? Function(int projectId, String projectName)? updateHeaderProject,
    TResult? Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult? Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult? Function(int complexity)? updateHeaderComplexity,
    TResult? Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult? Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return updateHeaderParentTask?.call(parentTaskId, parentTaskName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(String status)? filterByStatus,
    TResult Function()? clearStatusFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearDateFilter,
    TResult Function(int taskId)? checkIn,
    TResult Function()? initAdd,
    TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult Function()? clearSubmitState,
    TResult Function(int projectId, String projectName)? updateHeaderProject,
    TResult Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult Function(int complexity)? updateHeaderComplexity,
    TResult Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (updateHeaderParentTask != null) {
      return updateHeaderParentTask(parentTaskId, parentTaskName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearStatusFilter value) clearStatusFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearDateFilter value) clearDateFilter,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_CreateTask value) createTask,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_UpdateHeaderProject value) updateHeaderProject,
    required TResult Function(_UpdateHeaderParentTask value)
        updateHeaderParentTask,
    required TResult Function(_UpdateHeaderPersonalTask value)
        updateHeaderPersonalTask,
    required TResult Function(_UpdateHeaderComplexity value)
        updateHeaderComplexity,
    required TResult Function(_UpdateHeaderTaskCategory value)
        updateHeaderTaskCategory,
    required TResult Function(_UpdateHeaderWorkTypeAndStatus value)
        updateHeaderWorkTypeAndStatus,
  }) {
    return updateHeaderParentTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearDateFilter value)? clearDateFilter,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult? Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult? Function(_UpdateHeaderPersonalTask value)?
        updateHeaderPersonalTask,
    TResult? Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult? Function(_UpdateHeaderTaskCategory value)?
        updateHeaderTaskCategory,
    TResult? Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return updateHeaderParentTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearDateFilter value)? clearDateFilter,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult Function(_UpdateHeaderPersonalTask value)? updateHeaderPersonalTask,
    TResult Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult Function(_UpdateHeaderTaskCategory value)? updateHeaderTaskCategory,
    TResult Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (updateHeaderParentTask != null) {
      return updateHeaderParentTask(this);
    }
    return orElse();
  }
}

abstract class _UpdateHeaderParentTask implements WeekPlanEvent {
  const factory _UpdateHeaderParentTask(
      {required final int parentTaskId,
      required final String parentTaskName}) = _$UpdateHeaderParentTaskImpl;

  int get parentTaskId;
  String get parentTaskName;
  @JsonKey(ignore: true)
  _$$UpdateHeaderParentTaskImplCopyWith<_$UpdateHeaderParentTaskImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateHeaderPersonalTaskImplCopyWith<$Res> {
  factory _$$UpdateHeaderPersonalTaskImplCopyWith(
          _$UpdateHeaderPersonalTaskImpl value,
          $Res Function(_$UpdateHeaderPersonalTaskImpl) then) =
      __$$UpdateHeaderPersonalTaskImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isPersonal});
}

/// @nodoc
class __$$UpdateHeaderPersonalTaskImplCopyWithImpl<$Res>
    extends _$WeekPlanEventCopyWithImpl<$Res, _$UpdateHeaderPersonalTaskImpl>
    implements _$$UpdateHeaderPersonalTaskImplCopyWith<$Res> {
  __$$UpdateHeaderPersonalTaskImplCopyWithImpl(
      _$UpdateHeaderPersonalTaskImpl _value,
      $Res Function(_$UpdateHeaderPersonalTaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPersonal = null,
  }) {
    return _then(_$UpdateHeaderPersonalTaskImpl(
      null == isPersonal
          ? _value.isPersonal
          : isPersonal // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UpdateHeaderPersonalTaskImpl implements _UpdateHeaderPersonalTask {
  const _$UpdateHeaderPersonalTaskImpl(this.isPersonal);

  @override
  final bool isPersonal;

  @override
  String toString() {
    return 'WeekPlanEvent.updateHeaderPersonalTask(isPersonal: $isPersonal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateHeaderPersonalTaskImpl &&
            (identical(other.isPersonal, isPersonal) ||
                other.isPersonal == isPersonal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isPersonal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateHeaderPersonalTaskImplCopyWith<_$UpdateHeaderPersonalTaskImpl>
      get copyWith => __$$UpdateHeaderPersonalTaskImplCopyWithImpl<
          _$UpdateHeaderPersonalTaskImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(String status) filterByStatus,
    required TResult Function() clearStatusFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearDateFilter,
    required TResult Function(int taskId) checkIn,
    required TResult Function() initAdd,
    required TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)
        createTask,
    required TResult Function() clearSubmitState,
    required TResult Function(int projectId, String projectName)
        updateHeaderProject,
    required TResult Function(int parentTaskId, String parentTaskName)
        updateHeaderParentTask,
    required TResult Function(bool isPersonal) updateHeaderPersonalTask,
    required TResult Function(int complexity) updateHeaderComplexity,
    required TResult Function(int categoryId, String categoryName)
        updateHeaderTaskCategory,
    required TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)
        updateHeaderWorkTypeAndStatus,
  }) {
    return updateHeaderPersonalTask(isPersonal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(String status)? filterByStatus,
    TResult? Function()? clearStatusFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearDateFilter,
    TResult? Function(int taskId)? checkIn,
    TResult? Function()? initAdd,
    TResult? Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult? Function()? clearSubmitState,
    TResult? Function(int projectId, String projectName)? updateHeaderProject,
    TResult? Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult? Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult? Function(int complexity)? updateHeaderComplexity,
    TResult? Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult? Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return updateHeaderPersonalTask?.call(isPersonal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(String status)? filterByStatus,
    TResult Function()? clearStatusFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearDateFilter,
    TResult Function(int taskId)? checkIn,
    TResult Function()? initAdd,
    TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult Function()? clearSubmitState,
    TResult Function(int projectId, String projectName)? updateHeaderProject,
    TResult Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult Function(int complexity)? updateHeaderComplexity,
    TResult Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (updateHeaderPersonalTask != null) {
      return updateHeaderPersonalTask(isPersonal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearStatusFilter value) clearStatusFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearDateFilter value) clearDateFilter,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_CreateTask value) createTask,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_UpdateHeaderProject value) updateHeaderProject,
    required TResult Function(_UpdateHeaderParentTask value)
        updateHeaderParentTask,
    required TResult Function(_UpdateHeaderPersonalTask value)
        updateHeaderPersonalTask,
    required TResult Function(_UpdateHeaderComplexity value)
        updateHeaderComplexity,
    required TResult Function(_UpdateHeaderTaskCategory value)
        updateHeaderTaskCategory,
    required TResult Function(_UpdateHeaderWorkTypeAndStatus value)
        updateHeaderWorkTypeAndStatus,
  }) {
    return updateHeaderPersonalTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearDateFilter value)? clearDateFilter,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult? Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult? Function(_UpdateHeaderPersonalTask value)?
        updateHeaderPersonalTask,
    TResult? Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult? Function(_UpdateHeaderTaskCategory value)?
        updateHeaderTaskCategory,
    TResult? Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return updateHeaderPersonalTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearDateFilter value)? clearDateFilter,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult Function(_UpdateHeaderPersonalTask value)? updateHeaderPersonalTask,
    TResult Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult Function(_UpdateHeaderTaskCategory value)? updateHeaderTaskCategory,
    TResult Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (updateHeaderPersonalTask != null) {
      return updateHeaderPersonalTask(this);
    }
    return orElse();
  }
}

abstract class _UpdateHeaderPersonalTask implements WeekPlanEvent {
  const factory _UpdateHeaderPersonalTask(final bool isPersonal) =
      _$UpdateHeaderPersonalTaskImpl;

  bool get isPersonal;
  @JsonKey(ignore: true)
  _$$UpdateHeaderPersonalTaskImplCopyWith<_$UpdateHeaderPersonalTaskImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateHeaderComplexityImplCopyWith<$Res> {
  factory _$$UpdateHeaderComplexityImplCopyWith(
          _$UpdateHeaderComplexityImpl value,
          $Res Function(_$UpdateHeaderComplexityImpl) then) =
      __$$UpdateHeaderComplexityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int complexity});
}

/// @nodoc
class __$$UpdateHeaderComplexityImplCopyWithImpl<$Res>
    extends _$WeekPlanEventCopyWithImpl<$Res, _$UpdateHeaderComplexityImpl>
    implements _$$UpdateHeaderComplexityImplCopyWith<$Res> {
  __$$UpdateHeaderComplexityImplCopyWithImpl(
      _$UpdateHeaderComplexityImpl _value,
      $Res Function(_$UpdateHeaderComplexityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? complexity = null,
  }) {
    return _then(_$UpdateHeaderComplexityImpl(
      null == complexity
          ? _value.complexity
          : complexity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UpdateHeaderComplexityImpl implements _UpdateHeaderComplexity {
  const _$UpdateHeaderComplexityImpl(this.complexity);

  @override
  final int complexity;

  @override
  String toString() {
    return 'WeekPlanEvent.updateHeaderComplexity(complexity: $complexity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateHeaderComplexityImpl &&
            (identical(other.complexity, complexity) ||
                other.complexity == complexity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, complexity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateHeaderComplexityImplCopyWith<_$UpdateHeaderComplexityImpl>
      get copyWith => __$$UpdateHeaderComplexityImplCopyWithImpl<
          _$UpdateHeaderComplexityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(String status) filterByStatus,
    required TResult Function() clearStatusFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearDateFilter,
    required TResult Function(int taskId) checkIn,
    required TResult Function() initAdd,
    required TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)
        createTask,
    required TResult Function() clearSubmitState,
    required TResult Function(int projectId, String projectName)
        updateHeaderProject,
    required TResult Function(int parentTaskId, String parentTaskName)
        updateHeaderParentTask,
    required TResult Function(bool isPersonal) updateHeaderPersonalTask,
    required TResult Function(int complexity) updateHeaderComplexity,
    required TResult Function(int categoryId, String categoryName)
        updateHeaderTaskCategory,
    required TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)
        updateHeaderWorkTypeAndStatus,
  }) {
    return updateHeaderComplexity(complexity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(String status)? filterByStatus,
    TResult? Function()? clearStatusFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearDateFilter,
    TResult? Function(int taskId)? checkIn,
    TResult? Function()? initAdd,
    TResult? Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult? Function()? clearSubmitState,
    TResult? Function(int projectId, String projectName)? updateHeaderProject,
    TResult? Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult? Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult? Function(int complexity)? updateHeaderComplexity,
    TResult? Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult? Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return updateHeaderComplexity?.call(complexity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(String status)? filterByStatus,
    TResult Function()? clearStatusFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearDateFilter,
    TResult Function(int taskId)? checkIn,
    TResult Function()? initAdd,
    TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult Function()? clearSubmitState,
    TResult Function(int projectId, String projectName)? updateHeaderProject,
    TResult Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult Function(int complexity)? updateHeaderComplexity,
    TResult Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (updateHeaderComplexity != null) {
      return updateHeaderComplexity(complexity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearStatusFilter value) clearStatusFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearDateFilter value) clearDateFilter,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_CreateTask value) createTask,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_UpdateHeaderProject value) updateHeaderProject,
    required TResult Function(_UpdateHeaderParentTask value)
        updateHeaderParentTask,
    required TResult Function(_UpdateHeaderPersonalTask value)
        updateHeaderPersonalTask,
    required TResult Function(_UpdateHeaderComplexity value)
        updateHeaderComplexity,
    required TResult Function(_UpdateHeaderTaskCategory value)
        updateHeaderTaskCategory,
    required TResult Function(_UpdateHeaderWorkTypeAndStatus value)
        updateHeaderWorkTypeAndStatus,
  }) {
    return updateHeaderComplexity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearDateFilter value)? clearDateFilter,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult? Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult? Function(_UpdateHeaderPersonalTask value)?
        updateHeaderPersonalTask,
    TResult? Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult? Function(_UpdateHeaderTaskCategory value)?
        updateHeaderTaskCategory,
    TResult? Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return updateHeaderComplexity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearDateFilter value)? clearDateFilter,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult Function(_UpdateHeaderPersonalTask value)? updateHeaderPersonalTask,
    TResult Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult Function(_UpdateHeaderTaskCategory value)? updateHeaderTaskCategory,
    TResult Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (updateHeaderComplexity != null) {
      return updateHeaderComplexity(this);
    }
    return orElse();
  }
}

abstract class _UpdateHeaderComplexity implements WeekPlanEvent {
  const factory _UpdateHeaderComplexity(final int complexity) =
      _$UpdateHeaderComplexityImpl;

  int get complexity;
  @JsonKey(ignore: true)
  _$$UpdateHeaderComplexityImplCopyWith<_$UpdateHeaderComplexityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateHeaderTaskCategoryImplCopyWith<$Res> {
  factory _$$UpdateHeaderTaskCategoryImplCopyWith(
          _$UpdateHeaderTaskCategoryImpl value,
          $Res Function(_$UpdateHeaderTaskCategoryImpl) then) =
      __$$UpdateHeaderTaskCategoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int categoryId, String categoryName});
}

/// @nodoc
class __$$UpdateHeaderTaskCategoryImplCopyWithImpl<$Res>
    extends _$WeekPlanEventCopyWithImpl<$Res, _$UpdateHeaderTaskCategoryImpl>
    implements _$$UpdateHeaderTaskCategoryImplCopyWith<$Res> {
  __$$UpdateHeaderTaskCategoryImplCopyWithImpl(
      _$UpdateHeaderTaskCategoryImpl _value,
      $Res Function(_$UpdateHeaderTaskCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryName = null,
  }) {
    return _then(_$UpdateHeaderTaskCategoryImpl(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateHeaderTaskCategoryImpl implements _UpdateHeaderTaskCategory {
  const _$UpdateHeaderTaskCategoryImpl(
      {required this.categoryId, required this.categoryName});

  @override
  final int categoryId;
  @override
  final String categoryName;

  @override
  String toString() {
    return 'WeekPlanEvent.updateHeaderTaskCategory(categoryId: $categoryId, categoryName: $categoryName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateHeaderTaskCategoryImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryId, categoryName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateHeaderTaskCategoryImplCopyWith<_$UpdateHeaderTaskCategoryImpl>
      get copyWith => __$$UpdateHeaderTaskCategoryImplCopyWithImpl<
          _$UpdateHeaderTaskCategoryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(String status) filterByStatus,
    required TResult Function() clearStatusFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearDateFilter,
    required TResult Function(int taskId) checkIn,
    required TResult Function() initAdd,
    required TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)
        createTask,
    required TResult Function() clearSubmitState,
    required TResult Function(int projectId, String projectName)
        updateHeaderProject,
    required TResult Function(int parentTaskId, String parentTaskName)
        updateHeaderParentTask,
    required TResult Function(bool isPersonal) updateHeaderPersonalTask,
    required TResult Function(int complexity) updateHeaderComplexity,
    required TResult Function(int categoryId, String categoryName)
        updateHeaderTaskCategory,
    required TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)
        updateHeaderWorkTypeAndStatus,
  }) {
    return updateHeaderTaskCategory(categoryId, categoryName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(String status)? filterByStatus,
    TResult? Function()? clearStatusFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearDateFilter,
    TResult? Function(int taskId)? checkIn,
    TResult? Function()? initAdd,
    TResult? Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult? Function()? clearSubmitState,
    TResult? Function(int projectId, String projectName)? updateHeaderProject,
    TResult? Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult? Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult? Function(int complexity)? updateHeaderComplexity,
    TResult? Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult? Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return updateHeaderTaskCategory?.call(categoryId, categoryName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(String status)? filterByStatus,
    TResult Function()? clearStatusFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearDateFilter,
    TResult Function(int taskId)? checkIn,
    TResult Function()? initAdd,
    TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult Function()? clearSubmitState,
    TResult Function(int projectId, String projectName)? updateHeaderProject,
    TResult Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult Function(int complexity)? updateHeaderComplexity,
    TResult Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (updateHeaderTaskCategory != null) {
      return updateHeaderTaskCategory(categoryId, categoryName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearStatusFilter value) clearStatusFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearDateFilter value) clearDateFilter,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_CreateTask value) createTask,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_UpdateHeaderProject value) updateHeaderProject,
    required TResult Function(_UpdateHeaderParentTask value)
        updateHeaderParentTask,
    required TResult Function(_UpdateHeaderPersonalTask value)
        updateHeaderPersonalTask,
    required TResult Function(_UpdateHeaderComplexity value)
        updateHeaderComplexity,
    required TResult Function(_UpdateHeaderTaskCategory value)
        updateHeaderTaskCategory,
    required TResult Function(_UpdateHeaderWorkTypeAndStatus value)
        updateHeaderWorkTypeAndStatus,
  }) {
    return updateHeaderTaskCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearDateFilter value)? clearDateFilter,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult? Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult? Function(_UpdateHeaderPersonalTask value)?
        updateHeaderPersonalTask,
    TResult? Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult? Function(_UpdateHeaderTaskCategory value)?
        updateHeaderTaskCategory,
    TResult? Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return updateHeaderTaskCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearDateFilter value)? clearDateFilter,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult Function(_UpdateHeaderPersonalTask value)? updateHeaderPersonalTask,
    TResult Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult Function(_UpdateHeaderTaskCategory value)? updateHeaderTaskCategory,
    TResult Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (updateHeaderTaskCategory != null) {
      return updateHeaderTaskCategory(this);
    }
    return orElse();
  }
}

abstract class _UpdateHeaderTaskCategory implements WeekPlanEvent {
  const factory _UpdateHeaderTaskCategory(
      {required final int categoryId,
      required final String categoryName}) = _$UpdateHeaderTaskCategoryImpl;

  int get categoryId;
  String get categoryName;
  @JsonKey(ignore: true)
  _$$UpdateHeaderTaskCategoryImplCopyWith<_$UpdateHeaderTaskCategoryImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateHeaderWorkTypeAndStatusImplCopyWith<$Res> {
  factory _$$UpdateHeaderWorkTypeAndStatusImplCopyWith(
          _$UpdateHeaderWorkTypeAndStatusImpl value,
          $Res Function(_$UpdateHeaderWorkTypeAndStatusImpl) then) =
      __$$UpdateHeaderWorkTypeAndStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int workTypeId, String workTypeName, int statusId, String statusName});
}

/// @nodoc
class __$$UpdateHeaderWorkTypeAndStatusImplCopyWithImpl<$Res>
    extends _$WeekPlanEventCopyWithImpl<$Res,
        _$UpdateHeaderWorkTypeAndStatusImpl>
    implements _$$UpdateHeaderWorkTypeAndStatusImplCopyWith<$Res> {
  __$$UpdateHeaderWorkTypeAndStatusImplCopyWithImpl(
      _$UpdateHeaderWorkTypeAndStatusImpl _value,
      $Res Function(_$UpdateHeaderWorkTypeAndStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workTypeId = null,
    Object? workTypeName = null,
    Object? statusId = null,
    Object? statusName = null,
  }) {
    return _then(_$UpdateHeaderWorkTypeAndStatusImpl(
      workTypeId: null == workTypeId
          ? _value.workTypeId
          : workTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      workTypeName: null == workTypeName
          ? _value.workTypeName
          : workTypeName // ignore: cast_nullable_to_non_nullable
              as String,
      statusId: null == statusId
          ? _value.statusId
          : statusId // ignore: cast_nullable_to_non_nullable
              as int,
      statusName: null == statusName
          ? _value.statusName
          : statusName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateHeaderWorkTypeAndStatusImpl
    implements _UpdateHeaderWorkTypeAndStatus {
  const _$UpdateHeaderWorkTypeAndStatusImpl(
      {required this.workTypeId,
      required this.workTypeName,
      required this.statusId,
      required this.statusName});

  @override
  final int workTypeId;
  @override
  final String workTypeName;
  @override
  final int statusId;
  @override
  final String statusName;

  @override
  String toString() {
    return 'WeekPlanEvent.updateHeaderWorkTypeAndStatus(workTypeId: $workTypeId, workTypeName: $workTypeName, statusId: $statusId, statusName: $statusName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateHeaderWorkTypeAndStatusImpl &&
            (identical(other.workTypeId, workTypeId) ||
                other.workTypeId == workTypeId) &&
            (identical(other.workTypeName, workTypeName) ||
                other.workTypeName == workTypeName) &&
            (identical(other.statusId, statusId) ||
                other.statusId == statusId) &&
            (identical(other.statusName, statusName) ||
                other.statusName == statusName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, workTypeId, workTypeName, statusId, statusName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateHeaderWorkTypeAndStatusImplCopyWith<
          _$UpdateHeaderWorkTypeAndStatusImpl>
      get copyWith => __$$UpdateHeaderWorkTypeAndStatusImplCopyWithImpl<
          _$UpdateHeaderWorkTypeAndStatusImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() refresh,
    required TResult Function(String keyword) search,
    required TResult Function() clearSearch,
    required TResult Function(String status) filterByStatus,
    required TResult Function() clearStatusFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() clearDateFilter,
    required TResult Function(int taskId) checkIn,
    required TResult Function() initAdd,
    required TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)
        createTask,
    required TResult Function() clearSubmitState,
    required TResult Function(int projectId, String projectName)
        updateHeaderProject,
    required TResult Function(int parentTaskId, String parentTaskName)
        updateHeaderParentTask,
    required TResult Function(bool isPersonal) updateHeaderPersonalTask,
    required TResult Function(int complexity) updateHeaderComplexity,
    required TResult Function(int categoryId, String categoryName)
        updateHeaderTaskCategory,
    required TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)
        updateHeaderWorkTypeAndStatus,
  }) {
    return updateHeaderWorkTypeAndStatus(
        workTypeId, workTypeName, statusId, statusName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? refresh,
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearch,
    TResult? Function(String status)? filterByStatus,
    TResult? Function()? clearStatusFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? clearDateFilter,
    TResult? Function(int taskId)? checkIn,
    TResult? Function()? initAdd,
    TResult? Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult? Function()? clearSubmitState,
    TResult? Function(int projectId, String projectName)? updateHeaderProject,
    TResult? Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult? Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult? Function(int complexity)? updateHeaderComplexity,
    TResult? Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult? Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return updateHeaderWorkTypeAndStatus?.call(
        workTypeId, workTypeName, statusId, statusName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? refresh,
    TResult Function(String keyword)? search,
    TResult Function()? clearSearch,
    TResult Function(String status)? filterByStatus,
    TResult Function()? clearStatusFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? clearDateFilter,
    TResult Function(int taskId)? checkIn,
    TResult Function()? initAdd,
    TResult Function(
            String taskName,
            String projectName,
            String content,
            DateTime startDate,
            DateTime endDate,
            DateTime deadline,
            int priority,
            String? description)?
        createTask,
    TResult Function()? clearSubmitState,
    TResult Function(int projectId, String projectName)? updateHeaderProject,
    TResult Function(int parentTaskId, String parentTaskName)?
        updateHeaderParentTask,
    TResult Function(bool isPersonal)? updateHeaderPersonalTask,
    TResult Function(int complexity)? updateHeaderComplexity,
    TResult Function(int categoryId, String categoryName)?
        updateHeaderTaskCategory,
    TResult Function(int workTypeId, String workTypeName, int statusId,
            String statusName)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (updateHeaderWorkTypeAndStatus != null) {
      return updateHeaderWorkTypeAndStatus(
          workTypeId, workTypeName, statusId, statusName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearStatusFilter value) clearStatusFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ClearDateFilter value) clearDateFilter,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_CreateTask value) createTask,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_UpdateHeaderProject value) updateHeaderProject,
    required TResult Function(_UpdateHeaderParentTask value)
        updateHeaderParentTask,
    required TResult Function(_UpdateHeaderPersonalTask value)
        updateHeaderPersonalTask,
    required TResult Function(_UpdateHeaderComplexity value)
        updateHeaderComplexity,
    required TResult Function(_UpdateHeaderTaskCategory value)
        updateHeaderTaskCategory,
    required TResult Function(_UpdateHeaderWorkTypeAndStatus value)
        updateHeaderWorkTypeAndStatus,
  }) {
    return updateHeaderWorkTypeAndStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ClearDateFilter value)? clearDateFilter,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult? Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult? Function(_UpdateHeaderPersonalTask value)?
        updateHeaderPersonalTask,
    TResult? Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult? Function(_UpdateHeaderTaskCategory value)?
        updateHeaderTaskCategory,
    TResult? Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
  }) {
    return updateHeaderWorkTypeAndStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearStatusFilter value)? clearStatusFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ClearDateFilter value)? clearDateFilter,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_UpdateHeaderProject value)? updateHeaderProject,
    TResult Function(_UpdateHeaderParentTask value)? updateHeaderParentTask,
    TResult Function(_UpdateHeaderPersonalTask value)? updateHeaderPersonalTask,
    TResult Function(_UpdateHeaderComplexity value)? updateHeaderComplexity,
    TResult Function(_UpdateHeaderTaskCategory value)? updateHeaderTaskCategory,
    TResult Function(_UpdateHeaderWorkTypeAndStatus value)?
        updateHeaderWorkTypeAndStatus,
    required TResult orElse(),
  }) {
    if (updateHeaderWorkTypeAndStatus != null) {
      return updateHeaderWorkTypeAndStatus(this);
    }
    return orElse();
  }
}

abstract class _UpdateHeaderWorkTypeAndStatus implements WeekPlanEvent {
  const factory _UpdateHeaderWorkTypeAndStatus(
      {required final int workTypeId,
      required final String workTypeName,
      required final int statusId,
      required final String statusName}) = _$UpdateHeaderWorkTypeAndStatusImpl;

  int get workTypeId;
  String get workTypeName;
  int get statusId;
  String get statusName;
  @JsonKey(ignore: true)
  _$$UpdateHeaderWorkTypeAndStatusImplCopyWith<
          _$UpdateHeaderWorkTypeAndStatusImpl>
      get copyWith => throw _privateConstructorUsedError;
}
