// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'salary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SalaryItem _$SalaryItemFromJson(Map<String, dynamic> json) {
  return _SalaryItem.fromJson(json);
}

/// @nodoc
mixin _$SalaryItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeName')
  String? get employeeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeCode')
  String? get employeeCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'BasicSalary')
  double? get basicSalary => throw _privateConstructorUsedError;
  @JsonKey(name: 'Allowance')
  double? get allowance => throw _privateConstructorUsedError;
  @JsonKey(name: 'Deduction')
  double? get deduction => throw _privateConstructorUsedError;
  @JsonKey(name: 'GrossSalary')
  double? get grossSalary => throw _privateConstructorUsedError;
  @JsonKey(name: 'Tax')
  double? get tax => throw _privateConstructorUsedError;
  @JsonKey(name: 'Insurance')
  double? get insurance => throw _privateConstructorUsedError;
  @JsonKey(name: 'NetSalary')
  double? get netSalary => throw _privateConstructorUsedError;
  @JsonKey(name: 'Month')
  int? get month => throw _privateConstructorUsedError;
  @JsonKey(name: 'Year')
  int? get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalaryItemCopyWith<SalaryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalaryItemCopyWith<$Res> {
  factory $SalaryItemCopyWith(
          SalaryItem value, $Res Function(SalaryItem) then) =
      _$SalaryItemCopyWithImpl<$Res, SalaryItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'EmployeeName') String? employeeName,
      @JsonKey(name: 'EmployeeCode') String? employeeCode,
      @JsonKey(name: 'BasicSalary') double? basicSalary,
      @JsonKey(name: 'Allowance') double? allowance,
      @JsonKey(name: 'Deduction') double? deduction,
      @JsonKey(name: 'GrossSalary') double? grossSalary,
      @JsonKey(name: 'Tax') double? tax,
      @JsonKey(name: 'Insurance') double? insurance,
      @JsonKey(name: 'NetSalary') double? netSalary,
      @JsonKey(name: 'Month') int? month,
      @JsonKey(name: 'Year') int? year,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate});
}

/// @nodoc
class _$SalaryItemCopyWithImpl<$Res, $Val extends SalaryItem>
    implements $SalaryItemCopyWith<$Res> {
  _$SalaryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? employeeId = freezed,
    Object? employeeName = freezed,
    Object? employeeCode = freezed,
    Object? basicSalary = freezed,
    Object? allowance = freezed,
    Object? deduction = freezed,
    Object? grossSalary = freezed,
    Object? tax = freezed,
    Object? insurance = freezed,
    Object? netSalary = freezed,
    Object? month = freezed,
    Object? year = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeCode: freezed == employeeCode
          ? _value.employeeCode
          : employeeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      basicSalary: freezed == basicSalary
          ? _value.basicSalary
          : basicSalary // ignore: cast_nullable_to_non_nullable
              as double?,
      allowance: freezed == allowance
          ? _value.allowance
          : allowance // ignore: cast_nullable_to_non_nullable
              as double?,
      deduction: freezed == deduction
          ? _value.deduction
          : deduction // ignore: cast_nullable_to_non_nullable
              as double?,
      grossSalary: freezed == grossSalary
          ? _value.grossSalary
          : grossSalary // ignore: cast_nullable_to_non_nullable
              as double?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      insurance: freezed == insurance
          ? _value.insurance
          : insurance // ignore: cast_nullable_to_non_nullable
              as double?,
      netSalary: freezed == netSalary
          ? _value.netSalary
          : netSalary // ignore: cast_nullable_to_non_nullable
              as double?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalaryItemImplCopyWith<$Res>
    implements $SalaryItemCopyWith<$Res> {
  factory _$$SalaryItemImplCopyWith(
          _$SalaryItemImpl value, $Res Function(_$SalaryItemImpl) then) =
      __$$SalaryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'EmployeeName') String? employeeName,
      @JsonKey(name: 'EmployeeCode') String? employeeCode,
      @JsonKey(name: 'BasicSalary') double? basicSalary,
      @JsonKey(name: 'Allowance') double? allowance,
      @JsonKey(name: 'Deduction') double? deduction,
      @JsonKey(name: 'GrossSalary') double? grossSalary,
      @JsonKey(name: 'Tax') double? tax,
      @JsonKey(name: 'Insurance') double? insurance,
      @JsonKey(name: 'NetSalary') double? netSalary,
      @JsonKey(name: 'Month') int? month,
      @JsonKey(name: 'Year') int? year,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate});
}

/// @nodoc
class __$$SalaryItemImplCopyWithImpl<$Res>
    extends _$SalaryItemCopyWithImpl<$Res, _$SalaryItemImpl>
    implements _$$SalaryItemImplCopyWith<$Res> {
  __$$SalaryItemImplCopyWithImpl(
      _$SalaryItemImpl _value, $Res Function(_$SalaryItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? employeeId = freezed,
    Object? employeeName = freezed,
    Object? employeeCode = freezed,
    Object? basicSalary = freezed,
    Object? allowance = freezed,
    Object? deduction = freezed,
    Object? grossSalary = freezed,
    Object? tax = freezed,
    Object? insurance = freezed,
    Object? netSalary = freezed,
    Object? month = freezed,
    Object? year = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_$SalaryItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeCode: freezed == employeeCode
          ? _value.employeeCode
          : employeeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      basicSalary: freezed == basicSalary
          ? _value.basicSalary
          : basicSalary // ignore: cast_nullable_to_non_nullable
              as double?,
      allowance: freezed == allowance
          ? _value.allowance
          : allowance // ignore: cast_nullable_to_non_nullable
              as double?,
      deduction: freezed == deduction
          ? _value.deduction
          : deduction // ignore: cast_nullable_to_non_nullable
              as double?,
      grossSalary: freezed == grossSalary
          ? _value.grossSalary
          : grossSalary // ignore: cast_nullable_to_non_nullable
              as double?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      insurance: freezed == insurance
          ? _value.insurance
          : insurance // ignore: cast_nullable_to_non_nullable
              as double?,
      netSalary: freezed == netSalary
          ? _value.netSalary
          : netSalary // ignore: cast_nullable_to_non_nullable
              as double?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalaryItemImpl implements _SalaryItem {
  const _$SalaryItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'EmployeeName') this.employeeName,
      @JsonKey(name: 'EmployeeCode') this.employeeCode,
      @JsonKey(name: 'BasicSalary') this.basicSalary,
      @JsonKey(name: 'Allowance') this.allowance,
      @JsonKey(name: 'Deduction') this.deduction,
      @JsonKey(name: 'GrossSalary') this.grossSalary,
      @JsonKey(name: 'Tax') this.tax,
      @JsonKey(name: 'Insurance') this.insurance,
      @JsonKey(name: 'NetSalary') this.netSalary,
      @JsonKey(name: 'Month') this.month,
      @JsonKey(name: 'Year') this.year,
      @JsonKey(name: 'CreatedDate') this.createdDate});

  factory _$SalaryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalaryItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;
  @override
  @JsonKey(name: 'EmployeeName')
  final String? employeeName;
  @override
  @JsonKey(name: 'EmployeeCode')
  final String? employeeCode;
  @override
  @JsonKey(name: 'BasicSalary')
  final double? basicSalary;
  @override
  @JsonKey(name: 'Allowance')
  final double? allowance;
  @override
  @JsonKey(name: 'Deduction')
  final double? deduction;
  @override
  @JsonKey(name: 'GrossSalary')
  final double? grossSalary;
  @override
  @JsonKey(name: 'Tax')
  final double? tax;
  @override
  @JsonKey(name: 'Insurance')
  final double? insurance;
  @override
  @JsonKey(name: 'NetSalary')
  final double? netSalary;
  @override
  @JsonKey(name: 'Month')
  final int? month;
  @override
  @JsonKey(name: 'Year')
  final int? year;
  @override
  @JsonKey(name: 'CreatedDate')
  final DateTime? createdDate;

  @override
  String toString() {
    return 'SalaryItem(id: $id, employeeId: $employeeId, employeeName: $employeeName, employeeCode: $employeeCode, basicSalary: $basicSalary, allowance: $allowance, deduction: $deduction, grossSalary: $grossSalary, tax: $tax, insurance: $insurance, netSalary: $netSalary, month: $month, year: $year, createdDate: $createdDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalaryItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.employeeCode, employeeCode) ||
                other.employeeCode == employeeCode) &&
            (identical(other.basicSalary, basicSalary) ||
                other.basicSalary == basicSalary) &&
            (identical(other.allowance, allowance) ||
                other.allowance == allowance) &&
            (identical(other.deduction, deduction) ||
                other.deduction == deduction) &&
            (identical(other.grossSalary, grossSalary) ||
                other.grossSalary == grossSalary) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.insurance, insurance) ||
                other.insurance == insurance) &&
            (identical(other.netSalary, netSalary) ||
                other.netSalary == netSalary) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      employeeId,
      employeeName,
      employeeCode,
      basicSalary,
      allowance,
      deduction,
      grossSalary,
      tax,
      insurance,
      netSalary,
      month,
      year,
      createdDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalaryItemImplCopyWith<_$SalaryItemImpl> get copyWith =>
      __$$SalaryItemImplCopyWithImpl<_$SalaryItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalaryItemImplToJson(
      this,
    );
  }
}

abstract class _SalaryItem implements SalaryItem {
  const factory _SalaryItem(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'EmployeeID') final int? employeeId,
          @JsonKey(name: 'EmployeeName') final String? employeeName,
          @JsonKey(name: 'EmployeeCode') final String? employeeCode,
          @JsonKey(name: 'BasicSalary') final double? basicSalary,
          @JsonKey(name: 'Allowance') final double? allowance,
          @JsonKey(name: 'Deduction') final double? deduction,
          @JsonKey(name: 'GrossSalary') final double? grossSalary,
          @JsonKey(name: 'Tax') final double? tax,
          @JsonKey(name: 'Insurance') final double? insurance,
          @JsonKey(name: 'NetSalary') final double? netSalary,
          @JsonKey(name: 'Month') final int? month,
          @JsonKey(name: 'Year') final int? year,
          @JsonKey(name: 'CreatedDate') final DateTime? createdDate}) =
      _$SalaryItemImpl;

  factory _SalaryItem.fromJson(Map<String, dynamic> json) =
      _$SalaryItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(name: 'EmployeeName')
  String? get employeeName;
  @override
  @JsonKey(name: 'EmployeeCode')
  String? get employeeCode;
  @override
  @JsonKey(name: 'BasicSalary')
  double? get basicSalary;
  @override
  @JsonKey(name: 'Allowance')
  double? get allowance;
  @override
  @JsonKey(name: 'Deduction')
  double? get deduction;
  @override
  @JsonKey(name: 'GrossSalary')
  double? get grossSalary;
  @override
  @JsonKey(name: 'Tax')
  double? get tax;
  @override
  @JsonKey(name: 'Insurance')
  double? get insurance;
  @override
  @JsonKey(name: 'NetSalary')
  double? get netSalary;
  @override
  @JsonKey(name: 'Month')
  int? get month;
  @override
  @JsonKey(name: 'Year')
  int? get year;
  @override
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate;
  @override
  @JsonKey(ignore: true)
  _$$SalaryItemImplCopyWith<_$SalaryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
