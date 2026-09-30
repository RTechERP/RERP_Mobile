// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rio_chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RioChatResponse _$RioChatResponseFromJson(Map<String, dynamic> json) {
  return _RioChatResponse.fromJson(json);
}

/// @nodoc
mixin _$RioChatResponse {
  @JsonKey(name: 'question')
  String? get question => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer')
  String? get answer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RioChatResponseCopyWith<RioChatResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RioChatResponseCopyWith<$Res> {
  factory $RioChatResponseCopyWith(
    RioChatResponse value,
    $Res Function(RioChatResponse) then,
  ) = _$RioChatResponseCopyWithImpl<$Res, RioChatResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'question') String? question,
    @JsonKey(name: 'answer') String? answer,
  });
}

/// @nodoc
class _$RioChatResponseCopyWithImpl<$Res, $Val extends RioChatResponse>
    implements $RioChatResponseCopyWith<$Res> {
  _$RioChatResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? question = freezed, Object? answer = freezed}) {
    return _then(
      _value.copyWith(
            question: freezed == question
                ? _value.question
                : question // ignore: cast_nullable_to_non_nullable
                      as String?,
            answer: freezed == answer
                ? _value.answer
                : answer // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RioChatResponseImplCopyWith<$Res>
    implements $RioChatResponseCopyWith<$Res> {
  factory _$$RioChatResponseImplCopyWith(
    _$RioChatResponseImpl value,
    $Res Function(_$RioChatResponseImpl) then,
  ) = __$$RioChatResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'question') String? question,
    @JsonKey(name: 'answer') String? answer,
  });
}

/// @nodoc
class __$$RioChatResponseImplCopyWithImpl<$Res>
    extends _$RioChatResponseCopyWithImpl<$Res, _$RioChatResponseImpl>
    implements _$$RioChatResponseImplCopyWith<$Res> {
  __$$RioChatResponseImplCopyWithImpl(
    _$RioChatResponseImpl _value,
    $Res Function(_$RioChatResponseImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? question = freezed, Object? answer = freezed}) {
    return _then(
      _$RioChatResponseImpl(
        question: freezed == question
            ? _value.question
            : question // ignore: cast_nullable_to_non_nullable
                  as String?,
        answer: freezed == answer
            ? _value.answer
            : answer // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RioChatResponseImpl implements _RioChatResponse {
  const _$RioChatResponseImpl({
    @JsonKey(name: 'question') this.question,
    @JsonKey(name: 'answer') this.answer,
  });

  factory _$RioChatResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RioChatResponseImplFromJson(json);

  @override
  @JsonKey(name: 'question')
  final String? question;
  @override
  @JsonKey(name: 'answer')
  final String? answer;

  @override
  String toString() {
    return 'RioChatResponse(question: $question, answer: $answer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RioChatResponseImpl &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, question, answer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RioChatResponseImplCopyWith<_$RioChatResponseImpl> get copyWith =>
      __$$RioChatResponseImplCopyWithImpl<_$RioChatResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RioChatResponseImplToJson(this);
  }
}

abstract class _RioChatResponse implements RioChatResponse {
  const factory _RioChatResponse({
    @JsonKey(name: 'question') final String? question,
    @JsonKey(name: 'answer') final String? answer,
  }) = _$RioChatResponseImpl;

  factory _RioChatResponse.fromJson(Map<String, dynamic> json) =
      _$RioChatResponseImpl.fromJson;

  @override
  @JsonKey(name: 'question')
  String? get question;
  @override
  @JsonKey(name: 'answer')
  String? get answer;
  @override
  @JsonKey(ignore: true)
  _$$RioChatResponseImplCopyWith<_$RioChatResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RioChatMessage _$RioChatMessageFromJson(Map<String, dynamic> json) {
  return _RioChatMessage.fromJson(json);
}

/// @nodoc
mixin _$RioChatMessage {
  String get question => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RioChatMessageCopyWith<RioChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RioChatMessageCopyWith<$Res> {
  factory $RioChatMessageCopyWith(
    RioChatMessage value,
    $Res Function(RioChatMessage) then,
  ) = _$RioChatMessageCopyWithImpl<$Res, RioChatMessage>;
  @useResult
  $Res call({String question, String answer});
}

/// @nodoc
class _$RioChatMessageCopyWithImpl<$Res, $Val extends RioChatMessage>
    implements $RioChatMessageCopyWith<$Res> {
  _$RioChatMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? question = null, Object? answer = null}) {
    return _then(
      _value.copyWith(
            question: null == question
                ? _value.question
                : question // ignore: cast_nullable_to_non_nullable
                      as String,
            answer: null == answer
                ? _value.answer
                : answer // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RioChatMessageImplCopyWith<$Res>
    implements $RioChatMessageCopyWith<$Res> {
  factory _$$RioChatMessageImplCopyWith(
    _$RioChatMessageImpl value,
    $Res Function(_$RioChatMessageImpl) then,
  ) = __$$RioChatMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String question, String answer});
}

/// @nodoc
class __$$RioChatMessageImplCopyWithImpl<$Res>
    extends _$RioChatMessageCopyWithImpl<$Res, _$RioChatMessageImpl>
    implements _$$RioChatMessageImplCopyWith<$Res> {
  __$$RioChatMessageImplCopyWithImpl(
    _$RioChatMessageImpl _value,
    $Res Function(_$RioChatMessageImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? question = null, Object? answer = null}) {
    return _then(
      _$RioChatMessageImpl(
        question: null == question
            ? _value.question
            : question // ignore: cast_nullable_to_non_nullable
                  as String,
        answer: null == answer
            ? _value.answer
            : answer // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RioChatMessageImpl implements _RioChatMessage {
  const _$RioChatMessageImpl({required this.question, required this.answer});

  factory _$RioChatMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$RioChatMessageImplFromJson(json);

  @override
  final String question;
  @override
  final String answer;

  @override
  String toString() {
    return 'RioChatMessage(question: $question, answer: $answer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RioChatMessageImpl &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, question, answer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RioChatMessageImplCopyWith<_$RioChatMessageImpl> get copyWith =>
      __$$RioChatMessageImplCopyWithImpl<_$RioChatMessageImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RioChatMessageImplToJson(this);
  }
}

abstract class _RioChatMessage implements RioChatMessage {
  const factory _RioChatMessage({
    required final String question,
    required final String answer,
  }) = _$RioChatMessageImpl;

  factory _RioChatMessage.fromJson(Map<String, dynamic> json) =
      _$RioChatMessageImpl.fromJson;

  @override
  String get question;
  @override
  String get answer;
  @override
  @JsonKey(ignore: true)
  _$$RioChatMessageImplCopyWith<_$RioChatMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatHistorySession _$ChatHistorySessionFromJson(Map<String, dynamic> json) {
  return _ChatHistorySession.fromJson(json);
}

/// @nodoc
mixin _$ChatHistorySession {
  @JsonKey(name: 'SessionID')
  int get sessionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime get updatedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatHistorySessionCopyWith<ChatHistorySession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatHistorySessionCopyWith<$Res> {
  factory $ChatHistorySessionCopyWith(
    ChatHistorySession value,
    $Res Function(ChatHistorySession) then,
  ) = _$ChatHistorySessionCopyWithImpl<$Res, ChatHistorySession>;
  @useResult
  $Res call({
    @JsonKey(name: 'SessionID') int sessionId,
    @JsonKey(name: 'CreatedDate') DateTime createdDate,
    @JsonKey(name: 'UpdatedDate') DateTime updatedDate,
  });
}

/// @nodoc
class _$ChatHistorySessionCopyWithImpl<$Res, $Val extends ChatHistorySession>
    implements $ChatHistorySessionCopyWith<$Res> {
  _$ChatHistorySessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? createdDate = null,
    Object? updatedDate = null,
  }) {
    return _then(
      _value.copyWith(
            sessionId: null == sessionId
                ? _value.sessionId
                : sessionId // ignore: cast_nullable_to_non_nullable
                      as int,
            createdDate: null == createdDate
                ? _value.createdDate
                : createdDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedDate: null == updatedDate
                ? _value.updatedDate
                : updatedDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatHistorySessionImplCopyWith<$Res>
    implements $ChatHistorySessionCopyWith<$Res> {
  factory _$$ChatHistorySessionImplCopyWith(
    _$ChatHistorySessionImpl value,
    $Res Function(_$ChatHistorySessionImpl) then,
  ) = __$$ChatHistorySessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'SessionID') int sessionId,
    @JsonKey(name: 'CreatedDate') DateTime createdDate,
    @JsonKey(name: 'UpdatedDate') DateTime updatedDate,
  });
}

/// @nodoc
class __$$ChatHistorySessionImplCopyWithImpl<$Res>
    extends _$ChatHistorySessionCopyWithImpl<$Res, _$ChatHistorySessionImpl>
    implements _$$ChatHistorySessionImplCopyWith<$Res> {
  __$$ChatHistorySessionImplCopyWithImpl(
    _$ChatHistorySessionImpl _value,
    $Res Function(_$ChatHistorySessionImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? createdDate = null,
    Object? updatedDate = null,
  }) {
    return _then(
      _$ChatHistorySessionImpl(
        sessionId: null == sessionId
            ? _value.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as int,
        createdDate: null == createdDate
            ? _value.createdDate
            : createdDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedDate: null == updatedDate
            ? _value.updatedDate
            : updatedDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatHistorySessionImpl implements _ChatHistorySession {
  const _$ChatHistorySessionImpl({
    @JsonKey(name: 'SessionID') required this.sessionId,
    @JsonKey(name: 'CreatedDate') required this.createdDate,
    @JsonKey(name: 'UpdatedDate') required this.updatedDate,
  });

  factory _$ChatHistorySessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatHistorySessionImplFromJson(json);

  @override
  @JsonKey(name: 'SessionID')
  final int sessionId;
  @override
  @JsonKey(name: 'CreatedDate')
  final DateTime createdDate;
  @override
  @JsonKey(name: 'UpdatedDate')
  final DateTime updatedDate;

  @override
  String toString() {
    return 'ChatHistorySession(sessionId: $sessionId, createdDate: $createdDate, updatedDate: $updatedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatHistorySessionImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, sessionId, createdDate, updatedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatHistorySessionImplCopyWith<_$ChatHistorySessionImpl> get copyWith =>
      __$$ChatHistorySessionImplCopyWithImpl<_$ChatHistorySessionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatHistorySessionImplToJson(this);
  }
}

abstract class _ChatHistorySession implements ChatHistorySession {
  const factory _ChatHistorySession({
    @JsonKey(name: 'SessionID') required final int sessionId,
    @JsonKey(name: 'CreatedDate') required final DateTime createdDate,
    @JsonKey(name: 'UpdatedDate') required final DateTime updatedDate,
  }) = _$ChatHistorySessionImpl;

  factory _ChatHistorySession.fromJson(Map<String, dynamic> json) =
      _$ChatHistorySessionImpl.fromJson;

  @override
  @JsonKey(name: 'SessionID')
  int get sessionId;
  @override
  @JsonKey(name: 'CreatedDate')
  DateTime get createdDate;
  @override
  @JsonKey(name: 'UpdatedDate')
  DateTime get updatedDate;
  @override
  @JsonKey(ignore: true)
  _$$ChatHistorySessionImplCopyWith<_$ChatHistorySessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatHistoryMessage _$ChatHistoryMessageFromJson(Map<String, dynamic> json) {
  return _ChatHistoryMessage.fromJson(json);
}

/// @nodoc
mixin _$ChatHistoryMessage {
  @JsonKey(name: 'Question')
  String get question => throw _privateConstructorUsedError;
  @JsonKey(name: 'Answer')
  String get answer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatHistoryMessageCopyWith<ChatHistoryMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatHistoryMessageCopyWith<$Res> {
  factory $ChatHistoryMessageCopyWith(
    ChatHistoryMessage value,
    $Res Function(ChatHistoryMessage) then,
  ) = _$ChatHistoryMessageCopyWithImpl<$Res, ChatHistoryMessage>;
  @useResult
  $Res call({
    @JsonKey(name: 'Question') String question,
    @JsonKey(name: 'Answer') String answer,
  });
}

/// @nodoc
class _$ChatHistoryMessageCopyWithImpl<$Res, $Val extends ChatHistoryMessage>
    implements $ChatHistoryMessageCopyWith<$Res> {
  _$ChatHistoryMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? question = null, Object? answer = null}) {
    return _then(
      _value.copyWith(
            question: null == question
                ? _value.question
                : question // ignore: cast_nullable_to_non_nullable
                      as String,
            answer: null == answer
                ? _value.answer
                : answer // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatHistoryMessageImplCopyWith<$Res>
    implements $ChatHistoryMessageCopyWith<$Res> {
  factory _$$ChatHistoryMessageImplCopyWith(
    _$ChatHistoryMessageImpl value,
    $Res Function(_$ChatHistoryMessageImpl) then,
  ) = __$$ChatHistoryMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'Question') String question,
    @JsonKey(name: 'Answer') String answer,
  });
}

/// @nodoc
class __$$ChatHistoryMessageImplCopyWithImpl<$Res>
    extends _$ChatHistoryMessageCopyWithImpl<$Res, _$ChatHistoryMessageImpl>
    implements _$$ChatHistoryMessageImplCopyWith<$Res> {
  __$$ChatHistoryMessageImplCopyWithImpl(
    _$ChatHistoryMessageImpl _value,
    $Res Function(_$ChatHistoryMessageImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? question = null, Object? answer = null}) {
    return _then(
      _$ChatHistoryMessageImpl(
        question: null == question
            ? _value.question
            : question // ignore: cast_nullable_to_non_nullable
                  as String,
        answer: null == answer
            ? _value.answer
            : answer // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatHistoryMessageImpl implements _ChatHistoryMessage {
  const _$ChatHistoryMessageImpl({
    @JsonKey(name: 'Question') required this.question,
    @JsonKey(name: 'Answer') required this.answer,
  });

  factory _$ChatHistoryMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatHistoryMessageImplFromJson(json);

  @override
  @JsonKey(name: 'Question')
  final String question;
  @override
  @JsonKey(name: 'Answer')
  final String answer;

  @override
  String toString() {
    return 'ChatHistoryMessage(question: $question, answer: $answer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatHistoryMessageImpl &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, question, answer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatHistoryMessageImplCopyWith<_$ChatHistoryMessageImpl> get copyWith =>
      __$$ChatHistoryMessageImplCopyWithImpl<_$ChatHistoryMessageImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatHistoryMessageImplToJson(this);
  }
}

abstract class _ChatHistoryMessage implements ChatHistoryMessage {
  const factory _ChatHistoryMessage({
    @JsonKey(name: 'Question') required final String question,
    @JsonKey(name: 'Answer') required final String answer,
  }) = _$ChatHistoryMessageImpl;

  factory _ChatHistoryMessage.fromJson(Map<String, dynamic> json) =
      _$ChatHistoryMessageImpl.fromJson;

  @override
  @JsonKey(name: 'Question')
  String get question;
  @override
  @JsonKey(name: 'Answer')
  String get answer;
  @override
  @JsonKey(ignore: true)
  _$$ChatHistoryMessageImplCopyWith<_$ChatHistoryMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatSessionDetail _$ChatSessionDetailFromJson(Map<String, dynamic> json) {
  return _ChatSessionDetail.fromJson(json);
}

/// @nodoc
mixin _$ChatSessionDetail {
  @JsonKey(name: 'SessionID')
  int get sessionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'Messages')
  List<ChatHistoryMessage> get messages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatSessionDetailCopyWith<ChatSessionDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatSessionDetailCopyWith<$Res> {
  factory $ChatSessionDetailCopyWith(
    ChatSessionDetail value,
    $Res Function(ChatSessionDetail) then,
  ) = _$ChatSessionDetailCopyWithImpl<$Res, ChatSessionDetail>;
  @useResult
  $Res call({
    @JsonKey(name: 'SessionID') int sessionId,
    @JsonKey(name: 'CreatedDate') DateTime createdDate,
    @JsonKey(name: 'UpdatedDate') DateTime updatedDate,
    @JsonKey(name: 'Messages') List<ChatHistoryMessage> messages,
  });
}

/// @nodoc
class _$ChatSessionDetailCopyWithImpl<$Res, $Val extends ChatSessionDetail>
    implements $ChatSessionDetailCopyWith<$Res> {
  _$ChatSessionDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? createdDate = null,
    Object? updatedDate = null,
    Object? messages = null,
  }) {
    return _then(
      _value.copyWith(
            sessionId: null == sessionId
                ? _value.sessionId
                : sessionId // ignore: cast_nullable_to_non_nullable
                      as int,
            createdDate: null == createdDate
                ? _value.createdDate
                : createdDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedDate: null == updatedDate
                ? _value.updatedDate
                : updatedDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            messages: null == messages
                ? _value.messages
                : messages // ignore: cast_nullable_to_non_nullable
                      as List<ChatHistoryMessage>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatSessionDetailImplCopyWith<$Res>
    implements $ChatSessionDetailCopyWith<$Res> {
  factory _$$ChatSessionDetailImplCopyWith(
    _$ChatSessionDetailImpl value,
    $Res Function(_$ChatSessionDetailImpl) then,
  ) = __$$ChatSessionDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'SessionID') int sessionId,
    @JsonKey(name: 'CreatedDate') DateTime createdDate,
    @JsonKey(name: 'UpdatedDate') DateTime updatedDate,
    @JsonKey(name: 'Messages') List<ChatHistoryMessage> messages,
  });
}

/// @nodoc
class __$$ChatSessionDetailImplCopyWithImpl<$Res>
    extends _$ChatSessionDetailCopyWithImpl<$Res, _$ChatSessionDetailImpl>
    implements _$$ChatSessionDetailImplCopyWith<$Res> {
  __$$ChatSessionDetailImplCopyWithImpl(
    _$ChatSessionDetailImpl _value,
    $Res Function(_$ChatSessionDetailImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? createdDate = null,
    Object? updatedDate = null,
    Object? messages = null,
  }) {
    return _then(
      _$ChatSessionDetailImpl(
        sessionId: null == sessionId
            ? _value.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as int,
        createdDate: null == createdDate
            ? _value.createdDate
            : createdDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedDate: null == updatedDate
            ? _value.updatedDate
            : updatedDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        messages: null == messages
            ? _value._messages
            : messages // ignore: cast_nullable_to_non_nullable
                  as List<ChatHistoryMessage>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatSessionDetailImpl implements _ChatSessionDetail {
  const _$ChatSessionDetailImpl({
    @JsonKey(name: 'SessionID') required this.sessionId,
    @JsonKey(name: 'CreatedDate') required this.createdDate,
    @JsonKey(name: 'UpdatedDate') required this.updatedDate,
    @JsonKey(name: 'Messages') required final List<ChatHistoryMessage> messages,
  }) : _messages = messages;

  factory _$ChatSessionDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatSessionDetailImplFromJson(json);

  @override
  @JsonKey(name: 'SessionID')
  final int sessionId;
  @override
  @JsonKey(name: 'CreatedDate')
  final DateTime createdDate;
  @override
  @JsonKey(name: 'UpdatedDate')
  final DateTime updatedDate;
  final List<ChatHistoryMessage> _messages;
  @override
  @JsonKey(name: 'Messages')
  List<ChatHistoryMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'ChatSessionDetail(sessionId: $sessionId, createdDate: $createdDate, updatedDate: $updatedDate, messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatSessionDetailImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    sessionId,
    createdDate,
    updatedDate,
    const DeepCollectionEquality().hash(_messages),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatSessionDetailImplCopyWith<_$ChatSessionDetailImpl> get copyWith =>
      __$$ChatSessionDetailImplCopyWithImpl<_$ChatSessionDetailImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatSessionDetailImplToJson(this);
  }
}

abstract class _ChatSessionDetail implements ChatSessionDetail {
  const factory _ChatSessionDetail({
    @JsonKey(name: 'SessionID') required final int sessionId,
    @JsonKey(name: 'CreatedDate') required final DateTime createdDate,
    @JsonKey(name: 'UpdatedDate') required final DateTime updatedDate,
    @JsonKey(name: 'Messages') required final List<ChatHistoryMessage> messages,
  }) = _$ChatSessionDetailImpl;

  factory _ChatSessionDetail.fromJson(Map<String, dynamic> json) =
      _$ChatSessionDetailImpl.fromJson;

  @override
  @JsonKey(name: 'SessionID')
  int get sessionId;
  @override
  @JsonKey(name: 'CreatedDate')
  DateTime get createdDate;
  @override
  @JsonKey(name: 'UpdatedDate')
  DateTime get updatedDate;
  @override
  @JsonKey(name: 'Messages')
  List<ChatHistoryMessage> get messages;
  @override
  @JsonKey(ignore: true)
  _$$ChatSessionDetailImplCopyWith<_$ChatSessionDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
