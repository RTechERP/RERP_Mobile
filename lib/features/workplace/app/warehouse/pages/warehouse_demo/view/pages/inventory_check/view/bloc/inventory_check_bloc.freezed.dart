// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_check_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InventoryCheckEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() fetchEmployees,
    required TResult Function(String keyword) search,
    required TResult Function(int? employeeId) selectEmployee,
    required TResult Function(int? warehouseId) changeWarehouseFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime date) generateCode,
    required TResult Function(InventoryCountSavePayload payload) save,
    required TResult Function(int id) getById,
    required TResult Function(int id) delete,
    required TResult Function(int countId) fetchSheet,
    required TResult Function(
            int countId, int warehouseId, int modulaLocationId, String? keyword)
        fetchLocationProgress,
    required TResult Function(InventoryLocationGroup group) selectLocationScope,
    required TResult Function(int? productLocationId) selectProductLocation,
    required TResult Function(int? modulaLocationId) selectModulaLocation,
    required TResult Function(int? detailId) selectModulaLocationDetail,
    required TResult Function() clearLocationFilter,
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
    required TResult Function(
            int countId, List<Map<String, dynamic>> changedItems)
        saveCountDetails,
    required TResult Function(String code) findCountByCode,
    required TResult Function() clearScanCountResult,
    required TResult Function(InventoryScanMode mode) startSheetScan,
    required TResult Function(String code) sheetScanned,
    required TResult Function() stopSheetScan,
    required TResult Function(int id, bool isComplete) confirmComplete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? fetchEmployees,
    TResult? Function(String keyword)? search,
    TResult? Function(int? employeeId)? selectEmployee,
    TResult? Function(int? warehouseId)? changeWarehouseFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime date)? generateCode,
    TResult? Function(InventoryCountSavePayload payload)? save,
    TResult? Function(int id)? getById,
    TResult? Function(int id)? delete,
    TResult? Function(int countId)? fetchSheet,
    TResult? Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult? Function(InventoryLocationGroup group)? selectLocationScope,
    TResult? Function(int? productLocationId)? selectProductLocation,
    TResult? Function(int? modulaLocationId)? selectModulaLocation,
    TResult? Function(int? detailId)? selectModulaLocationDetail,
    TResult? Function()? clearLocationFilter,
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
    TResult? Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult? Function(String code)? findCountByCode,
    TResult? Function()? clearScanCountResult,
    TResult? Function(InventoryScanMode mode)? startSheetScan,
    TResult? Function(String code)? sheetScanned,
    TResult? Function()? stopSheetScan,
    TResult? Function(int id, bool isComplete)? confirmComplete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? fetchEmployees,
    TResult Function(String keyword)? search,
    TResult Function(int? employeeId)? selectEmployee,
    TResult Function(int? warehouseId)? changeWarehouseFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime date)? generateCode,
    TResult Function(InventoryCountSavePayload payload)? save,
    TResult Function(int id)? getById,
    TResult Function(int id)? delete,
    TResult Function(int countId)? fetchSheet,
    TResult Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult Function(InventoryLocationGroup group)? selectLocationScope,
    TResult Function(int? productLocationId)? selectProductLocation,
    TResult Function(int? modulaLocationId)? selectModulaLocation,
    TResult Function(int? detailId)? selectModulaLocationDetail,
    TResult Function()? clearLocationFilter,
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
    TResult Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult Function(String code)? findCountByCode,
    TResult Function()? clearScanCountResult,
    TResult Function(InventoryScanMode mode)? startSheetScan,
    TResult Function(String code)? sheetScanned,
    TResult Function()? stopSheetScan,
    TResult Function(int id, bool isComplete)? confirmComplete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchEmployees value) fetchEmployees,
    required TResult Function(_Search value) search,
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_ChangeWarehouseFilter value)
        changeWarehouseFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_GenerateCode value) generateCode,
    required TResult Function(_Save value) save,
    required TResult Function(_GetById value) getById,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FetchSheet value) fetchSheet,
    required TResult Function(_FetchLocationProgress value)
        fetchLocationProgress,
    required TResult Function(_SelectLocationScope value) selectLocationScope,
    required TResult Function(_SelectProductLocation value)
        selectProductLocation,
    required TResult Function(_SelectModulaLocation value) selectModulaLocation,
    required TResult Function(_SelectModulaLocationDetail value)
        selectModulaLocationDetail,
    required TResult Function(_ClearLocationFilter value) clearLocationFilter,
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
    required TResult Function(_SaveCountDetails value) saveCountDetails,
    required TResult Function(_FindCountByCode value) findCountByCode,
    required TResult Function(_ClearScanCountResult value) clearScanCountResult,
    required TResult Function(_StartSheetScan value) startSheetScan,
    required TResult Function(_SheetScanned value) sheetScanned,
    required TResult Function(_StopSheetScan value) stopSheetScan,
    required TResult Function(_ConfirmComplete value) confirmComplete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchEmployees value)? fetchEmployees,
    TResult? Function(_Search value)? search,
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_GenerateCode value)? generateCode,
    TResult? Function(_Save value)? save,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_FetchSheet value)? fetchSheet,
    TResult? Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult? Function(_SelectLocationScope value)? selectLocationScope,
    TResult? Function(_SelectProductLocation value)? selectProductLocation,
    TResult? Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult? Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult? Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult? Function(_SaveCountDetails value)? saveCountDetails,
    TResult? Function(_FindCountByCode value)? findCountByCode,
    TResult? Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult? Function(_StartSheetScan value)? startSheetScan,
    TResult? Function(_SheetScanned value)? sheetScanned,
    TResult? Function(_StopSheetScan value)? stopSheetScan,
    TResult? Function(_ConfirmComplete value)? confirmComplete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchEmployees value)? fetchEmployees,
    TResult Function(_Search value)? search,
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_GenerateCode value)? generateCode,
    TResult Function(_Save value)? save,
    TResult Function(_GetById value)? getById,
    TResult Function(_Delete value)? delete,
    TResult Function(_FetchSheet value)? fetchSheet,
    TResult Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult Function(_SelectLocationScope value)? selectLocationScope,
    TResult Function(_SelectProductLocation value)? selectProductLocation,
    TResult Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult Function(_SaveCountDetails value)? saveCountDetails,
    TResult Function(_FindCountByCode value)? findCountByCode,
    TResult Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult Function(_StartSheetScan value)? startSheetScan,
    TResult Function(_SheetScanned value)? sheetScanned,
    TResult Function(_StopSheetScan value)? stopSheetScan,
    TResult Function(_ConfirmComplete value)? confirmComplete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryCheckEventCopyWith<$Res> {
  factory $InventoryCheckEventCopyWith(
          InventoryCheckEvent value, $Res Function(InventoryCheckEvent) then) =
      _$InventoryCheckEventCopyWithImpl<$Res, InventoryCheckEvent>;
}

/// @nodoc
class _$InventoryCheckEventCopyWithImpl<$Res, $Val extends InventoryCheckEvent>
    implements $InventoryCheckEventCopyWith<$Res> {
  _$InventoryCheckEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$InventoryCheckEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl();

  @override
  String toString() {
    return 'InventoryCheckEvent.fetch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() fetchEmployees,
    required TResult Function(String keyword) search,
    required TResult Function(int? employeeId) selectEmployee,
    required TResult Function(int? warehouseId) changeWarehouseFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime date) generateCode,
    required TResult Function(InventoryCountSavePayload payload) save,
    required TResult Function(int id) getById,
    required TResult Function(int id) delete,
    required TResult Function(int countId) fetchSheet,
    required TResult Function(
            int countId, int warehouseId, int modulaLocationId, String? keyword)
        fetchLocationProgress,
    required TResult Function(InventoryLocationGroup group) selectLocationScope,
    required TResult Function(int? productLocationId) selectProductLocation,
    required TResult Function(int? modulaLocationId) selectModulaLocation,
    required TResult Function(int? detailId) selectModulaLocationDetail,
    required TResult Function() clearLocationFilter,
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
    required TResult Function(
            int countId, List<Map<String, dynamic>> changedItems)
        saveCountDetails,
    required TResult Function(String code) findCountByCode,
    required TResult Function() clearScanCountResult,
    required TResult Function(InventoryScanMode mode) startSheetScan,
    required TResult Function(String code) sheetScanned,
    required TResult Function() stopSheetScan,
    required TResult Function(int id, bool isComplete) confirmComplete,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? fetchEmployees,
    TResult? Function(String keyword)? search,
    TResult? Function(int? employeeId)? selectEmployee,
    TResult? Function(int? warehouseId)? changeWarehouseFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime date)? generateCode,
    TResult? Function(InventoryCountSavePayload payload)? save,
    TResult? Function(int id)? getById,
    TResult? Function(int id)? delete,
    TResult? Function(int countId)? fetchSheet,
    TResult? Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult? Function(InventoryLocationGroup group)? selectLocationScope,
    TResult? Function(int? productLocationId)? selectProductLocation,
    TResult? Function(int? modulaLocationId)? selectModulaLocation,
    TResult? Function(int? detailId)? selectModulaLocationDetail,
    TResult? Function()? clearLocationFilter,
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
    TResult? Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult? Function(String code)? findCountByCode,
    TResult? Function()? clearScanCountResult,
    TResult? Function(InventoryScanMode mode)? startSheetScan,
    TResult? Function(String code)? sheetScanned,
    TResult? Function()? stopSheetScan,
    TResult? Function(int id, bool isComplete)? confirmComplete,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? fetchEmployees,
    TResult Function(String keyword)? search,
    TResult Function(int? employeeId)? selectEmployee,
    TResult Function(int? warehouseId)? changeWarehouseFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime date)? generateCode,
    TResult Function(InventoryCountSavePayload payload)? save,
    TResult Function(int id)? getById,
    TResult Function(int id)? delete,
    TResult Function(int countId)? fetchSheet,
    TResult Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult Function(InventoryLocationGroup group)? selectLocationScope,
    TResult Function(int? productLocationId)? selectProductLocation,
    TResult Function(int? modulaLocationId)? selectModulaLocation,
    TResult Function(int? detailId)? selectModulaLocationDetail,
    TResult Function()? clearLocationFilter,
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
    TResult Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult Function(String code)? findCountByCode,
    TResult Function()? clearScanCountResult,
    TResult Function(InventoryScanMode mode)? startSheetScan,
    TResult Function(String code)? sheetScanned,
    TResult Function()? stopSheetScan,
    TResult Function(int id, bool isComplete)? confirmComplete,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchEmployees value) fetchEmployees,
    required TResult Function(_Search value) search,
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_ChangeWarehouseFilter value)
        changeWarehouseFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_GenerateCode value) generateCode,
    required TResult Function(_Save value) save,
    required TResult Function(_GetById value) getById,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FetchSheet value) fetchSheet,
    required TResult Function(_FetchLocationProgress value)
        fetchLocationProgress,
    required TResult Function(_SelectLocationScope value) selectLocationScope,
    required TResult Function(_SelectProductLocation value)
        selectProductLocation,
    required TResult Function(_SelectModulaLocation value) selectModulaLocation,
    required TResult Function(_SelectModulaLocationDetail value)
        selectModulaLocationDetail,
    required TResult Function(_ClearLocationFilter value) clearLocationFilter,
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
    required TResult Function(_SaveCountDetails value) saveCountDetails,
    required TResult Function(_FindCountByCode value) findCountByCode,
    required TResult Function(_ClearScanCountResult value) clearScanCountResult,
    required TResult Function(_StartSheetScan value) startSheetScan,
    required TResult Function(_SheetScanned value) sheetScanned,
    required TResult Function(_StopSheetScan value) stopSheetScan,
    required TResult Function(_ConfirmComplete value) confirmComplete,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchEmployees value)? fetchEmployees,
    TResult? Function(_Search value)? search,
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_GenerateCode value)? generateCode,
    TResult? Function(_Save value)? save,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_FetchSheet value)? fetchSheet,
    TResult? Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult? Function(_SelectLocationScope value)? selectLocationScope,
    TResult? Function(_SelectProductLocation value)? selectProductLocation,
    TResult? Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult? Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult? Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult? Function(_SaveCountDetails value)? saveCountDetails,
    TResult? Function(_FindCountByCode value)? findCountByCode,
    TResult? Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult? Function(_StartSheetScan value)? startSheetScan,
    TResult? Function(_SheetScanned value)? sheetScanned,
    TResult? Function(_StopSheetScan value)? stopSheetScan,
    TResult? Function(_ConfirmComplete value)? confirmComplete,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchEmployees value)? fetchEmployees,
    TResult Function(_Search value)? search,
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_GenerateCode value)? generateCode,
    TResult Function(_Save value)? save,
    TResult Function(_GetById value)? getById,
    TResult Function(_Delete value)? delete,
    TResult Function(_FetchSheet value)? fetchSheet,
    TResult Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult Function(_SelectLocationScope value)? selectLocationScope,
    TResult Function(_SelectProductLocation value)? selectProductLocation,
    TResult Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult Function(_SaveCountDetails value)? saveCountDetails,
    TResult Function(_FindCountByCode value)? findCountByCode,
    TResult Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult Function(_StartSheetScan value)? startSheetScan,
    TResult Function(_SheetScanned value)? sheetScanned,
    TResult Function(_StopSheetScan value)? stopSheetScan,
    TResult Function(_ConfirmComplete value)? confirmComplete,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements InventoryCheckEvent {
  const factory _Fetch() = _$FetchImpl;
}

/// @nodoc
abstract class _$$FetchEmployeesImplCopyWith<$Res> {
  factory _$$FetchEmployeesImplCopyWith(_$FetchEmployeesImpl value,
          $Res Function(_$FetchEmployeesImpl) then) =
      __$$FetchEmployeesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchEmployeesImplCopyWithImpl<$Res>
    extends _$InventoryCheckEventCopyWithImpl<$Res, _$FetchEmployeesImpl>
    implements _$$FetchEmployeesImplCopyWith<$Res> {
  __$$FetchEmployeesImplCopyWithImpl(
      _$FetchEmployeesImpl _value, $Res Function(_$FetchEmployeesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchEmployeesImpl implements _FetchEmployees {
  const _$FetchEmployeesImpl();

  @override
  String toString() {
    return 'InventoryCheckEvent.fetchEmployees()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchEmployeesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() fetchEmployees,
    required TResult Function(String keyword) search,
    required TResult Function(int? employeeId) selectEmployee,
    required TResult Function(int? warehouseId) changeWarehouseFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime date) generateCode,
    required TResult Function(InventoryCountSavePayload payload) save,
    required TResult Function(int id) getById,
    required TResult Function(int id) delete,
    required TResult Function(int countId) fetchSheet,
    required TResult Function(
            int countId, int warehouseId, int modulaLocationId, String? keyword)
        fetchLocationProgress,
    required TResult Function(InventoryLocationGroup group) selectLocationScope,
    required TResult Function(int? productLocationId) selectProductLocation,
    required TResult Function(int? modulaLocationId) selectModulaLocation,
    required TResult Function(int? detailId) selectModulaLocationDetail,
    required TResult Function() clearLocationFilter,
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
    required TResult Function(
            int countId, List<Map<String, dynamic>> changedItems)
        saveCountDetails,
    required TResult Function(String code) findCountByCode,
    required TResult Function() clearScanCountResult,
    required TResult Function(InventoryScanMode mode) startSheetScan,
    required TResult Function(String code) sheetScanned,
    required TResult Function() stopSheetScan,
    required TResult Function(int id, bool isComplete) confirmComplete,
  }) {
    return fetchEmployees();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? fetchEmployees,
    TResult? Function(String keyword)? search,
    TResult? Function(int? employeeId)? selectEmployee,
    TResult? Function(int? warehouseId)? changeWarehouseFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime date)? generateCode,
    TResult? Function(InventoryCountSavePayload payload)? save,
    TResult? Function(int id)? getById,
    TResult? Function(int id)? delete,
    TResult? Function(int countId)? fetchSheet,
    TResult? Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult? Function(InventoryLocationGroup group)? selectLocationScope,
    TResult? Function(int? productLocationId)? selectProductLocation,
    TResult? Function(int? modulaLocationId)? selectModulaLocation,
    TResult? Function(int? detailId)? selectModulaLocationDetail,
    TResult? Function()? clearLocationFilter,
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
    TResult? Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult? Function(String code)? findCountByCode,
    TResult? Function()? clearScanCountResult,
    TResult? Function(InventoryScanMode mode)? startSheetScan,
    TResult? Function(String code)? sheetScanned,
    TResult? Function()? stopSheetScan,
    TResult? Function(int id, bool isComplete)? confirmComplete,
  }) {
    return fetchEmployees?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? fetchEmployees,
    TResult Function(String keyword)? search,
    TResult Function(int? employeeId)? selectEmployee,
    TResult Function(int? warehouseId)? changeWarehouseFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime date)? generateCode,
    TResult Function(InventoryCountSavePayload payload)? save,
    TResult Function(int id)? getById,
    TResult Function(int id)? delete,
    TResult Function(int countId)? fetchSheet,
    TResult Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult Function(InventoryLocationGroup group)? selectLocationScope,
    TResult Function(int? productLocationId)? selectProductLocation,
    TResult Function(int? modulaLocationId)? selectModulaLocation,
    TResult Function(int? detailId)? selectModulaLocationDetail,
    TResult Function()? clearLocationFilter,
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
    TResult Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult Function(String code)? findCountByCode,
    TResult Function()? clearScanCountResult,
    TResult Function(InventoryScanMode mode)? startSheetScan,
    TResult Function(String code)? sheetScanned,
    TResult Function()? stopSheetScan,
    TResult Function(int id, bool isComplete)? confirmComplete,
    required TResult orElse(),
  }) {
    if (fetchEmployees != null) {
      return fetchEmployees();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchEmployees value) fetchEmployees,
    required TResult Function(_Search value) search,
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_ChangeWarehouseFilter value)
        changeWarehouseFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_GenerateCode value) generateCode,
    required TResult Function(_Save value) save,
    required TResult Function(_GetById value) getById,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FetchSheet value) fetchSheet,
    required TResult Function(_FetchLocationProgress value)
        fetchLocationProgress,
    required TResult Function(_SelectLocationScope value) selectLocationScope,
    required TResult Function(_SelectProductLocation value)
        selectProductLocation,
    required TResult Function(_SelectModulaLocation value) selectModulaLocation,
    required TResult Function(_SelectModulaLocationDetail value)
        selectModulaLocationDetail,
    required TResult Function(_ClearLocationFilter value) clearLocationFilter,
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
    required TResult Function(_SaveCountDetails value) saveCountDetails,
    required TResult Function(_FindCountByCode value) findCountByCode,
    required TResult Function(_ClearScanCountResult value) clearScanCountResult,
    required TResult Function(_StartSheetScan value) startSheetScan,
    required TResult Function(_SheetScanned value) sheetScanned,
    required TResult Function(_StopSheetScan value) stopSheetScan,
    required TResult Function(_ConfirmComplete value) confirmComplete,
  }) {
    return fetchEmployees(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchEmployees value)? fetchEmployees,
    TResult? Function(_Search value)? search,
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_GenerateCode value)? generateCode,
    TResult? Function(_Save value)? save,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_FetchSheet value)? fetchSheet,
    TResult? Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult? Function(_SelectLocationScope value)? selectLocationScope,
    TResult? Function(_SelectProductLocation value)? selectProductLocation,
    TResult? Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult? Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult? Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult? Function(_SaveCountDetails value)? saveCountDetails,
    TResult? Function(_FindCountByCode value)? findCountByCode,
    TResult? Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult? Function(_StartSheetScan value)? startSheetScan,
    TResult? Function(_SheetScanned value)? sheetScanned,
    TResult? Function(_StopSheetScan value)? stopSheetScan,
    TResult? Function(_ConfirmComplete value)? confirmComplete,
  }) {
    return fetchEmployees?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchEmployees value)? fetchEmployees,
    TResult Function(_Search value)? search,
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_GenerateCode value)? generateCode,
    TResult Function(_Save value)? save,
    TResult Function(_GetById value)? getById,
    TResult Function(_Delete value)? delete,
    TResult Function(_FetchSheet value)? fetchSheet,
    TResult Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult Function(_SelectLocationScope value)? selectLocationScope,
    TResult Function(_SelectProductLocation value)? selectProductLocation,
    TResult Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult Function(_SaveCountDetails value)? saveCountDetails,
    TResult Function(_FindCountByCode value)? findCountByCode,
    TResult Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult Function(_StartSheetScan value)? startSheetScan,
    TResult Function(_SheetScanned value)? sheetScanned,
    TResult Function(_StopSheetScan value)? stopSheetScan,
    TResult Function(_ConfirmComplete value)? confirmComplete,
    required TResult orElse(),
  }) {
    if (fetchEmployees != null) {
      return fetchEmployees(this);
    }
    return orElse();
  }
}

abstract class _FetchEmployees implements InventoryCheckEvent {
  const factory _FetchEmployees() = _$FetchEmployeesImpl;
}

/// @nodoc
abstract class _$$SearchImplCopyWith<$Res> {
  factory _$$SearchImplCopyWith(
          _$SearchImpl value, $Res Function(_$SearchImpl) then) =
      __$$SearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String keyword});
}

/// @nodoc
class __$$SearchImplCopyWithImpl<$Res>
    extends _$InventoryCheckEventCopyWithImpl<$Res, _$SearchImpl>
    implements _$$SearchImplCopyWith<$Res> {
  __$$SearchImplCopyWithImpl(
      _$SearchImpl _value, $Res Function(_$SearchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
  }) {
    return _then(_$SearchImpl(
      null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchImpl implements _Search {
  const _$SearchImpl(this.keyword);

  @override
  final String keyword;

  @override
  String toString() {
    return 'InventoryCheckEvent.search(keyword: $keyword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchImpl &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keyword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      __$$SearchImplCopyWithImpl<_$SearchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() fetchEmployees,
    required TResult Function(String keyword) search,
    required TResult Function(int? employeeId) selectEmployee,
    required TResult Function(int? warehouseId) changeWarehouseFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime date) generateCode,
    required TResult Function(InventoryCountSavePayload payload) save,
    required TResult Function(int id) getById,
    required TResult Function(int id) delete,
    required TResult Function(int countId) fetchSheet,
    required TResult Function(
            int countId, int warehouseId, int modulaLocationId, String? keyword)
        fetchLocationProgress,
    required TResult Function(InventoryLocationGroup group) selectLocationScope,
    required TResult Function(int? productLocationId) selectProductLocation,
    required TResult Function(int? modulaLocationId) selectModulaLocation,
    required TResult Function(int? detailId) selectModulaLocationDetail,
    required TResult Function() clearLocationFilter,
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
    required TResult Function(
            int countId, List<Map<String, dynamic>> changedItems)
        saveCountDetails,
    required TResult Function(String code) findCountByCode,
    required TResult Function() clearScanCountResult,
    required TResult Function(InventoryScanMode mode) startSheetScan,
    required TResult Function(String code) sheetScanned,
    required TResult Function() stopSheetScan,
    required TResult Function(int id, bool isComplete) confirmComplete,
  }) {
    return search(keyword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? fetchEmployees,
    TResult? Function(String keyword)? search,
    TResult? Function(int? employeeId)? selectEmployee,
    TResult? Function(int? warehouseId)? changeWarehouseFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime date)? generateCode,
    TResult? Function(InventoryCountSavePayload payload)? save,
    TResult? Function(int id)? getById,
    TResult? Function(int id)? delete,
    TResult? Function(int countId)? fetchSheet,
    TResult? Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult? Function(InventoryLocationGroup group)? selectLocationScope,
    TResult? Function(int? productLocationId)? selectProductLocation,
    TResult? Function(int? modulaLocationId)? selectModulaLocation,
    TResult? Function(int? detailId)? selectModulaLocationDetail,
    TResult? Function()? clearLocationFilter,
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
    TResult? Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult? Function(String code)? findCountByCode,
    TResult? Function()? clearScanCountResult,
    TResult? Function(InventoryScanMode mode)? startSheetScan,
    TResult? Function(String code)? sheetScanned,
    TResult? Function()? stopSheetScan,
    TResult? Function(int id, bool isComplete)? confirmComplete,
  }) {
    return search?.call(keyword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? fetchEmployees,
    TResult Function(String keyword)? search,
    TResult Function(int? employeeId)? selectEmployee,
    TResult Function(int? warehouseId)? changeWarehouseFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime date)? generateCode,
    TResult Function(InventoryCountSavePayload payload)? save,
    TResult Function(int id)? getById,
    TResult Function(int id)? delete,
    TResult Function(int countId)? fetchSheet,
    TResult Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult Function(InventoryLocationGroup group)? selectLocationScope,
    TResult Function(int? productLocationId)? selectProductLocation,
    TResult Function(int? modulaLocationId)? selectModulaLocation,
    TResult Function(int? detailId)? selectModulaLocationDetail,
    TResult Function()? clearLocationFilter,
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
    TResult Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult Function(String code)? findCountByCode,
    TResult Function()? clearScanCountResult,
    TResult Function(InventoryScanMode mode)? startSheetScan,
    TResult Function(String code)? sheetScanned,
    TResult Function()? stopSheetScan,
    TResult Function(int id, bool isComplete)? confirmComplete,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(keyword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchEmployees value) fetchEmployees,
    required TResult Function(_Search value) search,
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_ChangeWarehouseFilter value)
        changeWarehouseFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_GenerateCode value) generateCode,
    required TResult Function(_Save value) save,
    required TResult Function(_GetById value) getById,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FetchSheet value) fetchSheet,
    required TResult Function(_FetchLocationProgress value)
        fetchLocationProgress,
    required TResult Function(_SelectLocationScope value) selectLocationScope,
    required TResult Function(_SelectProductLocation value)
        selectProductLocation,
    required TResult Function(_SelectModulaLocation value) selectModulaLocation,
    required TResult Function(_SelectModulaLocationDetail value)
        selectModulaLocationDetail,
    required TResult Function(_ClearLocationFilter value) clearLocationFilter,
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
    required TResult Function(_SaveCountDetails value) saveCountDetails,
    required TResult Function(_FindCountByCode value) findCountByCode,
    required TResult Function(_ClearScanCountResult value) clearScanCountResult,
    required TResult Function(_StartSheetScan value) startSheetScan,
    required TResult Function(_SheetScanned value) sheetScanned,
    required TResult Function(_StopSheetScan value) stopSheetScan,
    required TResult Function(_ConfirmComplete value) confirmComplete,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchEmployees value)? fetchEmployees,
    TResult? Function(_Search value)? search,
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_GenerateCode value)? generateCode,
    TResult? Function(_Save value)? save,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_FetchSheet value)? fetchSheet,
    TResult? Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult? Function(_SelectLocationScope value)? selectLocationScope,
    TResult? Function(_SelectProductLocation value)? selectProductLocation,
    TResult? Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult? Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult? Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult? Function(_SaveCountDetails value)? saveCountDetails,
    TResult? Function(_FindCountByCode value)? findCountByCode,
    TResult? Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult? Function(_StartSheetScan value)? startSheetScan,
    TResult? Function(_SheetScanned value)? sheetScanned,
    TResult? Function(_StopSheetScan value)? stopSheetScan,
    TResult? Function(_ConfirmComplete value)? confirmComplete,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchEmployees value)? fetchEmployees,
    TResult Function(_Search value)? search,
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_GenerateCode value)? generateCode,
    TResult Function(_Save value)? save,
    TResult Function(_GetById value)? getById,
    TResult Function(_Delete value)? delete,
    TResult Function(_FetchSheet value)? fetchSheet,
    TResult Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult Function(_SelectLocationScope value)? selectLocationScope,
    TResult Function(_SelectProductLocation value)? selectProductLocation,
    TResult Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult Function(_SaveCountDetails value)? saveCountDetails,
    TResult Function(_FindCountByCode value)? findCountByCode,
    TResult Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult Function(_StartSheetScan value)? startSheetScan,
    TResult Function(_SheetScanned value)? sheetScanned,
    TResult Function(_StopSheetScan value)? stopSheetScan,
    TResult Function(_ConfirmComplete value)? confirmComplete,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class _Search implements InventoryCheckEvent {
  const factory _Search(final String keyword) = _$SearchImpl;

  String get keyword;
  @JsonKey(ignore: true)
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectEmployeeImplCopyWith<$Res> {
  factory _$$SelectEmployeeImplCopyWith(_$SelectEmployeeImpl value,
          $Res Function(_$SelectEmployeeImpl) then) =
      __$$SelectEmployeeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? employeeId});
}

/// @nodoc
class __$$SelectEmployeeImplCopyWithImpl<$Res>
    extends _$InventoryCheckEventCopyWithImpl<$Res, _$SelectEmployeeImpl>
    implements _$$SelectEmployeeImplCopyWith<$Res> {
  __$$SelectEmployeeImplCopyWithImpl(
      _$SelectEmployeeImpl _value, $Res Function(_$SelectEmployeeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeId = freezed,
  }) {
    return _then(_$SelectEmployeeImpl(
      freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SelectEmployeeImpl implements _SelectEmployee {
  const _$SelectEmployeeImpl(this.employeeId);

  @override
  final int? employeeId;

  @override
  String toString() {
    return 'InventoryCheckEvent.selectEmployee(employeeId: $employeeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectEmployeeImpl &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, employeeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectEmployeeImplCopyWith<_$SelectEmployeeImpl> get copyWith =>
      __$$SelectEmployeeImplCopyWithImpl<_$SelectEmployeeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() fetchEmployees,
    required TResult Function(String keyword) search,
    required TResult Function(int? employeeId) selectEmployee,
    required TResult Function(int? warehouseId) changeWarehouseFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime date) generateCode,
    required TResult Function(InventoryCountSavePayload payload) save,
    required TResult Function(int id) getById,
    required TResult Function(int id) delete,
    required TResult Function(int countId) fetchSheet,
    required TResult Function(
            int countId, int warehouseId, int modulaLocationId, String? keyword)
        fetchLocationProgress,
    required TResult Function(InventoryLocationGroup group) selectLocationScope,
    required TResult Function(int? productLocationId) selectProductLocation,
    required TResult Function(int? modulaLocationId) selectModulaLocation,
    required TResult Function(int? detailId) selectModulaLocationDetail,
    required TResult Function() clearLocationFilter,
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
    required TResult Function(
            int countId, List<Map<String, dynamic>> changedItems)
        saveCountDetails,
    required TResult Function(String code) findCountByCode,
    required TResult Function() clearScanCountResult,
    required TResult Function(InventoryScanMode mode) startSheetScan,
    required TResult Function(String code) sheetScanned,
    required TResult Function() stopSheetScan,
    required TResult Function(int id, bool isComplete) confirmComplete,
  }) {
    return selectEmployee(employeeId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? fetchEmployees,
    TResult? Function(String keyword)? search,
    TResult? Function(int? employeeId)? selectEmployee,
    TResult? Function(int? warehouseId)? changeWarehouseFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime date)? generateCode,
    TResult? Function(InventoryCountSavePayload payload)? save,
    TResult? Function(int id)? getById,
    TResult? Function(int id)? delete,
    TResult? Function(int countId)? fetchSheet,
    TResult? Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult? Function(InventoryLocationGroup group)? selectLocationScope,
    TResult? Function(int? productLocationId)? selectProductLocation,
    TResult? Function(int? modulaLocationId)? selectModulaLocation,
    TResult? Function(int? detailId)? selectModulaLocationDetail,
    TResult? Function()? clearLocationFilter,
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
    TResult? Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult? Function(String code)? findCountByCode,
    TResult? Function()? clearScanCountResult,
    TResult? Function(InventoryScanMode mode)? startSheetScan,
    TResult? Function(String code)? sheetScanned,
    TResult? Function()? stopSheetScan,
    TResult? Function(int id, bool isComplete)? confirmComplete,
  }) {
    return selectEmployee?.call(employeeId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? fetchEmployees,
    TResult Function(String keyword)? search,
    TResult Function(int? employeeId)? selectEmployee,
    TResult Function(int? warehouseId)? changeWarehouseFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime date)? generateCode,
    TResult Function(InventoryCountSavePayload payload)? save,
    TResult Function(int id)? getById,
    TResult Function(int id)? delete,
    TResult Function(int countId)? fetchSheet,
    TResult Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult Function(InventoryLocationGroup group)? selectLocationScope,
    TResult Function(int? productLocationId)? selectProductLocation,
    TResult Function(int? modulaLocationId)? selectModulaLocation,
    TResult Function(int? detailId)? selectModulaLocationDetail,
    TResult Function()? clearLocationFilter,
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
    TResult Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult Function(String code)? findCountByCode,
    TResult Function()? clearScanCountResult,
    TResult Function(InventoryScanMode mode)? startSheetScan,
    TResult Function(String code)? sheetScanned,
    TResult Function()? stopSheetScan,
    TResult Function(int id, bool isComplete)? confirmComplete,
    required TResult orElse(),
  }) {
    if (selectEmployee != null) {
      return selectEmployee(employeeId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchEmployees value) fetchEmployees,
    required TResult Function(_Search value) search,
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_ChangeWarehouseFilter value)
        changeWarehouseFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_GenerateCode value) generateCode,
    required TResult Function(_Save value) save,
    required TResult Function(_GetById value) getById,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FetchSheet value) fetchSheet,
    required TResult Function(_FetchLocationProgress value)
        fetchLocationProgress,
    required TResult Function(_SelectLocationScope value) selectLocationScope,
    required TResult Function(_SelectProductLocation value)
        selectProductLocation,
    required TResult Function(_SelectModulaLocation value) selectModulaLocation,
    required TResult Function(_SelectModulaLocationDetail value)
        selectModulaLocationDetail,
    required TResult Function(_ClearLocationFilter value) clearLocationFilter,
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
    required TResult Function(_SaveCountDetails value) saveCountDetails,
    required TResult Function(_FindCountByCode value) findCountByCode,
    required TResult Function(_ClearScanCountResult value) clearScanCountResult,
    required TResult Function(_StartSheetScan value) startSheetScan,
    required TResult Function(_SheetScanned value) sheetScanned,
    required TResult Function(_StopSheetScan value) stopSheetScan,
    required TResult Function(_ConfirmComplete value) confirmComplete,
  }) {
    return selectEmployee(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchEmployees value)? fetchEmployees,
    TResult? Function(_Search value)? search,
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_GenerateCode value)? generateCode,
    TResult? Function(_Save value)? save,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_FetchSheet value)? fetchSheet,
    TResult? Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult? Function(_SelectLocationScope value)? selectLocationScope,
    TResult? Function(_SelectProductLocation value)? selectProductLocation,
    TResult? Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult? Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult? Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult? Function(_SaveCountDetails value)? saveCountDetails,
    TResult? Function(_FindCountByCode value)? findCountByCode,
    TResult? Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult? Function(_StartSheetScan value)? startSheetScan,
    TResult? Function(_SheetScanned value)? sheetScanned,
    TResult? Function(_StopSheetScan value)? stopSheetScan,
    TResult? Function(_ConfirmComplete value)? confirmComplete,
  }) {
    return selectEmployee?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchEmployees value)? fetchEmployees,
    TResult Function(_Search value)? search,
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_GenerateCode value)? generateCode,
    TResult Function(_Save value)? save,
    TResult Function(_GetById value)? getById,
    TResult Function(_Delete value)? delete,
    TResult Function(_FetchSheet value)? fetchSheet,
    TResult Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult Function(_SelectLocationScope value)? selectLocationScope,
    TResult Function(_SelectProductLocation value)? selectProductLocation,
    TResult Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult Function(_SaveCountDetails value)? saveCountDetails,
    TResult Function(_FindCountByCode value)? findCountByCode,
    TResult Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult Function(_StartSheetScan value)? startSheetScan,
    TResult Function(_SheetScanned value)? sheetScanned,
    TResult Function(_StopSheetScan value)? stopSheetScan,
    TResult Function(_ConfirmComplete value)? confirmComplete,
    required TResult orElse(),
  }) {
    if (selectEmployee != null) {
      return selectEmployee(this);
    }
    return orElse();
  }
}

abstract class _SelectEmployee implements InventoryCheckEvent {
  const factory _SelectEmployee(final int? employeeId) = _$SelectEmployeeImpl;

  int? get employeeId;
  @JsonKey(ignore: true)
  _$$SelectEmployeeImplCopyWith<_$SelectEmployeeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeWarehouseFilterImplCopyWith<$Res> {
  factory _$$ChangeWarehouseFilterImplCopyWith(
          _$ChangeWarehouseFilterImpl value,
          $Res Function(_$ChangeWarehouseFilterImpl) then) =
      __$$ChangeWarehouseFilterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? warehouseId});
}

/// @nodoc
class __$$ChangeWarehouseFilterImplCopyWithImpl<$Res>
    extends _$InventoryCheckEventCopyWithImpl<$Res, _$ChangeWarehouseFilterImpl>
    implements _$$ChangeWarehouseFilterImplCopyWith<$Res> {
  __$$ChangeWarehouseFilterImplCopyWithImpl(_$ChangeWarehouseFilterImpl _value,
      $Res Function(_$ChangeWarehouseFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? warehouseId = freezed,
  }) {
    return _then(_$ChangeWarehouseFilterImpl(
      freezed == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$ChangeWarehouseFilterImpl implements _ChangeWarehouseFilter {
  const _$ChangeWarehouseFilterImpl(this.warehouseId);

  @override
  final int? warehouseId;

  @override
  String toString() {
    return 'InventoryCheckEvent.changeWarehouseFilter(warehouseId: $warehouseId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeWarehouseFilterImpl &&
            (identical(other.warehouseId, warehouseId) ||
                other.warehouseId == warehouseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, warehouseId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeWarehouseFilterImplCopyWith<_$ChangeWarehouseFilterImpl>
      get copyWith => __$$ChangeWarehouseFilterImplCopyWithImpl<
          _$ChangeWarehouseFilterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() fetchEmployees,
    required TResult Function(String keyword) search,
    required TResult Function(int? employeeId) selectEmployee,
    required TResult Function(int? warehouseId) changeWarehouseFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime date) generateCode,
    required TResult Function(InventoryCountSavePayload payload) save,
    required TResult Function(int id) getById,
    required TResult Function(int id) delete,
    required TResult Function(int countId) fetchSheet,
    required TResult Function(
            int countId, int warehouseId, int modulaLocationId, String? keyword)
        fetchLocationProgress,
    required TResult Function(InventoryLocationGroup group) selectLocationScope,
    required TResult Function(int? productLocationId) selectProductLocation,
    required TResult Function(int? modulaLocationId) selectModulaLocation,
    required TResult Function(int? detailId) selectModulaLocationDetail,
    required TResult Function() clearLocationFilter,
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
    required TResult Function(
            int countId, List<Map<String, dynamic>> changedItems)
        saveCountDetails,
    required TResult Function(String code) findCountByCode,
    required TResult Function() clearScanCountResult,
    required TResult Function(InventoryScanMode mode) startSheetScan,
    required TResult Function(String code) sheetScanned,
    required TResult Function() stopSheetScan,
    required TResult Function(int id, bool isComplete) confirmComplete,
  }) {
    return changeWarehouseFilter(warehouseId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? fetchEmployees,
    TResult? Function(String keyword)? search,
    TResult? Function(int? employeeId)? selectEmployee,
    TResult? Function(int? warehouseId)? changeWarehouseFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime date)? generateCode,
    TResult? Function(InventoryCountSavePayload payload)? save,
    TResult? Function(int id)? getById,
    TResult? Function(int id)? delete,
    TResult? Function(int countId)? fetchSheet,
    TResult? Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult? Function(InventoryLocationGroup group)? selectLocationScope,
    TResult? Function(int? productLocationId)? selectProductLocation,
    TResult? Function(int? modulaLocationId)? selectModulaLocation,
    TResult? Function(int? detailId)? selectModulaLocationDetail,
    TResult? Function()? clearLocationFilter,
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
    TResult? Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult? Function(String code)? findCountByCode,
    TResult? Function()? clearScanCountResult,
    TResult? Function(InventoryScanMode mode)? startSheetScan,
    TResult? Function(String code)? sheetScanned,
    TResult? Function()? stopSheetScan,
    TResult? Function(int id, bool isComplete)? confirmComplete,
  }) {
    return changeWarehouseFilter?.call(warehouseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? fetchEmployees,
    TResult Function(String keyword)? search,
    TResult Function(int? employeeId)? selectEmployee,
    TResult Function(int? warehouseId)? changeWarehouseFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime date)? generateCode,
    TResult Function(InventoryCountSavePayload payload)? save,
    TResult Function(int id)? getById,
    TResult Function(int id)? delete,
    TResult Function(int countId)? fetchSheet,
    TResult Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult Function(InventoryLocationGroup group)? selectLocationScope,
    TResult Function(int? productLocationId)? selectProductLocation,
    TResult Function(int? modulaLocationId)? selectModulaLocation,
    TResult Function(int? detailId)? selectModulaLocationDetail,
    TResult Function()? clearLocationFilter,
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
    TResult Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult Function(String code)? findCountByCode,
    TResult Function()? clearScanCountResult,
    TResult Function(InventoryScanMode mode)? startSheetScan,
    TResult Function(String code)? sheetScanned,
    TResult Function()? stopSheetScan,
    TResult Function(int id, bool isComplete)? confirmComplete,
    required TResult orElse(),
  }) {
    if (changeWarehouseFilter != null) {
      return changeWarehouseFilter(warehouseId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchEmployees value) fetchEmployees,
    required TResult Function(_Search value) search,
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_ChangeWarehouseFilter value)
        changeWarehouseFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_GenerateCode value) generateCode,
    required TResult Function(_Save value) save,
    required TResult Function(_GetById value) getById,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FetchSheet value) fetchSheet,
    required TResult Function(_FetchLocationProgress value)
        fetchLocationProgress,
    required TResult Function(_SelectLocationScope value) selectLocationScope,
    required TResult Function(_SelectProductLocation value)
        selectProductLocation,
    required TResult Function(_SelectModulaLocation value) selectModulaLocation,
    required TResult Function(_SelectModulaLocationDetail value)
        selectModulaLocationDetail,
    required TResult Function(_ClearLocationFilter value) clearLocationFilter,
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
    required TResult Function(_SaveCountDetails value) saveCountDetails,
    required TResult Function(_FindCountByCode value) findCountByCode,
    required TResult Function(_ClearScanCountResult value) clearScanCountResult,
    required TResult Function(_StartSheetScan value) startSheetScan,
    required TResult Function(_SheetScanned value) sheetScanned,
    required TResult Function(_StopSheetScan value) stopSheetScan,
    required TResult Function(_ConfirmComplete value) confirmComplete,
  }) {
    return changeWarehouseFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchEmployees value)? fetchEmployees,
    TResult? Function(_Search value)? search,
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_GenerateCode value)? generateCode,
    TResult? Function(_Save value)? save,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_FetchSheet value)? fetchSheet,
    TResult? Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult? Function(_SelectLocationScope value)? selectLocationScope,
    TResult? Function(_SelectProductLocation value)? selectProductLocation,
    TResult? Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult? Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult? Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult? Function(_SaveCountDetails value)? saveCountDetails,
    TResult? Function(_FindCountByCode value)? findCountByCode,
    TResult? Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult? Function(_StartSheetScan value)? startSheetScan,
    TResult? Function(_SheetScanned value)? sheetScanned,
    TResult? Function(_StopSheetScan value)? stopSheetScan,
    TResult? Function(_ConfirmComplete value)? confirmComplete,
  }) {
    return changeWarehouseFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchEmployees value)? fetchEmployees,
    TResult Function(_Search value)? search,
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_GenerateCode value)? generateCode,
    TResult Function(_Save value)? save,
    TResult Function(_GetById value)? getById,
    TResult Function(_Delete value)? delete,
    TResult Function(_FetchSheet value)? fetchSheet,
    TResult Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult Function(_SelectLocationScope value)? selectLocationScope,
    TResult Function(_SelectProductLocation value)? selectProductLocation,
    TResult Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult Function(_SaveCountDetails value)? saveCountDetails,
    TResult Function(_FindCountByCode value)? findCountByCode,
    TResult Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult Function(_StartSheetScan value)? startSheetScan,
    TResult Function(_SheetScanned value)? sheetScanned,
    TResult Function(_StopSheetScan value)? stopSheetScan,
    TResult Function(_ConfirmComplete value)? confirmComplete,
    required TResult orElse(),
  }) {
    if (changeWarehouseFilter != null) {
      return changeWarehouseFilter(this);
    }
    return orElse();
  }
}

abstract class _ChangeWarehouseFilter implements InventoryCheckEvent {
  const factory _ChangeWarehouseFilter(final int? warehouseId) =
      _$ChangeWarehouseFilterImpl;

  int? get warehouseId;
  @JsonKey(ignore: true)
  _$$ChangeWarehouseFilterImplCopyWith<_$ChangeWarehouseFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
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
    extends _$InventoryCheckEventCopyWithImpl<$Res, _$ChangeDateRangeImpl>
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
    return 'InventoryCheckEvent.changeDateRange(dateStart: $dateStart, dateEnd: $dateEnd)';
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
    required TResult Function() fetch,
    required TResult Function() fetchEmployees,
    required TResult Function(String keyword) search,
    required TResult Function(int? employeeId) selectEmployee,
    required TResult Function(int? warehouseId) changeWarehouseFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime date) generateCode,
    required TResult Function(InventoryCountSavePayload payload) save,
    required TResult Function(int id) getById,
    required TResult Function(int id) delete,
    required TResult Function(int countId) fetchSheet,
    required TResult Function(
            int countId, int warehouseId, int modulaLocationId, String? keyword)
        fetchLocationProgress,
    required TResult Function(InventoryLocationGroup group) selectLocationScope,
    required TResult Function(int? productLocationId) selectProductLocation,
    required TResult Function(int? modulaLocationId) selectModulaLocation,
    required TResult Function(int? detailId) selectModulaLocationDetail,
    required TResult Function() clearLocationFilter,
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
    required TResult Function(
            int countId, List<Map<String, dynamic>> changedItems)
        saveCountDetails,
    required TResult Function(String code) findCountByCode,
    required TResult Function() clearScanCountResult,
    required TResult Function(InventoryScanMode mode) startSheetScan,
    required TResult Function(String code) sheetScanned,
    required TResult Function() stopSheetScan,
    required TResult Function(int id, bool isComplete) confirmComplete,
  }) {
    return changeDateRange(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? fetchEmployees,
    TResult? Function(String keyword)? search,
    TResult? Function(int? employeeId)? selectEmployee,
    TResult? Function(int? warehouseId)? changeWarehouseFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime date)? generateCode,
    TResult? Function(InventoryCountSavePayload payload)? save,
    TResult? Function(int id)? getById,
    TResult? Function(int id)? delete,
    TResult? Function(int countId)? fetchSheet,
    TResult? Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult? Function(InventoryLocationGroup group)? selectLocationScope,
    TResult? Function(int? productLocationId)? selectProductLocation,
    TResult? Function(int? modulaLocationId)? selectModulaLocation,
    TResult? Function(int? detailId)? selectModulaLocationDetail,
    TResult? Function()? clearLocationFilter,
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
    TResult? Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult? Function(String code)? findCountByCode,
    TResult? Function()? clearScanCountResult,
    TResult? Function(InventoryScanMode mode)? startSheetScan,
    TResult? Function(String code)? sheetScanned,
    TResult? Function()? stopSheetScan,
    TResult? Function(int id, bool isComplete)? confirmComplete,
  }) {
    return changeDateRange?.call(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? fetchEmployees,
    TResult Function(String keyword)? search,
    TResult Function(int? employeeId)? selectEmployee,
    TResult Function(int? warehouseId)? changeWarehouseFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime date)? generateCode,
    TResult Function(InventoryCountSavePayload payload)? save,
    TResult Function(int id)? getById,
    TResult Function(int id)? delete,
    TResult Function(int countId)? fetchSheet,
    TResult Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult Function(InventoryLocationGroup group)? selectLocationScope,
    TResult Function(int? productLocationId)? selectProductLocation,
    TResult Function(int? modulaLocationId)? selectModulaLocation,
    TResult Function(int? detailId)? selectModulaLocationDetail,
    TResult Function()? clearLocationFilter,
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
    TResult Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult Function(String code)? findCountByCode,
    TResult Function()? clearScanCountResult,
    TResult Function(InventoryScanMode mode)? startSheetScan,
    TResult Function(String code)? sheetScanned,
    TResult Function()? stopSheetScan,
    TResult Function(int id, bool isComplete)? confirmComplete,
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
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchEmployees value) fetchEmployees,
    required TResult Function(_Search value) search,
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_ChangeWarehouseFilter value)
        changeWarehouseFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_GenerateCode value) generateCode,
    required TResult Function(_Save value) save,
    required TResult Function(_GetById value) getById,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FetchSheet value) fetchSheet,
    required TResult Function(_FetchLocationProgress value)
        fetchLocationProgress,
    required TResult Function(_SelectLocationScope value) selectLocationScope,
    required TResult Function(_SelectProductLocation value)
        selectProductLocation,
    required TResult Function(_SelectModulaLocation value) selectModulaLocation,
    required TResult Function(_SelectModulaLocationDetail value)
        selectModulaLocationDetail,
    required TResult Function(_ClearLocationFilter value) clearLocationFilter,
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
    required TResult Function(_SaveCountDetails value) saveCountDetails,
    required TResult Function(_FindCountByCode value) findCountByCode,
    required TResult Function(_ClearScanCountResult value) clearScanCountResult,
    required TResult Function(_StartSheetScan value) startSheetScan,
    required TResult Function(_SheetScanned value) sheetScanned,
    required TResult Function(_StopSheetScan value) stopSheetScan,
    required TResult Function(_ConfirmComplete value) confirmComplete,
  }) {
    return changeDateRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchEmployees value)? fetchEmployees,
    TResult? Function(_Search value)? search,
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_GenerateCode value)? generateCode,
    TResult? Function(_Save value)? save,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_FetchSheet value)? fetchSheet,
    TResult? Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult? Function(_SelectLocationScope value)? selectLocationScope,
    TResult? Function(_SelectProductLocation value)? selectProductLocation,
    TResult? Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult? Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult? Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult? Function(_SaveCountDetails value)? saveCountDetails,
    TResult? Function(_FindCountByCode value)? findCountByCode,
    TResult? Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult? Function(_StartSheetScan value)? startSheetScan,
    TResult? Function(_SheetScanned value)? sheetScanned,
    TResult? Function(_StopSheetScan value)? stopSheetScan,
    TResult? Function(_ConfirmComplete value)? confirmComplete,
  }) {
    return changeDateRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchEmployees value)? fetchEmployees,
    TResult Function(_Search value)? search,
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_GenerateCode value)? generateCode,
    TResult Function(_Save value)? save,
    TResult Function(_GetById value)? getById,
    TResult Function(_Delete value)? delete,
    TResult Function(_FetchSheet value)? fetchSheet,
    TResult Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult Function(_SelectLocationScope value)? selectLocationScope,
    TResult Function(_SelectProductLocation value)? selectProductLocation,
    TResult Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult Function(_SaveCountDetails value)? saveCountDetails,
    TResult Function(_FindCountByCode value)? findCountByCode,
    TResult Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult Function(_StartSheetScan value)? startSheetScan,
    TResult Function(_SheetScanned value)? sheetScanned,
    TResult Function(_StopSheetScan value)? stopSheetScan,
    TResult Function(_ConfirmComplete value)? confirmComplete,
    required TResult orElse(),
  }) {
    if (changeDateRange != null) {
      return changeDateRange(this);
    }
    return orElse();
  }
}

abstract class _ChangeDateRange implements InventoryCheckEvent {
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
abstract class _$$GenerateCodeImplCopyWith<$Res> {
  factory _$$GenerateCodeImplCopyWith(
          _$GenerateCodeImpl value, $Res Function(_$GenerateCodeImpl) then) =
      __$$GenerateCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class __$$GenerateCodeImplCopyWithImpl<$Res>
    extends _$InventoryCheckEventCopyWithImpl<$Res, _$GenerateCodeImpl>
    implements _$$GenerateCodeImplCopyWith<$Res> {
  __$$GenerateCodeImplCopyWithImpl(
      _$GenerateCodeImpl _value, $Res Function(_$GenerateCodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_$GenerateCodeImpl(
      null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$GenerateCodeImpl implements _GenerateCode {
  const _$GenerateCodeImpl(this.date);

  @override
  final DateTime date;

  @override
  String toString() {
    return 'InventoryCheckEvent.generateCode(date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateCodeImpl &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateCodeImplCopyWith<_$GenerateCodeImpl> get copyWith =>
      __$$GenerateCodeImplCopyWithImpl<_$GenerateCodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() fetchEmployees,
    required TResult Function(String keyword) search,
    required TResult Function(int? employeeId) selectEmployee,
    required TResult Function(int? warehouseId) changeWarehouseFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime date) generateCode,
    required TResult Function(InventoryCountSavePayload payload) save,
    required TResult Function(int id) getById,
    required TResult Function(int id) delete,
    required TResult Function(int countId) fetchSheet,
    required TResult Function(
            int countId, int warehouseId, int modulaLocationId, String? keyword)
        fetchLocationProgress,
    required TResult Function(InventoryLocationGroup group) selectLocationScope,
    required TResult Function(int? productLocationId) selectProductLocation,
    required TResult Function(int? modulaLocationId) selectModulaLocation,
    required TResult Function(int? detailId) selectModulaLocationDetail,
    required TResult Function() clearLocationFilter,
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
    required TResult Function(
            int countId, List<Map<String, dynamic>> changedItems)
        saveCountDetails,
    required TResult Function(String code) findCountByCode,
    required TResult Function() clearScanCountResult,
    required TResult Function(InventoryScanMode mode) startSheetScan,
    required TResult Function(String code) sheetScanned,
    required TResult Function() stopSheetScan,
    required TResult Function(int id, bool isComplete) confirmComplete,
  }) {
    return generateCode(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? fetchEmployees,
    TResult? Function(String keyword)? search,
    TResult? Function(int? employeeId)? selectEmployee,
    TResult? Function(int? warehouseId)? changeWarehouseFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime date)? generateCode,
    TResult? Function(InventoryCountSavePayload payload)? save,
    TResult? Function(int id)? getById,
    TResult? Function(int id)? delete,
    TResult? Function(int countId)? fetchSheet,
    TResult? Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult? Function(InventoryLocationGroup group)? selectLocationScope,
    TResult? Function(int? productLocationId)? selectProductLocation,
    TResult? Function(int? modulaLocationId)? selectModulaLocation,
    TResult? Function(int? detailId)? selectModulaLocationDetail,
    TResult? Function()? clearLocationFilter,
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
    TResult? Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult? Function(String code)? findCountByCode,
    TResult? Function()? clearScanCountResult,
    TResult? Function(InventoryScanMode mode)? startSheetScan,
    TResult? Function(String code)? sheetScanned,
    TResult? Function()? stopSheetScan,
    TResult? Function(int id, bool isComplete)? confirmComplete,
  }) {
    return generateCode?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? fetchEmployees,
    TResult Function(String keyword)? search,
    TResult Function(int? employeeId)? selectEmployee,
    TResult Function(int? warehouseId)? changeWarehouseFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime date)? generateCode,
    TResult Function(InventoryCountSavePayload payload)? save,
    TResult Function(int id)? getById,
    TResult Function(int id)? delete,
    TResult Function(int countId)? fetchSheet,
    TResult Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult Function(InventoryLocationGroup group)? selectLocationScope,
    TResult Function(int? productLocationId)? selectProductLocation,
    TResult Function(int? modulaLocationId)? selectModulaLocation,
    TResult Function(int? detailId)? selectModulaLocationDetail,
    TResult Function()? clearLocationFilter,
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
    TResult Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult Function(String code)? findCountByCode,
    TResult Function()? clearScanCountResult,
    TResult Function(InventoryScanMode mode)? startSheetScan,
    TResult Function(String code)? sheetScanned,
    TResult Function()? stopSheetScan,
    TResult Function(int id, bool isComplete)? confirmComplete,
    required TResult orElse(),
  }) {
    if (generateCode != null) {
      return generateCode(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchEmployees value) fetchEmployees,
    required TResult Function(_Search value) search,
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_ChangeWarehouseFilter value)
        changeWarehouseFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_GenerateCode value) generateCode,
    required TResult Function(_Save value) save,
    required TResult Function(_GetById value) getById,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FetchSheet value) fetchSheet,
    required TResult Function(_FetchLocationProgress value)
        fetchLocationProgress,
    required TResult Function(_SelectLocationScope value) selectLocationScope,
    required TResult Function(_SelectProductLocation value)
        selectProductLocation,
    required TResult Function(_SelectModulaLocation value) selectModulaLocation,
    required TResult Function(_SelectModulaLocationDetail value)
        selectModulaLocationDetail,
    required TResult Function(_ClearLocationFilter value) clearLocationFilter,
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
    required TResult Function(_SaveCountDetails value) saveCountDetails,
    required TResult Function(_FindCountByCode value) findCountByCode,
    required TResult Function(_ClearScanCountResult value) clearScanCountResult,
    required TResult Function(_StartSheetScan value) startSheetScan,
    required TResult Function(_SheetScanned value) sheetScanned,
    required TResult Function(_StopSheetScan value) stopSheetScan,
    required TResult Function(_ConfirmComplete value) confirmComplete,
  }) {
    return generateCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchEmployees value)? fetchEmployees,
    TResult? Function(_Search value)? search,
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_GenerateCode value)? generateCode,
    TResult? Function(_Save value)? save,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_FetchSheet value)? fetchSheet,
    TResult? Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult? Function(_SelectLocationScope value)? selectLocationScope,
    TResult? Function(_SelectProductLocation value)? selectProductLocation,
    TResult? Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult? Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult? Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult? Function(_SaveCountDetails value)? saveCountDetails,
    TResult? Function(_FindCountByCode value)? findCountByCode,
    TResult? Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult? Function(_StartSheetScan value)? startSheetScan,
    TResult? Function(_SheetScanned value)? sheetScanned,
    TResult? Function(_StopSheetScan value)? stopSheetScan,
    TResult? Function(_ConfirmComplete value)? confirmComplete,
  }) {
    return generateCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchEmployees value)? fetchEmployees,
    TResult Function(_Search value)? search,
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_GenerateCode value)? generateCode,
    TResult Function(_Save value)? save,
    TResult Function(_GetById value)? getById,
    TResult Function(_Delete value)? delete,
    TResult Function(_FetchSheet value)? fetchSheet,
    TResult Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult Function(_SelectLocationScope value)? selectLocationScope,
    TResult Function(_SelectProductLocation value)? selectProductLocation,
    TResult Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult Function(_SaveCountDetails value)? saveCountDetails,
    TResult Function(_FindCountByCode value)? findCountByCode,
    TResult Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult Function(_StartSheetScan value)? startSheetScan,
    TResult Function(_SheetScanned value)? sheetScanned,
    TResult Function(_StopSheetScan value)? stopSheetScan,
    TResult Function(_ConfirmComplete value)? confirmComplete,
    required TResult orElse(),
  }) {
    if (generateCode != null) {
      return generateCode(this);
    }
    return orElse();
  }
}

abstract class _GenerateCode implements InventoryCheckEvent {
  const factory _GenerateCode(final DateTime date) = _$GenerateCodeImpl;

  DateTime get date;
  @JsonKey(ignore: true)
  _$$GenerateCodeImplCopyWith<_$GenerateCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveImplCopyWith<$Res> {
  factory _$$SaveImplCopyWith(
          _$SaveImpl value, $Res Function(_$SaveImpl) then) =
      __$$SaveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({InventoryCountSavePayload payload});

  $InventoryCountSavePayloadCopyWith<$Res> get payload;
}

/// @nodoc
class __$$SaveImplCopyWithImpl<$Res>
    extends _$InventoryCheckEventCopyWithImpl<$Res, _$SaveImpl>
    implements _$$SaveImplCopyWith<$Res> {
  __$$SaveImplCopyWithImpl(_$SaveImpl _value, $Res Function(_$SaveImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payload = null,
  }) {
    return _then(_$SaveImpl(
      null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as InventoryCountSavePayload,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $InventoryCountSavePayloadCopyWith<$Res> get payload {
    return $InventoryCountSavePayloadCopyWith<$Res>(_value.payload, (value) {
      return _then(_value.copyWith(payload: value));
    });
  }
}

/// @nodoc

class _$SaveImpl implements _Save {
  const _$SaveImpl(this.payload);

  @override
  final InventoryCountSavePayload payload;

  @override
  String toString() {
    return 'InventoryCheckEvent.save(payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveImpl &&
            (identical(other.payload, payload) || other.payload == payload));
  }

  @override
  int get hashCode => Object.hash(runtimeType, payload);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveImplCopyWith<_$SaveImpl> get copyWith =>
      __$$SaveImplCopyWithImpl<_$SaveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() fetchEmployees,
    required TResult Function(String keyword) search,
    required TResult Function(int? employeeId) selectEmployee,
    required TResult Function(int? warehouseId) changeWarehouseFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime date) generateCode,
    required TResult Function(InventoryCountSavePayload payload) save,
    required TResult Function(int id) getById,
    required TResult Function(int id) delete,
    required TResult Function(int countId) fetchSheet,
    required TResult Function(
            int countId, int warehouseId, int modulaLocationId, String? keyword)
        fetchLocationProgress,
    required TResult Function(InventoryLocationGroup group) selectLocationScope,
    required TResult Function(int? productLocationId) selectProductLocation,
    required TResult Function(int? modulaLocationId) selectModulaLocation,
    required TResult Function(int? detailId) selectModulaLocationDetail,
    required TResult Function() clearLocationFilter,
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
    required TResult Function(
            int countId, List<Map<String, dynamic>> changedItems)
        saveCountDetails,
    required TResult Function(String code) findCountByCode,
    required TResult Function() clearScanCountResult,
    required TResult Function(InventoryScanMode mode) startSheetScan,
    required TResult Function(String code) sheetScanned,
    required TResult Function() stopSheetScan,
    required TResult Function(int id, bool isComplete) confirmComplete,
  }) {
    return save(payload);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? fetchEmployees,
    TResult? Function(String keyword)? search,
    TResult? Function(int? employeeId)? selectEmployee,
    TResult? Function(int? warehouseId)? changeWarehouseFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime date)? generateCode,
    TResult? Function(InventoryCountSavePayload payload)? save,
    TResult? Function(int id)? getById,
    TResult? Function(int id)? delete,
    TResult? Function(int countId)? fetchSheet,
    TResult? Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult? Function(InventoryLocationGroup group)? selectLocationScope,
    TResult? Function(int? productLocationId)? selectProductLocation,
    TResult? Function(int? modulaLocationId)? selectModulaLocation,
    TResult? Function(int? detailId)? selectModulaLocationDetail,
    TResult? Function()? clearLocationFilter,
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
    TResult? Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult? Function(String code)? findCountByCode,
    TResult? Function()? clearScanCountResult,
    TResult? Function(InventoryScanMode mode)? startSheetScan,
    TResult? Function(String code)? sheetScanned,
    TResult? Function()? stopSheetScan,
    TResult? Function(int id, bool isComplete)? confirmComplete,
  }) {
    return save?.call(payload);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? fetchEmployees,
    TResult Function(String keyword)? search,
    TResult Function(int? employeeId)? selectEmployee,
    TResult Function(int? warehouseId)? changeWarehouseFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime date)? generateCode,
    TResult Function(InventoryCountSavePayload payload)? save,
    TResult Function(int id)? getById,
    TResult Function(int id)? delete,
    TResult Function(int countId)? fetchSheet,
    TResult Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult Function(InventoryLocationGroup group)? selectLocationScope,
    TResult Function(int? productLocationId)? selectProductLocation,
    TResult Function(int? modulaLocationId)? selectModulaLocation,
    TResult Function(int? detailId)? selectModulaLocationDetail,
    TResult Function()? clearLocationFilter,
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
    TResult Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult Function(String code)? findCountByCode,
    TResult Function()? clearScanCountResult,
    TResult Function(InventoryScanMode mode)? startSheetScan,
    TResult Function(String code)? sheetScanned,
    TResult Function()? stopSheetScan,
    TResult Function(int id, bool isComplete)? confirmComplete,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(payload);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchEmployees value) fetchEmployees,
    required TResult Function(_Search value) search,
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_ChangeWarehouseFilter value)
        changeWarehouseFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_GenerateCode value) generateCode,
    required TResult Function(_Save value) save,
    required TResult Function(_GetById value) getById,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FetchSheet value) fetchSheet,
    required TResult Function(_FetchLocationProgress value)
        fetchLocationProgress,
    required TResult Function(_SelectLocationScope value) selectLocationScope,
    required TResult Function(_SelectProductLocation value)
        selectProductLocation,
    required TResult Function(_SelectModulaLocation value) selectModulaLocation,
    required TResult Function(_SelectModulaLocationDetail value)
        selectModulaLocationDetail,
    required TResult Function(_ClearLocationFilter value) clearLocationFilter,
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
    required TResult Function(_SaveCountDetails value) saveCountDetails,
    required TResult Function(_FindCountByCode value) findCountByCode,
    required TResult Function(_ClearScanCountResult value) clearScanCountResult,
    required TResult Function(_StartSheetScan value) startSheetScan,
    required TResult Function(_SheetScanned value) sheetScanned,
    required TResult Function(_StopSheetScan value) stopSheetScan,
    required TResult Function(_ConfirmComplete value) confirmComplete,
  }) {
    return save(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchEmployees value)? fetchEmployees,
    TResult? Function(_Search value)? search,
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_GenerateCode value)? generateCode,
    TResult? Function(_Save value)? save,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_FetchSheet value)? fetchSheet,
    TResult? Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult? Function(_SelectLocationScope value)? selectLocationScope,
    TResult? Function(_SelectProductLocation value)? selectProductLocation,
    TResult? Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult? Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult? Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult? Function(_SaveCountDetails value)? saveCountDetails,
    TResult? Function(_FindCountByCode value)? findCountByCode,
    TResult? Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult? Function(_StartSheetScan value)? startSheetScan,
    TResult? Function(_SheetScanned value)? sheetScanned,
    TResult? Function(_StopSheetScan value)? stopSheetScan,
    TResult? Function(_ConfirmComplete value)? confirmComplete,
  }) {
    return save?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchEmployees value)? fetchEmployees,
    TResult Function(_Search value)? search,
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_GenerateCode value)? generateCode,
    TResult Function(_Save value)? save,
    TResult Function(_GetById value)? getById,
    TResult Function(_Delete value)? delete,
    TResult Function(_FetchSheet value)? fetchSheet,
    TResult Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult Function(_SelectLocationScope value)? selectLocationScope,
    TResult Function(_SelectProductLocation value)? selectProductLocation,
    TResult Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult Function(_SaveCountDetails value)? saveCountDetails,
    TResult Function(_FindCountByCode value)? findCountByCode,
    TResult Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult Function(_StartSheetScan value)? startSheetScan,
    TResult Function(_SheetScanned value)? sheetScanned,
    TResult Function(_StopSheetScan value)? stopSheetScan,
    TResult Function(_ConfirmComplete value)? confirmComplete,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(this);
    }
    return orElse();
  }
}

abstract class _Save implements InventoryCheckEvent {
  const factory _Save(final InventoryCountSavePayload payload) = _$SaveImpl;

  InventoryCountSavePayload get payload;
  @JsonKey(ignore: true)
  _$$SaveImplCopyWith<_$SaveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetByIdImplCopyWith<$Res> {
  factory _$$GetByIdImplCopyWith(
          _$GetByIdImpl value, $Res Function(_$GetByIdImpl) then) =
      __$$GetByIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$GetByIdImplCopyWithImpl<$Res>
    extends _$InventoryCheckEventCopyWithImpl<$Res, _$GetByIdImpl>
    implements _$$GetByIdImplCopyWith<$Res> {
  __$$GetByIdImplCopyWithImpl(
      _$GetByIdImpl _value, $Res Function(_$GetByIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$GetByIdImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetByIdImpl implements _GetById {
  const _$GetByIdImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'InventoryCheckEvent.getById(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetByIdImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetByIdImplCopyWith<_$GetByIdImpl> get copyWith =>
      __$$GetByIdImplCopyWithImpl<_$GetByIdImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() fetchEmployees,
    required TResult Function(String keyword) search,
    required TResult Function(int? employeeId) selectEmployee,
    required TResult Function(int? warehouseId) changeWarehouseFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime date) generateCode,
    required TResult Function(InventoryCountSavePayload payload) save,
    required TResult Function(int id) getById,
    required TResult Function(int id) delete,
    required TResult Function(int countId) fetchSheet,
    required TResult Function(
            int countId, int warehouseId, int modulaLocationId, String? keyword)
        fetchLocationProgress,
    required TResult Function(InventoryLocationGroup group) selectLocationScope,
    required TResult Function(int? productLocationId) selectProductLocation,
    required TResult Function(int? modulaLocationId) selectModulaLocation,
    required TResult Function(int? detailId) selectModulaLocationDetail,
    required TResult Function() clearLocationFilter,
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
    required TResult Function(
            int countId, List<Map<String, dynamic>> changedItems)
        saveCountDetails,
    required TResult Function(String code) findCountByCode,
    required TResult Function() clearScanCountResult,
    required TResult Function(InventoryScanMode mode) startSheetScan,
    required TResult Function(String code) sheetScanned,
    required TResult Function() stopSheetScan,
    required TResult Function(int id, bool isComplete) confirmComplete,
  }) {
    return getById(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? fetchEmployees,
    TResult? Function(String keyword)? search,
    TResult? Function(int? employeeId)? selectEmployee,
    TResult? Function(int? warehouseId)? changeWarehouseFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime date)? generateCode,
    TResult? Function(InventoryCountSavePayload payload)? save,
    TResult? Function(int id)? getById,
    TResult? Function(int id)? delete,
    TResult? Function(int countId)? fetchSheet,
    TResult? Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult? Function(InventoryLocationGroup group)? selectLocationScope,
    TResult? Function(int? productLocationId)? selectProductLocation,
    TResult? Function(int? modulaLocationId)? selectModulaLocation,
    TResult? Function(int? detailId)? selectModulaLocationDetail,
    TResult? Function()? clearLocationFilter,
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
    TResult? Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult? Function(String code)? findCountByCode,
    TResult? Function()? clearScanCountResult,
    TResult? Function(InventoryScanMode mode)? startSheetScan,
    TResult? Function(String code)? sheetScanned,
    TResult? Function()? stopSheetScan,
    TResult? Function(int id, bool isComplete)? confirmComplete,
  }) {
    return getById?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? fetchEmployees,
    TResult Function(String keyword)? search,
    TResult Function(int? employeeId)? selectEmployee,
    TResult Function(int? warehouseId)? changeWarehouseFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime date)? generateCode,
    TResult Function(InventoryCountSavePayload payload)? save,
    TResult Function(int id)? getById,
    TResult Function(int id)? delete,
    TResult Function(int countId)? fetchSheet,
    TResult Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult Function(InventoryLocationGroup group)? selectLocationScope,
    TResult Function(int? productLocationId)? selectProductLocation,
    TResult Function(int? modulaLocationId)? selectModulaLocation,
    TResult Function(int? detailId)? selectModulaLocationDetail,
    TResult Function()? clearLocationFilter,
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
    TResult Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult Function(String code)? findCountByCode,
    TResult Function()? clearScanCountResult,
    TResult Function(InventoryScanMode mode)? startSheetScan,
    TResult Function(String code)? sheetScanned,
    TResult Function()? stopSheetScan,
    TResult Function(int id, bool isComplete)? confirmComplete,
    required TResult orElse(),
  }) {
    if (getById != null) {
      return getById(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchEmployees value) fetchEmployees,
    required TResult Function(_Search value) search,
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_ChangeWarehouseFilter value)
        changeWarehouseFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_GenerateCode value) generateCode,
    required TResult Function(_Save value) save,
    required TResult Function(_GetById value) getById,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FetchSheet value) fetchSheet,
    required TResult Function(_FetchLocationProgress value)
        fetchLocationProgress,
    required TResult Function(_SelectLocationScope value) selectLocationScope,
    required TResult Function(_SelectProductLocation value)
        selectProductLocation,
    required TResult Function(_SelectModulaLocation value) selectModulaLocation,
    required TResult Function(_SelectModulaLocationDetail value)
        selectModulaLocationDetail,
    required TResult Function(_ClearLocationFilter value) clearLocationFilter,
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
    required TResult Function(_SaveCountDetails value) saveCountDetails,
    required TResult Function(_FindCountByCode value) findCountByCode,
    required TResult Function(_ClearScanCountResult value) clearScanCountResult,
    required TResult Function(_StartSheetScan value) startSheetScan,
    required TResult Function(_SheetScanned value) sheetScanned,
    required TResult Function(_StopSheetScan value) stopSheetScan,
    required TResult Function(_ConfirmComplete value) confirmComplete,
  }) {
    return getById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchEmployees value)? fetchEmployees,
    TResult? Function(_Search value)? search,
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_GenerateCode value)? generateCode,
    TResult? Function(_Save value)? save,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_FetchSheet value)? fetchSheet,
    TResult? Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult? Function(_SelectLocationScope value)? selectLocationScope,
    TResult? Function(_SelectProductLocation value)? selectProductLocation,
    TResult? Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult? Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult? Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult? Function(_SaveCountDetails value)? saveCountDetails,
    TResult? Function(_FindCountByCode value)? findCountByCode,
    TResult? Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult? Function(_StartSheetScan value)? startSheetScan,
    TResult? Function(_SheetScanned value)? sheetScanned,
    TResult? Function(_StopSheetScan value)? stopSheetScan,
    TResult? Function(_ConfirmComplete value)? confirmComplete,
  }) {
    return getById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchEmployees value)? fetchEmployees,
    TResult Function(_Search value)? search,
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_GenerateCode value)? generateCode,
    TResult Function(_Save value)? save,
    TResult Function(_GetById value)? getById,
    TResult Function(_Delete value)? delete,
    TResult Function(_FetchSheet value)? fetchSheet,
    TResult Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult Function(_SelectLocationScope value)? selectLocationScope,
    TResult Function(_SelectProductLocation value)? selectProductLocation,
    TResult Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult Function(_SaveCountDetails value)? saveCountDetails,
    TResult Function(_FindCountByCode value)? findCountByCode,
    TResult Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult Function(_StartSheetScan value)? startSheetScan,
    TResult Function(_SheetScanned value)? sheetScanned,
    TResult Function(_StopSheetScan value)? stopSheetScan,
    TResult Function(_ConfirmComplete value)? confirmComplete,
    required TResult orElse(),
  }) {
    if (getById != null) {
      return getById(this);
    }
    return orElse();
  }
}

abstract class _GetById implements InventoryCheckEvent {
  const factory _GetById(final int id) = _$GetByIdImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$GetByIdImplCopyWith<_$GetByIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteImplCopyWith<$Res> {
  factory _$$DeleteImplCopyWith(
          _$DeleteImpl value, $Res Function(_$DeleteImpl) then) =
      __$$DeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res>
    extends _$InventoryCheckEventCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
      _$DeleteImpl _value, $Res Function(_$DeleteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteImpl implements _Delete {
  const _$DeleteImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'InventoryCheckEvent.delete(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      __$$DeleteImplCopyWithImpl<_$DeleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() fetchEmployees,
    required TResult Function(String keyword) search,
    required TResult Function(int? employeeId) selectEmployee,
    required TResult Function(int? warehouseId) changeWarehouseFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime date) generateCode,
    required TResult Function(InventoryCountSavePayload payload) save,
    required TResult Function(int id) getById,
    required TResult Function(int id) delete,
    required TResult Function(int countId) fetchSheet,
    required TResult Function(
            int countId, int warehouseId, int modulaLocationId, String? keyword)
        fetchLocationProgress,
    required TResult Function(InventoryLocationGroup group) selectLocationScope,
    required TResult Function(int? productLocationId) selectProductLocation,
    required TResult Function(int? modulaLocationId) selectModulaLocation,
    required TResult Function(int? detailId) selectModulaLocationDetail,
    required TResult Function() clearLocationFilter,
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
    required TResult Function(
            int countId, List<Map<String, dynamic>> changedItems)
        saveCountDetails,
    required TResult Function(String code) findCountByCode,
    required TResult Function() clearScanCountResult,
    required TResult Function(InventoryScanMode mode) startSheetScan,
    required TResult Function(String code) sheetScanned,
    required TResult Function() stopSheetScan,
    required TResult Function(int id, bool isComplete) confirmComplete,
  }) {
    return delete(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? fetchEmployees,
    TResult? Function(String keyword)? search,
    TResult? Function(int? employeeId)? selectEmployee,
    TResult? Function(int? warehouseId)? changeWarehouseFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime date)? generateCode,
    TResult? Function(InventoryCountSavePayload payload)? save,
    TResult? Function(int id)? getById,
    TResult? Function(int id)? delete,
    TResult? Function(int countId)? fetchSheet,
    TResult? Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult? Function(InventoryLocationGroup group)? selectLocationScope,
    TResult? Function(int? productLocationId)? selectProductLocation,
    TResult? Function(int? modulaLocationId)? selectModulaLocation,
    TResult? Function(int? detailId)? selectModulaLocationDetail,
    TResult? Function()? clearLocationFilter,
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
    TResult? Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult? Function(String code)? findCountByCode,
    TResult? Function()? clearScanCountResult,
    TResult? Function(InventoryScanMode mode)? startSheetScan,
    TResult? Function(String code)? sheetScanned,
    TResult? Function()? stopSheetScan,
    TResult? Function(int id, bool isComplete)? confirmComplete,
  }) {
    return delete?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? fetchEmployees,
    TResult Function(String keyword)? search,
    TResult Function(int? employeeId)? selectEmployee,
    TResult Function(int? warehouseId)? changeWarehouseFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime date)? generateCode,
    TResult Function(InventoryCountSavePayload payload)? save,
    TResult Function(int id)? getById,
    TResult Function(int id)? delete,
    TResult Function(int countId)? fetchSheet,
    TResult Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult Function(InventoryLocationGroup group)? selectLocationScope,
    TResult Function(int? productLocationId)? selectProductLocation,
    TResult Function(int? modulaLocationId)? selectModulaLocation,
    TResult Function(int? detailId)? selectModulaLocationDetail,
    TResult Function()? clearLocationFilter,
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
    TResult Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult Function(String code)? findCountByCode,
    TResult Function()? clearScanCountResult,
    TResult Function(InventoryScanMode mode)? startSheetScan,
    TResult Function(String code)? sheetScanned,
    TResult Function()? stopSheetScan,
    TResult Function(int id, bool isComplete)? confirmComplete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchEmployees value) fetchEmployees,
    required TResult Function(_Search value) search,
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_ChangeWarehouseFilter value)
        changeWarehouseFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_GenerateCode value) generateCode,
    required TResult Function(_Save value) save,
    required TResult Function(_GetById value) getById,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FetchSheet value) fetchSheet,
    required TResult Function(_FetchLocationProgress value)
        fetchLocationProgress,
    required TResult Function(_SelectLocationScope value) selectLocationScope,
    required TResult Function(_SelectProductLocation value)
        selectProductLocation,
    required TResult Function(_SelectModulaLocation value) selectModulaLocation,
    required TResult Function(_SelectModulaLocationDetail value)
        selectModulaLocationDetail,
    required TResult Function(_ClearLocationFilter value) clearLocationFilter,
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
    required TResult Function(_SaveCountDetails value) saveCountDetails,
    required TResult Function(_FindCountByCode value) findCountByCode,
    required TResult Function(_ClearScanCountResult value) clearScanCountResult,
    required TResult Function(_StartSheetScan value) startSheetScan,
    required TResult Function(_SheetScanned value) sheetScanned,
    required TResult Function(_StopSheetScan value) stopSheetScan,
    required TResult Function(_ConfirmComplete value) confirmComplete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchEmployees value)? fetchEmployees,
    TResult? Function(_Search value)? search,
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_GenerateCode value)? generateCode,
    TResult? Function(_Save value)? save,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_FetchSheet value)? fetchSheet,
    TResult? Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult? Function(_SelectLocationScope value)? selectLocationScope,
    TResult? Function(_SelectProductLocation value)? selectProductLocation,
    TResult? Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult? Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult? Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult? Function(_SaveCountDetails value)? saveCountDetails,
    TResult? Function(_FindCountByCode value)? findCountByCode,
    TResult? Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult? Function(_StartSheetScan value)? startSheetScan,
    TResult? Function(_SheetScanned value)? sheetScanned,
    TResult? Function(_StopSheetScan value)? stopSheetScan,
    TResult? Function(_ConfirmComplete value)? confirmComplete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchEmployees value)? fetchEmployees,
    TResult Function(_Search value)? search,
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_GenerateCode value)? generateCode,
    TResult Function(_Save value)? save,
    TResult Function(_GetById value)? getById,
    TResult Function(_Delete value)? delete,
    TResult Function(_FetchSheet value)? fetchSheet,
    TResult Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult Function(_SelectLocationScope value)? selectLocationScope,
    TResult Function(_SelectProductLocation value)? selectProductLocation,
    TResult Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult Function(_SaveCountDetails value)? saveCountDetails,
    TResult Function(_FindCountByCode value)? findCountByCode,
    TResult Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult Function(_StartSheetScan value)? startSheetScan,
    TResult Function(_SheetScanned value)? sheetScanned,
    TResult Function(_StopSheetScan value)? stopSheetScan,
    TResult Function(_ConfirmComplete value)? confirmComplete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements InventoryCheckEvent {
  const factory _Delete(final int id) = _$DeleteImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchSheetImplCopyWith<$Res> {
  factory _$$FetchSheetImplCopyWith(
          _$FetchSheetImpl value, $Res Function(_$FetchSheetImpl) then) =
      __$$FetchSheetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int countId});
}

/// @nodoc
class __$$FetchSheetImplCopyWithImpl<$Res>
    extends _$InventoryCheckEventCopyWithImpl<$Res, _$FetchSheetImpl>
    implements _$$FetchSheetImplCopyWith<$Res> {
  __$$FetchSheetImplCopyWithImpl(
      _$FetchSheetImpl _value, $Res Function(_$FetchSheetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countId = null,
  }) {
    return _then(_$FetchSheetImpl(
      null == countId
          ? _value.countId
          : countId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchSheetImpl implements _FetchSheet {
  const _$FetchSheetImpl(this.countId);

  @override
  final int countId;

  @override
  String toString() {
    return 'InventoryCheckEvent.fetchSheet(countId: $countId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchSheetImpl &&
            (identical(other.countId, countId) || other.countId == countId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, countId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchSheetImplCopyWith<_$FetchSheetImpl> get copyWith =>
      __$$FetchSheetImplCopyWithImpl<_$FetchSheetImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() fetchEmployees,
    required TResult Function(String keyword) search,
    required TResult Function(int? employeeId) selectEmployee,
    required TResult Function(int? warehouseId) changeWarehouseFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime date) generateCode,
    required TResult Function(InventoryCountSavePayload payload) save,
    required TResult Function(int id) getById,
    required TResult Function(int id) delete,
    required TResult Function(int countId) fetchSheet,
    required TResult Function(
            int countId, int warehouseId, int modulaLocationId, String? keyword)
        fetchLocationProgress,
    required TResult Function(InventoryLocationGroup group) selectLocationScope,
    required TResult Function(int? productLocationId) selectProductLocation,
    required TResult Function(int? modulaLocationId) selectModulaLocation,
    required TResult Function(int? detailId) selectModulaLocationDetail,
    required TResult Function() clearLocationFilter,
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
    required TResult Function(
            int countId, List<Map<String, dynamic>> changedItems)
        saveCountDetails,
    required TResult Function(String code) findCountByCode,
    required TResult Function() clearScanCountResult,
    required TResult Function(InventoryScanMode mode) startSheetScan,
    required TResult Function(String code) sheetScanned,
    required TResult Function() stopSheetScan,
    required TResult Function(int id, bool isComplete) confirmComplete,
  }) {
    return fetchSheet(countId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? fetchEmployees,
    TResult? Function(String keyword)? search,
    TResult? Function(int? employeeId)? selectEmployee,
    TResult? Function(int? warehouseId)? changeWarehouseFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime date)? generateCode,
    TResult? Function(InventoryCountSavePayload payload)? save,
    TResult? Function(int id)? getById,
    TResult? Function(int id)? delete,
    TResult? Function(int countId)? fetchSheet,
    TResult? Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult? Function(InventoryLocationGroup group)? selectLocationScope,
    TResult? Function(int? productLocationId)? selectProductLocation,
    TResult? Function(int? modulaLocationId)? selectModulaLocation,
    TResult? Function(int? detailId)? selectModulaLocationDetail,
    TResult? Function()? clearLocationFilter,
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
    TResult? Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult? Function(String code)? findCountByCode,
    TResult? Function()? clearScanCountResult,
    TResult? Function(InventoryScanMode mode)? startSheetScan,
    TResult? Function(String code)? sheetScanned,
    TResult? Function()? stopSheetScan,
    TResult? Function(int id, bool isComplete)? confirmComplete,
  }) {
    return fetchSheet?.call(countId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? fetchEmployees,
    TResult Function(String keyword)? search,
    TResult Function(int? employeeId)? selectEmployee,
    TResult Function(int? warehouseId)? changeWarehouseFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime date)? generateCode,
    TResult Function(InventoryCountSavePayload payload)? save,
    TResult Function(int id)? getById,
    TResult Function(int id)? delete,
    TResult Function(int countId)? fetchSheet,
    TResult Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult Function(InventoryLocationGroup group)? selectLocationScope,
    TResult Function(int? productLocationId)? selectProductLocation,
    TResult Function(int? modulaLocationId)? selectModulaLocation,
    TResult Function(int? detailId)? selectModulaLocationDetail,
    TResult Function()? clearLocationFilter,
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
    TResult Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult Function(String code)? findCountByCode,
    TResult Function()? clearScanCountResult,
    TResult Function(InventoryScanMode mode)? startSheetScan,
    TResult Function(String code)? sheetScanned,
    TResult Function()? stopSheetScan,
    TResult Function(int id, bool isComplete)? confirmComplete,
    required TResult orElse(),
  }) {
    if (fetchSheet != null) {
      return fetchSheet(countId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchEmployees value) fetchEmployees,
    required TResult Function(_Search value) search,
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_ChangeWarehouseFilter value)
        changeWarehouseFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_GenerateCode value) generateCode,
    required TResult Function(_Save value) save,
    required TResult Function(_GetById value) getById,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FetchSheet value) fetchSheet,
    required TResult Function(_FetchLocationProgress value)
        fetchLocationProgress,
    required TResult Function(_SelectLocationScope value) selectLocationScope,
    required TResult Function(_SelectProductLocation value)
        selectProductLocation,
    required TResult Function(_SelectModulaLocation value) selectModulaLocation,
    required TResult Function(_SelectModulaLocationDetail value)
        selectModulaLocationDetail,
    required TResult Function(_ClearLocationFilter value) clearLocationFilter,
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
    required TResult Function(_SaveCountDetails value) saveCountDetails,
    required TResult Function(_FindCountByCode value) findCountByCode,
    required TResult Function(_ClearScanCountResult value) clearScanCountResult,
    required TResult Function(_StartSheetScan value) startSheetScan,
    required TResult Function(_SheetScanned value) sheetScanned,
    required TResult Function(_StopSheetScan value) stopSheetScan,
    required TResult Function(_ConfirmComplete value) confirmComplete,
  }) {
    return fetchSheet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchEmployees value)? fetchEmployees,
    TResult? Function(_Search value)? search,
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_GenerateCode value)? generateCode,
    TResult? Function(_Save value)? save,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_FetchSheet value)? fetchSheet,
    TResult? Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult? Function(_SelectLocationScope value)? selectLocationScope,
    TResult? Function(_SelectProductLocation value)? selectProductLocation,
    TResult? Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult? Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult? Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult? Function(_SaveCountDetails value)? saveCountDetails,
    TResult? Function(_FindCountByCode value)? findCountByCode,
    TResult? Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult? Function(_StartSheetScan value)? startSheetScan,
    TResult? Function(_SheetScanned value)? sheetScanned,
    TResult? Function(_StopSheetScan value)? stopSheetScan,
    TResult? Function(_ConfirmComplete value)? confirmComplete,
  }) {
    return fetchSheet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchEmployees value)? fetchEmployees,
    TResult Function(_Search value)? search,
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_GenerateCode value)? generateCode,
    TResult Function(_Save value)? save,
    TResult Function(_GetById value)? getById,
    TResult Function(_Delete value)? delete,
    TResult Function(_FetchSheet value)? fetchSheet,
    TResult Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult Function(_SelectLocationScope value)? selectLocationScope,
    TResult Function(_SelectProductLocation value)? selectProductLocation,
    TResult Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult Function(_SaveCountDetails value)? saveCountDetails,
    TResult Function(_FindCountByCode value)? findCountByCode,
    TResult Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult Function(_StartSheetScan value)? startSheetScan,
    TResult Function(_SheetScanned value)? sheetScanned,
    TResult Function(_StopSheetScan value)? stopSheetScan,
    TResult Function(_ConfirmComplete value)? confirmComplete,
    required TResult orElse(),
  }) {
    if (fetchSheet != null) {
      return fetchSheet(this);
    }
    return orElse();
  }
}

abstract class _FetchSheet implements InventoryCheckEvent {
  const factory _FetchSheet(final int countId) = _$FetchSheetImpl;

  int get countId;
  @JsonKey(ignore: true)
  _$$FetchSheetImplCopyWith<_$FetchSheetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchLocationProgressImplCopyWith<$Res> {
  factory _$$FetchLocationProgressImplCopyWith(
          _$FetchLocationProgressImpl value,
          $Res Function(_$FetchLocationProgressImpl) then) =
      __$$FetchLocationProgressImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int countId, int warehouseId, int modulaLocationId, String? keyword});
}

/// @nodoc
class __$$FetchLocationProgressImplCopyWithImpl<$Res>
    extends _$InventoryCheckEventCopyWithImpl<$Res, _$FetchLocationProgressImpl>
    implements _$$FetchLocationProgressImplCopyWith<$Res> {
  __$$FetchLocationProgressImplCopyWithImpl(_$FetchLocationProgressImpl _value,
      $Res Function(_$FetchLocationProgressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countId = null,
    Object? warehouseId = null,
    Object? modulaLocationId = null,
    Object? keyword = freezed,
  }) {
    return _then(_$FetchLocationProgressImpl(
      countId: null == countId
          ? _value.countId
          : countId // ignore: cast_nullable_to_non_nullable
              as int,
      warehouseId: null == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int,
      modulaLocationId: null == modulaLocationId
          ? _value.modulaLocationId
          : modulaLocationId // ignore: cast_nullable_to_non_nullable
              as int,
      keyword: freezed == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FetchLocationProgressImpl implements _FetchLocationProgress {
  const _$FetchLocationProgressImpl(
      {required this.countId,
      this.warehouseId = 0,
      this.modulaLocationId = -1,
      this.keyword});

  @override
  final int countId;
  @override
  @JsonKey()
  final int warehouseId;
  @override
  @JsonKey()
  final int modulaLocationId;
  @override
  final String? keyword;

  @override
  String toString() {
    return 'InventoryCheckEvent.fetchLocationProgress(countId: $countId, warehouseId: $warehouseId, modulaLocationId: $modulaLocationId, keyword: $keyword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchLocationProgressImpl &&
            (identical(other.countId, countId) || other.countId == countId) &&
            (identical(other.warehouseId, warehouseId) ||
                other.warehouseId == warehouseId) &&
            (identical(other.modulaLocationId, modulaLocationId) ||
                other.modulaLocationId == modulaLocationId) &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, countId, warehouseId, modulaLocationId, keyword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchLocationProgressImplCopyWith<_$FetchLocationProgressImpl>
      get copyWith => __$$FetchLocationProgressImplCopyWithImpl<
          _$FetchLocationProgressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() fetchEmployees,
    required TResult Function(String keyword) search,
    required TResult Function(int? employeeId) selectEmployee,
    required TResult Function(int? warehouseId) changeWarehouseFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime date) generateCode,
    required TResult Function(InventoryCountSavePayload payload) save,
    required TResult Function(int id) getById,
    required TResult Function(int id) delete,
    required TResult Function(int countId) fetchSheet,
    required TResult Function(
            int countId, int warehouseId, int modulaLocationId, String? keyword)
        fetchLocationProgress,
    required TResult Function(InventoryLocationGroup group) selectLocationScope,
    required TResult Function(int? productLocationId) selectProductLocation,
    required TResult Function(int? modulaLocationId) selectModulaLocation,
    required TResult Function(int? detailId) selectModulaLocationDetail,
    required TResult Function() clearLocationFilter,
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
    required TResult Function(
            int countId, List<Map<String, dynamic>> changedItems)
        saveCountDetails,
    required TResult Function(String code) findCountByCode,
    required TResult Function() clearScanCountResult,
    required TResult Function(InventoryScanMode mode) startSheetScan,
    required TResult Function(String code) sheetScanned,
    required TResult Function() stopSheetScan,
    required TResult Function(int id, bool isComplete) confirmComplete,
  }) {
    return fetchLocationProgress(
        countId, warehouseId, modulaLocationId, keyword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? fetchEmployees,
    TResult? Function(String keyword)? search,
    TResult? Function(int? employeeId)? selectEmployee,
    TResult? Function(int? warehouseId)? changeWarehouseFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime date)? generateCode,
    TResult? Function(InventoryCountSavePayload payload)? save,
    TResult? Function(int id)? getById,
    TResult? Function(int id)? delete,
    TResult? Function(int countId)? fetchSheet,
    TResult? Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult? Function(InventoryLocationGroup group)? selectLocationScope,
    TResult? Function(int? productLocationId)? selectProductLocation,
    TResult? Function(int? modulaLocationId)? selectModulaLocation,
    TResult? Function(int? detailId)? selectModulaLocationDetail,
    TResult? Function()? clearLocationFilter,
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
    TResult? Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult? Function(String code)? findCountByCode,
    TResult? Function()? clearScanCountResult,
    TResult? Function(InventoryScanMode mode)? startSheetScan,
    TResult? Function(String code)? sheetScanned,
    TResult? Function()? stopSheetScan,
    TResult? Function(int id, bool isComplete)? confirmComplete,
  }) {
    return fetchLocationProgress?.call(
        countId, warehouseId, modulaLocationId, keyword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? fetchEmployees,
    TResult Function(String keyword)? search,
    TResult Function(int? employeeId)? selectEmployee,
    TResult Function(int? warehouseId)? changeWarehouseFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime date)? generateCode,
    TResult Function(InventoryCountSavePayload payload)? save,
    TResult Function(int id)? getById,
    TResult Function(int id)? delete,
    TResult Function(int countId)? fetchSheet,
    TResult Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult Function(InventoryLocationGroup group)? selectLocationScope,
    TResult Function(int? productLocationId)? selectProductLocation,
    TResult Function(int? modulaLocationId)? selectModulaLocation,
    TResult Function(int? detailId)? selectModulaLocationDetail,
    TResult Function()? clearLocationFilter,
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
    TResult Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult Function(String code)? findCountByCode,
    TResult Function()? clearScanCountResult,
    TResult Function(InventoryScanMode mode)? startSheetScan,
    TResult Function(String code)? sheetScanned,
    TResult Function()? stopSheetScan,
    TResult Function(int id, bool isComplete)? confirmComplete,
    required TResult orElse(),
  }) {
    if (fetchLocationProgress != null) {
      return fetchLocationProgress(
          countId, warehouseId, modulaLocationId, keyword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchEmployees value) fetchEmployees,
    required TResult Function(_Search value) search,
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_ChangeWarehouseFilter value)
        changeWarehouseFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_GenerateCode value) generateCode,
    required TResult Function(_Save value) save,
    required TResult Function(_GetById value) getById,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FetchSheet value) fetchSheet,
    required TResult Function(_FetchLocationProgress value)
        fetchLocationProgress,
    required TResult Function(_SelectLocationScope value) selectLocationScope,
    required TResult Function(_SelectProductLocation value)
        selectProductLocation,
    required TResult Function(_SelectModulaLocation value) selectModulaLocation,
    required TResult Function(_SelectModulaLocationDetail value)
        selectModulaLocationDetail,
    required TResult Function(_ClearLocationFilter value) clearLocationFilter,
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
    required TResult Function(_SaveCountDetails value) saveCountDetails,
    required TResult Function(_FindCountByCode value) findCountByCode,
    required TResult Function(_ClearScanCountResult value) clearScanCountResult,
    required TResult Function(_StartSheetScan value) startSheetScan,
    required TResult Function(_SheetScanned value) sheetScanned,
    required TResult Function(_StopSheetScan value) stopSheetScan,
    required TResult Function(_ConfirmComplete value) confirmComplete,
  }) {
    return fetchLocationProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchEmployees value)? fetchEmployees,
    TResult? Function(_Search value)? search,
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_GenerateCode value)? generateCode,
    TResult? Function(_Save value)? save,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_FetchSheet value)? fetchSheet,
    TResult? Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult? Function(_SelectLocationScope value)? selectLocationScope,
    TResult? Function(_SelectProductLocation value)? selectProductLocation,
    TResult? Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult? Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult? Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult? Function(_SaveCountDetails value)? saveCountDetails,
    TResult? Function(_FindCountByCode value)? findCountByCode,
    TResult? Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult? Function(_StartSheetScan value)? startSheetScan,
    TResult? Function(_SheetScanned value)? sheetScanned,
    TResult? Function(_StopSheetScan value)? stopSheetScan,
    TResult? Function(_ConfirmComplete value)? confirmComplete,
  }) {
    return fetchLocationProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchEmployees value)? fetchEmployees,
    TResult Function(_Search value)? search,
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_GenerateCode value)? generateCode,
    TResult Function(_Save value)? save,
    TResult Function(_GetById value)? getById,
    TResult Function(_Delete value)? delete,
    TResult Function(_FetchSheet value)? fetchSheet,
    TResult Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult Function(_SelectLocationScope value)? selectLocationScope,
    TResult Function(_SelectProductLocation value)? selectProductLocation,
    TResult Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult Function(_SaveCountDetails value)? saveCountDetails,
    TResult Function(_FindCountByCode value)? findCountByCode,
    TResult Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult Function(_StartSheetScan value)? startSheetScan,
    TResult Function(_SheetScanned value)? sheetScanned,
    TResult Function(_StopSheetScan value)? stopSheetScan,
    TResult Function(_ConfirmComplete value)? confirmComplete,
    required TResult orElse(),
  }) {
    if (fetchLocationProgress != null) {
      return fetchLocationProgress(this);
    }
    return orElse();
  }
}

abstract class _FetchLocationProgress implements InventoryCheckEvent {
  const factory _FetchLocationProgress(
      {required final int countId,
      final int warehouseId,
      final int modulaLocationId,
      final String? keyword}) = _$FetchLocationProgressImpl;

  int get countId;
  int get warehouseId;
  int get modulaLocationId;
  String? get keyword;
  @JsonKey(ignore: true)
  _$$FetchLocationProgressImplCopyWith<_$FetchLocationProgressImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectLocationScopeImplCopyWith<$Res> {
  factory _$$SelectLocationScopeImplCopyWith(_$SelectLocationScopeImpl value,
          $Res Function(_$SelectLocationScopeImpl) then) =
      __$$SelectLocationScopeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({InventoryLocationGroup group});
}

/// @nodoc
class __$$SelectLocationScopeImplCopyWithImpl<$Res>
    extends _$InventoryCheckEventCopyWithImpl<$Res, _$SelectLocationScopeImpl>
    implements _$$SelectLocationScopeImplCopyWith<$Res> {
  __$$SelectLocationScopeImplCopyWithImpl(_$SelectLocationScopeImpl _value,
      $Res Function(_$SelectLocationScopeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? group = null,
  }) {
    return _then(_$SelectLocationScopeImpl(
      null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as InventoryLocationGroup,
    ));
  }
}

/// @nodoc

class _$SelectLocationScopeImpl implements _SelectLocationScope {
  const _$SelectLocationScopeImpl(this.group);

  @override
  final InventoryLocationGroup group;

  @override
  String toString() {
    return 'InventoryCheckEvent.selectLocationScope(group: $group)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectLocationScopeImpl &&
            (identical(other.group, group) || other.group == group));
  }

  @override
  int get hashCode => Object.hash(runtimeType, group);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectLocationScopeImplCopyWith<_$SelectLocationScopeImpl> get copyWith =>
      __$$SelectLocationScopeImplCopyWithImpl<_$SelectLocationScopeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() fetchEmployees,
    required TResult Function(String keyword) search,
    required TResult Function(int? employeeId) selectEmployee,
    required TResult Function(int? warehouseId) changeWarehouseFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime date) generateCode,
    required TResult Function(InventoryCountSavePayload payload) save,
    required TResult Function(int id) getById,
    required TResult Function(int id) delete,
    required TResult Function(int countId) fetchSheet,
    required TResult Function(
            int countId, int warehouseId, int modulaLocationId, String? keyword)
        fetchLocationProgress,
    required TResult Function(InventoryLocationGroup group) selectLocationScope,
    required TResult Function(int? productLocationId) selectProductLocation,
    required TResult Function(int? modulaLocationId) selectModulaLocation,
    required TResult Function(int? detailId) selectModulaLocationDetail,
    required TResult Function() clearLocationFilter,
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
    required TResult Function(
            int countId, List<Map<String, dynamic>> changedItems)
        saveCountDetails,
    required TResult Function(String code) findCountByCode,
    required TResult Function() clearScanCountResult,
    required TResult Function(InventoryScanMode mode) startSheetScan,
    required TResult Function(String code) sheetScanned,
    required TResult Function() stopSheetScan,
    required TResult Function(int id, bool isComplete) confirmComplete,
  }) {
    return selectLocationScope(group);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? fetchEmployees,
    TResult? Function(String keyword)? search,
    TResult? Function(int? employeeId)? selectEmployee,
    TResult? Function(int? warehouseId)? changeWarehouseFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime date)? generateCode,
    TResult? Function(InventoryCountSavePayload payload)? save,
    TResult? Function(int id)? getById,
    TResult? Function(int id)? delete,
    TResult? Function(int countId)? fetchSheet,
    TResult? Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult? Function(InventoryLocationGroup group)? selectLocationScope,
    TResult? Function(int? productLocationId)? selectProductLocation,
    TResult? Function(int? modulaLocationId)? selectModulaLocation,
    TResult? Function(int? detailId)? selectModulaLocationDetail,
    TResult? Function()? clearLocationFilter,
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
    TResult? Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult? Function(String code)? findCountByCode,
    TResult? Function()? clearScanCountResult,
    TResult? Function(InventoryScanMode mode)? startSheetScan,
    TResult? Function(String code)? sheetScanned,
    TResult? Function()? stopSheetScan,
    TResult? Function(int id, bool isComplete)? confirmComplete,
  }) {
    return selectLocationScope?.call(group);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? fetchEmployees,
    TResult Function(String keyword)? search,
    TResult Function(int? employeeId)? selectEmployee,
    TResult Function(int? warehouseId)? changeWarehouseFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime date)? generateCode,
    TResult Function(InventoryCountSavePayload payload)? save,
    TResult Function(int id)? getById,
    TResult Function(int id)? delete,
    TResult Function(int countId)? fetchSheet,
    TResult Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult Function(InventoryLocationGroup group)? selectLocationScope,
    TResult Function(int? productLocationId)? selectProductLocation,
    TResult Function(int? modulaLocationId)? selectModulaLocation,
    TResult Function(int? detailId)? selectModulaLocationDetail,
    TResult Function()? clearLocationFilter,
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
    TResult Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult Function(String code)? findCountByCode,
    TResult Function()? clearScanCountResult,
    TResult Function(InventoryScanMode mode)? startSheetScan,
    TResult Function(String code)? sheetScanned,
    TResult Function()? stopSheetScan,
    TResult Function(int id, bool isComplete)? confirmComplete,
    required TResult orElse(),
  }) {
    if (selectLocationScope != null) {
      return selectLocationScope(group);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchEmployees value) fetchEmployees,
    required TResult Function(_Search value) search,
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_ChangeWarehouseFilter value)
        changeWarehouseFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_GenerateCode value) generateCode,
    required TResult Function(_Save value) save,
    required TResult Function(_GetById value) getById,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FetchSheet value) fetchSheet,
    required TResult Function(_FetchLocationProgress value)
        fetchLocationProgress,
    required TResult Function(_SelectLocationScope value) selectLocationScope,
    required TResult Function(_SelectProductLocation value)
        selectProductLocation,
    required TResult Function(_SelectModulaLocation value) selectModulaLocation,
    required TResult Function(_SelectModulaLocationDetail value)
        selectModulaLocationDetail,
    required TResult Function(_ClearLocationFilter value) clearLocationFilter,
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
    required TResult Function(_SaveCountDetails value) saveCountDetails,
    required TResult Function(_FindCountByCode value) findCountByCode,
    required TResult Function(_ClearScanCountResult value) clearScanCountResult,
    required TResult Function(_StartSheetScan value) startSheetScan,
    required TResult Function(_SheetScanned value) sheetScanned,
    required TResult Function(_StopSheetScan value) stopSheetScan,
    required TResult Function(_ConfirmComplete value) confirmComplete,
  }) {
    return selectLocationScope(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchEmployees value)? fetchEmployees,
    TResult? Function(_Search value)? search,
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_GenerateCode value)? generateCode,
    TResult? Function(_Save value)? save,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_FetchSheet value)? fetchSheet,
    TResult? Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult? Function(_SelectLocationScope value)? selectLocationScope,
    TResult? Function(_SelectProductLocation value)? selectProductLocation,
    TResult? Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult? Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult? Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult? Function(_SaveCountDetails value)? saveCountDetails,
    TResult? Function(_FindCountByCode value)? findCountByCode,
    TResult? Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult? Function(_StartSheetScan value)? startSheetScan,
    TResult? Function(_SheetScanned value)? sheetScanned,
    TResult? Function(_StopSheetScan value)? stopSheetScan,
    TResult? Function(_ConfirmComplete value)? confirmComplete,
  }) {
    return selectLocationScope?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchEmployees value)? fetchEmployees,
    TResult Function(_Search value)? search,
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_GenerateCode value)? generateCode,
    TResult Function(_Save value)? save,
    TResult Function(_GetById value)? getById,
    TResult Function(_Delete value)? delete,
    TResult Function(_FetchSheet value)? fetchSheet,
    TResult Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult Function(_SelectLocationScope value)? selectLocationScope,
    TResult Function(_SelectProductLocation value)? selectProductLocation,
    TResult Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult Function(_SaveCountDetails value)? saveCountDetails,
    TResult Function(_FindCountByCode value)? findCountByCode,
    TResult Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult Function(_StartSheetScan value)? startSheetScan,
    TResult Function(_SheetScanned value)? sheetScanned,
    TResult Function(_StopSheetScan value)? stopSheetScan,
    TResult Function(_ConfirmComplete value)? confirmComplete,
    required TResult orElse(),
  }) {
    if (selectLocationScope != null) {
      return selectLocationScope(this);
    }
    return orElse();
  }
}

abstract class _SelectLocationScope implements InventoryCheckEvent {
  const factory _SelectLocationScope(final InventoryLocationGroup group) =
      _$SelectLocationScopeImpl;

  InventoryLocationGroup get group;
  @JsonKey(ignore: true)
  _$$SelectLocationScopeImplCopyWith<_$SelectLocationScopeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectProductLocationImplCopyWith<$Res> {
  factory _$$SelectProductLocationImplCopyWith(
          _$SelectProductLocationImpl value,
          $Res Function(_$SelectProductLocationImpl) then) =
      __$$SelectProductLocationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? productLocationId});
}

/// @nodoc
class __$$SelectProductLocationImplCopyWithImpl<$Res>
    extends _$InventoryCheckEventCopyWithImpl<$Res, _$SelectProductLocationImpl>
    implements _$$SelectProductLocationImplCopyWith<$Res> {
  __$$SelectProductLocationImplCopyWithImpl(_$SelectProductLocationImpl _value,
      $Res Function(_$SelectProductLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productLocationId = freezed,
  }) {
    return _then(_$SelectProductLocationImpl(
      freezed == productLocationId
          ? _value.productLocationId
          : productLocationId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SelectProductLocationImpl implements _SelectProductLocation {
  const _$SelectProductLocationImpl(this.productLocationId);

  @override
  final int? productLocationId;

  @override
  String toString() {
    return 'InventoryCheckEvent.selectProductLocation(productLocationId: $productLocationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectProductLocationImpl &&
            (identical(other.productLocationId, productLocationId) ||
                other.productLocationId == productLocationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productLocationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectProductLocationImplCopyWith<_$SelectProductLocationImpl>
      get copyWith => __$$SelectProductLocationImplCopyWithImpl<
          _$SelectProductLocationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() fetchEmployees,
    required TResult Function(String keyword) search,
    required TResult Function(int? employeeId) selectEmployee,
    required TResult Function(int? warehouseId) changeWarehouseFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime date) generateCode,
    required TResult Function(InventoryCountSavePayload payload) save,
    required TResult Function(int id) getById,
    required TResult Function(int id) delete,
    required TResult Function(int countId) fetchSheet,
    required TResult Function(
            int countId, int warehouseId, int modulaLocationId, String? keyword)
        fetchLocationProgress,
    required TResult Function(InventoryLocationGroup group) selectLocationScope,
    required TResult Function(int? productLocationId) selectProductLocation,
    required TResult Function(int? modulaLocationId) selectModulaLocation,
    required TResult Function(int? detailId) selectModulaLocationDetail,
    required TResult Function() clearLocationFilter,
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
    required TResult Function(
            int countId, List<Map<String, dynamic>> changedItems)
        saveCountDetails,
    required TResult Function(String code) findCountByCode,
    required TResult Function() clearScanCountResult,
    required TResult Function(InventoryScanMode mode) startSheetScan,
    required TResult Function(String code) sheetScanned,
    required TResult Function() stopSheetScan,
    required TResult Function(int id, bool isComplete) confirmComplete,
  }) {
    return selectProductLocation(productLocationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? fetchEmployees,
    TResult? Function(String keyword)? search,
    TResult? Function(int? employeeId)? selectEmployee,
    TResult? Function(int? warehouseId)? changeWarehouseFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime date)? generateCode,
    TResult? Function(InventoryCountSavePayload payload)? save,
    TResult? Function(int id)? getById,
    TResult? Function(int id)? delete,
    TResult? Function(int countId)? fetchSheet,
    TResult? Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult? Function(InventoryLocationGroup group)? selectLocationScope,
    TResult? Function(int? productLocationId)? selectProductLocation,
    TResult? Function(int? modulaLocationId)? selectModulaLocation,
    TResult? Function(int? detailId)? selectModulaLocationDetail,
    TResult? Function()? clearLocationFilter,
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
    TResult? Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult? Function(String code)? findCountByCode,
    TResult? Function()? clearScanCountResult,
    TResult? Function(InventoryScanMode mode)? startSheetScan,
    TResult? Function(String code)? sheetScanned,
    TResult? Function()? stopSheetScan,
    TResult? Function(int id, bool isComplete)? confirmComplete,
  }) {
    return selectProductLocation?.call(productLocationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? fetchEmployees,
    TResult Function(String keyword)? search,
    TResult Function(int? employeeId)? selectEmployee,
    TResult Function(int? warehouseId)? changeWarehouseFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime date)? generateCode,
    TResult Function(InventoryCountSavePayload payload)? save,
    TResult Function(int id)? getById,
    TResult Function(int id)? delete,
    TResult Function(int countId)? fetchSheet,
    TResult Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult Function(InventoryLocationGroup group)? selectLocationScope,
    TResult Function(int? productLocationId)? selectProductLocation,
    TResult Function(int? modulaLocationId)? selectModulaLocation,
    TResult Function(int? detailId)? selectModulaLocationDetail,
    TResult Function()? clearLocationFilter,
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
    TResult Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult Function(String code)? findCountByCode,
    TResult Function()? clearScanCountResult,
    TResult Function(InventoryScanMode mode)? startSheetScan,
    TResult Function(String code)? sheetScanned,
    TResult Function()? stopSheetScan,
    TResult Function(int id, bool isComplete)? confirmComplete,
    required TResult orElse(),
  }) {
    if (selectProductLocation != null) {
      return selectProductLocation(productLocationId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchEmployees value) fetchEmployees,
    required TResult Function(_Search value) search,
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_ChangeWarehouseFilter value)
        changeWarehouseFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_GenerateCode value) generateCode,
    required TResult Function(_Save value) save,
    required TResult Function(_GetById value) getById,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FetchSheet value) fetchSheet,
    required TResult Function(_FetchLocationProgress value)
        fetchLocationProgress,
    required TResult Function(_SelectLocationScope value) selectLocationScope,
    required TResult Function(_SelectProductLocation value)
        selectProductLocation,
    required TResult Function(_SelectModulaLocation value) selectModulaLocation,
    required TResult Function(_SelectModulaLocationDetail value)
        selectModulaLocationDetail,
    required TResult Function(_ClearLocationFilter value) clearLocationFilter,
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
    required TResult Function(_SaveCountDetails value) saveCountDetails,
    required TResult Function(_FindCountByCode value) findCountByCode,
    required TResult Function(_ClearScanCountResult value) clearScanCountResult,
    required TResult Function(_StartSheetScan value) startSheetScan,
    required TResult Function(_SheetScanned value) sheetScanned,
    required TResult Function(_StopSheetScan value) stopSheetScan,
    required TResult Function(_ConfirmComplete value) confirmComplete,
  }) {
    return selectProductLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchEmployees value)? fetchEmployees,
    TResult? Function(_Search value)? search,
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_GenerateCode value)? generateCode,
    TResult? Function(_Save value)? save,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_FetchSheet value)? fetchSheet,
    TResult? Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult? Function(_SelectLocationScope value)? selectLocationScope,
    TResult? Function(_SelectProductLocation value)? selectProductLocation,
    TResult? Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult? Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult? Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult? Function(_SaveCountDetails value)? saveCountDetails,
    TResult? Function(_FindCountByCode value)? findCountByCode,
    TResult? Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult? Function(_StartSheetScan value)? startSheetScan,
    TResult? Function(_SheetScanned value)? sheetScanned,
    TResult? Function(_StopSheetScan value)? stopSheetScan,
    TResult? Function(_ConfirmComplete value)? confirmComplete,
  }) {
    return selectProductLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchEmployees value)? fetchEmployees,
    TResult Function(_Search value)? search,
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_GenerateCode value)? generateCode,
    TResult Function(_Save value)? save,
    TResult Function(_GetById value)? getById,
    TResult Function(_Delete value)? delete,
    TResult Function(_FetchSheet value)? fetchSheet,
    TResult Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult Function(_SelectLocationScope value)? selectLocationScope,
    TResult Function(_SelectProductLocation value)? selectProductLocation,
    TResult Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult Function(_SaveCountDetails value)? saveCountDetails,
    TResult Function(_FindCountByCode value)? findCountByCode,
    TResult Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult Function(_StartSheetScan value)? startSheetScan,
    TResult Function(_SheetScanned value)? sheetScanned,
    TResult Function(_StopSheetScan value)? stopSheetScan,
    TResult Function(_ConfirmComplete value)? confirmComplete,
    required TResult orElse(),
  }) {
    if (selectProductLocation != null) {
      return selectProductLocation(this);
    }
    return orElse();
  }
}

abstract class _SelectProductLocation implements InventoryCheckEvent {
  const factory _SelectProductLocation(final int? productLocationId) =
      _$SelectProductLocationImpl;

  int? get productLocationId;
  @JsonKey(ignore: true)
  _$$SelectProductLocationImplCopyWith<_$SelectProductLocationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectModulaLocationImplCopyWith<$Res> {
  factory _$$SelectModulaLocationImplCopyWith(_$SelectModulaLocationImpl value,
          $Res Function(_$SelectModulaLocationImpl) then) =
      __$$SelectModulaLocationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? modulaLocationId});
}

/// @nodoc
class __$$SelectModulaLocationImplCopyWithImpl<$Res>
    extends _$InventoryCheckEventCopyWithImpl<$Res, _$SelectModulaLocationImpl>
    implements _$$SelectModulaLocationImplCopyWith<$Res> {
  __$$SelectModulaLocationImplCopyWithImpl(_$SelectModulaLocationImpl _value,
      $Res Function(_$SelectModulaLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modulaLocationId = freezed,
  }) {
    return _then(_$SelectModulaLocationImpl(
      freezed == modulaLocationId
          ? _value.modulaLocationId
          : modulaLocationId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SelectModulaLocationImpl implements _SelectModulaLocation {
  const _$SelectModulaLocationImpl(this.modulaLocationId);

  @override
  final int? modulaLocationId;

  @override
  String toString() {
    return 'InventoryCheckEvent.selectModulaLocation(modulaLocationId: $modulaLocationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectModulaLocationImpl &&
            (identical(other.modulaLocationId, modulaLocationId) ||
                other.modulaLocationId == modulaLocationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, modulaLocationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectModulaLocationImplCopyWith<_$SelectModulaLocationImpl>
      get copyWith =>
          __$$SelectModulaLocationImplCopyWithImpl<_$SelectModulaLocationImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() fetchEmployees,
    required TResult Function(String keyword) search,
    required TResult Function(int? employeeId) selectEmployee,
    required TResult Function(int? warehouseId) changeWarehouseFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime date) generateCode,
    required TResult Function(InventoryCountSavePayload payload) save,
    required TResult Function(int id) getById,
    required TResult Function(int id) delete,
    required TResult Function(int countId) fetchSheet,
    required TResult Function(
            int countId, int warehouseId, int modulaLocationId, String? keyword)
        fetchLocationProgress,
    required TResult Function(InventoryLocationGroup group) selectLocationScope,
    required TResult Function(int? productLocationId) selectProductLocation,
    required TResult Function(int? modulaLocationId) selectModulaLocation,
    required TResult Function(int? detailId) selectModulaLocationDetail,
    required TResult Function() clearLocationFilter,
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
    required TResult Function(
            int countId, List<Map<String, dynamic>> changedItems)
        saveCountDetails,
    required TResult Function(String code) findCountByCode,
    required TResult Function() clearScanCountResult,
    required TResult Function(InventoryScanMode mode) startSheetScan,
    required TResult Function(String code) sheetScanned,
    required TResult Function() stopSheetScan,
    required TResult Function(int id, bool isComplete) confirmComplete,
  }) {
    return selectModulaLocation(modulaLocationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? fetchEmployees,
    TResult? Function(String keyword)? search,
    TResult? Function(int? employeeId)? selectEmployee,
    TResult? Function(int? warehouseId)? changeWarehouseFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime date)? generateCode,
    TResult? Function(InventoryCountSavePayload payload)? save,
    TResult? Function(int id)? getById,
    TResult? Function(int id)? delete,
    TResult? Function(int countId)? fetchSheet,
    TResult? Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult? Function(InventoryLocationGroup group)? selectLocationScope,
    TResult? Function(int? productLocationId)? selectProductLocation,
    TResult? Function(int? modulaLocationId)? selectModulaLocation,
    TResult? Function(int? detailId)? selectModulaLocationDetail,
    TResult? Function()? clearLocationFilter,
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
    TResult? Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult? Function(String code)? findCountByCode,
    TResult? Function()? clearScanCountResult,
    TResult? Function(InventoryScanMode mode)? startSheetScan,
    TResult? Function(String code)? sheetScanned,
    TResult? Function()? stopSheetScan,
    TResult? Function(int id, bool isComplete)? confirmComplete,
  }) {
    return selectModulaLocation?.call(modulaLocationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? fetchEmployees,
    TResult Function(String keyword)? search,
    TResult Function(int? employeeId)? selectEmployee,
    TResult Function(int? warehouseId)? changeWarehouseFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime date)? generateCode,
    TResult Function(InventoryCountSavePayload payload)? save,
    TResult Function(int id)? getById,
    TResult Function(int id)? delete,
    TResult Function(int countId)? fetchSheet,
    TResult Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult Function(InventoryLocationGroup group)? selectLocationScope,
    TResult Function(int? productLocationId)? selectProductLocation,
    TResult Function(int? modulaLocationId)? selectModulaLocation,
    TResult Function(int? detailId)? selectModulaLocationDetail,
    TResult Function()? clearLocationFilter,
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
    TResult Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult Function(String code)? findCountByCode,
    TResult Function()? clearScanCountResult,
    TResult Function(InventoryScanMode mode)? startSheetScan,
    TResult Function(String code)? sheetScanned,
    TResult Function()? stopSheetScan,
    TResult Function(int id, bool isComplete)? confirmComplete,
    required TResult orElse(),
  }) {
    if (selectModulaLocation != null) {
      return selectModulaLocation(modulaLocationId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchEmployees value) fetchEmployees,
    required TResult Function(_Search value) search,
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_ChangeWarehouseFilter value)
        changeWarehouseFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_GenerateCode value) generateCode,
    required TResult Function(_Save value) save,
    required TResult Function(_GetById value) getById,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FetchSheet value) fetchSheet,
    required TResult Function(_FetchLocationProgress value)
        fetchLocationProgress,
    required TResult Function(_SelectLocationScope value) selectLocationScope,
    required TResult Function(_SelectProductLocation value)
        selectProductLocation,
    required TResult Function(_SelectModulaLocation value) selectModulaLocation,
    required TResult Function(_SelectModulaLocationDetail value)
        selectModulaLocationDetail,
    required TResult Function(_ClearLocationFilter value) clearLocationFilter,
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
    required TResult Function(_SaveCountDetails value) saveCountDetails,
    required TResult Function(_FindCountByCode value) findCountByCode,
    required TResult Function(_ClearScanCountResult value) clearScanCountResult,
    required TResult Function(_StartSheetScan value) startSheetScan,
    required TResult Function(_SheetScanned value) sheetScanned,
    required TResult Function(_StopSheetScan value) stopSheetScan,
    required TResult Function(_ConfirmComplete value) confirmComplete,
  }) {
    return selectModulaLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchEmployees value)? fetchEmployees,
    TResult? Function(_Search value)? search,
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_GenerateCode value)? generateCode,
    TResult? Function(_Save value)? save,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_FetchSheet value)? fetchSheet,
    TResult? Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult? Function(_SelectLocationScope value)? selectLocationScope,
    TResult? Function(_SelectProductLocation value)? selectProductLocation,
    TResult? Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult? Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult? Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult? Function(_SaveCountDetails value)? saveCountDetails,
    TResult? Function(_FindCountByCode value)? findCountByCode,
    TResult? Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult? Function(_StartSheetScan value)? startSheetScan,
    TResult? Function(_SheetScanned value)? sheetScanned,
    TResult? Function(_StopSheetScan value)? stopSheetScan,
    TResult? Function(_ConfirmComplete value)? confirmComplete,
  }) {
    return selectModulaLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchEmployees value)? fetchEmployees,
    TResult Function(_Search value)? search,
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_GenerateCode value)? generateCode,
    TResult Function(_Save value)? save,
    TResult Function(_GetById value)? getById,
    TResult Function(_Delete value)? delete,
    TResult Function(_FetchSheet value)? fetchSheet,
    TResult Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult Function(_SelectLocationScope value)? selectLocationScope,
    TResult Function(_SelectProductLocation value)? selectProductLocation,
    TResult Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult Function(_SaveCountDetails value)? saveCountDetails,
    TResult Function(_FindCountByCode value)? findCountByCode,
    TResult Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult Function(_StartSheetScan value)? startSheetScan,
    TResult Function(_SheetScanned value)? sheetScanned,
    TResult Function(_StopSheetScan value)? stopSheetScan,
    TResult Function(_ConfirmComplete value)? confirmComplete,
    required TResult orElse(),
  }) {
    if (selectModulaLocation != null) {
      return selectModulaLocation(this);
    }
    return orElse();
  }
}

abstract class _SelectModulaLocation implements InventoryCheckEvent {
  const factory _SelectModulaLocation(final int? modulaLocationId) =
      _$SelectModulaLocationImpl;

  int? get modulaLocationId;
  @JsonKey(ignore: true)
  _$$SelectModulaLocationImplCopyWith<_$SelectModulaLocationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectModulaLocationDetailImplCopyWith<$Res> {
  factory _$$SelectModulaLocationDetailImplCopyWith(
          _$SelectModulaLocationDetailImpl value,
          $Res Function(_$SelectModulaLocationDetailImpl) then) =
      __$$SelectModulaLocationDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? detailId});
}

/// @nodoc
class __$$SelectModulaLocationDetailImplCopyWithImpl<$Res>
    extends _$InventoryCheckEventCopyWithImpl<$Res,
        _$SelectModulaLocationDetailImpl>
    implements _$$SelectModulaLocationDetailImplCopyWith<$Res> {
  __$$SelectModulaLocationDetailImplCopyWithImpl(
      _$SelectModulaLocationDetailImpl _value,
      $Res Function(_$SelectModulaLocationDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detailId = freezed,
  }) {
    return _then(_$SelectModulaLocationDetailImpl(
      detailId: freezed == detailId
          ? _value.detailId
          : detailId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SelectModulaLocationDetailImpl implements _SelectModulaLocationDetail {
  const _$SelectModulaLocationDetailImpl({this.detailId});

  @override
  final int? detailId;

  @override
  String toString() {
    return 'InventoryCheckEvent.selectModulaLocationDetail(detailId: $detailId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectModulaLocationDetailImpl &&
            (identical(other.detailId, detailId) ||
                other.detailId == detailId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, detailId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectModulaLocationDetailImplCopyWith<_$SelectModulaLocationDetailImpl>
      get copyWith => __$$SelectModulaLocationDetailImplCopyWithImpl<
          _$SelectModulaLocationDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() fetchEmployees,
    required TResult Function(String keyword) search,
    required TResult Function(int? employeeId) selectEmployee,
    required TResult Function(int? warehouseId) changeWarehouseFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime date) generateCode,
    required TResult Function(InventoryCountSavePayload payload) save,
    required TResult Function(int id) getById,
    required TResult Function(int id) delete,
    required TResult Function(int countId) fetchSheet,
    required TResult Function(
            int countId, int warehouseId, int modulaLocationId, String? keyword)
        fetchLocationProgress,
    required TResult Function(InventoryLocationGroup group) selectLocationScope,
    required TResult Function(int? productLocationId) selectProductLocation,
    required TResult Function(int? modulaLocationId) selectModulaLocation,
    required TResult Function(int? detailId) selectModulaLocationDetail,
    required TResult Function() clearLocationFilter,
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
    required TResult Function(
            int countId, List<Map<String, dynamic>> changedItems)
        saveCountDetails,
    required TResult Function(String code) findCountByCode,
    required TResult Function() clearScanCountResult,
    required TResult Function(InventoryScanMode mode) startSheetScan,
    required TResult Function(String code) sheetScanned,
    required TResult Function() stopSheetScan,
    required TResult Function(int id, bool isComplete) confirmComplete,
  }) {
    return selectModulaLocationDetail(detailId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? fetchEmployees,
    TResult? Function(String keyword)? search,
    TResult? Function(int? employeeId)? selectEmployee,
    TResult? Function(int? warehouseId)? changeWarehouseFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime date)? generateCode,
    TResult? Function(InventoryCountSavePayload payload)? save,
    TResult? Function(int id)? getById,
    TResult? Function(int id)? delete,
    TResult? Function(int countId)? fetchSheet,
    TResult? Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult? Function(InventoryLocationGroup group)? selectLocationScope,
    TResult? Function(int? productLocationId)? selectProductLocation,
    TResult? Function(int? modulaLocationId)? selectModulaLocation,
    TResult? Function(int? detailId)? selectModulaLocationDetail,
    TResult? Function()? clearLocationFilter,
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
    TResult? Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult? Function(String code)? findCountByCode,
    TResult? Function()? clearScanCountResult,
    TResult? Function(InventoryScanMode mode)? startSheetScan,
    TResult? Function(String code)? sheetScanned,
    TResult? Function()? stopSheetScan,
    TResult? Function(int id, bool isComplete)? confirmComplete,
  }) {
    return selectModulaLocationDetail?.call(detailId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? fetchEmployees,
    TResult Function(String keyword)? search,
    TResult Function(int? employeeId)? selectEmployee,
    TResult Function(int? warehouseId)? changeWarehouseFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime date)? generateCode,
    TResult Function(InventoryCountSavePayload payload)? save,
    TResult Function(int id)? getById,
    TResult Function(int id)? delete,
    TResult Function(int countId)? fetchSheet,
    TResult Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult Function(InventoryLocationGroup group)? selectLocationScope,
    TResult Function(int? productLocationId)? selectProductLocation,
    TResult Function(int? modulaLocationId)? selectModulaLocation,
    TResult Function(int? detailId)? selectModulaLocationDetail,
    TResult Function()? clearLocationFilter,
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
    TResult Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult Function(String code)? findCountByCode,
    TResult Function()? clearScanCountResult,
    TResult Function(InventoryScanMode mode)? startSheetScan,
    TResult Function(String code)? sheetScanned,
    TResult Function()? stopSheetScan,
    TResult Function(int id, bool isComplete)? confirmComplete,
    required TResult orElse(),
  }) {
    if (selectModulaLocationDetail != null) {
      return selectModulaLocationDetail(detailId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchEmployees value) fetchEmployees,
    required TResult Function(_Search value) search,
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_ChangeWarehouseFilter value)
        changeWarehouseFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_GenerateCode value) generateCode,
    required TResult Function(_Save value) save,
    required TResult Function(_GetById value) getById,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FetchSheet value) fetchSheet,
    required TResult Function(_FetchLocationProgress value)
        fetchLocationProgress,
    required TResult Function(_SelectLocationScope value) selectLocationScope,
    required TResult Function(_SelectProductLocation value)
        selectProductLocation,
    required TResult Function(_SelectModulaLocation value) selectModulaLocation,
    required TResult Function(_SelectModulaLocationDetail value)
        selectModulaLocationDetail,
    required TResult Function(_ClearLocationFilter value) clearLocationFilter,
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
    required TResult Function(_SaveCountDetails value) saveCountDetails,
    required TResult Function(_FindCountByCode value) findCountByCode,
    required TResult Function(_ClearScanCountResult value) clearScanCountResult,
    required TResult Function(_StartSheetScan value) startSheetScan,
    required TResult Function(_SheetScanned value) sheetScanned,
    required TResult Function(_StopSheetScan value) stopSheetScan,
    required TResult Function(_ConfirmComplete value) confirmComplete,
  }) {
    return selectModulaLocationDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchEmployees value)? fetchEmployees,
    TResult? Function(_Search value)? search,
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_GenerateCode value)? generateCode,
    TResult? Function(_Save value)? save,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_FetchSheet value)? fetchSheet,
    TResult? Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult? Function(_SelectLocationScope value)? selectLocationScope,
    TResult? Function(_SelectProductLocation value)? selectProductLocation,
    TResult? Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult? Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult? Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult? Function(_SaveCountDetails value)? saveCountDetails,
    TResult? Function(_FindCountByCode value)? findCountByCode,
    TResult? Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult? Function(_StartSheetScan value)? startSheetScan,
    TResult? Function(_SheetScanned value)? sheetScanned,
    TResult? Function(_StopSheetScan value)? stopSheetScan,
    TResult? Function(_ConfirmComplete value)? confirmComplete,
  }) {
    return selectModulaLocationDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchEmployees value)? fetchEmployees,
    TResult Function(_Search value)? search,
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_GenerateCode value)? generateCode,
    TResult Function(_Save value)? save,
    TResult Function(_GetById value)? getById,
    TResult Function(_Delete value)? delete,
    TResult Function(_FetchSheet value)? fetchSheet,
    TResult Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult Function(_SelectLocationScope value)? selectLocationScope,
    TResult Function(_SelectProductLocation value)? selectProductLocation,
    TResult Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult Function(_SaveCountDetails value)? saveCountDetails,
    TResult Function(_FindCountByCode value)? findCountByCode,
    TResult Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult Function(_StartSheetScan value)? startSheetScan,
    TResult Function(_SheetScanned value)? sheetScanned,
    TResult Function(_StopSheetScan value)? stopSheetScan,
    TResult Function(_ConfirmComplete value)? confirmComplete,
    required TResult orElse(),
  }) {
    if (selectModulaLocationDetail != null) {
      return selectModulaLocationDetail(this);
    }
    return orElse();
  }
}

abstract class _SelectModulaLocationDetail implements InventoryCheckEvent {
  const factory _SelectModulaLocationDetail({final int? detailId}) =
      _$SelectModulaLocationDetailImpl;

  int? get detailId;
  @JsonKey(ignore: true)
  _$$SelectModulaLocationDetailImplCopyWith<_$SelectModulaLocationDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearLocationFilterImplCopyWith<$Res> {
  factory _$$ClearLocationFilterImplCopyWith(_$ClearLocationFilterImpl value,
          $Res Function(_$ClearLocationFilterImpl) then) =
      __$$ClearLocationFilterImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearLocationFilterImplCopyWithImpl<$Res>
    extends _$InventoryCheckEventCopyWithImpl<$Res, _$ClearLocationFilterImpl>
    implements _$$ClearLocationFilterImplCopyWith<$Res> {
  __$$ClearLocationFilterImplCopyWithImpl(_$ClearLocationFilterImpl _value,
      $Res Function(_$ClearLocationFilterImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearLocationFilterImpl implements _ClearLocationFilter {
  const _$ClearLocationFilterImpl();

  @override
  String toString() {
    return 'InventoryCheckEvent.clearLocationFilter()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClearLocationFilterImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() fetchEmployees,
    required TResult Function(String keyword) search,
    required TResult Function(int? employeeId) selectEmployee,
    required TResult Function(int? warehouseId) changeWarehouseFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime date) generateCode,
    required TResult Function(InventoryCountSavePayload payload) save,
    required TResult Function(int id) getById,
    required TResult Function(int id) delete,
    required TResult Function(int countId) fetchSheet,
    required TResult Function(
            int countId, int warehouseId, int modulaLocationId, String? keyword)
        fetchLocationProgress,
    required TResult Function(InventoryLocationGroup group) selectLocationScope,
    required TResult Function(int? productLocationId) selectProductLocation,
    required TResult Function(int? modulaLocationId) selectModulaLocation,
    required TResult Function(int? detailId) selectModulaLocationDetail,
    required TResult Function() clearLocationFilter,
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
    required TResult Function(
            int countId, List<Map<String, dynamic>> changedItems)
        saveCountDetails,
    required TResult Function(String code) findCountByCode,
    required TResult Function() clearScanCountResult,
    required TResult Function(InventoryScanMode mode) startSheetScan,
    required TResult Function(String code) sheetScanned,
    required TResult Function() stopSheetScan,
    required TResult Function(int id, bool isComplete) confirmComplete,
  }) {
    return clearLocationFilter();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? fetchEmployees,
    TResult? Function(String keyword)? search,
    TResult? Function(int? employeeId)? selectEmployee,
    TResult? Function(int? warehouseId)? changeWarehouseFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime date)? generateCode,
    TResult? Function(InventoryCountSavePayload payload)? save,
    TResult? Function(int id)? getById,
    TResult? Function(int id)? delete,
    TResult? Function(int countId)? fetchSheet,
    TResult? Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult? Function(InventoryLocationGroup group)? selectLocationScope,
    TResult? Function(int? productLocationId)? selectProductLocation,
    TResult? Function(int? modulaLocationId)? selectModulaLocation,
    TResult? Function(int? detailId)? selectModulaLocationDetail,
    TResult? Function()? clearLocationFilter,
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
    TResult? Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult? Function(String code)? findCountByCode,
    TResult? Function()? clearScanCountResult,
    TResult? Function(InventoryScanMode mode)? startSheetScan,
    TResult? Function(String code)? sheetScanned,
    TResult? Function()? stopSheetScan,
    TResult? Function(int id, bool isComplete)? confirmComplete,
  }) {
    return clearLocationFilter?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? fetchEmployees,
    TResult Function(String keyword)? search,
    TResult Function(int? employeeId)? selectEmployee,
    TResult Function(int? warehouseId)? changeWarehouseFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime date)? generateCode,
    TResult Function(InventoryCountSavePayload payload)? save,
    TResult Function(int id)? getById,
    TResult Function(int id)? delete,
    TResult Function(int countId)? fetchSheet,
    TResult Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult Function(InventoryLocationGroup group)? selectLocationScope,
    TResult Function(int? productLocationId)? selectProductLocation,
    TResult Function(int? modulaLocationId)? selectModulaLocation,
    TResult Function(int? detailId)? selectModulaLocationDetail,
    TResult Function()? clearLocationFilter,
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
    TResult Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult Function(String code)? findCountByCode,
    TResult Function()? clearScanCountResult,
    TResult Function(InventoryScanMode mode)? startSheetScan,
    TResult Function(String code)? sheetScanned,
    TResult Function()? stopSheetScan,
    TResult Function(int id, bool isComplete)? confirmComplete,
    required TResult orElse(),
  }) {
    if (clearLocationFilter != null) {
      return clearLocationFilter();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchEmployees value) fetchEmployees,
    required TResult Function(_Search value) search,
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_ChangeWarehouseFilter value)
        changeWarehouseFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_GenerateCode value) generateCode,
    required TResult Function(_Save value) save,
    required TResult Function(_GetById value) getById,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FetchSheet value) fetchSheet,
    required TResult Function(_FetchLocationProgress value)
        fetchLocationProgress,
    required TResult Function(_SelectLocationScope value) selectLocationScope,
    required TResult Function(_SelectProductLocation value)
        selectProductLocation,
    required TResult Function(_SelectModulaLocation value) selectModulaLocation,
    required TResult Function(_SelectModulaLocationDetail value)
        selectModulaLocationDetail,
    required TResult Function(_ClearLocationFilter value) clearLocationFilter,
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
    required TResult Function(_SaveCountDetails value) saveCountDetails,
    required TResult Function(_FindCountByCode value) findCountByCode,
    required TResult Function(_ClearScanCountResult value) clearScanCountResult,
    required TResult Function(_StartSheetScan value) startSheetScan,
    required TResult Function(_SheetScanned value) sheetScanned,
    required TResult Function(_StopSheetScan value) stopSheetScan,
    required TResult Function(_ConfirmComplete value) confirmComplete,
  }) {
    return clearLocationFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchEmployees value)? fetchEmployees,
    TResult? Function(_Search value)? search,
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_GenerateCode value)? generateCode,
    TResult? Function(_Save value)? save,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_FetchSheet value)? fetchSheet,
    TResult? Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult? Function(_SelectLocationScope value)? selectLocationScope,
    TResult? Function(_SelectProductLocation value)? selectProductLocation,
    TResult? Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult? Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult? Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult? Function(_SaveCountDetails value)? saveCountDetails,
    TResult? Function(_FindCountByCode value)? findCountByCode,
    TResult? Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult? Function(_StartSheetScan value)? startSheetScan,
    TResult? Function(_SheetScanned value)? sheetScanned,
    TResult? Function(_StopSheetScan value)? stopSheetScan,
    TResult? Function(_ConfirmComplete value)? confirmComplete,
  }) {
    return clearLocationFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchEmployees value)? fetchEmployees,
    TResult Function(_Search value)? search,
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_GenerateCode value)? generateCode,
    TResult Function(_Save value)? save,
    TResult Function(_GetById value)? getById,
    TResult Function(_Delete value)? delete,
    TResult Function(_FetchSheet value)? fetchSheet,
    TResult Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult Function(_SelectLocationScope value)? selectLocationScope,
    TResult Function(_SelectProductLocation value)? selectProductLocation,
    TResult Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult Function(_SaveCountDetails value)? saveCountDetails,
    TResult Function(_FindCountByCode value)? findCountByCode,
    TResult Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult Function(_StartSheetScan value)? startSheetScan,
    TResult Function(_SheetScanned value)? sheetScanned,
    TResult Function(_StopSheetScan value)? stopSheetScan,
    TResult Function(_ConfirmComplete value)? confirmComplete,
    required TResult orElse(),
  }) {
    if (clearLocationFilter != null) {
      return clearLocationFilter(this);
    }
    return orElse();
  }
}

abstract class _ClearLocationFilter implements InventoryCheckEvent {
  const factory _ClearLocationFilter() = _$ClearLocationFilterImpl;
}

/// @nodoc
abstract class _$$SearchSheetImplCopyWith<$Res> {
  factory _$$SearchSheetImplCopyWith(
          _$SearchSheetImpl value, $Res Function(_$SearchSheetImpl) then) =
      __$$SearchSheetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String keyword});
}

/// @nodoc
class __$$SearchSheetImplCopyWithImpl<$Res>
    extends _$InventoryCheckEventCopyWithImpl<$Res, _$SearchSheetImpl>
    implements _$$SearchSheetImplCopyWith<$Res> {
  __$$SearchSheetImplCopyWithImpl(
      _$SearchSheetImpl _value, $Res Function(_$SearchSheetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
  }) {
    return _then(_$SearchSheetImpl(
      null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchSheetImpl implements _SearchSheet {
  const _$SearchSheetImpl(this.keyword);

  @override
  final String keyword;

  @override
  String toString() {
    return 'InventoryCheckEvent.searchSheet(keyword: $keyword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSheetImpl &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keyword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSheetImplCopyWith<_$SearchSheetImpl> get copyWith =>
      __$$SearchSheetImplCopyWithImpl<_$SearchSheetImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() fetchEmployees,
    required TResult Function(String keyword) search,
    required TResult Function(int? employeeId) selectEmployee,
    required TResult Function(int? warehouseId) changeWarehouseFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime date) generateCode,
    required TResult Function(InventoryCountSavePayload payload) save,
    required TResult Function(int id) getById,
    required TResult Function(int id) delete,
    required TResult Function(int countId) fetchSheet,
    required TResult Function(
            int countId, int warehouseId, int modulaLocationId, String? keyword)
        fetchLocationProgress,
    required TResult Function(InventoryLocationGroup group) selectLocationScope,
    required TResult Function(int? productLocationId) selectProductLocation,
    required TResult Function(int? modulaLocationId) selectModulaLocation,
    required TResult Function(int? detailId) selectModulaLocationDetail,
    required TResult Function() clearLocationFilter,
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
    required TResult Function(
            int countId, List<Map<String, dynamic>> changedItems)
        saveCountDetails,
    required TResult Function(String code) findCountByCode,
    required TResult Function() clearScanCountResult,
    required TResult Function(InventoryScanMode mode) startSheetScan,
    required TResult Function(String code) sheetScanned,
    required TResult Function() stopSheetScan,
    required TResult Function(int id, bool isComplete) confirmComplete,
  }) {
    return searchSheet(keyword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? fetchEmployees,
    TResult? Function(String keyword)? search,
    TResult? Function(int? employeeId)? selectEmployee,
    TResult? Function(int? warehouseId)? changeWarehouseFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime date)? generateCode,
    TResult? Function(InventoryCountSavePayload payload)? save,
    TResult? Function(int id)? getById,
    TResult? Function(int id)? delete,
    TResult? Function(int countId)? fetchSheet,
    TResult? Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult? Function(InventoryLocationGroup group)? selectLocationScope,
    TResult? Function(int? productLocationId)? selectProductLocation,
    TResult? Function(int? modulaLocationId)? selectModulaLocation,
    TResult? Function(int? detailId)? selectModulaLocationDetail,
    TResult? Function()? clearLocationFilter,
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
    TResult? Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult? Function(String code)? findCountByCode,
    TResult? Function()? clearScanCountResult,
    TResult? Function(InventoryScanMode mode)? startSheetScan,
    TResult? Function(String code)? sheetScanned,
    TResult? Function()? stopSheetScan,
    TResult? Function(int id, bool isComplete)? confirmComplete,
  }) {
    return searchSheet?.call(keyword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? fetchEmployees,
    TResult Function(String keyword)? search,
    TResult Function(int? employeeId)? selectEmployee,
    TResult Function(int? warehouseId)? changeWarehouseFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime date)? generateCode,
    TResult Function(InventoryCountSavePayload payload)? save,
    TResult Function(int id)? getById,
    TResult Function(int id)? delete,
    TResult Function(int countId)? fetchSheet,
    TResult Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult Function(InventoryLocationGroup group)? selectLocationScope,
    TResult Function(int? productLocationId)? selectProductLocation,
    TResult Function(int? modulaLocationId)? selectModulaLocation,
    TResult Function(int? detailId)? selectModulaLocationDetail,
    TResult Function()? clearLocationFilter,
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
    TResult Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult Function(String code)? findCountByCode,
    TResult Function()? clearScanCountResult,
    TResult Function(InventoryScanMode mode)? startSheetScan,
    TResult Function(String code)? sheetScanned,
    TResult Function()? stopSheetScan,
    TResult Function(int id, bool isComplete)? confirmComplete,
    required TResult orElse(),
  }) {
    if (searchSheet != null) {
      return searchSheet(keyword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchEmployees value) fetchEmployees,
    required TResult Function(_Search value) search,
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_ChangeWarehouseFilter value)
        changeWarehouseFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_GenerateCode value) generateCode,
    required TResult Function(_Save value) save,
    required TResult Function(_GetById value) getById,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FetchSheet value) fetchSheet,
    required TResult Function(_FetchLocationProgress value)
        fetchLocationProgress,
    required TResult Function(_SelectLocationScope value) selectLocationScope,
    required TResult Function(_SelectProductLocation value)
        selectProductLocation,
    required TResult Function(_SelectModulaLocation value) selectModulaLocation,
    required TResult Function(_SelectModulaLocationDetail value)
        selectModulaLocationDetail,
    required TResult Function(_ClearLocationFilter value) clearLocationFilter,
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
    required TResult Function(_SaveCountDetails value) saveCountDetails,
    required TResult Function(_FindCountByCode value) findCountByCode,
    required TResult Function(_ClearScanCountResult value) clearScanCountResult,
    required TResult Function(_StartSheetScan value) startSheetScan,
    required TResult Function(_SheetScanned value) sheetScanned,
    required TResult Function(_StopSheetScan value) stopSheetScan,
    required TResult Function(_ConfirmComplete value) confirmComplete,
  }) {
    return searchSheet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchEmployees value)? fetchEmployees,
    TResult? Function(_Search value)? search,
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_GenerateCode value)? generateCode,
    TResult? Function(_Save value)? save,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_FetchSheet value)? fetchSheet,
    TResult? Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult? Function(_SelectLocationScope value)? selectLocationScope,
    TResult? Function(_SelectProductLocation value)? selectProductLocation,
    TResult? Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult? Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult? Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult? Function(_SaveCountDetails value)? saveCountDetails,
    TResult? Function(_FindCountByCode value)? findCountByCode,
    TResult? Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult? Function(_StartSheetScan value)? startSheetScan,
    TResult? Function(_SheetScanned value)? sheetScanned,
    TResult? Function(_StopSheetScan value)? stopSheetScan,
    TResult? Function(_ConfirmComplete value)? confirmComplete,
  }) {
    return searchSheet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchEmployees value)? fetchEmployees,
    TResult Function(_Search value)? search,
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_GenerateCode value)? generateCode,
    TResult Function(_Save value)? save,
    TResult Function(_GetById value)? getById,
    TResult Function(_Delete value)? delete,
    TResult Function(_FetchSheet value)? fetchSheet,
    TResult Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult Function(_SelectLocationScope value)? selectLocationScope,
    TResult Function(_SelectProductLocation value)? selectProductLocation,
    TResult Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult Function(_SaveCountDetails value)? saveCountDetails,
    TResult Function(_FindCountByCode value)? findCountByCode,
    TResult Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult Function(_StartSheetScan value)? startSheetScan,
    TResult Function(_SheetScanned value)? sheetScanned,
    TResult Function(_StopSheetScan value)? stopSheetScan,
    TResult Function(_ConfirmComplete value)? confirmComplete,
    required TResult orElse(),
  }) {
    if (searchSheet != null) {
      return searchSheet(this);
    }
    return orElse();
  }
}

abstract class _SearchSheet implements InventoryCheckEvent {
  const factory _SearchSheet(final String keyword) = _$SearchSheetImpl;

  String get keyword;
  @JsonKey(ignore: true)
  _$$SearchSheetImplCopyWith<_$SearchSheetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterSheetImplCopyWith<$Res> {
  factory _$$FilterSheetImplCopyWith(
          _$FilterSheetImpl value, $Res Function(_$FilterSheetImpl) then) =
      __$$FilterSheetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({InventoryCheckSheetFilter? filter});
}

/// @nodoc
class __$$FilterSheetImplCopyWithImpl<$Res>
    extends _$InventoryCheckEventCopyWithImpl<$Res, _$FilterSheetImpl>
    implements _$$FilterSheetImplCopyWith<$Res> {
  __$$FilterSheetImplCopyWithImpl(
      _$FilterSheetImpl _value, $Res Function(_$FilterSheetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = freezed,
  }) {
    return _then(_$FilterSheetImpl(
      freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as InventoryCheckSheetFilter?,
    ));
  }
}

/// @nodoc

class _$FilterSheetImpl implements _FilterSheet {
  const _$FilterSheetImpl(this.filter);

  @override
  final InventoryCheckSheetFilter? filter;

  @override
  String toString() {
    return 'InventoryCheckEvent.filterSheet(filter: $filter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterSheetImpl &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterSheetImplCopyWith<_$FilterSheetImpl> get copyWith =>
      __$$FilterSheetImplCopyWithImpl<_$FilterSheetImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() fetchEmployees,
    required TResult Function(String keyword) search,
    required TResult Function(int? employeeId) selectEmployee,
    required TResult Function(int? warehouseId) changeWarehouseFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime date) generateCode,
    required TResult Function(InventoryCountSavePayload payload) save,
    required TResult Function(int id) getById,
    required TResult Function(int id) delete,
    required TResult Function(int countId) fetchSheet,
    required TResult Function(
            int countId, int warehouseId, int modulaLocationId, String? keyword)
        fetchLocationProgress,
    required TResult Function(InventoryLocationGroup group) selectLocationScope,
    required TResult Function(int? productLocationId) selectProductLocation,
    required TResult Function(int? modulaLocationId) selectModulaLocation,
    required TResult Function(int? detailId) selectModulaLocationDetail,
    required TResult Function() clearLocationFilter,
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
    required TResult Function(
            int countId, List<Map<String, dynamic>> changedItems)
        saveCountDetails,
    required TResult Function(String code) findCountByCode,
    required TResult Function() clearScanCountResult,
    required TResult Function(InventoryScanMode mode) startSheetScan,
    required TResult Function(String code) sheetScanned,
    required TResult Function() stopSheetScan,
    required TResult Function(int id, bool isComplete) confirmComplete,
  }) {
    return filterSheet(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? fetchEmployees,
    TResult? Function(String keyword)? search,
    TResult? Function(int? employeeId)? selectEmployee,
    TResult? Function(int? warehouseId)? changeWarehouseFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime date)? generateCode,
    TResult? Function(InventoryCountSavePayload payload)? save,
    TResult? Function(int id)? getById,
    TResult? Function(int id)? delete,
    TResult? Function(int countId)? fetchSheet,
    TResult? Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult? Function(InventoryLocationGroup group)? selectLocationScope,
    TResult? Function(int? productLocationId)? selectProductLocation,
    TResult? Function(int? modulaLocationId)? selectModulaLocation,
    TResult? Function(int? detailId)? selectModulaLocationDetail,
    TResult? Function()? clearLocationFilter,
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
    TResult? Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult? Function(String code)? findCountByCode,
    TResult? Function()? clearScanCountResult,
    TResult? Function(InventoryScanMode mode)? startSheetScan,
    TResult? Function(String code)? sheetScanned,
    TResult? Function()? stopSheetScan,
    TResult? Function(int id, bool isComplete)? confirmComplete,
  }) {
    return filterSheet?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? fetchEmployees,
    TResult Function(String keyword)? search,
    TResult Function(int? employeeId)? selectEmployee,
    TResult Function(int? warehouseId)? changeWarehouseFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime date)? generateCode,
    TResult Function(InventoryCountSavePayload payload)? save,
    TResult Function(int id)? getById,
    TResult Function(int id)? delete,
    TResult Function(int countId)? fetchSheet,
    TResult Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult Function(InventoryLocationGroup group)? selectLocationScope,
    TResult Function(int? productLocationId)? selectProductLocation,
    TResult Function(int? modulaLocationId)? selectModulaLocation,
    TResult Function(int? detailId)? selectModulaLocationDetail,
    TResult Function()? clearLocationFilter,
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
    TResult Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult Function(String code)? findCountByCode,
    TResult Function()? clearScanCountResult,
    TResult Function(InventoryScanMode mode)? startSheetScan,
    TResult Function(String code)? sheetScanned,
    TResult Function()? stopSheetScan,
    TResult Function(int id, bool isComplete)? confirmComplete,
    required TResult orElse(),
  }) {
    if (filterSheet != null) {
      return filterSheet(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchEmployees value) fetchEmployees,
    required TResult Function(_Search value) search,
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_ChangeWarehouseFilter value)
        changeWarehouseFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_GenerateCode value) generateCode,
    required TResult Function(_Save value) save,
    required TResult Function(_GetById value) getById,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FetchSheet value) fetchSheet,
    required TResult Function(_FetchLocationProgress value)
        fetchLocationProgress,
    required TResult Function(_SelectLocationScope value) selectLocationScope,
    required TResult Function(_SelectProductLocation value)
        selectProductLocation,
    required TResult Function(_SelectModulaLocation value) selectModulaLocation,
    required TResult Function(_SelectModulaLocationDetail value)
        selectModulaLocationDetail,
    required TResult Function(_ClearLocationFilter value) clearLocationFilter,
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
    required TResult Function(_SaveCountDetails value) saveCountDetails,
    required TResult Function(_FindCountByCode value) findCountByCode,
    required TResult Function(_ClearScanCountResult value) clearScanCountResult,
    required TResult Function(_StartSheetScan value) startSheetScan,
    required TResult Function(_SheetScanned value) sheetScanned,
    required TResult Function(_StopSheetScan value) stopSheetScan,
    required TResult Function(_ConfirmComplete value) confirmComplete,
  }) {
    return filterSheet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchEmployees value)? fetchEmployees,
    TResult? Function(_Search value)? search,
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_GenerateCode value)? generateCode,
    TResult? Function(_Save value)? save,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_FetchSheet value)? fetchSheet,
    TResult? Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult? Function(_SelectLocationScope value)? selectLocationScope,
    TResult? Function(_SelectProductLocation value)? selectProductLocation,
    TResult? Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult? Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult? Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult? Function(_SaveCountDetails value)? saveCountDetails,
    TResult? Function(_FindCountByCode value)? findCountByCode,
    TResult? Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult? Function(_StartSheetScan value)? startSheetScan,
    TResult? Function(_SheetScanned value)? sheetScanned,
    TResult? Function(_StopSheetScan value)? stopSheetScan,
    TResult? Function(_ConfirmComplete value)? confirmComplete,
  }) {
    return filterSheet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchEmployees value)? fetchEmployees,
    TResult Function(_Search value)? search,
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_GenerateCode value)? generateCode,
    TResult Function(_Save value)? save,
    TResult Function(_GetById value)? getById,
    TResult Function(_Delete value)? delete,
    TResult Function(_FetchSheet value)? fetchSheet,
    TResult Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult Function(_SelectLocationScope value)? selectLocationScope,
    TResult Function(_SelectProductLocation value)? selectProductLocation,
    TResult Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult Function(_SaveCountDetails value)? saveCountDetails,
    TResult Function(_FindCountByCode value)? findCountByCode,
    TResult Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult Function(_StartSheetScan value)? startSheetScan,
    TResult Function(_SheetScanned value)? sheetScanned,
    TResult Function(_StopSheetScan value)? stopSheetScan,
    TResult Function(_ConfirmComplete value)? confirmComplete,
    required TResult orElse(),
  }) {
    if (filterSheet != null) {
      return filterSheet(this);
    }
    return orElse();
  }
}

abstract class _FilterSheet implements InventoryCheckEvent {
  const factory _FilterSheet(final InventoryCheckSheetFilter? filter) =
      _$FilterSheetImpl;

  InventoryCheckSheetFilter? get filter;
  @JsonKey(ignore: true)
  _$$FilterSheetImplCopyWith<_$FilterSheetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchProductGroupsRtcImplCopyWith<$Res> {
  factory _$$FetchProductGroupsRtcImplCopyWith(
          _$FetchProductGroupsRtcImpl value,
          $Res Function(_$FetchProductGroupsRtcImpl) then) =
      __$$FetchProductGroupsRtcImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int warehouseId, int warehouseType});
}

/// @nodoc
class __$$FetchProductGroupsRtcImplCopyWithImpl<$Res>
    extends _$InventoryCheckEventCopyWithImpl<$Res, _$FetchProductGroupsRtcImpl>
    implements _$$FetchProductGroupsRtcImplCopyWith<$Res> {
  __$$FetchProductGroupsRtcImplCopyWithImpl(_$FetchProductGroupsRtcImpl _value,
      $Res Function(_$FetchProductGroupsRtcImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? warehouseId = null,
    Object? warehouseType = null,
  }) {
    return _then(_$FetchProductGroupsRtcImpl(
      warehouseId: null == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int,
      warehouseType: null == warehouseType
          ? _value.warehouseType
          : warehouseType // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchProductGroupsRtcImpl implements _FetchProductGroupsRtc {
  const _$FetchProductGroupsRtcImpl(
      {required this.warehouseId, required this.warehouseType});

  @override
  final int warehouseId;
  @override
  final int warehouseType;

  @override
  String toString() {
    return 'InventoryCheckEvent.fetchProductGroupsRtc(warehouseId: $warehouseId, warehouseType: $warehouseType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchProductGroupsRtcImpl &&
            (identical(other.warehouseId, warehouseId) ||
                other.warehouseId == warehouseId) &&
            (identical(other.warehouseType, warehouseType) ||
                other.warehouseType == warehouseType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, warehouseId, warehouseType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchProductGroupsRtcImplCopyWith<_$FetchProductGroupsRtcImpl>
      get copyWith => __$$FetchProductGroupsRtcImplCopyWithImpl<
          _$FetchProductGroupsRtcImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() fetchEmployees,
    required TResult Function(String keyword) search,
    required TResult Function(int? employeeId) selectEmployee,
    required TResult Function(int? warehouseId) changeWarehouseFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime date) generateCode,
    required TResult Function(InventoryCountSavePayload payload) save,
    required TResult Function(int id) getById,
    required TResult Function(int id) delete,
    required TResult Function(int countId) fetchSheet,
    required TResult Function(
            int countId, int warehouseId, int modulaLocationId, String? keyword)
        fetchLocationProgress,
    required TResult Function(InventoryLocationGroup group) selectLocationScope,
    required TResult Function(int? productLocationId) selectProductLocation,
    required TResult Function(int? modulaLocationId) selectModulaLocation,
    required TResult Function(int? detailId) selectModulaLocationDetail,
    required TResult Function() clearLocationFilter,
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
    required TResult Function(
            int countId, List<Map<String, dynamic>> changedItems)
        saveCountDetails,
    required TResult Function(String code) findCountByCode,
    required TResult Function() clearScanCountResult,
    required TResult Function(InventoryScanMode mode) startSheetScan,
    required TResult Function(String code) sheetScanned,
    required TResult Function() stopSheetScan,
    required TResult Function(int id, bool isComplete) confirmComplete,
  }) {
    return fetchProductGroupsRtc(warehouseId, warehouseType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? fetchEmployees,
    TResult? Function(String keyword)? search,
    TResult? Function(int? employeeId)? selectEmployee,
    TResult? Function(int? warehouseId)? changeWarehouseFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime date)? generateCode,
    TResult? Function(InventoryCountSavePayload payload)? save,
    TResult? Function(int id)? getById,
    TResult? Function(int id)? delete,
    TResult? Function(int countId)? fetchSheet,
    TResult? Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult? Function(InventoryLocationGroup group)? selectLocationScope,
    TResult? Function(int? productLocationId)? selectProductLocation,
    TResult? Function(int? modulaLocationId)? selectModulaLocation,
    TResult? Function(int? detailId)? selectModulaLocationDetail,
    TResult? Function()? clearLocationFilter,
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
    TResult? Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult? Function(String code)? findCountByCode,
    TResult? Function()? clearScanCountResult,
    TResult? Function(InventoryScanMode mode)? startSheetScan,
    TResult? Function(String code)? sheetScanned,
    TResult? Function()? stopSheetScan,
    TResult? Function(int id, bool isComplete)? confirmComplete,
  }) {
    return fetchProductGroupsRtc?.call(warehouseId, warehouseType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? fetchEmployees,
    TResult Function(String keyword)? search,
    TResult Function(int? employeeId)? selectEmployee,
    TResult Function(int? warehouseId)? changeWarehouseFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime date)? generateCode,
    TResult Function(InventoryCountSavePayload payload)? save,
    TResult Function(int id)? getById,
    TResult Function(int id)? delete,
    TResult Function(int countId)? fetchSheet,
    TResult Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult Function(InventoryLocationGroup group)? selectLocationScope,
    TResult Function(int? productLocationId)? selectProductLocation,
    TResult Function(int? modulaLocationId)? selectModulaLocation,
    TResult Function(int? detailId)? selectModulaLocationDetail,
    TResult Function()? clearLocationFilter,
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
    TResult Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult Function(String code)? findCountByCode,
    TResult Function()? clearScanCountResult,
    TResult Function(InventoryScanMode mode)? startSheetScan,
    TResult Function(String code)? sheetScanned,
    TResult Function()? stopSheetScan,
    TResult Function(int id, bool isComplete)? confirmComplete,
    required TResult orElse(),
  }) {
    if (fetchProductGroupsRtc != null) {
      return fetchProductGroupsRtc(warehouseId, warehouseType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchEmployees value) fetchEmployees,
    required TResult Function(_Search value) search,
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_ChangeWarehouseFilter value)
        changeWarehouseFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_GenerateCode value) generateCode,
    required TResult Function(_Save value) save,
    required TResult Function(_GetById value) getById,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FetchSheet value) fetchSheet,
    required TResult Function(_FetchLocationProgress value)
        fetchLocationProgress,
    required TResult Function(_SelectLocationScope value) selectLocationScope,
    required TResult Function(_SelectProductLocation value)
        selectProductLocation,
    required TResult Function(_SelectModulaLocation value) selectModulaLocation,
    required TResult Function(_SelectModulaLocationDetail value)
        selectModulaLocationDetail,
    required TResult Function(_ClearLocationFilter value) clearLocationFilter,
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
    required TResult Function(_SaveCountDetails value) saveCountDetails,
    required TResult Function(_FindCountByCode value) findCountByCode,
    required TResult Function(_ClearScanCountResult value) clearScanCountResult,
    required TResult Function(_StartSheetScan value) startSheetScan,
    required TResult Function(_SheetScanned value) sheetScanned,
    required TResult Function(_StopSheetScan value) stopSheetScan,
    required TResult Function(_ConfirmComplete value) confirmComplete,
  }) {
    return fetchProductGroupsRtc(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchEmployees value)? fetchEmployees,
    TResult? Function(_Search value)? search,
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_GenerateCode value)? generateCode,
    TResult? Function(_Save value)? save,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_FetchSheet value)? fetchSheet,
    TResult? Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult? Function(_SelectLocationScope value)? selectLocationScope,
    TResult? Function(_SelectProductLocation value)? selectProductLocation,
    TResult? Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult? Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult? Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult? Function(_SaveCountDetails value)? saveCountDetails,
    TResult? Function(_FindCountByCode value)? findCountByCode,
    TResult? Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult? Function(_StartSheetScan value)? startSheetScan,
    TResult? Function(_SheetScanned value)? sheetScanned,
    TResult? Function(_StopSheetScan value)? stopSheetScan,
    TResult? Function(_ConfirmComplete value)? confirmComplete,
  }) {
    return fetchProductGroupsRtc?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchEmployees value)? fetchEmployees,
    TResult Function(_Search value)? search,
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_GenerateCode value)? generateCode,
    TResult Function(_Save value)? save,
    TResult Function(_GetById value)? getById,
    TResult Function(_Delete value)? delete,
    TResult Function(_FetchSheet value)? fetchSheet,
    TResult Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult Function(_SelectLocationScope value)? selectLocationScope,
    TResult Function(_SelectProductLocation value)? selectProductLocation,
    TResult Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult Function(_SaveCountDetails value)? saveCountDetails,
    TResult Function(_FindCountByCode value)? findCountByCode,
    TResult Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult Function(_StartSheetScan value)? startSheetScan,
    TResult Function(_SheetScanned value)? sheetScanned,
    TResult Function(_StopSheetScan value)? stopSheetScan,
    TResult Function(_ConfirmComplete value)? confirmComplete,
    required TResult orElse(),
  }) {
    if (fetchProductGroupsRtc != null) {
      return fetchProductGroupsRtc(this);
    }
    return orElse();
  }
}

abstract class _FetchProductGroupsRtc implements InventoryCheckEvent {
  const factory _FetchProductGroupsRtc(
      {required final int warehouseId,
      required final int warehouseType}) = _$FetchProductGroupsRtcImpl;

  int get warehouseId;
  int get warehouseType;
  @JsonKey(ignore: true)
  _$$FetchProductGroupsRtcImplCopyWith<_$FetchProductGroupsRtcImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterSheetProductGroupImplCopyWith<$Res> {
  factory _$$FilterSheetProductGroupImplCopyWith(
          _$FilterSheetProductGroupImpl value,
          $Res Function(_$FilterSheetProductGroupImpl) then) =
      __$$FilterSheetProductGroupImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? groupId});
}

/// @nodoc
class __$$FilterSheetProductGroupImplCopyWithImpl<$Res>
    extends _$InventoryCheckEventCopyWithImpl<$Res,
        _$FilterSheetProductGroupImpl>
    implements _$$FilterSheetProductGroupImplCopyWith<$Res> {
  __$$FilterSheetProductGroupImplCopyWithImpl(
      _$FilterSheetProductGroupImpl _value,
      $Res Function(_$FilterSheetProductGroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupId = freezed,
  }) {
    return _then(_$FilterSheetProductGroupImpl(
      freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$FilterSheetProductGroupImpl implements _FilterSheetProductGroup {
  const _$FilterSheetProductGroupImpl(this.groupId);

  @override
  final int? groupId;

  @override
  String toString() {
    return 'InventoryCheckEvent.filterSheetProductGroup(groupId: $groupId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterSheetProductGroupImpl &&
            (identical(other.groupId, groupId) || other.groupId == groupId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, groupId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterSheetProductGroupImplCopyWith<_$FilterSheetProductGroupImpl>
      get copyWith => __$$FilterSheetProductGroupImplCopyWithImpl<
          _$FilterSheetProductGroupImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() fetchEmployees,
    required TResult Function(String keyword) search,
    required TResult Function(int? employeeId) selectEmployee,
    required TResult Function(int? warehouseId) changeWarehouseFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime date) generateCode,
    required TResult Function(InventoryCountSavePayload payload) save,
    required TResult Function(int id) getById,
    required TResult Function(int id) delete,
    required TResult Function(int countId) fetchSheet,
    required TResult Function(
            int countId, int warehouseId, int modulaLocationId, String? keyword)
        fetchLocationProgress,
    required TResult Function(InventoryLocationGroup group) selectLocationScope,
    required TResult Function(int? productLocationId) selectProductLocation,
    required TResult Function(int? modulaLocationId) selectModulaLocation,
    required TResult Function(int? detailId) selectModulaLocationDetail,
    required TResult Function() clearLocationFilter,
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
    required TResult Function(
            int countId, List<Map<String, dynamic>> changedItems)
        saveCountDetails,
    required TResult Function(String code) findCountByCode,
    required TResult Function() clearScanCountResult,
    required TResult Function(InventoryScanMode mode) startSheetScan,
    required TResult Function(String code) sheetScanned,
    required TResult Function() stopSheetScan,
    required TResult Function(int id, bool isComplete) confirmComplete,
  }) {
    return filterSheetProductGroup(groupId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? fetchEmployees,
    TResult? Function(String keyword)? search,
    TResult? Function(int? employeeId)? selectEmployee,
    TResult? Function(int? warehouseId)? changeWarehouseFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime date)? generateCode,
    TResult? Function(InventoryCountSavePayload payload)? save,
    TResult? Function(int id)? getById,
    TResult? Function(int id)? delete,
    TResult? Function(int countId)? fetchSheet,
    TResult? Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult? Function(InventoryLocationGroup group)? selectLocationScope,
    TResult? Function(int? productLocationId)? selectProductLocation,
    TResult? Function(int? modulaLocationId)? selectModulaLocation,
    TResult? Function(int? detailId)? selectModulaLocationDetail,
    TResult? Function()? clearLocationFilter,
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
    TResult? Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult? Function(String code)? findCountByCode,
    TResult? Function()? clearScanCountResult,
    TResult? Function(InventoryScanMode mode)? startSheetScan,
    TResult? Function(String code)? sheetScanned,
    TResult? Function()? stopSheetScan,
    TResult? Function(int id, bool isComplete)? confirmComplete,
  }) {
    return filterSheetProductGroup?.call(groupId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? fetchEmployees,
    TResult Function(String keyword)? search,
    TResult Function(int? employeeId)? selectEmployee,
    TResult Function(int? warehouseId)? changeWarehouseFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime date)? generateCode,
    TResult Function(InventoryCountSavePayload payload)? save,
    TResult Function(int id)? getById,
    TResult Function(int id)? delete,
    TResult Function(int countId)? fetchSheet,
    TResult Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult Function(InventoryLocationGroup group)? selectLocationScope,
    TResult Function(int? productLocationId)? selectProductLocation,
    TResult Function(int? modulaLocationId)? selectModulaLocation,
    TResult Function(int? detailId)? selectModulaLocationDetail,
    TResult Function()? clearLocationFilter,
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
    TResult Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult Function(String code)? findCountByCode,
    TResult Function()? clearScanCountResult,
    TResult Function(InventoryScanMode mode)? startSheetScan,
    TResult Function(String code)? sheetScanned,
    TResult Function()? stopSheetScan,
    TResult Function(int id, bool isComplete)? confirmComplete,
    required TResult orElse(),
  }) {
    if (filterSheetProductGroup != null) {
      return filterSheetProductGroup(groupId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchEmployees value) fetchEmployees,
    required TResult Function(_Search value) search,
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_ChangeWarehouseFilter value)
        changeWarehouseFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_GenerateCode value) generateCode,
    required TResult Function(_Save value) save,
    required TResult Function(_GetById value) getById,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FetchSheet value) fetchSheet,
    required TResult Function(_FetchLocationProgress value)
        fetchLocationProgress,
    required TResult Function(_SelectLocationScope value) selectLocationScope,
    required TResult Function(_SelectProductLocation value)
        selectProductLocation,
    required TResult Function(_SelectModulaLocation value) selectModulaLocation,
    required TResult Function(_SelectModulaLocationDetail value)
        selectModulaLocationDetail,
    required TResult Function(_ClearLocationFilter value) clearLocationFilter,
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
    required TResult Function(_SaveCountDetails value) saveCountDetails,
    required TResult Function(_FindCountByCode value) findCountByCode,
    required TResult Function(_ClearScanCountResult value) clearScanCountResult,
    required TResult Function(_StartSheetScan value) startSheetScan,
    required TResult Function(_SheetScanned value) sheetScanned,
    required TResult Function(_StopSheetScan value) stopSheetScan,
    required TResult Function(_ConfirmComplete value) confirmComplete,
  }) {
    return filterSheetProductGroup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchEmployees value)? fetchEmployees,
    TResult? Function(_Search value)? search,
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_GenerateCode value)? generateCode,
    TResult? Function(_Save value)? save,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_FetchSheet value)? fetchSheet,
    TResult? Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult? Function(_SelectLocationScope value)? selectLocationScope,
    TResult? Function(_SelectProductLocation value)? selectProductLocation,
    TResult? Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult? Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult? Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult? Function(_SaveCountDetails value)? saveCountDetails,
    TResult? Function(_FindCountByCode value)? findCountByCode,
    TResult? Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult? Function(_StartSheetScan value)? startSheetScan,
    TResult? Function(_SheetScanned value)? sheetScanned,
    TResult? Function(_StopSheetScan value)? stopSheetScan,
    TResult? Function(_ConfirmComplete value)? confirmComplete,
  }) {
    return filterSheetProductGroup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchEmployees value)? fetchEmployees,
    TResult Function(_Search value)? search,
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_GenerateCode value)? generateCode,
    TResult Function(_Save value)? save,
    TResult Function(_GetById value)? getById,
    TResult Function(_Delete value)? delete,
    TResult Function(_FetchSheet value)? fetchSheet,
    TResult Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult Function(_SelectLocationScope value)? selectLocationScope,
    TResult Function(_SelectProductLocation value)? selectProductLocation,
    TResult Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult Function(_SaveCountDetails value)? saveCountDetails,
    TResult Function(_FindCountByCode value)? findCountByCode,
    TResult Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult Function(_StartSheetScan value)? startSheetScan,
    TResult Function(_SheetScanned value)? sheetScanned,
    TResult Function(_StopSheetScan value)? stopSheetScan,
    TResult Function(_ConfirmComplete value)? confirmComplete,
    required TResult orElse(),
  }) {
    if (filterSheetProductGroup != null) {
      return filterSheetProductGroup(this);
    }
    return orElse();
  }
}

abstract class _FilterSheetProductGroup implements InventoryCheckEvent {
  const factory _FilterSheetProductGroup(final int? groupId) =
      _$FilterSheetProductGroupImpl;

  int? get groupId;
  @JsonKey(ignore: true)
  _$$FilterSheetProductGroupImplCopyWith<_$FilterSheetProductGroupImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveCountDetailsImplCopyWith<$Res> {
  factory _$$SaveCountDetailsImplCopyWith(_$SaveCountDetailsImpl value,
          $Res Function(_$SaveCountDetailsImpl) then) =
      __$$SaveCountDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int countId, List<Map<String, dynamic>> changedItems});
}

/// @nodoc
class __$$SaveCountDetailsImplCopyWithImpl<$Res>
    extends _$InventoryCheckEventCopyWithImpl<$Res, _$SaveCountDetailsImpl>
    implements _$$SaveCountDetailsImplCopyWith<$Res> {
  __$$SaveCountDetailsImplCopyWithImpl(_$SaveCountDetailsImpl _value,
      $Res Function(_$SaveCountDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countId = null,
    Object? changedItems = null,
  }) {
    return _then(_$SaveCountDetailsImpl(
      countId: null == countId
          ? _value.countId
          : countId // ignore: cast_nullable_to_non_nullable
              as int,
      changedItems: null == changedItems
          ? _value._changedItems
          : changedItems // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$SaveCountDetailsImpl implements _SaveCountDetails {
  const _$SaveCountDetailsImpl(
      {required this.countId,
      required final List<Map<String, dynamic>> changedItems})
      : _changedItems = changedItems;

  @override
  final int countId;
  final List<Map<String, dynamic>> _changedItems;
  @override
  List<Map<String, dynamic>> get changedItems {
    if (_changedItems is EqualUnmodifiableListView) return _changedItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_changedItems);
  }

  @override
  String toString() {
    return 'InventoryCheckEvent.saveCountDetails(countId: $countId, changedItems: $changedItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveCountDetailsImpl &&
            (identical(other.countId, countId) || other.countId == countId) &&
            const DeepCollectionEquality()
                .equals(other._changedItems, _changedItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, countId, const DeepCollectionEquality().hash(_changedItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveCountDetailsImplCopyWith<_$SaveCountDetailsImpl> get copyWith =>
      __$$SaveCountDetailsImplCopyWithImpl<_$SaveCountDetailsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() fetchEmployees,
    required TResult Function(String keyword) search,
    required TResult Function(int? employeeId) selectEmployee,
    required TResult Function(int? warehouseId) changeWarehouseFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime date) generateCode,
    required TResult Function(InventoryCountSavePayload payload) save,
    required TResult Function(int id) getById,
    required TResult Function(int id) delete,
    required TResult Function(int countId) fetchSheet,
    required TResult Function(
            int countId, int warehouseId, int modulaLocationId, String? keyword)
        fetchLocationProgress,
    required TResult Function(InventoryLocationGroup group) selectLocationScope,
    required TResult Function(int? productLocationId) selectProductLocation,
    required TResult Function(int? modulaLocationId) selectModulaLocation,
    required TResult Function(int? detailId) selectModulaLocationDetail,
    required TResult Function() clearLocationFilter,
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
    required TResult Function(
            int countId, List<Map<String, dynamic>> changedItems)
        saveCountDetails,
    required TResult Function(String code) findCountByCode,
    required TResult Function() clearScanCountResult,
    required TResult Function(InventoryScanMode mode) startSheetScan,
    required TResult Function(String code) sheetScanned,
    required TResult Function() stopSheetScan,
    required TResult Function(int id, bool isComplete) confirmComplete,
  }) {
    return saveCountDetails(countId, changedItems);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? fetchEmployees,
    TResult? Function(String keyword)? search,
    TResult? Function(int? employeeId)? selectEmployee,
    TResult? Function(int? warehouseId)? changeWarehouseFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime date)? generateCode,
    TResult? Function(InventoryCountSavePayload payload)? save,
    TResult? Function(int id)? getById,
    TResult? Function(int id)? delete,
    TResult? Function(int countId)? fetchSheet,
    TResult? Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult? Function(InventoryLocationGroup group)? selectLocationScope,
    TResult? Function(int? productLocationId)? selectProductLocation,
    TResult? Function(int? modulaLocationId)? selectModulaLocation,
    TResult? Function(int? detailId)? selectModulaLocationDetail,
    TResult? Function()? clearLocationFilter,
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
    TResult? Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult? Function(String code)? findCountByCode,
    TResult? Function()? clearScanCountResult,
    TResult? Function(InventoryScanMode mode)? startSheetScan,
    TResult? Function(String code)? sheetScanned,
    TResult? Function()? stopSheetScan,
    TResult? Function(int id, bool isComplete)? confirmComplete,
  }) {
    return saveCountDetails?.call(countId, changedItems);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? fetchEmployees,
    TResult Function(String keyword)? search,
    TResult Function(int? employeeId)? selectEmployee,
    TResult Function(int? warehouseId)? changeWarehouseFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime date)? generateCode,
    TResult Function(InventoryCountSavePayload payload)? save,
    TResult Function(int id)? getById,
    TResult Function(int id)? delete,
    TResult Function(int countId)? fetchSheet,
    TResult Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult Function(InventoryLocationGroup group)? selectLocationScope,
    TResult Function(int? productLocationId)? selectProductLocation,
    TResult Function(int? modulaLocationId)? selectModulaLocation,
    TResult Function(int? detailId)? selectModulaLocationDetail,
    TResult Function()? clearLocationFilter,
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
    TResult Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult Function(String code)? findCountByCode,
    TResult Function()? clearScanCountResult,
    TResult Function(InventoryScanMode mode)? startSheetScan,
    TResult Function(String code)? sheetScanned,
    TResult Function()? stopSheetScan,
    TResult Function(int id, bool isComplete)? confirmComplete,
    required TResult orElse(),
  }) {
    if (saveCountDetails != null) {
      return saveCountDetails(countId, changedItems);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchEmployees value) fetchEmployees,
    required TResult Function(_Search value) search,
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_ChangeWarehouseFilter value)
        changeWarehouseFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_GenerateCode value) generateCode,
    required TResult Function(_Save value) save,
    required TResult Function(_GetById value) getById,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FetchSheet value) fetchSheet,
    required TResult Function(_FetchLocationProgress value)
        fetchLocationProgress,
    required TResult Function(_SelectLocationScope value) selectLocationScope,
    required TResult Function(_SelectProductLocation value)
        selectProductLocation,
    required TResult Function(_SelectModulaLocation value) selectModulaLocation,
    required TResult Function(_SelectModulaLocationDetail value)
        selectModulaLocationDetail,
    required TResult Function(_ClearLocationFilter value) clearLocationFilter,
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
    required TResult Function(_SaveCountDetails value) saveCountDetails,
    required TResult Function(_FindCountByCode value) findCountByCode,
    required TResult Function(_ClearScanCountResult value) clearScanCountResult,
    required TResult Function(_StartSheetScan value) startSheetScan,
    required TResult Function(_SheetScanned value) sheetScanned,
    required TResult Function(_StopSheetScan value) stopSheetScan,
    required TResult Function(_ConfirmComplete value) confirmComplete,
  }) {
    return saveCountDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchEmployees value)? fetchEmployees,
    TResult? Function(_Search value)? search,
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_GenerateCode value)? generateCode,
    TResult? Function(_Save value)? save,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_FetchSheet value)? fetchSheet,
    TResult? Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult? Function(_SelectLocationScope value)? selectLocationScope,
    TResult? Function(_SelectProductLocation value)? selectProductLocation,
    TResult? Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult? Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult? Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult? Function(_SaveCountDetails value)? saveCountDetails,
    TResult? Function(_FindCountByCode value)? findCountByCode,
    TResult? Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult? Function(_StartSheetScan value)? startSheetScan,
    TResult? Function(_SheetScanned value)? sheetScanned,
    TResult? Function(_StopSheetScan value)? stopSheetScan,
    TResult? Function(_ConfirmComplete value)? confirmComplete,
  }) {
    return saveCountDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchEmployees value)? fetchEmployees,
    TResult Function(_Search value)? search,
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_GenerateCode value)? generateCode,
    TResult Function(_Save value)? save,
    TResult Function(_GetById value)? getById,
    TResult Function(_Delete value)? delete,
    TResult Function(_FetchSheet value)? fetchSheet,
    TResult Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult Function(_SelectLocationScope value)? selectLocationScope,
    TResult Function(_SelectProductLocation value)? selectProductLocation,
    TResult Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult Function(_SaveCountDetails value)? saveCountDetails,
    TResult Function(_FindCountByCode value)? findCountByCode,
    TResult Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult Function(_StartSheetScan value)? startSheetScan,
    TResult Function(_SheetScanned value)? sheetScanned,
    TResult Function(_StopSheetScan value)? stopSheetScan,
    TResult Function(_ConfirmComplete value)? confirmComplete,
    required TResult orElse(),
  }) {
    if (saveCountDetails != null) {
      return saveCountDetails(this);
    }
    return orElse();
  }
}

abstract class _SaveCountDetails implements InventoryCheckEvent {
  const factory _SaveCountDetails(
          {required final int countId,
          required final List<Map<String, dynamic>> changedItems}) =
      _$SaveCountDetailsImpl;

  int get countId;
  List<Map<String, dynamic>> get changedItems;
  @JsonKey(ignore: true)
  _$$SaveCountDetailsImplCopyWith<_$SaveCountDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FindCountByCodeImplCopyWith<$Res> {
  factory _$$FindCountByCodeImplCopyWith(_$FindCountByCodeImpl value,
          $Res Function(_$FindCountByCodeImpl) then) =
      __$$FindCountByCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String code});
}

/// @nodoc
class __$$FindCountByCodeImplCopyWithImpl<$Res>
    extends _$InventoryCheckEventCopyWithImpl<$Res, _$FindCountByCodeImpl>
    implements _$$FindCountByCodeImplCopyWith<$Res> {
  __$$FindCountByCodeImplCopyWithImpl(
      _$FindCountByCodeImpl _value, $Res Function(_$FindCountByCodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_$FindCountByCodeImpl(
      null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FindCountByCodeImpl implements _FindCountByCode {
  const _$FindCountByCodeImpl(this.code);

  @override
  final String code;

  @override
  String toString() {
    return 'InventoryCheckEvent.findCountByCode(code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FindCountByCodeImpl &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FindCountByCodeImplCopyWith<_$FindCountByCodeImpl> get copyWith =>
      __$$FindCountByCodeImplCopyWithImpl<_$FindCountByCodeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() fetchEmployees,
    required TResult Function(String keyword) search,
    required TResult Function(int? employeeId) selectEmployee,
    required TResult Function(int? warehouseId) changeWarehouseFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime date) generateCode,
    required TResult Function(InventoryCountSavePayload payload) save,
    required TResult Function(int id) getById,
    required TResult Function(int id) delete,
    required TResult Function(int countId) fetchSheet,
    required TResult Function(
            int countId, int warehouseId, int modulaLocationId, String? keyword)
        fetchLocationProgress,
    required TResult Function(InventoryLocationGroup group) selectLocationScope,
    required TResult Function(int? productLocationId) selectProductLocation,
    required TResult Function(int? modulaLocationId) selectModulaLocation,
    required TResult Function(int? detailId) selectModulaLocationDetail,
    required TResult Function() clearLocationFilter,
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
    required TResult Function(
            int countId, List<Map<String, dynamic>> changedItems)
        saveCountDetails,
    required TResult Function(String code) findCountByCode,
    required TResult Function() clearScanCountResult,
    required TResult Function(InventoryScanMode mode) startSheetScan,
    required TResult Function(String code) sheetScanned,
    required TResult Function() stopSheetScan,
    required TResult Function(int id, bool isComplete) confirmComplete,
  }) {
    return findCountByCode(code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? fetchEmployees,
    TResult? Function(String keyword)? search,
    TResult? Function(int? employeeId)? selectEmployee,
    TResult? Function(int? warehouseId)? changeWarehouseFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime date)? generateCode,
    TResult? Function(InventoryCountSavePayload payload)? save,
    TResult? Function(int id)? getById,
    TResult? Function(int id)? delete,
    TResult? Function(int countId)? fetchSheet,
    TResult? Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult? Function(InventoryLocationGroup group)? selectLocationScope,
    TResult? Function(int? productLocationId)? selectProductLocation,
    TResult? Function(int? modulaLocationId)? selectModulaLocation,
    TResult? Function(int? detailId)? selectModulaLocationDetail,
    TResult? Function()? clearLocationFilter,
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
    TResult? Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult? Function(String code)? findCountByCode,
    TResult? Function()? clearScanCountResult,
    TResult? Function(InventoryScanMode mode)? startSheetScan,
    TResult? Function(String code)? sheetScanned,
    TResult? Function()? stopSheetScan,
    TResult? Function(int id, bool isComplete)? confirmComplete,
  }) {
    return findCountByCode?.call(code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? fetchEmployees,
    TResult Function(String keyword)? search,
    TResult Function(int? employeeId)? selectEmployee,
    TResult Function(int? warehouseId)? changeWarehouseFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime date)? generateCode,
    TResult Function(InventoryCountSavePayload payload)? save,
    TResult Function(int id)? getById,
    TResult Function(int id)? delete,
    TResult Function(int countId)? fetchSheet,
    TResult Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult Function(InventoryLocationGroup group)? selectLocationScope,
    TResult Function(int? productLocationId)? selectProductLocation,
    TResult Function(int? modulaLocationId)? selectModulaLocation,
    TResult Function(int? detailId)? selectModulaLocationDetail,
    TResult Function()? clearLocationFilter,
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
    TResult Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult Function(String code)? findCountByCode,
    TResult Function()? clearScanCountResult,
    TResult Function(InventoryScanMode mode)? startSheetScan,
    TResult Function(String code)? sheetScanned,
    TResult Function()? stopSheetScan,
    TResult Function(int id, bool isComplete)? confirmComplete,
    required TResult orElse(),
  }) {
    if (findCountByCode != null) {
      return findCountByCode(code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchEmployees value) fetchEmployees,
    required TResult Function(_Search value) search,
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_ChangeWarehouseFilter value)
        changeWarehouseFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_GenerateCode value) generateCode,
    required TResult Function(_Save value) save,
    required TResult Function(_GetById value) getById,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FetchSheet value) fetchSheet,
    required TResult Function(_FetchLocationProgress value)
        fetchLocationProgress,
    required TResult Function(_SelectLocationScope value) selectLocationScope,
    required TResult Function(_SelectProductLocation value)
        selectProductLocation,
    required TResult Function(_SelectModulaLocation value) selectModulaLocation,
    required TResult Function(_SelectModulaLocationDetail value)
        selectModulaLocationDetail,
    required TResult Function(_ClearLocationFilter value) clearLocationFilter,
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
    required TResult Function(_SaveCountDetails value) saveCountDetails,
    required TResult Function(_FindCountByCode value) findCountByCode,
    required TResult Function(_ClearScanCountResult value) clearScanCountResult,
    required TResult Function(_StartSheetScan value) startSheetScan,
    required TResult Function(_SheetScanned value) sheetScanned,
    required TResult Function(_StopSheetScan value) stopSheetScan,
    required TResult Function(_ConfirmComplete value) confirmComplete,
  }) {
    return findCountByCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchEmployees value)? fetchEmployees,
    TResult? Function(_Search value)? search,
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_GenerateCode value)? generateCode,
    TResult? Function(_Save value)? save,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_FetchSheet value)? fetchSheet,
    TResult? Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult? Function(_SelectLocationScope value)? selectLocationScope,
    TResult? Function(_SelectProductLocation value)? selectProductLocation,
    TResult? Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult? Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult? Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult? Function(_SaveCountDetails value)? saveCountDetails,
    TResult? Function(_FindCountByCode value)? findCountByCode,
    TResult? Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult? Function(_StartSheetScan value)? startSheetScan,
    TResult? Function(_SheetScanned value)? sheetScanned,
    TResult? Function(_StopSheetScan value)? stopSheetScan,
    TResult? Function(_ConfirmComplete value)? confirmComplete,
  }) {
    return findCountByCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchEmployees value)? fetchEmployees,
    TResult Function(_Search value)? search,
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_GenerateCode value)? generateCode,
    TResult Function(_Save value)? save,
    TResult Function(_GetById value)? getById,
    TResult Function(_Delete value)? delete,
    TResult Function(_FetchSheet value)? fetchSheet,
    TResult Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult Function(_SelectLocationScope value)? selectLocationScope,
    TResult Function(_SelectProductLocation value)? selectProductLocation,
    TResult Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult Function(_SaveCountDetails value)? saveCountDetails,
    TResult Function(_FindCountByCode value)? findCountByCode,
    TResult Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult Function(_StartSheetScan value)? startSheetScan,
    TResult Function(_SheetScanned value)? sheetScanned,
    TResult Function(_StopSheetScan value)? stopSheetScan,
    TResult Function(_ConfirmComplete value)? confirmComplete,
    required TResult orElse(),
  }) {
    if (findCountByCode != null) {
      return findCountByCode(this);
    }
    return orElse();
  }
}

abstract class _FindCountByCode implements InventoryCheckEvent {
  const factory _FindCountByCode(final String code) = _$FindCountByCodeImpl;

  String get code;
  @JsonKey(ignore: true)
  _$$FindCountByCodeImplCopyWith<_$FindCountByCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearScanCountResultImplCopyWith<$Res> {
  factory _$$ClearScanCountResultImplCopyWith(_$ClearScanCountResultImpl value,
          $Res Function(_$ClearScanCountResultImpl) then) =
      __$$ClearScanCountResultImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearScanCountResultImplCopyWithImpl<$Res>
    extends _$InventoryCheckEventCopyWithImpl<$Res, _$ClearScanCountResultImpl>
    implements _$$ClearScanCountResultImplCopyWith<$Res> {
  __$$ClearScanCountResultImplCopyWithImpl(_$ClearScanCountResultImpl _value,
      $Res Function(_$ClearScanCountResultImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearScanCountResultImpl implements _ClearScanCountResult {
  const _$ClearScanCountResultImpl();

  @override
  String toString() {
    return 'InventoryCheckEvent.clearScanCountResult()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClearScanCountResultImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() fetchEmployees,
    required TResult Function(String keyword) search,
    required TResult Function(int? employeeId) selectEmployee,
    required TResult Function(int? warehouseId) changeWarehouseFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime date) generateCode,
    required TResult Function(InventoryCountSavePayload payload) save,
    required TResult Function(int id) getById,
    required TResult Function(int id) delete,
    required TResult Function(int countId) fetchSheet,
    required TResult Function(
            int countId, int warehouseId, int modulaLocationId, String? keyword)
        fetchLocationProgress,
    required TResult Function(InventoryLocationGroup group) selectLocationScope,
    required TResult Function(int? productLocationId) selectProductLocation,
    required TResult Function(int? modulaLocationId) selectModulaLocation,
    required TResult Function(int? detailId) selectModulaLocationDetail,
    required TResult Function() clearLocationFilter,
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
    required TResult Function(
            int countId, List<Map<String, dynamic>> changedItems)
        saveCountDetails,
    required TResult Function(String code) findCountByCode,
    required TResult Function() clearScanCountResult,
    required TResult Function(InventoryScanMode mode) startSheetScan,
    required TResult Function(String code) sheetScanned,
    required TResult Function() stopSheetScan,
    required TResult Function(int id, bool isComplete) confirmComplete,
  }) {
    return clearScanCountResult();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? fetchEmployees,
    TResult? Function(String keyword)? search,
    TResult? Function(int? employeeId)? selectEmployee,
    TResult? Function(int? warehouseId)? changeWarehouseFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime date)? generateCode,
    TResult? Function(InventoryCountSavePayload payload)? save,
    TResult? Function(int id)? getById,
    TResult? Function(int id)? delete,
    TResult? Function(int countId)? fetchSheet,
    TResult? Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult? Function(InventoryLocationGroup group)? selectLocationScope,
    TResult? Function(int? productLocationId)? selectProductLocation,
    TResult? Function(int? modulaLocationId)? selectModulaLocation,
    TResult? Function(int? detailId)? selectModulaLocationDetail,
    TResult? Function()? clearLocationFilter,
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
    TResult? Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult? Function(String code)? findCountByCode,
    TResult? Function()? clearScanCountResult,
    TResult? Function(InventoryScanMode mode)? startSheetScan,
    TResult? Function(String code)? sheetScanned,
    TResult? Function()? stopSheetScan,
    TResult? Function(int id, bool isComplete)? confirmComplete,
  }) {
    return clearScanCountResult?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? fetchEmployees,
    TResult Function(String keyword)? search,
    TResult Function(int? employeeId)? selectEmployee,
    TResult Function(int? warehouseId)? changeWarehouseFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime date)? generateCode,
    TResult Function(InventoryCountSavePayload payload)? save,
    TResult Function(int id)? getById,
    TResult Function(int id)? delete,
    TResult Function(int countId)? fetchSheet,
    TResult Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult Function(InventoryLocationGroup group)? selectLocationScope,
    TResult Function(int? productLocationId)? selectProductLocation,
    TResult Function(int? modulaLocationId)? selectModulaLocation,
    TResult Function(int? detailId)? selectModulaLocationDetail,
    TResult Function()? clearLocationFilter,
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
    TResult Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult Function(String code)? findCountByCode,
    TResult Function()? clearScanCountResult,
    TResult Function(InventoryScanMode mode)? startSheetScan,
    TResult Function(String code)? sheetScanned,
    TResult Function()? stopSheetScan,
    TResult Function(int id, bool isComplete)? confirmComplete,
    required TResult orElse(),
  }) {
    if (clearScanCountResult != null) {
      return clearScanCountResult();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchEmployees value) fetchEmployees,
    required TResult Function(_Search value) search,
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_ChangeWarehouseFilter value)
        changeWarehouseFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_GenerateCode value) generateCode,
    required TResult Function(_Save value) save,
    required TResult Function(_GetById value) getById,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FetchSheet value) fetchSheet,
    required TResult Function(_FetchLocationProgress value)
        fetchLocationProgress,
    required TResult Function(_SelectLocationScope value) selectLocationScope,
    required TResult Function(_SelectProductLocation value)
        selectProductLocation,
    required TResult Function(_SelectModulaLocation value) selectModulaLocation,
    required TResult Function(_SelectModulaLocationDetail value)
        selectModulaLocationDetail,
    required TResult Function(_ClearLocationFilter value) clearLocationFilter,
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
    required TResult Function(_SaveCountDetails value) saveCountDetails,
    required TResult Function(_FindCountByCode value) findCountByCode,
    required TResult Function(_ClearScanCountResult value) clearScanCountResult,
    required TResult Function(_StartSheetScan value) startSheetScan,
    required TResult Function(_SheetScanned value) sheetScanned,
    required TResult Function(_StopSheetScan value) stopSheetScan,
    required TResult Function(_ConfirmComplete value) confirmComplete,
  }) {
    return clearScanCountResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchEmployees value)? fetchEmployees,
    TResult? Function(_Search value)? search,
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_GenerateCode value)? generateCode,
    TResult? Function(_Save value)? save,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_FetchSheet value)? fetchSheet,
    TResult? Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult? Function(_SelectLocationScope value)? selectLocationScope,
    TResult? Function(_SelectProductLocation value)? selectProductLocation,
    TResult? Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult? Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult? Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult? Function(_SaveCountDetails value)? saveCountDetails,
    TResult? Function(_FindCountByCode value)? findCountByCode,
    TResult? Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult? Function(_StartSheetScan value)? startSheetScan,
    TResult? Function(_SheetScanned value)? sheetScanned,
    TResult? Function(_StopSheetScan value)? stopSheetScan,
    TResult? Function(_ConfirmComplete value)? confirmComplete,
  }) {
    return clearScanCountResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchEmployees value)? fetchEmployees,
    TResult Function(_Search value)? search,
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_GenerateCode value)? generateCode,
    TResult Function(_Save value)? save,
    TResult Function(_GetById value)? getById,
    TResult Function(_Delete value)? delete,
    TResult Function(_FetchSheet value)? fetchSheet,
    TResult Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult Function(_SelectLocationScope value)? selectLocationScope,
    TResult Function(_SelectProductLocation value)? selectProductLocation,
    TResult Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult Function(_SaveCountDetails value)? saveCountDetails,
    TResult Function(_FindCountByCode value)? findCountByCode,
    TResult Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult Function(_StartSheetScan value)? startSheetScan,
    TResult Function(_SheetScanned value)? sheetScanned,
    TResult Function(_StopSheetScan value)? stopSheetScan,
    TResult Function(_ConfirmComplete value)? confirmComplete,
    required TResult orElse(),
  }) {
    if (clearScanCountResult != null) {
      return clearScanCountResult(this);
    }
    return orElse();
  }
}

abstract class _ClearScanCountResult implements InventoryCheckEvent {
  const factory _ClearScanCountResult() = _$ClearScanCountResultImpl;
}

/// @nodoc
abstract class _$$StartSheetScanImplCopyWith<$Res> {
  factory _$$StartSheetScanImplCopyWith(_$StartSheetScanImpl value,
          $Res Function(_$StartSheetScanImpl) then) =
      __$$StartSheetScanImplCopyWithImpl<$Res>;
  @useResult
  $Res call({InventoryScanMode mode});
}

/// @nodoc
class __$$StartSheetScanImplCopyWithImpl<$Res>
    extends _$InventoryCheckEventCopyWithImpl<$Res, _$StartSheetScanImpl>
    implements _$$StartSheetScanImplCopyWith<$Res> {
  __$$StartSheetScanImplCopyWithImpl(
      _$StartSheetScanImpl _value, $Res Function(_$StartSheetScanImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
  }) {
    return _then(_$StartSheetScanImpl(
      null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as InventoryScanMode,
    ));
  }
}

/// @nodoc

class _$StartSheetScanImpl implements _StartSheetScan {
  const _$StartSheetScanImpl(this.mode);

  @override
  final InventoryScanMode mode;

  @override
  String toString() {
    return 'InventoryCheckEvent.startSheetScan(mode: $mode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartSheetScanImpl &&
            (identical(other.mode, mode) || other.mode == mode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartSheetScanImplCopyWith<_$StartSheetScanImpl> get copyWith =>
      __$$StartSheetScanImplCopyWithImpl<_$StartSheetScanImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() fetchEmployees,
    required TResult Function(String keyword) search,
    required TResult Function(int? employeeId) selectEmployee,
    required TResult Function(int? warehouseId) changeWarehouseFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime date) generateCode,
    required TResult Function(InventoryCountSavePayload payload) save,
    required TResult Function(int id) getById,
    required TResult Function(int id) delete,
    required TResult Function(int countId) fetchSheet,
    required TResult Function(
            int countId, int warehouseId, int modulaLocationId, String? keyword)
        fetchLocationProgress,
    required TResult Function(InventoryLocationGroup group) selectLocationScope,
    required TResult Function(int? productLocationId) selectProductLocation,
    required TResult Function(int? modulaLocationId) selectModulaLocation,
    required TResult Function(int? detailId) selectModulaLocationDetail,
    required TResult Function() clearLocationFilter,
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
    required TResult Function(
            int countId, List<Map<String, dynamic>> changedItems)
        saveCountDetails,
    required TResult Function(String code) findCountByCode,
    required TResult Function() clearScanCountResult,
    required TResult Function(InventoryScanMode mode) startSheetScan,
    required TResult Function(String code) sheetScanned,
    required TResult Function() stopSheetScan,
    required TResult Function(int id, bool isComplete) confirmComplete,
  }) {
    return startSheetScan(mode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? fetchEmployees,
    TResult? Function(String keyword)? search,
    TResult? Function(int? employeeId)? selectEmployee,
    TResult? Function(int? warehouseId)? changeWarehouseFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime date)? generateCode,
    TResult? Function(InventoryCountSavePayload payload)? save,
    TResult? Function(int id)? getById,
    TResult? Function(int id)? delete,
    TResult? Function(int countId)? fetchSheet,
    TResult? Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult? Function(InventoryLocationGroup group)? selectLocationScope,
    TResult? Function(int? productLocationId)? selectProductLocation,
    TResult? Function(int? modulaLocationId)? selectModulaLocation,
    TResult? Function(int? detailId)? selectModulaLocationDetail,
    TResult? Function()? clearLocationFilter,
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
    TResult? Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult? Function(String code)? findCountByCode,
    TResult? Function()? clearScanCountResult,
    TResult? Function(InventoryScanMode mode)? startSheetScan,
    TResult? Function(String code)? sheetScanned,
    TResult? Function()? stopSheetScan,
    TResult? Function(int id, bool isComplete)? confirmComplete,
  }) {
    return startSheetScan?.call(mode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? fetchEmployees,
    TResult Function(String keyword)? search,
    TResult Function(int? employeeId)? selectEmployee,
    TResult Function(int? warehouseId)? changeWarehouseFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime date)? generateCode,
    TResult Function(InventoryCountSavePayload payload)? save,
    TResult Function(int id)? getById,
    TResult Function(int id)? delete,
    TResult Function(int countId)? fetchSheet,
    TResult Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult Function(InventoryLocationGroup group)? selectLocationScope,
    TResult Function(int? productLocationId)? selectProductLocation,
    TResult Function(int? modulaLocationId)? selectModulaLocation,
    TResult Function(int? detailId)? selectModulaLocationDetail,
    TResult Function()? clearLocationFilter,
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
    TResult Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult Function(String code)? findCountByCode,
    TResult Function()? clearScanCountResult,
    TResult Function(InventoryScanMode mode)? startSheetScan,
    TResult Function(String code)? sheetScanned,
    TResult Function()? stopSheetScan,
    TResult Function(int id, bool isComplete)? confirmComplete,
    required TResult orElse(),
  }) {
    if (startSheetScan != null) {
      return startSheetScan(mode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchEmployees value) fetchEmployees,
    required TResult Function(_Search value) search,
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_ChangeWarehouseFilter value)
        changeWarehouseFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_GenerateCode value) generateCode,
    required TResult Function(_Save value) save,
    required TResult Function(_GetById value) getById,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FetchSheet value) fetchSheet,
    required TResult Function(_FetchLocationProgress value)
        fetchLocationProgress,
    required TResult Function(_SelectLocationScope value) selectLocationScope,
    required TResult Function(_SelectProductLocation value)
        selectProductLocation,
    required TResult Function(_SelectModulaLocation value) selectModulaLocation,
    required TResult Function(_SelectModulaLocationDetail value)
        selectModulaLocationDetail,
    required TResult Function(_ClearLocationFilter value) clearLocationFilter,
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
    required TResult Function(_SaveCountDetails value) saveCountDetails,
    required TResult Function(_FindCountByCode value) findCountByCode,
    required TResult Function(_ClearScanCountResult value) clearScanCountResult,
    required TResult Function(_StartSheetScan value) startSheetScan,
    required TResult Function(_SheetScanned value) sheetScanned,
    required TResult Function(_StopSheetScan value) stopSheetScan,
    required TResult Function(_ConfirmComplete value) confirmComplete,
  }) {
    return startSheetScan(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchEmployees value)? fetchEmployees,
    TResult? Function(_Search value)? search,
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_GenerateCode value)? generateCode,
    TResult? Function(_Save value)? save,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_FetchSheet value)? fetchSheet,
    TResult? Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult? Function(_SelectLocationScope value)? selectLocationScope,
    TResult? Function(_SelectProductLocation value)? selectProductLocation,
    TResult? Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult? Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult? Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult? Function(_SaveCountDetails value)? saveCountDetails,
    TResult? Function(_FindCountByCode value)? findCountByCode,
    TResult? Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult? Function(_StartSheetScan value)? startSheetScan,
    TResult? Function(_SheetScanned value)? sheetScanned,
    TResult? Function(_StopSheetScan value)? stopSheetScan,
    TResult? Function(_ConfirmComplete value)? confirmComplete,
  }) {
    return startSheetScan?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchEmployees value)? fetchEmployees,
    TResult Function(_Search value)? search,
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_GenerateCode value)? generateCode,
    TResult Function(_Save value)? save,
    TResult Function(_GetById value)? getById,
    TResult Function(_Delete value)? delete,
    TResult Function(_FetchSheet value)? fetchSheet,
    TResult Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult Function(_SelectLocationScope value)? selectLocationScope,
    TResult Function(_SelectProductLocation value)? selectProductLocation,
    TResult Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult Function(_SaveCountDetails value)? saveCountDetails,
    TResult Function(_FindCountByCode value)? findCountByCode,
    TResult Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult Function(_StartSheetScan value)? startSheetScan,
    TResult Function(_SheetScanned value)? sheetScanned,
    TResult Function(_StopSheetScan value)? stopSheetScan,
    TResult Function(_ConfirmComplete value)? confirmComplete,
    required TResult orElse(),
  }) {
    if (startSheetScan != null) {
      return startSheetScan(this);
    }
    return orElse();
  }
}

abstract class _StartSheetScan implements InventoryCheckEvent {
  const factory _StartSheetScan(final InventoryScanMode mode) =
      _$StartSheetScanImpl;

  InventoryScanMode get mode;
  @JsonKey(ignore: true)
  _$$StartSheetScanImplCopyWith<_$StartSheetScanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SheetScannedImplCopyWith<$Res> {
  factory _$$SheetScannedImplCopyWith(
          _$SheetScannedImpl value, $Res Function(_$SheetScannedImpl) then) =
      __$$SheetScannedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String code});
}

/// @nodoc
class __$$SheetScannedImplCopyWithImpl<$Res>
    extends _$InventoryCheckEventCopyWithImpl<$Res, _$SheetScannedImpl>
    implements _$$SheetScannedImplCopyWith<$Res> {
  __$$SheetScannedImplCopyWithImpl(
      _$SheetScannedImpl _value, $Res Function(_$SheetScannedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_$SheetScannedImpl(
      null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SheetScannedImpl implements _SheetScanned {
  const _$SheetScannedImpl(this.code);

  @override
  final String code;

  @override
  String toString() {
    return 'InventoryCheckEvent.sheetScanned(code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SheetScannedImpl &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SheetScannedImplCopyWith<_$SheetScannedImpl> get copyWith =>
      __$$SheetScannedImplCopyWithImpl<_$SheetScannedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() fetchEmployees,
    required TResult Function(String keyword) search,
    required TResult Function(int? employeeId) selectEmployee,
    required TResult Function(int? warehouseId) changeWarehouseFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime date) generateCode,
    required TResult Function(InventoryCountSavePayload payload) save,
    required TResult Function(int id) getById,
    required TResult Function(int id) delete,
    required TResult Function(int countId) fetchSheet,
    required TResult Function(
            int countId, int warehouseId, int modulaLocationId, String? keyword)
        fetchLocationProgress,
    required TResult Function(InventoryLocationGroup group) selectLocationScope,
    required TResult Function(int? productLocationId) selectProductLocation,
    required TResult Function(int? modulaLocationId) selectModulaLocation,
    required TResult Function(int? detailId) selectModulaLocationDetail,
    required TResult Function() clearLocationFilter,
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
    required TResult Function(
            int countId, List<Map<String, dynamic>> changedItems)
        saveCountDetails,
    required TResult Function(String code) findCountByCode,
    required TResult Function() clearScanCountResult,
    required TResult Function(InventoryScanMode mode) startSheetScan,
    required TResult Function(String code) sheetScanned,
    required TResult Function() stopSheetScan,
    required TResult Function(int id, bool isComplete) confirmComplete,
  }) {
    return sheetScanned(code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? fetchEmployees,
    TResult? Function(String keyword)? search,
    TResult? Function(int? employeeId)? selectEmployee,
    TResult? Function(int? warehouseId)? changeWarehouseFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime date)? generateCode,
    TResult? Function(InventoryCountSavePayload payload)? save,
    TResult? Function(int id)? getById,
    TResult? Function(int id)? delete,
    TResult? Function(int countId)? fetchSheet,
    TResult? Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult? Function(InventoryLocationGroup group)? selectLocationScope,
    TResult? Function(int? productLocationId)? selectProductLocation,
    TResult? Function(int? modulaLocationId)? selectModulaLocation,
    TResult? Function(int? detailId)? selectModulaLocationDetail,
    TResult? Function()? clearLocationFilter,
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
    TResult? Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult? Function(String code)? findCountByCode,
    TResult? Function()? clearScanCountResult,
    TResult? Function(InventoryScanMode mode)? startSheetScan,
    TResult? Function(String code)? sheetScanned,
    TResult? Function()? stopSheetScan,
    TResult? Function(int id, bool isComplete)? confirmComplete,
  }) {
    return sheetScanned?.call(code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? fetchEmployees,
    TResult Function(String keyword)? search,
    TResult Function(int? employeeId)? selectEmployee,
    TResult Function(int? warehouseId)? changeWarehouseFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime date)? generateCode,
    TResult Function(InventoryCountSavePayload payload)? save,
    TResult Function(int id)? getById,
    TResult Function(int id)? delete,
    TResult Function(int countId)? fetchSheet,
    TResult Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult Function(InventoryLocationGroup group)? selectLocationScope,
    TResult Function(int? productLocationId)? selectProductLocation,
    TResult Function(int? modulaLocationId)? selectModulaLocation,
    TResult Function(int? detailId)? selectModulaLocationDetail,
    TResult Function()? clearLocationFilter,
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
    TResult Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult Function(String code)? findCountByCode,
    TResult Function()? clearScanCountResult,
    TResult Function(InventoryScanMode mode)? startSheetScan,
    TResult Function(String code)? sheetScanned,
    TResult Function()? stopSheetScan,
    TResult Function(int id, bool isComplete)? confirmComplete,
    required TResult orElse(),
  }) {
    if (sheetScanned != null) {
      return sheetScanned(code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchEmployees value) fetchEmployees,
    required TResult Function(_Search value) search,
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_ChangeWarehouseFilter value)
        changeWarehouseFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_GenerateCode value) generateCode,
    required TResult Function(_Save value) save,
    required TResult Function(_GetById value) getById,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FetchSheet value) fetchSheet,
    required TResult Function(_FetchLocationProgress value)
        fetchLocationProgress,
    required TResult Function(_SelectLocationScope value) selectLocationScope,
    required TResult Function(_SelectProductLocation value)
        selectProductLocation,
    required TResult Function(_SelectModulaLocation value) selectModulaLocation,
    required TResult Function(_SelectModulaLocationDetail value)
        selectModulaLocationDetail,
    required TResult Function(_ClearLocationFilter value) clearLocationFilter,
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
    required TResult Function(_SaveCountDetails value) saveCountDetails,
    required TResult Function(_FindCountByCode value) findCountByCode,
    required TResult Function(_ClearScanCountResult value) clearScanCountResult,
    required TResult Function(_StartSheetScan value) startSheetScan,
    required TResult Function(_SheetScanned value) sheetScanned,
    required TResult Function(_StopSheetScan value) stopSheetScan,
    required TResult Function(_ConfirmComplete value) confirmComplete,
  }) {
    return sheetScanned(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchEmployees value)? fetchEmployees,
    TResult? Function(_Search value)? search,
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_GenerateCode value)? generateCode,
    TResult? Function(_Save value)? save,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_FetchSheet value)? fetchSheet,
    TResult? Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult? Function(_SelectLocationScope value)? selectLocationScope,
    TResult? Function(_SelectProductLocation value)? selectProductLocation,
    TResult? Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult? Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult? Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult? Function(_SaveCountDetails value)? saveCountDetails,
    TResult? Function(_FindCountByCode value)? findCountByCode,
    TResult? Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult? Function(_StartSheetScan value)? startSheetScan,
    TResult? Function(_SheetScanned value)? sheetScanned,
    TResult? Function(_StopSheetScan value)? stopSheetScan,
    TResult? Function(_ConfirmComplete value)? confirmComplete,
  }) {
    return sheetScanned?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchEmployees value)? fetchEmployees,
    TResult Function(_Search value)? search,
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_GenerateCode value)? generateCode,
    TResult Function(_Save value)? save,
    TResult Function(_GetById value)? getById,
    TResult Function(_Delete value)? delete,
    TResult Function(_FetchSheet value)? fetchSheet,
    TResult Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult Function(_SelectLocationScope value)? selectLocationScope,
    TResult Function(_SelectProductLocation value)? selectProductLocation,
    TResult Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult Function(_SaveCountDetails value)? saveCountDetails,
    TResult Function(_FindCountByCode value)? findCountByCode,
    TResult Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult Function(_StartSheetScan value)? startSheetScan,
    TResult Function(_SheetScanned value)? sheetScanned,
    TResult Function(_StopSheetScan value)? stopSheetScan,
    TResult Function(_ConfirmComplete value)? confirmComplete,
    required TResult orElse(),
  }) {
    if (sheetScanned != null) {
      return sheetScanned(this);
    }
    return orElse();
  }
}

abstract class _SheetScanned implements InventoryCheckEvent {
  const factory _SheetScanned(final String code) = _$SheetScannedImpl;

  String get code;
  @JsonKey(ignore: true)
  _$$SheetScannedImplCopyWith<_$SheetScannedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StopSheetScanImplCopyWith<$Res> {
  factory _$$StopSheetScanImplCopyWith(
          _$StopSheetScanImpl value, $Res Function(_$StopSheetScanImpl) then) =
      __$$StopSheetScanImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StopSheetScanImplCopyWithImpl<$Res>
    extends _$InventoryCheckEventCopyWithImpl<$Res, _$StopSheetScanImpl>
    implements _$$StopSheetScanImplCopyWith<$Res> {
  __$$StopSheetScanImplCopyWithImpl(
      _$StopSheetScanImpl _value, $Res Function(_$StopSheetScanImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StopSheetScanImpl implements _StopSheetScan {
  const _$StopSheetScanImpl();

  @override
  String toString() {
    return 'InventoryCheckEvent.stopSheetScan()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StopSheetScanImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() fetchEmployees,
    required TResult Function(String keyword) search,
    required TResult Function(int? employeeId) selectEmployee,
    required TResult Function(int? warehouseId) changeWarehouseFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime date) generateCode,
    required TResult Function(InventoryCountSavePayload payload) save,
    required TResult Function(int id) getById,
    required TResult Function(int id) delete,
    required TResult Function(int countId) fetchSheet,
    required TResult Function(
            int countId, int warehouseId, int modulaLocationId, String? keyword)
        fetchLocationProgress,
    required TResult Function(InventoryLocationGroup group) selectLocationScope,
    required TResult Function(int? productLocationId) selectProductLocation,
    required TResult Function(int? modulaLocationId) selectModulaLocation,
    required TResult Function(int? detailId) selectModulaLocationDetail,
    required TResult Function() clearLocationFilter,
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
    required TResult Function(
            int countId, List<Map<String, dynamic>> changedItems)
        saveCountDetails,
    required TResult Function(String code) findCountByCode,
    required TResult Function() clearScanCountResult,
    required TResult Function(InventoryScanMode mode) startSheetScan,
    required TResult Function(String code) sheetScanned,
    required TResult Function() stopSheetScan,
    required TResult Function(int id, bool isComplete) confirmComplete,
  }) {
    return stopSheetScan();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? fetchEmployees,
    TResult? Function(String keyword)? search,
    TResult? Function(int? employeeId)? selectEmployee,
    TResult? Function(int? warehouseId)? changeWarehouseFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime date)? generateCode,
    TResult? Function(InventoryCountSavePayload payload)? save,
    TResult? Function(int id)? getById,
    TResult? Function(int id)? delete,
    TResult? Function(int countId)? fetchSheet,
    TResult? Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult? Function(InventoryLocationGroup group)? selectLocationScope,
    TResult? Function(int? productLocationId)? selectProductLocation,
    TResult? Function(int? modulaLocationId)? selectModulaLocation,
    TResult? Function(int? detailId)? selectModulaLocationDetail,
    TResult? Function()? clearLocationFilter,
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
    TResult? Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult? Function(String code)? findCountByCode,
    TResult? Function()? clearScanCountResult,
    TResult? Function(InventoryScanMode mode)? startSheetScan,
    TResult? Function(String code)? sheetScanned,
    TResult? Function()? stopSheetScan,
    TResult? Function(int id, bool isComplete)? confirmComplete,
  }) {
    return stopSheetScan?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? fetchEmployees,
    TResult Function(String keyword)? search,
    TResult Function(int? employeeId)? selectEmployee,
    TResult Function(int? warehouseId)? changeWarehouseFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime date)? generateCode,
    TResult Function(InventoryCountSavePayload payload)? save,
    TResult Function(int id)? getById,
    TResult Function(int id)? delete,
    TResult Function(int countId)? fetchSheet,
    TResult Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult Function(InventoryLocationGroup group)? selectLocationScope,
    TResult Function(int? productLocationId)? selectProductLocation,
    TResult Function(int? modulaLocationId)? selectModulaLocation,
    TResult Function(int? detailId)? selectModulaLocationDetail,
    TResult Function()? clearLocationFilter,
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
    TResult Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult Function(String code)? findCountByCode,
    TResult Function()? clearScanCountResult,
    TResult Function(InventoryScanMode mode)? startSheetScan,
    TResult Function(String code)? sheetScanned,
    TResult Function()? stopSheetScan,
    TResult Function(int id, bool isComplete)? confirmComplete,
    required TResult orElse(),
  }) {
    if (stopSheetScan != null) {
      return stopSheetScan();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchEmployees value) fetchEmployees,
    required TResult Function(_Search value) search,
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_ChangeWarehouseFilter value)
        changeWarehouseFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_GenerateCode value) generateCode,
    required TResult Function(_Save value) save,
    required TResult Function(_GetById value) getById,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FetchSheet value) fetchSheet,
    required TResult Function(_FetchLocationProgress value)
        fetchLocationProgress,
    required TResult Function(_SelectLocationScope value) selectLocationScope,
    required TResult Function(_SelectProductLocation value)
        selectProductLocation,
    required TResult Function(_SelectModulaLocation value) selectModulaLocation,
    required TResult Function(_SelectModulaLocationDetail value)
        selectModulaLocationDetail,
    required TResult Function(_ClearLocationFilter value) clearLocationFilter,
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
    required TResult Function(_SaveCountDetails value) saveCountDetails,
    required TResult Function(_FindCountByCode value) findCountByCode,
    required TResult Function(_ClearScanCountResult value) clearScanCountResult,
    required TResult Function(_StartSheetScan value) startSheetScan,
    required TResult Function(_SheetScanned value) sheetScanned,
    required TResult Function(_StopSheetScan value) stopSheetScan,
    required TResult Function(_ConfirmComplete value) confirmComplete,
  }) {
    return stopSheetScan(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchEmployees value)? fetchEmployees,
    TResult? Function(_Search value)? search,
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_GenerateCode value)? generateCode,
    TResult? Function(_Save value)? save,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_FetchSheet value)? fetchSheet,
    TResult? Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult? Function(_SelectLocationScope value)? selectLocationScope,
    TResult? Function(_SelectProductLocation value)? selectProductLocation,
    TResult? Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult? Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult? Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult? Function(_SaveCountDetails value)? saveCountDetails,
    TResult? Function(_FindCountByCode value)? findCountByCode,
    TResult? Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult? Function(_StartSheetScan value)? startSheetScan,
    TResult? Function(_SheetScanned value)? sheetScanned,
    TResult? Function(_StopSheetScan value)? stopSheetScan,
    TResult? Function(_ConfirmComplete value)? confirmComplete,
  }) {
    return stopSheetScan?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchEmployees value)? fetchEmployees,
    TResult Function(_Search value)? search,
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_GenerateCode value)? generateCode,
    TResult Function(_Save value)? save,
    TResult Function(_GetById value)? getById,
    TResult Function(_Delete value)? delete,
    TResult Function(_FetchSheet value)? fetchSheet,
    TResult Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult Function(_SelectLocationScope value)? selectLocationScope,
    TResult Function(_SelectProductLocation value)? selectProductLocation,
    TResult Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult Function(_SaveCountDetails value)? saveCountDetails,
    TResult Function(_FindCountByCode value)? findCountByCode,
    TResult Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult Function(_StartSheetScan value)? startSheetScan,
    TResult Function(_SheetScanned value)? sheetScanned,
    TResult Function(_StopSheetScan value)? stopSheetScan,
    TResult Function(_ConfirmComplete value)? confirmComplete,
    required TResult orElse(),
  }) {
    if (stopSheetScan != null) {
      return stopSheetScan(this);
    }
    return orElse();
  }
}

abstract class _StopSheetScan implements InventoryCheckEvent {
  const factory _StopSheetScan() = _$StopSheetScanImpl;
}

/// @nodoc
abstract class _$$ConfirmCompleteImplCopyWith<$Res> {
  factory _$$ConfirmCompleteImplCopyWith(_$ConfirmCompleteImpl value,
          $Res Function(_$ConfirmCompleteImpl) then) =
      __$$ConfirmCompleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, bool isComplete});
}

/// @nodoc
class __$$ConfirmCompleteImplCopyWithImpl<$Res>
    extends _$InventoryCheckEventCopyWithImpl<$Res, _$ConfirmCompleteImpl>
    implements _$$ConfirmCompleteImplCopyWith<$Res> {
  __$$ConfirmCompleteImplCopyWithImpl(
      _$ConfirmCompleteImpl _value, $Res Function(_$ConfirmCompleteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isComplete = null,
  }) {
    return _then(_$ConfirmCompleteImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isComplete: null == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ConfirmCompleteImpl implements _ConfirmComplete {
  const _$ConfirmCompleteImpl({required this.id, required this.isComplete});

  @override
  final int id;
  @override
  final bool isComplete;

  @override
  String toString() {
    return 'InventoryCheckEvent.confirmComplete(id: $id, isComplete: $isComplete)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmCompleteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isComplete, isComplete) ||
                other.isComplete == isComplete));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, isComplete);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmCompleteImplCopyWith<_$ConfirmCompleteImpl> get copyWith =>
      __$$ConfirmCompleteImplCopyWithImpl<_$ConfirmCompleteImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() fetchEmployees,
    required TResult Function(String keyword) search,
    required TResult Function(int? employeeId) selectEmployee,
    required TResult Function(int? warehouseId) changeWarehouseFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(DateTime date) generateCode,
    required TResult Function(InventoryCountSavePayload payload) save,
    required TResult Function(int id) getById,
    required TResult Function(int id) delete,
    required TResult Function(int countId) fetchSheet,
    required TResult Function(
            int countId, int warehouseId, int modulaLocationId, String? keyword)
        fetchLocationProgress,
    required TResult Function(InventoryLocationGroup group) selectLocationScope,
    required TResult Function(int? productLocationId) selectProductLocation,
    required TResult Function(int? modulaLocationId) selectModulaLocation,
    required TResult Function(int? detailId) selectModulaLocationDetail,
    required TResult Function() clearLocationFilter,
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
    required TResult Function(
            int countId, List<Map<String, dynamic>> changedItems)
        saveCountDetails,
    required TResult Function(String code) findCountByCode,
    required TResult Function() clearScanCountResult,
    required TResult Function(InventoryScanMode mode) startSheetScan,
    required TResult Function(String code) sheetScanned,
    required TResult Function() stopSheetScan,
    required TResult Function(int id, bool isComplete) confirmComplete,
  }) {
    return confirmComplete(id, isComplete);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? fetchEmployees,
    TResult? Function(String keyword)? search,
    TResult? Function(int? employeeId)? selectEmployee,
    TResult? Function(int? warehouseId)? changeWarehouseFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(DateTime date)? generateCode,
    TResult? Function(InventoryCountSavePayload payload)? save,
    TResult? Function(int id)? getById,
    TResult? Function(int id)? delete,
    TResult? Function(int countId)? fetchSheet,
    TResult? Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult? Function(InventoryLocationGroup group)? selectLocationScope,
    TResult? Function(int? productLocationId)? selectProductLocation,
    TResult? Function(int? modulaLocationId)? selectModulaLocation,
    TResult? Function(int? detailId)? selectModulaLocationDetail,
    TResult? Function()? clearLocationFilter,
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
    TResult? Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult? Function(String code)? findCountByCode,
    TResult? Function()? clearScanCountResult,
    TResult? Function(InventoryScanMode mode)? startSheetScan,
    TResult? Function(String code)? sheetScanned,
    TResult? Function()? stopSheetScan,
    TResult? Function(int id, bool isComplete)? confirmComplete,
  }) {
    return confirmComplete?.call(id, isComplete);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? fetchEmployees,
    TResult Function(String keyword)? search,
    TResult Function(int? employeeId)? selectEmployee,
    TResult Function(int? warehouseId)? changeWarehouseFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(DateTime date)? generateCode,
    TResult Function(InventoryCountSavePayload payload)? save,
    TResult Function(int id)? getById,
    TResult Function(int id)? delete,
    TResult Function(int countId)? fetchSheet,
    TResult Function(int countId, int warehouseId, int modulaLocationId,
            String? keyword)?
        fetchLocationProgress,
    TResult Function(InventoryLocationGroup group)? selectLocationScope,
    TResult Function(int? productLocationId)? selectProductLocation,
    TResult Function(int? modulaLocationId)? selectModulaLocation,
    TResult Function(int? detailId)? selectModulaLocationDetail,
    TResult Function()? clearLocationFilter,
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
    TResult Function(int countId, List<Map<String, dynamic>> changedItems)?
        saveCountDetails,
    TResult Function(String code)? findCountByCode,
    TResult Function()? clearScanCountResult,
    TResult Function(InventoryScanMode mode)? startSheetScan,
    TResult Function(String code)? sheetScanned,
    TResult Function()? stopSheetScan,
    TResult Function(int id, bool isComplete)? confirmComplete,
    required TResult orElse(),
  }) {
    if (confirmComplete != null) {
      return confirmComplete(id, isComplete);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchEmployees value) fetchEmployees,
    required TResult Function(_Search value) search,
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_ChangeWarehouseFilter value)
        changeWarehouseFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_GenerateCode value) generateCode,
    required TResult Function(_Save value) save,
    required TResult Function(_GetById value) getById,
    required TResult Function(_Delete value) delete,
    required TResult Function(_FetchSheet value) fetchSheet,
    required TResult Function(_FetchLocationProgress value)
        fetchLocationProgress,
    required TResult Function(_SelectLocationScope value) selectLocationScope,
    required TResult Function(_SelectProductLocation value)
        selectProductLocation,
    required TResult Function(_SelectModulaLocation value) selectModulaLocation,
    required TResult Function(_SelectModulaLocationDetail value)
        selectModulaLocationDetail,
    required TResult Function(_ClearLocationFilter value) clearLocationFilter,
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
    required TResult Function(_SaveCountDetails value) saveCountDetails,
    required TResult Function(_FindCountByCode value) findCountByCode,
    required TResult Function(_ClearScanCountResult value) clearScanCountResult,
    required TResult Function(_StartSheetScan value) startSheetScan,
    required TResult Function(_SheetScanned value) sheetScanned,
    required TResult Function(_StopSheetScan value) stopSheetScan,
    required TResult Function(_ConfirmComplete value) confirmComplete,
  }) {
    return confirmComplete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchEmployees value)? fetchEmployees,
    TResult? Function(_Search value)? search,
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_GenerateCode value)? generateCode,
    TResult? Function(_Save value)? save,
    TResult? Function(_GetById value)? getById,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_FetchSheet value)? fetchSheet,
    TResult? Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult? Function(_SelectLocationScope value)? selectLocationScope,
    TResult? Function(_SelectProductLocation value)? selectProductLocation,
    TResult? Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult? Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult? Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult? Function(_SaveCountDetails value)? saveCountDetails,
    TResult? Function(_FindCountByCode value)? findCountByCode,
    TResult? Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult? Function(_StartSheetScan value)? startSheetScan,
    TResult? Function(_SheetScanned value)? sheetScanned,
    TResult? Function(_StopSheetScan value)? stopSheetScan,
    TResult? Function(_ConfirmComplete value)? confirmComplete,
  }) {
    return confirmComplete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchEmployees value)? fetchEmployees,
    TResult Function(_Search value)? search,
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_GenerateCode value)? generateCode,
    TResult Function(_Save value)? save,
    TResult Function(_GetById value)? getById,
    TResult Function(_Delete value)? delete,
    TResult Function(_FetchSheet value)? fetchSheet,
    TResult Function(_FetchLocationProgress value)? fetchLocationProgress,
    TResult Function(_SelectLocationScope value)? selectLocationScope,
    TResult Function(_SelectProductLocation value)? selectProductLocation,
    TResult Function(_SelectModulaLocation value)? selectModulaLocation,
    TResult Function(_SelectModulaLocationDetail value)?
        selectModulaLocationDetail,
    TResult Function(_ClearLocationFilter value)? clearLocationFilter,
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
    TResult Function(_SaveCountDetails value)? saveCountDetails,
    TResult Function(_FindCountByCode value)? findCountByCode,
    TResult Function(_ClearScanCountResult value)? clearScanCountResult,
    TResult Function(_StartSheetScan value)? startSheetScan,
    TResult Function(_SheetScanned value)? sheetScanned,
    TResult Function(_StopSheetScan value)? stopSheetScan,
    TResult Function(_ConfirmComplete value)? confirmComplete,
    required TResult orElse(),
  }) {
    if (confirmComplete != null) {
      return confirmComplete(this);
    }
    return orElse();
  }
}

abstract class _ConfirmComplete implements InventoryCheckEvent {
  const factory _ConfirmComplete(
      {required final int id,
      required final bool isComplete}) = _$ConfirmCompleteImpl;

  int get id;
  bool get isComplete;
  @JsonKey(ignore: true)
  _$$ConfirmCompleteImplCopyWith<_$ConfirmCompleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
