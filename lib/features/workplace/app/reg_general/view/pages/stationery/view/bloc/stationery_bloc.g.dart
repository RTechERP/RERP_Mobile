// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stationery_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StationeryStateCWProxy {
  StationeryState status(BaseStateStatus status);

  StationeryState message(String? message);

  StationeryState stationery(List<StationeryItem> stationery);

  StationeryState stationeryDetail(List<StationeryDetailItem> stationeryDetail);

  StationeryState stationerySupply(List<StationerySupplyItem> stationerySupply);

  StationeryState selectedMonth(DateTime? selectedMonth);

  StationeryState dateRegister(DateTime? dateRegister);

  StationeryState slips(List<StationerySlip> slips);

  StationeryState editItemId(int? editItemId);

  StationeryState supplyRequiredValidated(bool supplyRequiredValidated);

  StationeryState isAdmin(bool isAdmin);

  StationeryState isSubmitting(bool isSubmitting);

  StationeryState submitSuccess(bool submitSuccess);

  StationeryState isDeleting(bool isDeleting);

  StationeryState deleteSuccess(bool deleteSuccess);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StationeryState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StationeryState(...).copyWith(id: 12, name: "My name")
  /// ````
  StationeryState call({
    BaseStateStatus? status,
    String? message,
    List<StationeryItem>? stationery,
    List<StationeryDetailItem>? stationeryDetail,
    List<StationerySupplyItem>? stationerySupply,
    DateTime? selectedMonth,
    DateTime? dateRegister,
    List<StationerySlip>? slips,
    int? editItemId,
    bool? supplyRequiredValidated,
    bool? isAdmin,
    bool? isSubmitting,
    bool? submitSuccess,
    bool? isDeleting,
    bool? deleteSuccess,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStationeryState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStationeryState.copyWith.fieldName(...)`
class _$StationeryStateCWProxyImpl implements _$StationeryStateCWProxy {
  const _$StationeryStateCWProxyImpl(this._value);

  final StationeryState _value;

  @override
  StationeryState status(BaseStateStatus status) => this(status: status);

  @override
  StationeryState message(String? message) => this(message: message);

  @override
  StationeryState stationery(List<StationeryItem> stationery) =>
      this(stationery: stationery);

  @override
  StationeryState stationeryDetail(
          List<StationeryDetailItem> stationeryDetail) =>
      this(stationeryDetail: stationeryDetail);

  @override
  StationeryState stationerySupply(
          List<StationerySupplyItem> stationerySupply) =>
      this(stationerySupply: stationerySupply);

  @override
  StationeryState selectedMonth(DateTime? selectedMonth) =>
      this(selectedMonth: selectedMonth);

  @override
  StationeryState dateRegister(DateTime? dateRegister) =>
      this(dateRegister: dateRegister);

  @override
  StationeryState slips(List<StationerySlip> slips) => this(slips: slips);

  @override
  StationeryState editItemId(int? editItemId) => this(editItemId: editItemId);

  @override
  StationeryState supplyRequiredValidated(bool supplyRequiredValidated) =>
      this(supplyRequiredValidated: supplyRequiredValidated);

  @override
  StationeryState isAdmin(bool isAdmin) => this(isAdmin: isAdmin);

  @override
  StationeryState isSubmitting(bool isSubmitting) =>
      this(isSubmitting: isSubmitting);

  @override
  StationeryState submitSuccess(bool submitSuccess) =>
      this(submitSuccess: submitSuccess);

  @override
  StationeryState isDeleting(bool isDeleting) => this(isDeleting: isDeleting);

  @override
  StationeryState deleteSuccess(bool deleteSuccess) =>
      this(deleteSuccess: deleteSuccess);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StationeryState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StationeryState(...).copyWith(id: 12, name: "My name")
  /// ````
  StationeryState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? stationery = const $CopyWithPlaceholder(),
    Object? stationeryDetail = const $CopyWithPlaceholder(),
    Object? stationerySupply = const $CopyWithPlaceholder(),
    Object? selectedMonth = const $CopyWithPlaceholder(),
    Object? dateRegister = const $CopyWithPlaceholder(),
    Object? slips = const $CopyWithPlaceholder(),
    Object? editItemId = const $CopyWithPlaceholder(),
    Object? supplyRequiredValidated = const $CopyWithPlaceholder(),
    Object? isAdmin = const $CopyWithPlaceholder(),
    Object? isSubmitting = const $CopyWithPlaceholder(),
    Object? submitSuccess = const $CopyWithPlaceholder(),
    Object? isDeleting = const $CopyWithPlaceholder(),
    Object? deleteSuccess = const $CopyWithPlaceholder(),
  }) {
    return StationeryState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      stationery:
          stationery == const $CopyWithPlaceholder() || stationery == null
              ? _value.stationery
              // ignore: cast_nullable_to_non_nullable
              : stationery as List<StationeryItem>,
      stationeryDetail: stationeryDetail == const $CopyWithPlaceholder() ||
              stationeryDetail == null
          ? _value.stationeryDetail
          // ignore: cast_nullable_to_non_nullable
          : stationeryDetail as List<StationeryDetailItem>,
      stationerySupply: stationerySupply == const $CopyWithPlaceholder() ||
              stationerySupply == null
          ? _value.stationerySupply
          // ignore: cast_nullable_to_non_nullable
          : stationerySupply as List<StationerySupplyItem>,
      selectedMonth: selectedMonth == const $CopyWithPlaceholder()
          ? _value.selectedMonth
          // ignore: cast_nullable_to_non_nullable
          : selectedMonth as DateTime?,
      dateRegister: dateRegister == const $CopyWithPlaceholder()
          ? _value.dateRegister
          // ignore: cast_nullable_to_non_nullable
          : dateRegister as DateTime?,
      slips: slips == const $CopyWithPlaceholder() || slips == null
          ? _value.slips
          // ignore: cast_nullable_to_non_nullable
          : slips as List<StationerySlip>,
      editItemId: editItemId == const $CopyWithPlaceholder()
          ? _value.editItemId
          // ignore: cast_nullable_to_non_nullable
          : editItemId as int?,
      supplyRequiredValidated:
          supplyRequiredValidated == const $CopyWithPlaceholder() ||
                  supplyRequiredValidated == null
              ? _value.supplyRequiredValidated
              // ignore: cast_nullable_to_non_nullable
              : supplyRequiredValidated as bool,
      isAdmin: isAdmin == const $CopyWithPlaceholder() || isAdmin == null
          ? _value.isAdmin
          // ignore: cast_nullable_to_non_nullable
          : isAdmin as bool,
      isSubmitting:
          isSubmitting == const $CopyWithPlaceholder() || isSubmitting == null
              ? _value.isSubmitting
              // ignore: cast_nullable_to_non_nullable
              : isSubmitting as bool,
      submitSuccess:
          submitSuccess == const $CopyWithPlaceholder() || submitSuccess == null
              ? _value.submitSuccess
              // ignore: cast_nullable_to_non_nullable
              : submitSuccess as bool,
      isDeleting:
          isDeleting == const $CopyWithPlaceholder() || isDeleting == null
              ? _value.isDeleting
              // ignore: cast_nullable_to_non_nullable
              : isDeleting as bool,
      deleteSuccess:
          deleteSuccess == const $CopyWithPlaceholder() || deleteSuccess == null
              ? _value.deleteSuccess
              // ignore: cast_nullable_to_non_nullable
              : deleteSuccess as bool,
    );
  }
}

extension $StationeryStateCopyWith on StationeryState {
  /// Returns a callable class that can be used as follows: `instanceOfStationeryState.copyWith(...)` or like so:`instanceOfStationeryState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StationeryStateCWProxy get copyWith => _$StationeryStateCWProxyImpl(this);
}
