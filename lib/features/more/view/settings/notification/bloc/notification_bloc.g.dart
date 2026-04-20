// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NotificationStateCWProxy {
  NotificationState status(BaseStateStatus status);

  NotificationState message(String? message);

  NotificationState notification(List<TypeNotiItem> notification);

  NotificationState systemPermissionEnabled(bool systemPermissionEnabled);

  NotificationState selectedCount(int selectedCount);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NotificationState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NotificationState(...).copyWith(id: 12, name: "My name")
  /// ````
  NotificationState call({
    BaseStateStatus? status,
    String? message,
    List<TypeNotiItem>? notification,
    bool? systemPermissionEnabled,
    int? selectedCount,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfNotificationState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfNotificationState.copyWith.fieldName(...)`
class _$NotificationStateCWProxyImpl implements _$NotificationStateCWProxy {
  const _$NotificationStateCWProxyImpl(this._value);

  final NotificationState _value;

  @override
  NotificationState status(BaseStateStatus status) => this(status: status);

  @override
  NotificationState message(String? message) => this(message: message);

  @override
  NotificationState notification(List<TypeNotiItem> notification) =>
      this(notification: notification);

  @override
  NotificationState systemPermissionEnabled(bool systemPermissionEnabled) =>
      this(systemPermissionEnabled: systemPermissionEnabled);

  @override
  NotificationState selectedCount(int selectedCount) =>
      this(selectedCount: selectedCount);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NotificationState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NotificationState(...).copyWith(id: 12, name: "My name")
  /// ````
  NotificationState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? notification = const $CopyWithPlaceholder(),
    Object? systemPermissionEnabled = const $CopyWithPlaceholder(),
    Object? selectedCount = const $CopyWithPlaceholder(),
  }) {
    return NotificationState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      notification:
          notification == const $CopyWithPlaceholder() || notification == null
              ? _value.notification
              // ignore: cast_nullable_to_non_nullable
              : notification as List<TypeNotiItem>,
      systemPermissionEnabled:
          systemPermissionEnabled == const $CopyWithPlaceholder() ||
                  systemPermissionEnabled == null
              ? _value.systemPermissionEnabled
              // ignore: cast_nullable_to_non_nullable
              : systemPermissionEnabled as bool,
      selectedCount:
          selectedCount == const $CopyWithPlaceholder() || selectedCount == null
              ? _value.selectedCount
              // ignore: cast_nullable_to_non_nullable
              : selectedCount as int,
    );
  }
}

extension $NotificationStateCopyWith on NotificationState {
  /// Returns a callable class that can be used as follows: `instanceOfNotificationState.copyWith(...)` or like so:`instanceOfNotificationState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$NotificationStateCWProxy get copyWith =>
      _$NotificationStateCWProxyImpl(this);
}
