// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsfeed_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NewsfeedStateCWProxy {
  NewsfeedState status(BaseStateStatus status);

  NewsfeedState message(String? message);

  NewsfeedState newsfeeds(List<NewsletterItem> newsfeeds);

  NewsfeedState calendar(CalendarItem? calendar);

  NewsfeedState selectedMonth(int selectedMonth);

  NewsfeedState selectedYear(int selectedYear);

  NewsfeedState calendarStatus(BaseStateStatus calendarStatus);

  NewsfeedState calendarMessage(String? calendarMessage);

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
    CalendarItem? calendar,
    int? selectedMonth,
    int? selectedYear,
    BaseStateStatus? calendarStatus,
    String? calendarMessage,
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
  NewsfeedState calendar(CalendarItem? calendar) => this(calendar: calendar);

  @override
  NewsfeedState selectedMonth(int selectedMonth) =>
      this(selectedMonth: selectedMonth);

  @override
  NewsfeedState selectedYear(int selectedYear) =>
      this(selectedYear: selectedYear);

  @override
  NewsfeedState calendarStatus(BaseStateStatus calendarStatus) =>
      this(calendarStatus: calendarStatus);

  @override
  NewsfeedState calendarMessage(String? calendarMessage) =>
      this(calendarMessage: calendarMessage);

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
    Object? calendar = const $CopyWithPlaceholder(),
    Object? selectedMonth = const $CopyWithPlaceholder(),
    Object? selectedYear = const $CopyWithPlaceholder(),
    Object? calendarStatus = const $CopyWithPlaceholder(),
    Object? calendarMessage = const $CopyWithPlaceholder(),
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
      calendar: calendar == const $CopyWithPlaceholder()
          ? _value.calendar
          // ignore: cast_nullable_to_non_nullable
          : calendar as CalendarItem?,
      selectedMonth:
          selectedMonth == const $CopyWithPlaceholder() || selectedMonth == null
              ? _value.selectedMonth
              // ignore: cast_nullable_to_non_nullable
              : selectedMonth as int,
      selectedYear:
          selectedYear == const $CopyWithPlaceholder() || selectedYear == null
              ? _value.selectedYear
              // ignore: cast_nullable_to_non_nullable
              : selectedYear as int,
      calendarStatus: calendarStatus == const $CopyWithPlaceholder() ||
              calendarStatus == null
          ? _value.calendarStatus
          // ignore: cast_nullable_to_non_nullable
          : calendarStatus as BaseStateStatus,
      calendarMessage: calendarMessage == const $CopyWithPlaceholder()
          ? _value.calendarMessage
          // ignore: cast_nullable_to_non_nullable
          : calendarMessage as String?,
    );
  }
}

extension $NewsfeedStateCopyWith on NewsfeedState {
  /// Returns a callable class that can be used as follows: `instanceOfNewsfeedState.copyWith(...)` or like so:`instanceOfNewsfeedState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$NewsfeedStateCWProxy get copyWith => _$NewsfeedStateCWProxyImpl(this);
}
