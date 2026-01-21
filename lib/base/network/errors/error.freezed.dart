// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BaseError {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BaseError()';
}


}

/// @nodoc
class $BaseErrorCopyWith<$Res>  {
$BaseErrorCopyWith(BaseError _, $Res Function(BaseError) __);
}


/// Adds pattern-matching-related methods to [BaseError].
extension BaseErrorPatterns on BaseError {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HttpInternalServerError value)?  httpInternalServerError,TResult Function( HttpUnAuthorizedError value)?  httpUnAuthorizedError,TResult Function( HttpUnknownError value)?  httpUnknownError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HttpInternalServerError() when httpInternalServerError != null:
return httpInternalServerError(_that);case HttpUnAuthorizedError() when httpUnAuthorizedError != null:
return httpUnAuthorizedError(_that);case HttpUnknownError() when httpUnknownError != null:
return httpUnknownError(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HttpInternalServerError value)  httpInternalServerError,required TResult Function( HttpUnAuthorizedError value)  httpUnAuthorizedError,required TResult Function( HttpUnknownError value)  httpUnknownError,}){
final _that = this;
switch (_that) {
case HttpInternalServerError():
return httpInternalServerError(_that);case HttpUnAuthorizedError():
return httpUnAuthorizedError(_that);case HttpUnknownError():
return httpUnknownError(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HttpInternalServerError value)?  httpInternalServerError,TResult? Function( HttpUnAuthorizedError value)?  httpUnAuthorizedError,TResult? Function( HttpUnknownError value)?  httpUnknownError,}){
final _that = this;
switch (_that) {
case HttpInternalServerError() when httpInternalServerError != null:
return httpInternalServerError(_that);case HttpUnAuthorizedError() when httpUnAuthorizedError != null:
return httpUnAuthorizedError(_that);case HttpUnknownError() when httpUnknownError != null:
return httpUnknownError(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String errorBody)?  httpInternalServerError,TResult Function()?  httpUnAuthorizedError,TResult Function( String message)?  httpUnknownError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HttpInternalServerError() when httpInternalServerError != null:
return httpInternalServerError(_that.errorBody);case HttpUnAuthorizedError() when httpUnAuthorizedError != null:
return httpUnAuthorizedError();case HttpUnknownError() when httpUnknownError != null:
return httpUnknownError(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String errorBody)  httpInternalServerError,required TResult Function()  httpUnAuthorizedError,required TResult Function( String message)  httpUnknownError,}) {final _that = this;
switch (_that) {
case HttpInternalServerError():
return httpInternalServerError(_that.errorBody);case HttpUnAuthorizedError():
return httpUnAuthorizedError();case HttpUnknownError():
return httpUnknownError(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String errorBody)?  httpInternalServerError,TResult? Function()?  httpUnAuthorizedError,TResult? Function( String message)?  httpUnknownError,}) {final _that = this;
switch (_that) {
case HttpInternalServerError() when httpInternalServerError != null:
return httpInternalServerError(_that.errorBody);case HttpUnAuthorizedError() when httpUnAuthorizedError != null:
return httpUnAuthorizedError();case HttpUnknownError() when httpUnknownError != null:
return httpUnknownError(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class HttpInternalServerError implements BaseError {
  const HttpInternalServerError(this.errorBody);
  

 final  String errorBody;

/// Create a copy of BaseError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HttpInternalServerErrorCopyWith<HttpInternalServerError> get copyWith => _$HttpInternalServerErrorCopyWithImpl<HttpInternalServerError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HttpInternalServerError&&(identical(other.errorBody, errorBody) || other.errorBody == errorBody));
}


@override
int get hashCode => Object.hash(runtimeType,errorBody);

@override
String toString() {
  return 'BaseError.httpInternalServerError(errorBody: $errorBody)';
}


}

/// @nodoc
abstract mixin class $HttpInternalServerErrorCopyWith<$Res> implements $BaseErrorCopyWith<$Res> {
  factory $HttpInternalServerErrorCopyWith(HttpInternalServerError value, $Res Function(HttpInternalServerError) _then) = _$HttpInternalServerErrorCopyWithImpl;
@useResult
$Res call({
 String errorBody
});




}
/// @nodoc
class _$HttpInternalServerErrorCopyWithImpl<$Res>
    implements $HttpInternalServerErrorCopyWith<$Res> {
  _$HttpInternalServerErrorCopyWithImpl(this._self, this._then);

  final HttpInternalServerError _self;
  final $Res Function(HttpInternalServerError) _then;

/// Create a copy of BaseError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorBody = null,}) {
  return _then(HttpInternalServerError(
null == errorBody ? _self.errorBody : errorBody // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class HttpUnAuthorizedError implements BaseError {
  const HttpUnAuthorizedError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HttpUnAuthorizedError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BaseError.httpUnAuthorizedError()';
}


}




/// @nodoc


class HttpUnknownError implements BaseError {
  const HttpUnknownError(this.message);
  

 final  String message;

/// Create a copy of BaseError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HttpUnknownErrorCopyWith<HttpUnknownError> get copyWith => _$HttpUnknownErrorCopyWithImpl<HttpUnknownError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HttpUnknownError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'BaseError.httpUnknownError(message: $message)';
}


}

/// @nodoc
abstract mixin class $HttpUnknownErrorCopyWith<$Res> implements $BaseErrorCopyWith<$Res> {
  factory $HttpUnknownErrorCopyWith(HttpUnknownError value, $Res Function(HttpUnknownError) _then) = _$HttpUnknownErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$HttpUnknownErrorCopyWithImpl<$Res>
    implements $HttpUnknownErrorCopyWith<$Res> {
  _$HttpUnknownErrorCopyWithImpl(this._self, this._then);

  final HttpUnknownError _self;
  final $Res Function(HttpUnknownError) _then;

/// Create a copy of BaseError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(HttpUnknownError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
