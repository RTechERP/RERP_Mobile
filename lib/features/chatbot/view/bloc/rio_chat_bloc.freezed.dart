// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rio_chat_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RioChatEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loadHistory,
    required TResult Function(int sessionId) selectSession,
    required TResult Function(String message) sendMessage,
    required TResult Function() clear,
    required TResult Function() startNew,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loadHistory,
    TResult? Function(int sessionId)? selectSession,
    TResult? Function(String message)? sendMessage,
    TResult? Function()? clear,
    TResult? Function()? startNew,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loadHistory,
    TResult Function(int sessionId)? selectSession,
    TResult Function(String message)? sendMessage,
    TResult Function()? clear,
    TResult Function()? startNew,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RioChatInit value) init,
    required TResult Function(RioChatLoadHistory value) loadHistory,
    required TResult Function(RioChatSelectSession value) selectSession,
    required TResult Function(RioChatSendMessage value) sendMessage,
    required TResult Function(RioChatClear value) clear,
    required TResult Function(RioChatStartNew value) startNew,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RioChatInit value)? init,
    TResult? Function(RioChatLoadHistory value)? loadHistory,
    TResult? Function(RioChatSelectSession value)? selectSession,
    TResult? Function(RioChatSendMessage value)? sendMessage,
    TResult? Function(RioChatClear value)? clear,
    TResult? Function(RioChatStartNew value)? startNew,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RioChatInit value)? init,
    TResult Function(RioChatLoadHistory value)? loadHistory,
    TResult Function(RioChatSelectSession value)? selectSession,
    TResult Function(RioChatSendMessage value)? sendMessage,
    TResult Function(RioChatClear value)? clear,
    TResult Function(RioChatStartNew value)? startNew,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RioChatEventCopyWith<$Res> {
  factory $RioChatEventCopyWith(
    RioChatEvent value,
    $Res Function(RioChatEvent) then,
  ) = _$RioChatEventCopyWithImpl<$Res, RioChatEvent>;
}

/// @nodoc
class _$RioChatEventCopyWithImpl<$Res, $Val extends RioChatEvent>
    implements $RioChatEventCopyWith<$Res> {
  _$RioChatEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RioChatInitImplCopyWith<$Res> {
  factory _$$RioChatInitImplCopyWith(
    _$RioChatInitImpl value,
    $Res Function(_$RioChatInitImpl) then,
  ) = __$$RioChatInitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RioChatInitImplCopyWithImpl<$Res>
    extends _$RioChatEventCopyWithImpl<$Res, _$RioChatInitImpl>
    implements _$$RioChatInitImplCopyWith<$Res> {
  __$$RioChatInitImplCopyWithImpl(
    _$RioChatInitImpl _value,
    $Res Function(_$RioChatInitImpl) _then,
  ) : super(_value, _then);
}

/// @nodoc

class _$RioChatInitImpl implements RioChatInit {
  const _$RioChatInitImpl();

  @override
  String toString() {
    return 'RioChatEvent.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RioChatInitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loadHistory,
    required TResult Function(int sessionId) selectSession,
    required TResult Function(String message) sendMessage,
    required TResult Function() clear,
    required TResult Function() startNew,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loadHistory,
    TResult? Function(int sessionId)? selectSession,
    TResult? Function(String message)? sendMessage,
    TResult? Function()? clear,
    TResult? Function()? startNew,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loadHistory,
    TResult Function(int sessionId)? selectSession,
    TResult Function(String message)? sendMessage,
    TResult Function()? clear,
    TResult Function()? startNew,
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
    required TResult Function(RioChatInit value) init,
    required TResult Function(RioChatLoadHistory value) loadHistory,
    required TResult Function(RioChatSelectSession value) selectSession,
    required TResult Function(RioChatSendMessage value) sendMessage,
    required TResult Function(RioChatClear value) clear,
    required TResult Function(RioChatStartNew value) startNew,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RioChatInit value)? init,
    TResult? Function(RioChatLoadHistory value)? loadHistory,
    TResult? Function(RioChatSelectSession value)? selectSession,
    TResult? Function(RioChatSendMessage value)? sendMessage,
    TResult? Function(RioChatClear value)? clear,
    TResult? Function(RioChatStartNew value)? startNew,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RioChatInit value)? init,
    TResult Function(RioChatLoadHistory value)? loadHistory,
    TResult Function(RioChatSelectSession value)? selectSession,
    TResult Function(RioChatSendMessage value)? sendMessage,
    TResult Function(RioChatClear value)? clear,
    TResult Function(RioChatStartNew value)? startNew,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class RioChatInit implements RioChatEvent {
  const factory RioChatInit() = _$RioChatInitImpl;
}

/// @nodoc
abstract class _$$RioChatLoadHistoryImplCopyWith<$Res> {
  factory _$$RioChatLoadHistoryImplCopyWith(
    _$RioChatLoadHistoryImpl value,
    $Res Function(_$RioChatLoadHistoryImpl) then,
  ) = __$$RioChatLoadHistoryImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RioChatLoadHistoryImplCopyWithImpl<$Res>
    extends _$RioChatEventCopyWithImpl<$Res, _$RioChatLoadHistoryImpl>
    implements _$$RioChatLoadHistoryImplCopyWith<$Res> {
  __$$RioChatLoadHistoryImplCopyWithImpl(
    _$RioChatLoadHistoryImpl _value,
    $Res Function(_$RioChatLoadHistoryImpl) _then,
  ) : super(_value, _then);
}

/// @nodoc

class _$RioChatLoadHistoryImpl implements RioChatLoadHistory {
  const _$RioChatLoadHistoryImpl();

  @override
  String toString() {
    return 'RioChatEvent.loadHistory()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RioChatLoadHistoryImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loadHistory,
    required TResult Function(int sessionId) selectSession,
    required TResult Function(String message) sendMessage,
    required TResult Function() clear,
    required TResult Function() startNew,
  }) {
    return loadHistory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loadHistory,
    TResult? Function(int sessionId)? selectSession,
    TResult? Function(String message)? sendMessage,
    TResult? Function()? clear,
    TResult? Function()? startNew,
  }) {
    return loadHistory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loadHistory,
    TResult Function(int sessionId)? selectSession,
    TResult Function(String message)? sendMessage,
    TResult Function()? clear,
    TResult Function()? startNew,
    required TResult orElse(),
  }) {
    if (loadHistory != null) {
      return loadHistory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RioChatInit value) init,
    required TResult Function(RioChatLoadHistory value) loadHistory,
    required TResult Function(RioChatSelectSession value) selectSession,
    required TResult Function(RioChatSendMessage value) sendMessage,
    required TResult Function(RioChatClear value) clear,
    required TResult Function(RioChatStartNew value) startNew,
  }) {
    return loadHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RioChatInit value)? init,
    TResult? Function(RioChatLoadHistory value)? loadHistory,
    TResult? Function(RioChatSelectSession value)? selectSession,
    TResult? Function(RioChatSendMessage value)? sendMessage,
    TResult? Function(RioChatClear value)? clear,
    TResult? Function(RioChatStartNew value)? startNew,
  }) {
    return loadHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RioChatInit value)? init,
    TResult Function(RioChatLoadHistory value)? loadHistory,
    TResult Function(RioChatSelectSession value)? selectSession,
    TResult Function(RioChatSendMessage value)? sendMessage,
    TResult Function(RioChatClear value)? clear,
    TResult Function(RioChatStartNew value)? startNew,
    required TResult orElse(),
  }) {
    if (loadHistory != null) {
      return loadHistory(this);
    }
    return orElse();
  }
}

abstract class RioChatLoadHistory implements RioChatEvent {
  const factory RioChatLoadHistory() = _$RioChatLoadHistoryImpl;
}

/// @nodoc
abstract class _$$RioChatSelectSessionImplCopyWith<$Res> {
  factory _$$RioChatSelectSessionImplCopyWith(
    _$RioChatSelectSessionImpl value,
    $Res Function(_$RioChatSelectSessionImpl) then,
  ) = __$$RioChatSelectSessionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int sessionId});
}

/// @nodoc
class __$$RioChatSelectSessionImplCopyWithImpl<$Res>
    extends _$RioChatEventCopyWithImpl<$Res, _$RioChatSelectSessionImpl>
    implements _$$RioChatSelectSessionImplCopyWith<$Res> {
  __$$RioChatSelectSessionImplCopyWithImpl(
    _$RioChatSelectSessionImpl _value,
    $Res Function(_$RioChatSelectSessionImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? sessionId = null}) {
    return _then(
      _$RioChatSelectSessionImpl(
        sessionId: null == sessionId
            ? _value.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$RioChatSelectSessionImpl implements RioChatSelectSession {
  const _$RioChatSelectSessionImpl({required this.sessionId});

  @override
  final int sessionId;

  @override
  String toString() {
    return 'RioChatEvent.selectSession(sessionId: $sessionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RioChatSelectSessionImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sessionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RioChatSelectSessionImplCopyWith<_$RioChatSelectSessionImpl>
  get copyWith =>
      __$$RioChatSelectSessionImplCopyWithImpl<_$RioChatSelectSessionImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loadHistory,
    required TResult Function(int sessionId) selectSession,
    required TResult Function(String message) sendMessage,
    required TResult Function() clear,
    required TResult Function() startNew,
  }) {
    return selectSession(sessionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loadHistory,
    TResult? Function(int sessionId)? selectSession,
    TResult? Function(String message)? sendMessage,
    TResult? Function()? clear,
    TResult? Function()? startNew,
  }) {
    return selectSession?.call(sessionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loadHistory,
    TResult Function(int sessionId)? selectSession,
    TResult Function(String message)? sendMessage,
    TResult Function()? clear,
    TResult Function()? startNew,
    required TResult orElse(),
  }) {
    if (selectSession != null) {
      return selectSession(sessionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RioChatInit value) init,
    required TResult Function(RioChatLoadHistory value) loadHistory,
    required TResult Function(RioChatSelectSession value) selectSession,
    required TResult Function(RioChatSendMessage value) sendMessage,
    required TResult Function(RioChatClear value) clear,
    required TResult Function(RioChatStartNew value) startNew,
  }) {
    return selectSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RioChatInit value)? init,
    TResult? Function(RioChatLoadHistory value)? loadHistory,
    TResult? Function(RioChatSelectSession value)? selectSession,
    TResult? Function(RioChatSendMessage value)? sendMessage,
    TResult? Function(RioChatClear value)? clear,
    TResult? Function(RioChatStartNew value)? startNew,
  }) {
    return selectSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RioChatInit value)? init,
    TResult Function(RioChatLoadHistory value)? loadHistory,
    TResult Function(RioChatSelectSession value)? selectSession,
    TResult Function(RioChatSendMessage value)? sendMessage,
    TResult Function(RioChatClear value)? clear,
    TResult Function(RioChatStartNew value)? startNew,
    required TResult orElse(),
  }) {
    if (selectSession != null) {
      return selectSession(this);
    }
    return orElse();
  }
}

abstract class RioChatSelectSession implements RioChatEvent {
  const factory RioChatSelectSession({required final int sessionId}) =
      _$RioChatSelectSessionImpl;

  int get sessionId;
  @JsonKey(ignore: true)
  _$$RioChatSelectSessionImplCopyWith<_$RioChatSelectSessionImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RioChatSendMessageImplCopyWith<$Res> {
  factory _$$RioChatSendMessageImplCopyWith(
    _$RioChatSendMessageImpl value,
    $Res Function(_$RioChatSendMessageImpl) then,
  ) = __$$RioChatSendMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RioChatSendMessageImplCopyWithImpl<$Res>
    extends _$RioChatEventCopyWithImpl<$Res, _$RioChatSendMessageImpl>
    implements _$$RioChatSendMessageImplCopyWith<$Res> {
  __$$RioChatSendMessageImplCopyWithImpl(
    _$RioChatSendMessageImpl _value,
    $Res Function(_$RioChatSendMessageImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$RioChatSendMessageImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$RioChatSendMessageImpl implements RioChatSendMessage {
  const _$RioChatSendMessageImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'RioChatEvent.sendMessage(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RioChatSendMessageImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RioChatSendMessageImplCopyWith<_$RioChatSendMessageImpl> get copyWith =>
      __$$RioChatSendMessageImplCopyWithImpl<_$RioChatSendMessageImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loadHistory,
    required TResult Function(int sessionId) selectSession,
    required TResult Function(String message) sendMessage,
    required TResult Function() clear,
    required TResult Function() startNew,
  }) {
    return sendMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loadHistory,
    TResult? Function(int sessionId)? selectSession,
    TResult? Function(String message)? sendMessage,
    TResult? Function()? clear,
    TResult? Function()? startNew,
  }) {
    return sendMessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loadHistory,
    TResult Function(int sessionId)? selectSession,
    TResult Function(String message)? sendMessage,
    TResult Function()? clear,
    TResult Function()? startNew,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RioChatInit value) init,
    required TResult Function(RioChatLoadHistory value) loadHistory,
    required TResult Function(RioChatSelectSession value) selectSession,
    required TResult Function(RioChatSendMessage value) sendMessage,
    required TResult Function(RioChatClear value) clear,
    required TResult Function(RioChatStartNew value) startNew,
  }) {
    return sendMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RioChatInit value)? init,
    TResult? Function(RioChatLoadHistory value)? loadHistory,
    TResult? Function(RioChatSelectSession value)? selectSession,
    TResult? Function(RioChatSendMessage value)? sendMessage,
    TResult? Function(RioChatClear value)? clear,
    TResult? Function(RioChatStartNew value)? startNew,
  }) {
    return sendMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RioChatInit value)? init,
    TResult Function(RioChatLoadHistory value)? loadHistory,
    TResult Function(RioChatSelectSession value)? selectSession,
    TResult Function(RioChatSendMessage value)? sendMessage,
    TResult Function(RioChatClear value)? clear,
    TResult Function(RioChatStartNew value)? startNew,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(this);
    }
    return orElse();
  }
}

abstract class RioChatSendMessage implements RioChatEvent {
  const factory RioChatSendMessage({required final String message}) =
      _$RioChatSendMessageImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$RioChatSendMessageImplCopyWith<_$RioChatSendMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RioChatClearImplCopyWith<$Res> {
  factory _$$RioChatClearImplCopyWith(
    _$RioChatClearImpl value,
    $Res Function(_$RioChatClearImpl) then,
  ) = __$$RioChatClearImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RioChatClearImplCopyWithImpl<$Res>
    extends _$RioChatEventCopyWithImpl<$Res, _$RioChatClearImpl>
    implements _$$RioChatClearImplCopyWith<$Res> {
  __$$RioChatClearImplCopyWithImpl(
    _$RioChatClearImpl _value,
    $Res Function(_$RioChatClearImpl) _then,
  ) : super(_value, _then);
}

/// @nodoc

class _$RioChatClearImpl implements RioChatClear {
  const _$RioChatClearImpl();

  @override
  String toString() {
    return 'RioChatEvent.clear()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RioChatClearImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loadHistory,
    required TResult Function(int sessionId) selectSession,
    required TResult Function(String message) sendMessage,
    required TResult Function() clear,
    required TResult Function() startNew,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loadHistory,
    TResult? Function(int sessionId)? selectSession,
    TResult? Function(String message)? sendMessage,
    TResult? Function()? clear,
    TResult? Function()? startNew,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loadHistory,
    TResult Function(int sessionId)? selectSession,
    TResult Function(String message)? sendMessage,
    TResult Function()? clear,
    TResult Function()? startNew,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RioChatInit value) init,
    required TResult Function(RioChatLoadHistory value) loadHistory,
    required TResult Function(RioChatSelectSession value) selectSession,
    required TResult Function(RioChatSendMessage value) sendMessage,
    required TResult Function(RioChatClear value) clear,
    required TResult Function(RioChatStartNew value) startNew,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RioChatInit value)? init,
    TResult? Function(RioChatLoadHistory value)? loadHistory,
    TResult? Function(RioChatSelectSession value)? selectSession,
    TResult? Function(RioChatSendMessage value)? sendMessage,
    TResult? Function(RioChatClear value)? clear,
    TResult? Function(RioChatStartNew value)? startNew,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RioChatInit value)? init,
    TResult Function(RioChatLoadHistory value)? loadHistory,
    TResult Function(RioChatSelectSession value)? selectSession,
    TResult Function(RioChatSendMessage value)? sendMessage,
    TResult Function(RioChatClear value)? clear,
    TResult Function(RioChatStartNew value)? startNew,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class RioChatClear implements RioChatEvent {
  const factory RioChatClear() = _$RioChatClearImpl;
}

/// @nodoc
abstract class _$$RioChatStartNewImplCopyWith<$Res> {
  factory _$$RioChatStartNewImplCopyWith(
    _$RioChatStartNewImpl value,
    $Res Function(_$RioChatStartNewImpl) then,
  ) = __$$RioChatStartNewImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RioChatStartNewImplCopyWithImpl<$Res>
    extends _$RioChatEventCopyWithImpl<$Res, _$RioChatStartNewImpl>
    implements _$$RioChatStartNewImplCopyWith<$Res> {
  __$$RioChatStartNewImplCopyWithImpl(
    _$RioChatStartNewImpl _value,
    $Res Function(_$RioChatStartNewImpl) _then,
  ) : super(_value, _then);
}

/// @nodoc

class _$RioChatStartNewImpl implements RioChatStartNew {
  const _$RioChatStartNewImpl();

  @override
  String toString() {
    return 'RioChatEvent.startNew()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RioChatStartNewImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loadHistory,
    required TResult Function(int sessionId) selectSession,
    required TResult Function(String message) sendMessage,
    required TResult Function() clear,
    required TResult Function() startNew,
  }) {
    return startNew();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loadHistory,
    TResult? Function(int sessionId)? selectSession,
    TResult? Function(String message)? sendMessage,
    TResult? Function()? clear,
    TResult? Function()? startNew,
  }) {
    return startNew?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loadHistory,
    TResult Function(int sessionId)? selectSession,
    TResult Function(String message)? sendMessage,
    TResult Function()? clear,
    TResult Function()? startNew,
    required TResult orElse(),
  }) {
    if (startNew != null) {
      return startNew();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RioChatInit value) init,
    required TResult Function(RioChatLoadHistory value) loadHistory,
    required TResult Function(RioChatSelectSession value) selectSession,
    required TResult Function(RioChatSendMessage value) sendMessage,
    required TResult Function(RioChatClear value) clear,
    required TResult Function(RioChatStartNew value) startNew,
  }) {
    return startNew(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RioChatInit value)? init,
    TResult? Function(RioChatLoadHistory value)? loadHistory,
    TResult? Function(RioChatSelectSession value)? selectSession,
    TResult? Function(RioChatSendMessage value)? sendMessage,
    TResult? Function(RioChatClear value)? clear,
    TResult? Function(RioChatStartNew value)? startNew,
  }) {
    return startNew?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RioChatInit value)? init,
    TResult Function(RioChatLoadHistory value)? loadHistory,
    TResult Function(RioChatSelectSession value)? selectSession,
    TResult Function(RioChatSendMessage value)? sendMessage,
    TResult Function(RioChatClear value)? clear,
    TResult Function(RioChatStartNew value)? startNew,
    required TResult orElse(),
  }) {
    if (startNew != null) {
      return startNew(this);
    }
    return orElse();
  }
}

abstract class RioChatStartNew implements RioChatEvent {
  const factory RioChatStartNew() = _$RioChatStartNewImpl;
}
