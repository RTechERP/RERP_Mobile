// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_customer_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SummaryCustomerStateCWProxy {
  SummaryCustomerState status(BaseStateStatus status);

  SummaryCustomerState message(String? message);

  SummaryCustomerState customers(List<SummaryCustomerItem> customers);

  SummaryCustomerState keyword(String keyword);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SummaryCustomerState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SummaryCustomerState(...).copyWith(id: 12, name: "My name")
  /// ````
  SummaryCustomerState call({
    BaseStateStatus? status,
    String? message,
    List<SummaryCustomerItem>? customers,
    String? keyword,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSummaryCustomerState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSummaryCustomerState.copyWith.fieldName(...)`
class _$SummaryCustomerStateCWProxyImpl
    implements _$SummaryCustomerStateCWProxy {
  const _$SummaryCustomerStateCWProxyImpl(this._value);

  final SummaryCustomerState _value;

  @override
  SummaryCustomerState status(BaseStateStatus status) => this(status: status);

  @override
  SummaryCustomerState message(String? message) => this(message: message);

  @override
  SummaryCustomerState customers(List<SummaryCustomerItem> customers) =>
      this(customers: customers);

  @override
  SummaryCustomerState keyword(String keyword) => this(keyword: keyword);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SummaryCustomerState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SummaryCustomerState(...).copyWith(id: 12, name: "My name")
  /// ````
  SummaryCustomerState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? customers = const $CopyWithPlaceholder(),
    Object? keyword = const $CopyWithPlaceholder(),
  }) {
    return SummaryCustomerState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      customers: customers == const $CopyWithPlaceholder() || customers == null
          ? _value.customers
          // ignore: cast_nullable_to_non_nullable
          : customers as List<SummaryCustomerItem>,
      keyword: keyword == const $CopyWithPlaceholder() || keyword == null
          ? _value.keyword
          // ignore: cast_nullable_to_non_nullable
          : keyword as String,
    );
  }
}

extension $SummaryCustomerStateCopyWith on SummaryCustomerState {
  /// Returns a callable class that can be used as follows: `instanceOfSummaryCustomerState.copyWith(...)` or like so:`instanceOfSummaryCustomerState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SummaryCustomerStateCWProxy get copyWith =>
      _$SummaryCustomerStateCWProxyImpl(this);
}
