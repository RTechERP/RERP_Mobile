// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_lookup_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FirmBase _$FirmBaseFromJson(Map<String, dynamic> json) {
  return _FirmBase.fromJson(json);
}

/// @nodoc
mixin _$FirmBase {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'FirmCode')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'FirmName')
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FirmBaseCopyWith<FirmBase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirmBaseCopyWith<$Res> {
  factory $FirmBaseCopyWith(FirmBase value, $Res Function(FirmBase) then) =
      _$FirmBaseCopyWithImpl<$Res, FirmBase>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'FirmCode') String? code,
      @JsonKey(name: 'FirmName') String? name});
}

/// @nodoc
class _$FirmBaseCopyWithImpl<$Res, $Val extends FirmBase>
    implements $FirmBaseCopyWith<$Res> {
  _$FirmBaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FirmBaseImplCopyWith<$Res>
    implements $FirmBaseCopyWith<$Res> {
  factory _$$FirmBaseImplCopyWith(
          _$FirmBaseImpl value, $Res Function(_$FirmBaseImpl) then) =
      __$$FirmBaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'FirmCode') String? code,
      @JsonKey(name: 'FirmName') String? name});
}

/// @nodoc
class __$$FirmBaseImplCopyWithImpl<$Res>
    extends _$FirmBaseCopyWithImpl<$Res, _$FirmBaseImpl>
    implements _$$FirmBaseImplCopyWith<$Res> {
  __$$FirmBaseImplCopyWithImpl(
      _$FirmBaseImpl _value, $Res Function(_$FirmBaseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
  }) {
    return _then(_$FirmBaseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FirmBaseImpl implements _FirmBase {
  const _$FirmBaseImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'FirmCode') this.code,
      @JsonKey(name: 'FirmName') this.name});

  factory _$FirmBaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FirmBaseImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'FirmCode')
  final String? code;
  @override
  @JsonKey(name: 'FirmName')
  final String? name;

  @override
  String toString() {
    return 'FirmBase(id: $id, code: $code, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirmBaseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirmBaseImplCopyWith<_$FirmBaseImpl> get copyWith =>
      __$$FirmBaseImplCopyWithImpl<_$FirmBaseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FirmBaseImplToJson(
      this,
    );
  }
}

abstract class _FirmBase implements FirmBase {
  const factory _FirmBase(
      {@JsonKey(name: 'ID') final int? id,
      @JsonKey(name: 'FirmCode') final String? code,
      @JsonKey(name: 'FirmName') final String? name}) = _$FirmBaseImpl;

  factory _FirmBase.fromJson(Map<String, dynamic> json) =
      _$FirmBaseImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'FirmCode')
  String? get code;
  @override
  @JsonKey(name: 'FirmName')
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$FirmBaseImplCopyWith<_$FirmBaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerItem _$CustomerItemFromJson(Map<String, dynamic> json) {
  return _CustomerItem.fromJson(json);
}

/// @nodoc
mixin _$CustomerItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerCode')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerName')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerShortName')
  String? get shortName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Address')
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'Phone')
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'Email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContactName')
  String? get contactName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContactPhone')
  String? get contactPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContactEmail')
  String? get contactEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxCode')
  String? get taxCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'Province')
  String? get province => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerItemCopyWith<CustomerItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerItemCopyWith<$Res> {
  factory $CustomerItemCopyWith(
          CustomerItem value, $Res Function(CustomerItem) then) =
      _$CustomerItemCopyWithImpl<$Res, CustomerItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'CustomerCode') String? code,
      @JsonKey(name: 'CustomerName') String? name,
      @JsonKey(name: 'CustomerShortName') String? shortName,
      @JsonKey(name: 'Address') String? address,
      @JsonKey(name: 'Phone') String? phone,
      @JsonKey(name: 'Email') String? email,
      @JsonKey(name: 'ContactName') String? contactName,
      @JsonKey(name: 'ContactPhone') String? contactPhone,
      @JsonKey(name: 'ContactEmail') String? contactEmail,
      @JsonKey(name: 'TaxCode') String? taxCode,
      @JsonKey(name: 'Province') String? province});
}

/// @nodoc
class _$CustomerItemCopyWithImpl<$Res, $Val extends CustomerItem>
    implements $CustomerItemCopyWith<$Res> {
  _$CustomerItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? shortName = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? contactName = freezed,
    Object? contactPhone = freezed,
    Object? contactEmail = freezed,
    Object? taxCode = freezed,
    Object? province = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      shortName: freezed == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      contactName: freezed == contactName
          ? _value.contactName
          : contactName // ignore: cast_nullable_to_non_nullable
              as String?,
      contactPhone: freezed == contactPhone
          ? _value.contactPhone
          : contactPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      contactEmail: freezed == contactEmail
          ? _value.contactEmail
          : contactEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      taxCode: freezed == taxCode
          ? _value.taxCode
          : taxCode // ignore: cast_nullable_to_non_nullable
              as String?,
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerItemImplCopyWith<$Res>
    implements $CustomerItemCopyWith<$Res> {
  factory _$$CustomerItemImplCopyWith(
          _$CustomerItemImpl value, $Res Function(_$CustomerItemImpl) then) =
      __$$CustomerItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'CustomerCode') String? code,
      @JsonKey(name: 'CustomerName') String? name,
      @JsonKey(name: 'CustomerShortName') String? shortName,
      @JsonKey(name: 'Address') String? address,
      @JsonKey(name: 'Phone') String? phone,
      @JsonKey(name: 'Email') String? email,
      @JsonKey(name: 'ContactName') String? contactName,
      @JsonKey(name: 'ContactPhone') String? contactPhone,
      @JsonKey(name: 'ContactEmail') String? contactEmail,
      @JsonKey(name: 'TaxCode') String? taxCode,
      @JsonKey(name: 'Province') String? province});
}

/// @nodoc
class __$$CustomerItemImplCopyWithImpl<$Res>
    extends _$CustomerItemCopyWithImpl<$Res, _$CustomerItemImpl>
    implements _$$CustomerItemImplCopyWith<$Res> {
  __$$CustomerItemImplCopyWithImpl(
      _$CustomerItemImpl _value, $Res Function(_$CustomerItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? shortName = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? contactName = freezed,
    Object? contactPhone = freezed,
    Object? contactEmail = freezed,
    Object? taxCode = freezed,
    Object? province = freezed,
  }) {
    return _then(_$CustomerItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      shortName: freezed == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      contactName: freezed == contactName
          ? _value.contactName
          : contactName // ignore: cast_nullable_to_non_nullable
              as String?,
      contactPhone: freezed == contactPhone
          ? _value.contactPhone
          : contactPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      contactEmail: freezed == contactEmail
          ? _value.contactEmail
          : contactEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      taxCode: freezed == taxCode
          ? _value.taxCode
          : taxCode // ignore: cast_nullable_to_non_nullable
              as String?,
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerItemImpl implements _CustomerItem {
  const _$CustomerItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'CustomerCode') this.code,
      @JsonKey(name: 'CustomerName') this.name,
      @JsonKey(name: 'CustomerShortName') this.shortName,
      @JsonKey(name: 'Address') this.address,
      @JsonKey(name: 'Phone') this.phone,
      @JsonKey(name: 'Email') this.email,
      @JsonKey(name: 'ContactName') this.contactName,
      @JsonKey(name: 'ContactPhone') this.contactPhone,
      @JsonKey(name: 'ContactEmail') this.contactEmail,
      @JsonKey(name: 'TaxCode') this.taxCode,
      @JsonKey(name: 'Province') this.province});

  factory _$CustomerItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'CustomerCode')
  final String? code;
  @override
  @JsonKey(name: 'CustomerName')
  final String? name;
  @override
  @JsonKey(name: 'CustomerShortName')
  final String? shortName;
  @override
  @JsonKey(name: 'Address')
  final String? address;
  @override
  @JsonKey(name: 'Phone')
  final String? phone;
  @override
  @JsonKey(name: 'Email')
  final String? email;
  @override
  @JsonKey(name: 'ContactName')
  final String? contactName;
  @override
  @JsonKey(name: 'ContactPhone')
  final String? contactPhone;
  @override
  @JsonKey(name: 'ContactEmail')
  final String? contactEmail;
  @override
  @JsonKey(name: 'TaxCode')
  final String? taxCode;
  @override
  @JsonKey(name: 'Province')
  final String? province;

  @override
  String toString() {
    return 'CustomerItem(id: $id, code: $code, name: $name, shortName: $shortName, address: $address, phone: $phone, email: $email, contactName: $contactName, contactPhone: $contactPhone, contactEmail: $contactEmail, taxCode: $taxCode, province: $province)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.contactName, contactName) ||
                other.contactName == contactName) &&
            (identical(other.contactPhone, contactPhone) ||
                other.contactPhone == contactPhone) &&
            (identical(other.contactEmail, contactEmail) ||
                other.contactEmail == contactEmail) &&
            (identical(other.taxCode, taxCode) || other.taxCode == taxCode) &&
            (identical(other.province, province) ||
                other.province == province));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      code,
      name,
      shortName,
      address,
      phone,
      email,
      contactName,
      contactPhone,
      contactEmail,
      taxCode,
      province);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerItemImplCopyWith<_$CustomerItemImpl> get copyWith =>
      __$$CustomerItemImplCopyWithImpl<_$CustomerItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerItemImplToJson(
      this,
    );
  }
}

abstract class _CustomerItem implements CustomerItem {
  const factory _CustomerItem(
      {@JsonKey(name: 'ID') final int? id,
      @JsonKey(name: 'CustomerCode') final String? code,
      @JsonKey(name: 'CustomerName') final String? name,
      @JsonKey(name: 'CustomerShortName') final String? shortName,
      @JsonKey(name: 'Address') final String? address,
      @JsonKey(name: 'Phone') final String? phone,
      @JsonKey(name: 'Email') final String? email,
      @JsonKey(name: 'ContactName') final String? contactName,
      @JsonKey(name: 'ContactPhone') final String? contactPhone,
      @JsonKey(name: 'ContactEmail') final String? contactEmail,
      @JsonKey(name: 'TaxCode') final String? taxCode,
      @JsonKey(name: 'Province') final String? province}) = _$CustomerItemImpl;

  factory _CustomerItem.fromJson(Map<String, dynamic> json) =
      _$CustomerItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'CustomerCode')
  String? get code;
  @override
  @JsonKey(name: 'CustomerName')
  String? get name;
  @override
  @JsonKey(name: 'CustomerShortName')
  String? get shortName;
  @override
  @JsonKey(name: 'Address')
  String? get address;
  @override
  @JsonKey(name: 'Phone')
  String? get phone;
  @override
  @JsonKey(name: 'Email')
  String? get email;
  @override
  @JsonKey(name: 'ContactName')
  String? get contactName;
  @override
  @JsonKey(name: 'ContactPhone')
  String? get contactPhone;
  @override
  @JsonKey(name: 'ContactEmail')
  String? get contactEmail;
  @override
  @JsonKey(name: 'TaxCode')
  String? get taxCode;
  @override
  @JsonKey(name: 'Province')
  String? get province;
  @override
  @JsonKey(ignore: true)
  _$$CustomerItemImplCopyWith<_$CustomerItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectTypeBase _$ProjectTypeBaseFromJson(Map<String, dynamic> json) {
  return _ProjectTypeBase.fromJson(json);
}

/// @nodoc
mixin _$ProjectTypeBase {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectTypeCode')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectTypeName')
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectTypeBaseCopyWith<ProjectTypeBase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectTypeBaseCopyWith<$Res> {
  factory $ProjectTypeBaseCopyWith(
          ProjectTypeBase value, $Res Function(ProjectTypeBase) then) =
      _$ProjectTypeBaseCopyWithImpl<$Res, ProjectTypeBase>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'ProjectTypeCode') String? code,
      @JsonKey(name: 'ProjectTypeName') String? name});
}

/// @nodoc
class _$ProjectTypeBaseCopyWithImpl<$Res, $Val extends ProjectTypeBase>
    implements $ProjectTypeBaseCopyWith<$Res> {
  _$ProjectTypeBaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectTypeBaseImplCopyWith<$Res>
    implements $ProjectTypeBaseCopyWith<$Res> {
  factory _$$ProjectTypeBaseImplCopyWith(_$ProjectTypeBaseImpl value,
          $Res Function(_$ProjectTypeBaseImpl) then) =
      __$$ProjectTypeBaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'ProjectTypeCode') String? code,
      @JsonKey(name: 'ProjectTypeName') String? name});
}

/// @nodoc
class __$$ProjectTypeBaseImplCopyWithImpl<$Res>
    extends _$ProjectTypeBaseCopyWithImpl<$Res, _$ProjectTypeBaseImpl>
    implements _$$ProjectTypeBaseImplCopyWith<$Res> {
  __$$ProjectTypeBaseImplCopyWithImpl(
      _$ProjectTypeBaseImpl _value, $Res Function(_$ProjectTypeBaseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
  }) {
    return _then(_$ProjectTypeBaseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectTypeBaseImpl implements _ProjectTypeBase {
  const _$ProjectTypeBaseImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'ProjectTypeCode') this.code,
      @JsonKey(name: 'ProjectTypeName') this.name});

  factory _$ProjectTypeBaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectTypeBaseImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'ProjectTypeCode')
  final String? code;
  @override
  @JsonKey(name: 'ProjectTypeName')
  final String? name;

  @override
  String toString() {
    return 'ProjectTypeBase(id: $id, code: $code, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectTypeBaseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectTypeBaseImplCopyWith<_$ProjectTypeBaseImpl> get copyWith =>
      __$$ProjectTypeBaseImplCopyWithImpl<_$ProjectTypeBaseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectTypeBaseImplToJson(
      this,
    );
  }
}

abstract class _ProjectTypeBase implements ProjectTypeBase {
  const factory _ProjectTypeBase(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'ProjectTypeCode') final String? code,
          @JsonKey(name: 'ProjectTypeName') final String? name}) =
      _$ProjectTypeBaseImpl;

  factory _ProjectTypeBase.fromJson(Map<String, dynamic> json) =
      _$ProjectTypeBaseImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'ProjectTypeCode')
  String? get code;
  @override
  @JsonKey(name: 'ProjectTypeName')
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$ProjectTypeBaseImplCopyWith<_$ProjectTypeBaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PmItem _$PmItemFromJson(Map<String, dynamic> json) {
  return _PmItem.fromJson(json);
}

/// @nodoc
mixin _$PmItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullName')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentName')
  String? get departmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxCompanyID')
  int? get taxCompanyId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PmItemCopyWith<PmItem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PmItemCopyWith<$Res> {
  factory $PmItemCopyWith(PmItem value, $Res Function(PmItem) then) =
      _$PmItemCopyWithImpl<$Res, PmItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'TaxCompanyID') int? taxCompanyId});
}

/// @nodoc
class _$PmItemCopyWithImpl<$Res, $Val extends PmItem>
    implements $PmItemCopyWith<$Res> {
  _$PmItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? fullName = freezed,
    Object? departmentName = freezed,
    Object? employeeId = freezed,
    Object? taxCompanyId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      taxCompanyId: freezed == taxCompanyId
          ? _value.taxCompanyId
          : taxCompanyId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PmItemImplCopyWith<$Res> implements $PmItemCopyWith<$Res> {
  factory _$$PmItemImplCopyWith(
          _$PmItemImpl value, $Res Function(_$PmItemImpl) then) =
      __$$PmItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'TaxCompanyID') int? taxCompanyId});
}

/// @nodoc
class __$$PmItemImplCopyWithImpl<$Res>
    extends _$PmItemCopyWithImpl<$Res, _$PmItemImpl>
    implements _$$PmItemImplCopyWith<$Res> {
  __$$PmItemImplCopyWithImpl(
      _$PmItemImpl _value, $Res Function(_$PmItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? fullName = freezed,
    Object? departmentName = freezed,
    Object? employeeId = freezed,
    Object? taxCompanyId = freezed,
  }) {
    return _then(_$PmItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      taxCompanyId: freezed == taxCompanyId
          ? _value.taxCompanyId
          : taxCompanyId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PmItemImpl implements _PmItem {
  const _$PmItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'FullName') this.fullName,
      @JsonKey(name: 'DepartmentName') this.departmentName,
      @JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'TaxCompanyID') this.taxCompanyId});

  factory _$PmItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PmItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'Code')
  final String? code;
  @override
  @JsonKey(name: 'FullName')
  final String? fullName;
  @override
  @JsonKey(name: 'DepartmentName')
  final String? departmentName;
  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;
  @override
  @JsonKey(name: 'TaxCompanyID')
  final int? taxCompanyId;

  @override
  String toString() {
    return 'PmItem(id: $id, code: $code, fullName: $fullName, departmentName: $departmentName, employeeId: $employeeId, taxCompanyId: $taxCompanyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PmItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.taxCompanyId, taxCompanyId) ||
                other.taxCompanyId == taxCompanyId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, fullName,
      departmentName, employeeId, taxCompanyId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PmItemImplCopyWith<_$PmItemImpl> get copyWith =>
      __$$PmItemImplCopyWithImpl<_$PmItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PmItemImplToJson(
      this,
    );
  }
}

abstract class _PmItem implements PmItem {
  const factory _PmItem(
      {@JsonKey(name: 'ID') final int? id,
      @JsonKey(name: 'Code') final String? code,
      @JsonKey(name: 'FullName') final String? fullName,
      @JsonKey(name: 'DepartmentName') final String? departmentName,
      @JsonKey(name: 'EmployeeID') final int? employeeId,
      @JsonKey(name: 'TaxCompanyID') final int? taxCompanyId}) = _$PmItemImpl;

  factory _PmItem.fromJson(Map<String, dynamic> json) = _$PmItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(name: 'FullName')
  String? get fullName;
  @override
  @JsonKey(name: 'DepartmentName')
  String? get departmentName;
  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(name: 'TaxCompanyID')
  int? get taxCompanyId;
  @override
  @JsonKey(ignore: true)
  _$$PmItemImplCopyWith<_$PmItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectStatusItem _$ProjectStatusItemFromJson(Map<String, dynamic> json) {
  return _ProjectStatusItem.fromJson(json);
}

/// @nodoc
mixin _$ProjectStatusItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusName')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'STT')
  int? get stt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectStatusItemCopyWith<ProjectStatusItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectStatusItemCopyWith<$Res> {
  factory $ProjectStatusItemCopyWith(
          ProjectStatusItem value, $Res Function(ProjectStatusItem) then) =
      _$ProjectStatusItemCopyWithImpl<$Res, ProjectStatusItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'StatusName') String? name,
      @JsonKey(name: 'STT') int? stt});
}

/// @nodoc
class _$ProjectStatusItemCopyWithImpl<$Res, $Val extends ProjectStatusItem>
    implements $ProjectStatusItemCopyWith<$Res> {
  _$ProjectStatusItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? stt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectStatusItemImplCopyWith<$Res>
    implements $ProjectStatusItemCopyWith<$Res> {
  factory _$$ProjectStatusItemImplCopyWith(_$ProjectStatusItemImpl value,
          $Res Function(_$ProjectStatusItemImpl) then) =
      __$$ProjectStatusItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'StatusName') String? name,
      @JsonKey(name: 'STT') int? stt});
}

/// @nodoc
class __$$ProjectStatusItemImplCopyWithImpl<$Res>
    extends _$ProjectStatusItemCopyWithImpl<$Res, _$ProjectStatusItemImpl>
    implements _$$ProjectStatusItemImplCopyWith<$Res> {
  __$$ProjectStatusItemImplCopyWithImpl(_$ProjectStatusItemImpl _value,
      $Res Function(_$ProjectStatusItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? stt = freezed,
  }) {
    return _then(_$ProjectStatusItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectStatusItemImpl implements _ProjectStatusItem {
  const _$ProjectStatusItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'StatusName') this.name,
      @JsonKey(name: 'STT') this.stt});

  factory _$ProjectStatusItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectStatusItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'StatusName')
  final String? name;
  @override
  @JsonKey(name: 'STT')
  final int? stt;

  @override
  String toString() {
    return 'ProjectStatusItem(id: $id, name: $name, stt: $stt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectStatusItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.stt, stt) || other.stt == stt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, stt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectStatusItemImplCopyWith<_$ProjectStatusItemImpl> get copyWith =>
      __$$ProjectStatusItemImplCopyWithImpl<_$ProjectStatusItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectStatusItemImplToJson(
      this,
    );
  }
}

abstract class _ProjectStatusItem implements ProjectStatusItem {
  const factory _ProjectStatusItem(
      {@JsonKey(name: 'ID') final int? id,
      @JsonKey(name: 'StatusName') final String? name,
      @JsonKey(name: 'STT') final int? stt}) = _$ProjectStatusItemImpl;

  factory _ProjectStatusItem.fromJson(Map<String, dynamic> json) =
      _$ProjectStatusItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'StatusName')
  String? get name;
  @override
  @JsonKey(name: 'STT')
  int? get stt;
  @override
  @JsonKey(ignore: true)
  _$$ProjectStatusItemImplCopyWith<_$ProjectStatusItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerIndustry _$CustomerIndustryFromJson(Map<String, dynamic> json) {
  return _CustomerIndustry.fromJson(json);
}

/// @nodoc
mixin _$CustomerIndustry {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'IndustriesNameVI')
  String? get nameVI => throw _privateConstructorUsedError;
  @JsonKey(name: 'IndustriesNameEN')
  String? get nameEN => throw _privateConstructorUsedError;
  @JsonKey(name: 'Descriptions')
  String? get descriptions => throw _privateConstructorUsedError;
  @JsonKey(name: 'NumberOrder')
  int? get numberOrder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerIndustryCopyWith<CustomerIndustry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerIndustryCopyWith<$Res> {
  factory $CustomerIndustryCopyWith(
          CustomerIndustry value, $Res Function(CustomerIndustry) then) =
      _$CustomerIndustryCopyWithImpl<$Res, CustomerIndustry>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'IndustriesNameVI') String? nameVI,
      @JsonKey(name: 'IndustriesNameEN') String? nameEN,
      @JsonKey(name: 'Descriptions') String? descriptions,
      @JsonKey(name: 'NumberOrder') int? numberOrder});
}

/// @nodoc
class _$CustomerIndustryCopyWithImpl<$Res, $Val extends CustomerIndustry>
    implements $CustomerIndustryCopyWith<$Res> {
  _$CustomerIndustryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nameVI = freezed,
    Object? nameEN = freezed,
    Object? descriptions = freezed,
    Object? numberOrder = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      nameVI: freezed == nameVI
          ? _value.nameVI
          : nameVI // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEN: freezed == nameEN
          ? _value.nameEN
          : nameEN // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptions: freezed == descriptions
          ? _value.descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOrder: freezed == numberOrder
          ? _value.numberOrder
          : numberOrder // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerIndustryImplCopyWith<$Res>
    implements $CustomerIndustryCopyWith<$Res> {
  factory _$$CustomerIndustryImplCopyWith(_$CustomerIndustryImpl value,
          $Res Function(_$CustomerIndustryImpl) then) =
      __$$CustomerIndustryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'IndustriesNameVI') String? nameVI,
      @JsonKey(name: 'IndustriesNameEN') String? nameEN,
      @JsonKey(name: 'Descriptions') String? descriptions,
      @JsonKey(name: 'NumberOrder') int? numberOrder});
}

/// @nodoc
class __$$CustomerIndustryImplCopyWithImpl<$Res>
    extends _$CustomerIndustryCopyWithImpl<$Res, _$CustomerIndustryImpl>
    implements _$$CustomerIndustryImplCopyWith<$Res> {
  __$$CustomerIndustryImplCopyWithImpl(_$CustomerIndustryImpl _value,
      $Res Function(_$CustomerIndustryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nameVI = freezed,
    Object? nameEN = freezed,
    Object? descriptions = freezed,
    Object? numberOrder = freezed,
  }) {
    return _then(_$CustomerIndustryImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      nameVI: freezed == nameVI
          ? _value.nameVI
          : nameVI // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEN: freezed == nameEN
          ? _value.nameEN
          : nameEN // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptions: freezed == descriptions
          ? _value.descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOrder: freezed == numberOrder
          ? _value.numberOrder
          : numberOrder // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerIndustryImpl implements _CustomerIndustry {
  const _$CustomerIndustryImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'IndustriesNameVI') this.nameVI,
      @JsonKey(name: 'IndustriesNameEN') this.nameEN,
      @JsonKey(name: 'Descriptions') this.descriptions,
      @JsonKey(name: 'NumberOrder') this.numberOrder});

  factory _$CustomerIndustryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerIndustryImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'IndustriesNameVI')
  final String? nameVI;
  @override
  @JsonKey(name: 'IndustriesNameEN')
  final String? nameEN;
  @override
  @JsonKey(name: 'Descriptions')
  final String? descriptions;
  @override
  @JsonKey(name: 'NumberOrder')
  final int? numberOrder;

  @override
  String toString() {
    return 'CustomerIndustry(id: $id, nameVI: $nameVI, nameEN: $nameEN, descriptions: $descriptions, numberOrder: $numberOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerIndustryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameVI, nameVI) || other.nameVI == nameVI) &&
            (identical(other.nameEN, nameEN) || other.nameEN == nameEN) &&
            (identical(other.descriptions, descriptions) ||
                other.descriptions == descriptions) &&
            (identical(other.numberOrder, numberOrder) ||
                other.numberOrder == numberOrder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, nameVI, nameEN, descriptions, numberOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerIndustryImplCopyWith<_$CustomerIndustryImpl> get copyWith =>
      __$$CustomerIndustryImplCopyWithImpl<_$CustomerIndustryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerIndustryImplToJson(
      this,
    );
  }
}

abstract class _CustomerIndustry implements CustomerIndustry {
  const factory _CustomerIndustry(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'IndustriesNameVI') final String? nameVI,
          @JsonKey(name: 'IndustriesNameEN') final String? nameEN,
          @JsonKey(name: 'Descriptions') final String? descriptions,
          @JsonKey(name: 'NumberOrder') final int? numberOrder}) =
      _$CustomerIndustryImpl;

  factory _CustomerIndustry.fromJson(Map<String, dynamic> json) =
      _$CustomerIndustryImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'IndustriesNameVI')
  String? get nameVI;
  @override
  @JsonKey(name: 'IndustriesNameEN')
  String? get nameEN;
  @override
  @JsonKey(name: 'Descriptions')
  String? get descriptions;
  @override
  @JsonKey(name: 'NumberOrder')
  int? get numberOrder;
  @override
  @JsonKey(ignore: true)
  _$$CustomerIndustryImplCopyWith<_$CustomerIndustryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserTeamItem _$UserTeamItemFromJson(Map<String, dynamic> json) {
  return _UserTeamItem.fromJson(json);
}

/// @nodoc
mixin _$UserTeamItem {
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullName')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentName')
  String? get departmentName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserTeamItemCopyWith<UserTeamItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserTeamItemCopyWith<$Res> {
  factory $UserTeamItemCopyWith(
          UserTeamItem value, $Res Function(UserTeamItem) then) =
      _$UserTeamItemCopyWithImpl<$Res, UserTeamItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'DepartmentName') String? departmentName});
}

/// @nodoc
class _$UserTeamItemCopyWithImpl<$Res, $Val extends UserTeamItem>
    implements $UserTeamItemCopyWith<$Res> {
  _$UserTeamItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeId = freezed,
    Object? code = freezed,
    Object? fullName = freezed,
    Object? departmentName = freezed,
  }) {
    return _then(_value.copyWith(
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserTeamItemImplCopyWith<$Res>
    implements $UserTeamItemCopyWith<$Res> {
  factory _$$UserTeamItemImplCopyWith(
          _$UserTeamItemImpl value, $Res Function(_$UserTeamItemImpl) then) =
      __$$UserTeamItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'DepartmentName') String? departmentName});
}

/// @nodoc
class __$$UserTeamItemImplCopyWithImpl<$Res>
    extends _$UserTeamItemCopyWithImpl<$Res, _$UserTeamItemImpl>
    implements _$$UserTeamItemImplCopyWith<$Res> {
  __$$UserTeamItemImplCopyWithImpl(
      _$UserTeamItemImpl _value, $Res Function(_$UserTeamItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeId = freezed,
    Object? code = freezed,
    Object? fullName = freezed,
    Object? departmentName = freezed,
  }) {
    return _then(_$UserTeamItemImpl(
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserTeamItemImpl implements _UserTeamItem {
  const _$UserTeamItemImpl(
      {@JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'FullName') this.fullName,
      @JsonKey(name: 'DepartmentName') this.departmentName});

  factory _$UserTeamItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserTeamItemImplFromJson(json);

  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;
  @override
  @JsonKey(name: 'Code')
  final String? code;
  @override
  @JsonKey(name: 'FullName')
  final String? fullName;
  @override
  @JsonKey(name: 'DepartmentName')
  final String? departmentName;

  @override
  String toString() {
    return 'UserTeamItem(employeeId: $employeeId, code: $code, fullName: $fullName, departmentName: $departmentName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserTeamItemImpl &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, employeeId, code, fullName, departmentName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserTeamItemImplCopyWith<_$UserTeamItemImpl> get copyWith =>
      __$$UserTeamItemImplCopyWithImpl<_$UserTeamItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserTeamItemImplToJson(
      this,
    );
  }
}

abstract class _UserTeamItem implements UserTeamItem {
  const factory _UserTeamItem(
          {@JsonKey(name: 'EmployeeID') final int? employeeId,
          @JsonKey(name: 'Code') final String? code,
          @JsonKey(name: 'FullName') final String? fullName,
          @JsonKey(name: 'DepartmentName') final String? departmentName}) =
      _$UserTeamItemImpl;

  factory _UserTeamItem.fromJson(Map<String, dynamic> json) =
      _$UserTeamItemImpl.fromJson;

  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(name: 'FullName')
  String? get fullName;
  @override
  @JsonKey(name: 'DepartmentName')
  String? get departmentName;
  @override
  @JsonKey(ignore: true)
  _$$UserTeamItemImplCopyWith<_$UserTeamItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ApplicationType _$ApplicationTypeFromJson(Map<String, dynamic> json) {
  return _ApplicationType.fromJson(json);
}

/// @nodoc
mixin _$ApplicationType {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApplicationName')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'Descriptions')
  String? get descriptions => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectTypeID')
  int? get projectTypeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApplicationTypeCopyWith<ApplicationType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationTypeCopyWith<$Res> {
  factory $ApplicationTypeCopyWith(
          ApplicationType value, $Res Function(ApplicationType) then) =
      _$ApplicationTypeCopyWithImpl<$Res, ApplicationType>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'ApplicationName') String? name,
      @JsonKey(name: 'Descriptions') String? descriptions,
      @JsonKey(name: 'ProjectTypeID') int? projectTypeId});
}

/// @nodoc
class _$ApplicationTypeCopyWithImpl<$Res, $Val extends ApplicationType>
    implements $ApplicationTypeCopyWith<$Res> {
  _$ApplicationTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? descriptions = freezed,
    Object? projectTypeId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptions: freezed == descriptions
          ? _value.descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as String?,
      projectTypeId: freezed == projectTypeId
          ? _value.projectTypeId
          : projectTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApplicationTypeImplCopyWith<$Res>
    implements $ApplicationTypeCopyWith<$Res> {
  factory _$$ApplicationTypeImplCopyWith(_$ApplicationTypeImpl value,
          $Res Function(_$ApplicationTypeImpl) then) =
      __$$ApplicationTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'ApplicationName') String? name,
      @JsonKey(name: 'Descriptions') String? descriptions,
      @JsonKey(name: 'ProjectTypeID') int? projectTypeId});
}

/// @nodoc
class __$$ApplicationTypeImplCopyWithImpl<$Res>
    extends _$ApplicationTypeCopyWithImpl<$Res, _$ApplicationTypeImpl>
    implements _$$ApplicationTypeImplCopyWith<$Res> {
  __$$ApplicationTypeImplCopyWithImpl(
      _$ApplicationTypeImpl _value, $Res Function(_$ApplicationTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? descriptions = freezed,
    Object? projectTypeId = freezed,
  }) {
    return _then(_$ApplicationTypeImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptions: freezed == descriptions
          ? _value.descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as String?,
      projectTypeId: freezed == projectTypeId
          ? _value.projectTypeId
          : projectTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApplicationTypeImpl implements _ApplicationType {
  const _$ApplicationTypeImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'ApplicationName') this.name,
      @JsonKey(name: 'Descriptions') this.descriptions,
      @JsonKey(name: 'ProjectTypeID') this.projectTypeId});

  factory _$ApplicationTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApplicationTypeImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'ApplicationName')
  final String? name;
  @override
  @JsonKey(name: 'Descriptions')
  final String? descriptions;
  @override
  @JsonKey(name: 'ProjectTypeID')
  final int? projectTypeId;

  @override
  String toString() {
    return 'ApplicationType(id: $id, name: $name, descriptions: $descriptions, projectTypeId: $projectTypeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.descriptions, descriptions) ||
                other.descriptions == descriptions) &&
            (identical(other.projectTypeId, projectTypeId) ||
                other.projectTypeId == projectTypeId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, descriptions, projectTypeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationTypeImplCopyWith<_$ApplicationTypeImpl> get copyWith =>
      __$$ApplicationTypeImplCopyWithImpl<_$ApplicationTypeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApplicationTypeImplToJson(
      this,
    );
  }
}

abstract class _ApplicationType implements ApplicationType {
  const factory _ApplicationType(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'ApplicationName') final String? name,
          @JsonKey(name: 'Descriptions') final String? descriptions,
          @JsonKey(name: 'ProjectTypeID') final int? projectTypeId}) =
      _$ApplicationTypeImpl;

  factory _ApplicationType.fromJson(Map<String, dynamic> json) =
      _$ApplicationTypeImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'ApplicationName')
  String? get name;
  @override
  @JsonKey(name: 'Descriptions')
  String? get descriptions;
  @override
  @JsonKey(name: 'ProjectTypeID')
  int? get projectTypeId;
  @override
  @JsonKey(ignore: true)
  _$$ApplicationTypeImplCopyWith<_$ApplicationTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Technology _$TechnologyFromJson(Map<String, dynamic> json) {
  return _Technology.fromJson(json);
}

/// @nodoc
mixin _$Technology {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'TechnologyName')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'Descriptions')
  String? get descriptions => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectTypeID')
  int? get projectTypeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TechnologyCopyWith<Technology> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TechnologyCopyWith<$Res> {
  factory $TechnologyCopyWith(
          Technology value, $Res Function(Technology) then) =
      _$TechnologyCopyWithImpl<$Res, Technology>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'TechnologyName') String? name,
      @JsonKey(name: 'Descriptions') String? descriptions,
      @JsonKey(name: 'ProjectTypeID') int? projectTypeId});
}

/// @nodoc
class _$TechnologyCopyWithImpl<$Res, $Val extends Technology>
    implements $TechnologyCopyWith<$Res> {
  _$TechnologyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? descriptions = freezed,
    Object? projectTypeId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptions: freezed == descriptions
          ? _value.descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as String?,
      projectTypeId: freezed == projectTypeId
          ? _value.projectTypeId
          : projectTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TechnologyImplCopyWith<$Res>
    implements $TechnologyCopyWith<$Res> {
  factory _$$TechnologyImplCopyWith(
          _$TechnologyImpl value, $Res Function(_$TechnologyImpl) then) =
      __$$TechnologyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'TechnologyName') String? name,
      @JsonKey(name: 'Descriptions') String? descriptions,
      @JsonKey(name: 'ProjectTypeID') int? projectTypeId});
}

/// @nodoc
class __$$TechnologyImplCopyWithImpl<$Res>
    extends _$TechnologyCopyWithImpl<$Res, _$TechnologyImpl>
    implements _$$TechnologyImplCopyWith<$Res> {
  __$$TechnologyImplCopyWithImpl(
      _$TechnologyImpl _value, $Res Function(_$TechnologyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? descriptions = freezed,
    Object? projectTypeId = freezed,
  }) {
    return _then(_$TechnologyImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptions: freezed == descriptions
          ? _value.descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as String?,
      projectTypeId: freezed == projectTypeId
          ? _value.projectTypeId
          : projectTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TechnologyImpl implements _Technology {
  const _$TechnologyImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'TechnologyName') this.name,
      @JsonKey(name: 'Descriptions') this.descriptions,
      @JsonKey(name: 'ProjectTypeID') this.projectTypeId});

  factory _$TechnologyImpl.fromJson(Map<String, dynamic> json) =>
      _$$TechnologyImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'TechnologyName')
  final String? name;
  @override
  @JsonKey(name: 'Descriptions')
  final String? descriptions;
  @override
  @JsonKey(name: 'ProjectTypeID')
  final int? projectTypeId;

  @override
  String toString() {
    return 'Technology(id: $id, name: $name, descriptions: $descriptions, projectTypeId: $projectTypeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TechnologyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.descriptions, descriptions) ||
                other.descriptions == descriptions) &&
            (identical(other.projectTypeId, projectTypeId) ||
                other.projectTypeId == projectTypeId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, descriptions, projectTypeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TechnologyImplCopyWith<_$TechnologyImpl> get copyWith =>
      __$$TechnologyImplCopyWithImpl<_$TechnologyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TechnologyImplToJson(
      this,
    );
  }
}

abstract class _Technology implements Technology {
  const factory _Technology(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'TechnologyName') final String? name,
          @JsonKey(name: 'Descriptions') final String? descriptions,
          @JsonKey(name: 'ProjectTypeID') final int? projectTypeId}) =
      _$TechnologyImpl;

  factory _Technology.fromJson(Map<String, dynamic> json) =
      _$TechnologyImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'TechnologyName')
  String? get name;
  @override
  @JsonKey(name: 'Descriptions')
  String? get descriptions;
  @override
  @JsonKey(name: 'ProjectTypeID')
  int? get projectTypeId;
  @override
  @JsonKey(ignore: true)
  _$$TechnologyImplCopyWith<_$TechnologyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectModalItem _$ProjectModalItemFromJson(Map<String, dynamic> json) {
  return _ProjectModalItem.fromJson(json);
}

/// @nodoc
mixin _$ProjectModalItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerID')
  int? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectCode')
  String? get projectCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectName')
  String? get projectName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectShortName')
  String? get projectShortName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectStatus')
  int? get projectStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserID')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserTechnicalID')
  int? get userTechnicalId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectType')
  int? get projectType => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectManager')
  int? get projectManager => throw _privateConstructorUsedError;
  @JsonKey(name: 'Priotity')
  double? get priority => throw _privateConstructorUsedError;
  @JsonKey(name: 'EndUser')
  int? get endUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'BusinessFieldID')
  int? get businessFieldId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeProject')
  int? get typeProject => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  String? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  String? get updatedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectModalItemCopyWith<ProjectModalItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectModalItemCopyWith<$Res> {
  factory $ProjectModalItemCopyWith(
          ProjectModalItem value, $Res Function(ProjectModalItem) then) =
      _$ProjectModalItemCopyWithImpl<$Res, ProjectModalItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'CustomerID') int? customerId,
      @JsonKey(name: 'ProjectCode') String? projectCode,
      @JsonKey(name: 'ProjectName') String? projectName,
      @JsonKey(name: 'ProjectShortName') String? projectShortName,
      @JsonKey(name: 'ProjectStatus') int? projectStatus,
      @JsonKey(name: 'UserID') int? userId,
      @JsonKey(name: 'UserTechnicalID') int? userTechnicalId,
      @JsonKey(name: 'ProjectType') int? projectType,
      @JsonKey(name: 'ProjectManager') int? projectManager,
      @JsonKey(name: 'Priotity') double? priority,
      @JsonKey(name: 'EndUser') int? endUser,
      @JsonKey(name: 'BusinessFieldID') int? businessFieldId,
      @JsonKey(name: 'TypeProject') int? typeProject,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') String? updatedDate});
}

/// @nodoc
class _$ProjectModalItemCopyWithImpl<$Res, $Val extends ProjectModalItem>
    implements $ProjectModalItemCopyWith<$Res> {
  _$ProjectModalItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? customerId = freezed,
    Object? projectCode = freezed,
    Object? projectName = freezed,
    Object? projectShortName = freezed,
    Object? projectStatus = freezed,
    Object? userId = freezed,
    Object? userTechnicalId = freezed,
    Object? projectType = freezed,
    Object? projectManager = freezed,
    Object? priority = freezed,
    Object? endUser = freezed,
    Object? businessFieldId = freezed,
    Object? typeProject = freezed,
    Object? isDeleted = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectCode: freezed == projectCode
          ? _value.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: freezed == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      projectShortName: freezed == projectShortName
          ? _value.projectShortName
          : projectShortName // ignore: cast_nullable_to_non_nullable
              as String?,
      projectStatus: freezed == projectStatus
          ? _value.projectStatus
          : projectStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      userTechnicalId: freezed == userTechnicalId
          ? _value.userTechnicalId
          : userTechnicalId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectType: freezed == projectType
          ? _value.projectType
          : projectType // ignore: cast_nullable_to_non_nullable
              as int?,
      projectManager: freezed == projectManager
          ? _value.projectManager
          : projectManager // ignore: cast_nullable_to_non_nullable
              as int?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as double?,
      endUser: freezed == endUser
          ? _value.endUser
          : endUser // ignore: cast_nullable_to_non_nullable
              as int?,
      businessFieldId: freezed == businessFieldId
          ? _value.businessFieldId
          : businessFieldId // ignore: cast_nullable_to_non_nullable
              as int?,
      typeProject: freezed == typeProject
          ? _value.typeProject
          : typeProject // ignore: cast_nullable_to_non_nullable
              as int?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectModalItemImplCopyWith<$Res>
    implements $ProjectModalItemCopyWith<$Res> {
  factory _$$ProjectModalItemImplCopyWith(_$ProjectModalItemImpl value,
          $Res Function(_$ProjectModalItemImpl) then) =
      __$$ProjectModalItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'CustomerID') int? customerId,
      @JsonKey(name: 'ProjectCode') String? projectCode,
      @JsonKey(name: 'ProjectName') String? projectName,
      @JsonKey(name: 'ProjectShortName') String? projectShortName,
      @JsonKey(name: 'ProjectStatus') int? projectStatus,
      @JsonKey(name: 'UserID') int? userId,
      @JsonKey(name: 'UserTechnicalID') int? userTechnicalId,
      @JsonKey(name: 'ProjectType') int? projectType,
      @JsonKey(name: 'ProjectManager') int? projectManager,
      @JsonKey(name: 'Priotity') double? priority,
      @JsonKey(name: 'EndUser') int? endUser,
      @JsonKey(name: 'BusinessFieldID') int? businessFieldId,
      @JsonKey(name: 'TypeProject') int? typeProject,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') String? updatedDate});
}

/// @nodoc
class __$$ProjectModalItemImplCopyWithImpl<$Res>
    extends _$ProjectModalItemCopyWithImpl<$Res, _$ProjectModalItemImpl>
    implements _$$ProjectModalItemImplCopyWith<$Res> {
  __$$ProjectModalItemImplCopyWithImpl(_$ProjectModalItemImpl _value,
      $Res Function(_$ProjectModalItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? customerId = freezed,
    Object? projectCode = freezed,
    Object? projectName = freezed,
    Object? projectShortName = freezed,
    Object? projectStatus = freezed,
    Object? userId = freezed,
    Object? userTechnicalId = freezed,
    Object? projectType = freezed,
    Object? projectManager = freezed,
    Object? priority = freezed,
    Object? endUser = freezed,
    Object? businessFieldId = freezed,
    Object? typeProject = freezed,
    Object? isDeleted = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
  }) {
    return _then(_$ProjectModalItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectCode: freezed == projectCode
          ? _value.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: freezed == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      projectShortName: freezed == projectShortName
          ? _value.projectShortName
          : projectShortName // ignore: cast_nullable_to_non_nullable
              as String?,
      projectStatus: freezed == projectStatus
          ? _value.projectStatus
          : projectStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      userTechnicalId: freezed == userTechnicalId
          ? _value.userTechnicalId
          : userTechnicalId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectType: freezed == projectType
          ? _value.projectType
          : projectType // ignore: cast_nullable_to_non_nullable
              as int?,
      projectManager: freezed == projectManager
          ? _value.projectManager
          : projectManager // ignore: cast_nullable_to_non_nullable
              as int?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as double?,
      endUser: freezed == endUser
          ? _value.endUser
          : endUser // ignore: cast_nullable_to_non_nullable
              as int?,
      businessFieldId: freezed == businessFieldId
          ? _value.businessFieldId
          : businessFieldId // ignore: cast_nullable_to_non_nullable
              as int?,
      typeProject: freezed == typeProject
          ? _value.typeProject
          : typeProject // ignore: cast_nullable_to_non_nullable
              as int?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectModalItemImpl implements _ProjectModalItem {
  const _$ProjectModalItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'CustomerID') this.customerId,
      @JsonKey(name: 'ProjectCode') this.projectCode,
      @JsonKey(name: 'ProjectName') this.projectName,
      @JsonKey(name: 'ProjectShortName') this.projectShortName,
      @JsonKey(name: 'ProjectStatus') this.projectStatus,
      @JsonKey(name: 'UserID') this.userId,
      @JsonKey(name: 'UserTechnicalID') this.userTechnicalId,
      @JsonKey(name: 'ProjectType') this.projectType,
      @JsonKey(name: 'ProjectManager') this.projectManager,
      @JsonKey(name: 'Priotity') this.priority,
      @JsonKey(name: 'EndUser') this.endUser,
      @JsonKey(name: 'BusinessFieldID') this.businessFieldId,
      @JsonKey(name: 'TypeProject') this.typeProject,
      @JsonKey(name: 'IsDeleted') this.isDeleted,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate});

  factory _$ProjectModalItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectModalItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'CustomerID')
  final int? customerId;
  @override
  @JsonKey(name: 'ProjectCode')
  final String? projectCode;
  @override
  @JsonKey(name: 'ProjectName')
  final String? projectName;
  @override
  @JsonKey(name: 'ProjectShortName')
  final String? projectShortName;
  @override
  @JsonKey(name: 'ProjectStatus')
  final int? projectStatus;
  @override
  @JsonKey(name: 'UserID')
  final int? userId;
  @override
  @JsonKey(name: 'UserTechnicalID')
  final int? userTechnicalId;
  @override
  @JsonKey(name: 'ProjectType')
  final int? projectType;
  @override
  @JsonKey(name: 'ProjectManager')
  final int? projectManager;
  @override
  @JsonKey(name: 'Priotity')
  final double? priority;
  @override
  @JsonKey(name: 'EndUser')
  final int? endUser;
  @override
  @JsonKey(name: 'BusinessFieldID')
  final int? businessFieldId;
  @override
  @JsonKey(name: 'TypeProject')
  final int? typeProject;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'CreatedDate')
  final String? createdDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  final String? updatedBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  final String? updatedDate;

  @override
  String toString() {
    return 'ProjectModalItem(id: $id, customerId: $customerId, projectCode: $projectCode, projectName: $projectName, projectShortName: $projectShortName, projectStatus: $projectStatus, userId: $userId, userTechnicalId: $userTechnicalId, projectType: $projectType, projectManager: $projectManager, priority: $priority, endUser: $endUser, businessFieldId: $businessFieldId, typeProject: $typeProject, isDeleted: $isDeleted, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectModalItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.projectCode, projectCode) ||
                other.projectCode == projectCode) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.projectShortName, projectShortName) ||
                other.projectShortName == projectShortName) &&
            (identical(other.projectStatus, projectStatus) ||
                other.projectStatus == projectStatus) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userTechnicalId, userTechnicalId) ||
                other.userTechnicalId == userTechnicalId) &&
            (identical(other.projectType, projectType) ||
                other.projectType == projectType) &&
            (identical(other.projectManager, projectManager) ||
                other.projectManager == projectManager) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.endUser, endUser) || other.endUser == endUser) &&
            (identical(other.businessFieldId, businessFieldId) ||
                other.businessFieldId == businessFieldId) &&
            (identical(other.typeProject, typeProject) ||
                other.typeProject == typeProject) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        customerId,
        projectCode,
        projectName,
        projectShortName,
        projectStatus,
        userId,
        userTechnicalId,
        projectType,
        projectManager,
        priority,
        endUser,
        businessFieldId,
        typeProject,
        isDeleted,
        createdBy,
        createdDate,
        updatedBy,
        updatedDate
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectModalItemImplCopyWith<_$ProjectModalItemImpl> get copyWith =>
      __$$ProjectModalItemImplCopyWithImpl<_$ProjectModalItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectModalItemImplToJson(
      this,
    );
  }
}

abstract class _ProjectModalItem implements ProjectModalItem {
  const factory _ProjectModalItem(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'CustomerID') final int? customerId,
          @JsonKey(name: 'ProjectCode') final String? projectCode,
          @JsonKey(name: 'ProjectName') final String? projectName,
          @JsonKey(name: 'ProjectShortName') final String? projectShortName,
          @JsonKey(name: 'ProjectStatus') final int? projectStatus,
          @JsonKey(name: 'UserID') final int? userId,
          @JsonKey(name: 'UserTechnicalID') final int? userTechnicalId,
          @JsonKey(name: 'ProjectType') final int? projectType,
          @JsonKey(name: 'ProjectManager') final int? projectManager,
          @JsonKey(name: 'Priotity') final double? priority,
          @JsonKey(name: 'EndUser') final int? endUser,
          @JsonKey(name: 'BusinessFieldID') final int? businessFieldId,
          @JsonKey(name: 'TypeProject') final int? typeProject,
          @JsonKey(name: 'IsDeleted') final bool? isDeleted,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'CreatedDate') final String? createdDate,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy,
          @JsonKey(name: 'UpdatedDate') final String? updatedDate}) =
      _$ProjectModalItemImpl;

  factory _ProjectModalItem.fromJson(Map<String, dynamic> json) =
      _$ProjectModalItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'CustomerID')
  int? get customerId;
  @override
  @JsonKey(name: 'ProjectCode')
  String? get projectCode;
  @override
  @JsonKey(name: 'ProjectName')
  String? get projectName;
  @override
  @JsonKey(name: 'ProjectShortName')
  String? get projectShortName;
  @override
  @JsonKey(name: 'ProjectStatus')
  int? get projectStatus;
  @override
  @JsonKey(name: 'UserID')
  int? get userId;
  @override
  @JsonKey(name: 'UserTechnicalID')
  int? get userTechnicalId;
  @override
  @JsonKey(name: 'ProjectType')
  int? get projectType;
  @override
  @JsonKey(name: 'ProjectManager')
  int? get projectManager;
  @override
  @JsonKey(name: 'Priotity')
  double? get priority;
  @override
  @JsonKey(name: 'EndUser')
  int? get endUser;
  @override
  @JsonKey(name: 'BusinessFieldID')
  int? get businessFieldId;
  @override
  @JsonKey(name: 'TypeProject')
  int? get typeProject;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'CreatedDate')
  String? get createdDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  String? get updatedDate;
  @override
  @JsonKey(ignore: true)
  _$$ProjectModalItemImplCopyWith<_$ProjectModalItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
