// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_source_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LeadSourceStateCWProxy {
  LeadSourceState status(BaseStateStatus status);

  LeadSourceState sources(List<LeadSourceItem> sources);

  LeadSourceState message(String? message);

  LeadSourceState saveStatus(BaseStateStatus saveStatus);

  LeadSourceState saveMessage(String? saveMessage);

  LeadSourceState deleteStatus(BaseStateStatus deleteStatus);

  LeadSourceState deleteMessage(String? deleteMessage);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LeadSourceState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LeadSourceState(...).copyWith(id: 12, name: "My name")
  /// ````
  LeadSourceState call({
    BaseStateStatus? status,
    List<LeadSourceItem>? sources,
    String? message,
    BaseStateStatus? saveStatus,
    String? saveMessage,
    BaseStateStatus? deleteStatus,
    String? deleteMessage,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLeadSourceState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLeadSourceState.copyWith.fieldName(...)`
class _$LeadSourceStateCWProxyImpl implements _$LeadSourceStateCWProxy {
  const _$LeadSourceStateCWProxyImpl(this._value);

  final LeadSourceState _value;

  @override
  LeadSourceState status(BaseStateStatus status) => this(status: status);

  @override
  LeadSourceState sources(List<LeadSourceItem> sources) =>
      this(sources: sources);

  @override
  LeadSourceState message(String? message) => this(message: message);

  @override
  LeadSourceState saveStatus(BaseStateStatus saveStatus) =>
      this(saveStatus: saveStatus);

  @override
  LeadSourceState saveMessage(String? saveMessage) =>
      this(saveMessage: saveMessage);

  @override
  LeadSourceState deleteStatus(BaseStateStatus deleteStatus) =>
      this(deleteStatus: deleteStatus);

  @override
  LeadSourceState deleteMessage(String? deleteMessage) =>
      this(deleteMessage: deleteMessage);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LeadSourceState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LeadSourceState(...).copyWith(id: 12, name: "My name")
  /// ````
  LeadSourceState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? sources = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? saveStatus = const $CopyWithPlaceholder(),
    Object? saveMessage = const $CopyWithPlaceholder(),
    Object? deleteStatus = const $CopyWithPlaceholder(),
    Object? deleteMessage = const $CopyWithPlaceholder(),
  }) {
    return LeadSourceState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      sources: sources == const $CopyWithPlaceholder() || sources == null
          ? _value.sources
          // ignore: cast_nullable_to_non_nullable
          : sources as List<LeadSourceItem>,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      saveStatus:
          saveStatus == const $CopyWithPlaceholder() || saveStatus == null
              ? _value.saveStatus
              // ignore: cast_nullable_to_non_nullable
              : saveStatus as BaseStateStatus,
      saveMessage: saveMessage == const $CopyWithPlaceholder()
          ? _value.saveMessage
          // ignore: cast_nullable_to_non_nullable
          : saveMessage as String?,
      deleteStatus:
          deleteStatus == const $CopyWithPlaceholder() || deleteStatus == null
              ? _value.deleteStatus
              // ignore: cast_nullable_to_non_nullable
              : deleteStatus as BaseStateStatus,
      deleteMessage: deleteMessage == const $CopyWithPlaceholder()
          ? _value.deleteMessage
          // ignore: cast_nullable_to_non_nullable
          : deleteMessage as String?,
    );
  }
}

extension $LeadSourceStateCopyWith on LeadSourceState {
  /// Returns a callable class that can be used as follows: `instanceOfLeadSourceState.copyWith(...)` or like so:`instanceOfLeadSourceState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LeadSourceStateCWProxy get copyWith => _$LeadSourceStateCWProxyImpl(this);
}
