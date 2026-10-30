// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_import_export_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HistoryImportExportStateCWProxy {
  HistoryImportExportState status(BaseStateStatus status);

  HistoryImportExportState message(String? message);

  HistoryImportExportState items(List<HistoryImportExportResponse> items);

  HistoryImportExportState searchKeyword(String searchKeyword);

  HistoryImportExportState typeFilter(HistoryTypeFilter typeFilter);

  HistoryImportExportState dateStart(DateTime? dateStart);

  HistoryImportExportState dateEnd(DateTime? dateEnd);

  HistoryImportExportState warehouseCode(String warehouseCode);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HistoryImportExportState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HistoryImportExportState(...).copyWith(id: 12, name: "My name")
  /// ````
  HistoryImportExportState call({
    BaseStateStatus? status,
    String? message,
    List<HistoryImportExportResponse>? items,
    String? searchKeyword,
    HistoryTypeFilter? typeFilter,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? warehouseCode,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHistoryImportExportState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHistoryImportExportState.copyWith.fieldName(...)`
class _$HistoryImportExportStateCWProxyImpl
    implements _$HistoryImportExportStateCWProxy {
  const _$HistoryImportExportStateCWProxyImpl(this._value);

  final HistoryImportExportState _value;

  @override
  HistoryImportExportState status(BaseStateStatus status) =>
      this(status: status);

  @override
  HistoryImportExportState message(String? message) => this(message: message);

  @override
  HistoryImportExportState items(List<HistoryImportExportResponse> items) =>
      this(items: items);

  @override
  HistoryImportExportState searchKeyword(String searchKeyword) =>
      this(searchKeyword: searchKeyword);

  @override
  HistoryImportExportState typeFilter(HistoryTypeFilter typeFilter) =>
      this(typeFilter: typeFilter);

  @override
  HistoryImportExportState dateStart(DateTime? dateStart) =>
      this(dateStart: dateStart);

  @override
  HistoryImportExportState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  HistoryImportExportState warehouseCode(String warehouseCode) =>
      this(warehouseCode: warehouseCode);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HistoryImportExportState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HistoryImportExportState(...).copyWith(id: 12, name: "My name")
  /// ````
  HistoryImportExportState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? items = const $CopyWithPlaceholder(),
    Object? searchKeyword = const $CopyWithPlaceholder(),
    Object? typeFilter = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? warehouseCode = const $CopyWithPlaceholder(),
  }) {
    return HistoryImportExportState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      items: items == const $CopyWithPlaceholder() || items == null
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<HistoryImportExportResponse>,
      searchKeyword:
          searchKeyword == const $CopyWithPlaceholder() || searchKeyword == null
              ? _value.searchKeyword
              // ignore: cast_nullable_to_non_nullable
              : searchKeyword as String,
      typeFilter:
          typeFilter == const $CopyWithPlaceholder() || typeFilter == null
              ? _value.typeFilter
              // ignore: cast_nullable_to_non_nullable
              : typeFilter as HistoryTypeFilter,
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

extension $HistoryImportExportStateCopyWith on HistoryImportExportState {
  /// Returns a callable class that can be used as follows: `instanceOfHistoryImportExportState.copyWith(...)` or like so:`instanceOfHistoryImportExportState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HistoryImportExportStateCWProxy get copyWith =>
      _$HistoryImportExportStateCWProxyImpl(this);
}
