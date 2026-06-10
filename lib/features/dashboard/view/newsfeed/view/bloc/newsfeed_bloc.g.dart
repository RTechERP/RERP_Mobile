// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsfeed_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NewsfeedStateCWProxy {
  NewsfeedState status(BaseStateStatus status);

  NewsfeedState message(String? message);

  NewsfeedState newsfeeds(List<NewsletterItem> newsfeeds);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NewsfeedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NewsfeedState(...).copyWith(id: 12, name: "My name")
  /// ````
  NewsfeedState call({
    BaseStateStatus? status,
    String? message,
    List<NewsletterItem>? newsfeeds,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfNewsfeedState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfNewsfeedState.copyWith.fieldName(...)`
class _$NewsfeedStateCWProxyImpl implements _$NewsfeedStateCWProxy {
  const _$NewsfeedStateCWProxyImpl(this._value);

  final NewsfeedState _value;

  @override
  NewsfeedState status(BaseStateStatus status) => this(status: status);

  @override
  NewsfeedState message(String? message) => this(message: message);

  @override
  NewsfeedState newsfeeds(List<NewsletterItem> newsfeeds) =>
      this(newsfeeds: newsfeeds);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NewsfeedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NewsfeedState(...).copyWith(id: 12, name: "My name")
  /// ````
  NewsfeedState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? newsfeeds = const $CopyWithPlaceholder(),
  }) {
    return NewsfeedState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      newsfeeds: newsfeeds == const $CopyWithPlaceholder() || newsfeeds == null
          ? _value.newsfeeds
          // ignore: cast_nullable_to_non_nullable
          : newsfeeds as List<NewsletterItem>,
    );
  }
}

extension $NewsfeedStateCopyWith on NewsfeedState {
  /// Returns a callable class that can be used as follows: `instanceOfNewsfeedState.copyWith(...)` or like so:`instanceOfNewsfeedState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$NewsfeedStateCWProxy get copyWith => _$NewsfeedStateCWProxyImpl(this);
}
