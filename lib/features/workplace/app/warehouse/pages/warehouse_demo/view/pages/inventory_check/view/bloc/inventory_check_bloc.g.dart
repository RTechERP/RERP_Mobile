// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_check_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InventoryCheckStateCWProxy {
  InventoryCheckState status(BaseStateStatus status);

  InventoryCheckState message(String? message);

  InventoryCheckState items(List<InventoryCountItem> items);

  InventoryCheckState employees(List<InventoryCheckEmployee> employees);

  InventoryCheckState searchKeyword(String searchKeyword);

  InventoryCheckState employeeId(int? employeeId);

  InventoryCheckState warehouseId(int? warehouseId);

  InventoryCheckState dateStart(DateTime? dateStart);

  InventoryCheckState dateEnd(DateTime? dateEnd);

  InventoryCheckState generatedCode(String? generatedCode);

  InventoryCheckState isGeneratingCode(bool isGeneratingCode);

  InventoryCheckState isSaving(bool isSaving);

  InventoryCheckState saveSuccess(bool saveSuccess);

  InventoryCheckState savedResult(InventoryCountSaveResult? savedResult);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InventoryCheckState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InventoryCheckState(...).copyWith(id: 12, name: "My name")
  /// ````
  InventoryCheckState call({
    BaseStateStatus? status,
    String? message,
    List<InventoryCountItem>? items,
    List<InventoryCheckEmployee>? employees,
    String? searchKeyword,
    int? employeeId,
    int? warehouseId,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? generatedCode,
    bool? isGeneratingCode,
    bool? isSaving,
    bool? saveSuccess,
    InventoryCountSaveResult? savedResult,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfInventoryCheckState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfInventoryCheckState.copyWith.fieldName(...)`
class _$InventoryCheckStateCWProxyImpl implements _$InventoryCheckStateCWProxy {
  const _$InventoryCheckStateCWProxyImpl(this._value);

  final InventoryCheckState _value;

  @override
  InventoryCheckState status(BaseStateStatus status) => this(status: status);

  @override
  InventoryCheckState message(String? message) => this(message: message);

  @override
  InventoryCheckState items(List<InventoryCountItem> items) =>
      this(items: items);

  @override
  InventoryCheckState employees(List<InventoryCheckEmployee> employees) =>
      this(employees: employees);

  @override
  InventoryCheckState searchKeyword(String searchKeyword) =>
      this(searchKeyword: searchKeyword);

  @override
  InventoryCheckState employeeId(int? employeeId) =>
      this(employeeId: employeeId);

  @override
  InventoryCheckState warehouseId(int? warehouseId) =>
      this(warehouseId: warehouseId);

  @override
  InventoryCheckState dateStart(DateTime? dateStart) =>
      this(dateStart: dateStart);

  @override
  InventoryCheckState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  InventoryCheckState generatedCode(String? generatedCode) =>
      this(generatedCode: generatedCode);

  @override
  InventoryCheckState isGeneratingCode(bool isGeneratingCode) =>
      this(isGeneratingCode: isGeneratingCode);

  @override
  InventoryCheckState isSaving(bool isSaving) => this(isSaving: isSaving);

  @override
  InventoryCheckState saveSuccess(bool saveSuccess) =>
      this(saveSuccess: saveSuccess);

  @override
  InventoryCheckState savedResult(InventoryCountSaveResult? savedResult) =>
      this(savedResult: savedResult);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InventoryCheckState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InventoryCheckState(...).copyWith(id: 12, name: "My name")
  /// ````
  InventoryCheckState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? items = const $CopyWithPlaceholder(),
    Object? employees = const $CopyWithPlaceholder(),
    Object? searchKeyword = const $CopyWithPlaceholder(),
    Object? employeeId = const $CopyWithPlaceholder(),
    Object? warehouseId = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? generatedCode = const $CopyWithPlaceholder(),
    Object? isGeneratingCode = const $CopyWithPlaceholder(),
    Object? isSaving = const $CopyWithPlaceholder(),
    Object? saveSuccess = const $CopyWithPlaceholder(),
    Object? savedResult = const $CopyWithPlaceholder(),
  }) {
    return InventoryCheckState(
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
          : items as List<InventoryCountItem>,
      employees: employees == const $CopyWithPlaceholder() || employees == null
          ? _value.employees
          // ignore: cast_nullable_to_non_nullable
          : employees as List<InventoryCheckEmployee>,
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
      generatedCode: generatedCode == const $CopyWithPlaceholder()
          ? _value.generatedCode
          // ignore: cast_nullable_to_non_nullable
          : generatedCode as String?,
      isGeneratingCode: isGeneratingCode == const $CopyWithPlaceholder() ||
              isGeneratingCode == null
          ? _value.isGeneratingCode
          // ignore: cast_nullable_to_non_nullable
          : isGeneratingCode as bool,
      isSaving: isSaving == const $CopyWithPlaceholder() || isSaving == null
          ? _value.isSaving
          // ignore: cast_nullable_to_non_nullable
          : isSaving as bool,
      saveSuccess:
          saveSuccess == const $CopyWithPlaceholder() || saveSuccess == null
              ? _value.saveSuccess
              // ignore: cast_nullable_to_non_nullable
              : saveSuccess as bool,
      savedResult: savedResult == const $CopyWithPlaceholder()
          ? _value.savedResult
          // ignore: cast_nullable_to_non_nullable
          : savedResult as InventoryCountSaveResult?,
    );
  }
}

extension $InventoryCheckStateCopyWith on InventoryCheckState {
  /// Returns a callable class that can be used as follows: `instanceOfInventoryCheckState.copyWith(...)` or like so:`instanceOfInventoryCheckState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InventoryCheckStateCWProxy get copyWith =>
      _$InventoryCheckStateCWProxyImpl(this);
}
