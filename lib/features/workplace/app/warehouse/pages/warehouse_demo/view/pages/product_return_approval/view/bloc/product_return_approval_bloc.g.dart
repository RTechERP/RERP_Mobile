// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_return_approval_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProductReturnApprovalStateCWProxy {
  ProductReturnApprovalState status(BaseStateStatus status);

  ProductReturnApprovalState message(String? message);

  ProductReturnApprovalState items(List<ProductReturnHistoryItem> items);

  ProductReturnApprovalState employees(List<ProductReturnEmployee> employees);

  ProductReturnApprovalState searchKeyword(String searchKeyword);

  ProductReturnApprovalState employeeId(int? employeeId);

  ProductReturnApprovalState warehouseId(int? warehouseId);

  ProductReturnApprovalState dateStart(DateTime? dateStart);

  ProductReturnApprovalState dateEnd(DateTime? dateEnd);

  ProductReturnApprovalState selectedIds(Set<int> selectedIds);

  ProductReturnApprovalState isApproving(bool isApproving);

  ProductReturnApprovalState approveTotal(int approveTotal);

  ProductReturnApprovalState approvedCount(int approvedCount);

  ProductReturnApprovalState failedCount(int failedCount);

  ProductReturnApprovalState isRefreshing(bool isRefreshing);

  ProductReturnApprovalState approveRound(int approveRound);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductReturnApprovalState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductReturnApprovalState(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductReturnApprovalState call({
    BaseStateStatus? status,
    String? message,
    List<ProductReturnHistoryItem>? items,
    List<ProductReturnEmployee>? employees,
    String? searchKeyword,
    int? employeeId,
    int? warehouseId,
    DateTime? dateStart,
    DateTime? dateEnd,
    Set<int>? selectedIds,
    bool? isApproving,
    int? approveTotal,
    int? approvedCount,
    int? failedCount,
    bool? isRefreshing,
    int? approveRound,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProductReturnApprovalState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProductReturnApprovalState.copyWith.fieldName(...)`
class _$ProductReturnApprovalStateCWProxyImpl
    implements _$ProductReturnApprovalStateCWProxy {
  const _$ProductReturnApprovalStateCWProxyImpl(this._value);

  final ProductReturnApprovalState _value;

  @override
  ProductReturnApprovalState status(BaseStateStatus status) =>
      this(status: status);

  @override
  ProductReturnApprovalState message(String? message) => this(message: message);

  @override
  ProductReturnApprovalState items(List<ProductReturnHistoryItem> items) =>
      this(items: items);

  @override
  ProductReturnApprovalState employees(List<ProductReturnEmployee> employees) =>
      this(employees: employees);

  @override
  ProductReturnApprovalState searchKeyword(String searchKeyword) =>
      this(searchKeyword: searchKeyword);

  @override
  ProductReturnApprovalState employeeId(int? employeeId) =>
      this(employeeId: employeeId);

  @override
  ProductReturnApprovalState warehouseId(int? warehouseId) =>
      this(warehouseId: warehouseId);

  @override
  ProductReturnApprovalState dateStart(DateTime? dateStart) =>
      this(dateStart: dateStart);

  @override
  ProductReturnApprovalState dateEnd(DateTime? dateEnd) =>
      this(dateEnd: dateEnd);

  @override
  ProductReturnApprovalState selectedIds(Set<int> selectedIds) =>
      this(selectedIds: selectedIds);

  @override
  ProductReturnApprovalState isApproving(bool isApproving) =>
      this(isApproving: isApproving);

  @override
  ProductReturnApprovalState approveTotal(int approveTotal) =>
      this(approveTotal: approveTotal);

  @override
  ProductReturnApprovalState approvedCount(int approvedCount) =>
      this(approvedCount: approvedCount);

  @override
  ProductReturnApprovalState failedCount(int failedCount) =>
      this(failedCount: failedCount);

  @override
  ProductReturnApprovalState isRefreshing(bool isRefreshing) =>
      this(isRefreshing: isRefreshing);

  @override
  ProductReturnApprovalState approveRound(int approveRound) =>
      this(approveRound: approveRound);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductReturnApprovalState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductReturnApprovalState(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductReturnApprovalState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? items = const $CopyWithPlaceholder(),
    Object? employees = const $CopyWithPlaceholder(),
    Object? searchKeyword = const $CopyWithPlaceholder(),
    Object? employeeId = const $CopyWithPlaceholder(),
    Object? warehouseId = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? selectedIds = const $CopyWithPlaceholder(),
    Object? isApproving = const $CopyWithPlaceholder(),
    Object? approveTotal = const $CopyWithPlaceholder(),
    Object? approvedCount = const $CopyWithPlaceholder(),
    Object? failedCount = const $CopyWithPlaceholder(),
    Object? isRefreshing = const $CopyWithPlaceholder(),
    Object? approveRound = const $CopyWithPlaceholder(),
  }) {
    return ProductReturnApprovalState(
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
          : items as List<ProductReturnHistoryItem>,
      employees: employees == const $CopyWithPlaceholder() || employees == null
          ? _value.employees
          // ignore: cast_nullable_to_non_nullable
          : employees as List<ProductReturnEmployee>,
      searchKeyword:
          searchKeyword == const $CopyWithPlaceholder() || searchKeyword == null
          ? _value.searchKeyword
          // ignore: cast_nullable_to_non_nullable
          : searchKeyword as String,
      employeeId: employeeId == const $CopyWithPlaceholder()
          ? _value.employeeId
          // ignore: cast_nullable_to_non_nullable
          : employeeId as int?,
      warehouseId: warehouseId == const $CopyWithPlaceholder()
          ? _value.warehouseId
          // ignore: cast_nullable_to_non_nullable
          : warehouseId as int?,
      dateStart: dateStart == const $CopyWithPlaceholder()
          ? _value.dateStart
          // ignore: cast_nullable_to_non_nullable
          : dateStart as DateTime?,
      dateEnd: dateEnd == const $CopyWithPlaceholder()
          ? _value.dateEnd
          // ignore: cast_nullable_to_non_nullable
          : dateEnd as DateTime?,
      selectedIds:
          selectedIds == const $CopyWithPlaceholder() || selectedIds == null
          ? _value.selectedIds
          // ignore: cast_nullable_to_non_nullable
          : selectedIds as Set<int>,
      isApproving:
          isApproving == const $CopyWithPlaceholder() || isApproving == null
          ? _value.isApproving
          // ignore: cast_nullable_to_non_nullable
          : isApproving as bool,
      approveTotal:
          approveTotal == const $CopyWithPlaceholder() || approveTotal == null
          ? _value.approveTotal
          // ignore: cast_nullable_to_non_nullable
          : approveTotal as int,
      approvedCount:
          approvedCount == const $CopyWithPlaceholder() || approvedCount == null
          ? _value.approvedCount
          // ignore: cast_nullable_to_non_nullable
          : approvedCount as int,
      failedCount:
          failedCount == const $CopyWithPlaceholder() || failedCount == null
          ? _value.failedCount
          // ignore: cast_nullable_to_non_nullable
          : failedCount as int,
      isRefreshing:
          isRefreshing == const $CopyWithPlaceholder() || isRefreshing == null
          ? _value.isRefreshing
          // ignore: cast_nullable_to_non_nullable
          : isRefreshing as bool,
      approveRound:
          approveRound == const $CopyWithPlaceholder() || approveRound == null
          ? _value.approveRound
          // ignore: cast_nullable_to_non_nullable
          : approveRound as int,
    );
  }
}

extension $ProductReturnApprovalStateCopyWith on ProductReturnApprovalState {
  /// Returns a callable class that can be used as follows: `instanceOfProductReturnApprovalState.copyWith(...)` or like so:`instanceOfProductReturnApprovalState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProductReturnApprovalStateCWProxy get copyWith =>
      _$ProductReturnApprovalStateCWProxyImpl(this);
}
