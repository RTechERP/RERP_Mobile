// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approve_purchasing_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ApprovePurchasingStateCWProxy {
  ApprovePurchasingState status(BaseStateStatus status);

  ApprovePurchasingState message(String? message);

  ApprovePurchasingState requestTypes(
      List<ApprovePurchasingRequestTypeItem> requestTypes);

  ApprovePurchasingState selectedRequestTypeId(int? selectedRequestTypeId);

  ApprovePurchasingState itemsByType(
      Map<int, List<ApprovePurchasingItem>> itemsByType);

  ApprovePurchasingState items(List<ApprovePurchasingItem> items);

  ApprovePurchasingState dateStart(DateTime? dateStart);

  ApprovePurchasingState dateEnd(DateTime? dateEnd);

  ApprovePurchasingState isRefreshing(bool isRefreshing);

  ApprovePurchasingState currencies(List<CurrencyItem> currencies);

  ApprovePurchasingState productGroups(List<ProductGroupItem> productGroups);

  ApprovePurchasingState suppliers(List<SupplierItem> suppliers);

  ApprovePurchasingState projects(List<ProjectFilterItem> projects);

  ApprovePurchasingState filter(PurchasingFilter filter);

  ApprovePurchasingState filteredItems(
      List<ApprovePurchasingItem> filteredItems);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ApprovePurchasingState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ApprovePurchasingState(...).copyWith(id: 12, name: "My name")
  /// ````
  ApprovePurchasingState call({
    BaseStateStatus? status,
    String? message,
    List<ApprovePurchasingRequestTypeItem>? requestTypes,
    int? selectedRequestTypeId,
    Map<int, List<ApprovePurchasingItem>>? itemsByType,
    List<ApprovePurchasingItem>? items,
    DateTime? dateStart,
    DateTime? dateEnd,
    bool? isRefreshing,
    List<CurrencyItem>? currencies,
    List<ProductGroupItem>? productGroups,
    List<SupplierItem>? suppliers,
    List<ProjectFilterItem>? projects,
    PurchasingFilter? filter,
    List<ApprovePurchasingItem>? filteredItems,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfApprovePurchasingState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfApprovePurchasingState.copyWith.fieldName(...)`
class _$ApprovePurchasingStateCWProxyImpl
    implements _$ApprovePurchasingStateCWProxy {
  const _$ApprovePurchasingStateCWProxyImpl(this._value);

  final ApprovePurchasingState _value;

  @override
  ApprovePurchasingState status(BaseStateStatus status) => this(status: status);

  @override
  ApprovePurchasingState message(String? message) => this(message: message);

  @override
  ApprovePurchasingState requestTypes(
          List<ApprovePurchasingRequestTypeItem> requestTypes) =>
      this(requestTypes: requestTypes);

  @override
  ApprovePurchasingState selectedRequestTypeId(int? selectedRequestTypeId) =>
      this(selectedRequestTypeId: selectedRequestTypeId);

  @override
  ApprovePurchasingState itemsByType(
          Map<int, List<ApprovePurchasingItem>> itemsByType) =>
      this(itemsByType: itemsByType);

  @override
  ApprovePurchasingState items(List<ApprovePurchasingItem> items) =>
      this(items: items);

  @override
  ApprovePurchasingState dateStart(DateTime? dateStart) =>
      this(dateStart: dateStart);

  @override
  ApprovePurchasingState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  ApprovePurchasingState isRefreshing(bool isRefreshing) =>
      this(isRefreshing: isRefreshing);

  @override
  ApprovePurchasingState currencies(List<CurrencyItem> currencies) =>
      this(currencies: currencies);

  @override
  ApprovePurchasingState productGroups(List<ProductGroupItem> productGroups) =>
      this(productGroups: productGroups);

  @override
  ApprovePurchasingState suppliers(List<SupplierItem> suppliers) =>
      this(suppliers: suppliers);

  @override
  ApprovePurchasingState projects(List<ProjectFilterItem> projects) =>
      this(projects: projects);

  @override
  ApprovePurchasingState filter(PurchasingFilter filter) =>
      this(filter: filter);

  @override
  ApprovePurchasingState filteredItems(
          List<ApprovePurchasingItem> filteredItems) =>
      this(filteredItems: filteredItems);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ApprovePurchasingState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ApprovePurchasingState(...).copyWith(id: 12, name: "My name")
  /// ````
  ApprovePurchasingState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? requestTypes = const $CopyWithPlaceholder(),
    Object? selectedRequestTypeId = const $CopyWithPlaceholder(),
    Object? itemsByType = const $CopyWithPlaceholder(),
    Object? items = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? isRefreshing = const $CopyWithPlaceholder(),
    Object? currencies = const $CopyWithPlaceholder(),
    Object? productGroups = const $CopyWithPlaceholder(),
    Object? suppliers = const $CopyWithPlaceholder(),
    Object? projects = const $CopyWithPlaceholder(),
    Object? filter = const $CopyWithPlaceholder(),
    Object? filteredItems = const $CopyWithPlaceholder(),
  }) {
    return ApprovePurchasingState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      requestTypes:
          requestTypes == const $CopyWithPlaceholder() || requestTypes == null
              ? _value.requestTypes
              // ignore: cast_nullable_to_non_nullable
              : requestTypes as List<ApprovePurchasingRequestTypeItem>,
      selectedRequestTypeId:
          selectedRequestTypeId == const $CopyWithPlaceholder()
              ? _value.selectedRequestTypeId
              // ignore: cast_nullable_to_non_nullable
              : selectedRequestTypeId as int?,
      itemsByType:
          itemsByType == const $CopyWithPlaceholder() || itemsByType == null
              ? _value.itemsByType
              // ignore: cast_nullable_to_non_nullable
              : itemsByType as Map<int, List<ApprovePurchasingItem>>,
      items: items == const $CopyWithPlaceholder() || items == null
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<ApprovePurchasingItem>,
      dateStart: dateStart == const $CopyWithPlaceholder()
          ? _value.dateStart
          // ignore: cast_nullable_to_non_nullable
          : dateStart as DateTime?,
      dateEnd: dateEnd == const $CopyWithPlaceholder()
          ? _value.dateEnd
          // ignore: cast_nullable_to_non_nullable
          : dateEnd as DateTime?,
      isRefreshing:
          isRefreshing == const $CopyWithPlaceholder() || isRefreshing == null
              ? _value.isRefreshing
              // ignore: cast_nullable_to_non_nullable
              : isRefreshing as bool,
      currencies:
          currencies == const $CopyWithPlaceholder() || currencies == null
              ? _value.currencies
              // ignore: cast_nullable_to_non_nullable
              : currencies as List<CurrencyItem>,
      productGroups:
          productGroups == const $CopyWithPlaceholder() || productGroups == null
              ? _value.productGroups
              // ignore: cast_nullable_to_non_nullable
              : productGroups as List<ProductGroupItem>,
      suppliers: suppliers == const $CopyWithPlaceholder() || suppliers == null
          ? _value.suppliers
          // ignore: cast_nullable_to_non_nullable
          : suppliers as List<SupplierItem>,
      projects: projects == const $CopyWithPlaceholder() || projects == null
          ? _value.projects
          // ignore: cast_nullable_to_non_nullable
          : projects as List<ProjectFilterItem>,
      filter: filter == const $CopyWithPlaceholder() || filter == null
          ? _value.filter
          // ignore: cast_nullable_to_non_nullable
          : filter as PurchasingFilter,
      filteredItems:
          filteredItems == const $CopyWithPlaceholder() || filteredItems == null
              ? _value.filteredItems
              // ignore: cast_nullable_to_non_nullable
              : filteredItems as List<ApprovePurchasingItem>,
    );
  }
}

extension $ApprovePurchasingStateCopyWith on ApprovePurchasingState {
  /// Returns a callable class that can be used as follows: `instanceOfApprovePurchasingState.copyWith(...)` or like so:`instanceOfApprovePurchasingState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ApprovePurchasingStateCWProxy get copyWith =>
      _$ApprovePurchasingStateCWProxyImpl(this);
}
