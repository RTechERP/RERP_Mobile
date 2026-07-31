// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_gdn_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SaleGdnStateCWProxy {
  SaleGdnState status(BaseStateStatus status);

  SaleGdnState message(String? message);

  SaleGdnState gdns(List<BillExporResponse> gdns);

  SaleGdnState searchKeyword(String searchKeyword);

  SaleGdnState isSearching(bool isSearching);

  SaleGdnState dateStart(DateTime? dateStart);

  SaleGdnState dateEnd(DateTime? dateEnd);

  SaleGdnState warehouseCode(String warehouseCode);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SaleGdnState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SaleGdnState(...).copyWith(id: 12, name: "My name")
  /// ````
  SaleGdnState call({
    BaseStateStatus? status,
    String? message,
    List<BillExporResponse>? gdns,
    String? searchKeyword,
    bool? isSearching,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? warehouseCode,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSaleGdnState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSaleGdnState.copyWith.fieldName(...)`
class _$SaleGdnStateCWProxyImpl implements _$SaleGdnStateCWProxy {
  const _$SaleGdnStateCWProxyImpl(this._value);

  final SaleGdnState _value;

  @override
  SaleGdnState status(BaseStateStatus status) => this(status: status);

  @override
  SaleGdnState message(String? message) => this(message: message);

  @override
  SaleGdnState gdns(List<BillExporResponse> gdns) => this(gdns: gdns);

  @override
  SaleGdnState searchKeyword(String searchKeyword) =>
      this(searchKeyword: searchKeyword);

  @override
  SaleGdnState isSearching(bool isSearching) => this(isSearching: isSearching);

  @override
  SaleGdnState dateStart(DateTime? dateStart) => this(dateStart: dateStart);

  @override
  SaleGdnState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  SaleGdnState warehouseCode(String warehouseCode) =>
      this(warehouseCode: warehouseCode);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SaleGdnState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SaleGdnState(...).copyWith(id: 12, name: "My name")
  /// ````
  SaleGdnState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? gdns = const $CopyWithPlaceholder(),
    Object? searchKeyword = const $CopyWithPlaceholder(),
    Object? isSearching = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? warehouseCode = const $CopyWithPlaceholder(),
  }) {
    return SaleGdnState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      gdns: gdns == const $CopyWithPlaceholder() || gdns == null
          ? _value.gdns
          // ignore: cast_nullable_to_non_nullable
          : gdns as List<BillExporResponse>,
      searchKeyword:
          searchKeyword == const $CopyWithPlaceholder() || searchKeyword == null
              ? _value.searchKeyword
              // ignore: cast_nullable_to_non_nullable
              : searchKeyword as String,
      isSearching:
          isSearching == const $CopyWithPlaceholder() || isSearching == null
              ? _value.isSearching
              // ignore: cast_nullable_to_non_nullable
              : isSearching as bool,
      dateStart: dateStart == const $CopyWithPlaceholder()
          ? _value.dateStart
          // ignore: cast_nullable_to_non_nullable
          : dateStart as DateTime?,
      dateEnd: dateEnd == const $CopyWithPlaceholder()
          ? _value.dateEnd
          // ignore: cast_nullable_to_non_nullable
          : dateEnd as DateTime?,
      warehouseCode:
          warehouseCode == const $CopyWithPlaceholder() || warehouseCode == null
              ? _value.warehouseCode
              // ignore: cast_nullable_to_non_nullable
              : warehouseCode as String,
    );
  }
}

extension $SaleGdnStateCopyWith on SaleGdnState {
  /// Returns a callable class that can be used as follows: `instanceOfSaleGdnState.copyWith(...)` or like so:`instanceOfSaleGdnState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SaleGdnStateCWProxy get copyWith => _$SaleGdnStateCWProxyImpl(this);
}
