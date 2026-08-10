// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_gdn_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SaleGdnEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaleGdnEventCopyWith<$Res> {
  factory $SaleGdnEventCopyWith(
          SaleGdnEvent value, $Res Function(SaleGdnEvent) then) =
      _$SaleGdnEventCopyWithImpl<$Res, SaleGdnEvent>;
}

/// @nodoc
class _$SaleGdnEventCopyWithImpl<$Res, $Val extends SaleGdnEvent>
    implements $SaleGdnEventCopyWith<$Res> {
  _$SaleGdnEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitImplCopyWith<$Res> {
  factory _$$InitImplCopyWith(
          _$InitImpl value, $Res Function(_$InitImpl) then) =
      __$$InitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl implements _Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'SaleGdnEvent.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements SaleGdnEvent {
  const factory _Init() = _$InitImpl;
}

/// @nodoc
abstract class _$$FetchGdnsImplCopyWith<$Res> {
  factory _$$FetchGdnsImplCopyWith(
          _$FetchGdnsImpl value, $Res Function(_$FetchGdnsImpl) then) =
      __$$FetchGdnsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchGdnsImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$FetchGdnsImpl>
    implements _$$FetchGdnsImplCopyWith<$Res> {
  __$$FetchGdnsImplCopyWithImpl(
      _$FetchGdnsImpl _value, $Res Function(_$FetchGdnsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchGdnsImpl implements _FetchGdns {
  const _$FetchGdnsImpl();

  @override
  String toString() {
    return 'SaleGdnEvent.fetchGdns()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchGdnsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return fetchGdns();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return fetchGdns?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (fetchGdns != null) {
      return fetchGdns();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return fetchGdns(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return fetchGdns?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (fetchGdns != null) {
      return fetchGdns(this);
    }
    return orElse();
  }
}

abstract class _FetchGdns implements SaleGdnEvent {
  const factory _FetchGdns() = _$FetchGdnsImpl;
}

/// @nodoc
abstract class _$$SearchByKeywordImplCopyWith<$Res> {
  factory _$$SearchByKeywordImplCopyWith(_$SearchByKeywordImpl value,
          $Res Function(_$SearchByKeywordImpl) then) =
      __$$SearchByKeywordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String keyword});
}

/// @nodoc
class __$$SearchByKeywordImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$SearchByKeywordImpl>
    implements _$$SearchByKeywordImplCopyWith<$Res> {
  __$$SearchByKeywordImplCopyWithImpl(
      _$SearchByKeywordImpl _value, $Res Function(_$SearchByKeywordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
  }) {
    return _then(_$SearchByKeywordImpl(
      null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchByKeywordImpl implements _SearchByKeyword {
  const _$SearchByKeywordImpl(this.keyword);

  @override
  final String keyword;

  @override
  String toString() {
    return 'SaleGdnEvent.searchByKeyword(keyword: $keyword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchByKeywordImpl &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keyword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchByKeywordImplCopyWith<_$SearchByKeywordImpl> get copyWith =>
      __$$SearchByKeywordImplCopyWithImpl<_$SearchByKeywordImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return searchByKeyword(keyword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return searchByKeyword?.call(keyword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (searchByKeyword != null) {
      return searchByKeyword(keyword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return searchByKeyword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return searchByKeyword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (searchByKeyword != null) {
      return searchByKeyword(this);
    }
    return orElse();
  }
}

abstract class _SearchByKeyword implements SaleGdnEvent {
  const factory _SearchByKeyword(final String keyword) = _$SearchByKeywordImpl;

  String get keyword;
  @JsonKey(ignore: true)
  _$$SearchByKeywordImplCopyWith<_$SearchByKeywordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchByVoucherNumberImplCopyWith<$Res> {
  factory _$$SearchByVoucherNumberImplCopyWith(
          _$SearchByVoucherNumberImpl value,
          $Res Function(_$SearchByVoucherNumberImpl) then) =
      __$$SearchByVoucherNumberImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String voucherNumber});
}

/// @nodoc
class __$$SearchByVoucherNumberImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$SearchByVoucherNumberImpl>
    implements _$$SearchByVoucherNumberImplCopyWith<$Res> {
  __$$SearchByVoucherNumberImplCopyWithImpl(_$SearchByVoucherNumberImpl _value,
      $Res Function(_$SearchByVoucherNumberImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? voucherNumber = null,
  }) {
    return _then(_$SearchByVoucherNumberImpl(
      null == voucherNumber
          ? _value.voucherNumber
          : voucherNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchByVoucherNumberImpl implements _SearchByVoucherNumber {
  const _$SearchByVoucherNumberImpl(this.voucherNumber);

  @override
  final String voucherNumber;

  @override
  String toString() {
    return 'SaleGdnEvent.searchByVoucherNumber(voucherNumber: $voucherNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchByVoucherNumberImpl &&
            (identical(other.voucherNumber, voucherNumber) ||
                other.voucherNumber == voucherNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, voucherNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchByVoucherNumberImplCopyWith<_$SearchByVoucherNumberImpl>
      get copyWith => __$$SearchByVoucherNumberImplCopyWithImpl<
          _$SearchByVoucherNumberImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return searchByVoucherNumber(voucherNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return searchByVoucherNumber?.call(voucherNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (searchByVoucherNumber != null) {
      return searchByVoucherNumber(voucherNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return searchByVoucherNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return searchByVoucherNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (searchByVoucherNumber != null) {
      return searchByVoucherNumber(this);
    }
    return orElse();
  }
}

abstract class _SearchByVoucherNumber implements SaleGdnEvent {
  const factory _SearchByVoucherNumber(final String voucherNumber) =
      _$SearchByVoucherNumberImpl;

  String get voucherNumber;
  @JsonKey(ignore: true)
  _$$SearchByVoucherNumberImplCopyWith<_$SearchByVoucherNumberImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearSearchImplCopyWith<$Res> {
  factory _$$ClearSearchImplCopyWith(
          _$ClearSearchImpl value, $Res Function(_$ClearSearchImpl) then) =
      __$$ClearSearchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSearchImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$ClearSearchImpl>
    implements _$$ClearSearchImplCopyWith<$Res> {
  __$$ClearSearchImplCopyWithImpl(
      _$ClearSearchImpl _value, $Res Function(_$ClearSearchImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearSearchImpl implements _ClearSearch {
  const _$ClearSearchImpl();

  @override
  String toString() {
    return 'SaleGdnEvent.clearSearch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearSearchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return clearSearch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return clearSearch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (clearSearch != null) {
      return clearSearch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return clearSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return clearSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (clearSearch != null) {
      return clearSearch(this);
    }
    return orElse();
  }
}

abstract class _ClearSearch implements SaleGdnEvent {
  const factory _ClearSearch() = _$ClearSearchImpl;
}

/// @nodoc
abstract class _$$ScanQrToDetailImplCopyWith<$Res> {
  factory _$$ScanQrToDetailImplCopyWith(_$ScanQrToDetailImpl value,
          $Res Function(_$ScanQrToDetailImpl) then) =
      __$$ScanQrToDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String code});
}

/// @nodoc
class __$$ScanQrToDetailImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$ScanQrToDetailImpl>
    implements _$$ScanQrToDetailImplCopyWith<$Res> {
  __$$ScanQrToDetailImplCopyWithImpl(
      _$ScanQrToDetailImpl _value, $Res Function(_$ScanQrToDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_$ScanQrToDetailImpl(
      null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ScanQrToDetailImpl implements _ScanQrToDetail {
  const _$ScanQrToDetailImpl(this.code);

  @override
  final String code;

  @override
  String toString() {
    return 'SaleGdnEvent.scanQrToDetail(code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanQrToDetailImpl &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScanQrToDetailImplCopyWith<_$ScanQrToDetailImpl> get copyWith =>
      __$$ScanQrToDetailImplCopyWithImpl<_$ScanQrToDetailImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return scanQrToDetail(code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return scanQrToDetail?.call(code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (scanQrToDetail != null) {
      return scanQrToDetail(code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return scanQrToDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return scanQrToDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (scanQrToDetail != null) {
      return scanQrToDetail(this);
    }
    return orElse();
  }
}

abstract class _ScanQrToDetail implements SaleGdnEvent {
  const factory _ScanQrToDetail(final String code) = _$ScanQrToDetailImpl;

  String get code;
  @JsonKey(ignore: true)
  _$$ScanQrToDetailImplCopyWith<_$ScanQrToDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearOpenedDetailImplCopyWith<$Res> {
  factory _$$ClearOpenedDetailImplCopyWith(_$ClearOpenedDetailImpl value,
          $Res Function(_$ClearOpenedDetailImpl) then) =
      __$$ClearOpenedDetailImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearOpenedDetailImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$ClearOpenedDetailImpl>
    implements _$$ClearOpenedDetailImplCopyWith<$Res> {
  __$$ClearOpenedDetailImplCopyWithImpl(_$ClearOpenedDetailImpl _value,
      $Res Function(_$ClearOpenedDetailImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearOpenedDetailImpl implements _ClearOpenedDetail {
  const _$ClearOpenedDetailImpl();

  @override
  String toString() {
    return 'SaleGdnEvent.clearOpenedDetail()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearOpenedDetailImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return clearOpenedDetail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return clearOpenedDetail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (clearOpenedDetail != null) {
      return clearOpenedDetail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return clearOpenedDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return clearOpenedDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (clearOpenedDetail != null) {
      return clearOpenedDetail(this);
    }
    return orElse();
  }
}

abstract class _ClearOpenedDetail implements SaleGdnEvent {
  const factory _ClearOpenedDetail() = _$ClearOpenedDetailImpl;
}

/// @nodoc
abstract class _$$ClearScanResultMessageImplCopyWith<$Res> {
  factory _$$ClearScanResultMessageImplCopyWith(
          _$ClearScanResultMessageImpl value,
          $Res Function(_$ClearScanResultMessageImpl) then) =
      __$$ClearScanResultMessageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearScanResultMessageImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$ClearScanResultMessageImpl>
    implements _$$ClearScanResultMessageImplCopyWith<$Res> {
  __$$ClearScanResultMessageImplCopyWithImpl(
      _$ClearScanResultMessageImpl _value,
      $Res Function(_$ClearScanResultMessageImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearScanResultMessageImpl implements _ClearScanResultMessage {
  const _$ClearScanResultMessageImpl();

  @override
  String toString() {
    return 'SaleGdnEvent.clearScanResultMessage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClearScanResultMessageImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return clearScanResultMessage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return clearScanResultMessage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (clearScanResultMessage != null) {
      return clearScanResultMessage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return clearScanResultMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return clearScanResultMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (clearScanResultMessage != null) {
      return clearScanResultMessage(this);
    }
    return orElse();
  }
}

abstract class _ClearScanResultMessage implements SaleGdnEvent {
  const factory _ClearScanResultMessage() = _$ClearScanResultMessageImpl;
}

/// @nodoc
abstract class _$$FetchWarehouseTypesImplCopyWith<$Res> {
  factory _$$FetchWarehouseTypesImplCopyWith(_$FetchWarehouseTypesImpl value,
          $Res Function(_$FetchWarehouseTypesImpl) then) =
      __$$FetchWarehouseTypesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchWarehouseTypesImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$FetchWarehouseTypesImpl>
    implements _$$FetchWarehouseTypesImplCopyWith<$Res> {
  __$$FetchWarehouseTypesImplCopyWithImpl(_$FetchWarehouseTypesImpl _value,
      $Res Function(_$FetchWarehouseTypesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchWarehouseTypesImpl implements _FetchWarehouseTypes {
  const _$FetchWarehouseTypesImpl();

  @override
  String toString() {
    return 'SaleGdnEvent.fetchWarehouseTypes()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchWarehouseTypesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return fetchWarehouseTypes();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return fetchWarehouseTypes?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (fetchWarehouseTypes != null) {
      return fetchWarehouseTypes();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return fetchWarehouseTypes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return fetchWarehouseTypes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (fetchWarehouseTypes != null) {
      return fetchWarehouseTypes(this);
    }
    return orElse();
  }
}

abstract class _FetchWarehouseTypes implements SaleGdnEvent {
  const factory _FetchWarehouseTypes() = _$FetchWarehouseTypesImpl;
}

/// @nodoc
abstract class _$$FilterByWarehouseTypeImplCopyWith<$Res> {
  factory _$$FilterByWarehouseTypeImplCopyWith(
          _$FilterByWarehouseTypeImpl value,
          $Res Function(_$FilterByWarehouseTypeImpl) then) =
      __$$FilterByWarehouseTypeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<int> warehouseTypeIds});
}

/// @nodoc
class __$$FilterByWarehouseTypeImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$FilterByWarehouseTypeImpl>
    implements _$$FilterByWarehouseTypeImplCopyWith<$Res> {
  __$$FilterByWarehouseTypeImplCopyWithImpl(_$FilterByWarehouseTypeImpl _value,
      $Res Function(_$FilterByWarehouseTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? warehouseTypeIds = null,
  }) {
    return _then(_$FilterByWarehouseTypeImpl(
      null == warehouseTypeIds
          ? _value._warehouseTypeIds
          : warehouseTypeIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$FilterByWarehouseTypeImpl implements _FilterByWarehouseType {
  const _$FilterByWarehouseTypeImpl(final List<int> warehouseTypeIds)
      : _warehouseTypeIds = warehouseTypeIds;

  final List<int> _warehouseTypeIds;
  @override
  List<int> get warehouseTypeIds {
    if (_warehouseTypeIds is EqualUnmodifiableListView)
      return _warehouseTypeIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_warehouseTypeIds);
  }

  @override
  String toString() {
    return 'SaleGdnEvent.filterByWarehouseType(warehouseTypeIds: $warehouseTypeIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterByWarehouseTypeImpl &&
            const DeepCollectionEquality()
                .equals(other._warehouseTypeIds, _warehouseTypeIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_warehouseTypeIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterByWarehouseTypeImplCopyWith<_$FilterByWarehouseTypeImpl>
      get copyWith => __$$FilterByWarehouseTypeImplCopyWithImpl<
          _$FilterByWarehouseTypeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return filterByWarehouseType(warehouseTypeIds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return filterByWarehouseType?.call(warehouseTypeIds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (filterByWarehouseType != null) {
      return filterByWarehouseType(warehouseTypeIds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return filterByWarehouseType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return filterByWarehouseType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (filterByWarehouseType != null) {
      return filterByWarehouseType(this);
    }
    return orElse();
  }
}

abstract class _FilterByWarehouseType implements SaleGdnEvent {
  const factory _FilterByWarehouseType(final List<int> warehouseTypeIds) =
      _$FilterByWarehouseTypeImpl;

  List<int> get warehouseTypeIds;
  @JsonKey(ignore: true)
  _$$FilterByWarehouseTypeImplCopyWith<_$FilterByWarehouseTypeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterByStatusImplCopyWith<$Res> {
  factory _$$FilterByStatusImplCopyWith(_$FilterByStatusImpl value,
          $Res Function(_$FilterByStatusImpl) then) =
      __$$FilterByStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int status});
}

/// @nodoc
class __$$FilterByStatusImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$FilterByStatusImpl>
    implements _$$FilterByStatusImplCopyWith<$Res> {
  __$$FilterByStatusImplCopyWithImpl(
      _$FilterByStatusImpl _value, $Res Function(_$FilterByStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$FilterByStatusImpl(
      null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FilterByStatusImpl implements _FilterByStatus {
  const _$FilterByStatusImpl(this.status);

  @override
  final int status;

  @override
  String toString() {
    return 'SaleGdnEvent.filterByStatus(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterByStatusImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterByStatusImplCopyWith<_$FilterByStatusImpl> get copyWith =>
      __$$FilterByStatusImplCopyWithImpl<_$FilterByStatusImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return filterByStatus(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return filterByStatus?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (filterByStatus != null) {
      return filterByStatus(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return filterByStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return filterByStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (filterByStatus != null) {
      return filterByStatus(this);
    }
    return orElse();
  }
}

abstract class _FilterByStatus implements SaleGdnEvent {
  const factory _FilterByStatus(final int status) = _$FilterByStatusImpl;

  int get status;
  @JsonKey(ignore: true)
  _$$FilterByStatusImplCopyWith<_$FilterByStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearFiltersImplCopyWith<$Res> {
  factory _$$ClearFiltersImplCopyWith(
          _$ClearFiltersImpl value, $Res Function(_$ClearFiltersImpl) then) =
      __$$ClearFiltersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearFiltersImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$ClearFiltersImpl>
    implements _$$ClearFiltersImplCopyWith<$Res> {
  __$$ClearFiltersImplCopyWithImpl(
      _$ClearFiltersImpl _value, $Res Function(_$ClearFiltersImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearFiltersImpl implements _ClearFilters {
  const _$ClearFiltersImpl();

  @override
  String toString() {
    return 'SaleGdnEvent.clearFilters()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearFiltersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return clearFilters();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return clearFilters?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (clearFilters != null) {
      return clearFilters();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return clearFilters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return clearFilters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (clearFilters != null) {
      return clearFilters(this);
    }
    return orElse();
  }
}

abstract class _ClearFilters implements SaleGdnEvent {
  const factory _ClearFilters() = _$ClearFiltersImpl;
}

/// @nodoc
abstract class _$$ChangeDateRangeImplCopyWith<$Res> {
  factory _$$ChangeDateRangeImplCopyWith(_$ChangeDateRangeImpl value,
          $Res Function(_$ChangeDateRangeImpl) then) =
      __$$ChangeDateRangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime dateStart, DateTime dateEnd});
}

/// @nodoc
class __$$ChangeDateRangeImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$ChangeDateRangeImpl>
    implements _$$ChangeDateRangeImplCopyWith<$Res> {
  __$$ChangeDateRangeImplCopyWithImpl(
      _$ChangeDateRangeImpl _value, $Res Function(_$ChangeDateRangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateStart = null,
    Object? dateEnd = null,
  }) {
    return _then(_$ChangeDateRangeImpl(
      dateStart: null == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateEnd: null == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$ChangeDateRangeImpl implements _ChangeDateRange {
  const _$ChangeDateRangeImpl({required this.dateStart, required this.dateEnd});

  @override
  final DateTime dateStart;
  @override
  final DateTime dateEnd;

  @override
  String toString() {
    return 'SaleGdnEvent.changeDateRange(dateStart: $dateStart, dateEnd: $dateEnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeDateRangeImpl &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.dateEnd, dateEnd) || other.dateEnd == dateEnd));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateStart, dateEnd);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeDateRangeImplCopyWith<_$ChangeDateRangeImpl> get copyWith =>
      __$$ChangeDateRangeImplCopyWithImpl<_$ChangeDateRangeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return changeDateRange(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return changeDateRange?.call(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (changeDateRange != null) {
      return changeDateRange(dateStart, dateEnd);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return changeDateRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return changeDateRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (changeDateRange != null) {
      return changeDateRange(this);
    }
    return orElse();
  }
}

abstract class _ChangeDateRange implements SaleGdnEvent {
  const factory _ChangeDateRange(
      {required final DateTime dateStart,
      required final DateTime dateEnd}) = _$ChangeDateRangeImpl;

  DateTime get dateStart;
  DateTime get dateEnd;
  @JsonKey(ignore: true)
  _$$ChangeDateRangeImplCopyWith<_$ChangeDateRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitDetailImplCopyWith<$Res> {
  factory _$$InitDetailImplCopyWith(
          _$InitDetailImpl value, $Res Function(_$InitDetailImpl) then) =
      __$$InitDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, BillExporResponse? bill});

  $BillExporResponseCopyWith<$Res>? get bill;
}

/// @nodoc
class __$$InitDetailImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$InitDetailImpl>
    implements _$$InitDetailImplCopyWith<$Res> {
  __$$InitDetailImplCopyWithImpl(
      _$InitDetailImpl _value, $Res Function(_$InitDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bill = freezed,
  }) {
    return _then(_$InitDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      bill: freezed == bill
          ? _value.bill
          : bill // ignore: cast_nullable_to_non_nullable
              as BillExporResponse?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BillExporResponseCopyWith<$Res>? get bill {
    if (_value.bill == null) {
      return null;
    }

    return $BillExporResponseCopyWith<$Res>(_value.bill!, (value) {
      return _then(_value.copyWith(bill: value));
    });
  }
}

/// @nodoc

class _$InitDetailImpl implements _InitDetail {
  const _$InitDetailImpl({this.id = 0, this.bill});

  @override
  @JsonKey()
  final int id;
  @override
  final BillExporResponse? bill;

  @override
  String toString() {
    return 'SaleGdnEvent.initDetail(id: $id, bill: $bill)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bill, bill) || other.bill == bill));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, bill);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitDetailImplCopyWith<_$InitDetailImpl> get copyWith =>
      __$$InitDetailImplCopyWithImpl<_$InitDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return initDetail(id, bill);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return initDetail?.call(id, bill);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (initDetail != null) {
      return initDetail(id, bill);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return initDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return initDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (initDetail != null) {
      return initDetail(this);
    }
    return orElse();
  }
}

abstract class _InitDetail implements SaleGdnEvent {
  const factory _InitDetail({final int id, final BillExporResponse? bill}) =
      _$InitDetailImpl;

  int get id;
  BillExporResponse? get bill;
  @JsonKey(ignore: true)
  _$$InitDetailImplCopyWith<_$InitDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetWarehouseCodeImplCopyWith<$Res> {
  factory _$$SetWarehouseCodeImplCopyWith(_$SetWarehouseCodeImpl value,
          $Res Function(_$SetWarehouseCodeImpl) then) =
      __$$SetWarehouseCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? warehouseCode});
}

/// @nodoc
class __$$SetWarehouseCodeImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$SetWarehouseCodeImpl>
    implements _$$SetWarehouseCodeImplCopyWith<$Res> {
  __$$SetWarehouseCodeImplCopyWithImpl(_$SetWarehouseCodeImpl _value,
      $Res Function(_$SetWarehouseCodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? warehouseCode = freezed,
  }) {
    return _then(_$SetWarehouseCodeImpl(
      freezed == warehouseCode
          ? _value.warehouseCode
          : warehouseCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SetWarehouseCodeImpl implements _SetWarehouseCode {
  const _$SetWarehouseCodeImpl(this.warehouseCode);

  @override
  final String? warehouseCode;

  @override
  String toString() {
    return 'SaleGdnEvent.setWarehouseCode(warehouseCode: $warehouseCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetWarehouseCodeImpl &&
            (identical(other.warehouseCode, warehouseCode) ||
                other.warehouseCode == warehouseCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, warehouseCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetWarehouseCodeImplCopyWith<_$SetWarehouseCodeImpl> get copyWith =>
      __$$SetWarehouseCodeImplCopyWithImpl<_$SetWarehouseCodeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return setWarehouseCode(warehouseCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return setWarehouseCode?.call(warehouseCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (setWarehouseCode != null) {
      return setWarehouseCode(warehouseCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return setWarehouseCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return setWarehouseCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (setWarehouseCode != null) {
      return setWarehouseCode(this);
    }
    return orElse();
  }
}

abstract class _SetWarehouseCode implements SaleGdnEvent {
  const factory _SetWarehouseCode(final String? warehouseCode) =
      _$SetWarehouseCodeImpl;

  String? get warehouseCode;
  @JsonKey(ignore: true)
  _$$SetWarehouseCodeImplCopyWith<_$SetWarehouseCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddImagesImplCopyWith<$Res> {
  factory _$$AddImagesImplCopyWith(
          _$AddImagesImpl value, $Res Function(_$AddImagesImpl) then) =
      __$$AddImagesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int stt, List<String> imagePaths});
}

/// @nodoc
class __$$AddImagesImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$AddImagesImpl>
    implements _$$AddImagesImplCopyWith<$Res> {
  __$$AddImagesImplCopyWithImpl(
      _$AddImagesImpl _value, $Res Function(_$AddImagesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stt = null,
    Object? imagePaths = null,
  }) {
    return _then(_$AddImagesImpl(
      stt: null == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int,
      imagePaths: null == imagePaths
          ? _value._imagePaths
          : imagePaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$AddImagesImpl implements _AddImages {
  const _$AddImagesImpl(
      {required this.stt, required final List<String> imagePaths})
      : _imagePaths = imagePaths;

  @override
  final int stt;
  final List<String> _imagePaths;
  @override
  List<String> get imagePaths {
    if (_imagePaths is EqualUnmodifiableListView) return _imagePaths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imagePaths);
  }

  @override
  String toString() {
    return 'SaleGdnEvent.addImages(stt: $stt, imagePaths: $imagePaths)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddImagesImpl &&
            (identical(other.stt, stt) || other.stt == stt) &&
            const DeepCollectionEquality()
                .equals(other._imagePaths, _imagePaths));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, stt, const DeepCollectionEquality().hash(_imagePaths));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddImagesImplCopyWith<_$AddImagesImpl> get copyWith =>
      __$$AddImagesImplCopyWithImpl<_$AddImagesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return addImages(stt, imagePaths);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return addImages?.call(stt, imagePaths);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (addImages != null) {
      return addImages(stt, imagePaths);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return addImages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return addImages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (addImages != null) {
      return addImages(this);
    }
    return orElse();
  }
}

abstract class _AddImages implements SaleGdnEvent {
  const factory _AddImages(
      {required final int stt,
      required final List<String> imagePaths}) = _$AddImagesImpl;

  int get stt;
  List<String> get imagePaths;
  @JsonKey(ignore: true)
  _$$AddImagesImplCopyWith<_$AddImagesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MarkImageToDeleteImplCopyWith<$Res> {
  factory _$$MarkImageToDeleteImplCopyWith(_$MarkImageToDeleteImpl value,
          $Res Function(_$MarkImageToDeleteImpl) then) =
      __$$MarkImageToDeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? fileId, String? localPath});
}

/// @nodoc
class __$$MarkImageToDeleteImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$MarkImageToDeleteImpl>
    implements _$$MarkImageToDeleteImplCopyWith<$Res> {
  __$$MarkImageToDeleteImplCopyWithImpl(_$MarkImageToDeleteImpl _value,
      $Res Function(_$MarkImageToDeleteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileId = freezed,
    Object? localPath = freezed,
  }) {
    return _then(_$MarkImageToDeleteImpl(
      fileId: freezed == fileId
          ? _value.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as int?,
      localPath: freezed == localPath
          ? _value.localPath
          : localPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MarkImageToDeleteImpl implements _MarkImageToDelete {
  const _$MarkImageToDeleteImpl({this.fileId, this.localPath});

  @override
  final int? fileId;
  @override
  final String? localPath;

  @override
  String toString() {
    return 'SaleGdnEvent.markImageToDelete(fileId: $fileId, localPath: $localPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkImageToDeleteImpl &&
            (identical(other.fileId, fileId) || other.fileId == fileId) &&
            (identical(other.localPath, localPath) ||
                other.localPath == localPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fileId, localPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkImageToDeleteImplCopyWith<_$MarkImageToDeleteImpl> get copyWith =>
      __$$MarkImageToDeleteImplCopyWithImpl<_$MarkImageToDeleteImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return markImageToDelete(fileId, localPath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return markImageToDelete?.call(fileId, localPath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (markImageToDelete != null) {
      return markImageToDelete(fileId, localPath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return markImageToDelete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return markImageToDelete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (markImageToDelete != null) {
      return markImageToDelete(this);
    }
    return orElse();
  }
}

abstract class _MarkImageToDelete implements SaleGdnEvent {
  const factory _MarkImageToDelete(
      {final int? fileId, final String? localPath}) = _$MarkImageToDeleteImpl;

  int? get fileId;
  String? get localPath;
  @JsonKey(ignore: true)
  _$$MarkImageToDeleteImplCopyWith<_$MarkImageToDeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MarkImagesToDeleteBulkImplCopyWith<$Res> {
  factory _$$MarkImagesToDeleteBulkImplCopyWith(
          _$MarkImagesToDeleteBulkImpl value,
          $Res Function(_$MarkImagesToDeleteBulkImpl) then) =
      __$$MarkImagesToDeleteBulkImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Set<int> fileIds, Set<String> localPaths});
}

/// @nodoc
class __$$MarkImagesToDeleteBulkImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$MarkImagesToDeleteBulkImpl>
    implements _$$MarkImagesToDeleteBulkImplCopyWith<$Res> {
  __$$MarkImagesToDeleteBulkImplCopyWithImpl(
      _$MarkImagesToDeleteBulkImpl _value,
      $Res Function(_$MarkImagesToDeleteBulkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileIds = null,
    Object? localPaths = null,
  }) {
    return _then(_$MarkImagesToDeleteBulkImpl(
      fileIds: null == fileIds
          ? _value._fileIds
          : fileIds // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      localPaths: null == localPaths
          ? _value._localPaths
          : localPaths // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ));
  }
}

/// @nodoc

class _$MarkImagesToDeleteBulkImpl implements _MarkImagesToDeleteBulk {
  const _$MarkImagesToDeleteBulkImpl(
      {final Set<int> fileIds = const <int>{},
      final Set<String> localPaths = const <String>{}})
      : _fileIds = fileIds,
        _localPaths = localPaths;

  final Set<int> _fileIds;
  @override
  @JsonKey()
  Set<int> get fileIds {
    if (_fileIds is EqualUnmodifiableSetView) return _fileIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_fileIds);
  }

  final Set<String> _localPaths;
  @override
  @JsonKey()
  Set<String> get localPaths {
    if (_localPaths is EqualUnmodifiableSetView) return _localPaths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_localPaths);
  }

  @override
  String toString() {
    return 'SaleGdnEvent.markImagesToDeleteBulk(fileIds: $fileIds, localPaths: $localPaths)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkImagesToDeleteBulkImpl &&
            const DeepCollectionEquality().equals(other._fileIds, _fileIds) &&
            const DeepCollectionEquality()
                .equals(other._localPaths, _localPaths));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_fileIds),
      const DeepCollectionEquality().hash(_localPaths));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkImagesToDeleteBulkImplCopyWith<_$MarkImagesToDeleteBulkImpl>
      get copyWith => __$$MarkImagesToDeleteBulkImplCopyWithImpl<
          _$MarkImagesToDeleteBulkImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return markImagesToDeleteBulk(fileIds, localPaths);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return markImagesToDeleteBulk?.call(fileIds, localPaths);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (markImagesToDeleteBulk != null) {
      return markImagesToDeleteBulk(fileIds, localPaths);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return markImagesToDeleteBulk(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return markImagesToDeleteBulk?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (markImagesToDeleteBulk != null) {
      return markImagesToDeleteBulk(this);
    }
    return orElse();
  }
}

abstract class _MarkImagesToDeleteBulk implements SaleGdnEvent {
  const factory _MarkImagesToDeleteBulk(
      {final Set<int> fileIds,
      final Set<String> localPaths}) = _$MarkImagesToDeleteBulkImpl;

  Set<int> get fileIds;
  Set<String> get localPaths;
  @JsonKey(ignore: true)
  _$$MarkImagesToDeleteBulkImplCopyWith<_$MarkImagesToDeleteBulkImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnmarkImageToDeleteImplCopyWith<$Res> {
  factory _$$UnmarkImageToDeleteImplCopyWith(_$UnmarkImageToDeleteImpl value,
          $Res Function(_$UnmarkImageToDeleteImpl) then) =
      __$$UnmarkImageToDeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? fileId, String? localPath});
}

/// @nodoc
class __$$UnmarkImageToDeleteImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$UnmarkImageToDeleteImpl>
    implements _$$UnmarkImageToDeleteImplCopyWith<$Res> {
  __$$UnmarkImageToDeleteImplCopyWithImpl(_$UnmarkImageToDeleteImpl _value,
      $Res Function(_$UnmarkImageToDeleteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileId = freezed,
    Object? localPath = freezed,
  }) {
    return _then(_$UnmarkImageToDeleteImpl(
      fileId: freezed == fileId
          ? _value.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as int?,
      localPath: freezed == localPath
          ? _value.localPath
          : localPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UnmarkImageToDeleteImpl implements _UnmarkImageToDelete {
  const _$UnmarkImageToDeleteImpl({this.fileId, this.localPath});

  @override
  final int? fileId;
  @override
  final String? localPath;

  @override
  String toString() {
    return 'SaleGdnEvent.unmarkImageToDelete(fileId: $fileId, localPath: $localPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnmarkImageToDeleteImpl &&
            (identical(other.fileId, fileId) || other.fileId == fileId) &&
            (identical(other.localPath, localPath) ||
                other.localPath == localPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fileId, localPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnmarkImageToDeleteImplCopyWith<_$UnmarkImageToDeleteImpl> get copyWith =>
      __$$UnmarkImageToDeleteImplCopyWithImpl<_$UnmarkImageToDeleteImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return unmarkImageToDelete(fileId, localPath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return unmarkImageToDelete?.call(fileId, localPath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (unmarkImageToDelete != null) {
      return unmarkImageToDelete(fileId, localPath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return unmarkImageToDelete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return unmarkImageToDelete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (unmarkImageToDelete != null) {
      return unmarkImageToDelete(this);
    }
    return orElse();
  }
}

abstract class _UnmarkImageToDelete implements SaleGdnEvent {
  const factory _UnmarkImageToDelete(
      {final int? fileId, final String? localPath}) = _$UnmarkImageToDeleteImpl;

  int? get fileId;
  String? get localPath;
  @JsonKey(ignore: true)
  _$$UnmarkImageToDeleteImplCopyWith<_$UnmarkImageToDeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitImagesImplCopyWith<$Res> {
  factory _$$SubmitImagesImplCopyWith(
          _$SubmitImagesImpl value, $Res Function(_$SubmitImagesImpl) then) =
      __$$SubmitImagesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubmitImagesImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$SubmitImagesImpl>
    implements _$$SubmitImagesImplCopyWith<$Res> {
  __$$SubmitImagesImplCopyWithImpl(
      _$SubmitImagesImpl _value, $Res Function(_$SubmitImagesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SubmitImagesImpl implements _SubmitImages {
  const _$SubmitImagesImpl();

  @override
  String toString() {
    return 'SaleGdnEvent.submitImages()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SubmitImagesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return submitImages();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return submitImages?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (submitImages != null) {
      return submitImages();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return submitImages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return submitImages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (submitImages != null) {
      return submitImages(this);
    }
    return orElse();
  }
}

abstract class _SubmitImages implements SaleGdnEvent {
  const factory _SubmitImages() = _$SubmitImagesImpl;
}

/// @nodoc
abstract class _$$ClearUploadStatusImplCopyWith<$Res> {
  factory _$$ClearUploadStatusImplCopyWith(_$ClearUploadStatusImpl value,
          $Res Function(_$ClearUploadStatusImpl) then) =
      __$$ClearUploadStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearUploadStatusImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$ClearUploadStatusImpl>
    implements _$$ClearUploadStatusImplCopyWith<$Res> {
  __$$ClearUploadStatusImplCopyWithImpl(_$ClearUploadStatusImpl _value,
      $Res Function(_$ClearUploadStatusImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearUploadStatusImpl implements _ClearUploadStatus {
  const _$ClearUploadStatusImpl();

  @override
  String toString() {
    return 'SaleGdnEvent.clearUploadStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearUploadStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return clearUploadStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return clearUploadStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (clearUploadStatus != null) {
      return clearUploadStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return clearUploadStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return clearUploadStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (clearUploadStatus != null) {
      return clearUploadStatus(this);
    }
    return orElse();
  }
}

abstract class _ClearUploadStatus implements SaleGdnEvent {
  const factory _ClearUploadStatus() = _$ClearUploadStatusImpl;
}

/// @nodoc
abstract class _$$FetchLookupDataImplCopyWith<$Res> {
  factory _$$FetchLookupDataImplCopyWith(_$FetchLookupDataImpl value,
          $Res Function(_$FetchLookupDataImpl) then) =
      __$$FetchLookupDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchLookupDataImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$FetchLookupDataImpl>
    implements _$$FetchLookupDataImplCopyWith<$Res> {
  __$$FetchLookupDataImplCopyWithImpl(
      _$FetchLookupDataImpl _value, $Res Function(_$FetchLookupDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchLookupDataImpl implements _FetchLookupData {
  const _$FetchLookupDataImpl();

  @override
  String toString() {
    return 'SaleGdnEvent.fetchLookupData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchLookupDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return fetchLookupData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return fetchLookupData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (fetchLookupData != null) {
      return fetchLookupData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return fetchLookupData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return fetchLookupData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (fetchLookupData != null) {
      return fetchLookupData(this);
    }
    return orElse();
  }
}

abstract class _FetchLookupData implements SaleGdnEvent {
  const factory _FetchLookupData() = _$FetchLookupDataImpl;
}

/// @nodoc
abstract class _$$PrefetchLookupDataImplCopyWith<$Res> {
  factory _$$PrefetchLookupDataImplCopyWith(_$PrefetchLookupDataImpl value,
          $Res Function(_$PrefetchLookupDataImpl) then) =
      __$$PrefetchLookupDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PrefetchLookupDataImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$PrefetchLookupDataImpl>
    implements _$$PrefetchLookupDataImplCopyWith<$Res> {
  __$$PrefetchLookupDataImplCopyWithImpl(_$PrefetchLookupDataImpl _value,
      $Res Function(_$PrefetchLookupDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PrefetchLookupDataImpl implements _PrefetchLookupData {
  const _$PrefetchLookupDataImpl();

  @override
  String toString() {
    return 'SaleGdnEvent.prefetchLookupData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PrefetchLookupDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return prefetchLookupData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return prefetchLookupData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (prefetchLookupData != null) {
      return prefetchLookupData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return prefetchLookupData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return prefetchLookupData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (prefetchLookupData != null) {
      return prefetchLookupData(this);
    }
    return orElse();
  }
}

abstract class _PrefetchLookupData implements SaleGdnEvent {
  const factory _PrefetchLookupData() = _$PrefetchLookupDataImpl;
}

/// @nodoc
abstract class _$$FetchUsersImplCopyWith<$Res> {
  factory _$$FetchUsersImplCopyWith(
          _$FetchUsersImpl value, $Res Function(_$FetchUsersImpl) then) =
      __$$FetchUsersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchUsersImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$FetchUsersImpl>
    implements _$$FetchUsersImplCopyWith<$Res> {
  __$$FetchUsersImplCopyWithImpl(
      _$FetchUsersImpl _value, $Res Function(_$FetchUsersImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchUsersImpl implements _FetchUsers {
  const _$FetchUsersImpl();

  @override
  String toString() {
    return 'SaleGdnEvent.fetchUsers()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchUsersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return fetchUsers();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return fetchUsers?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (fetchUsers != null) {
      return fetchUsers();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return fetchUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return fetchUsers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (fetchUsers != null) {
      return fetchUsers(this);
    }
    return orElse();
  }
}

abstract class _FetchUsers implements SaleGdnEvent {
  const factory _FetchUsers() = _$FetchUsersImpl;
}

/// @nodoc
abstract class _$$SelectSupplierImplCopyWith<$Res> {
  factory _$$SelectSupplierImplCopyWith(_$SelectSupplierImpl value,
          $Res Function(_$SelectSupplierImpl) then) =
      __$$SelectSupplierImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? supplierId});
}

/// @nodoc
class __$$SelectSupplierImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$SelectSupplierImpl>
    implements _$$SelectSupplierImplCopyWith<$Res> {
  __$$SelectSupplierImplCopyWithImpl(
      _$SelectSupplierImpl _value, $Res Function(_$SelectSupplierImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supplierId = freezed,
  }) {
    return _then(_$SelectSupplierImpl(
      freezed == supplierId
          ? _value.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SelectSupplierImpl implements _SelectSupplier {
  const _$SelectSupplierImpl(this.supplierId);

  @override
  final int? supplierId;

  @override
  String toString() {
    return 'SaleGdnEvent.selectSupplier(supplierId: $supplierId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectSupplierImpl &&
            (identical(other.supplierId, supplierId) ||
                other.supplierId == supplierId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, supplierId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectSupplierImplCopyWith<_$SelectSupplierImpl> get copyWith =>
      __$$SelectSupplierImplCopyWithImpl<_$SelectSupplierImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return selectSupplier(supplierId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return selectSupplier?.call(supplierId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (selectSupplier != null) {
      return selectSupplier(supplierId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return selectSupplier(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return selectSupplier?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (selectSupplier != null) {
      return selectSupplier(this);
    }
    return orElse();
  }
}

abstract class _SelectSupplier implements SaleGdnEvent {
  const factory _SelectSupplier(final int? supplierId) = _$SelectSupplierImpl;

  int? get supplierId;
  @JsonKey(ignore: true)
  _$$SelectSupplierImplCopyWith<_$SelectSupplierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectSenderImplCopyWith<$Res> {
  factory _$$SelectSenderImplCopyWith(
          _$SelectSenderImpl value, $Res Function(_$SelectSenderImpl) then) =
      __$$SelectSenderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? senderId});
}

/// @nodoc
class __$$SelectSenderImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$SelectSenderImpl>
    implements _$$SelectSenderImplCopyWith<$Res> {
  __$$SelectSenderImplCopyWithImpl(
      _$SelectSenderImpl _value, $Res Function(_$SelectSenderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderId = freezed,
  }) {
    return _then(_$SelectSenderImpl(
      freezed == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SelectSenderImpl implements _SelectSender {
  const _$SelectSenderImpl(this.senderId);

  @override
  final int? senderId;

  @override
  String toString() {
    return 'SaleGdnEvent.selectSender(senderId: $senderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectSenderImpl &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, senderId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectSenderImplCopyWith<_$SelectSenderImpl> get copyWith =>
      __$$SelectSenderImplCopyWithImpl<_$SelectSenderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return selectSender(senderId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return selectSender?.call(senderId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (selectSender != null) {
      return selectSender(senderId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return selectSender(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return selectSender?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (selectSender != null) {
      return selectSender(this);
    }
    return orElse();
  }
}

abstract class _SelectSender implements SaleGdnEvent {
  const factory _SelectSender(final int? senderId) = _$SelectSenderImpl;

  int? get senderId;
  @JsonKey(ignore: true)
  _$$SelectSenderImplCopyWith<_$SelectSenderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectReceiverImplCopyWith<$Res> {
  factory _$$SelectReceiverImplCopyWith(_$SelectReceiverImpl value,
          $Res Function(_$SelectReceiverImpl) then) =
      __$$SelectReceiverImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? receiverId});
}

/// @nodoc
class __$$SelectReceiverImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$SelectReceiverImpl>
    implements _$$SelectReceiverImplCopyWith<$Res> {
  __$$SelectReceiverImplCopyWithImpl(
      _$SelectReceiverImpl _value, $Res Function(_$SelectReceiverImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiverId = freezed,
  }) {
    return _then(_$SelectReceiverImpl(
      freezed == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SelectReceiverImpl implements _SelectReceiver {
  const _$SelectReceiverImpl(this.receiverId);

  @override
  final int? receiverId;

  @override
  String toString() {
    return 'SaleGdnEvent.selectReceiver(receiverId: $receiverId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectReceiverImpl &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, receiverId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectReceiverImplCopyWith<_$SelectReceiverImpl> get copyWith =>
      __$$SelectReceiverImplCopyWithImpl<_$SelectReceiverImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return selectReceiver(receiverId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return selectReceiver?.call(receiverId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (selectReceiver != null) {
      return selectReceiver(receiverId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return selectReceiver(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return selectReceiver?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (selectReceiver != null) {
      return selectReceiver(this);
    }
    return orElse();
  }
}

abstract class _SelectReceiver implements SaleGdnEvent {
  const factory _SelectReceiver(final int? receiverId) = _$SelectReceiverImpl;

  int? get receiverId;
  @JsonKey(ignore: true)
  _$$SelectReceiverImplCopyWith<_$SelectReceiverImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectCustomerImplCopyWith<$Res> {
  factory _$$SelectCustomerImplCopyWith(_$SelectCustomerImpl value,
          $Res Function(_$SelectCustomerImpl) then) =
      __$$SelectCustomerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? customerId});
}

/// @nodoc
class __$$SelectCustomerImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$SelectCustomerImpl>
    implements _$$SelectCustomerImplCopyWith<$Res> {
  __$$SelectCustomerImplCopyWithImpl(
      _$SelectCustomerImpl _value, $Res Function(_$SelectCustomerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
  }) {
    return _then(_$SelectCustomerImpl(
      freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SelectCustomerImpl implements _SelectCustomer {
  const _$SelectCustomerImpl(this.customerId);

  @override
  final int? customerId;

  @override
  String toString() {
    return 'SaleGdnEvent.selectCustomer(customerId: $customerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectCustomerImpl &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectCustomerImplCopyWith<_$SelectCustomerImpl> get copyWith =>
      __$$SelectCustomerImplCopyWithImpl<_$SelectCustomerImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return selectCustomer(customerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return selectCustomer?.call(customerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (selectCustomer != null) {
      return selectCustomer(customerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return selectCustomer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return selectCustomer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (selectCustomer != null) {
      return selectCustomer(this);
    }
    return orElse();
  }
}

abstract class _SelectCustomer implements SaleGdnEvent {
  const factory _SelectCustomer(final int? customerId) = _$SelectCustomerImpl;

  int? get customerId;
  @JsonKey(ignore: true)
  _$$SelectCustomerImplCopyWith<_$SelectCustomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectWarehouseImplCopyWith<$Res> {
  factory _$$SelectWarehouseImplCopyWith(_$SelectWarehouseImpl value,
          $Res Function(_$SelectWarehouseImpl) then) =
      __$$SelectWarehouseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? warehouseId});
}

/// @nodoc
class __$$SelectWarehouseImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$SelectWarehouseImpl>
    implements _$$SelectWarehouseImplCopyWith<$Res> {
  __$$SelectWarehouseImplCopyWithImpl(
      _$SelectWarehouseImpl _value, $Res Function(_$SelectWarehouseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? warehouseId = freezed,
  }) {
    return _then(_$SelectWarehouseImpl(
      freezed == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SelectWarehouseImpl implements _SelectWarehouse {
  const _$SelectWarehouseImpl(this.warehouseId);

  @override
  final int? warehouseId;

  @override
  String toString() {
    return 'SaleGdnEvent.selectWarehouse(warehouseId: $warehouseId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectWarehouseImpl &&
            (identical(other.warehouseId, warehouseId) ||
                other.warehouseId == warehouseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, warehouseId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectWarehouseImplCopyWith<_$SelectWarehouseImpl> get copyWith =>
      __$$SelectWarehouseImplCopyWithImpl<_$SelectWarehouseImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return selectWarehouse(warehouseId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return selectWarehouse?.call(warehouseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (selectWarehouse != null) {
      return selectWarehouse(warehouseId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return selectWarehouse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return selectWarehouse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (selectWarehouse != null) {
      return selectWarehouse(this);
    }
    return orElse();
  }
}

abstract class _SelectWarehouse implements SaleGdnEvent {
  const factory _SelectWarehouse(final int? warehouseId) =
      _$SelectWarehouseImpl;

  int? get warehouseId;
  @JsonKey(ignore: true)
  _$$SelectWarehouseImplCopyWith<_$SelectWarehouseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectKhoTypeImplCopyWith<$Res> {
  factory _$$SelectKhoTypeImplCopyWith(
          _$SelectKhoTypeImpl value, $Res Function(_$SelectKhoTypeImpl) then) =
      __$$SelectKhoTypeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? khoTypeId});
}

/// @nodoc
class __$$SelectKhoTypeImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$SelectKhoTypeImpl>
    implements _$$SelectKhoTypeImplCopyWith<$Res> {
  __$$SelectKhoTypeImplCopyWithImpl(
      _$SelectKhoTypeImpl _value, $Res Function(_$SelectKhoTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? khoTypeId = freezed,
  }) {
    return _then(_$SelectKhoTypeImpl(
      freezed == khoTypeId
          ? _value.khoTypeId
          : khoTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SelectKhoTypeImpl implements _SelectKhoType {
  const _$SelectKhoTypeImpl(this.khoTypeId);

  @override
  final int? khoTypeId;

  @override
  String toString() {
    return 'SaleGdnEvent.selectKhoType(khoTypeId: $khoTypeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectKhoTypeImpl &&
            (identical(other.khoTypeId, khoTypeId) ||
                other.khoTypeId == khoTypeId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, khoTypeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectKhoTypeImplCopyWith<_$SelectKhoTypeImpl> get copyWith =>
      __$$SelectKhoTypeImplCopyWithImpl<_$SelectKhoTypeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return selectKhoType(khoTypeId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return selectKhoType?.call(khoTypeId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (selectKhoType != null) {
      return selectKhoType(khoTypeId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return selectKhoType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return selectKhoType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (selectKhoType != null) {
      return selectKhoType(this);
    }
    return orElse();
  }
}

abstract class _SelectKhoType implements SaleGdnEvent {
  const factory _SelectKhoType(final int? khoTypeId) = _$SelectKhoTypeImpl;

  int? get khoTypeId;
  @JsonKey(ignore: true)
  _$$SelectKhoTypeImplCopyWith<_$SelectKhoTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectStatusImplCopyWith<$Res> {
  factory _$$SelectStatusImplCopyWith(
          _$SelectStatusImpl value, $Res Function(_$SelectStatusImpl) then) =
      __$$SelectStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? status});
}

/// @nodoc
class __$$SelectStatusImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$SelectStatusImpl>
    implements _$$SelectStatusImplCopyWith<$Res> {
  __$$SelectStatusImplCopyWithImpl(
      _$SelectStatusImpl _value, $Res Function(_$SelectStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$SelectStatusImpl(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SelectStatusImpl implements _SelectStatus {
  const _$SelectStatusImpl(this.status);

  @override
  final int? status;

  @override
  String toString() {
    return 'SaleGdnEvent.selectStatus(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectStatusImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectStatusImplCopyWith<_$SelectStatusImpl> get copyWith =>
      __$$SelectStatusImplCopyWithImpl<_$SelectStatusImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return selectStatus(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return selectStatus?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (selectStatus != null) {
      return selectStatus(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return selectStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return selectStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (selectStatus != null) {
      return selectStatus(this);
    }
    return orElse();
  }
}

abstract class _SelectStatus implements SaleGdnEvent {
  const factory _SelectStatus(final int? status) = _$SelectStatusImpl;

  int? get status;
  @JsonKey(ignore: true)
  _$$SelectStatusImplCopyWith<_$SelectStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectProjectImplCopyWith<$Res> {
  factory _$$SelectProjectImplCopyWith(
          _$SelectProjectImpl value, $Res Function(_$SelectProjectImpl) then) =
      __$$SelectProjectImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? projectId});
}

/// @nodoc
class __$$SelectProjectImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$SelectProjectImpl>
    implements _$$SelectProjectImplCopyWith<$Res> {
  __$$SelectProjectImplCopyWithImpl(
      _$SelectProjectImpl _value, $Res Function(_$SelectProjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = freezed,
  }) {
    return _then(_$SelectProjectImpl(
      freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SelectProjectImpl implements _SelectProject {
  const _$SelectProjectImpl(this.projectId);

  @override
  final int? projectId;

  @override
  String toString() {
    return 'SaleGdnEvent.selectProject(projectId: $projectId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectProjectImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectProjectImplCopyWith<_$SelectProjectImpl> get copyWith =>
      __$$SelectProjectImplCopyWithImpl<_$SelectProjectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return selectProject(projectId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return selectProject?.call(projectId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (selectProject != null) {
      return selectProject(projectId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return selectProject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return selectProject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (selectProject != null) {
      return selectProject(this);
    }
    return orElse();
  }
}

abstract class _SelectProject implements SaleGdnEvent {
  const factory _SelectProject(final int? projectId) = _$SelectProjectImpl;

  int? get projectId;
  @JsonKey(ignore: true)
  _$$SelectProjectImplCopyWith<_$SelectProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeDeliveryDateImplCopyWith<$Res> {
  factory _$$ChangeDeliveryDateImplCopyWith(_$ChangeDeliveryDateImpl value,
          $Res Function(_$ChangeDeliveryDateImpl) then) =
      __$$ChangeDeliveryDateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime? date});
}

/// @nodoc
class __$$ChangeDeliveryDateImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$ChangeDeliveryDateImpl>
    implements _$$ChangeDeliveryDateImplCopyWith<$Res> {
  __$$ChangeDeliveryDateImplCopyWithImpl(_$ChangeDeliveryDateImpl _value,
      $Res Function(_$ChangeDeliveryDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
  }) {
    return _then(_$ChangeDeliveryDateImpl(
      freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$ChangeDeliveryDateImpl implements _ChangeDeliveryDate {
  const _$ChangeDeliveryDateImpl(this.date);

  @override
  final DateTime? date;

  @override
  String toString() {
    return 'SaleGdnEvent.changeDeliveryDate(date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeDeliveryDateImpl &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeDeliveryDateImplCopyWith<_$ChangeDeliveryDateImpl> get copyWith =>
      __$$ChangeDeliveryDateImplCopyWithImpl<_$ChangeDeliveryDateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return changeDeliveryDate(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return changeDeliveryDate?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (changeDeliveryDate != null) {
      return changeDeliveryDate(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return changeDeliveryDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return changeDeliveryDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (changeDeliveryDate != null) {
      return changeDeliveryDate(this);
    }
    return orElse();
  }
}

abstract class _ChangeDeliveryDate implements SaleGdnEvent {
  const factory _ChangeDeliveryDate(final DateTime? date) =
      _$ChangeDeliveryDateImpl;

  DateTime? get date;
  @JsonKey(ignore: true)
  _$$ChangeDeliveryDateImplCopyWith<_$ChangeDeliveryDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeRequestDateImplCopyWith<$Res> {
  factory _$$ChangeRequestDateImplCopyWith(_$ChangeRequestDateImpl value,
          $Res Function(_$ChangeRequestDateImpl) then) =
      __$$ChangeRequestDateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime? date});
}

/// @nodoc
class __$$ChangeRequestDateImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$ChangeRequestDateImpl>
    implements _$$ChangeRequestDateImplCopyWith<$Res> {
  __$$ChangeRequestDateImplCopyWithImpl(_$ChangeRequestDateImpl _value,
      $Res Function(_$ChangeRequestDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
  }) {
    return _then(_$ChangeRequestDateImpl(
      freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$ChangeRequestDateImpl implements _ChangeRequestDate {
  const _$ChangeRequestDateImpl(this.date);

  @override
  final DateTime? date;

  @override
  String toString() {
    return 'SaleGdnEvent.changeRequestDate(date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeRequestDateImpl &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeRequestDateImplCopyWith<_$ChangeRequestDateImpl> get copyWith =>
      __$$ChangeRequestDateImplCopyWithImpl<_$ChangeRequestDateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return changeRequestDate(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return changeRequestDate?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (changeRequestDate != null) {
      return changeRequestDate(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return changeRequestDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return changeRequestDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (changeRequestDate != null) {
      return changeRequestDate(this);
    }
    return orElse();
  }
}

abstract class _ChangeRequestDate implements SaleGdnEvent {
  const factory _ChangeRequestDate(final DateTime? date) =
      _$ChangeRequestDateImpl;

  DateTime? get date;
  @JsonKey(ignore: true)
  _$$ChangeRequestDateImplCopyWith<_$ChangeRequestDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeReceiveTimeImplCopyWith<$Res> {
  factory _$$ChangeReceiveTimeImplCopyWith(_$ChangeReceiveTimeImpl value,
          $Res Function(_$ChangeReceiveTimeImpl) then) =
      __$$ChangeReceiveTimeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime? time});
}

/// @nodoc
class __$$ChangeReceiveTimeImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$ChangeReceiveTimeImpl>
    implements _$$ChangeReceiveTimeImplCopyWith<$Res> {
  __$$ChangeReceiveTimeImplCopyWithImpl(_$ChangeReceiveTimeImpl _value,
      $Res Function(_$ChangeReceiveTimeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = freezed,
  }) {
    return _then(_$ChangeReceiveTimeImpl(
      freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$ChangeReceiveTimeImpl implements _ChangeReceiveTime {
  const _$ChangeReceiveTimeImpl(this.time);

  @override
  final DateTime? time;

  @override
  String toString() {
    return 'SaleGdnEvent.changeReceiveTime(time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeReceiveTimeImpl &&
            (identical(other.time, time) || other.time == time));
  }

  @override
  int get hashCode => Object.hash(runtimeType, time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeReceiveTimeImplCopyWith<_$ChangeReceiveTimeImpl> get copyWith =>
      __$$ChangeReceiveTimeImplCopyWithImpl<_$ChangeReceiveTimeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return changeReceiveTime(time);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return changeReceiveTime?.call(time);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (changeReceiveTime != null) {
      return changeReceiveTime(time);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return changeReceiveTime(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return changeReceiveTime?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (changeReceiveTime != null) {
      return changeReceiveTime(this);
    }
    return orElse();
  }
}

abstract class _ChangeReceiveTime implements SaleGdnEvent {
  const factory _ChangeReceiveTime(final DateTime? time) =
      _$ChangeReceiveTimeImpl;

  DateTime? get time;
  @JsonKey(ignore: true)
  _$$ChangeReceiveTimeImplCopyWith<_$ChangeReceiveTimeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectLoaiKhoImplCopyWith<$Res> {
  factory _$$SelectLoaiKhoImplCopyWith(
          _$SelectLoaiKhoImpl value, $Res Function(_$SelectLoaiKhoImpl) then) =
      __$$SelectLoaiKhoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? text});
}

/// @nodoc
class __$$SelectLoaiKhoImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$SelectLoaiKhoImpl>
    implements _$$SelectLoaiKhoImplCopyWith<$Res> {
  __$$SelectLoaiKhoImplCopyWithImpl(
      _$SelectLoaiKhoImpl _value, $Res Function(_$SelectLoaiKhoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_$SelectLoaiKhoImpl(
      freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SelectLoaiKhoImpl implements _SelectLoaiKho {
  const _$SelectLoaiKhoImpl(this.text);

  @override
  final String? text;

  @override
  String toString() {
    return 'SaleGdnEvent.selectLoaiKho(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectLoaiKhoImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectLoaiKhoImplCopyWith<_$SelectLoaiKhoImpl> get copyWith =>
      __$$SelectLoaiKhoImplCopyWithImpl<_$SelectLoaiKhoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return selectLoaiKho(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return selectLoaiKho?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (selectLoaiKho != null) {
      return selectLoaiKho(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return selectLoaiKho(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return selectLoaiKho?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (selectLoaiKho != null) {
      return selectLoaiKho(this);
    }
    return orElse();
  }
}

abstract class _SelectLoaiKho implements SaleGdnEvent {
  const factory _SelectLoaiKho(final String? text) = _$SelectLoaiKhoImpl;

  String? get text;
  @JsonKey(ignore: true)
  _$$SelectLoaiKhoImplCopyWith<_$SelectLoaiKhoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectProductTypeImplCopyWith<$Res> {
  factory _$$SelectProductTypeImplCopyWith(_$SelectProductTypeImpl value,
          $Res Function(_$SelectProductTypeImpl) then) =
      __$$SelectProductTypeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? productType});
}

/// @nodoc
class __$$SelectProductTypeImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$SelectProductTypeImpl>
    implements _$$SelectProductTypeImplCopyWith<$Res> {
  __$$SelectProductTypeImplCopyWithImpl(_$SelectProductTypeImpl _value,
      $Res Function(_$SelectProductTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productType = freezed,
  }) {
    return _then(_$SelectProductTypeImpl(
      freezed == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SelectProductTypeImpl implements _SelectProductType {
  const _$SelectProductTypeImpl(this.productType);

  @override
  final int? productType;

  @override
  String toString() {
    return 'SaleGdnEvent.selectProductType(productType: $productType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectProductTypeImpl &&
            (identical(other.productType, productType) ||
                other.productType == productType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectProductTypeImplCopyWith<_$SelectProductTypeImpl> get copyWith =>
      __$$SelectProductTypeImplCopyWithImpl<_$SelectProductTypeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return selectProductType(productType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return selectProductType?.call(productType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (selectProductType != null) {
      return selectProductType(productType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return selectProductType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return selectProductType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (selectProductType != null) {
      return selectProductType(this);
    }
    return orElse();
  }
}

abstract class _SelectProductType implements SaleGdnEvent {
  const factory _SelectProductType(final int? productType) =
      _$SelectProductTypeImpl;

  int? get productType;
  @JsonKey(ignore: true)
  _$$SelectProductTypeImplCopyWith<_$SelectProductTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectCustomerWithAddressImplCopyWith<$Res> {
  factory _$$SelectCustomerWithAddressImplCopyWith(
          _$SelectCustomerWithAddressImpl value,
          $Res Function(_$SelectCustomerWithAddressImpl) then) =
      __$$SelectCustomerWithAddressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? customerId, String? address});
}

/// @nodoc
class __$$SelectCustomerWithAddressImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$SelectCustomerWithAddressImpl>
    implements _$$SelectCustomerWithAddressImplCopyWith<$Res> {
  __$$SelectCustomerWithAddressImplCopyWithImpl(
      _$SelectCustomerWithAddressImpl _value,
      $Res Function(_$SelectCustomerWithAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? address = freezed,
  }) {
    return _then(_$SelectCustomerWithAddressImpl(
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SelectCustomerWithAddressImpl implements _SelectCustomerWithAddress {
  const _$SelectCustomerWithAddressImpl(
      {required this.customerId, this.address});

  @override
  final int? customerId;
  @override
  final String? address;

  @override
  String toString() {
    return 'SaleGdnEvent.selectCustomerWithAddress(customerId: $customerId, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectCustomerWithAddressImpl &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerId, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectCustomerWithAddressImplCopyWith<_$SelectCustomerWithAddressImpl>
      get copyWith => __$$SelectCustomerWithAddressImplCopyWithImpl<
          _$SelectCustomerWithAddressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return selectCustomerWithAddress(customerId, address);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return selectCustomerWithAddress?.call(customerId, address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (selectCustomerWithAddress != null) {
      return selectCustomerWithAddress(customerId, address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return selectCustomerWithAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return selectCustomerWithAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (selectCustomerWithAddress != null) {
      return selectCustomerWithAddress(this);
    }
    return orElse();
  }
}

abstract class _SelectCustomerWithAddress implements SaleGdnEvent {
  const factory _SelectCustomerWithAddress(
      {required final int? customerId,
      final String? address}) = _$SelectCustomerWithAddressImpl;

  int? get customerId;
  String? get address;
  @JsonKey(ignore: true)
  _$$SelectCustomerWithAddressImplCopyWith<_$SelectCustomerWithAddressImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchAddressStockByCustomerImplCopyWith<$Res> {
  factory _$$FetchAddressStockByCustomerImplCopyWith(
          _$FetchAddressStockByCustomerImpl value,
          $Res Function(_$FetchAddressStockByCustomerImpl) then) =
      __$$FetchAddressStockByCustomerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int customerId});
}

/// @nodoc
class __$$FetchAddressStockByCustomerImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$FetchAddressStockByCustomerImpl>
    implements _$$FetchAddressStockByCustomerImplCopyWith<$Res> {
  __$$FetchAddressStockByCustomerImplCopyWithImpl(
      _$FetchAddressStockByCustomerImpl _value,
      $Res Function(_$FetchAddressStockByCustomerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = null,
  }) {
    return _then(_$FetchAddressStockByCustomerImpl(
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchAddressStockByCustomerImpl
    implements _FetchAddressStockByCustomer {
  const _$FetchAddressStockByCustomerImpl({required this.customerId});

  @override
  final int customerId;

  @override
  String toString() {
    return 'SaleGdnEvent.fetchAddressStockByCustomer(customerId: $customerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAddressStockByCustomerImpl &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchAddressStockByCustomerImplCopyWith<_$FetchAddressStockByCustomerImpl>
      get copyWith => __$$FetchAddressStockByCustomerImplCopyWithImpl<
          _$FetchAddressStockByCustomerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return fetchAddressStockByCustomer(customerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return fetchAddressStockByCustomer?.call(customerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (fetchAddressStockByCustomer != null) {
      return fetchAddressStockByCustomer(customerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return fetchAddressStockByCustomer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return fetchAddressStockByCustomer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (fetchAddressStockByCustomer != null) {
      return fetchAddressStockByCustomer(this);
    }
    return orElse();
  }
}

abstract class _FetchAddressStockByCustomer implements SaleGdnEvent {
  const factory _FetchAddressStockByCustomer({required final int customerId}) =
      _$FetchAddressStockByCustomerImpl;

  int get customerId;
  @JsonKey(ignore: true)
  _$$FetchAddressStockByCustomerImplCopyWith<_$FetchAddressStockByCustomerImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleTransferInternalImplCopyWith<$Res> {
  factory _$$ToggleTransferInternalImplCopyWith(
          _$ToggleTransferInternalImpl value,
          $Res Function(_$ToggleTransferInternalImpl) then) =
      __$$ToggleTransferInternalImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool value});
}

/// @nodoc
class __$$ToggleTransferInternalImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$ToggleTransferInternalImpl>
    implements _$$ToggleTransferInternalImplCopyWith<$Res> {
  __$$ToggleTransferInternalImplCopyWithImpl(
      _$ToggleTransferInternalImpl _value,
      $Res Function(_$ToggleTransferInternalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$ToggleTransferInternalImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ToggleTransferInternalImpl implements _ToggleTransferInternal {
  const _$ToggleTransferInternalImpl({required this.value});

  @override
  final bool value;

  @override
  String toString() {
    return 'SaleGdnEvent.toggleTransferInternal(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleTransferInternalImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleTransferInternalImplCopyWith<_$ToggleTransferInternalImpl>
      get copyWith => __$$ToggleTransferInternalImplCopyWithImpl<
          _$ToggleTransferInternalImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return toggleTransferInternal(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return toggleTransferInternal?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (toggleTransferInternal != null) {
      return toggleTransferInternal(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return toggleTransferInternal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return toggleTransferInternal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (toggleTransferInternal != null) {
      return toggleTransferInternal(this);
    }
    return orElse();
  }
}

abstract class _ToggleTransferInternal implements SaleGdnEvent {
  const factory _ToggleTransferInternal({required final bool value}) =
      _$ToggleTransferInternalImpl;

  bool get value;
  @JsonKey(ignore: true)
  _$$ToggleTransferInternalImplCopyWith<_$ToggleTransferInternalImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleInternalImplCopyWith<$Res> {
  factory _$$ToggleInternalImplCopyWith(_$ToggleInternalImpl value,
          $Res Function(_$ToggleInternalImpl) then) =
      __$$ToggleInternalImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool value});
}

/// @nodoc
class __$$ToggleInternalImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$ToggleInternalImpl>
    implements _$$ToggleInternalImplCopyWith<$Res> {
  __$$ToggleInternalImplCopyWithImpl(
      _$ToggleInternalImpl _value, $Res Function(_$ToggleInternalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$ToggleInternalImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ToggleInternalImpl implements _ToggleInternal {
  const _$ToggleInternalImpl({required this.value});

  @override
  final bool value;

  @override
  String toString() {
    return 'SaleGdnEvent.toggleInternal(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleInternalImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleInternalImplCopyWith<_$ToggleInternalImpl> get copyWith =>
      __$$ToggleInternalImplCopyWithImpl<_$ToggleInternalImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return toggleInternal(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return toggleInternal?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (toggleInternal != null) {
      return toggleInternal(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return toggleInternal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return toggleInternal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (toggleInternal != null) {
      return toggleInternal(this);
    }
    return orElse();
  }
}

abstract class _ToggleInternal implements SaleGdnEvent {
  const factory _ToggleInternal({required final bool value}) =
      _$ToggleInternalImpl;

  bool get value;
  @JsonKey(ignore: true)
  _$$ToggleInternalImplCopyWith<_$ToggleInternalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectInternalWarehouseImplCopyWith<$Res> {
  factory _$$SelectInternalWarehouseImplCopyWith(
          _$SelectInternalWarehouseImpl value,
          $Res Function(_$SelectInternalWarehouseImpl) then) =
      __$$SelectInternalWarehouseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? warehouseId});
}

/// @nodoc
class __$$SelectInternalWarehouseImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$SelectInternalWarehouseImpl>
    implements _$$SelectInternalWarehouseImplCopyWith<$Res> {
  __$$SelectInternalWarehouseImplCopyWithImpl(
      _$SelectInternalWarehouseImpl _value,
      $Res Function(_$SelectInternalWarehouseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? warehouseId = freezed,
  }) {
    return _then(_$SelectInternalWarehouseImpl(
      freezed == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SelectInternalWarehouseImpl implements _SelectInternalWarehouse {
  const _$SelectInternalWarehouseImpl(this.warehouseId);

  @override
  final int? warehouseId;

  @override
  String toString() {
    return 'SaleGdnEvent.selectInternalWarehouse(warehouseId: $warehouseId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectInternalWarehouseImpl &&
            (identical(other.warehouseId, warehouseId) ||
                other.warehouseId == warehouseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, warehouseId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectInternalWarehouseImplCopyWith<_$SelectInternalWarehouseImpl>
      get copyWith => __$$SelectInternalWarehouseImplCopyWithImpl<
          _$SelectInternalWarehouseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return selectInternalWarehouse(warehouseId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return selectInternalWarehouse?.call(warehouseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (selectInternalWarehouse != null) {
      return selectInternalWarehouse(warehouseId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return selectInternalWarehouse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return selectInternalWarehouse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (selectInternalWarehouse != null) {
      return selectInternalWarehouse(this);
    }
    return orElse();
  }
}

abstract class _SelectInternalWarehouse implements SaleGdnEvent {
  const factory _SelectInternalWarehouse(final int? warehouseId) =
      _$SelectInternalWarehouseImpl;

  int? get warehouseId;
  @JsonKey(ignore: true)
  _$$SelectInternalWarehouseImplCopyWith<_$SelectInternalWarehouseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectInternalKhoTypeImplCopyWith<$Res> {
  factory _$$SelectInternalKhoTypeImplCopyWith(
          _$SelectInternalKhoTypeImpl value,
          $Res Function(_$SelectInternalKhoTypeImpl) then) =
      __$$SelectInternalKhoTypeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? khoTypeId});
}

/// @nodoc
class __$$SelectInternalKhoTypeImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$SelectInternalKhoTypeImpl>
    implements _$$SelectInternalKhoTypeImplCopyWith<$Res> {
  __$$SelectInternalKhoTypeImplCopyWithImpl(_$SelectInternalKhoTypeImpl _value,
      $Res Function(_$SelectInternalKhoTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? khoTypeId = freezed,
  }) {
    return _then(_$SelectInternalKhoTypeImpl(
      freezed == khoTypeId
          ? _value.khoTypeId
          : khoTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SelectInternalKhoTypeImpl implements _SelectInternalKhoType {
  const _$SelectInternalKhoTypeImpl(this.khoTypeId);

  @override
  final int? khoTypeId;

  @override
  String toString() {
    return 'SaleGdnEvent.selectInternalKhoType(khoTypeId: $khoTypeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectInternalKhoTypeImpl &&
            (identical(other.khoTypeId, khoTypeId) ||
                other.khoTypeId == khoTypeId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, khoTypeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectInternalKhoTypeImplCopyWith<_$SelectInternalKhoTypeImpl>
      get copyWith => __$$SelectInternalKhoTypeImplCopyWithImpl<
          _$SelectInternalKhoTypeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return selectInternalKhoType(khoTypeId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return selectInternalKhoType?.call(khoTypeId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (selectInternalKhoType != null) {
      return selectInternalKhoType(khoTypeId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return selectInternalKhoType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return selectInternalKhoType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (selectInternalKhoType != null) {
      return selectInternalKhoType(this);
    }
    return orElse();
  }
}

abstract class _SelectInternalKhoType implements SaleGdnEvent {
  const factory _SelectInternalKhoType(final int? khoTypeId) =
      _$SelectInternalKhoTypeImpl;

  int? get khoTypeId;
  @JsonKey(ignore: true)
  _$$SelectInternalKhoTypeImplCopyWith<_$SelectInternalKhoTypeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeDeliveryAddressImplCopyWith<$Res> {
  factory _$$ChangeDeliveryAddressImplCopyWith(
          _$ChangeDeliveryAddressImpl value,
          $Res Function(_$ChangeDeliveryAddressImpl) then) =
      __$$ChangeDeliveryAddressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? address});
}

/// @nodoc
class __$$ChangeDeliveryAddressImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$ChangeDeliveryAddressImpl>
    implements _$$ChangeDeliveryAddressImplCopyWith<$Res> {
  __$$ChangeDeliveryAddressImplCopyWithImpl(_$ChangeDeliveryAddressImpl _value,
      $Res Function(_$ChangeDeliveryAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = freezed,
  }) {
    return _then(_$ChangeDeliveryAddressImpl(
      freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ChangeDeliveryAddressImpl implements _ChangeDeliveryAddress {
  const _$ChangeDeliveryAddressImpl(this.address);

  @override
  final String? address;

  @override
  String toString() {
    return 'SaleGdnEvent.changeDeliveryAddress(address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeDeliveryAddressImpl &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeDeliveryAddressImplCopyWith<_$ChangeDeliveryAddressImpl>
      get copyWith => __$$ChangeDeliveryAddressImplCopyWithImpl<
          _$ChangeDeliveryAddressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return changeDeliveryAddress(address);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return changeDeliveryAddress?.call(address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (changeDeliveryAddress != null) {
      return changeDeliveryAddress(address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return changeDeliveryAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return changeDeliveryAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (changeDeliveryAddress != null) {
      return changeDeliveryAddress(this);
    }
    return orElse();
  }
}

abstract class _ChangeDeliveryAddress implements SaleGdnEvent {
  const factory _ChangeDeliveryAddress(final String? address) =
      _$ChangeDeliveryAddressImpl;

  String? get address;
  @JsonKey(ignore: true)
  _$$ChangeDeliveryAddressImplCopyWith<_$ChangeDeliveryAddressImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectNccImplCopyWith<$Res> {
  factory _$$SelectNccImplCopyWith(
          _$SelectNccImpl value, $Res Function(_$SelectNccImpl) then) =
      __$$SelectNccImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? nccId});
}

/// @nodoc
class __$$SelectNccImplCopyWithImpl<$Res>
    extends _$SaleGdnEventCopyWithImpl<$Res, _$SelectNccImpl>
    implements _$$SelectNccImplCopyWith<$Res> {
  __$$SelectNccImplCopyWithImpl(
      _$SelectNccImpl _value, $Res Function(_$SelectNccImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nccId = freezed,
  }) {
    return _then(_$SelectNccImpl(
      freezed == nccId
          ? _value.nccId
          : nccId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SelectNccImpl implements _SelectNcc {
  const _$SelectNccImpl(this.nccId);

  @override
  final int? nccId;

  @override
  String toString() {
    return 'SaleGdnEvent.selectNcc(nccId: $nccId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectNccImpl &&
            (identical(other.nccId, nccId) || other.nccId == nccId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nccId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectNccImplCopyWith<_$SelectNccImpl> get copyWith =>
      __$$SelectNccImplCopyWithImpl<_$SelectNccImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetchGdns,
    required TResult Function(String keyword) searchByKeyword,
    required TResult Function(String voucherNumber) searchByVoucherNumber,
    required TResult Function() clearSearch,
    required TResult Function(String code) scanQrToDetail,
    required TResult Function() clearOpenedDetail,
    required TResult Function() clearScanResultMessage,
    required TResult Function() fetchWarehouseTypes,
    required TResult Function(List<int> warehouseTypeIds) filterByWarehouseType,
    required TResult Function(int status) filterByStatus,
    required TResult Function() clearFilters,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(int id, BillExporResponse? bill) initDetail,
    required TResult Function(String? warehouseCode) setWarehouseCode,
    required TResult Function(int stt, List<String> imagePaths) addImages,
    required TResult Function(int? fileId, String? localPath) markImageToDelete,
    required TResult Function(Set<int> fileIds, Set<String> localPaths)
        markImagesToDeleteBulk,
    required TResult Function(int? fileId, String? localPath)
        unmarkImageToDelete,
    required TResult Function() submitImages,
    required TResult Function() clearUploadStatus,
    required TResult Function() fetchLookupData,
    required TResult Function() prefetchLookupData,
    required TResult Function() fetchUsers,
    required TResult Function(int? supplierId) selectSupplier,
    required TResult Function(int? senderId) selectSender,
    required TResult Function(int? receiverId) selectReceiver,
    required TResult Function(int? customerId) selectCustomer,
    required TResult Function(int? warehouseId) selectWarehouse,
    required TResult Function(int? khoTypeId) selectKhoType,
    required TResult Function(int? status) selectStatus,
    required TResult Function(int? projectId) selectProject,
    required TResult Function(DateTime? date) changeDeliveryDate,
    required TResult Function(DateTime? date) changeRequestDate,
    required TResult Function(DateTime? time) changeReceiveTime,
    required TResult Function(String? text) selectLoaiKho,
    required TResult Function(int? productType) selectProductType,
    required TResult Function(int? customerId, String? address)
        selectCustomerWithAddress,
    required TResult Function(int customerId) fetchAddressStockByCustomer,
    required TResult Function(bool value) toggleTransferInternal,
    required TResult Function(bool value) toggleInternal,
    required TResult Function(int? warehouseId) selectInternalWarehouse,
    required TResult Function(int? khoTypeId) selectInternalKhoType,
    required TResult Function(String? address) changeDeliveryAddress,
    required TResult Function(int? nccId) selectNcc,
  }) {
    return selectNcc(nccId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetchGdns,
    TResult? Function(String keyword)? searchByKeyword,
    TResult? Function(String voucherNumber)? searchByVoucherNumber,
    TResult? Function()? clearSearch,
    TResult? Function(String code)? scanQrToDetail,
    TResult? Function()? clearOpenedDetail,
    TResult? Function()? clearScanResultMessage,
    TResult? Function()? fetchWarehouseTypes,
    TResult? Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult? Function(int status)? filterByStatus,
    TResult? Function()? clearFilters,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id, BillExporResponse? bill)? initDetail,
    TResult? Function(String? warehouseCode)? setWarehouseCode,
    TResult? Function(int stt, List<String> imagePaths)? addImages,
    TResult? Function(int? fileId, String? localPath)? markImageToDelete,
    TResult? Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult? Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult? Function()? submitImages,
    TResult? Function()? clearUploadStatus,
    TResult? Function()? fetchLookupData,
    TResult? Function()? prefetchLookupData,
    TResult? Function()? fetchUsers,
    TResult? Function(int? supplierId)? selectSupplier,
    TResult? Function(int? senderId)? selectSender,
    TResult? Function(int? receiverId)? selectReceiver,
    TResult? Function(int? customerId)? selectCustomer,
    TResult? Function(int? warehouseId)? selectWarehouse,
    TResult? Function(int? khoTypeId)? selectKhoType,
    TResult? Function(int? status)? selectStatus,
    TResult? Function(int? projectId)? selectProject,
    TResult? Function(DateTime? date)? changeDeliveryDate,
    TResult? Function(DateTime? date)? changeRequestDate,
    TResult? Function(DateTime? time)? changeReceiveTime,
    TResult? Function(String? text)? selectLoaiKho,
    TResult? Function(int? productType)? selectProductType,
    TResult? Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult? Function(int customerId)? fetchAddressStockByCustomer,
    TResult? Function(bool value)? toggleTransferInternal,
    TResult? Function(bool value)? toggleInternal,
    TResult? Function(int? warehouseId)? selectInternalWarehouse,
    TResult? Function(int? khoTypeId)? selectInternalKhoType,
    TResult? Function(String? address)? changeDeliveryAddress,
    TResult? Function(int? nccId)? selectNcc,
  }) {
    return selectNcc?.call(nccId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetchGdns,
    TResult Function(String keyword)? searchByKeyword,
    TResult Function(String voucherNumber)? searchByVoucherNumber,
    TResult Function()? clearSearch,
    TResult Function(String code)? scanQrToDetail,
    TResult Function()? clearOpenedDetail,
    TResult Function()? clearScanResultMessage,
    TResult Function()? fetchWarehouseTypes,
    TResult Function(List<int> warehouseTypeIds)? filterByWarehouseType,
    TResult Function(int status)? filterByStatus,
    TResult Function()? clearFilters,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id, BillExporResponse? bill)? initDetail,
    TResult Function(String? warehouseCode)? setWarehouseCode,
    TResult Function(int stt, List<String> imagePaths)? addImages,
    TResult Function(int? fileId, String? localPath)? markImageToDelete,
    TResult Function(Set<int> fileIds, Set<String> localPaths)?
        markImagesToDeleteBulk,
    TResult Function(int? fileId, String? localPath)? unmarkImageToDelete,
    TResult Function()? submitImages,
    TResult Function()? clearUploadStatus,
    TResult Function()? fetchLookupData,
    TResult Function()? prefetchLookupData,
    TResult Function()? fetchUsers,
    TResult Function(int? supplierId)? selectSupplier,
    TResult Function(int? senderId)? selectSender,
    TResult Function(int? receiverId)? selectReceiver,
    TResult Function(int? customerId)? selectCustomer,
    TResult Function(int? warehouseId)? selectWarehouse,
    TResult Function(int? khoTypeId)? selectKhoType,
    TResult Function(int? status)? selectStatus,
    TResult Function(int? projectId)? selectProject,
    TResult Function(DateTime? date)? changeDeliveryDate,
    TResult Function(DateTime? date)? changeRequestDate,
    TResult Function(DateTime? time)? changeReceiveTime,
    TResult Function(String? text)? selectLoaiKho,
    TResult Function(int? productType)? selectProductType,
    TResult Function(int? customerId, String? address)?
        selectCustomerWithAddress,
    TResult Function(int customerId)? fetchAddressStockByCustomer,
    TResult Function(bool value)? toggleTransferInternal,
    TResult Function(bool value)? toggleInternal,
    TResult Function(int? warehouseId)? selectInternalWarehouse,
    TResult Function(int? khoTypeId)? selectInternalKhoType,
    TResult Function(String? address)? changeDeliveryAddress,
    TResult Function(int? nccId)? selectNcc,
    required TResult orElse(),
  }) {
    if (selectNcc != null) {
      return selectNcc(nccId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FetchGdns value) fetchGdns,
    required TResult Function(_SearchByKeyword value) searchByKeyword,
    required TResult Function(_SearchByVoucherNumber value)
        searchByVoucherNumber,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ScanQrToDetail value) scanQrToDetail,
    required TResult Function(_ClearOpenedDetail value) clearOpenedDetail,
    required TResult Function(_ClearScanResultMessage value)
        clearScanResultMessage,
    required TResult Function(_FetchWarehouseTypes value) fetchWarehouseTypes,
    required TResult Function(_FilterByWarehouseType value)
        filterByWarehouseType,
    required TResult Function(_FilterByStatus value) filterByStatus,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_InitDetail value) initDetail,
    required TResult Function(_SetWarehouseCode value) setWarehouseCode,
    required TResult Function(_AddImages value) addImages,
    required TResult Function(_MarkImageToDelete value) markImageToDelete,
    required TResult Function(_MarkImagesToDeleteBulk value)
        markImagesToDeleteBulk,
    required TResult Function(_UnmarkImageToDelete value) unmarkImageToDelete,
    required TResult Function(_SubmitImages value) submitImages,
    required TResult Function(_ClearUploadStatus value) clearUploadStatus,
    required TResult Function(_FetchLookupData value) fetchLookupData,
    required TResult Function(_PrefetchLookupData value) prefetchLookupData,
    required TResult Function(_FetchUsers value) fetchUsers,
    required TResult Function(_SelectSupplier value) selectSupplier,
    required TResult Function(_SelectSender value) selectSender,
    required TResult Function(_SelectReceiver value) selectReceiver,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_SelectKhoType value) selectKhoType,
    required TResult Function(_SelectStatus value) selectStatus,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_ChangeDeliveryDate value) changeDeliveryDate,
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeReceiveTime value) changeReceiveTime,
    required TResult Function(_SelectLoaiKho value) selectLoaiKho,
    required TResult Function(_SelectProductType value) selectProductType,
    required TResult Function(_SelectCustomerWithAddress value)
        selectCustomerWithAddress,
    required TResult Function(_FetchAddressStockByCustomer value)
        fetchAddressStockByCustomer,
    required TResult Function(_ToggleTransferInternal value)
        toggleTransferInternal,
    required TResult Function(_ToggleInternal value) toggleInternal,
    required TResult Function(_SelectInternalWarehouse value)
        selectInternalWarehouse,
    required TResult Function(_SelectInternalKhoType value)
        selectInternalKhoType,
    required TResult Function(_ChangeDeliveryAddress value)
        changeDeliveryAddress,
    required TResult Function(_SelectNcc value) selectNcc,
  }) {
    return selectNcc(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FetchGdns value)? fetchGdns,
    TResult? Function(_SearchByKeyword value)? searchByKeyword,
    TResult? Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult? Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult? Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult? Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult? Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult? Function(_FilterByStatus value)? filterByStatus,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_InitDetail value)? initDetail,
    TResult? Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult? Function(_AddImages value)? addImages,
    TResult? Function(_MarkImageToDelete value)? markImageToDelete,
    TResult? Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult? Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult? Function(_SubmitImages value)? submitImages,
    TResult? Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult? Function(_FetchLookupData value)? fetchLookupData,
    TResult? Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult? Function(_FetchUsers value)? fetchUsers,
    TResult? Function(_SelectSupplier value)? selectSupplier,
    TResult? Function(_SelectSender value)? selectSender,
    TResult? Function(_SelectReceiver value)? selectReceiver,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_SelectKhoType value)? selectKhoType,
    TResult? Function(_SelectStatus value)? selectStatus,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult? Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult? Function(_SelectProductType value)? selectProductType,
    TResult? Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult? Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult? Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult? Function(_ToggleInternal value)? toggleInternal,
    TResult? Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult? Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult? Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult? Function(_SelectNcc value)? selectNcc,
  }) {
    return selectNcc?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FetchGdns value)? fetchGdns,
    TResult Function(_SearchByKeyword value)? searchByKeyword,
    TResult Function(_SearchByVoucherNumber value)? searchByVoucherNumber,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ScanQrToDetail value)? scanQrToDetail,
    TResult Function(_ClearOpenedDetail value)? clearOpenedDetail,
    TResult Function(_ClearScanResultMessage value)? clearScanResultMessage,
    TResult Function(_FetchWarehouseTypes value)? fetchWarehouseTypes,
    TResult Function(_FilterByWarehouseType value)? filterByWarehouseType,
    TResult Function(_FilterByStatus value)? filterByStatus,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_InitDetail value)? initDetail,
    TResult Function(_SetWarehouseCode value)? setWarehouseCode,
    TResult Function(_AddImages value)? addImages,
    TResult Function(_MarkImageToDelete value)? markImageToDelete,
    TResult Function(_MarkImagesToDeleteBulk value)? markImagesToDeleteBulk,
    TResult Function(_UnmarkImageToDelete value)? unmarkImageToDelete,
    TResult Function(_SubmitImages value)? submitImages,
    TResult Function(_ClearUploadStatus value)? clearUploadStatus,
    TResult Function(_FetchLookupData value)? fetchLookupData,
    TResult Function(_PrefetchLookupData value)? prefetchLookupData,
    TResult Function(_FetchUsers value)? fetchUsers,
    TResult Function(_SelectSupplier value)? selectSupplier,
    TResult Function(_SelectSender value)? selectSender,
    TResult Function(_SelectReceiver value)? selectReceiver,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_SelectKhoType value)? selectKhoType,
    TResult Function(_SelectStatus value)? selectStatus,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_ChangeDeliveryDate value)? changeDeliveryDate,
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeReceiveTime value)? changeReceiveTime,
    TResult Function(_SelectLoaiKho value)? selectLoaiKho,
    TResult Function(_SelectProductType value)? selectProductType,
    TResult Function(_SelectCustomerWithAddress value)?
        selectCustomerWithAddress,
    TResult Function(_FetchAddressStockByCustomer value)?
        fetchAddressStockByCustomer,
    TResult Function(_ToggleTransferInternal value)? toggleTransferInternal,
    TResult Function(_ToggleInternal value)? toggleInternal,
    TResult Function(_SelectInternalWarehouse value)? selectInternalWarehouse,
    TResult Function(_SelectInternalKhoType value)? selectInternalKhoType,
    TResult Function(_ChangeDeliveryAddress value)? changeDeliveryAddress,
    TResult Function(_SelectNcc value)? selectNcc,
    required TResult orElse(),
  }) {
    if (selectNcc != null) {
      return selectNcc(this);
    }
    return orElse();
  }
}

abstract class _SelectNcc implements SaleGdnEvent {
  const factory _SelectNcc(final int? nccId) = _$SelectNccImpl;

  int? get nccId;
  @JsonKey(ignore: true)
  _$$SelectNccImplCopyWith<_$SelectNccImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
