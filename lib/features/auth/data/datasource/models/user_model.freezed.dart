// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: 'EmployeeID')
  int get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentID')
  int get departmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullName')
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'LoginName')
  String get loginName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsAdmin')
  bool get isAdmin => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsAdminSale')
  int get isAdminSale => throw _privateConstructorUsedError;
  @JsonKey(name: 'MainViewID')
  int get mainViewId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentName')
  String get departmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'HeadofDepartment')
  String get headofDepartment => throw _privateConstructorUsedError;
  @JsonKey(name: 'AnhCBNV')
  String get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusEmployee')
  String get statusEmployee => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusUser')
  String get statusUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'PositionName')
  String get positionName => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserGroupID')
  int get userGroupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PositionID')
  int get positionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'GioiTinh')
  int get gioiTinh => throw _privateConstructorUsedError;
  @JsonKey(name: 'PositionCode')
  String get positionCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentCode')
  String get departmentCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsBusinessCost')
  bool get isBusinessCost => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsLeader')
  int get isLeader => throw _privateConstructorUsedError;
  @JsonKey(name: 'TeamOfUser')
  int get teamOfUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'Permissions')
  String get permissions => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'PasswordHash')
  String get passwordHash => throw _privateConstructorUsedError;
  @JsonKey(name: 'LeaderID')
  int get leaderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxCompanyID')
  int get taxCompanyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ImagePath')
  String? get imagePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: 'EmployeeID') int employeeId,
      @JsonKey(name: 'ID') int id,
      @JsonKey(name: 'DepartmentID') int departmentId,
      @JsonKey(name: 'Code') String code,
      @JsonKey(name: 'FullName') String fullName,
      @JsonKey(name: 'LoginName') String loginName,
      @JsonKey(name: 'IsAdmin') bool isAdmin,
      @JsonKey(name: 'IsAdminSale') int isAdminSale,
      @JsonKey(name: 'MainViewID') int mainViewId,
      @JsonKey(name: 'DepartmentName') String departmentName,
      @JsonKey(name: 'HeadofDepartment') String headofDepartment,
      @JsonKey(name: 'AnhCBNV') String avatar,
      @JsonKey(name: 'StatusEmployee') String statusEmployee,
      @JsonKey(name: 'StatusUser') String statusUser,
      @JsonKey(name: 'PositionName') String positionName,
      @JsonKey(name: 'UserGroupID') int userGroupId,
      @JsonKey(name: 'PositionID') int positionId,
      @JsonKey(name: 'GioiTinh') int gioiTinh,
      @JsonKey(name: 'PositionCode') String positionCode,
      @JsonKey(name: 'DepartmentCode') String departmentCode,
      @JsonKey(name: 'IsBusinessCost') bool isBusinessCost,
      @JsonKey(name: 'IsLeader') int isLeader,
      @JsonKey(name: 'TeamOfUser') int teamOfUser,
      @JsonKey(name: 'Permissions') String permissions,
      @JsonKey(name: 'Name') String name,
      @JsonKey(name: 'PasswordHash') String passwordHash,
      @JsonKey(name: 'LeaderID') int leaderId,
      @JsonKey(name: 'TaxCompanyID') int taxCompanyId,
      @JsonKey(name: 'ImagePath') String? imagePath});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeId = null,
    Object? id = null,
    Object? departmentId = null,
    Object? code = null,
    Object? fullName = null,
    Object? loginName = null,
    Object? isAdmin = null,
    Object? isAdminSale = null,
    Object? mainViewId = null,
    Object? departmentName = null,
    Object? headofDepartment = null,
    Object? avatar = null,
    Object? statusEmployee = null,
    Object? statusUser = null,
    Object? positionName = null,
    Object? userGroupId = null,
    Object? positionId = null,
    Object? gioiTinh = null,
    Object? positionCode = null,
    Object? departmentCode = null,
    Object? isBusinessCost = null,
    Object? isLeader = null,
    Object? teamOfUser = null,
    Object? permissions = null,
    Object? name = null,
    Object? passwordHash = null,
    Object? leaderId = null,
    Object? taxCompanyId = null,
    Object? imagePath = freezed,
  }) {
    return _then(_value.copyWith(
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      loginName: null == loginName
          ? _value.loginName
          : loginName // ignore: cast_nullable_to_non_nullable
              as String,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      isAdminSale: null == isAdminSale
          ? _value.isAdminSale
          : isAdminSale // ignore: cast_nullable_to_non_nullable
              as int,
      mainViewId: null == mainViewId
          ? _value.mainViewId
          : mainViewId // ignore: cast_nullable_to_non_nullable
              as int,
      departmentName: null == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String,
      headofDepartment: null == headofDepartment
          ? _value.headofDepartment
          : headofDepartment // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      statusEmployee: null == statusEmployee
          ? _value.statusEmployee
          : statusEmployee // ignore: cast_nullable_to_non_nullable
              as String,
      statusUser: null == statusUser
          ? _value.statusUser
          : statusUser // ignore: cast_nullable_to_non_nullable
              as String,
      positionName: null == positionName
          ? _value.positionName
          : positionName // ignore: cast_nullable_to_non_nullable
              as String,
      userGroupId: null == userGroupId
          ? _value.userGroupId
          : userGroupId // ignore: cast_nullable_to_non_nullable
              as int,
      positionId: null == positionId
          ? _value.positionId
          : positionId // ignore: cast_nullable_to_non_nullable
              as int,
      gioiTinh: null == gioiTinh
          ? _value.gioiTinh
          : gioiTinh // ignore: cast_nullable_to_non_nullable
              as int,
      positionCode: null == positionCode
          ? _value.positionCode
          : positionCode // ignore: cast_nullable_to_non_nullable
              as String,
      departmentCode: null == departmentCode
          ? _value.departmentCode
          : departmentCode // ignore: cast_nullable_to_non_nullable
              as String,
      isBusinessCost: null == isBusinessCost
          ? _value.isBusinessCost
          : isBusinessCost // ignore: cast_nullable_to_non_nullable
              as bool,
      isLeader: null == isLeader
          ? _value.isLeader
          : isLeader // ignore: cast_nullable_to_non_nullable
              as int,
      teamOfUser: null == teamOfUser
          ? _value.teamOfUser
          : teamOfUser // ignore: cast_nullable_to_non_nullable
              as int,
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      passwordHash: null == passwordHash
          ? _value.passwordHash
          : passwordHash // ignore: cast_nullable_to_non_nullable
              as String,
      leaderId: null == leaderId
          ? _value.leaderId
          : leaderId // ignore: cast_nullable_to_non_nullable
              as int,
      taxCompanyId: null == taxCompanyId
          ? _value.taxCompanyId
          : taxCompanyId // ignore: cast_nullable_to_non_nullable
              as int,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'EmployeeID') int employeeId,
      @JsonKey(name: 'ID') int id,
      @JsonKey(name: 'DepartmentID') int departmentId,
      @JsonKey(name: 'Code') String code,
      @JsonKey(name: 'FullName') String fullName,
      @JsonKey(name: 'LoginName') String loginName,
      @JsonKey(name: 'IsAdmin') bool isAdmin,
      @JsonKey(name: 'IsAdminSale') int isAdminSale,
      @JsonKey(name: 'MainViewID') int mainViewId,
      @JsonKey(name: 'DepartmentName') String departmentName,
      @JsonKey(name: 'HeadofDepartment') String headofDepartment,
      @JsonKey(name: 'AnhCBNV') String avatar,
      @JsonKey(name: 'StatusEmployee') String statusEmployee,
      @JsonKey(name: 'StatusUser') String statusUser,
      @JsonKey(name: 'PositionName') String positionName,
      @JsonKey(name: 'UserGroupID') int userGroupId,
      @JsonKey(name: 'PositionID') int positionId,
      @JsonKey(name: 'GioiTinh') int gioiTinh,
      @JsonKey(name: 'PositionCode') String positionCode,
      @JsonKey(name: 'DepartmentCode') String departmentCode,
      @JsonKey(name: 'IsBusinessCost') bool isBusinessCost,
      @JsonKey(name: 'IsLeader') int isLeader,
      @JsonKey(name: 'TeamOfUser') int teamOfUser,
      @JsonKey(name: 'Permissions') String permissions,
      @JsonKey(name: 'Name') String name,
      @JsonKey(name: 'PasswordHash') String passwordHash,
      @JsonKey(name: 'LeaderID') int leaderId,
      @JsonKey(name: 'TaxCompanyID') int taxCompanyId,
      @JsonKey(name: 'ImagePath') String? imagePath});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeId = null,
    Object? id = null,
    Object? departmentId = null,
    Object? code = null,
    Object? fullName = null,
    Object? loginName = null,
    Object? isAdmin = null,
    Object? isAdminSale = null,
    Object? mainViewId = null,
    Object? departmentName = null,
    Object? headofDepartment = null,
    Object? avatar = null,
    Object? statusEmployee = null,
    Object? statusUser = null,
    Object? positionName = null,
    Object? userGroupId = null,
    Object? positionId = null,
    Object? gioiTinh = null,
    Object? positionCode = null,
    Object? departmentCode = null,
    Object? isBusinessCost = null,
    Object? isLeader = null,
    Object? teamOfUser = null,
    Object? permissions = null,
    Object? name = null,
    Object? passwordHash = null,
    Object? leaderId = null,
    Object? taxCompanyId = null,
    Object? imagePath = freezed,
  }) {
    return _then(_$UserImpl(
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      loginName: null == loginName
          ? _value.loginName
          : loginName // ignore: cast_nullable_to_non_nullable
              as String,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      isAdminSale: null == isAdminSale
          ? _value.isAdminSale
          : isAdminSale // ignore: cast_nullable_to_non_nullable
              as int,
      mainViewId: null == mainViewId
          ? _value.mainViewId
          : mainViewId // ignore: cast_nullable_to_non_nullable
              as int,
      departmentName: null == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String,
      headofDepartment: null == headofDepartment
          ? _value.headofDepartment
          : headofDepartment // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      statusEmployee: null == statusEmployee
          ? _value.statusEmployee
          : statusEmployee // ignore: cast_nullable_to_non_nullable
              as String,
      statusUser: null == statusUser
          ? _value.statusUser
          : statusUser // ignore: cast_nullable_to_non_nullable
              as String,
      positionName: null == positionName
          ? _value.positionName
          : positionName // ignore: cast_nullable_to_non_nullable
              as String,
      userGroupId: null == userGroupId
          ? _value.userGroupId
          : userGroupId // ignore: cast_nullable_to_non_nullable
              as int,
      positionId: null == positionId
          ? _value.positionId
          : positionId // ignore: cast_nullable_to_non_nullable
              as int,
      gioiTinh: null == gioiTinh
          ? _value.gioiTinh
          : gioiTinh // ignore: cast_nullable_to_non_nullable
              as int,
      positionCode: null == positionCode
          ? _value.positionCode
          : positionCode // ignore: cast_nullable_to_non_nullable
              as String,
      departmentCode: null == departmentCode
          ? _value.departmentCode
          : departmentCode // ignore: cast_nullable_to_non_nullable
              as String,
      isBusinessCost: null == isBusinessCost
          ? _value.isBusinessCost
          : isBusinessCost // ignore: cast_nullable_to_non_nullable
              as bool,
      isLeader: null == isLeader
          ? _value.isLeader
          : isLeader // ignore: cast_nullable_to_non_nullable
              as int,
      teamOfUser: null == teamOfUser
          ? _value.teamOfUser
          : teamOfUser // ignore: cast_nullable_to_non_nullable
              as int,
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      passwordHash: null == passwordHash
          ? _value.passwordHash
          : passwordHash // ignore: cast_nullable_to_non_nullable
              as String,
      leaderId: null == leaderId
          ? _value.leaderId
          : leaderId // ignore: cast_nullable_to_non_nullable
              as int,
      taxCompanyId: null == taxCompanyId
          ? _value.taxCompanyId
          : taxCompanyId // ignore: cast_nullable_to_non_nullable
              as int,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {@JsonKey(name: 'EmployeeID') required this.employeeId,
      @JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'DepartmentID') required this.departmentId,
      @JsonKey(name: 'Code') required this.code,
      @JsonKey(name: 'FullName') required this.fullName,
      @JsonKey(name: 'LoginName') required this.loginName,
      @JsonKey(name: 'IsAdmin') required this.isAdmin,
      @JsonKey(name: 'IsAdminSale') required this.isAdminSale,
      @JsonKey(name: 'MainViewID') required this.mainViewId,
      @JsonKey(name: 'DepartmentName') required this.departmentName,
      @JsonKey(name: 'HeadofDepartment') required this.headofDepartment,
      @JsonKey(name: 'AnhCBNV') required this.avatar,
      @JsonKey(name: 'StatusEmployee') required this.statusEmployee,
      @JsonKey(name: 'StatusUser') required this.statusUser,
      @JsonKey(name: 'PositionName') required this.positionName,
      @JsonKey(name: 'UserGroupID') required this.userGroupId,
      @JsonKey(name: 'PositionID') required this.positionId,
      @JsonKey(name: 'GioiTinh') required this.gioiTinh,
      @JsonKey(name: 'PositionCode') required this.positionCode,
      @JsonKey(name: 'DepartmentCode') required this.departmentCode,
      @JsonKey(name: 'IsBusinessCost') required this.isBusinessCost,
      @JsonKey(name: 'IsLeader') required this.isLeader,
      @JsonKey(name: 'TeamOfUser') required this.teamOfUser,
      @JsonKey(name: 'Permissions') required this.permissions,
      @JsonKey(name: 'Name') required this.name,
      @JsonKey(name: 'PasswordHash') required this.passwordHash,
      @JsonKey(name: 'LeaderID') required this.leaderId,
      @JsonKey(name: 'TaxCompanyID') required this.taxCompanyId,
      @JsonKey(name: 'ImagePath') this.imagePath});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(name: 'EmployeeID')
  final int employeeId;
  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'DepartmentID')
  final int departmentId;
  @override
  @JsonKey(name: 'Code')
  final String code;
  @override
  @JsonKey(name: 'FullName')
  final String fullName;
  @override
  @JsonKey(name: 'LoginName')
  final String loginName;
  @override
  @JsonKey(name: 'IsAdmin')
  final bool isAdmin;
  @override
  @JsonKey(name: 'IsAdminSale')
  final int isAdminSale;
  @override
  @JsonKey(name: 'MainViewID')
  final int mainViewId;
  @override
  @JsonKey(name: 'DepartmentName')
  final String departmentName;
  @override
  @JsonKey(name: 'HeadofDepartment')
  final String headofDepartment;
  @override
  @JsonKey(name: 'AnhCBNV')
  final String avatar;
  @override
  @JsonKey(name: 'StatusEmployee')
  final String statusEmployee;
  @override
  @JsonKey(name: 'StatusUser')
  final String statusUser;
  @override
  @JsonKey(name: 'PositionName')
  final String positionName;
  @override
  @JsonKey(name: 'UserGroupID')
  final int userGroupId;
  @override
  @JsonKey(name: 'PositionID')
  final int positionId;
  @override
  @JsonKey(name: 'GioiTinh')
  final int gioiTinh;
  @override
  @JsonKey(name: 'PositionCode')
  final String positionCode;
  @override
  @JsonKey(name: 'DepartmentCode')
  final String departmentCode;
  @override
  @JsonKey(name: 'IsBusinessCost')
  final bool isBusinessCost;
  @override
  @JsonKey(name: 'IsLeader')
  final int isLeader;
  @override
  @JsonKey(name: 'TeamOfUser')
  final int teamOfUser;
  @override
  @JsonKey(name: 'Permissions')
  final String permissions;
  @override
  @JsonKey(name: 'Name')
  final String name;
  @override
  @JsonKey(name: 'PasswordHash')
  final String passwordHash;
  @override
  @JsonKey(name: 'LeaderID')
  final int leaderId;
  @override
  @JsonKey(name: 'TaxCompanyID')
  final int taxCompanyId;
  @override
  @JsonKey(name: 'ImagePath')
  final String? imagePath;

  @override
  String toString() {
    return 'User(employeeId: $employeeId, id: $id, departmentId: $departmentId, code: $code, fullName: $fullName, loginName: $loginName, isAdmin: $isAdmin, isAdminSale: $isAdminSale, mainViewId: $mainViewId, departmentName: $departmentName, headofDepartment: $headofDepartment, avatar: $avatar, statusEmployee: $statusEmployee, statusUser: $statusUser, positionName: $positionName, userGroupId: $userGroupId, positionId: $positionId, gioiTinh: $gioiTinh, positionCode: $positionCode, departmentCode: $departmentCode, isBusinessCost: $isBusinessCost, isLeader: $isLeader, teamOfUser: $teamOfUser, permissions: $permissions, name: $name, passwordHash: $passwordHash, leaderId: $leaderId, taxCompanyId: $taxCompanyId, imagePath: $imagePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.loginName, loginName) ||
                other.loginName == loginName) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin) &&
            (identical(other.isAdminSale, isAdminSale) ||
                other.isAdminSale == isAdminSale) &&
            (identical(other.mainViewId, mainViewId) ||
                other.mainViewId == mainViewId) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.headofDepartment, headofDepartment) ||
                other.headofDepartment == headofDepartment) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.statusEmployee, statusEmployee) ||
                other.statusEmployee == statusEmployee) &&
            (identical(other.statusUser, statusUser) ||
                other.statusUser == statusUser) &&
            (identical(other.positionName, positionName) ||
                other.positionName == positionName) &&
            (identical(other.userGroupId, userGroupId) ||
                other.userGroupId == userGroupId) &&
            (identical(other.positionId, positionId) ||
                other.positionId == positionId) &&
            (identical(other.gioiTinh, gioiTinh) ||
                other.gioiTinh == gioiTinh) &&
            (identical(other.positionCode, positionCode) ||
                other.positionCode == positionCode) &&
            (identical(other.departmentCode, departmentCode) ||
                other.departmentCode == departmentCode) &&
            (identical(other.isBusinessCost, isBusinessCost) ||
                other.isBusinessCost == isBusinessCost) &&
            (identical(other.isLeader, isLeader) ||
                other.isLeader == isLeader) &&
            (identical(other.teamOfUser, teamOfUser) ||
                other.teamOfUser == teamOfUser) &&
            (identical(other.permissions, permissions) ||
                other.permissions == permissions) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.passwordHash, passwordHash) ||
                other.passwordHash == passwordHash) &&
            (identical(other.leaderId, leaderId) ||
                other.leaderId == leaderId) &&
            (identical(other.taxCompanyId, taxCompanyId) ||
                other.taxCompanyId == taxCompanyId) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        employeeId,
        id,
        departmentId,
        code,
        fullName,
        loginName,
        isAdmin,
        isAdminSale,
        mainViewId,
        departmentName,
        headofDepartment,
        avatar,
        statusEmployee,
        statusUser,
        positionName,
        userGroupId,
        positionId,
        gioiTinh,
        positionCode,
        departmentCode,
        isBusinessCost,
        isLeader,
        teamOfUser,
        permissions,
        name,
        passwordHash,
        leaderId,
        taxCompanyId,
        imagePath
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@JsonKey(name: 'EmployeeID') required final int employeeId,
      @JsonKey(name: 'ID') required final int id,
      @JsonKey(name: 'DepartmentID') required final int departmentId,
      @JsonKey(name: 'Code') required final String code,
      @JsonKey(name: 'FullName') required final String fullName,
      @JsonKey(name: 'LoginName') required final String loginName,
      @JsonKey(name: 'IsAdmin') required final bool isAdmin,
      @JsonKey(name: 'IsAdminSale') required final int isAdminSale,
      @JsonKey(name: 'MainViewID') required final int mainViewId,
      @JsonKey(name: 'DepartmentName') required final String departmentName,
      @JsonKey(name: 'HeadofDepartment') required final String headofDepartment,
      @JsonKey(name: 'AnhCBNV') required final String avatar,
      @JsonKey(name: 'StatusEmployee') required final String statusEmployee,
      @JsonKey(name: 'StatusUser') required final String statusUser,
      @JsonKey(name: 'PositionName') required final String positionName,
      @JsonKey(name: 'UserGroupID') required final int userGroupId,
      @JsonKey(name: 'PositionID') required final int positionId,
      @JsonKey(name: 'GioiTinh') required final int gioiTinh,
      @JsonKey(name: 'PositionCode') required final String positionCode,
      @JsonKey(name: 'DepartmentCode') required final String departmentCode,
      @JsonKey(name: 'IsBusinessCost') required final bool isBusinessCost,
      @JsonKey(name: 'IsLeader') required final int isLeader,
      @JsonKey(name: 'TeamOfUser') required final int teamOfUser,
      @JsonKey(name: 'Permissions') required final String permissions,
      @JsonKey(name: 'Name') required final String name,
      @JsonKey(name: 'PasswordHash') required final String passwordHash,
      @JsonKey(name: 'LeaderID') required final int leaderId,
      @JsonKey(name: 'TaxCompanyID') required final int taxCompanyId,
      @JsonKey(name: 'ImagePath') final String? imagePath}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(name: 'EmployeeID')
  int get employeeId;
  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'DepartmentID')
  int get departmentId;
  @override
  @JsonKey(name: 'Code')
  String get code;
  @override
  @JsonKey(name: 'FullName')
  String get fullName;
  @override
  @JsonKey(name: 'LoginName')
  String get loginName;
  @override
  @JsonKey(name: 'IsAdmin')
  bool get isAdmin;
  @override
  @JsonKey(name: 'IsAdminSale')
  int get isAdminSale;
  @override
  @JsonKey(name: 'MainViewID')
  int get mainViewId;
  @override
  @JsonKey(name: 'DepartmentName')
  String get departmentName;
  @override
  @JsonKey(name: 'HeadofDepartment')
  String get headofDepartment;
  @override
  @JsonKey(name: 'AnhCBNV')
  String get avatar;
  @override
  @JsonKey(name: 'StatusEmployee')
  String get statusEmployee;
  @override
  @JsonKey(name: 'StatusUser')
  String get statusUser;
  @override
  @JsonKey(name: 'PositionName')
  String get positionName;
  @override
  @JsonKey(name: 'UserGroupID')
  int get userGroupId;
  @override
  @JsonKey(name: 'PositionID')
  int get positionId;
  @override
  @JsonKey(name: 'GioiTinh')
  int get gioiTinh;
  @override
  @JsonKey(name: 'PositionCode')
  String get positionCode;
  @override
  @JsonKey(name: 'DepartmentCode')
  String get departmentCode;
  @override
  @JsonKey(name: 'IsBusinessCost')
  bool get isBusinessCost;
  @override
  @JsonKey(name: 'IsLeader')
  int get isLeader;
  @override
  @JsonKey(name: 'TeamOfUser')
  int get teamOfUser;
  @override
  @JsonKey(name: 'Permissions')
  String get permissions;
  @override
  @JsonKey(name: 'Name')
  String get name;
  @override
  @JsonKey(name: 'PasswordHash')
  String get passwordHash;
  @override
  @JsonKey(name: 'LeaderID')
  int get leaderId;
  @override
  @JsonKey(name: 'TaxCompanyID')
  int get taxCompanyId;
  @override
  @JsonKey(name: 'ImagePath')
  String? get imagePath;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UploadAvatarResponse _$UploadAvatarResponseFromJson(Map<String, dynamic> json) {
  return _UploadAvatarResponse.fromJson(json);
}

/// @nodoc
mixin _$UploadAvatarResponse {
  /// Tên file server đã lưu (vd: `avatar_emp_689_20260712172859.jpeg`).
  @JsonKey(name: 'SavedFileName')
  String get savedFileName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UploadAvatarResponseCopyWith<UploadAvatarResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadAvatarResponseCopyWith<$Res> {
  factory $UploadAvatarResponseCopyWith(UploadAvatarResponse value,
          $Res Function(UploadAvatarResponse) then) =
      _$UploadAvatarResponseCopyWithImpl<$Res, UploadAvatarResponse>;
  @useResult
  $Res call({@JsonKey(name: 'SavedFileName') String savedFileName});
}

/// @nodoc
class _$UploadAvatarResponseCopyWithImpl<$Res,
        $Val extends UploadAvatarResponse>
    implements $UploadAvatarResponseCopyWith<$Res> {
  _$UploadAvatarResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? savedFileName = null,
  }) {
    return _then(_value.copyWith(
      savedFileName: null == savedFileName
          ? _value.savedFileName
          : savedFileName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadAvatarResponseImplCopyWith<$Res>
    implements $UploadAvatarResponseCopyWith<$Res> {
  factory _$$UploadAvatarResponseImplCopyWith(_$UploadAvatarResponseImpl value,
          $Res Function(_$UploadAvatarResponseImpl) then) =
      __$$UploadAvatarResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'SavedFileName') String savedFileName});
}

/// @nodoc
class __$$UploadAvatarResponseImplCopyWithImpl<$Res>
    extends _$UploadAvatarResponseCopyWithImpl<$Res, _$UploadAvatarResponseImpl>
    implements _$$UploadAvatarResponseImplCopyWith<$Res> {
  __$$UploadAvatarResponseImplCopyWithImpl(_$UploadAvatarResponseImpl _value,
      $Res Function(_$UploadAvatarResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? savedFileName = null,
  }) {
    return _then(_$UploadAvatarResponseImpl(
      savedFileName: null == savedFileName
          ? _value.savedFileName
          : savedFileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadAvatarResponseImpl implements _UploadAvatarResponse {
  const _$UploadAvatarResponseImpl(
      {@JsonKey(name: 'SavedFileName') this.savedFileName = ''});

  factory _$UploadAvatarResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadAvatarResponseImplFromJson(json);

  /// Tên file server đã lưu (vd: `avatar_emp_689_20260712172859.jpeg`).
  @override
  @JsonKey(name: 'SavedFileName')
  final String savedFileName;

  @override
  String toString() {
    return 'UploadAvatarResponse(savedFileName: $savedFileName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadAvatarResponseImpl &&
            (identical(other.savedFileName, savedFileName) ||
                other.savedFileName == savedFileName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, savedFileName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadAvatarResponseImplCopyWith<_$UploadAvatarResponseImpl>
      get copyWith =>
          __$$UploadAvatarResponseImplCopyWithImpl<_$UploadAvatarResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadAvatarResponseImplToJson(
      this,
    );
  }
}

abstract class _UploadAvatarResponse implements UploadAvatarResponse {
  const factory _UploadAvatarResponse(
          {@JsonKey(name: 'SavedFileName') final String savedFileName}) =
      _$UploadAvatarResponseImpl;

  factory _UploadAvatarResponse.fromJson(Map<String, dynamic> json) =
      _$UploadAvatarResponseImpl.fromJson;

  @override

  /// Tên file server đã lưu (vd: `avatar_emp_689_20260712172859.jpeg`).
  @JsonKey(name: 'SavedFileName')
  String get savedFileName;
  @override
  @JsonKey(ignore: true)
  _$$UploadAvatarResponseImplCopyWith<_$UploadAvatarResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
