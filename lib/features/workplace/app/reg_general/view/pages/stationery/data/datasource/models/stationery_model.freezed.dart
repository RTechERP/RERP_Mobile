// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stationery_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StationeryItem _$StationeryItemFromJson(Map<String, dynamic> json) {
  return _StationeryItem.fromJson(json);
}

/// @nodoc
mixin _$StationeryItem {
  @JsonKey(name: 'EmployeeIDRequest')
  int? get employeeIdRequest => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserName')
  String? get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateRequest')
  DateTime? get dateRequest => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApproved')
  bool? get isApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedID')
  int? get approvedId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateApproved')
  DateTime? get dateApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullNameApproved')
  String? get fullNameApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentName')
  String? get departmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentID')
  int? get departmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsAdminApproved')
  bool? get isAdminApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateAdminApproved')
  DateTime? get dateAdminApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'AdminApprovedID')
  int? get adminApprovedId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StationeryItemCopyWith<StationeryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationeryItemCopyWith<$Res> {
  factory $StationeryItemCopyWith(
          StationeryItem value, $Res Function(StationeryItem) then) =
      _$StationeryItemCopyWithImpl<$Res, StationeryItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'EmployeeIDRequest') int? employeeIdRequest,
      @JsonKey(name: 'UserName') String? userName,
      @JsonKey(name: 'DateRequest') DateTime? dateRequest,
      @JsonKey(name: 'IsApproved') bool? isApproved,
      @JsonKey(name: 'ApprovedID') int? approvedId,
      @JsonKey(name: 'DateApproved') DateTime? dateApproved,
      @JsonKey(name: 'FullNameApproved') String? fullNameApproved,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'DepartmentID') int? departmentId,
      @JsonKey(name: 'IsAdminApproved') bool? isAdminApproved,
      @JsonKey(name: 'DateAdminApproved') DateTime? dateAdminApproved,
      @JsonKey(name: 'AdminApprovedID') int? adminApprovedId});
}

/// @nodoc
class _$StationeryItemCopyWithImpl<$Res, $Val extends StationeryItem>
    implements $StationeryItemCopyWith<$Res> {
  _$StationeryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeIdRequest = freezed,
    Object? userName = freezed,
    Object? dateRequest = freezed,
    Object? isApproved = freezed,
    Object? approvedId = freezed,
    Object? dateApproved = freezed,
    Object? fullNameApproved = freezed,
    Object? departmentName = freezed,
    Object? departmentId = freezed,
    Object? isAdminApproved = freezed,
    Object? dateAdminApproved = freezed,
    Object? adminApprovedId = freezed,
  }) {
    return _then(_value.copyWith(
      employeeIdRequest: freezed == employeeIdRequest
          ? _value.employeeIdRequest
          : employeeIdRequest // ignore: cast_nullable_to_non_nullable
              as int?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      dateRequest: freezed == dateRequest
          ? _value.dateRequest
          : dateRequest // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      approvedId: freezed == approvedId
          ? _value.approvedId
          : approvedId // ignore: cast_nullable_to_non_nullable
              as int?,
      dateApproved: freezed == dateApproved
          ? _value.dateApproved
          : dateApproved // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fullNameApproved: freezed == fullNameApproved
          ? _value.fullNameApproved
          : fullNameApproved // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      isAdminApproved: freezed == isAdminApproved
          ? _value.isAdminApproved
          : isAdminApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateAdminApproved: freezed == dateAdminApproved
          ? _value.dateAdminApproved
          : dateAdminApproved // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      adminApprovedId: freezed == adminApprovedId
          ? _value.adminApprovedId
          : adminApprovedId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StationeryItemImplCopyWith<$Res>
    implements $StationeryItemCopyWith<$Res> {
  factory _$$StationeryItemImplCopyWith(_$StationeryItemImpl value,
          $Res Function(_$StationeryItemImpl) then) =
      __$$StationeryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'EmployeeIDRequest') int? employeeIdRequest,
      @JsonKey(name: 'UserName') String? userName,
      @JsonKey(name: 'DateRequest') DateTime? dateRequest,
      @JsonKey(name: 'IsApproved') bool? isApproved,
      @JsonKey(name: 'ApprovedID') int? approvedId,
      @JsonKey(name: 'DateApproved') DateTime? dateApproved,
      @JsonKey(name: 'FullNameApproved') String? fullNameApproved,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'DepartmentID') int? departmentId,
      @JsonKey(name: 'IsAdminApproved') bool? isAdminApproved,
      @JsonKey(name: 'DateAdminApproved') DateTime? dateAdminApproved,
      @JsonKey(name: 'AdminApprovedID') int? adminApprovedId});
}

/// @nodoc
class __$$StationeryItemImplCopyWithImpl<$Res>
    extends _$StationeryItemCopyWithImpl<$Res, _$StationeryItemImpl>
    implements _$$StationeryItemImplCopyWith<$Res> {
  __$$StationeryItemImplCopyWithImpl(
      _$StationeryItemImpl _value, $Res Function(_$StationeryItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeIdRequest = freezed,
    Object? userName = freezed,
    Object? dateRequest = freezed,
    Object? isApproved = freezed,
    Object? approvedId = freezed,
    Object? dateApproved = freezed,
    Object? fullNameApproved = freezed,
    Object? departmentName = freezed,
    Object? departmentId = freezed,
    Object? isAdminApproved = freezed,
    Object? dateAdminApproved = freezed,
    Object? adminApprovedId = freezed,
  }) {
    return _then(_$StationeryItemImpl(
      employeeIdRequest: freezed == employeeIdRequest
          ? _value.employeeIdRequest
          : employeeIdRequest // ignore: cast_nullable_to_non_nullable
              as int?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      dateRequest: freezed == dateRequest
          ? _value.dateRequest
          : dateRequest // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      approvedId: freezed == approvedId
          ? _value.approvedId
          : approvedId // ignore: cast_nullable_to_non_nullable
              as int?,
      dateApproved: freezed == dateApproved
          ? _value.dateApproved
          : dateApproved // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fullNameApproved: freezed == fullNameApproved
          ? _value.fullNameApproved
          : fullNameApproved // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      isAdminApproved: freezed == isAdminApproved
          ? _value.isAdminApproved
          : isAdminApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateAdminApproved: freezed == dateAdminApproved
          ? _value.dateAdminApproved
          : dateAdminApproved // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      adminApprovedId: freezed == adminApprovedId
          ? _value.adminApprovedId
          : adminApprovedId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StationeryItemImpl implements _StationeryItem {
  const _$StationeryItemImpl(
      {@JsonKey(name: 'EmployeeIDRequest') this.employeeIdRequest,
      @JsonKey(name: 'UserName') this.userName,
      @JsonKey(name: 'DateRequest') this.dateRequest,
      @JsonKey(name: 'IsApproved') this.isApproved,
      @JsonKey(name: 'ApprovedID') this.approvedId,
      @JsonKey(name: 'DateApproved') this.dateApproved,
      @JsonKey(name: 'FullNameApproved') this.fullNameApproved,
      @JsonKey(name: 'DepartmentName') this.departmentName,
      @JsonKey(name: 'DepartmentID') this.departmentId,
      @JsonKey(name: 'IsAdminApproved') this.isAdminApproved,
      @JsonKey(name: 'DateAdminApproved') this.dateAdminApproved,
      @JsonKey(name: 'AdminApprovedID') this.adminApprovedId});

  factory _$StationeryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$StationeryItemImplFromJson(json);

  @override
  @JsonKey(name: 'EmployeeIDRequest')
  final int? employeeIdRequest;
  @override
  @JsonKey(name: 'UserName')
  final String? userName;
  @override
  @JsonKey(name: 'DateRequest')
  final DateTime? dateRequest;
  @override
  @JsonKey(name: 'IsApproved')
  final bool? isApproved;
  @override
  @JsonKey(name: 'ApprovedID')
  final int? approvedId;
  @override
  @JsonKey(name: 'DateApproved')
  final DateTime? dateApproved;
  @override
  @JsonKey(name: 'FullNameApproved')
  final String? fullNameApproved;
  @override
  @JsonKey(name: 'DepartmentName')
  final String? departmentName;
  @override
  @JsonKey(name: 'DepartmentID')
  final int? departmentId;
  @override
  @JsonKey(name: 'IsAdminApproved')
  final bool? isAdminApproved;
  @override
  @JsonKey(name: 'DateAdminApproved')
  final DateTime? dateAdminApproved;
  @override
  @JsonKey(name: 'AdminApprovedID')
  final int? adminApprovedId;

  @override
  String toString() {
    return 'StationeryItem(employeeIdRequest: $employeeIdRequest, userName: $userName, dateRequest: $dateRequest, isApproved: $isApproved, approvedId: $approvedId, dateApproved: $dateApproved, fullNameApproved: $fullNameApproved, departmentName: $departmentName, departmentId: $departmentId, isAdminApproved: $isAdminApproved, dateAdminApproved: $dateAdminApproved, adminApprovedId: $adminApprovedId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StationeryItemImpl &&
            (identical(other.employeeIdRequest, employeeIdRequest) ||
                other.employeeIdRequest == employeeIdRequest) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.dateRequest, dateRequest) ||
                other.dateRequest == dateRequest) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved) &&
            (identical(other.approvedId, approvedId) ||
                other.approvedId == approvedId) &&
            (identical(other.dateApproved, dateApproved) ||
                other.dateApproved == dateApproved) &&
            (identical(other.fullNameApproved, fullNameApproved) ||
                other.fullNameApproved == fullNameApproved) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.isAdminApproved, isAdminApproved) ||
                other.isAdminApproved == isAdminApproved) &&
            (identical(other.dateAdminApproved, dateAdminApproved) ||
                other.dateAdminApproved == dateAdminApproved) &&
            (identical(other.adminApprovedId, adminApprovedId) ||
                other.adminApprovedId == adminApprovedId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      employeeIdRequest,
      userName,
      dateRequest,
      isApproved,
      approvedId,
      dateApproved,
      fullNameApproved,
      departmentName,
      departmentId,
      isAdminApproved,
      dateAdminApproved,
      adminApprovedId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StationeryItemImplCopyWith<_$StationeryItemImpl> get copyWith =>
      __$$StationeryItemImplCopyWithImpl<_$StationeryItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StationeryItemImplToJson(
      this,
    );
  }
}

abstract class _StationeryItem implements StationeryItem {
  const factory _StationeryItem(
          {@JsonKey(name: 'EmployeeIDRequest') final int? employeeIdRequest,
          @JsonKey(name: 'UserName') final String? userName,
          @JsonKey(name: 'DateRequest') final DateTime? dateRequest,
          @JsonKey(name: 'IsApproved') final bool? isApproved,
          @JsonKey(name: 'ApprovedID') final int? approvedId,
          @JsonKey(name: 'DateApproved') final DateTime? dateApproved,
          @JsonKey(name: 'FullNameApproved') final String? fullNameApproved,
          @JsonKey(name: 'DepartmentName') final String? departmentName,
          @JsonKey(name: 'DepartmentID') final int? departmentId,
          @JsonKey(name: 'IsAdminApproved') final bool? isAdminApproved,
          @JsonKey(name: 'DateAdminApproved') final DateTime? dateAdminApproved,
          @JsonKey(name: 'AdminApprovedID') final int? adminApprovedId}) =
      _$StationeryItemImpl;

  factory _StationeryItem.fromJson(Map<String, dynamic> json) =
      _$StationeryItemImpl.fromJson;

  @override
  @JsonKey(name: 'EmployeeIDRequest')
  int? get employeeIdRequest;
  @override
  @JsonKey(name: 'UserName')
  String? get userName;
  @override
  @JsonKey(name: 'DateRequest')
  DateTime? get dateRequest;
  @override
  @JsonKey(name: 'IsApproved')
  bool? get isApproved;
  @override
  @JsonKey(name: 'ApprovedID')
  int? get approvedId;
  @override
  @JsonKey(name: 'DateApproved')
  DateTime? get dateApproved;
  @override
  @JsonKey(name: 'FullNameApproved')
  String? get fullNameApproved;
  @override
  @JsonKey(name: 'DepartmentName')
  String? get departmentName;
  @override
  @JsonKey(name: 'DepartmentID')
  int? get departmentId;
  @override
  @JsonKey(name: 'IsAdminApproved')
  bool? get isAdminApproved;
  @override
  @JsonKey(name: 'DateAdminApproved')
  DateTime? get dateAdminApproved;
  @override
  @JsonKey(name: 'AdminApprovedID')
  int? get adminApprovedId;
  @override
  @JsonKey(ignore: true)
  _$$StationeryItemImplCopyWith<_$StationeryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StationerySupplyItem _$StationerySupplyItemFromJson(Map<String, dynamic> json) {
  return _StationerySupplyItem.fromJson(json);
}

/// @nodoc
mixin _$StationerySupplyItem {
  @JsonKey(name: 'CodeNCC')
  String? get codeNCC => throw _privateConstructorUsedError;
  @JsonKey(name: 'CodeRTC')
  String? get codeRTC => throw _privateConstructorUsedError;
  @JsonKey(name: 'NameNCC')
  String? get nameNCC => throw _privateConstructorUsedError;
  @JsonKey(name: 'Unit')
  String? get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'RequestLimit')
  int? get requestLimit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StationerySupplyItemCopyWith<StationerySupplyItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationerySupplyItemCopyWith<$Res> {
  factory $StationerySupplyItemCopyWith(StationerySupplyItem value,
          $Res Function(StationerySupplyItem) then) =
      _$StationerySupplyItemCopyWithImpl<$Res, StationerySupplyItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'CodeNCC') String? codeNCC,
      @JsonKey(name: 'CodeRTC') String? codeRTC,
      @JsonKey(name: 'NameNCC') String? nameNCC,
      @JsonKey(name: 'Unit') String? unit,
      @JsonKey(name: 'RequestLimit') int? requestLimit});
}

/// @nodoc
class _$StationerySupplyItemCopyWithImpl<$Res,
        $Val extends StationerySupplyItem>
    implements $StationerySupplyItemCopyWith<$Res> {
  _$StationerySupplyItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codeNCC = freezed,
    Object? codeRTC = freezed,
    Object? nameNCC = freezed,
    Object? unit = freezed,
    Object? requestLimit = freezed,
  }) {
    return _then(_value.copyWith(
      codeNCC: freezed == codeNCC
          ? _value.codeNCC
          : codeNCC // ignore: cast_nullable_to_non_nullable
              as String?,
      codeRTC: freezed == codeRTC
          ? _value.codeRTC
          : codeRTC // ignore: cast_nullable_to_non_nullable
              as String?,
      nameNCC: freezed == nameNCC
          ? _value.nameNCC
          : nameNCC // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      requestLimit: freezed == requestLimit
          ? _value.requestLimit
          : requestLimit // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StationerySupplyItemImplCopyWith<$Res>
    implements $StationerySupplyItemCopyWith<$Res> {
  factory _$$StationerySupplyItemImplCopyWith(_$StationerySupplyItemImpl value,
          $Res Function(_$StationerySupplyItemImpl) then) =
      __$$StationerySupplyItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CodeNCC') String? codeNCC,
      @JsonKey(name: 'CodeRTC') String? codeRTC,
      @JsonKey(name: 'NameNCC') String? nameNCC,
      @JsonKey(name: 'Unit') String? unit,
      @JsonKey(name: 'RequestLimit') int? requestLimit});
}

/// @nodoc
class __$$StationerySupplyItemImplCopyWithImpl<$Res>
    extends _$StationerySupplyItemCopyWithImpl<$Res, _$StationerySupplyItemImpl>
    implements _$$StationerySupplyItemImplCopyWith<$Res> {
  __$$StationerySupplyItemImplCopyWithImpl(_$StationerySupplyItemImpl _value,
      $Res Function(_$StationerySupplyItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codeNCC = freezed,
    Object? codeRTC = freezed,
    Object? nameNCC = freezed,
    Object? unit = freezed,
    Object? requestLimit = freezed,
  }) {
    return _then(_$StationerySupplyItemImpl(
      codeNCC: freezed == codeNCC
          ? _value.codeNCC
          : codeNCC // ignore: cast_nullable_to_non_nullable
              as String?,
      codeRTC: freezed == codeRTC
          ? _value.codeRTC
          : codeRTC // ignore: cast_nullable_to_non_nullable
              as String?,
      nameNCC: freezed == nameNCC
          ? _value.nameNCC
          : nameNCC // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      requestLimit: freezed == requestLimit
          ? _value.requestLimit
          : requestLimit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StationerySupplyItemImpl implements _StationerySupplyItem {
  const _$StationerySupplyItemImpl(
      {@JsonKey(name: 'CodeNCC') this.codeNCC,
      @JsonKey(name: 'CodeRTC') this.codeRTC,
      @JsonKey(name: 'NameNCC') this.nameNCC,
      @JsonKey(name: 'Unit') this.unit,
      @JsonKey(name: 'RequestLimit') this.requestLimit});

  factory _$StationerySupplyItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$StationerySupplyItemImplFromJson(json);

  @override
  @JsonKey(name: 'CodeNCC')
  final String? codeNCC;
  @override
  @JsonKey(name: 'CodeRTC')
  final String? codeRTC;
  @override
  @JsonKey(name: 'NameNCC')
  final String? nameNCC;
  @override
  @JsonKey(name: 'Unit')
  final String? unit;
  @override
  @JsonKey(name: 'RequestLimit')
  final int? requestLimit;

  @override
  String toString() {
    return 'StationerySupplyItem(codeNCC: $codeNCC, codeRTC: $codeRTC, nameNCC: $nameNCC, unit: $unit, requestLimit: $requestLimit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StationerySupplyItemImpl &&
            (identical(other.codeNCC, codeNCC) || other.codeNCC == codeNCC) &&
            (identical(other.codeRTC, codeRTC) || other.codeRTC == codeRTC) &&
            (identical(other.nameNCC, nameNCC) || other.nameNCC == nameNCC) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.requestLimit, requestLimit) ||
                other.requestLimit == requestLimit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, codeNCC, codeRTC, nameNCC, unit, requestLimit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StationerySupplyItemImplCopyWith<_$StationerySupplyItemImpl>
      get copyWith =>
          __$$StationerySupplyItemImplCopyWithImpl<_$StationerySupplyItemImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StationerySupplyItemImplToJson(
      this,
    );
  }
}

abstract class _StationerySupplyItem implements StationerySupplyItem {
  const factory _StationerySupplyItem(
          {@JsonKey(name: 'CodeNCC') final String? codeNCC,
          @JsonKey(name: 'CodeRTC') final String? codeRTC,
          @JsonKey(name: 'NameNCC') final String? nameNCC,
          @JsonKey(name: 'Unit') final String? unit,
          @JsonKey(name: 'RequestLimit') final int? requestLimit}) =
      _$StationerySupplyItemImpl;

  factory _StationerySupplyItem.fromJson(Map<String, dynamic> json) =
      _$StationerySupplyItemImpl.fromJson;

  @override
  @JsonKey(name: 'CodeNCC')
  String? get codeNCC;
  @override
  @JsonKey(name: 'CodeRTC')
  String? get codeRTC;
  @override
  @JsonKey(name: 'NameNCC')
  String? get nameNCC;
  @override
  @JsonKey(name: 'Unit')
  String? get unit;
  @override
  @JsonKey(name: 'RequestLimit')
  int? get requestLimit;
  @override
  @JsonKey(ignore: true)
  _$$StationerySupplyItemImplCopyWith<_$StationerySupplyItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

StationeryDetailItem _$StationeryDetailItemFromJson(Map<String, dynamic> json) {
  return _StationeryDetailItem.fromJson(json);
}

/// @nodoc
mixin _$StationeryDetailItem {
  @JsonKey(name: 'OfficeSupplyID')
  int? get officeSupplyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'OfficeSupplyName')
  String? get officeSupplyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'OfficeSupplyRequestsID')
  int? get officeSupplyRequestsId => throw _privateConstructorUsedError;
  @JsonKey(name: 'OfficeSupplyUnitID')
  int? get officeSupplyUnitId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Quantity')
  int? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'Reason')
  String? get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'ExceedsLimit')
  bool? get exceedsLimit => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'CodeName')
  String? get codeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentName')
  String? get departmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullName')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Unit')
  String? get unit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StationeryDetailItemCopyWith<StationeryDetailItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationeryDetailItemCopyWith<$Res> {
  factory $StationeryDetailItemCopyWith(StationeryDetailItem value,
          $Res Function(StationeryDetailItem) then) =
      _$StationeryDetailItemCopyWithImpl<$Res, StationeryDetailItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'OfficeSupplyID') int? officeSupplyId,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'OfficeSupplyName') String? officeSupplyName,
      @JsonKey(name: 'OfficeSupplyRequestsID') int? officeSupplyRequestsId,
      @JsonKey(name: 'OfficeSupplyUnitID') int? officeSupplyUnitId,
      @JsonKey(name: 'Quantity') int? quantity,
      @JsonKey(name: 'Reason') String? reason,
      @JsonKey(name: 'ExceedsLimit') bool? exceedsLimit,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'CodeName') String? codeName,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Unit') String? unit});
}

/// @nodoc
class _$StationeryDetailItemCopyWithImpl<$Res,
        $Val extends StationeryDetailItem>
    implements $StationeryDetailItemCopyWith<$Res> {
  _$StationeryDetailItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? officeSupplyId = freezed,
    Object? note = freezed,
    Object? officeSupplyName = freezed,
    Object? officeSupplyRequestsId = freezed,
    Object? officeSupplyUnitId = freezed,
    Object? quantity = freezed,
    Object? reason = freezed,
    Object? exceedsLimit = freezed,
    Object? code = freezed,
    Object? codeName = freezed,
    Object? departmentName = freezed,
    Object? employeeId = freezed,
    Object? fullName = freezed,
    Object? id = freezed,
    Object? unit = freezed,
  }) {
    return _then(_value.copyWith(
      officeSupplyId: freezed == officeSupplyId
          ? _value.officeSupplyId
          : officeSupplyId // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      officeSupplyName: freezed == officeSupplyName
          ? _value.officeSupplyName
          : officeSupplyName // ignore: cast_nullable_to_non_nullable
              as String?,
      officeSupplyRequestsId: freezed == officeSupplyRequestsId
          ? _value.officeSupplyRequestsId
          : officeSupplyRequestsId // ignore: cast_nullable_to_non_nullable
              as int?,
      officeSupplyUnitId: freezed == officeSupplyUnitId
          ? _value.officeSupplyUnitId
          : officeSupplyUnitId // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      exceedsLimit: freezed == exceedsLimit
          ? _value.exceedsLimit
          : exceedsLimit // ignore: cast_nullable_to_non_nullable
              as bool?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      codeName: freezed == codeName
          ? _value.codeName
          : codeName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StationeryDetailItemImplCopyWith<$Res>
    implements $StationeryDetailItemCopyWith<$Res> {
  factory _$$StationeryDetailItemImplCopyWith(_$StationeryDetailItemImpl value,
          $Res Function(_$StationeryDetailItemImpl) then) =
      __$$StationeryDetailItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'OfficeSupplyID') int? officeSupplyId,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'OfficeSupplyName') String? officeSupplyName,
      @JsonKey(name: 'OfficeSupplyRequestsID') int? officeSupplyRequestsId,
      @JsonKey(name: 'OfficeSupplyUnitID') int? officeSupplyUnitId,
      @JsonKey(name: 'Quantity') int? quantity,
      @JsonKey(name: 'Reason') String? reason,
      @JsonKey(name: 'ExceedsLimit') bool? exceedsLimit,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'CodeName') String? codeName,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Unit') String? unit});
}

/// @nodoc
class __$$StationeryDetailItemImplCopyWithImpl<$Res>
    extends _$StationeryDetailItemCopyWithImpl<$Res, _$StationeryDetailItemImpl>
    implements _$$StationeryDetailItemImplCopyWith<$Res> {
  __$$StationeryDetailItemImplCopyWithImpl(_$StationeryDetailItemImpl _value,
      $Res Function(_$StationeryDetailItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? officeSupplyId = freezed,
    Object? note = freezed,
    Object? officeSupplyName = freezed,
    Object? officeSupplyRequestsId = freezed,
    Object? officeSupplyUnitId = freezed,
    Object? quantity = freezed,
    Object? reason = freezed,
    Object? exceedsLimit = freezed,
    Object? code = freezed,
    Object? codeName = freezed,
    Object? departmentName = freezed,
    Object? employeeId = freezed,
    Object? fullName = freezed,
    Object? id = freezed,
    Object? unit = freezed,
  }) {
    return _then(_$StationeryDetailItemImpl(
      officeSupplyId: freezed == officeSupplyId
          ? _value.officeSupplyId
          : officeSupplyId // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      officeSupplyName: freezed == officeSupplyName
          ? _value.officeSupplyName
          : officeSupplyName // ignore: cast_nullable_to_non_nullable
              as String?,
      officeSupplyRequestsId: freezed == officeSupplyRequestsId
          ? _value.officeSupplyRequestsId
          : officeSupplyRequestsId // ignore: cast_nullable_to_non_nullable
              as int?,
      officeSupplyUnitId: freezed == officeSupplyUnitId
          ? _value.officeSupplyUnitId
          : officeSupplyUnitId // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      exceedsLimit: freezed == exceedsLimit
          ? _value.exceedsLimit
          : exceedsLimit // ignore: cast_nullable_to_non_nullable
              as bool?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      codeName: freezed == codeName
          ? _value.codeName
          : codeName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StationeryDetailItemImpl implements _StationeryDetailItem {
  const _$StationeryDetailItemImpl(
      {@JsonKey(name: 'OfficeSupplyID') this.officeSupplyId,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'OfficeSupplyName') this.officeSupplyName,
      @JsonKey(name: 'OfficeSupplyRequestsID') this.officeSupplyRequestsId,
      @JsonKey(name: 'OfficeSupplyUnitID') this.officeSupplyUnitId,
      @JsonKey(name: 'Quantity') this.quantity,
      @JsonKey(name: 'Reason') this.reason,
      @JsonKey(name: 'ExceedsLimit') this.exceedsLimit,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'CodeName') this.codeName,
      @JsonKey(name: 'DepartmentName') this.departmentName,
      @JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'FullName') this.fullName,
      @JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Unit') this.unit});

  factory _$StationeryDetailItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$StationeryDetailItemImplFromJson(json);

  @override
  @JsonKey(name: 'OfficeSupplyID')
  final int? officeSupplyId;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'OfficeSupplyName')
  final String? officeSupplyName;
  @override
  @JsonKey(name: 'OfficeSupplyRequestsID')
  final int? officeSupplyRequestsId;
  @override
  @JsonKey(name: 'OfficeSupplyUnitID')
  final int? officeSupplyUnitId;
  @override
  @JsonKey(name: 'Quantity')
  final int? quantity;
  @override
  @JsonKey(name: 'Reason')
  final String? reason;
  @override
  @JsonKey(name: 'ExceedsLimit')
  final bool? exceedsLimit;
  @override
  @JsonKey(name: 'Code')
  final String? code;
  @override
  @JsonKey(name: 'CodeName')
  final String? codeName;
  @override
  @JsonKey(name: 'DepartmentName')
  final String? departmentName;
  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;
  @override
  @JsonKey(name: 'FullName')
  final String? fullName;
  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'Unit')
  final String? unit;

  @override
  String toString() {
    return 'StationeryDetailItem(officeSupplyId: $officeSupplyId, note: $note, officeSupplyName: $officeSupplyName, officeSupplyRequestsId: $officeSupplyRequestsId, officeSupplyUnitId: $officeSupplyUnitId, quantity: $quantity, reason: $reason, exceedsLimit: $exceedsLimit, code: $code, codeName: $codeName, departmentName: $departmentName, employeeId: $employeeId, fullName: $fullName, id: $id, unit: $unit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StationeryDetailItemImpl &&
            (identical(other.officeSupplyId, officeSupplyId) ||
                other.officeSupplyId == officeSupplyId) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.officeSupplyName, officeSupplyName) ||
                other.officeSupplyName == officeSupplyName) &&
            (identical(other.officeSupplyRequestsId, officeSupplyRequestsId) ||
                other.officeSupplyRequestsId == officeSupplyRequestsId) &&
            (identical(other.officeSupplyUnitId, officeSupplyUnitId) ||
                other.officeSupplyUnitId == officeSupplyUnitId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.exceedsLimit, exceedsLimit) ||
                other.exceedsLimit == exceedsLimit) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.codeName, codeName) ||
                other.codeName == codeName) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      officeSupplyId,
      note,
      officeSupplyName,
      officeSupplyRequestsId,
      officeSupplyUnitId,
      quantity,
      reason,
      exceedsLimit,
      code,
      codeName,
      departmentName,
      employeeId,
      fullName,
      id,
      unit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StationeryDetailItemImplCopyWith<_$StationeryDetailItemImpl>
      get copyWith =>
          __$$StationeryDetailItemImplCopyWithImpl<_$StationeryDetailItemImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StationeryDetailItemImplToJson(
      this,
    );
  }
}

abstract class _StationeryDetailItem implements StationeryDetailItem {
  const factory _StationeryDetailItem(
      {@JsonKey(name: 'OfficeSupplyID') final int? officeSupplyId,
      @JsonKey(name: 'Note') final String? note,
      @JsonKey(name: 'OfficeSupplyName') final String? officeSupplyName,
      @JsonKey(name: 'OfficeSupplyRequestsID')
      final int? officeSupplyRequestsId,
      @JsonKey(name: 'OfficeSupplyUnitID') final int? officeSupplyUnitId,
      @JsonKey(name: 'Quantity') final int? quantity,
      @JsonKey(name: 'Reason') final String? reason,
      @JsonKey(name: 'ExceedsLimit') final bool? exceedsLimit,
      @JsonKey(name: 'Code') final String? code,
      @JsonKey(name: 'CodeName') final String? codeName,
      @JsonKey(name: 'DepartmentName') final String? departmentName,
      @JsonKey(name: 'EmployeeID') final int? employeeId,
      @JsonKey(name: 'FullName') final String? fullName,
      @JsonKey(name: 'ID') final int? id,
      @JsonKey(name: 'Unit') final String? unit}) = _$StationeryDetailItemImpl;

  factory _StationeryDetailItem.fromJson(Map<String, dynamic> json) =
      _$StationeryDetailItemImpl.fromJson;

  @override
  @JsonKey(name: 'OfficeSupplyID')
  int? get officeSupplyId;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'OfficeSupplyName')
  String? get officeSupplyName;
  @override
  @JsonKey(name: 'OfficeSupplyRequestsID')
  int? get officeSupplyRequestsId;
  @override
  @JsonKey(name: 'OfficeSupplyUnitID')
  int? get officeSupplyUnitId;
  @override
  @JsonKey(name: 'Quantity')
  int? get quantity;
  @override
  @JsonKey(name: 'Reason')
  String? get reason;
  @override
  @JsonKey(name: 'ExceedsLimit')
  bool? get exceedsLimit;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(name: 'CodeName')
  String? get codeName;
  @override
  @JsonKey(name: 'DepartmentName')
  String? get departmentName;
  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(name: 'FullName')
  String? get fullName;
  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'Unit')
  String? get unit;
  @override
  @JsonKey(ignore: true)
  _$$StationeryDetailItemImplCopyWith<_$StationeryDetailItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}
