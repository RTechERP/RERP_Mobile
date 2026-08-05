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

  SaleGdnState warehouseTypes(List<TypeWarehouseResponse> warehouseTypes);

  SaleGdnState selectedWarehouseTypeIds(List<int> selectedWarehouseTypeIds);

  SaleGdnState selectedStatus(int selectedStatus);

  SaleGdnState detail(GdnDetailState? detail);

  SaleGdnState openedDetailBill(BillExporResponse? openedDetailBill);

  SaleGdnState scanResultMessage(String? scanResultMessage);

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
    List<TypeWarehouseResponse>? warehouseTypes,
    List<int>? selectedWarehouseTypeIds,
    int? selectedStatus,
    GdnDetailState? detail,
    BillExporResponse? openedDetailBill,
    String? scanResultMessage,
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
  SaleGdnState warehouseTypes(List<TypeWarehouseResponse> warehouseTypes) =>
      this(warehouseTypes: warehouseTypes);

  @override
  SaleGdnState selectedWarehouseTypeIds(List<int> selectedWarehouseTypeIds) =>
      this(selectedWarehouseTypeIds: selectedWarehouseTypeIds);

  @override
  SaleGdnState selectedStatus(int selectedStatus) =>
      this(selectedStatus: selectedStatus);

  @override
  SaleGdnState detail(GdnDetailState? detail) => this(detail: detail);

  @override
  SaleGdnState openedDetailBill(BillExporResponse? openedDetailBill) =>
      this(openedDetailBill: openedDetailBill);

  @override
  SaleGdnState scanResultMessage(String? scanResultMessage) =>
      this(scanResultMessage: scanResultMessage);

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
    Object? warehouseTypes = const $CopyWithPlaceholder(),
    Object? selectedWarehouseTypeIds = const $CopyWithPlaceholder(),
    Object? selectedStatus = const $CopyWithPlaceholder(),
    Object? detail = const $CopyWithPlaceholder(),
    Object? openedDetailBill = const $CopyWithPlaceholder(),
    Object? scanResultMessage = const $CopyWithPlaceholder(),
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
      warehouseTypes: warehouseTypes == const $CopyWithPlaceholder() ||
              warehouseTypes == null
          ? _value.warehouseTypes
          // ignore: cast_nullable_to_non_nullable
          : warehouseTypes as List<TypeWarehouseResponse>,
      selectedWarehouseTypeIds:
          selectedWarehouseTypeIds == const $CopyWithPlaceholder() ||
                  selectedWarehouseTypeIds == null
              ? _value.selectedWarehouseTypeIds
              // ignore: cast_nullable_to_non_nullable
              : selectedWarehouseTypeIds as List<int>,
      selectedStatus: selectedStatus == const $CopyWithPlaceholder() ||
              selectedStatus == null
          ? _value.selectedStatus
          // ignore: cast_nullable_to_non_nullable
          : selectedStatus as int,
      detail: detail == const $CopyWithPlaceholder()
          ? _value.detail
          // ignore: cast_nullable_to_non_nullable
          : detail as GdnDetailState?,
      openedDetailBill: openedDetailBill == const $CopyWithPlaceholder()
          ? _value.openedDetailBill
          // ignore: cast_nullable_to_non_nullable
          : openedDetailBill as BillExporResponse?,
      scanResultMessage: scanResultMessage == const $CopyWithPlaceholder()
          ? _value.scanResultMessage
          // ignore: cast_nullable_to_non_nullable
          : scanResultMessage as String?,
    );
  }
}

extension $SaleGdnStateCopyWith on SaleGdnState {
  /// Returns a callable class that can be used as follows: `instanceOfSaleGdnState.copyWith(...)` or like so:`instanceOfSaleGdnState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SaleGdnStateCWProxy get copyWith => _$SaleGdnStateCWProxyImpl(this);
}

abstract class _$GdnDetailStateCWProxy {
  GdnDetailState status(BaseStateStatus status);

  GdnDetailState message(String? message);

  GdnDetailState billExportId(int billExportId);

  GdnDetailState bill(BillExporResponse? bill);

  GdnDetailState details(List<ViewGDNDetailResponse> details);

  GdnDetailState uploadedImages(List<UploadFileResponse> uploadedImages);

  GdnDetailState localImagePathsByStt(
      Map<int, List<String>> localImagePathsByStt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GdnDetailState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GdnDetailState(...).copyWith(id: 12, name: "My name")
  /// ````
  GdnDetailState call({
    BaseStateStatus? status,
    String? message,
    int? billExportId,
    BillExporResponse? bill,
    List<ViewGDNDetailResponse>? details,
    List<UploadFileResponse>? uploadedImages,
    Map<int, List<String>>? localImagePathsByStt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGdnDetailState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGdnDetailState.copyWith.fieldName(...)`
class _$GdnDetailStateCWProxyImpl implements _$GdnDetailStateCWProxy {
  const _$GdnDetailStateCWProxyImpl(this._value);

  final GdnDetailState _value;

  @override
  GdnDetailState status(BaseStateStatus status) => this(status: status);

  @override
  GdnDetailState message(String? message) => this(message: message);

  @override
  GdnDetailState billExportId(int billExportId) =>
      this(billExportId: billExportId);

  @override
  GdnDetailState bill(BillExporResponse? bill) => this(bill: bill);

  @override
  GdnDetailState details(List<ViewGDNDetailResponse> details) =>
      this(details: details);

  @override
  GdnDetailState uploadedImages(List<UploadFileResponse> uploadedImages) =>
      this(uploadedImages: uploadedImages);

  @override
  GdnDetailState localImagePathsByStt(
          Map<int, List<String>> localImagePathsByStt) =>
      this(localImagePathsByStt: localImagePathsByStt);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GdnDetailState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GdnDetailState(...).copyWith(id: 12, name: "My name")
  /// ````
  GdnDetailState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? billExportId = const $CopyWithPlaceholder(),
    Object? bill = const $CopyWithPlaceholder(),
    Object? details = const $CopyWithPlaceholder(),
    Object? uploadedImages = const $CopyWithPlaceholder(),
    Object? localImagePathsByStt = const $CopyWithPlaceholder(),
  }) {
    return GdnDetailState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      billExportId:
          billExportId == const $CopyWithPlaceholder() || billExportId == null
              ? _value.billExportId
              // ignore: cast_nullable_to_non_nullable
              : billExportId as int,
      bill: bill == const $CopyWithPlaceholder()
          ? _value.bill
          // ignore: cast_nullable_to_non_nullable
          : bill as BillExporResponse?,
      details: details == const $CopyWithPlaceholder() || details == null
          ? _value.details
          // ignore: cast_nullable_to_non_nullable
          : details as List<ViewGDNDetailResponse>,
      uploadedImages: uploadedImages == const $CopyWithPlaceholder() ||
              uploadedImages == null
          ? _value.uploadedImages
          // ignore: cast_nullable_to_non_nullable
          : uploadedImages as List<UploadFileResponse>,
      localImagePathsByStt:
          localImagePathsByStt == const $CopyWithPlaceholder() ||
                  localImagePathsByStt == null
              ? _value.localImagePathsByStt
              // ignore: cast_nullable_to_non_nullable
              : localImagePathsByStt as Map<int, List<String>>,
    );
  }
}

extension $GdnDetailStateCopyWith on GdnDetailState {
  /// Returns a callable class that can be used as follows: `instanceOfGdnDetailState.copyWith(...)` or like so:`instanceOfGdnDetailState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GdnDetailStateCWProxy get copyWith => _$GdnDetailStateCWProxyImpl(this);
}
