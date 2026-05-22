// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_requirement_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WorkRequirementStateCWProxy {
  WorkRequirementState status(BaseStateStatus status);

  WorkRequirementState message(String? message);

  WorkRequirementState items(List<WorkRequirementItem> items);

  WorkRequirementState employeeId(int? employeeId);

  WorkRequirementState departmentId(int? departmentId);

  WorkRequirementState dateStart(DateTime? dateStart);

  WorkRequirementState dateEnd(DateTime? dateEnd);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WorkRequirementState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WorkRequirementState(...).copyWith(id: 12, name: "My name")
  /// ````
  WorkRequirementState call({
    BaseStateStatus? status,
    String? message,
    List<WorkRequirementItem>? items,
    int? employeeId,
    int? departmentId,
    DateTime? dateStart,
    DateTime? dateEnd,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWorkRequirementState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWorkRequirementState.copyWith.fieldName(...)`
class _$WorkRequirementStateCWProxyImpl
    implements _$WorkRequirementStateCWProxy {
  const _$WorkRequirementStateCWProxyImpl(this._value);

  final WorkRequirementState _value;

  @override
  WorkRequirementState status(BaseStateStatus status) => this(status: status);

  @override
  WorkRequirementState message(String? message) => this(message: message);

  @override
  WorkRequirementState items(List<WorkRequirementItem> items) =>
      this(items: items);

  @override
  WorkRequirementState employeeId(int? employeeId) =>
      this(employeeId: employeeId);

  @override
  WorkRequirementState departmentId(int? departmentId) =>
      this(departmentId: departmentId);

  @override
  WorkRequirementState dateStart(DateTime? dateStart) =>
      this(dateStart: dateStart);

  @override
  WorkRequirementState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WorkRequirementState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WorkRequirementState(...).copyWith(id: 12, name: "My name")
  /// ````
  WorkRequirementState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? items = const $CopyWithPlaceholder(),
    Object? employeeId = const $CopyWithPlaceholder(),
    Object? departmentId = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
  }) {
    return WorkRequirementState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      items: items == const $CopyWithPlaceholder() || items == null
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<WorkRequirementItem>,
      employeeId: employeeId == const $CopyWithPlaceholder()
          ? _value.employeeId
          // ignore: cast_nullable_to_non_nullable
          : employeeId as int?,
      departmentId: departmentId == const $CopyWithPlaceholder()
          ? _value.departmentId
          // ignore: cast_nullable_to_non_nullable
          : departmentId as int?,
      dateStart: dateStart == const $CopyWithPlaceholder()
          ? _value.dateStart
          // ignore: cast_nullable_to_non_nullable
          : dateStart as DateTime?,
      dateEnd: dateEnd == const $CopyWithPlaceholder()
          ? _value.dateEnd
          // ignore: cast_nullable_to_non_nullable
          : dateEnd as DateTime?,
    );
  }
}

extension $WorkRequirementStateCopyWith on WorkRequirementState {
  /// Returns a callable class that can be used as follows: `instanceOfWorkRequirementState.copyWith(...)` or like so:`instanceOfWorkRequirementState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WorkRequirementStateCWProxy get copyWith =>
      _$WorkRequirementStateCWProxyImpl(this);
}
