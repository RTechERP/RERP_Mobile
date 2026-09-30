// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rio_chat_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RioChatStateCWProxy {
  RioChatState status(BaseStateStatus status);

  RioChatState message(String? message);

  RioChatState messages(List<ChatMessage> messages);

  RioChatState pendingMessage(ChatMessage? pendingMessage);

  RioChatState chatHistory(List<ChatHistorySessionModel> chatHistory);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RioChatState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RioChatState(...).copyWith(id: 12, name: "My name")
  /// ````
  RioChatState call({
    BaseStateStatus? status,
    String? message,
    List<ChatMessage>? messages,
    ChatMessage? pendingMessage,
    List<ChatHistorySessionModel>? chatHistory,
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
  RioChatState messages(List<ChatMessage> messages) => this(messages: messages);

  @override
  RioChatState pendingMessage(ChatMessage? pendingMessage) =>
      this(pendingMessage: pendingMessage);

  @override
  RioChatState chatHistory(List<ChatHistorySessionModel> chatHistory) =>
      this(chatHistory: chatHistory);

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
    Object? messages = const $CopyWithPlaceholder(),
    Object? pendingMessage = const $CopyWithPlaceholder(),
    Object? chatHistory = const $CopyWithPlaceholder(),
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
      messages: messages == const $CopyWithPlaceholder() || messages == null
          ? _value.messages
          // ignore: cast_nullable_to_non_nullable
          : messages as List<ChatMessage>,
      pendingMessage: pendingMessage == const $CopyWithPlaceholder()
          ? _value.pendingMessage
          // ignore: cast_nullable_to_non_nullable
          : pendingMessage as ChatMessage?,
      chatHistory:
          chatHistory == const $CopyWithPlaceholder() || chatHistory == null
          ? _value.chatHistory
          // ignore: cast_nullable_to_non_nullable
          : chatHistory as List<ChatHistorySessionModel>,
    );
  }
}

extension $RioChatStateCopyWith on RioChatState {
  /// Returns a callable class that can be used as follows: `instanceOfRioChatState.copyWith(...)` or like so:`instanceOfRioChatState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RioChatStateCWProxy get copyWith => _$RioChatStateCWProxyImpl(this);
}
