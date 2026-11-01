// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crm_dashboard_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CrmDashboardStateCWProxy {
  CrmDashboardState status(BaseStateStatus status);

  CrmDashboardState message(String? message);

  CrmDashboardState data(CrmDashboardData? data);

  CrmDashboardState dateStart(DateTime dateStart);

  CrmDashboardState dateEnd(DateTime dateEnd);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CrmDashboardState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CrmDashboardState(...).copyWith(id: 12, name: "My name")
  /// ````
  CrmDashboardState call({
    BaseStateStatus? status,
    String? message,
    CrmDashboardData? data,
    DateTime? dateStart,
    DateTime? dateEnd,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCrmDashboardState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCrmDashboardState.copyWith.fieldName(...)`
class _$CrmDashboardStateCWProxyImpl implements _$CrmDashboardStateCWProxy {
  const _$CrmDashboardStateCWProxyImpl(this._value);

  final CrmDashboardState _value;

  @override
  CrmDashboardState status(BaseStateStatus status) => this(status: status);

  @override
  CrmDashboardState message(String? message) => this(message: message);

  @override
  CrmDashboardState data(CrmDashboardData? data) => this(data: data);

  @override
  CrmDashboardState dateStart(DateTime dateStart) => this(dateStart: dateStart);

  @override
  CrmDashboardState dateEnd(DateTime dateEnd) => this(dateEnd: dateEnd);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CrmDashboardState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CrmDashboardState(...).copyWith(id: 12, name: "My name")
  /// ````
  CrmDashboardState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
  }) {
    return CrmDashboardState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as CrmDashboardData?,
      dateStart: dateStart == const $CopyWithPlaceholder() || dateStart == null
          ? _value.dateStart
          // ignore: cast_nullable_to_non_nullable
          : dateStart as DateTime,
      dateEnd: dateEnd == const $CopyWithPlaceholder() || dateEnd == null
          ? _value.dateEnd
          // ignore: cast_nullable_to_non_nullable
          : dateEnd as DateTime,
    );
  }
}

extension $CrmDashboardStateCopyWith on CrmDashboardState {
  /// Returns a callable class that can be used as follows: `instanceOfCrmDashboardState.copyWith(...)` or like so:`instanceOfCrmDashboardState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CrmDashboardStateCWProxy get copyWith =>
      _$CrmDashboardStateCWProxyImpl(this);
}
