// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pin_verify_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CheckPinResponse _$CheckPinResponseFromJson(Map<String, dynamic> json) {
  return _CheckPinResponse.fromJson(json);
}

/// @nodoc
mixin _$CheckPinResponse {
  @JsonKey(name: 'hasPin')
  bool? get hasPin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckPinResponseCopyWith<CheckPinResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckPinResponseCopyWith<$Res> {
  factory $CheckPinResponseCopyWith(
          CheckPinResponse value, $Res Function(CheckPinResponse) then) =
      _$CheckPinResponseCopyWithImpl<$Res, CheckPinResponse>;
  @useResult
  $Res call({@JsonKey(name: 'hasPin') bool? hasPin});
}

/// @nodoc
class _$CheckPinResponseCopyWithImpl<$Res, $Val extends CheckPinResponse>
    implements $CheckPinResponseCopyWith<$Res> {
  _$CheckPinResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasPin = freezed,
  }) {
    return _then(_value.copyWith(
      hasPin: freezed == hasPin
          ? _value.hasPin
          : hasPin // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckPinResponseImplCopyWith<$Res>
    implements $CheckPinResponseCopyWith<$Res> {
  factory _$$CheckPinResponseImplCopyWith(_$CheckPinResponseImpl value,
          $Res Function(_$CheckPinResponseImpl) then) =
      __$$CheckPinResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'hasPin') bool? hasPin});
}

/// @nodoc
class __$$CheckPinResponseImplCopyWithImpl<$Res>
    extends _$CheckPinResponseCopyWithImpl<$Res, _$CheckPinResponseImpl>
    implements _$$CheckPinResponseImplCopyWith<$Res> {
  __$$CheckPinResponseImplCopyWithImpl(_$CheckPinResponseImpl _value,
      $Res Function(_$CheckPinResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasPin = freezed,
  }) {
    return _then(_$CheckPinResponseImpl(
      hasPin: freezed == hasPin
          ? _value.hasPin
          : hasPin // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckPinResponseImpl implements _CheckPinResponse {
  const _$CheckPinResponseImpl({@JsonKey(name: 'hasPin') this.hasPin});

  factory _$CheckPinResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckPinResponseImplFromJson(json);

  @override
  @JsonKey(name: 'hasPin')
  final bool? hasPin;

  @override
  String toString() {
    return 'CheckPinResponse(hasPin: $hasPin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckPinResponseImpl &&
            (identical(other.hasPin, hasPin) || other.hasPin == hasPin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hasPin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckPinResponseImplCopyWith<_$CheckPinResponseImpl> get copyWith =>
      __$$CheckPinResponseImplCopyWithImpl<_$CheckPinResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckPinResponseImplToJson(
      this,
    );
  }
}

abstract class _CheckPinResponse implements CheckPinResponse {
  const factory _CheckPinResponse(
      {@JsonKey(name: 'hasPin') final bool? hasPin}) = _$CheckPinResponseImpl;

  factory _CheckPinResponse.fromJson(Map<String, dynamic> json) =
      _$CheckPinResponseImpl.fromJson;

  @override
  @JsonKey(name: 'hasPin')
  bool? get hasPin;
  @override
  @JsonKey(ignore: true)
  _$$CheckPinResponseImplCopyWith<_$CheckPinResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SetPinResponse _$SetPinResponseFromJson(Map<String, dynamic> json) {
  return _SetPinResponse.fromJson(json);
}

/// @nodoc
mixin _$SetPinResponse {
  @JsonKey(name: 'data')
  dynamic get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SetPinResponseCopyWith<SetPinResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetPinResponseCopyWith<$Res> {
  factory $SetPinResponseCopyWith(
          SetPinResponse value, $Res Function(SetPinResponse) then) =
      _$SetPinResponseCopyWithImpl<$Res, SetPinResponse>;
  @useResult
  $Res call({@JsonKey(name: 'data') dynamic data});
}

/// @nodoc
class _$SetPinResponseCopyWithImpl<$Res, $Val extends SetPinResponse>
    implements $SetPinResponseCopyWith<$Res> {
  _$SetPinResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SetPinResponseImplCopyWith<$Res>
    implements $SetPinResponseCopyWith<$Res> {
  factory _$$SetPinResponseImplCopyWith(_$SetPinResponseImpl value,
          $Res Function(_$SetPinResponseImpl) then) =
      __$$SetPinResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'data') dynamic data});
}

/// @nodoc
class __$$SetPinResponseImplCopyWithImpl<$Res>
    extends _$SetPinResponseCopyWithImpl<$Res, _$SetPinResponseImpl>
    implements _$$SetPinResponseImplCopyWith<$Res> {
  __$$SetPinResponseImplCopyWithImpl(
      _$SetPinResponseImpl _value, $Res Function(_$SetPinResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SetPinResponseImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SetPinResponseImpl implements _SetPinResponse {
  const _$SetPinResponseImpl({@JsonKey(name: 'data') this.data});

  factory _$SetPinResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SetPinResponseImplFromJson(json);

  @override
  @JsonKey(name: 'data')
  final dynamic data;

  @override
  String toString() {
    return 'SetPinResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetPinResponseImpl &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetPinResponseImplCopyWith<_$SetPinResponseImpl> get copyWith =>
      __$$SetPinResponseImplCopyWithImpl<_$SetPinResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SetPinResponseImplToJson(
      this,
    );
  }
}

abstract class _SetPinResponse implements SetPinResponse {
  const factory _SetPinResponse({@JsonKey(name: 'data') final dynamic data}) =
      _$SetPinResponseImpl;

  factory _SetPinResponse.fromJson(Map<String, dynamic> json) =
      _$SetPinResponseImpl.fromJson;

  @override
  @JsonKey(name: 'data')
  dynamic get data;
  @override
  @JsonKey(ignore: true)
  _$$SetPinResponseImplCopyWith<_$SetPinResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VerifiedPinResponse _$VerifiedPinResponseFromJson(Map<String, dynamic> json) {
  return _VerifiedPinResponse.fromJson(json);
}

/// @nodoc
mixin _$VerifiedPinResponse {
  @JsonKey(name: 'verified')
  bool? get verified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifiedPinResponseCopyWith<VerifiedPinResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifiedPinResponseCopyWith<$Res> {
  factory $VerifiedPinResponseCopyWith(
          VerifiedPinResponse value, $Res Function(VerifiedPinResponse) then) =
      _$VerifiedPinResponseCopyWithImpl<$Res, VerifiedPinResponse>;
  @useResult
  $Res call({@JsonKey(name: 'verified') bool? verified});
}

/// @nodoc
class _$VerifiedPinResponseCopyWithImpl<$Res, $Val extends VerifiedPinResponse>
    implements $VerifiedPinResponseCopyWith<$Res> {
  _$VerifiedPinResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verified = freezed,
  }) {
    return _then(_value.copyWith(
      verified: freezed == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifiedPinResponseImplCopyWith<$Res>
    implements $VerifiedPinResponseCopyWith<$Res> {
  factory _$$VerifiedPinResponseImplCopyWith(_$VerifiedPinResponseImpl value,
          $Res Function(_$VerifiedPinResponseImpl) then) =
      __$$VerifiedPinResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'verified') bool? verified});
}

/// @nodoc
class __$$VerifiedPinResponseImplCopyWithImpl<$Res>
    extends _$VerifiedPinResponseCopyWithImpl<$Res, _$VerifiedPinResponseImpl>
    implements _$$VerifiedPinResponseImplCopyWith<$Res> {
  __$$VerifiedPinResponseImplCopyWithImpl(_$VerifiedPinResponseImpl _value,
      $Res Function(_$VerifiedPinResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verified = freezed,
  }) {
    return _then(_$VerifiedPinResponseImpl(
      verified: freezed == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifiedPinResponseImpl implements _VerifiedPinResponse {
  const _$VerifiedPinResponseImpl({@JsonKey(name: 'verified') this.verified});

  factory _$VerifiedPinResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifiedPinResponseImplFromJson(json);

  @override
  @JsonKey(name: 'verified')
  final bool? verified;

  @override
  String toString() {
    return 'VerifiedPinResponse(verified: $verified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifiedPinResponseImpl &&
            (identical(other.verified, verified) ||
                other.verified == verified));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, verified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifiedPinResponseImplCopyWith<_$VerifiedPinResponseImpl> get copyWith =>
      __$$VerifiedPinResponseImplCopyWithImpl<_$VerifiedPinResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifiedPinResponseImplToJson(
      this,
    );
  }
}

abstract class _VerifiedPinResponse implements VerifiedPinResponse {
  const factory _VerifiedPinResponse(
          {@JsonKey(name: 'verified') final bool? verified}) =
      _$VerifiedPinResponseImpl;

  factory _VerifiedPinResponse.fromJson(Map<String, dynamic> json) =
      _$VerifiedPinResponseImpl.fromJson;

  @override
  @JsonKey(name: 'verified')
  bool? get verified;
  @override
  @JsonKey(ignore: true)
  _$$VerifiedPinResponseImplCopyWith<_$VerifiedPinResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RequestPinResponse _$RequestPinResponseFromJson(Map<String, dynamic> json) {
  return _RequestPinResponse.fromJson(json);
}

/// @nodoc
mixin _$RequestPinResponse {
  @JsonKey(name: 'data')
  dynamic get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestPinResponseCopyWith<RequestPinResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestPinResponseCopyWith<$Res> {
  factory $RequestPinResponseCopyWith(
          RequestPinResponse value, $Res Function(RequestPinResponse) then) =
      _$RequestPinResponseCopyWithImpl<$Res, RequestPinResponse>;
  @useResult
  $Res call({@JsonKey(name: 'data') dynamic data});
}

/// @nodoc
class _$RequestPinResponseCopyWithImpl<$Res, $Val extends RequestPinResponse>
    implements $RequestPinResponseCopyWith<$Res> {
  _$RequestPinResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestPinResponseImplCopyWith<$Res>
    implements $RequestPinResponseCopyWith<$Res> {
  factory _$$RequestPinResponseImplCopyWith(_$RequestPinResponseImpl value,
          $Res Function(_$RequestPinResponseImpl) then) =
      __$$RequestPinResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'data') dynamic data});
}

/// @nodoc
class __$$RequestPinResponseImplCopyWithImpl<$Res>
    extends _$RequestPinResponseCopyWithImpl<$Res, _$RequestPinResponseImpl>
    implements _$$RequestPinResponseImplCopyWith<$Res> {
  __$$RequestPinResponseImplCopyWithImpl(_$RequestPinResponseImpl _value,
      $Res Function(_$RequestPinResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$RequestPinResponseImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestPinResponseImpl implements _RequestPinResponse {
  const _$RequestPinResponseImpl({@JsonKey(name: 'data') this.data});

  factory _$RequestPinResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestPinResponseImplFromJson(json);

  @override
  @JsonKey(name: 'data')
  final dynamic data;

  @override
  String toString() {
    return 'RequestPinResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestPinResponseImpl &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestPinResponseImplCopyWith<_$RequestPinResponseImpl> get copyWith =>
      __$$RequestPinResponseImplCopyWithImpl<_$RequestPinResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestPinResponseImplToJson(
      this,
    );
  }
}

abstract class _RequestPinResponse implements RequestPinResponse {
  const factory _RequestPinResponse(
      {@JsonKey(name: 'data') final dynamic data}) = _$RequestPinResponseImpl;

  factory _RequestPinResponse.fromJson(Map<String, dynamic> json) =
      _$RequestPinResponseImpl.fromJson;

  @override
  @JsonKey(name: 'data')
  dynamic get data;
  @override
  @JsonKey(ignore: true)
  _$$RequestPinResponseImplCopyWith<_$RequestPinResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ValidateTokenResponse _$ValidateTokenResponseFromJson(
    Map<String, dynamic> json) {
  return _ValidateTokenResponse.fromJson(json);
}

/// @nodoc
mixin _$ValidateTokenResponse {
  @JsonKey(name: 'data')
  dynamic get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ValidateTokenResponseCopyWith<ValidateTokenResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidateTokenResponseCopyWith<$Res> {
  factory $ValidateTokenResponseCopyWith(ValidateTokenResponse value,
          $Res Function(ValidateTokenResponse) then) =
      _$ValidateTokenResponseCopyWithImpl<$Res, ValidateTokenResponse>;
  @useResult
  $Res call({@JsonKey(name: 'data') dynamic data});
}

/// @nodoc
class _$ValidateTokenResponseCopyWithImpl<$Res,
        $Val extends ValidateTokenResponse>
    implements $ValidateTokenResponseCopyWith<$Res> {
  _$ValidateTokenResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ValidateTokenResponseImplCopyWith<$Res>
    implements $ValidateTokenResponseCopyWith<$Res> {
  factory _$$ValidateTokenResponseImplCopyWith(
          _$ValidateTokenResponseImpl value,
          $Res Function(_$ValidateTokenResponseImpl) then) =
      __$$ValidateTokenResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'data') dynamic data});
}

/// @nodoc
class __$$ValidateTokenResponseImplCopyWithImpl<$Res>
    extends _$ValidateTokenResponseCopyWithImpl<$Res,
        _$ValidateTokenResponseImpl>
    implements _$$ValidateTokenResponseImplCopyWith<$Res> {
  __$$ValidateTokenResponseImplCopyWithImpl(_$ValidateTokenResponseImpl _value,
      $Res Function(_$ValidateTokenResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ValidateTokenResponseImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ValidateTokenResponseImpl implements _ValidateTokenResponse {
  const _$ValidateTokenResponseImpl({@JsonKey(name: 'data') this.data});

  factory _$ValidateTokenResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ValidateTokenResponseImplFromJson(json);

  @override
  @JsonKey(name: 'data')
  final dynamic data;

  @override
  String toString() {
    return 'ValidateTokenResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidateTokenResponseImpl &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidateTokenResponseImplCopyWith<_$ValidateTokenResponseImpl>
      get copyWith => __$$ValidateTokenResponseImplCopyWithImpl<
          _$ValidateTokenResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ValidateTokenResponseImplToJson(
      this,
    );
  }
}

abstract class _ValidateTokenResponse implements ValidateTokenResponse {
  const factory _ValidateTokenResponse(
          {@JsonKey(name: 'data') final dynamic data}) =
      _$ValidateTokenResponseImpl;

  factory _ValidateTokenResponse.fromJson(Map<String, dynamic> json) =
      _$ValidateTokenResponseImpl.fromJson;

  @override
  @JsonKey(name: 'data')
  dynamic get data;
  @override
  @JsonKey(ignore: true)
  _$$ValidateTokenResponseImplCopyWith<_$ValidateTokenResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ResetPinResponse _$ResetPinResponseFromJson(Map<String, dynamic> json) {
  return _ResetPinResponse.fromJson(json);
}

/// @nodoc
mixin _$ResetPinResponse {
  @JsonKey(name: 'data')
  dynamic get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResetPinResponseCopyWith<ResetPinResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPinResponseCopyWith<$Res> {
  factory $ResetPinResponseCopyWith(
          ResetPinResponse value, $Res Function(ResetPinResponse) then) =
      _$ResetPinResponseCopyWithImpl<$Res, ResetPinResponse>;
  @useResult
  $Res call({@JsonKey(name: 'data') dynamic data});
}

/// @nodoc
class _$ResetPinResponseCopyWithImpl<$Res, $Val extends ResetPinResponse>
    implements $ResetPinResponseCopyWith<$Res> {
  _$ResetPinResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResetPinResponseImplCopyWith<$Res>
    implements $ResetPinResponseCopyWith<$Res> {
  factory _$$ResetPinResponseImplCopyWith(_$ResetPinResponseImpl value,
          $Res Function(_$ResetPinResponseImpl) then) =
      __$$ResetPinResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'data') dynamic data});
}

/// @nodoc
class __$$ResetPinResponseImplCopyWithImpl<$Res>
    extends _$ResetPinResponseCopyWithImpl<$Res, _$ResetPinResponseImpl>
    implements _$$ResetPinResponseImplCopyWith<$Res> {
  __$$ResetPinResponseImplCopyWithImpl(_$ResetPinResponseImpl _value,
      $Res Function(_$ResetPinResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ResetPinResponseImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResetPinResponseImpl implements _ResetPinResponse {
  const _$ResetPinResponseImpl({@JsonKey(name: 'data') this.data});

  factory _$ResetPinResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResetPinResponseImplFromJson(json);

  @override
  @JsonKey(name: 'data')
  final dynamic data;

  @override
  String toString() {
    return 'ResetPinResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPinResponseImpl &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPinResponseImplCopyWith<_$ResetPinResponseImpl> get copyWith =>
      __$$ResetPinResponseImplCopyWithImpl<_$ResetPinResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResetPinResponseImplToJson(
      this,
    );
  }
}

abstract class _ResetPinResponse implements ResetPinResponse {
  const factory _ResetPinResponse({@JsonKey(name: 'data') final dynamic data}) =
      _$ResetPinResponseImpl;

  factory _ResetPinResponse.fromJson(Map<String, dynamic> json) =
      _$ResetPinResponseImpl.fromJson;

  @override
  @JsonKey(name: 'data')
  dynamic get data;
  @override
  @JsonKey(ignore: true)
  _$$ResetPinResponseImplCopyWith<_$ResetPinResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
