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
