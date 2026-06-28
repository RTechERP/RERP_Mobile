// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_approve_menu_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PersonalApproveMenuStateCWProxy {
  PersonalApproveMenuState status(BaseStateStatus status);

  PersonalApproveMenuState message(String? message);

  PersonalApproveMenuState currentUserEmployeeId(int? currentUserEmployeeId);

  PersonalApproveMenuState currentUserName(String? currentUserName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PersonalApproveMenuState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PersonalApproveMenuState(...).copyWith(id: 12, name: "My name")
  /// ````
  PersonalApproveMenuState call({
    BaseStateStatus? status,
    String? message,
    int? currentUserEmployeeId,
    String? currentUserName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPersonalApproveMenuState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPersonalApproveMenuState.copyWith.fieldName(...)`
class _$PersonalApproveMenuStateCWProxyImpl
    implements _$PersonalApproveMenuStateCWProxy {
  const _$PersonalApproveMenuStateCWProxyImpl(this._value);

  final PersonalApproveMenuState _value;

  @override
  PersonalApproveMenuState status(BaseStateStatus status) =>
      this(status: status);

  @override
  PersonalApproveMenuState message(String? message) => this(message: message);

  @override
  PersonalApproveMenuState currentUserEmployeeId(int? currentUserEmployeeId) =>
      this(currentUserEmployeeId: currentUserEmployeeId);

  @override
  PersonalApproveMenuState currentUserName(String? currentUserName) =>
      this(currentUserName: currentUserName);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PersonalApproveMenuState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PersonalApproveMenuState(...).copyWith(id: 12, name: "My name")
  /// ````
  PersonalApproveMenuState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? currentUserEmployeeId = const $CopyWithPlaceholder(),
    Object? currentUserName = const $CopyWithPlaceholder(),
  }) {
    return PersonalApproveMenuState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      currentUserEmployeeId:
          currentUserEmployeeId == const $CopyWithPlaceholder()
              ? _value.currentUserEmployeeId
              // ignore: cast_nullable_to_non_nullable
              : currentUserEmployeeId as int?,
      currentUserName: currentUserName == const $CopyWithPlaceholder()
          ? _value.currentUserName
          // ignore: cast_nullable_to_non_nullable
          : currentUserName as String?,
    );
  }
}

extension $PersonalApproveMenuStateCopyWith on PersonalApproveMenuState {
  /// Returns a callable class that can be used as follows: `instanceOfPersonalApproveMenuState.copyWith(...)` or like so:`instanceOfPersonalApproveMenuState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PersonalApproveMenuStateCWProxy get copyWith =>
      _$PersonalApproveMenuStateCWProxyImpl(this);
}
