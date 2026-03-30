// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LeaveStateCWProxy {
  LeaveState status(BaseStateStatus status);

  LeaveState message(String? message);

  LeaveState leave(List<LeaveItem> leave);

  LeaveState approvers(List<ApproverItem> approvers);

  LeaveState leaveTime(List<LeaveTimeItem> leaveTime);

  LeaveState isSubmitting(bool isSubmitting);

  LeaveState submitSuccess(bool submitSuccess);

  LeaveState deleteSuccess(bool deleteSuccess);

  LeaveState isDeleting(bool isDeleting);

  LeaveState employeeId(int? employeeId);

  LeaveState loginName(String? loginName);

  LeaveState dateStart(DateTime? dateStart);

  LeaveState dateEnd(DateTime? dateEnd);

  LeaveState departmentName(String? departmentName);

  LeaveState employeeDisplayLine(String? employeeDisplayLine);

  LeaveState skipLeaveDateConstraints(bool skipLeaveDateConstraints);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LeaveState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LeaveState(...).copyWith(id: 12, name: "My name")
  /// ````
  LeaveState call({
    BaseStateStatus? status,
    String? message,
    List<LeaveItem>? leave,
    List<ApproverItem>? approvers,
    List<LeaveTimeItem>? leaveTime,
    bool? isSubmitting,
    bool? submitSuccess,
    bool? deleteSuccess,
    bool? isDeleting,
    int? employeeId,
    String? loginName,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? departmentName,
    String? employeeDisplayLine,
    bool? skipLeaveDateConstraints,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLeaveState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLeaveState.copyWith.fieldName(...)`
class _$LeaveStateCWProxyImpl implements _$LeaveStateCWProxy {
  const _$LeaveStateCWProxyImpl(this._value);

  final LeaveState _value;

  @override
  LeaveState status(BaseStateStatus status) => this(status: status);

  @override
  LeaveState message(String? message) => this(message: message);

  @override
  LeaveState leave(List<LeaveItem> leave) => this(leave: leave);

  @override
  LeaveState approvers(List<ApproverItem> approvers) =>
      this(approvers: approvers);

  @override
  LeaveState leaveTime(List<LeaveTimeItem> leaveTime) =>
      this(leaveTime: leaveTime);

  @override
  LeaveState isSubmitting(bool isSubmitting) =>
      this(isSubmitting: isSubmitting);

  @override
  LeaveState submitSuccess(bool submitSuccess) =>
      this(submitSuccess: submitSuccess);

  @override
  LeaveState deleteSuccess(bool deleteSuccess) =>
      this(deleteSuccess: deleteSuccess);

  @override
  LeaveState isDeleting(bool isDeleting) => this(isDeleting: isDeleting);

  @override
  LeaveState employeeId(int? employeeId) => this(employeeId: employeeId);

  @override
  LeaveState loginName(String? loginName) => this(loginName: loginName);

  @override
  LeaveState dateStart(DateTime? dateStart) => this(dateStart: dateStart);

  @override
  LeaveState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  LeaveState departmentName(String? departmentName) =>
      this(departmentName: departmentName);

  @override
  LeaveState employeeDisplayLine(String? employeeDisplayLine) =>
      this(employeeDisplayLine: employeeDisplayLine);

  @override
  LeaveState skipLeaveDateConstraints(bool skipLeaveDateConstraints) =>
      this(skipLeaveDateConstraints: skipLeaveDateConstraints);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LeaveState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LeaveState(...).copyWith(id: 12, name: "My name")
  /// ````
  LeaveState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? leave = const $CopyWithPlaceholder(),
    Object? approvers = const $CopyWithPlaceholder(),
    Object? leaveTime = const $CopyWithPlaceholder(),
    Object? isSubmitting = const $CopyWithPlaceholder(),
    Object? submitSuccess = const $CopyWithPlaceholder(),
    Object? deleteSuccess = const $CopyWithPlaceholder(),
    Object? isDeleting = const $CopyWithPlaceholder(),
    Object? employeeId = const $CopyWithPlaceholder(),
    Object? loginName = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? departmentName = const $CopyWithPlaceholder(),
    Object? employeeDisplayLine = const $CopyWithPlaceholder(),
    Object? skipLeaveDateConstraints = const $CopyWithPlaceholder(),
  }) {
    return LeaveState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      leave: leave == const $CopyWithPlaceholder() || leave == null
          ? _value.leave
          // ignore: cast_nullable_to_non_nullable
          : leave as List<LeaveItem>,
      approvers: approvers == const $CopyWithPlaceholder() || approvers == null
          ? _value.approvers
          // ignore: cast_nullable_to_non_nullable
          : approvers as List<ApproverItem>,
      leaveTime: leaveTime == const $CopyWithPlaceholder() || leaveTime == null
          ? _value.leaveTime
          // ignore: cast_nullable_to_non_nullable
          : leaveTime as List<LeaveTimeItem>,
      isSubmitting:
          isSubmitting == const $CopyWithPlaceholder() || isSubmitting == null
              ? _value.isSubmitting
              // ignore: cast_nullable_to_non_nullable
              : isSubmitting as bool,
      submitSuccess:
          submitSuccess == const $CopyWithPlaceholder() || submitSuccess == null
              ? _value.submitSuccess
              // ignore: cast_nullable_to_non_nullable
              : submitSuccess as bool,
      deleteSuccess:
          deleteSuccess == const $CopyWithPlaceholder() || deleteSuccess == null
              ? _value.deleteSuccess
              // ignore: cast_nullable_to_non_nullable
              : deleteSuccess as bool,
      isDeleting:
          isDeleting == const $CopyWithPlaceholder() || isDeleting == null
              ? _value.isDeleting
              // ignore: cast_nullable_to_non_nullable
              : isDeleting as bool,
      employeeId: employeeId == const $CopyWithPlaceholder()
          ? _value.employeeId
          // ignore: cast_nullable_to_non_nullable
          : employeeId as int?,
      loginName: loginName == const $CopyWithPlaceholder()
          ? _value.loginName
          // ignore: cast_nullable_to_non_nullable
          : loginName as String?,
      dateStart: dateStart == const $CopyWithPlaceholder()
          ? _value.dateStart
          // ignore: cast_nullable_to_non_nullable
          : dateStart as DateTime?,
      dateEnd: dateEnd == const $CopyWithPlaceholder()
          ? _value.dateEnd
          // ignore: cast_nullable_to_non_nullable
          : dateEnd as DateTime?,
      departmentName:
          departmentName == const $CopyWithPlaceholder()
              ? _value.departmentName
              // ignore: cast_nullable_to_non_nullable
              : departmentName as String?,
      employeeDisplayLine:
          employeeDisplayLine == const $CopyWithPlaceholder()
              ? _value.employeeDisplayLine
              // ignore: cast_nullable_to_non_nullable
              : employeeDisplayLine as String?,
      skipLeaveDateConstraints:
          skipLeaveDateConstraints == const $CopyWithPlaceholder() ||
                  skipLeaveDateConstraints == null
              ? _value.skipLeaveDateConstraints
              // ignore: cast_nullable_to_non_nullable
              : skipLeaveDateConstraints as bool,
    );
  }
}

extension $LeaveStateCopyWith on LeaveState {
  /// Returns a callable class that can be used as follows: `instanceOfLeaveState.copyWith(...)` or like so:`instanceOfLeaveState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LeaveStateCWProxy get copyWith => _$LeaveStateCWProxyImpl(this);
}
