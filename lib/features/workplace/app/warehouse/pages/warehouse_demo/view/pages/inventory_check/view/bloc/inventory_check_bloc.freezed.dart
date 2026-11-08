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
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
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
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
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
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
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
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
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
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
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
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
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
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
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
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
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
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
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
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
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
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
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
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
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
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
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
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
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
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
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
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
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
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
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
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
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
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
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
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
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
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
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
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
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
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
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
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
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
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
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
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
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
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
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
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
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
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
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
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
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
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
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
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
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
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
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
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
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
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
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
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
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
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
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
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
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
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
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
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
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
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
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
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
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
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
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
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
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
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
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
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
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
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
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
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
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
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
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
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
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
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
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
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
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
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
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
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
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
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
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
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
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
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
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
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
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
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
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
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
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
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
    required TResult Function(String keyword) searchSheet,
    required TResult Function(InventoryCheckSheetFilter? filter) filterSheet,
    required TResult Function(int warehouseId, int warehouseType)
        fetchProductGroupsRtc,
    required TResult Function(int? groupId) filterSheetProductGroup,
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
    TResult? Function(String keyword)? searchSheet,
    TResult? Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult? Function(int warehouseId, int warehouseType)?
        fetchProductGroupsRtc,
    TResult? Function(int? groupId)? filterSheetProductGroup,
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
    TResult Function(String keyword)? searchSheet,
    TResult Function(InventoryCheckSheetFilter? filter)? filterSheet,
    TResult Function(int warehouseId, int warehouseType)? fetchProductGroupsRtc,
    TResult Function(int? groupId)? filterSheetProductGroup,
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
    required TResult Function(_SearchSheet value) searchSheet,
    required TResult Function(_FilterSheet value) filterSheet,
    required TResult Function(_FetchProductGroupsRtc value)
        fetchProductGroupsRtc,
    required TResult Function(_FilterSheetProductGroup value)
        filterSheetProductGroup,
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
    TResult? Function(_SearchSheet value)? searchSheet,
    TResult? Function(_FilterSheet value)? filterSheet,
    TResult? Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult? Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
    TResult Function(_SearchSheet value)? searchSheet,
    TResult Function(_FilterSheet value)? filterSheet,
    TResult Function(_FetchProductGroupsRtc value)? fetchProductGroupsRtc,
    TResult Function(_FilterSheetProductGroup value)? filterSheetProductGroup,
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
