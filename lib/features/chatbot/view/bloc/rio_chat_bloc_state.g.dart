// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rio_chat_bloc_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RioChatStateCWProxy {
  RioChatState status(BaseStateStatus status);

  RioChatState message(String? message);

  RioChatState history(List<RioChatMessage> history);

  RioChatState sendingQuestion(String? sendingQuestion);

  RioChatState isTyping(bool isTyping);

  RioChatState error(String? error);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RioChatState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RioChatState(...).copyWith(id: 12, name: "My name")
  /// ````
  RioChatState call({
    BaseStateStatus? status,
    String? message,
    List<RioChatMessage>? history,
    String? sendingQuestion,
    bool? isTyping,
    String? error,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRioChatState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRioChatState.copyWith.fieldName(...)`
class _$RioChatStateCWProxyImpl implements _$RioChatStateCWProxy {
  const _$RioChatStateCWProxyImpl(this._value);

  final RioChatState _value;

  @override
  RioChatState status(BaseStateStatus status) => this(status: status);

  @override
  RioChatState message(String? message) => this(message: message);

  @override
  RioChatState history(List<RioChatMessage> history) => this(history: history);

  @override
  RioChatState sendingQuestion(String? sendingQuestion) =>
      this(sendingQuestion: sendingQuestion);

  @override
  RioChatState isTyping(bool isTyping) => this(isTyping: isTyping);

  @override
  RioChatState error(String? error) => this(error: error);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RioChatState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RioChatState(...).copyWith(id: 12, name: "My name")
  /// ````
  RioChatState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? history = const $CopyWithPlaceholder(),
    Object? sendingQuestion = const $CopyWithPlaceholder(),
    Object? isTyping = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
  }) {
    return RioChatState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      history: history == const $CopyWithPlaceholder() || history == null
          ? _value.history
          // ignore: cast_nullable_to_non_nullable
          : history as List<RioChatMessage>,
      sendingQuestion: sendingQuestion == const $CopyWithPlaceholder()
          ? _value.sendingQuestion
          // ignore: cast_nullable_to_non_nullable
          : sendingQuestion as String?,
      isTyping: isTyping == const $CopyWithPlaceholder() || isTyping == null
          ? _value.isTyping
          // ignore: cast_nullable_to_non_nullable
          : isTyping as bool,
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as String?,
    );
  }
}

extension $RioChatStateCopyWith on RioChatState {
  /// Returns a callable class that can be used as follows: `instanceOfRioChatState.copyWith(...)` or like so:`instanceOfRioChatState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RioChatStateCWProxy get copyWith => _$RioChatStateCWProxyImpl(this);
}
