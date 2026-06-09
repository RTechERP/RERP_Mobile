// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PollStateCWProxy {
  PollState status(BaseStateStatus status);

  PollState message(String? message);

  PollState polls(List<PollItem> polls);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PollState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PollState(...).copyWith(id: 12, name: "My name")
  /// ````
  PollState call({
    BaseStateStatus? status,
    String? message,
    List<PollItem>? polls,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPollState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPollState.copyWith.fieldName(...)`
class _$PollStateCWProxyImpl implements _$PollStateCWProxy {
  const _$PollStateCWProxyImpl(this._value);

  final PollState _value;

  @override
  PollState status(BaseStateStatus status) => this(status: status);

  @override
  PollState message(String? message) => this(message: message);

  @override
  PollState polls(List<PollItem> polls) => this(polls: polls);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PollState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PollState(...).copyWith(id: 12, name: "My name")
  /// ````
  PollState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? polls = const $CopyWithPlaceholder(),
  }) {
    return PollState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      polls: polls == const $CopyWithPlaceholder() || polls == null
          ? _value.polls
          // ignore: cast_nullable_to_non_nullable
          : polls as List<PollItem>,
    );
  }
}

extension $PollStateCopyWith on PollState {
  /// Returns a callable class that can be used as follows: `instanceOfPollState.copyWith(...)` or like so:`instanceOfPollState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PollStateCWProxy get copyWith => _$PollStateCWProxyImpl(this);
}
