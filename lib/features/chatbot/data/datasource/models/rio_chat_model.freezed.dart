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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
          RioChatResponse value, $Res Function(RioChatResponse) then) =
      _$RioChatResponseCopyWithImpl<$Res, RioChatResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'question') String? question,
      @JsonKey(name: 'answer') String? answer});
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
  $Res call({
    Object? question = freezed,
    Object? answer = freezed,
  }) {
    return _then(_value.copyWith(
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RioChatResponseImplCopyWith<$Res>
    implements $RioChatResponseCopyWith<$Res> {
  factory _$$RioChatResponseImplCopyWith(_$RioChatResponseImpl value,
          $Res Function(_$RioChatResponseImpl) then) =
      __$$RioChatResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'question') String? question,
      @JsonKey(name: 'answer') String? answer});
}

/// @nodoc
class __$$RioChatResponseImplCopyWithImpl<$Res>
    extends _$RioChatResponseCopyWithImpl<$Res, _$RioChatResponseImpl>
    implements _$$RioChatResponseImplCopyWith<$Res> {
  __$$RioChatResponseImplCopyWithImpl(
      _$RioChatResponseImpl _value, $Res Function(_$RioChatResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = freezed,
    Object? answer = freezed,
  }) {
    return _then(_$RioChatResponseImpl(
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RioChatResponseImpl implements _RioChatResponse {
  const _$RioChatResponseImpl(
      {@JsonKey(name: 'question') this.question,
      @JsonKey(name: 'answer') this.answer});

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
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RioChatResponseImplToJson(
      this,
    );
  }
}

abstract class _RioChatResponse implements RioChatResponse {
  const factory _RioChatResponse(
      {@JsonKey(name: 'question') final String? question,
      @JsonKey(name: 'answer') final String? answer}) = _$RioChatResponseImpl;

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
          RioChatMessage value, $Res Function(RioChatMessage) then) =
      _$RioChatMessageCopyWithImpl<$Res, RioChatMessage>;
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
  $Res call({
    Object? question = null,
    Object? answer = null,
  }) {
    return _then(_value.copyWith(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RioChatMessageImplCopyWith<$Res>
    implements $RioChatMessageCopyWith<$Res> {
  factory _$$RioChatMessageImplCopyWith(_$RioChatMessageImpl value,
          $Res Function(_$RioChatMessageImpl) then) =
      __$$RioChatMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String question, String answer});
}

/// @nodoc
class __$$RioChatMessageImplCopyWithImpl<$Res>
    extends _$RioChatMessageCopyWithImpl<$Res, _$RioChatMessageImpl>
    implements _$$RioChatMessageImplCopyWith<$Res> {
  __$$RioChatMessageImplCopyWithImpl(
      _$RioChatMessageImpl _value, $Res Function(_$RioChatMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answer = null,
  }) {
    return _then(_$RioChatMessageImpl(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
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
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RioChatMessageImplToJson(
      this,
    );
  }
}

abstract class _RioChatMessage implements RioChatMessage {
  const factory _RioChatMessage(
      {required final String question,
      required final String answer}) = _$RioChatMessageImpl;

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
