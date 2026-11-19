// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_return_approval_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ProductReturnApprovalEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() fetchEmployees,
    required TResult Function(String keyword) search,
    required TResult Function(int? employeeId) selectEmployee,
    required TResult Function(int? warehouseId) changeWarehouseFilter,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
    changeDateRange,
    required TResult Function(int id) toggleSelection,
    required TResult Function() selectAll,
    required TResult Function() clearSelection,
    required TResult Function() approveSelected,
    required TResult Function(int id) approveSingle,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? fetchEmployees,
    TResult? Function(String keyword)? search,
    TResult? Function(int? employeeId)? selectEmployee,
    TResult? Function(int? warehouseId)? changeWarehouseFilter,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(int id)? toggleSelection,
    TResult? Function()? selectAll,
    TResult? Function()? clearSelection,
    TResult? Function()? approveSelected,
    TResult? Function(int id)? approveSingle,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? fetchEmployees,
    TResult Function(String keyword)? search,
    TResult Function(int? employeeId)? selectEmployee,
    TResult Function(int? warehouseId)? changeWarehouseFilter,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(int id)? toggleSelection,
    TResult Function()? selectAll,
    TResult Function()? clearSelection,
    TResult Function()? approveSelected,
    TResult Function(int id)? approveSingle,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchEmployees value) fetchEmployees,
    required TResult Function(_Search value) search,
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_ChangeWarehouseFilter value)
    changeWarehouseFilter,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ToggleSelection value) toggleSelection,
    required TResult Function(_SelectAll value) selectAll,
    required TResult Function(_ClearSelection value) clearSelection,
    required TResult Function(_ApproveSelected value) approveSelected,
    required TResult Function(_ApproveSingle value) approveSingle,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchEmployees value)? fetchEmployees,
    TResult? Function(_Search value)? search,
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ToggleSelection value)? toggleSelection,
    TResult? Function(_SelectAll value)? selectAll,
    TResult? Function(_ClearSelection value)? clearSelection,
    TResult? Function(_ApproveSelected value)? approveSelected,
    TResult? Function(_ApproveSingle value)? approveSingle,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchEmployees value)? fetchEmployees,
    TResult Function(_Search value)? search,
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_ChangeWarehouseFilter value)? changeWarehouseFilter,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ToggleSelection value)? toggleSelection,
    TResult Function(_SelectAll value)? selectAll,
    TResult Function(_ClearSelection value)? clearSelection,
    TResult Function(_ApproveSelected value)? approveSelected,
    TResult Function(_ApproveSingle value)? approveSingle,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductReturnApprovalEventCopyWith<$Res> {
  factory $ProductReturnApprovalEventCopyWith(
    ProductReturnApprovalEvent value,
    $Res Function(ProductReturnApprovalEvent) then,
  ) =
      _$ProductReturnApprovalEventCopyWithImpl<
        $Res,
        ProductReturnApprovalEvent
      >;
}

/// @nodoc
class _$ProductReturnApprovalEventCopyWithImpl<
  $Res,
  $Val extends ProductReturnApprovalEvent
>
    implements $ProductReturnApprovalEventCopyWith<$Res> {
  _$ProductReturnApprovalEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
    _$FetchImpl value,
    $Res Function(_$FetchImpl) then,
  ) = __$$FetchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$ProductReturnApprovalEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
    _$FetchImpl _value,
    $Res Function(_$FetchImpl) _then,
  ) : super(_value, _then);
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl();

  @override
  String toString() {
    return 'ProductReturnApprovalEvent.fetch()';
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
    required TResult Function(int id) toggleSelection,
    required TResult Function() selectAll,
    required TResult Function() clearSelection,
    required TResult Function() approveSelected,
    required TResult Function(int id) approveSingle,
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
    TResult? Function(int id)? toggleSelection,
    TResult? Function()? selectAll,
    TResult? Function()? clearSelection,
    TResult? Function()? approveSelected,
    TResult? Function(int id)? approveSingle,
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
    TResult Function(int id)? toggleSelection,
    TResult Function()? selectAll,
    TResult Function()? clearSelection,
    TResult Function()? approveSelected,
    TResult Function(int id)? approveSingle,
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
    required TResult Function(_ToggleSelection value) toggleSelection,
    required TResult Function(_SelectAll value) selectAll,
    required TResult Function(_ClearSelection value) clearSelection,
    required TResult Function(_ApproveSelected value) approveSelected,
    required TResult Function(_ApproveSingle value) approveSingle,
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
    TResult? Function(_ToggleSelection value)? toggleSelection,
    TResult? Function(_SelectAll value)? selectAll,
    TResult? Function(_ClearSelection value)? clearSelection,
    TResult? Function(_ApproveSelected value)? approveSelected,
    TResult? Function(_ApproveSingle value)? approveSingle,
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
    TResult Function(_ToggleSelection value)? toggleSelection,
    TResult Function(_SelectAll value)? selectAll,
    TResult Function(_ClearSelection value)? clearSelection,
    TResult Function(_ApproveSelected value)? approveSelected,
    TResult Function(_ApproveSingle value)? approveSingle,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements ProductReturnApprovalEvent {
  const factory _Fetch() = _$FetchImpl;
}

/// @nodoc
abstract class _$$FetchEmployeesImplCopyWith<$Res> {
  factory _$$FetchEmployeesImplCopyWith(
    _$FetchEmployeesImpl value,
    $Res Function(_$FetchEmployeesImpl) then,
  ) = __$$FetchEmployeesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchEmployeesImplCopyWithImpl<$Res>
    extends _$ProductReturnApprovalEventCopyWithImpl<$Res, _$FetchEmployeesImpl>
    implements _$$FetchEmployeesImplCopyWith<$Res> {
  __$$FetchEmployeesImplCopyWithImpl(
    _$FetchEmployeesImpl _value,
    $Res Function(_$FetchEmployeesImpl) _then,
  ) : super(_value, _then);
}

/// @nodoc

class _$FetchEmployeesImpl implements _FetchEmployees {
  const _$FetchEmployeesImpl();

  @override
  String toString() {
    return 'ProductReturnApprovalEvent.fetchEmployees()';
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
    required TResult Function(int id) toggleSelection,
    required TResult Function() selectAll,
    required TResult Function() clearSelection,
    required TResult Function() approveSelected,
    required TResult Function(int id) approveSingle,
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
    TResult? Function(int id)? toggleSelection,
    TResult? Function()? selectAll,
    TResult? Function()? clearSelection,
    TResult? Function()? approveSelected,
    TResult? Function(int id)? approveSingle,
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
    TResult Function(int id)? toggleSelection,
    TResult Function()? selectAll,
    TResult Function()? clearSelection,
    TResult Function()? approveSelected,
    TResult Function(int id)? approveSingle,
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
    required TResult Function(_ToggleSelection value) toggleSelection,
    required TResult Function(_SelectAll value) selectAll,
    required TResult Function(_ClearSelection value) clearSelection,
    required TResult Function(_ApproveSelected value) approveSelected,
    required TResult Function(_ApproveSingle value) approveSingle,
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
    TResult? Function(_ToggleSelection value)? toggleSelection,
    TResult? Function(_SelectAll value)? selectAll,
    TResult? Function(_ClearSelection value)? clearSelection,
    TResult? Function(_ApproveSelected value)? approveSelected,
    TResult? Function(_ApproveSingle value)? approveSingle,
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
    TResult Function(_ToggleSelection value)? toggleSelection,
    TResult Function(_SelectAll value)? selectAll,
    TResult Function(_ClearSelection value)? clearSelection,
    TResult Function(_ApproveSelected value)? approveSelected,
    TResult Function(_ApproveSingle value)? approveSingle,
    required TResult orElse(),
  }) {
    if (fetchEmployees != null) {
      return fetchEmployees(this);
    }
    return orElse();
  }
}

abstract class _FetchEmployees implements ProductReturnApprovalEvent {
  const factory _FetchEmployees() = _$FetchEmployeesImpl;
}

/// @nodoc
abstract class _$$SearchImplCopyWith<$Res> {
  factory _$$SearchImplCopyWith(
    _$SearchImpl value,
    $Res Function(_$SearchImpl) then,
  ) = __$$SearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String keyword});
}

/// @nodoc
class __$$SearchImplCopyWithImpl<$Res>
    extends _$ProductReturnApprovalEventCopyWithImpl<$Res, _$SearchImpl>
    implements _$$SearchImplCopyWith<$Res> {
  __$$SearchImplCopyWithImpl(
    _$SearchImpl _value,
    $Res Function(_$SearchImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? keyword = null}) {
    return _then(
      _$SearchImpl(
        null == keyword
            ? _value.keyword
            : keyword // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SearchImpl implements _Search {
  const _$SearchImpl(this.keyword);

  @override
  final String keyword;

  @override
  String toString() {
    return 'ProductReturnApprovalEvent.search(keyword: $keyword)';
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
    required TResult Function(int id) toggleSelection,
    required TResult Function() selectAll,
    required TResult Function() clearSelection,
    required TResult Function() approveSelected,
    required TResult Function(int id) approveSingle,
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
    TResult? Function(int id)? toggleSelection,
    TResult? Function()? selectAll,
    TResult? Function()? clearSelection,
    TResult? Function()? approveSelected,
    TResult? Function(int id)? approveSingle,
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
    TResult Function(int id)? toggleSelection,
    TResult Function()? selectAll,
    TResult Function()? clearSelection,
    TResult Function()? approveSelected,
    TResult Function(int id)? approveSingle,
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
    required TResult Function(_ToggleSelection value) toggleSelection,
    required TResult Function(_SelectAll value) selectAll,
    required TResult Function(_ClearSelection value) clearSelection,
    required TResult Function(_ApproveSelected value) approveSelected,
    required TResult Function(_ApproveSingle value) approveSingle,
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
    TResult? Function(_ToggleSelection value)? toggleSelection,
    TResult? Function(_SelectAll value)? selectAll,
    TResult? Function(_ClearSelection value)? clearSelection,
    TResult? Function(_ApproveSelected value)? approveSelected,
    TResult? Function(_ApproveSingle value)? approveSingle,
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
    TResult Function(_ToggleSelection value)? toggleSelection,
    TResult Function(_SelectAll value)? selectAll,
    TResult Function(_ClearSelection value)? clearSelection,
    TResult Function(_ApproveSelected value)? approveSelected,
    TResult Function(_ApproveSingle value)? approveSingle,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class _Search implements ProductReturnApprovalEvent {
  const factory _Search(final String keyword) = _$SearchImpl;

  String get keyword;
  @JsonKey(ignore: true)
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectEmployeeImplCopyWith<$Res> {
  factory _$$SelectEmployeeImplCopyWith(
    _$SelectEmployeeImpl value,
    $Res Function(_$SelectEmployeeImpl) then,
  ) = __$$SelectEmployeeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? employeeId});
}

/// @nodoc
class __$$SelectEmployeeImplCopyWithImpl<$Res>
    extends _$ProductReturnApprovalEventCopyWithImpl<$Res, _$SelectEmployeeImpl>
    implements _$$SelectEmployeeImplCopyWith<$Res> {
  __$$SelectEmployeeImplCopyWithImpl(
    _$SelectEmployeeImpl _value,
    $Res Function(_$SelectEmployeeImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? employeeId = freezed}) {
    return _then(
      _$SelectEmployeeImpl(
        freezed == employeeId
            ? _value.employeeId
            : employeeId // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc

class _$SelectEmployeeImpl implements _SelectEmployee {
  const _$SelectEmployeeImpl(this.employeeId);

  @override
  final int? employeeId;

  @override
  String toString() {
    return 'ProductReturnApprovalEvent.selectEmployee(employeeId: $employeeId)';
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
        this,
        _$identity,
      );

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
    required TResult Function(int id) toggleSelection,
    required TResult Function() selectAll,
    required TResult Function() clearSelection,
    required TResult Function() approveSelected,
    required TResult Function(int id) approveSingle,
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
    TResult? Function(int id)? toggleSelection,
    TResult? Function()? selectAll,
    TResult? Function()? clearSelection,
    TResult? Function()? approveSelected,
    TResult? Function(int id)? approveSingle,
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
    TResult Function(int id)? toggleSelection,
    TResult Function()? selectAll,
    TResult Function()? clearSelection,
    TResult Function()? approveSelected,
    TResult Function(int id)? approveSingle,
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
    required TResult Function(_ToggleSelection value) toggleSelection,
    required TResult Function(_SelectAll value) selectAll,
    required TResult Function(_ClearSelection value) clearSelection,
    required TResult Function(_ApproveSelected value) approveSelected,
    required TResult Function(_ApproveSingle value) approveSingle,
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
    TResult? Function(_ToggleSelection value)? toggleSelection,
    TResult? Function(_SelectAll value)? selectAll,
    TResult? Function(_ClearSelection value)? clearSelection,
    TResult? Function(_ApproveSelected value)? approveSelected,
    TResult? Function(_ApproveSingle value)? approveSingle,
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
    TResult Function(_ToggleSelection value)? toggleSelection,
    TResult Function(_SelectAll value)? selectAll,
    TResult Function(_ClearSelection value)? clearSelection,
    TResult Function(_ApproveSelected value)? approveSelected,
    TResult Function(_ApproveSingle value)? approveSingle,
    required TResult orElse(),
  }) {
    if (selectEmployee != null) {
      return selectEmployee(this);
    }
    return orElse();
  }
}

abstract class _SelectEmployee implements ProductReturnApprovalEvent {
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
    $Res Function(_$ChangeWarehouseFilterImpl) then,
  ) = __$$ChangeWarehouseFilterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? warehouseId});
}

/// @nodoc
class __$$ChangeWarehouseFilterImplCopyWithImpl<$Res>
    extends
        _$ProductReturnApprovalEventCopyWithImpl<
          $Res,
          _$ChangeWarehouseFilterImpl
        >
    implements _$$ChangeWarehouseFilterImplCopyWith<$Res> {
  __$$ChangeWarehouseFilterImplCopyWithImpl(
    _$ChangeWarehouseFilterImpl _value,
    $Res Function(_$ChangeWarehouseFilterImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? warehouseId = freezed}) {
    return _then(
      _$ChangeWarehouseFilterImpl(
        freezed == warehouseId
            ? _value.warehouseId
            : warehouseId // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc

class _$ChangeWarehouseFilterImpl implements _ChangeWarehouseFilter {
  const _$ChangeWarehouseFilterImpl(this.warehouseId);

  @override
  final int? warehouseId;

  @override
  String toString() {
    return 'ProductReturnApprovalEvent.changeWarehouseFilter(warehouseId: $warehouseId)';
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
  get copyWith =>
      __$$ChangeWarehouseFilterImplCopyWithImpl<_$ChangeWarehouseFilterImpl>(
        this,
        _$identity,
      );

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
    required TResult Function(int id) toggleSelection,
    required TResult Function() selectAll,
    required TResult Function() clearSelection,
    required TResult Function() approveSelected,
    required TResult Function(int id) approveSingle,
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
    TResult? Function(int id)? toggleSelection,
    TResult? Function()? selectAll,
    TResult? Function()? clearSelection,
    TResult? Function()? approveSelected,
    TResult? Function(int id)? approveSingle,
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
    TResult Function(int id)? toggleSelection,
    TResult Function()? selectAll,
    TResult Function()? clearSelection,
    TResult Function()? approveSelected,
    TResult Function(int id)? approveSingle,
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
    required TResult Function(_ToggleSelection value) toggleSelection,
    required TResult Function(_SelectAll value) selectAll,
    required TResult Function(_ClearSelection value) clearSelection,
    required TResult Function(_ApproveSelected value) approveSelected,
    required TResult Function(_ApproveSingle value) approveSingle,
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
    TResult? Function(_ToggleSelection value)? toggleSelection,
    TResult? Function(_SelectAll value)? selectAll,
    TResult? Function(_ClearSelection value)? clearSelection,
    TResult? Function(_ApproveSelected value)? approveSelected,
    TResult? Function(_ApproveSingle value)? approveSingle,
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
    TResult Function(_ToggleSelection value)? toggleSelection,
    TResult Function(_SelectAll value)? selectAll,
    TResult Function(_ClearSelection value)? clearSelection,
    TResult Function(_ApproveSelected value)? approveSelected,
    TResult Function(_ApproveSingle value)? approveSingle,
    required TResult orElse(),
  }) {
    if (changeWarehouseFilter != null) {
      return changeWarehouseFilter(this);
    }
    return orElse();
  }
}

abstract class _ChangeWarehouseFilter implements ProductReturnApprovalEvent {
  const factory _ChangeWarehouseFilter(final int? warehouseId) =
      _$ChangeWarehouseFilterImpl;

  int? get warehouseId;
  @JsonKey(ignore: true)
  _$$ChangeWarehouseFilterImplCopyWith<_$ChangeWarehouseFilterImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeDateRangeImplCopyWith<$Res> {
  factory _$$ChangeDateRangeImplCopyWith(
    _$ChangeDateRangeImpl value,
    $Res Function(_$ChangeDateRangeImpl) then,
  ) = __$$ChangeDateRangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime dateStart, DateTime dateEnd});
}

/// @nodoc
class __$$ChangeDateRangeImplCopyWithImpl<$Res>
    extends
        _$ProductReturnApprovalEventCopyWithImpl<$Res, _$ChangeDateRangeImpl>
    implements _$$ChangeDateRangeImplCopyWith<$Res> {
  __$$ChangeDateRangeImplCopyWithImpl(
    _$ChangeDateRangeImpl _value,
    $Res Function(_$ChangeDateRangeImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? dateStart = null, Object? dateEnd = null}) {
    return _then(
      _$ChangeDateRangeImpl(
        dateStart: null == dateStart
            ? _value.dateStart
            : dateStart // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        dateEnd: null == dateEnd
            ? _value.dateEnd
            : dateEnd // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
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
    return 'ProductReturnApprovalEvent.changeDateRange(dateStart: $dateStart, dateEnd: $dateEnd)';
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
        this,
        _$identity,
      );

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
    required TResult Function(int id) toggleSelection,
    required TResult Function() selectAll,
    required TResult Function() clearSelection,
    required TResult Function() approveSelected,
    required TResult Function(int id) approveSingle,
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
    TResult? Function(int id)? toggleSelection,
    TResult? Function()? selectAll,
    TResult? Function()? clearSelection,
    TResult? Function()? approveSelected,
    TResult? Function(int id)? approveSingle,
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
    TResult Function(int id)? toggleSelection,
    TResult Function()? selectAll,
    TResult Function()? clearSelection,
    TResult Function()? approveSelected,
    TResult Function(int id)? approveSingle,
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
    required TResult Function(_ToggleSelection value) toggleSelection,
    required TResult Function(_SelectAll value) selectAll,
    required TResult Function(_ClearSelection value) clearSelection,
    required TResult Function(_ApproveSelected value) approveSelected,
    required TResult Function(_ApproveSingle value) approveSingle,
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
    TResult? Function(_ToggleSelection value)? toggleSelection,
    TResult? Function(_SelectAll value)? selectAll,
    TResult? Function(_ClearSelection value)? clearSelection,
    TResult? Function(_ApproveSelected value)? approveSelected,
    TResult? Function(_ApproveSingle value)? approveSingle,
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
    TResult Function(_ToggleSelection value)? toggleSelection,
    TResult Function(_SelectAll value)? selectAll,
    TResult Function(_ClearSelection value)? clearSelection,
    TResult Function(_ApproveSelected value)? approveSelected,
    TResult Function(_ApproveSingle value)? approveSingle,
    required TResult orElse(),
  }) {
    if (changeDateRange != null) {
      return changeDateRange(this);
    }
    return orElse();
  }
}

abstract class _ChangeDateRange implements ProductReturnApprovalEvent {
  const factory _ChangeDateRange({
    required final DateTime dateStart,
    required final DateTime dateEnd,
  }) = _$ChangeDateRangeImpl;

  DateTime get dateStart;
  DateTime get dateEnd;
  @JsonKey(ignore: true)
  _$$ChangeDateRangeImplCopyWith<_$ChangeDateRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleSelectionImplCopyWith<$Res> {
  factory _$$ToggleSelectionImplCopyWith(
    _$ToggleSelectionImpl value,
    $Res Function(_$ToggleSelectionImpl) then,
  ) = __$$ToggleSelectionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$ToggleSelectionImplCopyWithImpl<$Res>
    extends
        _$ProductReturnApprovalEventCopyWithImpl<$Res, _$ToggleSelectionImpl>
    implements _$$ToggleSelectionImplCopyWith<$Res> {
  __$$ToggleSelectionImplCopyWithImpl(
    _$ToggleSelectionImpl _value,
    $Res Function(_$ToggleSelectionImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _$ToggleSelectionImpl(
        null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$ToggleSelectionImpl implements _ToggleSelection {
  const _$ToggleSelectionImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'ProductReturnApprovalEvent.toggleSelection(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleSelectionImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleSelectionImplCopyWith<_$ToggleSelectionImpl> get copyWith =>
      __$$ToggleSelectionImplCopyWithImpl<_$ToggleSelectionImpl>(
        this,
        _$identity,
      );

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
    required TResult Function(int id) toggleSelection,
    required TResult Function() selectAll,
    required TResult Function() clearSelection,
    required TResult Function() approveSelected,
    required TResult Function(int id) approveSingle,
  }) {
    return toggleSelection(id);
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
    TResult? Function(int id)? toggleSelection,
    TResult? Function()? selectAll,
    TResult? Function()? clearSelection,
    TResult? Function()? approveSelected,
    TResult? Function(int id)? approveSingle,
  }) {
    return toggleSelection?.call(id);
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
    TResult Function(int id)? toggleSelection,
    TResult Function()? selectAll,
    TResult Function()? clearSelection,
    TResult Function()? approveSelected,
    TResult Function(int id)? approveSingle,
    required TResult orElse(),
  }) {
    if (toggleSelection != null) {
      return toggleSelection(id);
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
    required TResult Function(_ToggleSelection value) toggleSelection,
    required TResult Function(_SelectAll value) selectAll,
    required TResult Function(_ClearSelection value) clearSelection,
    required TResult Function(_ApproveSelected value) approveSelected,
    required TResult Function(_ApproveSingle value) approveSingle,
  }) {
    return toggleSelection(this);
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
    TResult? Function(_ToggleSelection value)? toggleSelection,
    TResult? Function(_SelectAll value)? selectAll,
    TResult? Function(_ClearSelection value)? clearSelection,
    TResult? Function(_ApproveSelected value)? approveSelected,
    TResult? Function(_ApproveSingle value)? approveSingle,
  }) {
    return toggleSelection?.call(this);
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
    TResult Function(_ToggleSelection value)? toggleSelection,
    TResult Function(_SelectAll value)? selectAll,
    TResult Function(_ClearSelection value)? clearSelection,
    TResult Function(_ApproveSelected value)? approveSelected,
    TResult Function(_ApproveSingle value)? approveSingle,
    required TResult orElse(),
  }) {
    if (toggleSelection != null) {
      return toggleSelection(this);
    }
    return orElse();
  }
}

abstract class _ToggleSelection implements ProductReturnApprovalEvent {
  const factory _ToggleSelection(final int id) = _$ToggleSelectionImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$ToggleSelectionImplCopyWith<_$ToggleSelectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectAllImplCopyWith<$Res> {
  factory _$$SelectAllImplCopyWith(
    _$SelectAllImpl value,
    $Res Function(_$SelectAllImpl) then,
  ) = __$$SelectAllImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SelectAllImplCopyWithImpl<$Res>
    extends _$ProductReturnApprovalEventCopyWithImpl<$Res, _$SelectAllImpl>
    implements _$$SelectAllImplCopyWith<$Res> {
  __$$SelectAllImplCopyWithImpl(
    _$SelectAllImpl _value,
    $Res Function(_$SelectAllImpl) _then,
  ) : super(_value, _then);
}

/// @nodoc

class _$SelectAllImpl implements _SelectAll {
  const _$SelectAllImpl();

  @override
  String toString() {
    return 'ProductReturnApprovalEvent.selectAll()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SelectAllImpl);
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
    required TResult Function(int id) toggleSelection,
    required TResult Function() selectAll,
    required TResult Function() clearSelection,
    required TResult Function() approveSelected,
    required TResult Function(int id) approveSingle,
  }) {
    return selectAll();
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
    TResult? Function(int id)? toggleSelection,
    TResult? Function()? selectAll,
    TResult? Function()? clearSelection,
    TResult? Function()? approveSelected,
    TResult? Function(int id)? approveSingle,
  }) {
    return selectAll?.call();
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
    TResult Function(int id)? toggleSelection,
    TResult Function()? selectAll,
    TResult Function()? clearSelection,
    TResult Function()? approveSelected,
    TResult Function(int id)? approveSingle,
    required TResult orElse(),
  }) {
    if (selectAll != null) {
      return selectAll();
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
    required TResult Function(_ToggleSelection value) toggleSelection,
    required TResult Function(_SelectAll value) selectAll,
    required TResult Function(_ClearSelection value) clearSelection,
    required TResult Function(_ApproveSelected value) approveSelected,
    required TResult Function(_ApproveSingle value) approveSingle,
  }) {
    return selectAll(this);
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
    TResult? Function(_ToggleSelection value)? toggleSelection,
    TResult? Function(_SelectAll value)? selectAll,
    TResult? Function(_ClearSelection value)? clearSelection,
    TResult? Function(_ApproveSelected value)? approveSelected,
    TResult? Function(_ApproveSingle value)? approveSingle,
  }) {
    return selectAll?.call(this);
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
    TResult Function(_ToggleSelection value)? toggleSelection,
    TResult Function(_SelectAll value)? selectAll,
    TResult Function(_ClearSelection value)? clearSelection,
    TResult Function(_ApproveSelected value)? approveSelected,
    TResult Function(_ApproveSingle value)? approveSingle,
    required TResult orElse(),
  }) {
    if (selectAll != null) {
      return selectAll(this);
    }
    return orElse();
  }
}

abstract class _SelectAll implements ProductReturnApprovalEvent {
  const factory _SelectAll() = _$SelectAllImpl;
}

/// @nodoc
abstract class _$$ClearSelectionImplCopyWith<$Res> {
  factory _$$ClearSelectionImplCopyWith(
    _$ClearSelectionImpl value,
    $Res Function(_$ClearSelectionImpl) then,
  ) = __$$ClearSelectionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSelectionImplCopyWithImpl<$Res>
    extends _$ProductReturnApprovalEventCopyWithImpl<$Res, _$ClearSelectionImpl>
    implements _$$ClearSelectionImplCopyWith<$Res> {
  __$$ClearSelectionImplCopyWithImpl(
    _$ClearSelectionImpl _value,
    $Res Function(_$ClearSelectionImpl) _then,
  ) : super(_value, _then);
}

/// @nodoc

class _$ClearSelectionImpl implements _ClearSelection {
  const _$ClearSelectionImpl();

  @override
  String toString() {
    return 'ProductReturnApprovalEvent.clearSelection()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearSelectionImpl);
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
    required TResult Function(int id) toggleSelection,
    required TResult Function() selectAll,
    required TResult Function() clearSelection,
    required TResult Function() approveSelected,
    required TResult Function(int id) approveSingle,
  }) {
    return clearSelection();
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
    TResult? Function(int id)? toggleSelection,
    TResult? Function()? selectAll,
    TResult? Function()? clearSelection,
    TResult? Function()? approveSelected,
    TResult? Function(int id)? approveSingle,
  }) {
    return clearSelection?.call();
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
    TResult Function(int id)? toggleSelection,
    TResult Function()? selectAll,
    TResult Function()? clearSelection,
    TResult Function()? approveSelected,
    TResult Function(int id)? approveSingle,
    required TResult orElse(),
  }) {
    if (clearSelection != null) {
      return clearSelection();
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
    required TResult Function(_ToggleSelection value) toggleSelection,
    required TResult Function(_SelectAll value) selectAll,
    required TResult Function(_ClearSelection value) clearSelection,
    required TResult Function(_ApproveSelected value) approveSelected,
    required TResult Function(_ApproveSingle value) approveSingle,
  }) {
    return clearSelection(this);
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
    TResult? Function(_ToggleSelection value)? toggleSelection,
    TResult? Function(_SelectAll value)? selectAll,
    TResult? Function(_ClearSelection value)? clearSelection,
    TResult? Function(_ApproveSelected value)? approveSelected,
    TResult? Function(_ApproveSingle value)? approveSingle,
  }) {
    return clearSelection?.call(this);
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
    TResult Function(_ToggleSelection value)? toggleSelection,
    TResult Function(_SelectAll value)? selectAll,
    TResult Function(_ClearSelection value)? clearSelection,
    TResult Function(_ApproveSelected value)? approveSelected,
    TResult Function(_ApproveSingle value)? approveSingle,
    required TResult orElse(),
  }) {
    if (clearSelection != null) {
      return clearSelection(this);
    }
    return orElse();
  }
}

abstract class _ClearSelection implements ProductReturnApprovalEvent {
  const factory _ClearSelection() = _$ClearSelectionImpl;
}

/// @nodoc
abstract class _$$ApproveSelectedImplCopyWith<$Res> {
  factory _$$ApproveSelectedImplCopyWith(
    _$ApproveSelectedImpl value,
    $Res Function(_$ApproveSelectedImpl) then,
  ) = __$$ApproveSelectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ApproveSelectedImplCopyWithImpl<$Res>
    extends
        _$ProductReturnApprovalEventCopyWithImpl<$Res, _$ApproveSelectedImpl>
    implements _$$ApproveSelectedImplCopyWith<$Res> {
  __$$ApproveSelectedImplCopyWithImpl(
    _$ApproveSelectedImpl _value,
    $Res Function(_$ApproveSelectedImpl) _then,
  ) : super(_value, _then);
}

/// @nodoc

class _$ApproveSelectedImpl implements _ApproveSelected {
  const _$ApproveSelectedImpl();

  @override
  String toString() {
    return 'ProductReturnApprovalEvent.approveSelected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ApproveSelectedImpl);
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
    required TResult Function(int id) toggleSelection,
    required TResult Function() selectAll,
    required TResult Function() clearSelection,
    required TResult Function() approveSelected,
    required TResult Function(int id) approveSingle,
  }) {
    return approveSelected();
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
    TResult? Function(int id)? toggleSelection,
    TResult? Function()? selectAll,
    TResult? Function()? clearSelection,
    TResult? Function()? approveSelected,
    TResult? Function(int id)? approveSingle,
  }) {
    return approveSelected?.call();
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
    TResult Function(int id)? toggleSelection,
    TResult Function()? selectAll,
    TResult Function()? clearSelection,
    TResult Function()? approveSelected,
    TResult Function(int id)? approveSingle,
    required TResult orElse(),
  }) {
    if (approveSelected != null) {
      return approveSelected();
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
    required TResult Function(_ToggleSelection value) toggleSelection,
    required TResult Function(_SelectAll value) selectAll,
    required TResult Function(_ClearSelection value) clearSelection,
    required TResult Function(_ApproveSelected value) approveSelected,
    required TResult Function(_ApproveSingle value) approveSingle,
  }) {
    return approveSelected(this);
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
    TResult? Function(_ToggleSelection value)? toggleSelection,
    TResult? Function(_SelectAll value)? selectAll,
    TResult? Function(_ClearSelection value)? clearSelection,
    TResult? Function(_ApproveSelected value)? approveSelected,
    TResult? Function(_ApproveSingle value)? approveSingle,
  }) {
    return approveSelected?.call(this);
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
    TResult Function(_ToggleSelection value)? toggleSelection,
    TResult Function(_SelectAll value)? selectAll,
    TResult Function(_ClearSelection value)? clearSelection,
    TResult Function(_ApproveSelected value)? approveSelected,
    TResult Function(_ApproveSingle value)? approveSingle,
    required TResult orElse(),
  }) {
    if (approveSelected != null) {
      return approveSelected(this);
    }
    return orElse();
  }
}

abstract class _ApproveSelected implements ProductReturnApprovalEvent {
  const factory _ApproveSelected() = _$ApproveSelectedImpl;
}

/// @nodoc
abstract class _$$ApproveSingleImplCopyWith<$Res> {
  factory _$$ApproveSingleImplCopyWith(
    _$ApproveSingleImpl value,
    $Res Function(_$ApproveSingleImpl) then,
  ) = __$$ApproveSingleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$ApproveSingleImplCopyWithImpl<$Res>
    extends _$ProductReturnApprovalEventCopyWithImpl<$Res, _$ApproveSingleImpl>
    implements _$$ApproveSingleImplCopyWith<$Res> {
  __$$ApproveSingleImplCopyWithImpl(
    _$ApproveSingleImpl _value,
    $Res Function(_$ApproveSingleImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _$ApproveSingleImpl(
        null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$ApproveSingleImpl implements _ApproveSingle {
  const _$ApproveSingleImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'ProductReturnApprovalEvent.approveSingle(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveSingleImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveSingleImplCopyWith<_$ApproveSingleImpl> get copyWith =>
      __$$ApproveSingleImplCopyWithImpl<_$ApproveSingleImpl>(this, _$identity);

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
    required TResult Function(int id) toggleSelection,
    required TResult Function() selectAll,
    required TResult Function() clearSelection,
    required TResult Function() approveSelected,
    required TResult Function(int id) approveSingle,
  }) {
    return approveSingle(id);
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
    TResult? Function(int id)? toggleSelection,
    TResult? Function()? selectAll,
    TResult? Function()? clearSelection,
    TResult? Function()? approveSelected,
    TResult? Function(int id)? approveSingle,
  }) {
    return approveSingle?.call(id);
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
    TResult Function(int id)? toggleSelection,
    TResult Function()? selectAll,
    TResult Function()? clearSelection,
    TResult Function()? approveSelected,
    TResult Function(int id)? approveSingle,
    required TResult orElse(),
  }) {
    if (approveSingle != null) {
      return approveSingle(id);
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
    required TResult Function(_ToggleSelection value) toggleSelection,
    required TResult Function(_SelectAll value) selectAll,
    required TResult Function(_ClearSelection value) clearSelection,
    required TResult Function(_ApproveSelected value) approveSelected,
    required TResult Function(_ApproveSingle value) approveSingle,
  }) {
    return approveSingle(this);
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
    TResult? Function(_ToggleSelection value)? toggleSelection,
    TResult? Function(_SelectAll value)? selectAll,
    TResult? Function(_ClearSelection value)? clearSelection,
    TResult? Function(_ApproveSelected value)? approveSelected,
    TResult? Function(_ApproveSingle value)? approveSingle,
  }) {
    return approveSingle?.call(this);
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
    TResult Function(_ToggleSelection value)? toggleSelection,
    TResult Function(_SelectAll value)? selectAll,
    TResult Function(_ClearSelection value)? clearSelection,
    TResult Function(_ApproveSelected value)? approveSelected,
    TResult Function(_ApproveSingle value)? approveSingle,
    required TResult orElse(),
  }) {
    if (approveSingle != null) {
      return approveSingle(this);
    }
    return orElse();
  }
}

abstract class _ApproveSingle implements ProductReturnApprovalEvent {
  const factory _ApproveSingle(final int id) = _$ApproveSingleImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$ApproveSingleImplCopyWith<_$ApproveSingleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
