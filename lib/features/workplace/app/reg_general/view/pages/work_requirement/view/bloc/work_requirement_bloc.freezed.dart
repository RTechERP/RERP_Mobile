// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_requirement_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WorkRequirementEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() refresh,
    required TResult Function() initAdd,
    required TResult Function(int rowIndex, String field, String value)
        updateFormField,
    required TResult Function(DateTime? date) changeDateRequest,
    required TResult Function(DateTime? date) changeDeadline,
    required TResult Function(int? id, String? name) changeRequiredDepartment,
    required TResult Function(int? id, String? name)
        changeCoordinationDepartment,
    required TResult Function(int? id, String? displayName) changeApprover,
    required TResult Function(List<String> names) changeAttachments,
    required TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)
        submit,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) initDetail,
    required TResult Function(List<int> ids) deleteRequirement,
    required TResult Function() clearDeleteSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? refresh,
    TResult? Function()? initAdd,
    TResult? Function(int rowIndex, String field, String value)?
        updateFormField,
    TResult? Function(DateTime? date)? changeDateRequest,
    TResult? Function(DateTime? date)? changeDeadline,
    TResult? Function(int? id, String? name)? changeRequiredDepartment,
    TResult? Function(int? id, String? name)? changeCoordinationDepartment,
    TResult? Function(int? id, String? displayName)? changeApprover,
    TResult? Function(List<String> names)? changeAttachments,
    TResult? Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? initDetail,
    TResult? Function(List<int> ids)? deleteRequirement,
    TResult? Function()? clearDeleteSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? refresh,
    TResult Function()? initAdd,
    TResult Function(int rowIndex, String field, String value)? updateFormField,
    TResult Function(DateTime? date)? changeDateRequest,
    TResult Function(DateTime? date)? changeDeadline,
    TResult Function(int? id, String? name)? changeRequiredDepartment,
    TResult Function(int? id, String? name)? changeCoordinationDepartment,
    TResult Function(int? id, String? displayName)? changeApprover,
    TResult Function(List<String> names)? changeAttachments,
    TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? initDetail,
    TResult Function(List<int> ids)? deleteRequirement,
    TResult Function()? clearDeleteSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_UpdateFormField value) updateFormField,
    required TResult Function(_ChangeDateRequest value) changeDateRequest,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeRequiredDepartment value)
        changeRequiredDepartment,
    required TResult Function(_ChangeCoordinationDepartment value)
        changeCoordinationDepartment,
    required TResult Function(_ChangeApprover value) changeApprover,
    required TResult Function(_ChangeAttachments value) changeAttachments,
    required TResult Function(_Submit value) submit,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_DeleteRequirement value) deleteRequirement,
    required TResult Function(_ClearDeleteSuccess value) clearDeleteSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_UpdateFormField value)? updateFormField,
    TResult? Function(_ChangeDateRequest value)? changeDateRequest,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeRequiredDepartment value)?
        changeRequiredDepartment,
    TResult? Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult? Function(_ChangeApprover value)? changeApprover,
    TResult? Function(_ChangeAttachments value)? changeAttachments,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_DeleteRequirement value)? deleteRequirement,
    TResult? Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_UpdateFormField value)? updateFormField,
    TResult Function(_ChangeDateRequest value)? changeDateRequest,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeRequiredDepartment value)? changeRequiredDepartment,
    TResult Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult Function(_ChangeApprover value)? changeApprover,
    TResult Function(_ChangeAttachments value)? changeAttachments,
    TResult Function(_Submit value)? submit,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_DeleteRequirement value)? deleteRequirement,
    TResult Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkRequirementEventCopyWith<$Res> {
  factory $WorkRequirementEventCopyWith(WorkRequirementEvent value,
          $Res Function(WorkRequirementEvent) then) =
      _$WorkRequirementEventCopyWithImpl<$Res, WorkRequirementEvent>;
}

/// @nodoc
class _$WorkRequirementEventCopyWithImpl<$Res,
        $Val extends WorkRequirementEvent>
    implements $WorkRequirementEventCopyWith<$Res> {
  _$WorkRequirementEventCopyWithImpl(this._value, this._then);

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
    extends _$WorkRequirementEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl implements _Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'WorkRequirementEvent.init()';
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
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() refresh,
    required TResult Function() initAdd,
    required TResult Function(int rowIndex, String field, String value)
        updateFormField,
    required TResult Function(DateTime? date) changeDateRequest,
    required TResult Function(DateTime? date) changeDeadline,
    required TResult Function(int? id, String? name) changeRequiredDepartment,
    required TResult Function(int? id, String? name)
        changeCoordinationDepartment,
    required TResult Function(int? id, String? displayName) changeApprover,
    required TResult Function(List<String> names) changeAttachments,
    required TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)
        submit,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) initDetail,
    required TResult Function(List<int> ids) deleteRequirement,
    required TResult Function() clearDeleteSuccess,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? refresh,
    TResult? Function()? initAdd,
    TResult? Function(int rowIndex, String field, String value)?
        updateFormField,
    TResult? Function(DateTime? date)? changeDateRequest,
    TResult? Function(DateTime? date)? changeDeadline,
    TResult? Function(int? id, String? name)? changeRequiredDepartment,
    TResult? Function(int? id, String? name)? changeCoordinationDepartment,
    TResult? Function(int? id, String? displayName)? changeApprover,
    TResult? Function(List<String> names)? changeAttachments,
    TResult? Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? initDetail,
    TResult? Function(List<int> ids)? deleteRequirement,
    TResult? Function()? clearDeleteSuccess,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? refresh,
    TResult Function()? initAdd,
    TResult Function(int rowIndex, String field, String value)? updateFormField,
    TResult Function(DateTime? date)? changeDateRequest,
    TResult Function(DateTime? date)? changeDeadline,
    TResult Function(int? id, String? name)? changeRequiredDepartment,
    TResult Function(int? id, String? name)? changeCoordinationDepartment,
    TResult Function(int? id, String? displayName)? changeApprover,
    TResult Function(List<String> names)? changeAttachments,
    TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? initDetail,
    TResult Function(List<int> ids)? deleteRequirement,
    TResult Function()? clearDeleteSuccess,
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
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_UpdateFormField value) updateFormField,
    required TResult Function(_ChangeDateRequest value) changeDateRequest,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeRequiredDepartment value)
        changeRequiredDepartment,
    required TResult Function(_ChangeCoordinationDepartment value)
        changeCoordinationDepartment,
    required TResult Function(_ChangeApprover value) changeApprover,
    required TResult Function(_ChangeAttachments value) changeAttachments,
    required TResult Function(_Submit value) submit,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_DeleteRequirement value) deleteRequirement,
    required TResult Function(_ClearDeleteSuccess value) clearDeleteSuccess,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_UpdateFormField value)? updateFormField,
    TResult? Function(_ChangeDateRequest value)? changeDateRequest,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeRequiredDepartment value)?
        changeRequiredDepartment,
    TResult? Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult? Function(_ChangeApprover value)? changeApprover,
    TResult? Function(_ChangeAttachments value)? changeAttachments,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_DeleteRequirement value)? deleteRequirement,
    TResult? Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_UpdateFormField value)? updateFormField,
    TResult Function(_ChangeDateRequest value)? changeDateRequest,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeRequiredDepartment value)? changeRequiredDepartment,
    TResult Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult Function(_ChangeApprover value)? changeApprover,
    TResult Function(_ChangeAttachments value)? changeAttachments,
    TResult Function(_Submit value)? submit,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_DeleteRequirement value)? deleteRequirement,
    TResult Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements WorkRequirementEvent {
  const factory _Init() = _$InitImpl;
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
    extends _$WorkRequirementEventCopyWithImpl<$Res, _$ChangeDateRangeImpl>
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
    return 'WorkRequirementEvent.changeDateRange(dateStart: $dateStart, dateEnd: $dateEnd)';
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
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() refresh,
    required TResult Function() initAdd,
    required TResult Function(int rowIndex, String field, String value)
        updateFormField,
    required TResult Function(DateTime? date) changeDateRequest,
    required TResult Function(DateTime? date) changeDeadline,
    required TResult Function(int? id, String? name) changeRequiredDepartment,
    required TResult Function(int? id, String? name)
        changeCoordinationDepartment,
    required TResult Function(int? id, String? displayName) changeApprover,
    required TResult Function(List<String> names) changeAttachments,
    required TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)
        submit,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) initDetail,
    required TResult Function(List<int> ids) deleteRequirement,
    required TResult Function() clearDeleteSuccess,
  }) {
    return changeDateRange(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? refresh,
    TResult? Function()? initAdd,
    TResult? Function(int rowIndex, String field, String value)?
        updateFormField,
    TResult? Function(DateTime? date)? changeDateRequest,
    TResult? Function(DateTime? date)? changeDeadline,
    TResult? Function(int? id, String? name)? changeRequiredDepartment,
    TResult? Function(int? id, String? name)? changeCoordinationDepartment,
    TResult? Function(int? id, String? displayName)? changeApprover,
    TResult? Function(List<String> names)? changeAttachments,
    TResult? Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? initDetail,
    TResult? Function(List<int> ids)? deleteRequirement,
    TResult? Function()? clearDeleteSuccess,
  }) {
    return changeDateRange?.call(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? refresh,
    TResult Function()? initAdd,
    TResult Function(int rowIndex, String field, String value)? updateFormField,
    TResult Function(DateTime? date)? changeDateRequest,
    TResult Function(DateTime? date)? changeDeadline,
    TResult Function(int? id, String? name)? changeRequiredDepartment,
    TResult Function(int? id, String? name)? changeCoordinationDepartment,
    TResult Function(int? id, String? displayName)? changeApprover,
    TResult Function(List<String> names)? changeAttachments,
    TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? initDetail,
    TResult Function(List<int> ids)? deleteRequirement,
    TResult Function()? clearDeleteSuccess,
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
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_UpdateFormField value) updateFormField,
    required TResult Function(_ChangeDateRequest value) changeDateRequest,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeRequiredDepartment value)
        changeRequiredDepartment,
    required TResult Function(_ChangeCoordinationDepartment value)
        changeCoordinationDepartment,
    required TResult Function(_ChangeApprover value) changeApprover,
    required TResult Function(_ChangeAttachments value) changeAttachments,
    required TResult Function(_Submit value) submit,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_DeleteRequirement value) deleteRequirement,
    required TResult Function(_ClearDeleteSuccess value) clearDeleteSuccess,
  }) {
    return changeDateRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_UpdateFormField value)? updateFormField,
    TResult? Function(_ChangeDateRequest value)? changeDateRequest,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeRequiredDepartment value)?
        changeRequiredDepartment,
    TResult? Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult? Function(_ChangeApprover value)? changeApprover,
    TResult? Function(_ChangeAttachments value)? changeAttachments,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_DeleteRequirement value)? deleteRequirement,
    TResult? Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
  }) {
    return changeDateRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_UpdateFormField value)? updateFormField,
    TResult Function(_ChangeDateRequest value)? changeDateRequest,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeRequiredDepartment value)? changeRequiredDepartment,
    TResult Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult Function(_ChangeApprover value)? changeApprover,
    TResult Function(_ChangeAttachments value)? changeAttachments,
    TResult Function(_Submit value)? submit,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_DeleteRequirement value)? deleteRequirement,
    TResult Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
    required TResult orElse(),
  }) {
    if (changeDateRange != null) {
      return changeDateRange(this);
    }
    return orElse();
  }
}

abstract class _ChangeDateRange implements WorkRequirementEvent {
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
abstract class _$$RefreshImplCopyWith<$Res> {
  factory _$$RefreshImplCopyWith(
          _$RefreshImpl value, $Res Function(_$RefreshImpl) then) =
      __$$RefreshImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshImplCopyWithImpl<$Res>
    extends _$WorkRequirementEventCopyWithImpl<$Res, _$RefreshImpl>
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
    return 'WorkRequirementEvent.refresh()';
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
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() refresh,
    required TResult Function() initAdd,
    required TResult Function(int rowIndex, String field, String value)
        updateFormField,
    required TResult Function(DateTime? date) changeDateRequest,
    required TResult Function(DateTime? date) changeDeadline,
    required TResult Function(int? id, String? name) changeRequiredDepartment,
    required TResult Function(int? id, String? name)
        changeCoordinationDepartment,
    required TResult Function(int? id, String? displayName) changeApprover,
    required TResult Function(List<String> names) changeAttachments,
    required TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)
        submit,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) initDetail,
    required TResult Function(List<int> ids) deleteRequirement,
    required TResult Function() clearDeleteSuccess,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? refresh,
    TResult? Function()? initAdd,
    TResult? Function(int rowIndex, String field, String value)?
        updateFormField,
    TResult? Function(DateTime? date)? changeDateRequest,
    TResult? Function(DateTime? date)? changeDeadline,
    TResult? Function(int? id, String? name)? changeRequiredDepartment,
    TResult? Function(int? id, String? name)? changeCoordinationDepartment,
    TResult? Function(int? id, String? displayName)? changeApprover,
    TResult? Function(List<String> names)? changeAttachments,
    TResult? Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? initDetail,
    TResult? Function(List<int> ids)? deleteRequirement,
    TResult? Function()? clearDeleteSuccess,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? refresh,
    TResult Function()? initAdd,
    TResult Function(int rowIndex, String field, String value)? updateFormField,
    TResult Function(DateTime? date)? changeDateRequest,
    TResult Function(DateTime? date)? changeDeadline,
    TResult Function(int? id, String? name)? changeRequiredDepartment,
    TResult Function(int? id, String? name)? changeCoordinationDepartment,
    TResult Function(int? id, String? displayName)? changeApprover,
    TResult Function(List<String> names)? changeAttachments,
    TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? initDetail,
    TResult Function(List<int> ids)? deleteRequirement,
    TResult Function()? clearDeleteSuccess,
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
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_UpdateFormField value) updateFormField,
    required TResult Function(_ChangeDateRequest value) changeDateRequest,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeRequiredDepartment value)
        changeRequiredDepartment,
    required TResult Function(_ChangeCoordinationDepartment value)
        changeCoordinationDepartment,
    required TResult Function(_ChangeApprover value) changeApprover,
    required TResult Function(_ChangeAttachments value) changeAttachments,
    required TResult Function(_Submit value) submit,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_DeleteRequirement value) deleteRequirement,
    required TResult Function(_ClearDeleteSuccess value) clearDeleteSuccess,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_UpdateFormField value)? updateFormField,
    TResult? Function(_ChangeDateRequest value)? changeDateRequest,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeRequiredDepartment value)?
        changeRequiredDepartment,
    TResult? Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult? Function(_ChangeApprover value)? changeApprover,
    TResult? Function(_ChangeAttachments value)? changeAttachments,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_DeleteRequirement value)? deleteRequirement,
    TResult? Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_UpdateFormField value)? updateFormField,
    TResult Function(_ChangeDateRequest value)? changeDateRequest,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeRequiredDepartment value)? changeRequiredDepartment,
    TResult Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult Function(_ChangeApprover value)? changeApprover,
    TResult Function(_ChangeAttachments value)? changeAttachments,
    TResult Function(_Submit value)? submit,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_DeleteRequirement value)? deleteRequirement,
    TResult Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements WorkRequirementEvent {
  const factory _Refresh() = _$RefreshImpl;
}

/// @nodoc
abstract class _$$InitAddImplCopyWith<$Res> {
  factory _$$InitAddImplCopyWith(
          _$InitAddImpl value, $Res Function(_$InitAddImpl) then) =
      __$$InitAddImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitAddImplCopyWithImpl<$Res>
    extends _$WorkRequirementEventCopyWithImpl<$Res, _$InitAddImpl>
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
    return 'WorkRequirementEvent.initAdd()';
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
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() refresh,
    required TResult Function() initAdd,
    required TResult Function(int rowIndex, String field, String value)
        updateFormField,
    required TResult Function(DateTime? date) changeDateRequest,
    required TResult Function(DateTime? date) changeDeadline,
    required TResult Function(int? id, String? name) changeRequiredDepartment,
    required TResult Function(int? id, String? name)
        changeCoordinationDepartment,
    required TResult Function(int? id, String? displayName) changeApprover,
    required TResult Function(List<String> names) changeAttachments,
    required TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)
        submit,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) initDetail,
    required TResult Function(List<int> ids) deleteRequirement,
    required TResult Function() clearDeleteSuccess,
  }) {
    return initAdd();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? refresh,
    TResult? Function()? initAdd,
    TResult? Function(int rowIndex, String field, String value)?
        updateFormField,
    TResult? Function(DateTime? date)? changeDateRequest,
    TResult? Function(DateTime? date)? changeDeadline,
    TResult? Function(int? id, String? name)? changeRequiredDepartment,
    TResult? Function(int? id, String? name)? changeCoordinationDepartment,
    TResult? Function(int? id, String? displayName)? changeApprover,
    TResult? Function(List<String> names)? changeAttachments,
    TResult? Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? initDetail,
    TResult? Function(List<int> ids)? deleteRequirement,
    TResult? Function()? clearDeleteSuccess,
  }) {
    return initAdd?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? refresh,
    TResult Function()? initAdd,
    TResult Function(int rowIndex, String field, String value)? updateFormField,
    TResult Function(DateTime? date)? changeDateRequest,
    TResult Function(DateTime? date)? changeDeadline,
    TResult Function(int? id, String? name)? changeRequiredDepartment,
    TResult Function(int? id, String? name)? changeCoordinationDepartment,
    TResult Function(int? id, String? displayName)? changeApprover,
    TResult Function(List<String> names)? changeAttachments,
    TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? initDetail,
    TResult Function(List<int> ids)? deleteRequirement,
    TResult Function()? clearDeleteSuccess,
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
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_UpdateFormField value) updateFormField,
    required TResult Function(_ChangeDateRequest value) changeDateRequest,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeRequiredDepartment value)
        changeRequiredDepartment,
    required TResult Function(_ChangeCoordinationDepartment value)
        changeCoordinationDepartment,
    required TResult Function(_ChangeApprover value) changeApprover,
    required TResult Function(_ChangeAttachments value) changeAttachments,
    required TResult Function(_Submit value) submit,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_DeleteRequirement value) deleteRequirement,
    required TResult Function(_ClearDeleteSuccess value) clearDeleteSuccess,
  }) {
    return initAdd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_UpdateFormField value)? updateFormField,
    TResult? Function(_ChangeDateRequest value)? changeDateRequest,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeRequiredDepartment value)?
        changeRequiredDepartment,
    TResult? Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult? Function(_ChangeApprover value)? changeApprover,
    TResult? Function(_ChangeAttachments value)? changeAttachments,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_DeleteRequirement value)? deleteRequirement,
    TResult? Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
  }) {
    return initAdd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_UpdateFormField value)? updateFormField,
    TResult Function(_ChangeDateRequest value)? changeDateRequest,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeRequiredDepartment value)? changeRequiredDepartment,
    TResult Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult Function(_ChangeApprover value)? changeApprover,
    TResult Function(_ChangeAttachments value)? changeAttachments,
    TResult Function(_Submit value)? submit,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_DeleteRequirement value)? deleteRequirement,
    TResult Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
    required TResult orElse(),
  }) {
    if (initAdd != null) {
      return initAdd(this);
    }
    return orElse();
  }
}

abstract class _InitAdd implements WorkRequirementEvent {
  const factory _InitAdd() = _$InitAddImpl;
}

/// @nodoc
abstract class _$$UpdateFormFieldImplCopyWith<$Res> {
  factory _$$UpdateFormFieldImplCopyWith(_$UpdateFormFieldImpl value,
          $Res Function(_$UpdateFormFieldImpl) then) =
      __$$UpdateFormFieldImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int rowIndex, String field, String value});
}

/// @nodoc
class __$$UpdateFormFieldImplCopyWithImpl<$Res>
    extends _$WorkRequirementEventCopyWithImpl<$Res, _$UpdateFormFieldImpl>
    implements _$$UpdateFormFieldImplCopyWith<$Res> {
  __$$UpdateFormFieldImplCopyWithImpl(
      _$UpdateFormFieldImpl _value, $Res Function(_$UpdateFormFieldImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rowIndex = null,
    Object? field = null,
    Object? value = null,
  }) {
    return _then(_$UpdateFormFieldImpl(
      rowIndex: null == rowIndex
          ? _value.rowIndex
          : rowIndex // ignore: cast_nullable_to_non_nullable
              as int,
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateFormFieldImpl implements _UpdateFormField {
  const _$UpdateFormFieldImpl(
      {required this.rowIndex, required this.field, required this.value});

  @override
  final int rowIndex;
  @override
  final String field;
  @override
  final String value;

  @override
  String toString() {
    return 'WorkRequirementEvent.updateFormField(rowIndex: $rowIndex, field: $field, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateFormFieldImpl &&
            (identical(other.rowIndex, rowIndex) ||
                other.rowIndex == rowIndex) &&
            (identical(other.field, field) || other.field == field) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rowIndex, field, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateFormFieldImplCopyWith<_$UpdateFormFieldImpl> get copyWith =>
      __$$UpdateFormFieldImplCopyWithImpl<_$UpdateFormFieldImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() refresh,
    required TResult Function() initAdd,
    required TResult Function(int rowIndex, String field, String value)
        updateFormField,
    required TResult Function(DateTime? date) changeDateRequest,
    required TResult Function(DateTime? date) changeDeadline,
    required TResult Function(int? id, String? name) changeRequiredDepartment,
    required TResult Function(int? id, String? name)
        changeCoordinationDepartment,
    required TResult Function(int? id, String? displayName) changeApprover,
    required TResult Function(List<String> names) changeAttachments,
    required TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)
        submit,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) initDetail,
    required TResult Function(List<int> ids) deleteRequirement,
    required TResult Function() clearDeleteSuccess,
  }) {
    return updateFormField(rowIndex, field, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? refresh,
    TResult? Function()? initAdd,
    TResult? Function(int rowIndex, String field, String value)?
        updateFormField,
    TResult? Function(DateTime? date)? changeDateRequest,
    TResult? Function(DateTime? date)? changeDeadline,
    TResult? Function(int? id, String? name)? changeRequiredDepartment,
    TResult? Function(int? id, String? name)? changeCoordinationDepartment,
    TResult? Function(int? id, String? displayName)? changeApprover,
    TResult? Function(List<String> names)? changeAttachments,
    TResult? Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? initDetail,
    TResult? Function(List<int> ids)? deleteRequirement,
    TResult? Function()? clearDeleteSuccess,
  }) {
    return updateFormField?.call(rowIndex, field, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? refresh,
    TResult Function()? initAdd,
    TResult Function(int rowIndex, String field, String value)? updateFormField,
    TResult Function(DateTime? date)? changeDateRequest,
    TResult Function(DateTime? date)? changeDeadline,
    TResult Function(int? id, String? name)? changeRequiredDepartment,
    TResult Function(int? id, String? name)? changeCoordinationDepartment,
    TResult Function(int? id, String? displayName)? changeApprover,
    TResult Function(List<String> names)? changeAttachments,
    TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? initDetail,
    TResult Function(List<int> ids)? deleteRequirement,
    TResult Function()? clearDeleteSuccess,
    required TResult orElse(),
  }) {
    if (updateFormField != null) {
      return updateFormField(rowIndex, field, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_UpdateFormField value) updateFormField,
    required TResult Function(_ChangeDateRequest value) changeDateRequest,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeRequiredDepartment value)
        changeRequiredDepartment,
    required TResult Function(_ChangeCoordinationDepartment value)
        changeCoordinationDepartment,
    required TResult Function(_ChangeApprover value) changeApprover,
    required TResult Function(_ChangeAttachments value) changeAttachments,
    required TResult Function(_Submit value) submit,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_DeleteRequirement value) deleteRequirement,
    required TResult Function(_ClearDeleteSuccess value) clearDeleteSuccess,
  }) {
    return updateFormField(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_UpdateFormField value)? updateFormField,
    TResult? Function(_ChangeDateRequest value)? changeDateRequest,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeRequiredDepartment value)?
        changeRequiredDepartment,
    TResult? Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult? Function(_ChangeApprover value)? changeApprover,
    TResult? Function(_ChangeAttachments value)? changeAttachments,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_DeleteRequirement value)? deleteRequirement,
    TResult? Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
  }) {
    return updateFormField?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_UpdateFormField value)? updateFormField,
    TResult Function(_ChangeDateRequest value)? changeDateRequest,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeRequiredDepartment value)? changeRequiredDepartment,
    TResult Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult Function(_ChangeApprover value)? changeApprover,
    TResult Function(_ChangeAttachments value)? changeAttachments,
    TResult Function(_Submit value)? submit,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_DeleteRequirement value)? deleteRequirement,
    TResult Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
    required TResult orElse(),
  }) {
    if (updateFormField != null) {
      return updateFormField(this);
    }
    return orElse();
  }
}

abstract class _UpdateFormField implements WorkRequirementEvent {
  const factory _UpdateFormField(
      {required final int rowIndex,
      required final String field,
      required final String value}) = _$UpdateFormFieldImpl;

  int get rowIndex;
  String get field;
  String get value;
  @JsonKey(ignore: true)
  _$$UpdateFormFieldImplCopyWith<_$UpdateFormFieldImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeDateRequestImplCopyWith<$Res> {
  factory _$$ChangeDateRequestImplCopyWith(_$ChangeDateRequestImpl value,
          $Res Function(_$ChangeDateRequestImpl) then) =
      __$$ChangeDateRequestImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime? date});
}

/// @nodoc
class __$$ChangeDateRequestImplCopyWithImpl<$Res>
    extends _$WorkRequirementEventCopyWithImpl<$Res, _$ChangeDateRequestImpl>
    implements _$$ChangeDateRequestImplCopyWith<$Res> {
  __$$ChangeDateRequestImplCopyWithImpl(_$ChangeDateRequestImpl _value,
      $Res Function(_$ChangeDateRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
  }) {
    return _then(_$ChangeDateRequestImpl(
      freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$ChangeDateRequestImpl implements _ChangeDateRequest {
  const _$ChangeDateRequestImpl(this.date);

  @override
  final DateTime? date;

  @override
  String toString() {
    return 'WorkRequirementEvent.changeDateRequest(date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeDateRequestImpl &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeDateRequestImplCopyWith<_$ChangeDateRequestImpl> get copyWith =>
      __$$ChangeDateRequestImplCopyWithImpl<_$ChangeDateRequestImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() refresh,
    required TResult Function() initAdd,
    required TResult Function(int rowIndex, String field, String value)
        updateFormField,
    required TResult Function(DateTime? date) changeDateRequest,
    required TResult Function(DateTime? date) changeDeadline,
    required TResult Function(int? id, String? name) changeRequiredDepartment,
    required TResult Function(int? id, String? name)
        changeCoordinationDepartment,
    required TResult Function(int? id, String? displayName) changeApprover,
    required TResult Function(List<String> names) changeAttachments,
    required TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)
        submit,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) initDetail,
    required TResult Function(List<int> ids) deleteRequirement,
    required TResult Function() clearDeleteSuccess,
  }) {
    return changeDateRequest(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? refresh,
    TResult? Function()? initAdd,
    TResult? Function(int rowIndex, String field, String value)?
        updateFormField,
    TResult? Function(DateTime? date)? changeDateRequest,
    TResult? Function(DateTime? date)? changeDeadline,
    TResult? Function(int? id, String? name)? changeRequiredDepartment,
    TResult? Function(int? id, String? name)? changeCoordinationDepartment,
    TResult? Function(int? id, String? displayName)? changeApprover,
    TResult? Function(List<String> names)? changeAttachments,
    TResult? Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? initDetail,
    TResult? Function(List<int> ids)? deleteRequirement,
    TResult? Function()? clearDeleteSuccess,
  }) {
    return changeDateRequest?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? refresh,
    TResult Function()? initAdd,
    TResult Function(int rowIndex, String field, String value)? updateFormField,
    TResult Function(DateTime? date)? changeDateRequest,
    TResult Function(DateTime? date)? changeDeadline,
    TResult Function(int? id, String? name)? changeRequiredDepartment,
    TResult Function(int? id, String? name)? changeCoordinationDepartment,
    TResult Function(int? id, String? displayName)? changeApprover,
    TResult Function(List<String> names)? changeAttachments,
    TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? initDetail,
    TResult Function(List<int> ids)? deleteRequirement,
    TResult Function()? clearDeleteSuccess,
    required TResult orElse(),
  }) {
    if (changeDateRequest != null) {
      return changeDateRequest(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_UpdateFormField value) updateFormField,
    required TResult Function(_ChangeDateRequest value) changeDateRequest,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeRequiredDepartment value)
        changeRequiredDepartment,
    required TResult Function(_ChangeCoordinationDepartment value)
        changeCoordinationDepartment,
    required TResult Function(_ChangeApprover value) changeApprover,
    required TResult Function(_ChangeAttachments value) changeAttachments,
    required TResult Function(_Submit value) submit,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_DeleteRequirement value) deleteRequirement,
    required TResult Function(_ClearDeleteSuccess value) clearDeleteSuccess,
  }) {
    return changeDateRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_UpdateFormField value)? updateFormField,
    TResult? Function(_ChangeDateRequest value)? changeDateRequest,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeRequiredDepartment value)?
        changeRequiredDepartment,
    TResult? Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult? Function(_ChangeApprover value)? changeApprover,
    TResult? Function(_ChangeAttachments value)? changeAttachments,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_DeleteRequirement value)? deleteRequirement,
    TResult? Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
  }) {
    return changeDateRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_UpdateFormField value)? updateFormField,
    TResult Function(_ChangeDateRequest value)? changeDateRequest,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeRequiredDepartment value)? changeRequiredDepartment,
    TResult Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult Function(_ChangeApprover value)? changeApprover,
    TResult Function(_ChangeAttachments value)? changeAttachments,
    TResult Function(_Submit value)? submit,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_DeleteRequirement value)? deleteRequirement,
    TResult Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
    required TResult orElse(),
  }) {
    if (changeDateRequest != null) {
      return changeDateRequest(this);
    }
    return orElse();
  }
}

abstract class _ChangeDateRequest implements WorkRequirementEvent {
  const factory _ChangeDateRequest(final DateTime? date) =
      _$ChangeDateRequestImpl;

  DateTime? get date;
  @JsonKey(ignore: true)
  _$$ChangeDateRequestImplCopyWith<_$ChangeDateRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeDeadlineImplCopyWith<$Res> {
  factory _$$ChangeDeadlineImplCopyWith(_$ChangeDeadlineImpl value,
          $Res Function(_$ChangeDeadlineImpl) then) =
      __$$ChangeDeadlineImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime? date});
}

/// @nodoc
class __$$ChangeDeadlineImplCopyWithImpl<$Res>
    extends _$WorkRequirementEventCopyWithImpl<$Res, _$ChangeDeadlineImpl>
    implements _$$ChangeDeadlineImplCopyWith<$Res> {
  __$$ChangeDeadlineImplCopyWithImpl(
      _$ChangeDeadlineImpl _value, $Res Function(_$ChangeDeadlineImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
  }) {
    return _then(_$ChangeDeadlineImpl(
      freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$ChangeDeadlineImpl implements _ChangeDeadline {
  const _$ChangeDeadlineImpl(this.date);

  @override
  final DateTime? date;

  @override
  String toString() {
    return 'WorkRequirementEvent.changeDeadline(date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeDeadlineImpl &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeDeadlineImplCopyWith<_$ChangeDeadlineImpl> get copyWith =>
      __$$ChangeDeadlineImplCopyWithImpl<_$ChangeDeadlineImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() refresh,
    required TResult Function() initAdd,
    required TResult Function(int rowIndex, String field, String value)
        updateFormField,
    required TResult Function(DateTime? date) changeDateRequest,
    required TResult Function(DateTime? date) changeDeadline,
    required TResult Function(int? id, String? name) changeRequiredDepartment,
    required TResult Function(int? id, String? name)
        changeCoordinationDepartment,
    required TResult Function(int? id, String? displayName) changeApprover,
    required TResult Function(List<String> names) changeAttachments,
    required TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)
        submit,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) initDetail,
    required TResult Function(List<int> ids) deleteRequirement,
    required TResult Function() clearDeleteSuccess,
  }) {
    return changeDeadline(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? refresh,
    TResult? Function()? initAdd,
    TResult? Function(int rowIndex, String field, String value)?
        updateFormField,
    TResult? Function(DateTime? date)? changeDateRequest,
    TResult? Function(DateTime? date)? changeDeadline,
    TResult? Function(int? id, String? name)? changeRequiredDepartment,
    TResult? Function(int? id, String? name)? changeCoordinationDepartment,
    TResult? Function(int? id, String? displayName)? changeApprover,
    TResult? Function(List<String> names)? changeAttachments,
    TResult? Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? initDetail,
    TResult? Function(List<int> ids)? deleteRequirement,
    TResult? Function()? clearDeleteSuccess,
  }) {
    return changeDeadline?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? refresh,
    TResult Function()? initAdd,
    TResult Function(int rowIndex, String field, String value)? updateFormField,
    TResult Function(DateTime? date)? changeDateRequest,
    TResult Function(DateTime? date)? changeDeadline,
    TResult Function(int? id, String? name)? changeRequiredDepartment,
    TResult Function(int? id, String? name)? changeCoordinationDepartment,
    TResult Function(int? id, String? displayName)? changeApprover,
    TResult Function(List<String> names)? changeAttachments,
    TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? initDetail,
    TResult Function(List<int> ids)? deleteRequirement,
    TResult Function()? clearDeleteSuccess,
    required TResult orElse(),
  }) {
    if (changeDeadline != null) {
      return changeDeadline(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_UpdateFormField value) updateFormField,
    required TResult Function(_ChangeDateRequest value) changeDateRequest,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeRequiredDepartment value)
        changeRequiredDepartment,
    required TResult Function(_ChangeCoordinationDepartment value)
        changeCoordinationDepartment,
    required TResult Function(_ChangeApprover value) changeApprover,
    required TResult Function(_ChangeAttachments value) changeAttachments,
    required TResult Function(_Submit value) submit,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_DeleteRequirement value) deleteRequirement,
    required TResult Function(_ClearDeleteSuccess value) clearDeleteSuccess,
  }) {
    return changeDeadline(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_UpdateFormField value)? updateFormField,
    TResult? Function(_ChangeDateRequest value)? changeDateRequest,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeRequiredDepartment value)?
        changeRequiredDepartment,
    TResult? Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult? Function(_ChangeApprover value)? changeApprover,
    TResult? Function(_ChangeAttachments value)? changeAttachments,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_DeleteRequirement value)? deleteRequirement,
    TResult? Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
  }) {
    return changeDeadline?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_UpdateFormField value)? updateFormField,
    TResult Function(_ChangeDateRequest value)? changeDateRequest,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeRequiredDepartment value)? changeRequiredDepartment,
    TResult Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult Function(_ChangeApprover value)? changeApprover,
    TResult Function(_ChangeAttachments value)? changeAttachments,
    TResult Function(_Submit value)? submit,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_DeleteRequirement value)? deleteRequirement,
    TResult Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
    required TResult orElse(),
  }) {
    if (changeDeadline != null) {
      return changeDeadline(this);
    }
    return orElse();
  }
}

abstract class _ChangeDeadline implements WorkRequirementEvent {
  const factory _ChangeDeadline(final DateTime? date) = _$ChangeDeadlineImpl;

  DateTime? get date;
  @JsonKey(ignore: true)
  _$$ChangeDeadlineImplCopyWith<_$ChangeDeadlineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeRequiredDepartmentImplCopyWith<$Res> {
  factory _$$ChangeRequiredDepartmentImplCopyWith(
          _$ChangeRequiredDepartmentImpl value,
          $Res Function(_$ChangeRequiredDepartmentImpl) then) =
      __$$ChangeRequiredDepartmentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$ChangeRequiredDepartmentImplCopyWithImpl<$Res>
    extends _$WorkRequirementEventCopyWithImpl<$Res,
        _$ChangeRequiredDepartmentImpl>
    implements _$$ChangeRequiredDepartmentImplCopyWith<$Res> {
  __$$ChangeRequiredDepartmentImplCopyWithImpl(
      _$ChangeRequiredDepartmentImpl _value,
      $Res Function(_$ChangeRequiredDepartmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$ChangeRequiredDepartmentImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ChangeRequiredDepartmentImpl implements _ChangeRequiredDepartment {
  const _$ChangeRequiredDepartmentImpl({required this.id, this.name});

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'WorkRequirementEvent.changeRequiredDepartment(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeRequiredDepartmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeRequiredDepartmentImplCopyWith<_$ChangeRequiredDepartmentImpl>
      get copyWith => __$$ChangeRequiredDepartmentImplCopyWithImpl<
          _$ChangeRequiredDepartmentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() refresh,
    required TResult Function() initAdd,
    required TResult Function(int rowIndex, String field, String value)
        updateFormField,
    required TResult Function(DateTime? date) changeDateRequest,
    required TResult Function(DateTime? date) changeDeadline,
    required TResult Function(int? id, String? name) changeRequiredDepartment,
    required TResult Function(int? id, String? name)
        changeCoordinationDepartment,
    required TResult Function(int? id, String? displayName) changeApprover,
    required TResult Function(List<String> names) changeAttachments,
    required TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)
        submit,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) initDetail,
    required TResult Function(List<int> ids) deleteRequirement,
    required TResult Function() clearDeleteSuccess,
  }) {
    return changeRequiredDepartment(id, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? refresh,
    TResult? Function()? initAdd,
    TResult? Function(int rowIndex, String field, String value)?
        updateFormField,
    TResult? Function(DateTime? date)? changeDateRequest,
    TResult? Function(DateTime? date)? changeDeadline,
    TResult? Function(int? id, String? name)? changeRequiredDepartment,
    TResult? Function(int? id, String? name)? changeCoordinationDepartment,
    TResult? Function(int? id, String? displayName)? changeApprover,
    TResult? Function(List<String> names)? changeAttachments,
    TResult? Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? initDetail,
    TResult? Function(List<int> ids)? deleteRequirement,
    TResult? Function()? clearDeleteSuccess,
  }) {
    return changeRequiredDepartment?.call(id, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? refresh,
    TResult Function()? initAdd,
    TResult Function(int rowIndex, String field, String value)? updateFormField,
    TResult Function(DateTime? date)? changeDateRequest,
    TResult Function(DateTime? date)? changeDeadline,
    TResult Function(int? id, String? name)? changeRequiredDepartment,
    TResult Function(int? id, String? name)? changeCoordinationDepartment,
    TResult Function(int? id, String? displayName)? changeApprover,
    TResult Function(List<String> names)? changeAttachments,
    TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? initDetail,
    TResult Function(List<int> ids)? deleteRequirement,
    TResult Function()? clearDeleteSuccess,
    required TResult orElse(),
  }) {
    if (changeRequiredDepartment != null) {
      return changeRequiredDepartment(id, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_UpdateFormField value) updateFormField,
    required TResult Function(_ChangeDateRequest value) changeDateRequest,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeRequiredDepartment value)
        changeRequiredDepartment,
    required TResult Function(_ChangeCoordinationDepartment value)
        changeCoordinationDepartment,
    required TResult Function(_ChangeApprover value) changeApprover,
    required TResult Function(_ChangeAttachments value) changeAttachments,
    required TResult Function(_Submit value) submit,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_DeleteRequirement value) deleteRequirement,
    required TResult Function(_ClearDeleteSuccess value) clearDeleteSuccess,
  }) {
    return changeRequiredDepartment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_UpdateFormField value)? updateFormField,
    TResult? Function(_ChangeDateRequest value)? changeDateRequest,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeRequiredDepartment value)?
        changeRequiredDepartment,
    TResult? Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult? Function(_ChangeApprover value)? changeApprover,
    TResult? Function(_ChangeAttachments value)? changeAttachments,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_DeleteRequirement value)? deleteRequirement,
    TResult? Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
  }) {
    return changeRequiredDepartment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_UpdateFormField value)? updateFormField,
    TResult Function(_ChangeDateRequest value)? changeDateRequest,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeRequiredDepartment value)? changeRequiredDepartment,
    TResult Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult Function(_ChangeApprover value)? changeApprover,
    TResult Function(_ChangeAttachments value)? changeAttachments,
    TResult Function(_Submit value)? submit,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_DeleteRequirement value)? deleteRequirement,
    TResult Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
    required TResult orElse(),
  }) {
    if (changeRequiredDepartment != null) {
      return changeRequiredDepartment(this);
    }
    return orElse();
  }
}

abstract class _ChangeRequiredDepartment implements WorkRequirementEvent {
  const factory _ChangeRequiredDepartment(
      {required final int? id,
      final String? name}) = _$ChangeRequiredDepartmentImpl;

  int? get id;
  String? get name;
  @JsonKey(ignore: true)
  _$$ChangeRequiredDepartmentImplCopyWith<_$ChangeRequiredDepartmentImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeCoordinationDepartmentImplCopyWith<$Res> {
  factory _$$ChangeCoordinationDepartmentImplCopyWith(
          _$ChangeCoordinationDepartmentImpl value,
          $Res Function(_$ChangeCoordinationDepartmentImpl) then) =
      __$$ChangeCoordinationDepartmentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$ChangeCoordinationDepartmentImplCopyWithImpl<$Res>
    extends _$WorkRequirementEventCopyWithImpl<$Res,
        _$ChangeCoordinationDepartmentImpl>
    implements _$$ChangeCoordinationDepartmentImplCopyWith<$Res> {
  __$$ChangeCoordinationDepartmentImplCopyWithImpl(
      _$ChangeCoordinationDepartmentImpl _value,
      $Res Function(_$ChangeCoordinationDepartmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$ChangeCoordinationDepartmentImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ChangeCoordinationDepartmentImpl
    implements _ChangeCoordinationDepartment {
  const _$ChangeCoordinationDepartmentImpl({required this.id, this.name});

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'WorkRequirementEvent.changeCoordinationDepartment(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeCoordinationDepartmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeCoordinationDepartmentImplCopyWith<
          _$ChangeCoordinationDepartmentImpl>
      get copyWith => __$$ChangeCoordinationDepartmentImplCopyWithImpl<
          _$ChangeCoordinationDepartmentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() refresh,
    required TResult Function() initAdd,
    required TResult Function(int rowIndex, String field, String value)
        updateFormField,
    required TResult Function(DateTime? date) changeDateRequest,
    required TResult Function(DateTime? date) changeDeadline,
    required TResult Function(int? id, String? name) changeRequiredDepartment,
    required TResult Function(int? id, String? name)
        changeCoordinationDepartment,
    required TResult Function(int? id, String? displayName) changeApprover,
    required TResult Function(List<String> names) changeAttachments,
    required TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)
        submit,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) initDetail,
    required TResult Function(List<int> ids) deleteRequirement,
    required TResult Function() clearDeleteSuccess,
  }) {
    return changeCoordinationDepartment(id, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? refresh,
    TResult? Function()? initAdd,
    TResult? Function(int rowIndex, String field, String value)?
        updateFormField,
    TResult? Function(DateTime? date)? changeDateRequest,
    TResult? Function(DateTime? date)? changeDeadline,
    TResult? Function(int? id, String? name)? changeRequiredDepartment,
    TResult? Function(int? id, String? name)? changeCoordinationDepartment,
    TResult? Function(int? id, String? displayName)? changeApprover,
    TResult? Function(List<String> names)? changeAttachments,
    TResult? Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? initDetail,
    TResult? Function(List<int> ids)? deleteRequirement,
    TResult? Function()? clearDeleteSuccess,
  }) {
    return changeCoordinationDepartment?.call(id, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? refresh,
    TResult Function()? initAdd,
    TResult Function(int rowIndex, String field, String value)? updateFormField,
    TResult Function(DateTime? date)? changeDateRequest,
    TResult Function(DateTime? date)? changeDeadline,
    TResult Function(int? id, String? name)? changeRequiredDepartment,
    TResult Function(int? id, String? name)? changeCoordinationDepartment,
    TResult Function(int? id, String? displayName)? changeApprover,
    TResult Function(List<String> names)? changeAttachments,
    TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? initDetail,
    TResult Function(List<int> ids)? deleteRequirement,
    TResult Function()? clearDeleteSuccess,
    required TResult orElse(),
  }) {
    if (changeCoordinationDepartment != null) {
      return changeCoordinationDepartment(id, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_UpdateFormField value) updateFormField,
    required TResult Function(_ChangeDateRequest value) changeDateRequest,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeRequiredDepartment value)
        changeRequiredDepartment,
    required TResult Function(_ChangeCoordinationDepartment value)
        changeCoordinationDepartment,
    required TResult Function(_ChangeApprover value) changeApprover,
    required TResult Function(_ChangeAttachments value) changeAttachments,
    required TResult Function(_Submit value) submit,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_DeleteRequirement value) deleteRequirement,
    required TResult Function(_ClearDeleteSuccess value) clearDeleteSuccess,
  }) {
    return changeCoordinationDepartment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_UpdateFormField value)? updateFormField,
    TResult? Function(_ChangeDateRequest value)? changeDateRequest,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeRequiredDepartment value)?
        changeRequiredDepartment,
    TResult? Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult? Function(_ChangeApprover value)? changeApprover,
    TResult? Function(_ChangeAttachments value)? changeAttachments,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_DeleteRequirement value)? deleteRequirement,
    TResult? Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
  }) {
    return changeCoordinationDepartment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_UpdateFormField value)? updateFormField,
    TResult Function(_ChangeDateRequest value)? changeDateRequest,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeRequiredDepartment value)? changeRequiredDepartment,
    TResult Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult Function(_ChangeApprover value)? changeApprover,
    TResult Function(_ChangeAttachments value)? changeAttachments,
    TResult Function(_Submit value)? submit,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_DeleteRequirement value)? deleteRequirement,
    TResult Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
    required TResult orElse(),
  }) {
    if (changeCoordinationDepartment != null) {
      return changeCoordinationDepartment(this);
    }
    return orElse();
  }
}

abstract class _ChangeCoordinationDepartment implements WorkRequirementEvent {
  const factory _ChangeCoordinationDepartment(
      {required final int? id,
      final String? name}) = _$ChangeCoordinationDepartmentImpl;

  int? get id;
  String? get name;
  @JsonKey(ignore: true)
  _$$ChangeCoordinationDepartmentImplCopyWith<
          _$ChangeCoordinationDepartmentImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeApproverImplCopyWith<$Res> {
  factory _$$ChangeApproverImplCopyWith(_$ChangeApproverImpl value,
          $Res Function(_$ChangeApproverImpl) then) =
      __$$ChangeApproverImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? id, String? displayName});
}

/// @nodoc
class __$$ChangeApproverImplCopyWithImpl<$Res>
    extends _$WorkRequirementEventCopyWithImpl<$Res, _$ChangeApproverImpl>
    implements _$$ChangeApproverImplCopyWith<$Res> {
  __$$ChangeApproverImplCopyWithImpl(
      _$ChangeApproverImpl _value, $Res Function(_$ChangeApproverImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? displayName = freezed,
  }) {
    return _then(_$ChangeApproverImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ChangeApproverImpl implements _ChangeApprover {
  const _$ChangeApproverImpl({required this.id, this.displayName});

  @override
  final int? id;
  @override
  final String? displayName;

  @override
  String toString() {
    return 'WorkRequirementEvent.changeApprover(id: $id, displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeApproverImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, displayName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeApproverImplCopyWith<_$ChangeApproverImpl> get copyWith =>
      __$$ChangeApproverImplCopyWithImpl<_$ChangeApproverImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() refresh,
    required TResult Function() initAdd,
    required TResult Function(int rowIndex, String field, String value)
        updateFormField,
    required TResult Function(DateTime? date) changeDateRequest,
    required TResult Function(DateTime? date) changeDeadline,
    required TResult Function(int? id, String? name) changeRequiredDepartment,
    required TResult Function(int? id, String? name)
        changeCoordinationDepartment,
    required TResult Function(int? id, String? displayName) changeApprover,
    required TResult Function(List<String> names) changeAttachments,
    required TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)
        submit,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) initDetail,
    required TResult Function(List<int> ids) deleteRequirement,
    required TResult Function() clearDeleteSuccess,
  }) {
    return changeApprover(id, displayName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? refresh,
    TResult? Function()? initAdd,
    TResult? Function(int rowIndex, String field, String value)?
        updateFormField,
    TResult? Function(DateTime? date)? changeDateRequest,
    TResult? Function(DateTime? date)? changeDeadline,
    TResult? Function(int? id, String? name)? changeRequiredDepartment,
    TResult? Function(int? id, String? name)? changeCoordinationDepartment,
    TResult? Function(int? id, String? displayName)? changeApprover,
    TResult? Function(List<String> names)? changeAttachments,
    TResult? Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? initDetail,
    TResult? Function(List<int> ids)? deleteRequirement,
    TResult? Function()? clearDeleteSuccess,
  }) {
    return changeApprover?.call(id, displayName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? refresh,
    TResult Function()? initAdd,
    TResult Function(int rowIndex, String field, String value)? updateFormField,
    TResult Function(DateTime? date)? changeDateRequest,
    TResult Function(DateTime? date)? changeDeadline,
    TResult Function(int? id, String? name)? changeRequiredDepartment,
    TResult Function(int? id, String? name)? changeCoordinationDepartment,
    TResult Function(int? id, String? displayName)? changeApprover,
    TResult Function(List<String> names)? changeAttachments,
    TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? initDetail,
    TResult Function(List<int> ids)? deleteRequirement,
    TResult Function()? clearDeleteSuccess,
    required TResult orElse(),
  }) {
    if (changeApprover != null) {
      return changeApprover(id, displayName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_UpdateFormField value) updateFormField,
    required TResult Function(_ChangeDateRequest value) changeDateRequest,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeRequiredDepartment value)
        changeRequiredDepartment,
    required TResult Function(_ChangeCoordinationDepartment value)
        changeCoordinationDepartment,
    required TResult Function(_ChangeApprover value) changeApprover,
    required TResult Function(_ChangeAttachments value) changeAttachments,
    required TResult Function(_Submit value) submit,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_DeleteRequirement value) deleteRequirement,
    required TResult Function(_ClearDeleteSuccess value) clearDeleteSuccess,
  }) {
    return changeApprover(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_UpdateFormField value)? updateFormField,
    TResult? Function(_ChangeDateRequest value)? changeDateRequest,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeRequiredDepartment value)?
        changeRequiredDepartment,
    TResult? Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult? Function(_ChangeApprover value)? changeApprover,
    TResult? Function(_ChangeAttachments value)? changeAttachments,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_DeleteRequirement value)? deleteRequirement,
    TResult? Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
  }) {
    return changeApprover?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_UpdateFormField value)? updateFormField,
    TResult Function(_ChangeDateRequest value)? changeDateRequest,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeRequiredDepartment value)? changeRequiredDepartment,
    TResult Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult Function(_ChangeApprover value)? changeApprover,
    TResult Function(_ChangeAttachments value)? changeAttachments,
    TResult Function(_Submit value)? submit,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_DeleteRequirement value)? deleteRequirement,
    TResult Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
    required TResult orElse(),
  }) {
    if (changeApprover != null) {
      return changeApprover(this);
    }
    return orElse();
  }
}

abstract class _ChangeApprover implements WorkRequirementEvent {
  const factory _ChangeApprover(
      {required final int? id,
      final String? displayName}) = _$ChangeApproverImpl;

  int? get id;
  String? get displayName;
  @JsonKey(ignore: true)
  _$$ChangeApproverImplCopyWith<_$ChangeApproverImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeAttachmentsImplCopyWith<$Res> {
  factory _$$ChangeAttachmentsImplCopyWith(_$ChangeAttachmentsImpl value,
          $Res Function(_$ChangeAttachmentsImpl) then) =
      __$$ChangeAttachmentsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> names});
}

/// @nodoc
class __$$ChangeAttachmentsImplCopyWithImpl<$Res>
    extends _$WorkRequirementEventCopyWithImpl<$Res, _$ChangeAttachmentsImpl>
    implements _$$ChangeAttachmentsImplCopyWith<$Res> {
  __$$ChangeAttachmentsImplCopyWithImpl(_$ChangeAttachmentsImpl _value,
      $Res Function(_$ChangeAttachmentsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? names = null,
  }) {
    return _then(_$ChangeAttachmentsImpl(
      null == names
          ? _value._names
          : names // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$ChangeAttachmentsImpl implements _ChangeAttachments {
  const _$ChangeAttachmentsImpl(final List<String> names) : _names = names;

  final List<String> _names;
  @override
  List<String> get names {
    if (_names is EqualUnmodifiableListView) return _names;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_names);
  }

  @override
  String toString() {
    return 'WorkRequirementEvent.changeAttachments(names: $names)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeAttachmentsImpl &&
            const DeepCollectionEquality().equals(other._names, _names));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_names));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeAttachmentsImplCopyWith<_$ChangeAttachmentsImpl> get copyWith =>
      __$$ChangeAttachmentsImplCopyWithImpl<_$ChangeAttachmentsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() refresh,
    required TResult Function() initAdd,
    required TResult Function(int rowIndex, String field, String value)
        updateFormField,
    required TResult Function(DateTime? date) changeDateRequest,
    required TResult Function(DateTime? date) changeDeadline,
    required TResult Function(int? id, String? name) changeRequiredDepartment,
    required TResult Function(int? id, String? name)
        changeCoordinationDepartment,
    required TResult Function(int? id, String? displayName) changeApprover,
    required TResult Function(List<String> names) changeAttachments,
    required TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)
        submit,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) initDetail,
    required TResult Function(List<int> ids) deleteRequirement,
    required TResult Function() clearDeleteSuccess,
  }) {
    return changeAttachments(names);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? refresh,
    TResult? Function()? initAdd,
    TResult? Function(int rowIndex, String field, String value)?
        updateFormField,
    TResult? Function(DateTime? date)? changeDateRequest,
    TResult? Function(DateTime? date)? changeDeadline,
    TResult? Function(int? id, String? name)? changeRequiredDepartment,
    TResult? Function(int? id, String? name)? changeCoordinationDepartment,
    TResult? Function(int? id, String? displayName)? changeApprover,
    TResult? Function(List<String> names)? changeAttachments,
    TResult? Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? initDetail,
    TResult? Function(List<int> ids)? deleteRequirement,
    TResult? Function()? clearDeleteSuccess,
  }) {
    return changeAttachments?.call(names);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? refresh,
    TResult Function()? initAdd,
    TResult Function(int rowIndex, String field, String value)? updateFormField,
    TResult Function(DateTime? date)? changeDateRequest,
    TResult Function(DateTime? date)? changeDeadline,
    TResult Function(int? id, String? name)? changeRequiredDepartment,
    TResult Function(int? id, String? name)? changeCoordinationDepartment,
    TResult Function(int? id, String? displayName)? changeApprover,
    TResult Function(List<String> names)? changeAttachments,
    TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? initDetail,
    TResult Function(List<int> ids)? deleteRequirement,
    TResult Function()? clearDeleteSuccess,
    required TResult orElse(),
  }) {
    if (changeAttachments != null) {
      return changeAttachments(names);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_UpdateFormField value) updateFormField,
    required TResult Function(_ChangeDateRequest value) changeDateRequest,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeRequiredDepartment value)
        changeRequiredDepartment,
    required TResult Function(_ChangeCoordinationDepartment value)
        changeCoordinationDepartment,
    required TResult Function(_ChangeApprover value) changeApprover,
    required TResult Function(_ChangeAttachments value) changeAttachments,
    required TResult Function(_Submit value) submit,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_DeleteRequirement value) deleteRequirement,
    required TResult Function(_ClearDeleteSuccess value) clearDeleteSuccess,
  }) {
    return changeAttachments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_UpdateFormField value)? updateFormField,
    TResult? Function(_ChangeDateRequest value)? changeDateRequest,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeRequiredDepartment value)?
        changeRequiredDepartment,
    TResult? Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult? Function(_ChangeApprover value)? changeApprover,
    TResult? Function(_ChangeAttachments value)? changeAttachments,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_DeleteRequirement value)? deleteRequirement,
    TResult? Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
  }) {
    return changeAttachments?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_UpdateFormField value)? updateFormField,
    TResult Function(_ChangeDateRequest value)? changeDateRequest,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeRequiredDepartment value)? changeRequiredDepartment,
    TResult Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult Function(_ChangeApprover value)? changeApprover,
    TResult Function(_ChangeAttachments value)? changeAttachments,
    TResult Function(_Submit value)? submit,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_DeleteRequirement value)? deleteRequirement,
    TResult Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
    required TResult orElse(),
  }) {
    if (changeAttachments != null) {
      return changeAttachments(this);
    }
    return orElse();
  }
}

abstract class _ChangeAttachments implements WorkRequirementEvent {
  const factory _ChangeAttachments(final List<String> names) =
      _$ChangeAttachmentsImpl;

  List<String> get names;
  @JsonKey(ignore: true)
  _$$ChangeAttachmentsImplCopyWith<_$ChangeAttachmentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitImplCopyWith<$Res> {
  factory _$$SubmitImplCopyWith(
          _$SubmitImpl value, $Res Function(_$SubmitImpl) then) =
      __$$SubmitImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int approvedTBPId,
      DateTime dateRequest,
      DateTime deadlineRequest,
      int requiredDepartmentId,
      List<WorkRequirementDetailItem> details,
      int? coordinationDepartmentId});
}

/// @nodoc
class __$$SubmitImplCopyWithImpl<$Res>
    extends _$WorkRequirementEventCopyWithImpl<$Res, _$SubmitImpl>
    implements _$$SubmitImplCopyWith<$Res> {
  __$$SubmitImplCopyWithImpl(
      _$SubmitImpl _value, $Res Function(_$SubmitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? approvedTBPId = null,
    Object? dateRequest = null,
    Object? deadlineRequest = null,
    Object? requiredDepartmentId = null,
    Object? details = null,
    Object? coordinationDepartmentId = freezed,
  }) {
    return _then(_$SubmitImpl(
      approvedTBPId: null == approvedTBPId
          ? _value.approvedTBPId
          : approvedTBPId // ignore: cast_nullable_to_non_nullable
              as int,
      dateRequest: null == dateRequest
          ? _value.dateRequest
          : dateRequest // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deadlineRequest: null == deadlineRequest
          ? _value.deadlineRequest
          : deadlineRequest // ignore: cast_nullable_to_non_nullable
              as DateTime,
      requiredDepartmentId: null == requiredDepartmentId
          ? _value.requiredDepartmentId
          : requiredDepartmentId // ignore: cast_nullable_to_non_nullable
              as int,
      details: null == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<WorkRequirementDetailItem>,
      coordinationDepartmentId: freezed == coordinationDepartmentId
          ? _value.coordinationDepartmentId
          : coordinationDepartmentId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SubmitImpl implements _Submit {
  const _$SubmitImpl(
      {required this.approvedTBPId,
      required this.dateRequest,
      required this.deadlineRequest,
      required this.requiredDepartmentId,
      required final List<WorkRequirementDetailItem> details,
      this.coordinationDepartmentId})
      : _details = details;

  @override
  final int approvedTBPId;
  @override
  final DateTime dateRequest;
  @override
  final DateTime deadlineRequest;
  @override
  final int requiredDepartmentId;
  final List<WorkRequirementDetailItem> _details;
  @override
  List<WorkRequirementDetailItem> get details {
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  @override
  final int? coordinationDepartmentId;

  @override
  String toString() {
    return 'WorkRequirementEvent.submit(approvedTBPId: $approvedTBPId, dateRequest: $dateRequest, deadlineRequest: $deadlineRequest, requiredDepartmentId: $requiredDepartmentId, details: $details, coordinationDepartmentId: $coordinationDepartmentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitImpl &&
            (identical(other.approvedTBPId, approvedTBPId) ||
                other.approvedTBPId == approvedTBPId) &&
            (identical(other.dateRequest, dateRequest) ||
                other.dateRequest == dateRequest) &&
            (identical(other.deadlineRequest, deadlineRequest) ||
                other.deadlineRequest == deadlineRequest) &&
            (identical(other.requiredDepartmentId, requiredDepartmentId) ||
                other.requiredDepartmentId == requiredDepartmentId) &&
            const DeepCollectionEquality().equals(other._details, _details) &&
            (identical(
                    other.coordinationDepartmentId, coordinationDepartmentId) ||
                other.coordinationDepartmentId == coordinationDepartmentId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      approvedTBPId,
      dateRequest,
      deadlineRequest,
      requiredDepartmentId,
      const DeepCollectionEquality().hash(_details),
      coordinationDepartmentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitImplCopyWith<_$SubmitImpl> get copyWith =>
      __$$SubmitImplCopyWithImpl<_$SubmitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() refresh,
    required TResult Function() initAdd,
    required TResult Function(int rowIndex, String field, String value)
        updateFormField,
    required TResult Function(DateTime? date) changeDateRequest,
    required TResult Function(DateTime? date) changeDeadline,
    required TResult Function(int? id, String? name) changeRequiredDepartment,
    required TResult Function(int? id, String? name)
        changeCoordinationDepartment,
    required TResult Function(int? id, String? displayName) changeApprover,
    required TResult Function(List<String> names) changeAttachments,
    required TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)
        submit,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) initDetail,
    required TResult Function(List<int> ids) deleteRequirement,
    required TResult Function() clearDeleteSuccess,
  }) {
    return submit(approvedTBPId, dateRequest, deadlineRequest,
        requiredDepartmentId, details, coordinationDepartmentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? refresh,
    TResult? Function()? initAdd,
    TResult? Function(int rowIndex, String field, String value)?
        updateFormField,
    TResult? Function(DateTime? date)? changeDateRequest,
    TResult? Function(DateTime? date)? changeDeadline,
    TResult? Function(int? id, String? name)? changeRequiredDepartment,
    TResult? Function(int? id, String? name)? changeCoordinationDepartment,
    TResult? Function(int? id, String? displayName)? changeApprover,
    TResult? Function(List<String> names)? changeAttachments,
    TResult? Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? initDetail,
    TResult? Function(List<int> ids)? deleteRequirement,
    TResult? Function()? clearDeleteSuccess,
  }) {
    return submit?.call(approvedTBPId, dateRequest, deadlineRequest,
        requiredDepartmentId, details, coordinationDepartmentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? refresh,
    TResult Function()? initAdd,
    TResult Function(int rowIndex, String field, String value)? updateFormField,
    TResult Function(DateTime? date)? changeDateRequest,
    TResult Function(DateTime? date)? changeDeadline,
    TResult Function(int? id, String? name)? changeRequiredDepartment,
    TResult Function(int? id, String? name)? changeCoordinationDepartment,
    TResult Function(int? id, String? displayName)? changeApprover,
    TResult Function(List<String> names)? changeAttachments,
    TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? initDetail,
    TResult Function(List<int> ids)? deleteRequirement,
    TResult Function()? clearDeleteSuccess,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(approvedTBPId, dateRequest, deadlineRequest,
          requiredDepartmentId, details, coordinationDepartmentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_UpdateFormField value) updateFormField,
    required TResult Function(_ChangeDateRequest value) changeDateRequest,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeRequiredDepartment value)
        changeRequiredDepartment,
    required TResult Function(_ChangeCoordinationDepartment value)
        changeCoordinationDepartment,
    required TResult Function(_ChangeApprover value) changeApprover,
    required TResult Function(_ChangeAttachments value) changeAttachments,
    required TResult Function(_Submit value) submit,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_DeleteRequirement value) deleteRequirement,
    required TResult Function(_ClearDeleteSuccess value) clearDeleteSuccess,
  }) {
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_UpdateFormField value)? updateFormField,
    TResult? Function(_ChangeDateRequest value)? changeDateRequest,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeRequiredDepartment value)?
        changeRequiredDepartment,
    TResult? Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult? Function(_ChangeApprover value)? changeApprover,
    TResult? Function(_ChangeAttachments value)? changeAttachments,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_DeleteRequirement value)? deleteRequirement,
    TResult? Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
  }) {
    return submit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_UpdateFormField value)? updateFormField,
    TResult Function(_ChangeDateRequest value)? changeDateRequest,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeRequiredDepartment value)? changeRequiredDepartment,
    TResult Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult Function(_ChangeApprover value)? changeApprover,
    TResult Function(_ChangeAttachments value)? changeAttachments,
    TResult Function(_Submit value)? submit,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_DeleteRequirement value)? deleteRequirement,
    TResult Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class _Submit implements WorkRequirementEvent {
  const factory _Submit(
      {required final int approvedTBPId,
      required final DateTime dateRequest,
      required final DateTime deadlineRequest,
      required final int requiredDepartmentId,
      required final List<WorkRequirementDetailItem> details,
      final int? coordinationDepartmentId}) = _$SubmitImpl;

  int get approvedTBPId;
  DateTime get dateRequest;
  DateTime get deadlineRequest;
  int get requiredDepartmentId;
  List<WorkRequirementDetailItem> get details;
  int? get coordinationDepartmentId;
  @JsonKey(ignore: true)
  _$$SubmitImplCopyWith<_$SubmitImpl> get copyWith =>
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
    extends _$WorkRequirementEventCopyWithImpl<$Res, _$ClearSubmitStateImpl>
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
    return 'WorkRequirementEvent.clearSubmitState()';
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
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() refresh,
    required TResult Function() initAdd,
    required TResult Function(int rowIndex, String field, String value)
        updateFormField,
    required TResult Function(DateTime? date) changeDateRequest,
    required TResult Function(DateTime? date) changeDeadline,
    required TResult Function(int? id, String? name) changeRequiredDepartment,
    required TResult Function(int? id, String? name)
        changeCoordinationDepartment,
    required TResult Function(int? id, String? displayName) changeApprover,
    required TResult Function(List<String> names) changeAttachments,
    required TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)
        submit,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) initDetail,
    required TResult Function(List<int> ids) deleteRequirement,
    required TResult Function() clearDeleteSuccess,
  }) {
    return clearSubmitState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? refresh,
    TResult? Function()? initAdd,
    TResult? Function(int rowIndex, String field, String value)?
        updateFormField,
    TResult? Function(DateTime? date)? changeDateRequest,
    TResult? Function(DateTime? date)? changeDeadline,
    TResult? Function(int? id, String? name)? changeRequiredDepartment,
    TResult? Function(int? id, String? name)? changeCoordinationDepartment,
    TResult? Function(int? id, String? displayName)? changeApprover,
    TResult? Function(List<String> names)? changeAttachments,
    TResult? Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? initDetail,
    TResult? Function(List<int> ids)? deleteRequirement,
    TResult? Function()? clearDeleteSuccess,
  }) {
    return clearSubmitState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? refresh,
    TResult Function()? initAdd,
    TResult Function(int rowIndex, String field, String value)? updateFormField,
    TResult Function(DateTime? date)? changeDateRequest,
    TResult Function(DateTime? date)? changeDeadline,
    TResult Function(int? id, String? name)? changeRequiredDepartment,
    TResult Function(int? id, String? name)? changeCoordinationDepartment,
    TResult Function(int? id, String? displayName)? changeApprover,
    TResult Function(List<String> names)? changeAttachments,
    TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? initDetail,
    TResult Function(List<int> ids)? deleteRequirement,
    TResult Function()? clearDeleteSuccess,
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
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_UpdateFormField value) updateFormField,
    required TResult Function(_ChangeDateRequest value) changeDateRequest,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeRequiredDepartment value)
        changeRequiredDepartment,
    required TResult Function(_ChangeCoordinationDepartment value)
        changeCoordinationDepartment,
    required TResult Function(_ChangeApprover value) changeApprover,
    required TResult Function(_ChangeAttachments value) changeAttachments,
    required TResult Function(_Submit value) submit,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_DeleteRequirement value) deleteRequirement,
    required TResult Function(_ClearDeleteSuccess value) clearDeleteSuccess,
  }) {
    return clearSubmitState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_UpdateFormField value)? updateFormField,
    TResult? Function(_ChangeDateRequest value)? changeDateRequest,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeRequiredDepartment value)?
        changeRequiredDepartment,
    TResult? Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult? Function(_ChangeApprover value)? changeApprover,
    TResult? Function(_ChangeAttachments value)? changeAttachments,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_DeleteRequirement value)? deleteRequirement,
    TResult? Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
  }) {
    return clearSubmitState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_UpdateFormField value)? updateFormField,
    TResult Function(_ChangeDateRequest value)? changeDateRequest,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeRequiredDepartment value)? changeRequiredDepartment,
    TResult Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult Function(_ChangeApprover value)? changeApprover,
    TResult Function(_ChangeAttachments value)? changeAttachments,
    TResult Function(_Submit value)? submit,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_DeleteRequirement value)? deleteRequirement,
    TResult Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
    required TResult orElse(),
  }) {
    if (clearSubmitState != null) {
      return clearSubmitState(this);
    }
    return orElse();
  }
}

abstract class _ClearSubmitState implements WorkRequirementEvent {
  const factory _ClearSubmitState() = _$ClearSubmitStateImpl;
}

/// @nodoc
abstract class _$$InitDetailImplCopyWith<$Res> {
  factory _$$InitDetailImplCopyWith(
          _$InitDetailImpl value, $Res Function(_$InitDetailImpl) then) =
      __$$InitDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$InitDetailImplCopyWithImpl<$Res>
    extends _$WorkRequirementEventCopyWithImpl<$Res, _$InitDetailImpl>
    implements _$$InitDetailImplCopyWith<$Res> {
  __$$InitDetailImplCopyWithImpl(
      _$InitDetailImpl _value, $Res Function(_$InitDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$InitDetailImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$InitDetailImpl implements _InitDetail {
  const _$InitDetailImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'WorkRequirementEvent.initDetail(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitDetailImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitDetailImplCopyWith<_$InitDetailImpl> get copyWith =>
      __$$InitDetailImplCopyWithImpl<_$InitDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() refresh,
    required TResult Function() initAdd,
    required TResult Function(int rowIndex, String field, String value)
        updateFormField,
    required TResult Function(DateTime? date) changeDateRequest,
    required TResult Function(DateTime? date) changeDeadline,
    required TResult Function(int? id, String? name) changeRequiredDepartment,
    required TResult Function(int? id, String? name)
        changeCoordinationDepartment,
    required TResult Function(int? id, String? displayName) changeApprover,
    required TResult Function(List<String> names) changeAttachments,
    required TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)
        submit,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) initDetail,
    required TResult Function(List<int> ids) deleteRequirement,
    required TResult Function() clearDeleteSuccess,
  }) {
    return initDetail(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? refresh,
    TResult? Function()? initAdd,
    TResult? Function(int rowIndex, String field, String value)?
        updateFormField,
    TResult? Function(DateTime? date)? changeDateRequest,
    TResult? Function(DateTime? date)? changeDeadline,
    TResult? Function(int? id, String? name)? changeRequiredDepartment,
    TResult? Function(int? id, String? name)? changeCoordinationDepartment,
    TResult? Function(int? id, String? displayName)? changeApprover,
    TResult? Function(List<String> names)? changeAttachments,
    TResult? Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? initDetail,
    TResult? Function(List<int> ids)? deleteRequirement,
    TResult? Function()? clearDeleteSuccess,
  }) {
    return initDetail?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? refresh,
    TResult Function()? initAdd,
    TResult Function(int rowIndex, String field, String value)? updateFormField,
    TResult Function(DateTime? date)? changeDateRequest,
    TResult Function(DateTime? date)? changeDeadline,
    TResult Function(int? id, String? name)? changeRequiredDepartment,
    TResult Function(int? id, String? name)? changeCoordinationDepartment,
    TResult Function(int? id, String? displayName)? changeApprover,
    TResult Function(List<String> names)? changeAttachments,
    TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? initDetail,
    TResult Function(List<int> ids)? deleteRequirement,
    TResult Function()? clearDeleteSuccess,
    required TResult orElse(),
  }) {
    if (initDetail != null) {
      return initDetail(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_UpdateFormField value) updateFormField,
    required TResult Function(_ChangeDateRequest value) changeDateRequest,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeRequiredDepartment value)
        changeRequiredDepartment,
    required TResult Function(_ChangeCoordinationDepartment value)
        changeCoordinationDepartment,
    required TResult Function(_ChangeApprover value) changeApprover,
    required TResult Function(_ChangeAttachments value) changeAttachments,
    required TResult Function(_Submit value) submit,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_DeleteRequirement value) deleteRequirement,
    required TResult Function(_ClearDeleteSuccess value) clearDeleteSuccess,
  }) {
    return initDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_UpdateFormField value)? updateFormField,
    TResult? Function(_ChangeDateRequest value)? changeDateRequest,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeRequiredDepartment value)?
        changeRequiredDepartment,
    TResult? Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult? Function(_ChangeApprover value)? changeApprover,
    TResult? Function(_ChangeAttachments value)? changeAttachments,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_DeleteRequirement value)? deleteRequirement,
    TResult? Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
  }) {
    return initDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_UpdateFormField value)? updateFormField,
    TResult Function(_ChangeDateRequest value)? changeDateRequest,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeRequiredDepartment value)? changeRequiredDepartment,
    TResult Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult Function(_ChangeApprover value)? changeApprover,
    TResult Function(_ChangeAttachments value)? changeAttachments,
    TResult Function(_Submit value)? submit,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_DeleteRequirement value)? deleteRequirement,
    TResult Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
    required TResult orElse(),
  }) {
    if (initDetail != null) {
      return initDetail(this);
    }
    return orElse();
  }
}

abstract class _InitDetail implements WorkRequirementEvent {
  const factory _InitDetail(final int id) = _$InitDetailImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$InitDetailImplCopyWith<_$InitDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteRequirementImplCopyWith<$Res> {
  factory _$$DeleteRequirementImplCopyWith(_$DeleteRequirementImpl value,
          $Res Function(_$DeleteRequirementImpl) then) =
      __$$DeleteRequirementImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<int> ids});
}

/// @nodoc
class __$$DeleteRequirementImplCopyWithImpl<$Res>
    extends _$WorkRequirementEventCopyWithImpl<$Res, _$DeleteRequirementImpl>
    implements _$$DeleteRequirementImplCopyWith<$Res> {
  __$$DeleteRequirementImplCopyWithImpl(_$DeleteRequirementImpl _value,
      $Res Function(_$DeleteRequirementImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ids = null,
  }) {
    return _then(_$DeleteRequirementImpl(
      ids: null == ids
          ? _value._ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$DeleteRequirementImpl implements _DeleteRequirement {
  const _$DeleteRequirementImpl({required final List<int> ids}) : _ids = ids;

  final List<int> _ids;
  @override
  List<int> get ids {
    if (_ids is EqualUnmodifiableListView) return _ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ids);
  }

  @override
  String toString() {
    return 'WorkRequirementEvent.deleteRequirement(ids: $ids)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteRequirementImpl &&
            const DeepCollectionEquality().equals(other._ids, _ids));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_ids));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteRequirementImplCopyWith<_$DeleteRequirementImpl> get copyWith =>
      __$$DeleteRequirementImplCopyWithImpl<_$DeleteRequirementImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() refresh,
    required TResult Function() initAdd,
    required TResult Function(int rowIndex, String field, String value)
        updateFormField,
    required TResult Function(DateTime? date) changeDateRequest,
    required TResult Function(DateTime? date) changeDeadline,
    required TResult Function(int? id, String? name) changeRequiredDepartment,
    required TResult Function(int? id, String? name)
        changeCoordinationDepartment,
    required TResult Function(int? id, String? displayName) changeApprover,
    required TResult Function(List<String> names) changeAttachments,
    required TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)
        submit,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) initDetail,
    required TResult Function(List<int> ids) deleteRequirement,
    required TResult Function() clearDeleteSuccess,
  }) {
    return deleteRequirement(ids);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? refresh,
    TResult? Function()? initAdd,
    TResult? Function(int rowIndex, String field, String value)?
        updateFormField,
    TResult? Function(DateTime? date)? changeDateRequest,
    TResult? Function(DateTime? date)? changeDeadline,
    TResult? Function(int? id, String? name)? changeRequiredDepartment,
    TResult? Function(int? id, String? name)? changeCoordinationDepartment,
    TResult? Function(int? id, String? displayName)? changeApprover,
    TResult? Function(List<String> names)? changeAttachments,
    TResult? Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? initDetail,
    TResult? Function(List<int> ids)? deleteRequirement,
    TResult? Function()? clearDeleteSuccess,
  }) {
    return deleteRequirement?.call(ids);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? refresh,
    TResult Function()? initAdd,
    TResult Function(int rowIndex, String field, String value)? updateFormField,
    TResult Function(DateTime? date)? changeDateRequest,
    TResult Function(DateTime? date)? changeDeadline,
    TResult Function(int? id, String? name)? changeRequiredDepartment,
    TResult Function(int? id, String? name)? changeCoordinationDepartment,
    TResult Function(int? id, String? displayName)? changeApprover,
    TResult Function(List<String> names)? changeAttachments,
    TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? initDetail,
    TResult Function(List<int> ids)? deleteRequirement,
    TResult Function()? clearDeleteSuccess,
    required TResult orElse(),
  }) {
    if (deleteRequirement != null) {
      return deleteRequirement(ids);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_UpdateFormField value) updateFormField,
    required TResult Function(_ChangeDateRequest value) changeDateRequest,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeRequiredDepartment value)
        changeRequiredDepartment,
    required TResult Function(_ChangeCoordinationDepartment value)
        changeCoordinationDepartment,
    required TResult Function(_ChangeApprover value) changeApprover,
    required TResult Function(_ChangeAttachments value) changeAttachments,
    required TResult Function(_Submit value) submit,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_DeleteRequirement value) deleteRequirement,
    required TResult Function(_ClearDeleteSuccess value) clearDeleteSuccess,
  }) {
    return deleteRequirement(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_UpdateFormField value)? updateFormField,
    TResult? Function(_ChangeDateRequest value)? changeDateRequest,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeRequiredDepartment value)?
        changeRequiredDepartment,
    TResult? Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult? Function(_ChangeApprover value)? changeApprover,
    TResult? Function(_ChangeAttachments value)? changeAttachments,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_DeleteRequirement value)? deleteRequirement,
    TResult? Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
  }) {
    return deleteRequirement?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_UpdateFormField value)? updateFormField,
    TResult Function(_ChangeDateRequest value)? changeDateRequest,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeRequiredDepartment value)? changeRequiredDepartment,
    TResult Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult Function(_ChangeApprover value)? changeApprover,
    TResult Function(_ChangeAttachments value)? changeAttachments,
    TResult Function(_Submit value)? submit,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_DeleteRequirement value)? deleteRequirement,
    TResult Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
    required TResult orElse(),
  }) {
    if (deleteRequirement != null) {
      return deleteRequirement(this);
    }
    return orElse();
  }
}

abstract class _DeleteRequirement implements WorkRequirementEvent {
  const factory _DeleteRequirement({required final List<int> ids}) =
      _$DeleteRequirementImpl;

  List<int> get ids;
  @JsonKey(ignore: true)
  _$$DeleteRequirementImplCopyWith<_$DeleteRequirementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearDeleteSuccessImplCopyWith<$Res> {
  factory _$$ClearDeleteSuccessImplCopyWith(_$ClearDeleteSuccessImpl value,
          $Res Function(_$ClearDeleteSuccessImpl) then) =
      __$$ClearDeleteSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearDeleteSuccessImplCopyWithImpl<$Res>
    extends _$WorkRequirementEventCopyWithImpl<$Res, _$ClearDeleteSuccessImpl>
    implements _$$ClearDeleteSuccessImplCopyWith<$Res> {
  __$$ClearDeleteSuccessImplCopyWithImpl(_$ClearDeleteSuccessImpl _value,
      $Res Function(_$ClearDeleteSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearDeleteSuccessImpl implements _ClearDeleteSuccess {
  const _$ClearDeleteSuccessImpl();

  @override
  String toString() {
    return 'WorkRequirementEvent.clearDeleteSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearDeleteSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function() refresh,
    required TResult Function() initAdd,
    required TResult Function(int rowIndex, String field, String value)
        updateFormField,
    required TResult Function(DateTime? date) changeDateRequest,
    required TResult Function(DateTime? date) changeDeadline,
    required TResult Function(int? id, String? name) changeRequiredDepartment,
    required TResult Function(int? id, String? name)
        changeCoordinationDepartment,
    required TResult Function(int? id, String? displayName) changeApprover,
    required TResult Function(List<String> names) changeAttachments,
    required TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)
        submit,
    required TResult Function() clearSubmitState,
    required TResult Function(int id) initDetail,
    required TResult Function(List<int> ids) deleteRequirement,
    required TResult Function() clearDeleteSuccess,
  }) {
    return clearDeleteSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function()? refresh,
    TResult? Function()? initAdd,
    TResult? Function(int rowIndex, String field, String value)?
        updateFormField,
    TResult? Function(DateTime? date)? changeDateRequest,
    TResult? Function(DateTime? date)? changeDeadline,
    TResult? Function(int? id, String? name)? changeRequiredDepartment,
    TResult? Function(int? id, String? name)? changeCoordinationDepartment,
    TResult? Function(int? id, String? displayName)? changeApprover,
    TResult? Function(List<String> names)? changeAttachments,
    TResult? Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult? Function()? clearSubmitState,
    TResult? Function(int id)? initDetail,
    TResult? Function(List<int> ids)? deleteRequirement,
    TResult? Function()? clearDeleteSuccess,
  }) {
    return clearDeleteSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function()? refresh,
    TResult Function()? initAdd,
    TResult Function(int rowIndex, String field, String value)? updateFormField,
    TResult Function(DateTime? date)? changeDateRequest,
    TResult Function(DateTime? date)? changeDeadline,
    TResult Function(int? id, String? name)? changeRequiredDepartment,
    TResult Function(int? id, String? name)? changeCoordinationDepartment,
    TResult Function(int? id, String? displayName)? changeApprover,
    TResult Function(List<String> names)? changeAttachments,
    TResult Function(
            int approvedTBPId,
            DateTime dateRequest,
            DateTime deadlineRequest,
            int requiredDepartmentId,
            List<WorkRequirementDetailItem> details,
            int? coordinationDepartmentId)?
        submit,
    TResult Function()? clearSubmitState,
    TResult Function(int id)? initDetail,
    TResult Function(List<int> ids)? deleteRequirement,
    TResult Function()? clearDeleteSuccess,
    required TResult orElse(),
  }) {
    if (clearDeleteSuccess != null) {
      return clearDeleteSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_InitAdd value) initAdd,
    required TResult Function(_UpdateFormField value) updateFormField,
    required TResult Function(_ChangeDateRequest value) changeDateRequest,
    required TResult Function(_ChangeDeadline value) changeDeadline,
    required TResult Function(_ChangeRequiredDepartment value)
        changeRequiredDepartment,
    required TResult Function(_ChangeCoordinationDepartment value)
        changeCoordinationDepartment,
    required TResult Function(_ChangeApprover value) changeApprover,
    required TResult Function(_ChangeAttachments value) changeAttachments,
    required TResult Function(_Submit value) submit,
    required TResult Function(_ClearSubmitState value) clearSubmitState,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_DeleteRequirement value) deleteRequirement,
    required TResult Function(_ClearDeleteSuccess value) clearDeleteSuccess,
  }) {
    return clearDeleteSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_InitAdd value)? initAdd,
    TResult? Function(_UpdateFormField value)? updateFormField,
    TResult? Function(_ChangeDateRequest value)? changeDateRequest,
    TResult? Function(_ChangeDeadline value)? changeDeadline,
    TResult? Function(_ChangeRequiredDepartment value)?
        changeRequiredDepartment,
    TResult? Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult? Function(_ChangeApprover value)? changeApprover,
    TResult? Function(_ChangeAttachments value)? changeAttachments,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_ClearSubmitState value)? clearSubmitState,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_DeleteRequirement value)? deleteRequirement,
    TResult? Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
  }) {
    return clearDeleteSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_InitAdd value)? initAdd,
    TResult Function(_UpdateFormField value)? updateFormField,
    TResult Function(_ChangeDateRequest value)? changeDateRequest,
    TResult Function(_ChangeDeadline value)? changeDeadline,
    TResult Function(_ChangeRequiredDepartment value)? changeRequiredDepartment,
    TResult Function(_ChangeCoordinationDepartment value)?
        changeCoordinationDepartment,
    TResult Function(_ChangeApprover value)? changeApprover,
    TResult Function(_ChangeAttachments value)? changeAttachments,
    TResult Function(_Submit value)? submit,
    TResult Function(_ClearSubmitState value)? clearSubmitState,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_DeleteRequirement value)? deleteRequirement,
    TResult Function(_ClearDeleteSuccess value)? clearDeleteSuccess,
    required TResult orElse(),
  }) {
    if (clearDeleteSuccess != null) {
      return clearDeleteSuccess(this);
    }
    return orElse();
  }
}

abstract class _ClearDeleteSuccess implements WorkRequirementEvent {
  const factory _ClearDeleteSuccess() = _$ClearDeleteSuccessImpl;
}
