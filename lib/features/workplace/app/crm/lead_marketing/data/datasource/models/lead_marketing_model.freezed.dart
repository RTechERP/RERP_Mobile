// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lead_marketing_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LeadEmployee _$LeadEmployeeFromJson(Map<String, dynamic> json) {
  return _LeadEmployee.fromJson(json);
}

/// @nodoc
mixin _$LeadEmployee {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullName')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentID')
  int? get departmentId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadEmployeeCopyWith<LeadEmployee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadEmployeeCopyWith<$Res> {
  factory $LeadEmployeeCopyWith(
          LeadEmployee value, $Res Function(LeadEmployee) then) =
      _$LeadEmployeeCopyWithImpl<$Res, LeadEmployee>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'DepartmentID') int? departmentId});
}

/// @nodoc
class _$LeadEmployeeCopyWithImpl<$Res, $Val extends LeadEmployee>
    implements $LeadEmployeeCopyWith<$Res> {
  _$LeadEmployeeCopyWithImpl(this._value, this._then);

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
    Object? departmentId = freezed,
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
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeadEmployeeImplCopyWith<$Res>
    implements $LeadEmployeeCopyWith<$Res> {
  factory _$$LeadEmployeeImplCopyWith(
          _$LeadEmployeeImpl value, $Res Function(_$LeadEmployeeImpl) then) =
      __$$LeadEmployeeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'DepartmentID') int? departmentId});
}

/// @nodoc
class __$$LeadEmployeeImplCopyWithImpl<$Res>
    extends _$LeadEmployeeCopyWithImpl<$Res, _$LeadEmployeeImpl>
    implements _$$LeadEmployeeImplCopyWith<$Res> {
  __$$LeadEmployeeImplCopyWithImpl(
      _$LeadEmployeeImpl _value, $Res Function(_$LeadEmployeeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? fullName = freezed,
    Object? departmentId = freezed,
  }) {
    return _then(_$LeadEmployeeImpl(
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
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadEmployeeImpl implements _LeadEmployee {
  const _$LeadEmployeeImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'FullName') this.fullName,
      @JsonKey(name: 'DepartmentID') this.departmentId});

  factory _$LeadEmployeeImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadEmployeeImplFromJson(json);

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
  @JsonKey(name: 'DepartmentID')
  final int? departmentId;

  @override
  String toString() {
    return 'LeadEmployee(id: $id, code: $code, fullName: $fullName, departmentId: $departmentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadEmployeeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, code, fullName, departmentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadEmployeeImplCopyWith<_$LeadEmployeeImpl> get copyWith =>
      __$$LeadEmployeeImplCopyWithImpl<_$LeadEmployeeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadEmployeeImplToJson(
      this,
    );
  }
}

abstract class _LeadEmployee implements LeadEmployee {
  const factory _LeadEmployee(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'Code') final String? code,
          @JsonKey(name: 'FullName') final String? fullName,
          @JsonKey(name: 'DepartmentID') final int? departmentId}) =
      _$LeadEmployeeImpl;

  factory _LeadEmployee.fromJson(Map<String, dynamic> json) =
      _$LeadEmployeeImpl.fromJson;

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
  @JsonKey(name: 'DepartmentID')
  int? get departmentId;
  @override
  @JsonKey(ignore: true)
  _$$LeadEmployeeImplCopyWith<_$LeadEmployeeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadSource _$LeadSourceFromJson(Map<String, dynamic> json) {
  return _LeadSource.fromJson(json);
}

/// @nodoc
mixin _$LeadSource {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'SourceGroup')
  int? get sourceGroup => throw _privateConstructorUsedError;
  @JsonKey(name: 'STT')
  int? get stt => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadSourceCopyWith<LeadSource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadSourceCopyWith<$Res> {
  factory $LeadSourceCopyWith(
          LeadSource value, $Res Function(LeadSource) then) =
      _$LeadSourceCopyWithImpl<$Res, LeadSource>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'SourceGroup') int? sourceGroup,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'IsDeleted') bool? isDeleted});
}

/// @nodoc
class _$LeadSourceCopyWithImpl<$Res, $Val extends LeadSource>
    implements $LeadSourceCopyWith<$Res> {
  _$LeadSourceCopyWithImpl(this._value, this._then);

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
    Object? sourceGroup = freezed,
    Object? stt = freezed,
    Object? note = freezed,
    Object? isDeleted = freezed,
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
      sourceGroup: freezed == sourceGroup
          ? _value.sourceGroup
          : sourceGroup // ignore: cast_nullable_to_non_nullable
              as int?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeadSourceImplCopyWith<$Res>
    implements $LeadSourceCopyWith<$Res> {
  factory _$$LeadSourceImplCopyWith(
          _$LeadSourceImpl value, $Res Function(_$LeadSourceImpl) then) =
      __$$LeadSourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'SourceGroup') int? sourceGroup,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'IsDeleted') bool? isDeleted});
}

/// @nodoc
class __$$LeadSourceImplCopyWithImpl<$Res>
    extends _$LeadSourceCopyWithImpl<$Res, _$LeadSourceImpl>
    implements _$$LeadSourceImplCopyWith<$Res> {
  __$$LeadSourceImplCopyWithImpl(
      _$LeadSourceImpl _value, $Res Function(_$LeadSourceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? sourceGroup = freezed,
    Object? stt = freezed,
    Object? note = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_$LeadSourceImpl(
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
      sourceGroup: freezed == sourceGroup
          ? _value.sourceGroup
          : sourceGroup // ignore: cast_nullable_to_non_nullable
              as int?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadSourceImpl implements _LeadSource {
  const _$LeadSourceImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'Name') this.name,
      @JsonKey(name: 'SourceGroup') this.sourceGroup,
      @JsonKey(name: 'STT') this.stt,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'IsDeleted') this.isDeleted});

  factory _$LeadSourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadSourceImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'Code')
  final String? code;
  @override
  @JsonKey(name: 'Name')
  final String? name;
  @override
  @JsonKey(name: 'SourceGroup')
  final int? sourceGroup;
  @override
  @JsonKey(name: 'STT')
  final int? stt;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;

  @override
  String toString() {
    return 'LeadSource(id: $id, code: $code, name: $name, sourceGroup: $sourceGroup, stt: $stt, note: $note, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadSourceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sourceGroup, sourceGroup) ||
                other.sourceGroup == sourceGroup) &&
            (identical(other.stt, stt) || other.stt == stt) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, code, name, sourceGroup, stt, note, isDeleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadSourceImplCopyWith<_$LeadSourceImpl> get copyWith =>
      __$$LeadSourceImplCopyWithImpl<_$LeadSourceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadSourceImplToJson(
      this,
    );
  }
}

abstract class _LeadSource implements LeadSource {
  const factory _LeadSource(
      {@JsonKey(name: 'ID') final int? id,
      @JsonKey(name: 'Code') final String? code,
      @JsonKey(name: 'Name') final String? name,
      @JsonKey(name: 'SourceGroup') final int? sourceGroup,
      @JsonKey(name: 'STT') final int? stt,
      @JsonKey(name: 'Note') final String? note,
      @JsonKey(name: 'IsDeleted') final bool? isDeleted}) = _$LeadSourceImpl;

  factory _LeadSource.fromJson(Map<String, dynamic> json) =
      _$LeadSourceImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(name: 'Name')
  String? get name;
  @override
  @JsonKey(name: 'SourceGroup')
  int? get sourceGroup;
  @override
  @JsonKey(name: 'STT')
  int? get stt;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(ignore: true)
  _$$LeadSourceImplCopyWith<_$LeadSourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadRoleContext _$LeadRoleContextFromJson(Map<String, dynamic> json) {
  return _LeadRoleContext.fromJson(json);
}

/// @nodoc
mixin _$LeadRoleContext {
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsAdmin')
  bool? get isAdmin => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsMarketing')
  bool? get isMarketing => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsSale')
  bool? get isSale => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsSaleLeader')
  bool? get isSaleLeader => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsSaleAdmin')
  bool? get isSaleAdmin => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsBod')
  bool? get isBod => throw _privateConstructorUsedError;
  @JsonKey(name: 'TeamEmployeeIDs')
  List<int>? get teamEmployeeIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'CanViewMarketing')
  bool? get canViewMarketing => throw _privateConstructorUsedError;
  @JsonKey(name: 'CanViewSale')
  bool? get canViewSale => throw _privateConstructorUsedError;
  @JsonKey(name: 'CanAssign')
  bool? get canAssign => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadRoleContextCopyWith<LeadRoleContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadRoleContextCopyWith<$Res> {
  factory $LeadRoleContextCopyWith(
          LeadRoleContext value, $Res Function(LeadRoleContext) then) =
      _$LeadRoleContextCopyWithImpl<$Res, LeadRoleContext>;
  @useResult
  $Res call(
      {@JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'IsAdmin') bool? isAdmin,
      @JsonKey(name: 'IsMarketing') bool? isMarketing,
      @JsonKey(name: 'IsSale') bool? isSale,
      @JsonKey(name: 'IsSaleLeader') bool? isSaleLeader,
      @JsonKey(name: 'IsSaleAdmin') bool? isSaleAdmin,
      @JsonKey(name: 'IsBod') bool? isBod,
      @JsonKey(name: 'TeamEmployeeIDs') List<int>? teamEmployeeIds,
      @JsonKey(name: 'CanViewMarketing') bool? canViewMarketing,
      @JsonKey(name: 'CanViewSale') bool? canViewSale,
      @JsonKey(name: 'CanAssign') bool? canAssign});
}

/// @nodoc
class _$LeadRoleContextCopyWithImpl<$Res, $Val extends LeadRoleContext>
    implements $LeadRoleContextCopyWith<$Res> {
  _$LeadRoleContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeId = freezed,
    Object? isAdmin = freezed,
    Object? isMarketing = freezed,
    Object? isSale = freezed,
    Object? isSaleLeader = freezed,
    Object? isSaleAdmin = freezed,
    Object? isBod = freezed,
    Object? teamEmployeeIds = freezed,
    Object? canViewMarketing = freezed,
    Object? canViewSale = freezed,
    Object? canAssign = freezed,
  }) {
    return _then(_value.copyWith(
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      isAdmin: freezed == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMarketing: freezed == isMarketing
          ? _value.isMarketing
          : isMarketing // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSale: freezed == isSale
          ? _value.isSale
          : isSale // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSaleLeader: freezed == isSaleLeader
          ? _value.isSaleLeader
          : isSaleLeader // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSaleAdmin: freezed == isSaleAdmin
          ? _value.isSaleAdmin
          : isSaleAdmin // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBod: freezed == isBod
          ? _value.isBod
          : isBod // ignore: cast_nullable_to_non_nullable
              as bool?,
      teamEmployeeIds: freezed == teamEmployeeIds
          ? _value.teamEmployeeIds
          : teamEmployeeIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      canViewMarketing: freezed == canViewMarketing
          ? _value.canViewMarketing
          : canViewMarketing // ignore: cast_nullable_to_non_nullable
              as bool?,
      canViewSale: freezed == canViewSale
          ? _value.canViewSale
          : canViewSale // ignore: cast_nullable_to_non_nullable
              as bool?,
      canAssign: freezed == canAssign
          ? _value.canAssign
          : canAssign // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeadRoleContextImplCopyWith<$Res>
    implements $LeadRoleContextCopyWith<$Res> {
  factory _$$LeadRoleContextImplCopyWith(_$LeadRoleContextImpl value,
          $Res Function(_$LeadRoleContextImpl) then) =
      __$$LeadRoleContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'IsAdmin') bool? isAdmin,
      @JsonKey(name: 'IsMarketing') bool? isMarketing,
      @JsonKey(name: 'IsSale') bool? isSale,
      @JsonKey(name: 'IsSaleLeader') bool? isSaleLeader,
      @JsonKey(name: 'IsSaleAdmin') bool? isSaleAdmin,
      @JsonKey(name: 'IsBod') bool? isBod,
      @JsonKey(name: 'TeamEmployeeIDs') List<int>? teamEmployeeIds,
      @JsonKey(name: 'CanViewMarketing') bool? canViewMarketing,
      @JsonKey(name: 'CanViewSale') bool? canViewSale,
      @JsonKey(name: 'CanAssign') bool? canAssign});
}

/// @nodoc
class __$$LeadRoleContextImplCopyWithImpl<$Res>
    extends _$LeadRoleContextCopyWithImpl<$Res, _$LeadRoleContextImpl>
    implements _$$LeadRoleContextImplCopyWith<$Res> {
  __$$LeadRoleContextImplCopyWithImpl(
      _$LeadRoleContextImpl _value, $Res Function(_$LeadRoleContextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeId = freezed,
    Object? isAdmin = freezed,
    Object? isMarketing = freezed,
    Object? isSale = freezed,
    Object? isSaleLeader = freezed,
    Object? isSaleAdmin = freezed,
    Object? isBod = freezed,
    Object? teamEmployeeIds = freezed,
    Object? canViewMarketing = freezed,
    Object? canViewSale = freezed,
    Object? canAssign = freezed,
  }) {
    return _then(_$LeadRoleContextImpl(
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      isAdmin: freezed == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMarketing: freezed == isMarketing
          ? _value.isMarketing
          : isMarketing // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSale: freezed == isSale
          ? _value.isSale
          : isSale // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSaleLeader: freezed == isSaleLeader
          ? _value.isSaleLeader
          : isSaleLeader // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSaleAdmin: freezed == isSaleAdmin
          ? _value.isSaleAdmin
          : isSaleAdmin // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBod: freezed == isBod
          ? _value.isBod
          : isBod // ignore: cast_nullable_to_non_nullable
              as bool?,
      teamEmployeeIds: freezed == teamEmployeeIds
          ? _value._teamEmployeeIds
          : teamEmployeeIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      canViewMarketing: freezed == canViewMarketing
          ? _value.canViewMarketing
          : canViewMarketing // ignore: cast_nullable_to_non_nullable
              as bool?,
      canViewSale: freezed == canViewSale
          ? _value.canViewSale
          : canViewSale // ignore: cast_nullable_to_non_nullable
              as bool?,
      canAssign: freezed == canAssign
          ? _value.canAssign
          : canAssign // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadRoleContextImpl implements _LeadRoleContext {
  const _$LeadRoleContextImpl(
      {@JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'IsAdmin') this.isAdmin,
      @JsonKey(name: 'IsMarketing') this.isMarketing,
      @JsonKey(name: 'IsSale') this.isSale,
      @JsonKey(name: 'IsSaleLeader') this.isSaleLeader,
      @JsonKey(name: 'IsSaleAdmin') this.isSaleAdmin,
      @JsonKey(name: 'IsBod') this.isBod,
      @JsonKey(name: 'TeamEmployeeIDs') final List<int>? teamEmployeeIds,
      @JsonKey(name: 'CanViewMarketing') this.canViewMarketing,
      @JsonKey(name: 'CanViewSale') this.canViewSale,
      @JsonKey(name: 'CanAssign') this.canAssign})
      : _teamEmployeeIds = teamEmployeeIds;

  factory _$LeadRoleContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadRoleContextImplFromJson(json);

  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;
  @override
  @JsonKey(name: 'IsAdmin')
  final bool? isAdmin;
  @override
  @JsonKey(name: 'IsMarketing')
  final bool? isMarketing;
  @override
  @JsonKey(name: 'IsSale')
  final bool? isSale;
  @override
  @JsonKey(name: 'IsSaleLeader')
  final bool? isSaleLeader;
  @override
  @JsonKey(name: 'IsSaleAdmin')
  final bool? isSaleAdmin;
  @override
  @JsonKey(name: 'IsBod')
  final bool? isBod;
  final List<int>? _teamEmployeeIds;
  @override
  @JsonKey(name: 'TeamEmployeeIDs')
  List<int>? get teamEmployeeIds {
    final value = _teamEmployeeIds;
    if (value == null) return null;
    if (_teamEmployeeIds is EqualUnmodifiableListView) return _teamEmployeeIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'CanViewMarketing')
  final bool? canViewMarketing;
  @override
  @JsonKey(name: 'CanViewSale')
  final bool? canViewSale;
  @override
  @JsonKey(name: 'CanAssign')
  final bool? canAssign;

  @override
  String toString() {
    return 'LeadRoleContext(employeeId: $employeeId, isAdmin: $isAdmin, isMarketing: $isMarketing, isSale: $isSale, isSaleLeader: $isSaleLeader, isSaleAdmin: $isSaleAdmin, isBod: $isBod, teamEmployeeIds: $teamEmployeeIds, canViewMarketing: $canViewMarketing, canViewSale: $canViewSale, canAssign: $canAssign)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadRoleContextImpl &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin) &&
            (identical(other.isMarketing, isMarketing) ||
                other.isMarketing == isMarketing) &&
            (identical(other.isSale, isSale) || other.isSale == isSale) &&
            (identical(other.isSaleLeader, isSaleLeader) ||
                other.isSaleLeader == isSaleLeader) &&
            (identical(other.isSaleAdmin, isSaleAdmin) ||
                other.isSaleAdmin == isSaleAdmin) &&
            (identical(other.isBod, isBod) || other.isBod == isBod) &&
            const DeepCollectionEquality()
                .equals(other._teamEmployeeIds, _teamEmployeeIds) &&
            (identical(other.canViewMarketing, canViewMarketing) ||
                other.canViewMarketing == canViewMarketing) &&
            (identical(other.canViewSale, canViewSale) ||
                other.canViewSale == canViewSale) &&
            (identical(other.canAssign, canAssign) ||
                other.canAssign == canAssign));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      employeeId,
      isAdmin,
      isMarketing,
      isSale,
      isSaleLeader,
      isSaleAdmin,
      isBod,
      const DeepCollectionEquality().hash(_teamEmployeeIds),
      canViewMarketing,
      canViewSale,
      canAssign);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadRoleContextImplCopyWith<_$LeadRoleContextImpl> get copyWith =>
      __$$LeadRoleContextImplCopyWithImpl<_$LeadRoleContextImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadRoleContextImplToJson(
      this,
    );
  }
}

abstract class _LeadRoleContext implements LeadRoleContext {
  const factory _LeadRoleContext(
          {@JsonKey(name: 'EmployeeID') final int? employeeId,
          @JsonKey(name: 'IsAdmin') final bool? isAdmin,
          @JsonKey(name: 'IsMarketing') final bool? isMarketing,
          @JsonKey(name: 'IsSale') final bool? isSale,
          @JsonKey(name: 'IsSaleLeader') final bool? isSaleLeader,
          @JsonKey(name: 'IsSaleAdmin') final bool? isSaleAdmin,
          @JsonKey(name: 'IsBod') final bool? isBod,
          @JsonKey(name: 'TeamEmployeeIDs') final List<int>? teamEmployeeIds,
          @JsonKey(name: 'CanViewMarketing') final bool? canViewMarketing,
          @JsonKey(name: 'CanViewSale') final bool? canViewSale,
          @JsonKey(name: 'CanAssign') final bool? canAssign}) =
      _$LeadRoleContextImpl;

  factory _LeadRoleContext.fromJson(Map<String, dynamic> json) =
      _$LeadRoleContextImpl.fromJson;

  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(name: 'IsAdmin')
  bool? get isAdmin;
  @override
  @JsonKey(name: 'IsMarketing')
  bool? get isMarketing;
  @override
  @JsonKey(name: 'IsSale')
  bool? get isSale;
  @override
  @JsonKey(name: 'IsSaleLeader')
  bool? get isSaleLeader;
  @override
  @JsonKey(name: 'IsSaleAdmin')
  bool? get isSaleAdmin;
  @override
  @JsonKey(name: 'IsBod')
  bool? get isBod;
  @override
  @JsonKey(name: 'TeamEmployeeIDs')
  List<int>? get teamEmployeeIds;
  @override
  @JsonKey(name: 'CanViewMarketing')
  bool? get canViewMarketing;
  @override
  @JsonKey(name: 'CanViewSale')
  bool? get canViewSale;
  @override
  @JsonKey(name: 'CanAssign')
  bool? get canAssign;
  @override
  @JsonKey(ignore: true)
  _$$LeadRoleContextImplCopyWith<_$LeadRoleContextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadPoType _$LeadPoTypeFromJson(Map<String, dynamic> json) {
  return _LeadPoType.fromJson(json);
}

/// @nodoc
mixin _$LeadPoType {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'MainIndex')
  String? get mainIndex => throw _privateConstructorUsedError;
  @JsonKey(name: 'MainGroup')
  int? get mainGroup => throw _privateConstructorUsedError;
  @JsonKey(name: 'MainIndex1')
  String? get mainIndex1 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadPoTypeCopyWith<LeadPoType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadPoTypeCopyWith<$Res> {
  factory $LeadPoTypeCopyWith(
          LeadPoType value, $Res Function(LeadPoType) then) =
      _$LeadPoTypeCopyWithImpl<$Res, LeadPoType>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'MainIndex') String? mainIndex,
      @JsonKey(name: 'MainGroup') int? mainGroup,
      @JsonKey(name: 'MainIndex1') String? mainIndex1});
}

/// @nodoc
class _$LeadPoTypeCopyWithImpl<$Res, $Val extends LeadPoType>
    implements $LeadPoTypeCopyWith<$Res> {
  _$LeadPoTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? mainIndex = freezed,
    Object? mainGroup = freezed,
    Object? mainIndex1 = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      mainIndex: freezed == mainIndex
          ? _value.mainIndex
          : mainIndex // ignore: cast_nullable_to_non_nullable
              as String?,
      mainGroup: freezed == mainGroup
          ? _value.mainGroup
          : mainGroup // ignore: cast_nullable_to_non_nullable
              as int?,
      mainIndex1: freezed == mainIndex1
          ? _value.mainIndex1
          : mainIndex1 // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeadPoTypeImplCopyWith<$Res>
    implements $LeadPoTypeCopyWith<$Res> {
  factory _$$LeadPoTypeImplCopyWith(
          _$LeadPoTypeImpl value, $Res Function(_$LeadPoTypeImpl) then) =
      __$$LeadPoTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'MainIndex') String? mainIndex,
      @JsonKey(name: 'MainGroup') int? mainGroup,
      @JsonKey(name: 'MainIndex1') String? mainIndex1});
}

/// @nodoc
class __$$LeadPoTypeImplCopyWithImpl<$Res>
    extends _$LeadPoTypeCopyWithImpl<$Res, _$LeadPoTypeImpl>
    implements _$$LeadPoTypeImplCopyWith<$Res> {
  __$$LeadPoTypeImplCopyWithImpl(
      _$LeadPoTypeImpl _value, $Res Function(_$LeadPoTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? mainIndex = freezed,
    Object? mainGroup = freezed,
    Object? mainIndex1 = freezed,
  }) {
    return _then(_$LeadPoTypeImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      mainIndex: freezed == mainIndex
          ? _value.mainIndex
          : mainIndex // ignore: cast_nullable_to_non_nullable
              as String?,
      mainGroup: freezed == mainGroup
          ? _value.mainGroup
          : mainGroup // ignore: cast_nullable_to_non_nullable
              as int?,
      mainIndex1: freezed == mainIndex1
          ? _value.mainIndex1
          : mainIndex1 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadPoTypeImpl implements _LeadPoType {
  const _$LeadPoTypeImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'MainIndex') this.mainIndex,
      @JsonKey(name: 'MainGroup') this.mainGroup,
      @JsonKey(name: 'MainIndex1') this.mainIndex1});

  factory _$LeadPoTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadPoTypeImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'MainIndex')
  final String? mainIndex;
  @override
  @JsonKey(name: 'MainGroup')
  final int? mainGroup;
  @override
  @JsonKey(name: 'MainIndex1')
  final String? mainIndex1;

  @override
  String toString() {
    return 'LeadPoType(id: $id, mainIndex: $mainIndex, mainGroup: $mainGroup, mainIndex1: $mainIndex1)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadPoTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mainIndex, mainIndex) ||
                other.mainIndex == mainIndex) &&
            (identical(other.mainGroup, mainGroup) ||
                other.mainGroup == mainGroup) &&
            (identical(other.mainIndex1, mainIndex1) ||
                other.mainIndex1 == mainIndex1));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, mainIndex, mainGroup, mainIndex1);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadPoTypeImplCopyWith<_$LeadPoTypeImpl> get copyWith =>
      __$$LeadPoTypeImplCopyWithImpl<_$LeadPoTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadPoTypeImplToJson(
      this,
    );
  }
}

abstract class _LeadPoType implements LeadPoType {
  const factory _LeadPoType(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'MainIndex') final String? mainIndex,
          @JsonKey(name: 'MainGroup') final int? mainGroup,
          @JsonKey(name: 'MainIndex1') final String? mainIndex1}) =
      _$LeadPoTypeImpl;

  factory _LeadPoType.fromJson(Map<String, dynamic> json) =
      _$LeadPoTypeImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'MainIndex')
  String? get mainIndex;
  @override
  @JsonKey(name: 'MainGroup')
  int? get mainGroup;
  @override
  @JsonKey(name: 'MainIndex1')
  String? get mainIndex1;
  @override
  @JsonKey(ignore: true)
  _$$LeadPoTypeImplCopyWith<_$LeadPoTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadCustomerIndustry _$LeadCustomerIndustryFromJson(Map<String, dynamic> json) {
  return _LeadCustomerIndustry.fromJson(json);
}

/// @nodoc
mixin _$LeadCustomerIndustry {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'IndustriesNameVI')
  String? get industriesNameVi => throw _privateConstructorUsedError;
  @JsonKey(name: 'IndustriesNameEN')
  String? get industriesNameEn => throw _privateConstructorUsedError;
  @JsonKey(name: 'NumberOrder')
  int? get numberOrder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadCustomerIndustryCopyWith<LeadCustomerIndustry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadCustomerIndustryCopyWith<$Res> {
  factory $LeadCustomerIndustryCopyWith(LeadCustomerIndustry value,
          $Res Function(LeadCustomerIndustry) then) =
      _$LeadCustomerIndustryCopyWithImpl<$Res, LeadCustomerIndustry>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'IndustriesNameVI') String? industriesNameVi,
      @JsonKey(name: 'IndustriesNameEN') String? industriesNameEn,
      @JsonKey(name: 'NumberOrder') int? numberOrder});
}

/// @nodoc
class _$LeadCustomerIndustryCopyWithImpl<$Res,
        $Val extends LeadCustomerIndustry>
    implements $LeadCustomerIndustryCopyWith<$Res> {
  _$LeadCustomerIndustryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? industriesNameVi = freezed,
    Object? industriesNameEn = freezed,
    Object? numberOrder = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      industriesNameVi: freezed == industriesNameVi
          ? _value.industriesNameVi
          : industriesNameVi // ignore: cast_nullable_to_non_nullable
              as String?,
      industriesNameEn: freezed == industriesNameEn
          ? _value.industriesNameEn
          : industriesNameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOrder: freezed == numberOrder
          ? _value.numberOrder
          : numberOrder // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeadCustomerIndustryImplCopyWith<$Res>
    implements $LeadCustomerIndustryCopyWith<$Res> {
  factory _$$LeadCustomerIndustryImplCopyWith(_$LeadCustomerIndustryImpl value,
          $Res Function(_$LeadCustomerIndustryImpl) then) =
      __$$LeadCustomerIndustryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'IndustriesNameVI') String? industriesNameVi,
      @JsonKey(name: 'IndustriesNameEN') String? industriesNameEn,
      @JsonKey(name: 'NumberOrder') int? numberOrder});
}

/// @nodoc
class __$$LeadCustomerIndustryImplCopyWithImpl<$Res>
    extends _$LeadCustomerIndustryCopyWithImpl<$Res, _$LeadCustomerIndustryImpl>
    implements _$$LeadCustomerIndustryImplCopyWith<$Res> {
  __$$LeadCustomerIndustryImplCopyWithImpl(_$LeadCustomerIndustryImpl _value,
      $Res Function(_$LeadCustomerIndustryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? industriesNameVi = freezed,
    Object? industriesNameEn = freezed,
    Object? numberOrder = freezed,
  }) {
    return _then(_$LeadCustomerIndustryImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      industriesNameVi: freezed == industriesNameVi
          ? _value.industriesNameVi
          : industriesNameVi // ignore: cast_nullable_to_non_nullable
              as String?,
      industriesNameEn: freezed == industriesNameEn
          ? _value.industriesNameEn
          : industriesNameEn // ignore: cast_nullable_to_non_nullable
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
class _$LeadCustomerIndustryImpl implements _LeadCustomerIndustry {
  const _$LeadCustomerIndustryImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'IndustriesNameVI') this.industriesNameVi,
      @JsonKey(name: 'IndustriesNameEN') this.industriesNameEn,
      @JsonKey(name: 'NumberOrder') this.numberOrder});

  factory _$LeadCustomerIndustryImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadCustomerIndustryImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'IndustriesNameVI')
  final String? industriesNameVi;
  @override
  @JsonKey(name: 'IndustriesNameEN')
  final String? industriesNameEn;
  @override
  @JsonKey(name: 'NumberOrder')
  final int? numberOrder;

  @override
  String toString() {
    return 'LeadCustomerIndustry(id: $id, industriesNameVi: $industriesNameVi, industriesNameEn: $industriesNameEn, numberOrder: $numberOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadCustomerIndustryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.industriesNameVi, industriesNameVi) ||
                other.industriesNameVi == industriesNameVi) &&
            (identical(other.industriesNameEn, industriesNameEn) ||
                other.industriesNameEn == industriesNameEn) &&
            (identical(other.numberOrder, numberOrder) ||
                other.numberOrder == numberOrder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, industriesNameVi, industriesNameEn, numberOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadCustomerIndustryImplCopyWith<_$LeadCustomerIndustryImpl>
      get copyWith =>
          __$$LeadCustomerIndustryImplCopyWithImpl<_$LeadCustomerIndustryImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadCustomerIndustryImplToJson(
      this,
    );
  }
}

abstract class _LeadCustomerIndustry implements LeadCustomerIndustry {
  const factory _LeadCustomerIndustry(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'IndustriesNameVI') final String? industriesNameVi,
          @JsonKey(name: 'IndustriesNameEN') final String? industriesNameEn,
          @JsonKey(name: 'NumberOrder') final int? numberOrder}) =
      _$LeadCustomerIndustryImpl;

  factory _LeadCustomerIndustry.fromJson(Map<String, dynamic> json) =
      _$LeadCustomerIndustryImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'IndustriesNameVI')
  String? get industriesNameVi;
  @override
  @JsonKey(name: 'IndustriesNameEN')
  String? get industriesNameEn;
  @override
  @JsonKey(name: 'NumberOrder')
  int? get numberOrder;
  @override
  @JsonKey(ignore: true)
  _$$LeadCustomerIndustryImplCopyWith<_$LeadCustomerIndustryImpl>
      get copyWith => throw _privateConstructorUsedError;
}

LeadCustomerSpecialization _$LeadCustomerSpecializationFromJson(
    Map<String, dynamic> json) {
  return _LeadCustomerSpecialization.fromJson(json);
}

/// @nodoc
mixin _$LeadCustomerSpecialization {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'STT')
  int? get stt => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadCustomerSpecializationCopyWith<LeadCustomerSpecialization>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadCustomerSpecializationCopyWith<$Res> {
  factory $LeadCustomerSpecializationCopyWith(LeadCustomerSpecialization value,
          $Res Function(LeadCustomerSpecialization) then) =
      _$LeadCustomerSpecializationCopyWithImpl<$Res,
          LeadCustomerSpecialization>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Name') String? name});
}

/// @nodoc
class _$LeadCustomerSpecializationCopyWithImpl<$Res,
        $Val extends LeadCustomerSpecialization>
    implements $LeadCustomerSpecializationCopyWith<$Res> {
  _$LeadCustomerSpecializationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? stt = freezed,
    Object? code = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
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
abstract class _$$LeadCustomerSpecializationImplCopyWith<$Res>
    implements $LeadCustomerSpecializationCopyWith<$Res> {
  factory _$$LeadCustomerSpecializationImplCopyWith(
          _$LeadCustomerSpecializationImpl value,
          $Res Function(_$LeadCustomerSpecializationImpl) then) =
      __$$LeadCustomerSpecializationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Name') String? name});
}

/// @nodoc
class __$$LeadCustomerSpecializationImplCopyWithImpl<$Res>
    extends _$LeadCustomerSpecializationCopyWithImpl<$Res,
        _$LeadCustomerSpecializationImpl>
    implements _$$LeadCustomerSpecializationImplCopyWith<$Res> {
  __$$LeadCustomerSpecializationImplCopyWithImpl(
      _$LeadCustomerSpecializationImpl _value,
      $Res Function(_$LeadCustomerSpecializationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? stt = freezed,
    Object? code = freezed,
    Object? name = freezed,
  }) {
    return _then(_$LeadCustomerSpecializationImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
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
class _$LeadCustomerSpecializationImpl implements _LeadCustomerSpecialization {
  const _$LeadCustomerSpecializationImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'STT') this.stt,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'Name') this.name});

  factory _$LeadCustomerSpecializationImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$LeadCustomerSpecializationImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'STT')
  final int? stt;
  @override
  @JsonKey(name: 'Code')
  final String? code;
  @override
  @JsonKey(name: 'Name')
  final String? name;

  @override
  String toString() {
    return 'LeadCustomerSpecialization(id: $id, stt: $stt, code: $code, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadCustomerSpecializationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stt, stt) || other.stt == stt) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, stt, code, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadCustomerSpecializationImplCopyWith<_$LeadCustomerSpecializationImpl>
      get copyWith => __$$LeadCustomerSpecializationImplCopyWithImpl<
          _$LeadCustomerSpecializationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadCustomerSpecializationImplToJson(
      this,
    );
  }
}

abstract class _LeadCustomerSpecialization
    implements LeadCustomerSpecialization {
  const factory _LeadCustomerSpecialization(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'STT') final int? stt,
          @JsonKey(name: 'Code') final String? code,
          @JsonKey(name: 'Name') final String? name}) =
      _$LeadCustomerSpecializationImpl;

  factory _LeadCustomerSpecialization.fromJson(Map<String, dynamic> json) =
      _$LeadCustomerSpecializationImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'STT')
  int? get stt;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(name: 'Name')
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$LeadCustomerSpecializationImplCopyWith<_$LeadCustomerSpecializationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

LeadBusinessField _$LeadBusinessFieldFromJson(Map<String, dynamic> json) {
  return _LeadBusinessField.fromJson(json);
}

/// @nodoc
mixin _$LeadBusinessField {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'STT')
  int? get stt => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadBusinessFieldCopyWith<LeadBusinessField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadBusinessFieldCopyWith<$Res> {
  factory $LeadBusinessFieldCopyWith(
          LeadBusinessField value, $Res Function(LeadBusinessField) then) =
      _$LeadBusinessFieldCopyWithImpl<$Res, LeadBusinessField>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Name') String? name});
}

/// @nodoc
class _$LeadBusinessFieldCopyWithImpl<$Res, $Val extends LeadBusinessField>
    implements $LeadBusinessFieldCopyWith<$Res> {
  _$LeadBusinessFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? stt = freezed,
    Object? code = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
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
abstract class _$$LeadBusinessFieldImplCopyWith<$Res>
    implements $LeadBusinessFieldCopyWith<$Res> {
  factory _$$LeadBusinessFieldImplCopyWith(_$LeadBusinessFieldImpl value,
          $Res Function(_$LeadBusinessFieldImpl) then) =
      __$$LeadBusinessFieldImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Name') String? name});
}

/// @nodoc
class __$$LeadBusinessFieldImplCopyWithImpl<$Res>
    extends _$LeadBusinessFieldCopyWithImpl<$Res, _$LeadBusinessFieldImpl>
    implements _$$LeadBusinessFieldImplCopyWith<$Res> {
  __$$LeadBusinessFieldImplCopyWithImpl(_$LeadBusinessFieldImpl _value,
      $Res Function(_$LeadBusinessFieldImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? stt = freezed,
    Object? code = freezed,
    Object? name = freezed,
  }) {
    return _then(_$LeadBusinessFieldImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
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
class _$LeadBusinessFieldImpl implements _LeadBusinessField {
  const _$LeadBusinessFieldImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'STT') this.stt,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'Name') this.name});

  factory _$LeadBusinessFieldImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadBusinessFieldImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'STT')
  final int? stt;
  @override
  @JsonKey(name: 'Code')
  final String? code;
  @override
  @JsonKey(name: 'Name')
  final String? name;

  @override
  String toString() {
    return 'LeadBusinessField(id: $id, stt: $stt, code: $code, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadBusinessFieldImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stt, stt) || other.stt == stt) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, stt, code, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadBusinessFieldImplCopyWith<_$LeadBusinessFieldImpl> get copyWith =>
      __$$LeadBusinessFieldImplCopyWithImpl<_$LeadBusinessFieldImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadBusinessFieldImplToJson(
      this,
    );
  }
}

abstract class _LeadBusinessField implements LeadBusinessField {
  const factory _LeadBusinessField(
      {@JsonKey(name: 'ID') final int? id,
      @JsonKey(name: 'STT') final int? stt,
      @JsonKey(name: 'Code') final String? code,
      @JsonKey(name: 'Name') final String? name}) = _$LeadBusinessFieldImpl;

  factory _LeadBusinessField.fromJson(Map<String, dynamic> json) =
      _$LeadBusinessFieldImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'STT')
  int? get stt;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(name: 'Name')
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$LeadBusinessFieldImplCopyWith<_$LeadBusinessFieldImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadProvince _$LeadProvinceFromJson(Map<String, dynamic> json) {
  return _LeadProvince.fromJson(json);
}

/// @nodoc
mixin _$LeadProvince {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'STT')
  int? get stt => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProvinceCode')
  String? get provinceCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProvinceName')
  String? get provinceName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadProvinceCopyWith<LeadProvince> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadProvinceCopyWith<$Res> {
  factory $LeadProvinceCopyWith(
          LeadProvince value, $Res Function(LeadProvince) then) =
      _$LeadProvinceCopyWithImpl<$Res, LeadProvince>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'ProvinceCode') String? provinceCode,
      @JsonKey(name: 'ProvinceName') String? provinceName});
}

/// @nodoc
class _$LeadProvinceCopyWithImpl<$Res, $Val extends LeadProvince>
    implements $LeadProvinceCopyWith<$Res> {
  _$LeadProvinceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? stt = freezed,
    Object? provinceCode = freezed,
    Object? provinceName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
      provinceCode: freezed == provinceCode
          ? _value.provinceCode
          : provinceCode // ignore: cast_nullable_to_non_nullable
              as String?,
      provinceName: freezed == provinceName
          ? _value.provinceName
          : provinceName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeadProvinceImplCopyWith<$Res>
    implements $LeadProvinceCopyWith<$Res> {
  factory _$$LeadProvinceImplCopyWith(
          _$LeadProvinceImpl value, $Res Function(_$LeadProvinceImpl) then) =
      __$$LeadProvinceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'ProvinceCode') String? provinceCode,
      @JsonKey(name: 'ProvinceName') String? provinceName});
}

/// @nodoc
class __$$LeadProvinceImplCopyWithImpl<$Res>
    extends _$LeadProvinceCopyWithImpl<$Res, _$LeadProvinceImpl>
    implements _$$LeadProvinceImplCopyWith<$Res> {
  __$$LeadProvinceImplCopyWithImpl(
      _$LeadProvinceImpl _value, $Res Function(_$LeadProvinceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? stt = freezed,
    Object? provinceCode = freezed,
    Object? provinceName = freezed,
  }) {
    return _then(_$LeadProvinceImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
      provinceCode: freezed == provinceCode
          ? _value.provinceCode
          : provinceCode // ignore: cast_nullable_to_non_nullable
              as String?,
      provinceName: freezed == provinceName
          ? _value.provinceName
          : provinceName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadProvinceImpl implements _LeadProvince {
  const _$LeadProvinceImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'STT') this.stt,
      @JsonKey(name: 'ProvinceCode') this.provinceCode,
      @JsonKey(name: 'ProvinceName') this.provinceName});

  factory _$LeadProvinceImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadProvinceImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'STT')
  final int? stt;
  @override
  @JsonKey(name: 'ProvinceCode')
  final String? provinceCode;
  @override
  @JsonKey(name: 'ProvinceName')
  final String? provinceName;

  @override
  String toString() {
    return 'LeadProvince(id: $id, stt: $stt, provinceCode: $provinceCode, provinceName: $provinceName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadProvinceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stt, stt) || other.stt == stt) &&
            (identical(other.provinceCode, provinceCode) ||
                other.provinceCode == provinceCode) &&
            (identical(other.provinceName, provinceName) ||
                other.provinceName == provinceName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, stt, provinceCode, provinceName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadProvinceImplCopyWith<_$LeadProvinceImpl> get copyWith =>
      __$$LeadProvinceImplCopyWithImpl<_$LeadProvinceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadProvinceImplToJson(
      this,
    );
  }
}

abstract class _LeadProvince implements LeadProvince {
  const factory _LeadProvince(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'STT') final int? stt,
          @JsonKey(name: 'ProvinceCode') final String? provinceCode,
          @JsonKey(name: 'ProvinceName') final String? provinceName}) =
      _$LeadProvinceImpl;

  factory _LeadProvince.fromJson(Map<String, dynamic> json) =
      _$LeadProvinceImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'STT')
  int? get stt;
  @override
  @JsonKey(name: 'ProvinceCode')
  String? get provinceCode;
  @override
  @JsonKey(name: 'ProvinceName')
  String? get provinceName;
  @override
  @JsonKey(ignore: true)
  _$$LeadProvinceImplCopyWith<_$LeadProvinceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadCustomer _$LeadCustomerFromJson(Map<String, dynamic> json) {
  return _LeadCustomer.fromJson(json);
}

/// @nodoc
mixin _$LeadCustomer {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerName')
  String? get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerCode')
  String? get customerCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerShortName')
  String? get customerShortName => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'Province')
  String? get province => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerType')
  int? get customerType => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerIndustriesID')
  int? get customerIndustriesId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerSpecializationID')
  int? get customerSpecializationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'BusinessFieldID')
  int? get businessFieldId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Website')
  String? get website => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxCode')
  String? get taxCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadCustomerCopyWith<LeadCustomer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadCustomerCopyWith<$Res> {
  factory $LeadCustomerCopyWith(
          LeadCustomer value, $Res Function(LeadCustomer) then) =
      _$LeadCustomerCopyWithImpl<$Res, LeadCustomer>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'CustomerName') String? customerName,
      @JsonKey(name: 'CustomerCode') String? customerCode,
      @JsonKey(name: 'CustomerShortName') String? customerShortName,
      @JsonKey(name: 'Address') String? address,
      @JsonKey(name: 'Phone') String? phone,
      @JsonKey(name: 'Email') String? email,
      @JsonKey(name: 'ContactName') String? contactName,
      @JsonKey(name: 'ContactPhone') String? contactPhone,
      @JsonKey(name: 'ContactEmail') String? contactEmail,
      @JsonKey(name: 'Province') String? province,
      @JsonKey(name: 'CustomerType') int? customerType,
      @JsonKey(name: 'CustomerIndustriesID') int? customerIndustriesId,
      @JsonKey(name: 'CustomerSpecializationID') int? customerSpecializationId,
      @JsonKey(name: 'BusinessFieldID') int? businessFieldId,
      @JsonKey(name: 'Website') String? website,
      @JsonKey(name: 'TaxCode') String? taxCode});
}

/// @nodoc
class _$LeadCustomerCopyWithImpl<$Res, $Val extends LeadCustomer>
    implements $LeadCustomerCopyWith<$Res> {
  _$LeadCustomerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? customerName = freezed,
    Object? customerCode = freezed,
    Object? customerShortName = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? contactName = freezed,
    Object? contactPhone = freezed,
    Object? contactEmail = freezed,
    Object? province = freezed,
    Object? customerType = freezed,
    Object? customerIndustriesId = freezed,
    Object? customerSpecializationId = freezed,
    Object? businessFieldId = freezed,
    Object? website = freezed,
    Object? taxCode = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerCode: freezed == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      customerShortName: freezed == customerShortName
          ? _value.customerShortName
          : customerShortName // ignore: cast_nullable_to_non_nullable
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
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String?,
      customerType: freezed == customerType
          ? _value.customerType
          : customerType // ignore: cast_nullable_to_non_nullable
              as int?,
      customerIndustriesId: freezed == customerIndustriesId
          ? _value.customerIndustriesId
          : customerIndustriesId // ignore: cast_nullable_to_non_nullable
              as int?,
      customerSpecializationId: freezed == customerSpecializationId
          ? _value.customerSpecializationId
          : customerSpecializationId // ignore: cast_nullable_to_non_nullable
              as int?,
      businessFieldId: freezed == businessFieldId
          ? _value.businessFieldId
          : businessFieldId // ignore: cast_nullable_to_non_nullable
              as int?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      taxCode: freezed == taxCode
          ? _value.taxCode
          : taxCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeadCustomerImplCopyWith<$Res>
    implements $LeadCustomerCopyWith<$Res> {
  factory _$$LeadCustomerImplCopyWith(
          _$LeadCustomerImpl value, $Res Function(_$LeadCustomerImpl) then) =
      __$$LeadCustomerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'CustomerName') String? customerName,
      @JsonKey(name: 'CustomerCode') String? customerCode,
      @JsonKey(name: 'CustomerShortName') String? customerShortName,
      @JsonKey(name: 'Address') String? address,
      @JsonKey(name: 'Phone') String? phone,
      @JsonKey(name: 'Email') String? email,
      @JsonKey(name: 'ContactName') String? contactName,
      @JsonKey(name: 'ContactPhone') String? contactPhone,
      @JsonKey(name: 'ContactEmail') String? contactEmail,
      @JsonKey(name: 'Province') String? province,
      @JsonKey(name: 'CustomerType') int? customerType,
      @JsonKey(name: 'CustomerIndustriesID') int? customerIndustriesId,
      @JsonKey(name: 'CustomerSpecializationID') int? customerSpecializationId,
      @JsonKey(name: 'BusinessFieldID') int? businessFieldId,
      @JsonKey(name: 'Website') String? website,
      @JsonKey(name: 'TaxCode') String? taxCode});
}

/// @nodoc
class __$$LeadCustomerImplCopyWithImpl<$Res>
    extends _$LeadCustomerCopyWithImpl<$Res, _$LeadCustomerImpl>
    implements _$$LeadCustomerImplCopyWith<$Res> {
  __$$LeadCustomerImplCopyWithImpl(
      _$LeadCustomerImpl _value, $Res Function(_$LeadCustomerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? customerName = freezed,
    Object? customerCode = freezed,
    Object? customerShortName = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? contactName = freezed,
    Object? contactPhone = freezed,
    Object? contactEmail = freezed,
    Object? province = freezed,
    Object? customerType = freezed,
    Object? customerIndustriesId = freezed,
    Object? customerSpecializationId = freezed,
    Object? businessFieldId = freezed,
    Object? website = freezed,
    Object? taxCode = freezed,
  }) {
    return _then(_$LeadCustomerImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerCode: freezed == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      customerShortName: freezed == customerShortName
          ? _value.customerShortName
          : customerShortName // ignore: cast_nullable_to_non_nullable
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
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String?,
      customerType: freezed == customerType
          ? _value.customerType
          : customerType // ignore: cast_nullable_to_non_nullable
              as int?,
      customerIndustriesId: freezed == customerIndustriesId
          ? _value.customerIndustriesId
          : customerIndustriesId // ignore: cast_nullable_to_non_nullable
              as int?,
      customerSpecializationId: freezed == customerSpecializationId
          ? _value.customerSpecializationId
          : customerSpecializationId // ignore: cast_nullable_to_non_nullable
              as int?,
      businessFieldId: freezed == businessFieldId
          ? _value.businessFieldId
          : businessFieldId // ignore: cast_nullable_to_non_nullable
              as int?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      taxCode: freezed == taxCode
          ? _value.taxCode
          : taxCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadCustomerImpl implements _LeadCustomer {
  const _$LeadCustomerImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'CustomerName') this.customerName,
      @JsonKey(name: 'CustomerCode') this.customerCode,
      @JsonKey(name: 'CustomerShortName') this.customerShortName,
      @JsonKey(name: 'Address') this.address,
      @JsonKey(name: 'Phone') this.phone,
      @JsonKey(name: 'Email') this.email,
      @JsonKey(name: 'ContactName') this.contactName,
      @JsonKey(name: 'ContactPhone') this.contactPhone,
      @JsonKey(name: 'ContactEmail') this.contactEmail,
      @JsonKey(name: 'Province') this.province,
      @JsonKey(name: 'CustomerType') this.customerType,
      @JsonKey(name: 'CustomerIndustriesID') this.customerIndustriesId,
      @JsonKey(name: 'CustomerSpecializationID') this.customerSpecializationId,
      @JsonKey(name: 'BusinessFieldID') this.businessFieldId,
      @JsonKey(name: 'Website') this.website,
      @JsonKey(name: 'TaxCode') this.taxCode});

  factory _$LeadCustomerImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadCustomerImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'CustomerName')
  final String? customerName;
  @override
  @JsonKey(name: 'CustomerCode')
  final String? customerCode;
  @override
  @JsonKey(name: 'CustomerShortName')
  final String? customerShortName;
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
  @JsonKey(name: 'Province')
  final String? province;
  @override
  @JsonKey(name: 'CustomerType')
  final int? customerType;
  @override
  @JsonKey(name: 'CustomerIndustriesID')
  final int? customerIndustriesId;
  @override
  @JsonKey(name: 'CustomerSpecializationID')
  final int? customerSpecializationId;
  @override
  @JsonKey(name: 'BusinessFieldID')
  final int? businessFieldId;
  @override
  @JsonKey(name: 'Website')
  final String? website;
  @override
  @JsonKey(name: 'TaxCode')
  final String? taxCode;

  @override
  String toString() {
    return 'LeadCustomer(id: $id, customerName: $customerName, customerCode: $customerCode, customerShortName: $customerShortName, address: $address, phone: $phone, email: $email, contactName: $contactName, contactPhone: $contactPhone, contactEmail: $contactEmail, province: $province, customerType: $customerType, customerIndustriesId: $customerIndustriesId, customerSpecializationId: $customerSpecializationId, businessFieldId: $businessFieldId, website: $website, taxCode: $taxCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadCustomerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.customerShortName, customerShortName) ||
                other.customerShortName == customerShortName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.contactName, contactName) ||
                other.contactName == contactName) &&
            (identical(other.contactPhone, contactPhone) ||
                other.contactPhone == contactPhone) &&
            (identical(other.contactEmail, contactEmail) ||
                other.contactEmail == contactEmail) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.customerType, customerType) ||
                other.customerType == customerType) &&
            (identical(other.customerIndustriesId, customerIndustriesId) ||
                other.customerIndustriesId == customerIndustriesId) &&
            (identical(
                    other.customerSpecializationId, customerSpecializationId) ||
                other.customerSpecializationId == customerSpecializationId) &&
            (identical(other.businessFieldId, businessFieldId) ||
                other.businessFieldId == businessFieldId) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.taxCode, taxCode) || other.taxCode == taxCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      customerName,
      customerCode,
      customerShortName,
      address,
      phone,
      email,
      contactName,
      contactPhone,
      contactEmail,
      province,
      customerType,
      customerIndustriesId,
      customerSpecializationId,
      businessFieldId,
      website,
      taxCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadCustomerImplCopyWith<_$LeadCustomerImpl> get copyWith =>
      __$$LeadCustomerImplCopyWithImpl<_$LeadCustomerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadCustomerImplToJson(
      this,
    );
  }
}

abstract class _LeadCustomer implements LeadCustomer {
  const factory _LeadCustomer(
      {@JsonKey(name: 'ID') final int? id,
      @JsonKey(name: 'CustomerName') final String? customerName,
      @JsonKey(name: 'CustomerCode') final String? customerCode,
      @JsonKey(name: 'CustomerShortName') final String? customerShortName,
      @JsonKey(name: 'Address') final String? address,
      @JsonKey(name: 'Phone') final String? phone,
      @JsonKey(name: 'Email') final String? email,
      @JsonKey(name: 'ContactName') final String? contactName,
      @JsonKey(name: 'ContactPhone') final String? contactPhone,
      @JsonKey(name: 'ContactEmail') final String? contactEmail,
      @JsonKey(name: 'Province') final String? province,
      @JsonKey(name: 'CustomerType') final int? customerType,
      @JsonKey(name: 'CustomerIndustriesID') final int? customerIndustriesId,
      @JsonKey(name: 'CustomerSpecializationID')
      final int? customerSpecializationId,
      @JsonKey(name: 'BusinessFieldID') final int? businessFieldId,
      @JsonKey(name: 'Website') final String? website,
      @JsonKey(name: 'TaxCode') final String? taxCode}) = _$LeadCustomerImpl;

  factory _LeadCustomer.fromJson(Map<String, dynamic> json) =
      _$LeadCustomerImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'CustomerName')
  String? get customerName;
  @override
  @JsonKey(name: 'CustomerCode')
  String? get customerCode;
  @override
  @JsonKey(name: 'CustomerShortName')
  String? get customerShortName;
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
  @JsonKey(name: 'Province')
  String? get province;
  @override
  @JsonKey(name: 'CustomerType')
  int? get customerType;
  @override
  @JsonKey(name: 'CustomerIndustriesID')
  int? get customerIndustriesId;
  @override
  @JsonKey(name: 'CustomerSpecializationID')
  int? get customerSpecializationId;
  @override
  @JsonKey(name: 'BusinessFieldID')
  int? get businessFieldId;
  @override
  @JsonKey(name: 'Website')
  String? get website;
  @override
  @JsonKey(name: 'TaxCode')
  String? get taxCode;
  @override
  @JsonKey(ignore: true)
  _$$LeadCustomerImplCopyWith<_$LeadCustomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadDuplicateInfo _$LeadDuplicateInfoFromJson(Map<String, dynamic> json) {
  return _LeadDuplicateInfo.fromJson(json);
}

/// @nodoc
mixin _$LeadDuplicateInfo {
  /// Bảng nguồn chứa bản ghi trùng (vd "Lead").
  @JsonKey(name: 'SourceTable')
  String? get sourceTable => throw _privateConstructorUsedError;

  /// ID bản ghi trùng.
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;

  /// Mã bản ghi trùng (vd "LD-2610-0028").
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;

  /// Tên bản ghi trùng.
  @JsonKey(name: 'Name')
  String? get name => throw _privateConstructorUsedError;

  /// Họ tên người liên hệ của bản ghi trùng.
  @JsonKey(name: 'ContactName')
  String? get contactName => throw _privateConstructorUsedError;

  /// SĐT người liên hệ của bản ghi trùng.
  @JsonKey(name: 'ContactPhone')
  String? get contactPhone => throw _privateConstructorUsedError;

  /// Email người liên hệ của bản ghi trùng.
  @JsonKey(name: 'ContactEmail')
  String? get contactEmail => throw _privateConstructorUsedError;

  /// Giai đoạn hiện tại của bản ghi trùng.
  @JsonKey(name: 'Stage')
  int? get stage => throw _privateConstructorUsedError;

  /// Trường bị trùng (vd "Email", "Phone", "TaxCode", "CompanyName").
  @JsonKey(name: 'MatchField')
  String? get matchField => throw _privateConstructorUsedError;

  /// Người phụ trách bản ghi trùng.
  @JsonKey(name: 'OwnerName')
  String? get ownerName => throw _privateConstructorUsedError;

  /// Bộ phận của người phụ trách (vd "Marketing", "Sales").
  @JsonKey(name: 'OwnerSide')
  String? get ownerSide => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadDuplicateInfoCopyWith<LeadDuplicateInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadDuplicateInfoCopyWith<$Res> {
  factory $LeadDuplicateInfoCopyWith(
          LeadDuplicateInfo value, $Res Function(LeadDuplicateInfo) then) =
      _$LeadDuplicateInfoCopyWithImpl<$Res, LeadDuplicateInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'SourceTable') String? sourceTable,
      @JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'ContactName') String? contactName,
      @JsonKey(name: 'ContactPhone') String? contactPhone,
      @JsonKey(name: 'ContactEmail') String? contactEmail,
      @JsonKey(name: 'Stage') int? stage,
      @JsonKey(name: 'MatchField') String? matchField,
      @JsonKey(name: 'OwnerName') String? ownerName,
      @JsonKey(name: 'OwnerSide') String? ownerSide});
}

/// @nodoc
class _$LeadDuplicateInfoCopyWithImpl<$Res, $Val extends LeadDuplicateInfo>
    implements $LeadDuplicateInfoCopyWith<$Res> {
  _$LeadDuplicateInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourceTable = freezed,
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? contactName = freezed,
    Object? contactPhone = freezed,
    Object? contactEmail = freezed,
    Object? stage = freezed,
    Object? matchField = freezed,
    Object? ownerName = freezed,
    Object? ownerSide = freezed,
  }) {
    return _then(_value.copyWith(
      sourceTable: freezed == sourceTable
          ? _value.sourceTable
          : sourceTable // ignore: cast_nullable_to_non_nullable
              as String?,
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
      stage: freezed == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as int?,
      matchField: freezed == matchField
          ? _value.matchField
          : matchField // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerName: freezed == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerSide: freezed == ownerSide
          ? _value.ownerSide
          : ownerSide // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeadDuplicateInfoImplCopyWith<$Res>
    implements $LeadDuplicateInfoCopyWith<$Res> {
  factory _$$LeadDuplicateInfoImplCopyWith(_$LeadDuplicateInfoImpl value,
          $Res Function(_$LeadDuplicateInfoImpl) then) =
      __$$LeadDuplicateInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'SourceTable') String? sourceTable,
      @JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'ContactName') String? contactName,
      @JsonKey(name: 'ContactPhone') String? contactPhone,
      @JsonKey(name: 'ContactEmail') String? contactEmail,
      @JsonKey(name: 'Stage') int? stage,
      @JsonKey(name: 'MatchField') String? matchField,
      @JsonKey(name: 'OwnerName') String? ownerName,
      @JsonKey(name: 'OwnerSide') String? ownerSide});
}

/// @nodoc
class __$$LeadDuplicateInfoImplCopyWithImpl<$Res>
    extends _$LeadDuplicateInfoCopyWithImpl<$Res, _$LeadDuplicateInfoImpl>
    implements _$$LeadDuplicateInfoImplCopyWith<$Res> {
  __$$LeadDuplicateInfoImplCopyWithImpl(_$LeadDuplicateInfoImpl _value,
      $Res Function(_$LeadDuplicateInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourceTable = freezed,
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? contactName = freezed,
    Object? contactPhone = freezed,
    Object? contactEmail = freezed,
    Object? stage = freezed,
    Object? matchField = freezed,
    Object? ownerName = freezed,
    Object? ownerSide = freezed,
  }) {
    return _then(_$LeadDuplicateInfoImpl(
      sourceTable: freezed == sourceTable
          ? _value.sourceTable
          : sourceTable // ignore: cast_nullable_to_non_nullable
              as String?,
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
      stage: freezed == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as int?,
      matchField: freezed == matchField
          ? _value.matchField
          : matchField // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerName: freezed == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerSide: freezed == ownerSide
          ? _value.ownerSide
          : ownerSide // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadDuplicateInfoImpl implements _LeadDuplicateInfo {
  const _$LeadDuplicateInfoImpl(
      {@JsonKey(name: 'SourceTable') this.sourceTable,
      @JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'Name') this.name,
      @JsonKey(name: 'ContactName') this.contactName,
      @JsonKey(name: 'ContactPhone') this.contactPhone,
      @JsonKey(name: 'ContactEmail') this.contactEmail,
      @JsonKey(name: 'Stage') this.stage,
      @JsonKey(name: 'MatchField') this.matchField,
      @JsonKey(name: 'OwnerName') this.ownerName,
      @JsonKey(name: 'OwnerSide') this.ownerSide});

  factory _$LeadDuplicateInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadDuplicateInfoImplFromJson(json);

  /// Bảng nguồn chứa bản ghi trùng (vd "Lead").
  @override
  @JsonKey(name: 'SourceTable')
  final String? sourceTable;

  /// ID bản ghi trùng.
  @override
  @JsonKey(name: 'ID')
  final int? id;

  /// Mã bản ghi trùng (vd "LD-2610-0028").
  @override
  @JsonKey(name: 'Code')
  final String? code;

  /// Tên bản ghi trùng.
  @override
  @JsonKey(name: 'Name')
  final String? name;

  /// Họ tên người liên hệ của bản ghi trùng.
  @override
  @JsonKey(name: 'ContactName')
  final String? contactName;

  /// SĐT người liên hệ của bản ghi trùng.
  @override
  @JsonKey(name: 'ContactPhone')
  final String? contactPhone;

  /// Email người liên hệ của bản ghi trùng.
  @override
  @JsonKey(name: 'ContactEmail')
  final String? contactEmail;

  /// Giai đoạn hiện tại của bản ghi trùng.
  @override
  @JsonKey(name: 'Stage')
  final int? stage;

  /// Trường bị trùng (vd "Email", "Phone", "TaxCode", "CompanyName").
  @override
  @JsonKey(name: 'MatchField')
  final String? matchField;

  /// Người phụ trách bản ghi trùng.
  @override
  @JsonKey(name: 'OwnerName')
  final String? ownerName;

  /// Bộ phận của người phụ trách (vd "Marketing", "Sales").
  @override
  @JsonKey(name: 'OwnerSide')
  final String? ownerSide;

  @override
  String toString() {
    return 'LeadDuplicateInfo(sourceTable: $sourceTable, id: $id, code: $code, name: $name, contactName: $contactName, contactPhone: $contactPhone, contactEmail: $contactEmail, stage: $stage, matchField: $matchField, ownerName: $ownerName, ownerSide: $ownerSide)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadDuplicateInfoImpl &&
            (identical(other.sourceTable, sourceTable) ||
                other.sourceTable == sourceTable) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.contactName, contactName) ||
                other.contactName == contactName) &&
            (identical(other.contactPhone, contactPhone) ||
                other.contactPhone == contactPhone) &&
            (identical(other.contactEmail, contactEmail) ||
                other.contactEmail == contactEmail) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.matchField, matchField) ||
                other.matchField == matchField) &&
            (identical(other.ownerName, ownerName) ||
                other.ownerName == ownerName) &&
            (identical(other.ownerSide, ownerSide) ||
                other.ownerSide == ownerSide));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sourceTable,
      id,
      code,
      name,
      contactName,
      contactPhone,
      contactEmail,
      stage,
      matchField,
      ownerName,
      ownerSide);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadDuplicateInfoImplCopyWith<_$LeadDuplicateInfoImpl> get copyWith =>
      __$$LeadDuplicateInfoImplCopyWithImpl<_$LeadDuplicateInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadDuplicateInfoImplToJson(
      this,
    );
  }
}

abstract class _LeadDuplicateInfo implements LeadDuplicateInfo {
  const factory _LeadDuplicateInfo(
          {@JsonKey(name: 'SourceTable') final String? sourceTable,
          @JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'Code') final String? code,
          @JsonKey(name: 'Name') final String? name,
          @JsonKey(name: 'ContactName') final String? contactName,
          @JsonKey(name: 'ContactPhone') final String? contactPhone,
          @JsonKey(name: 'ContactEmail') final String? contactEmail,
          @JsonKey(name: 'Stage') final int? stage,
          @JsonKey(name: 'MatchField') final String? matchField,
          @JsonKey(name: 'OwnerName') final String? ownerName,
          @JsonKey(name: 'OwnerSide') final String? ownerSide}) =
      _$LeadDuplicateInfoImpl;

  factory _LeadDuplicateInfo.fromJson(Map<String, dynamic> json) =
      _$LeadDuplicateInfoImpl.fromJson;

  @override

  /// Bảng nguồn chứa bản ghi trùng (vd "Lead").
  @JsonKey(name: 'SourceTable')
  String? get sourceTable;
  @override

  /// ID bản ghi trùng.
  @JsonKey(name: 'ID')
  int? get id;
  @override

  /// Mã bản ghi trùng (vd "LD-2610-0028").
  @JsonKey(name: 'Code')
  String? get code;
  @override

  /// Tên bản ghi trùng.
  @JsonKey(name: 'Name')
  String? get name;
  @override

  /// Họ tên người liên hệ của bản ghi trùng.
  @JsonKey(name: 'ContactName')
  String? get contactName;
  @override

  /// SĐT người liên hệ của bản ghi trùng.
  @JsonKey(name: 'ContactPhone')
  String? get contactPhone;
  @override

  /// Email người liên hệ của bản ghi trùng.
  @JsonKey(name: 'ContactEmail')
  String? get contactEmail;
  @override

  /// Giai đoạn hiện tại của bản ghi trùng.
  @JsonKey(name: 'Stage')
  int? get stage;
  @override

  /// Trường bị trùng (vd "Email", "Phone", "TaxCode", "CompanyName").
  @JsonKey(name: 'MatchField')
  String? get matchField;
  @override

  /// Người phụ trách bản ghi trùng.
  @JsonKey(name: 'OwnerName')
  String? get ownerName;
  @override

  /// Bộ phận của người phụ trách (vd "Marketing", "Sales").
  @JsonKey(name: 'OwnerSide')
  String? get ownerSide;
  @override
  @JsonKey(ignore: true)
  _$$LeadDuplicateInfoImplCopyWith<_$LeadDuplicateInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadDuplicateCheckResult _$LeadDuplicateCheckResultFromJson(
    Map<String, dynamic> json) {
  return _LeadDuplicateCheckResult.fromJson(json);
}

/// @nodoc
mixin _$LeadDuplicateCheckResult {
  /// Thông báo từ API.
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;

  /// Danh sách bản ghi bị trùng.
  @JsonKey(name: 'data')
  List<LeadDuplicateInfo>? get duplicates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadDuplicateCheckResultCopyWith<LeadDuplicateCheckResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadDuplicateCheckResultCopyWith<$Res> {
  factory $LeadDuplicateCheckResultCopyWith(LeadDuplicateCheckResult value,
          $Res Function(LeadDuplicateCheckResult) then) =
      _$LeadDuplicateCheckResultCopyWithImpl<$Res, LeadDuplicateCheckResult>;
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') List<LeadDuplicateInfo>? duplicates});
}

/// @nodoc
class _$LeadDuplicateCheckResultCopyWithImpl<$Res,
        $Val extends LeadDuplicateCheckResult>
    implements $LeadDuplicateCheckResultCopyWith<$Res> {
  _$LeadDuplicateCheckResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? duplicates = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      duplicates: freezed == duplicates
          ? _value.duplicates
          : duplicates // ignore: cast_nullable_to_non_nullable
              as List<LeadDuplicateInfo>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeadDuplicateCheckResultImplCopyWith<$Res>
    implements $LeadDuplicateCheckResultCopyWith<$Res> {
  factory _$$LeadDuplicateCheckResultImplCopyWith(
          _$LeadDuplicateCheckResultImpl value,
          $Res Function(_$LeadDuplicateCheckResultImpl) then) =
      __$$LeadDuplicateCheckResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') List<LeadDuplicateInfo>? duplicates});
}

/// @nodoc
class __$$LeadDuplicateCheckResultImplCopyWithImpl<$Res>
    extends _$LeadDuplicateCheckResultCopyWithImpl<$Res,
        _$LeadDuplicateCheckResultImpl>
    implements _$$LeadDuplicateCheckResultImplCopyWith<$Res> {
  __$$LeadDuplicateCheckResultImplCopyWithImpl(
      _$LeadDuplicateCheckResultImpl _value,
      $Res Function(_$LeadDuplicateCheckResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? duplicates = freezed,
  }) {
    return _then(_$LeadDuplicateCheckResultImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      duplicates: freezed == duplicates
          ? _value._duplicates
          : duplicates // ignore: cast_nullable_to_non_nullable
              as List<LeadDuplicateInfo>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadDuplicateCheckResultImpl implements _LeadDuplicateCheckResult {
  const _$LeadDuplicateCheckResultImpl(
      {@JsonKey(name: 'message') this.message,
      @JsonKey(name: 'data') final List<LeadDuplicateInfo>? duplicates})
      : _duplicates = duplicates;

  factory _$LeadDuplicateCheckResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadDuplicateCheckResultImplFromJson(json);

  /// Thông báo từ API.
  @override
  @JsonKey(name: 'message')
  final String? message;

  /// Danh sách bản ghi bị trùng.
  final List<LeadDuplicateInfo>? _duplicates;

  /// Danh sách bản ghi bị trùng.
  @override
  @JsonKey(name: 'data')
  List<LeadDuplicateInfo>? get duplicates {
    final value = _duplicates;
    if (value == null) return null;
    if (_duplicates is EqualUnmodifiableListView) return _duplicates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'LeadDuplicateCheckResult(message: $message, duplicates: $duplicates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadDuplicateCheckResultImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._duplicates, _duplicates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_duplicates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadDuplicateCheckResultImplCopyWith<_$LeadDuplicateCheckResultImpl>
      get copyWith => __$$LeadDuplicateCheckResultImplCopyWithImpl<
          _$LeadDuplicateCheckResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadDuplicateCheckResultImplToJson(
      this,
    );
  }
}

abstract class _LeadDuplicateCheckResult implements LeadDuplicateCheckResult {
  const factory _LeadDuplicateCheckResult(
          {@JsonKey(name: 'message') final String? message,
          @JsonKey(name: 'data') final List<LeadDuplicateInfo>? duplicates}) =
      _$LeadDuplicateCheckResultImpl;

  factory _LeadDuplicateCheckResult.fromJson(Map<String, dynamic> json) =
      _$LeadDuplicateCheckResultImpl.fromJson;

  @override

  /// Thông báo từ API.
  @JsonKey(name: 'message')
  String? get message;
  @override

  /// Danh sách bản ghi bị trùng.
  @JsonKey(name: 'data')
  List<LeadDuplicateInfo>? get duplicates;
  @override
  @JsonKey(ignore: true)
  _$$LeadDuplicateCheckResultImplCopyWith<_$LeadDuplicateCheckResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

LeadSaveResult _$LeadSaveResultFromJson(Map<String, dynamic> json) {
  return _LeadSaveResult.fromJson(json);
}

/// @nodoc
mixin _$LeadSaveResult {
  /// Thông báo từ API (vd "Thêm lead thành công!").
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;

  /// ID phiếu lead vừa tạo.
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;

  /// Mã phiếu lead (vd "LD-2610-0025").
  @JsonKey(name: 'LeadCode')
  String? get leadCode => throw _privateConstructorUsedError;

  /// ID khách hàng gắn với phiếu.
  @JsonKey(name: 'CustomerID')
  int? get customerId => throw _privateConstructorUsedError;

  /// ID nhóm hàng (loại PO).
  @JsonKey(name: 'PoTypeID')
  int? get poTypeId => throw _privateConstructorUsedError;

  /// ID nguồn lead.
  @JsonKey(name: 'LeadSourceID')
  int? get leadSourceId => throw _privateConstructorUsedError;

  /// Họ tên người liên hệ.
  @JsonKey(name: 'ContactName')
  String? get contactName => throw _privateConstructorUsedError;

  /// SĐT người liên hệ.
  @JsonKey(name: 'ContactPhone')
  String? get contactPhone => throw _privateConstructorUsedError;

  /// Email người liên hệ.
  @JsonKey(name: 'ContactEmail')
  String? get contactEmail => throw _privateConstructorUsedError;

  /// ID nhân viên marketing phụ trách.
  @JsonKey(name: 'MarketingEmployeeID')
  int? get marketingEmployeeId => throw _privateConstructorUsedError;

  /// Giai đoạn xử lý sau khi tạo.
  @JsonKey(name: 'Stage')
  int? get stage => throw _privateConstructorUsedError;

  /// ID liên kết khách hàng trả về từ BE.
  @JsonKey(name: 'idConCus')
  int? get idConCus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadSaveResultCopyWith<LeadSaveResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadSaveResultCopyWith<$Res> {
  factory $LeadSaveResultCopyWith(
          LeadSaveResult value, $Res Function(LeadSaveResult) then) =
      _$LeadSaveResultCopyWithImpl<$Res, LeadSaveResult>;
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String? message,
      @JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'LeadCode') String? leadCode,
      @JsonKey(name: 'CustomerID') int? customerId,
      @JsonKey(name: 'PoTypeID') int? poTypeId,
      @JsonKey(name: 'LeadSourceID') int? leadSourceId,
      @JsonKey(name: 'ContactName') String? contactName,
      @JsonKey(name: 'ContactPhone') String? contactPhone,
      @JsonKey(name: 'ContactEmail') String? contactEmail,
      @JsonKey(name: 'MarketingEmployeeID') int? marketingEmployeeId,
      @JsonKey(name: 'Stage') int? stage,
      @JsonKey(name: 'idConCus') int? idConCus});
}

/// @nodoc
class _$LeadSaveResultCopyWithImpl<$Res, $Val extends LeadSaveResult>
    implements $LeadSaveResultCopyWith<$Res> {
  _$LeadSaveResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? id = freezed,
    Object? leadCode = freezed,
    Object? customerId = freezed,
    Object? poTypeId = freezed,
    Object? leadSourceId = freezed,
    Object? contactName = freezed,
    Object? contactPhone = freezed,
    Object? contactEmail = freezed,
    Object? marketingEmployeeId = freezed,
    Object? stage = freezed,
    Object? idConCus = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      leadCode: freezed == leadCode
          ? _value.leadCode
          : leadCode // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      poTypeId: freezed == poTypeId
          ? _value.poTypeId
          : poTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      leadSourceId: freezed == leadSourceId
          ? _value.leadSourceId
          : leadSourceId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      marketingEmployeeId: freezed == marketingEmployeeId
          ? _value.marketingEmployeeId
          : marketingEmployeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      stage: freezed == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as int?,
      idConCus: freezed == idConCus
          ? _value.idConCus
          : idConCus // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeadSaveResultImplCopyWith<$Res>
    implements $LeadSaveResultCopyWith<$Res> {
  factory _$$LeadSaveResultImplCopyWith(_$LeadSaveResultImpl value,
          $Res Function(_$LeadSaveResultImpl) then) =
      __$$LeadSaveResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String? message,
      @JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'LeadCode') String? leadCode,
      @JsonKey(name: 'CustomerID') int? customerId,
      @JsonKey(name: 'PoTypeID') int? poTypeId,
      @JsonKey(name: 'LeadSourceID') int? leadSourceId,
      @JsonKey(name: 'ContactName') String? contactName,
      @JsonKey(name: 'ContactPhone') String? contactPhone,
      @JsonKey(name: 'ContactEmail') String? contactEmail,
      @JsonKey(name: 'MarketingEmployeeID') int? marketingEmployeeId,
      @JsonKey(name: 'Stage') int? stage,
      @JsonKey(name: 'idConCus') int? idConCus});
}

/// @nodoc
class __$$LeadSaveResultImplCopyWithImpl<$Res>
    extends _$LeadSaveResultCopyWithImpl<$Res, _$LeadSaveResultImpl>
    implements _$$LeadSaveResultImplCopyWith<$Res> {
  __$$LeadSaveResultImplCopyWithImpl(
      _$LeadSaveResultImpl _value, $Res Function(_$LeadSaveResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? id = freezed,
    Object? leadCode = freezed,
    Object? customerId = freezed,
    Object? poTypeId = freezed,
    Object? leadSourceId = freezed,
    Object? contactName = freezed,
    Object? contactPhone = freezed,
    Object? contactEmail = freezed,
    Object? marketingEmployeeId = freezed,
    Object? stage = freezed,
    Object? idConCus = freezed,
  }) {
    return _then(_$LeadSaveResultImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      leadCode: freezed == leadCode
          ? _value.leadCode
          : leadCode // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      poTypeId: freezed == poTypeId
          ? _value.poTypeId
          : poTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      leadSourceId: freezed == leadSourceId
          ? _value.leadSourceId
          : leadSourceId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      marketingEmployeeId: freezed == marketingEmployeeId
          ? _value.marketingEmployeeId
          : marketingEmployeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      stage: freezed == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as int?,
      idConCus: freezed == idConCus
          ? _value.idConCus
          : idConCus // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadSaveResultImpl implements _LeadSaveResult {
  const _$LeadSaveResultImpl(
      {@JsonKey(name: 'message') this.message,
      @JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'LeadCode') this.leadCode,
      @JsonKey(name: 'CustomerID') this.customerId,
      @JsonKey(name: 'PoTypeID') this.poTypeId,
      @JsonKey(name: 'LeadSourceID') this.leadSourceId,
      @JsonKey(name: 'ContactName') this.contactName,
      @JsonKey(name: 'ContactPhone') this.contactPhone,
      @JsonKey(name: 'ContactEmail') this.contactEmail,
      @JsonKey(name: 'MarketingEmployeeID') this.marketingEmployeeId,
      @JsonKey(name: 'Stage') this.stage,
      @JsonKey(name: 'idConCus') this.idConCus});

  factory _$LeadSaveResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadSaveResultImplFromJson(json);

  /// Thông báo từ API (vd "Thêm lead thành công!").
  @override
  @JsonKey(name: 'message')
  final String? message;

  /// ID phiếu lead vừa tạo.
  @override
  @JsonKey(name: 'ID')
  final int? id;

  /// Mã phiếu lead (vd "LD-2610-0025").
  @override
  @JsonKey(name: 'LeadCode')
  final String? leadCode;

  /// ID khách hàng gắn với phiếu.
  @override
  @JsonKey(name: 'CustomerID')
  final int? customerId;

  /// ID nhóm hàng (loại PO).
  @override
  @JsonKey(name: 'PoTypeID')
  final int? poTypeId;

  /// ID nguồn lead.
  @override
  @JsonKey(name: 'LeadSourceID')
  final int? leadSourceId;

  /// Họ tên người liên hệ.
  @override
  @JsonKey(name: 'ContactName')
  final String? contactName;

  /// SĐT người liên hệ.
  @override
  @JsonKey(name: 'ContactPhone')
  final String? contactPhone;

  /// Email người liên hệ.
  @override
  @JsonKey(name: 'ContactEmail')
  final String? contactEmail;

  /// ID nhân viên marketing phụ trách.
  @override
  @JsonKey(name: 'MarketingEmployeeID')
  final int? marketingEmployeeId;

  /// Giai đoạn xử lý sau khi tạo.
  @override
  @JsonKey(name: 'Stage')
  final int? stage;

  /// ID liên kết khách hàng trả về từ BE.
  @override
  @JsonKey(name: 'idConCus')
  final int? idConCus;

  @override
  String toString() {
    return 'LeadSaveResult(message: $message, id: $id, leadCode: $leadCode, customerId: $customerId, poTypeId: $poTypeId, leadSourceId: $leadSourceId, contactName: $contactName, contactPhone: $contactPhone, contactEmail: $contactEmail, marketingEmployeeId: $marketingEmployeeId, stage: $stage, idConCus: $idConCus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadSaveResultImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.leadCode, leadCode) ||
                other.leadCode == leadCode) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.poTypeId, poTypeId) ||
                other.poTypeId == poTypeId) &&
            (identical(other.leadSourceId, leadSourceId) ||
                other.leadSourceId == leadSourceId) &&
            (identical(other.contactName, contactName) ||
                other.contactName == contactName) &&
            (identical(other.contactPhone, contactPhone) ||
                other.contactPhone == contactPhone) &&
            (identical(other.contactEmail, contactEmail) ||
                other.contactEmail == contactEmail) &&
            (identical(other.marketingEmployeeId, marketingEmployeeId) ||
                other.marketingEmployeeId == marketingEmployeeId) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.idConCus, idConCus) ||
                other.idConCus == idConCus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      message,
      id,
      leadCode,
      customerId,
      poTypeId,
      leadSourceId,
      contactName,
      contactPhone,
      contactEmail,
      marketingEmployeeId,
      stage,
      idConCus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadSaveResultImplCopyWith<_$LeadSaveResultImpl> get copyWith =>
      __$$LeadSaveResultImplCopyWithImpl<_$LeadSaveResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadSaveResultImplToJson(
      this,
    );
  }
}

abstract class _LeadSaveResult implements LeadSaveResult {
  const factory _LeadSaveResult(
      {@JsonKey(name: 'message') final String? message,
      @JsonKey(name: 'ID') final int? id,
      @JsonKey(name: 'LeadCode') final String? leadCode,
      @JsonKey(name: 'CustomerID') final int? customerId,
      @JsonKey(name: 'PoTypeID') final int? poTypeId,
      @JsonKey(name: 'LeadSourceID') final int? leadSourceId,
      @JsonKey(name: 'ContactName') final String? contactName,
      @JsonKey(name: 'ContactPhone') final String? contactPhone,
      @JsonKey(name: 'ContactEmail') final String? contactEmail,
      @JsonKey(name: 'MarketingEmployeeID') final int? marketingEmployeeId,
      @JsonKey(name: 'Stage') final int? stage,
      @JsonKey(name: 'idConCus') final int? idConCus}) = _$LeadSaveResultImpl;

  factory _LeadSaveResult.fromJson(Map<String, dynamic> json) =
      _$LeadSaveResultImpl.fromJson;

  @override

  /// Thông báo từ API (vd "Thêm lead thành công!").
  @JsonKey(name: 'message')
  String? get message;
  @override

  /// ID phiếu lead vừa tạo.
  @JsonKey(name: 'ID')
  int? get id;
  @override

  /// Mã phiếu lead (vd "LD-2610-0025").
  @JsonKey(name: 'LeadCode')
  String? get leadCode;
  @override

  /// ID khách hàng gắn với phiếu.
  @JsonKey(name: 'CustomerID')
  int? get customerId;
  @override

  /// ID nhóm hàng (loại PO).
  @JsonKey(name: 'PoTypeID')
  int? get poTypeId;
  @override

  /// ID nguồn lead.
  @JsonKey(name: 'LeadSourceID')
  int? get leadSourceId;
  @override

  /// Họ tên người liên hệ.
  @JsonKey(name: 'ContactName')
  String? get contactName;
  @override

  /// SĐT người liên hệ.
  @JsonKey(name: 'ContactPhone')
  String? get contactPhone;
  @override

  /// Email người liên hệ.
  @JsonKey(name: 'ContactEmail')
  String? get contactEmail;
  @override

  /// ID nhân viên marketing phụ trách.
  @JsonKey(name: 'MarketingEmployeeID')
  int? get marketingEmployeeId;
  @override

  /// Giai đoạn xử lý sau khi tạo.
  @JsonKey(name: 'Stage')
  int? get stage;
  @override

  /// ID liên kết khách hàng trả về từ BE.
  @JsonKey(name: 'idConCus')
  int? get idConCus;
  @override
  @JsonKey(ignore: true)
  _$$LeadSaveResultImplCopyWith<_$LeadSaveResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadHandoverResult _$LeadHandoverResultFromJson(Map<String, dynamic> json) {
  return _LeadHandoverResult.fromJson(json);
}

/// @nodoc
mixin _$LeadHandoverResult {
  /// Thông báo từ API (vd "Đã bàn giao 1 lead cho Leader Lê Thị Hải!").
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;

  /// Danh sách ID phiếu lead đã bàn giao thành công.
  @JsonKey(name: 'data')
  List<int>? get ids => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadHandoverResultCopyWith<LeadHandoverResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadHandoverResultCopyWith<$Res> {
  factory $LeadHandoverResultCopyWith(
          LeadHandoverResult value, $Res Function(LeadHandoverResult) then) =
      _$LeadHandoverResultCopyWithImpl<$Res, LeadHandoverResult>;
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') List<int>? ids});
}

/// @nodoc
class _$LeadHandoverResultCopyWithImpl<$Res, $Val extends LeadHandoverResult>
    implements $LeadHandoverResultCopyWith<$Res> {
  _$LeadHandoverResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? ids = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      ids: freezed == ids
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeadHandoverResultImplCopyWith<$Res>
    implements $LeadHandoverResultCopyWith<$Res> {
  factory _$$LeadHandoverResultImplCopyWith(_$LeadHandoverResultImpl value,
          $Res Function(_$LeadHandoverResultImpl) then) =
      __$$LeadHandoverResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') List<int>? ids});
}

/// @nodoc
class __$$LeadHandoverResultImplCopyWithImpl<$Res>
    extends _$LeadHandoverResultCopyWithImpl<$Res, _$LeadHandoverResultImpl>
    implements _$$LeadHandoverResultImplCopyWith<$Res> {
  __$$LeadHandoverResultImplCopyWithImpl(_$LeadHandoverResultImpl _value,
      $Res Function(_$LeadHandoverResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? ids = freezed,
  }) {
    return _then(_$LeadHandoverResultImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      ids: freezed == ids
          ? _value._ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadHandoverResultImpl implements _LeadHandoverResult {
  const _$LeadHandoverResultImpl(
      {@JsonKey(name: 'message') this.message,
      @JsonKey(name: 'data') final List<int>? ids})
      : _ids = ids;

  factory _$LeadHandoverResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadHandoverResultImplFromJson(json);

  /// Thông báo từ API (vd "Đã bàn giao 1 lead cho Leader Lê Thị Hải!").
  @override
  @JsonKey(name: 'message')
  final String? message;

  /// Danh sách ID phiếu lead đã bàn giao thành công.
  final List<int>? _ids;

  /// Danh sách ID phiếu lead đã bàn giao thành công.
  @override
  @JsonKey(name: 'data')
  List<int>? get ids {
    final value = _ids;
    if (value == null) return null;
    if (_ids is EqualUnmodifiableListView) return _ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'LeadHandoverResult(message: $message, ids: $ids)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadHandoverResultImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._ids, _ids));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_ids));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadHandoverResultImplCopyWith<_$LeadHandoverResultImpl> get copyWith =>
      __$$LeadHandoverResultImplCopyWithImpl<_$LeadHandoverResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadHandoverResultImplToJson(
      this,
    );
  }
}

abstract class _LeadHandoverResult implements LeadHandoverResult {
  const factory _LeadHandoverResult(
      {@JsonKey(name: 'message') final String? message,
      @JsonKey(name: 'data') final List<int>? ids}) = _$LeadHandoverResultImpl;

  factory _LeadHandoverResult.fromJson(Map<String, dynamic> json) =
      _$LeadHandoverResultImpl.fromJson;

  @override

  /// Thông báo từ API (vd "Đã bàn giao 1 lead cho Leader Lê Thị Hải!").
  @JsonKey(name: 'message')
  String? get message;
  @override

  /// Danh sách ID phiếu lead đã bàn giao thành công.
  @JsonKey(name: 'data')
  List<int>? get ids;
  @override
  @JsonKey(ignore: true)
  _$$LeadHandoverResultImplCopyWith<_$LeadHandoverResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadActivitySaveResult _$LeadActivitySaveResultFromJson(
    Map<String, dynamic> json) {
  return _LeadActivitySaveResult.fromJson(json);
}

/// @nodoc
mixin _$LeadActivitySaveResult {
  /// Thông báo từ API.
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;

  /// ID hoạt động vừa tạo.
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;

  /// ID phiếu lead chứa hoạt động.
  @JsonKey(name: 'LeadID')
  int? get leadId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadActivitySaveResultCopyWith<LeadActivitySaveResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadActivitySaveResultCopyWith<$Res> {
  factory $LeadActivitySaveResultCopyWith(LeadActivitySaveResult value,
          $Res Function(LeadActivitySaveResult) then) =
      _$LeadActivitySaveResultCopyWithImpl<$Res, LeadActivitySaveResult>;
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String? message,
      @JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'LeadID') int? leadId});
}

/// @nodoc
class _$LeadActivitySaveResultCopyWithImpl<$Res,
        $Val extends LeadActivitySaveResult>
    implements $LeadActivitySaveResultCopyWith<$Res> {
  _$LeadActivitySaveResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? id = freezed,
    Object? leadId = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      leadId: freezed == leadId
          ? _value.leadId
          : leadId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeadActivitySaveResultImplCopyWith<$Res>
    implements $LeadActivitySaveResultCopyWith<$Res> {
  factory _$$LeadActivitySaveResultImplCopyWith(
          _$LeadActivitySaveResultImpl value,
          $Res Function(_$LeadActivitySaveResultImpl) then) =
      __$$LeadActivitySaveResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String? message,
      @JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'LeadID') int? leadId});
}

/// @nodoc
class __$$LeadActivitySaveResultImplCopyWithImpl<$Res>
    extends _$LeadActivitySaveResultCopyWithImpl<$Res,
        _$LeadActivitySaveResultImpl>
    implements _$$LeadActivitySaveResultImplCopyWith<$Res> {
  __$$LeadActivitySaveResultImplCopyWithImpl(
      _$LeadActivitySaveResultImpl _value,
      $Res Function(_$LeadActivitySaveResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? id = freezed,
    Object? leadId = freezed,
  }) {
    return _then(_$LeadActivitySaveResultImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      leadId: freezed == leadId
          ? _value.leadId
          : leadId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadActivitySaveResultImpl implements _LeadActivitySaveResult {
  const _$LeadActivitySaveResultImpl(
      {@JsonKey(name: 'message') this.message,
      @JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'LeadID') this.leadId});

  factory _$LeadActivitySaveResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadActivitySaveResultImplFromJson(json);

  /// Thông báo từ API.
  @override
  @JsonKey(name: 'message')
  final String? message;

  /// ID hoạt động vừa tạo.
  @override
  @JsonKey(name: 'ID')
  final int? id;

  /// ID phiếu lead chứa hoạt động.
  @override
  @JsonKey(name: 'LeadID')
  final int? leadId;

  @override
  String toString() {
    return 'LeadActivitySaveResult(message: $message, id: $id, leadId: $leadId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadActivitySaveResultImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.leadId, leadId) || other.leadId == leadId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, id, leadId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadActivitySaveResultImplCopyWith<_$LeadActivitySaveResultImpl>
      get copyWith => __$$LeadActivitySaveResultImplCopyWithImpl<
          _$LeadActivitySaveResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadActivitySaveResultImplToJson(
      this,
    );
  }
}

abstract class _LeadActivitySaveResult implements LeadActivitySaveResult {
  const factory _LeadActivitySaveResult(
          {@JsonKey(name: 'message') final String? message,
          @JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'LeadID') final int? leadId}) =
      _$LeadActivitySaveResultImpl;

  factory _LeadActivitySaveResult.fromJson(Map<String, dynamic> json) =
      _$LeadActivitySaveResultImpl.fromJson;

  @override

  /// Thông báo từ API.
  @JsonKey(name: 'message')
  String? get message;
  @override

  /// ID hoạt động vừa tạo.
  @JsonKey(name: 'ID')
  int? get id;
  @override

  /// ID phiếu lead chứa hoạt động.
  @JsonKey(name: 'LeadID')
  int? get leadId;
  @override
  @JsonKey(ignore: true)
  _$$LeadActivitySaveResultImplCopyWith<_$LeadActivitySaveResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

LeadActivityType _$LeadActivityTypeFromJson(Map<String, dynamic> json) {
  return _LeadActivityType.fromJson(json);
}

/// @nodoc
mixin _$LeadActivityType {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;

  /// Tên loại nhóm hiển thị cho người dùng.
  @JsonKey(name: 'MainIndex')
  String? get mainIndex => throw _privateConstructorUsedError;
  @JsonKey(name: 'MainGroup')
  int? get mainGroup => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadActivityTypeCopyWith<LeadActivityType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadActivityTypeCopyWith<$Res> {
  factory $LeadActivityTypeCopyWith(
          LeadActivityType value, $Res Function(LeadActivityType) then) =
      _$LeadActivityTypeCopyWithImpl<$Res, LeadActivityType>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'MainIndex') String? mainIndex,
      @JsonKey(name: 'MainGroup') int? mainGroup});
}

/// @nodoc
class _$LeadActivityTypeCopyWithImpl<$Res, $Val extends LeadActivityType>
    implements $LeadActivityTypeCopyWith<$Res> {
  _$LeadActivityTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? mainIndex = freezed,
    Object? mainGroup = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      mainIndex: freezed == mainIndex
          ? _value.mainIndex
          : mainIndex // ignore: cast_nullable_to_non_nullable
              as String?,
      mainGroup: freezed == mainGroup
          ? _value.mainGroup
          : mainGroup // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeadActivityTypeImplCopyWith<$Res>
    implements $LeadActivityTypeCopyWith<$Res> {
  factory _$$LeadActivityTypeImplCopyWith(_$LeadActivityTypeImpl value,
          $Res Function(_$LeadActivityTypeImpl) then) =
      __$$LeadActivityTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'MainIndex') String? mainIndex,
      @JsonKey(name: 'MainGroup') int? mainGroup});
}

/// @nodoc
class __$$LeadActivityTypeImplCopyWithImpl<$Res>
    extends _$LeadActivityTypeCopyWithImpl<$Res, _$LeadActivityTypeImpl>
    implements _$$LeadActivityTypeImplCopyWith<$Res> {
  __$$LeadActivityTypeImplCopyWithImpl(_$LeadActivityTypeImpl _value,
      $Res Function(_$LeadActivityTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? mainIndex = freezed,
    Object? mainGroup = freezed,
  }) {
    return _then(_$LeadActivityTypeImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      mainIndex: freezed == mainIndex
          ? _value.mainIndex
          : mainIndex // ignore: cast_nullable_to_non_nullable
              as String?,
      mainGroup: freezed == mainGroup
          ? _value.mainGroup
          : mainGroup // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadActivityTypeImpl implements _LeadActivityType {
  const _$LeadActivityTypeImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'MainIndex') this.mainIndex,
      @JsonKey(name: 'MainGroup') this.mainGroup});

  factory _$LeadActivityTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadActivityTypeImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;

  /// Tên loại nhóm hiển thị cho người dùng.
  @override
  @JsonKey(name: 'MainIndex')
  final String? mainIndex;
  @override
  @JsonKey(name: 'MainGroup')
  final int? mainGroup;

  @override
  String toString() {
    return 'LeadActivityType(id: $id, mainIndex: $mainIndex, mainGroup: $mainGroup)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadActivityTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mainIndex, mainIndex) ||
                other.mainIndex == mainIndex) &&
            (identical(other.mainGroup, mainGroup) ||
                other.mainGroup == mainGroup));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, mainIndex, mainGroup);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadActivityTypeImplCopyWith<_$LeadActivityTypeImpl> get copyWith =>
      __$$LeadActivityTypeImplCopyWithImpl<_$LeadActivityTypeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadActivityTypeImplToJson(
      this,
    );
  }
}

abstract class _LeadActivityType implements LeadActivityType {
  const factory _LeadActivityType(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'MainIndex') final String? mainIndex,
          @JsonKey(name: 'MainGroup') final int? mainGroup}) =
      _$LeadActivityTypeImpl;

  factory _LeadActivityType.fromJson(Map<String, dynamic> json) =
      _$LeadActivityTypeImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override

  /// Tên loại nhóm hiển thị cho người dùng.
  @JsonKey(name: 'MainIndex')
  String? get mainIndex;
  @override
  @JsonKey(name: 'MainGroup')
  int? get mainGroup;
  @override
  @JsonKey(ignore: true)
  _$$LeadActivityTypeImplCopyWith<_$LeadActivityTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadMarketingItem _$LeadMarketingItemFromJson(Map<String, dynamic> json) {
  return _LeadMarketingItem.fromJson(json);
}

/// @nodoc
mixin _$LeadMarketingItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'LeadCode')
  String? get leadCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'LeadType')
  int? get leadType => throw _privateConstructorUsedError;
  @JsonKey(name: 'LeadTypeName')
  String? get leadTypeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'LeadSourceID')
  int? get leadSourceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'LeadSourceName')
  String? get leadSourceName => throw _privateConstructorUsedError;
  @JsonKey(name: 'CampaignName')
  String? get campaignName => throw _privateConstructorUsedError;
  @JsonKey(name: 'CollectedDate')
  String? get collectedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CompanyName')
  String? get companyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxCode')
  String? get taxCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerIndustriesID')
  int? get customerIndustriesId => throw _privateConstructorUsedError;
  @JsonKey(name: 'IndustryName')
  String? get industryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'BusinessFieldID')
  int? get businessFieldId => throw _privateConstructorUsedError;
  @JsonKey(name: 'BusinessFieldName')
  String? get businessFieldName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Website')
  String? get website => throw _privateConstructorUsedError;
  @JsonKey(name: 'Province')
  String? get province => throw _privateConstructorUsedError;
  @JsonKey(name: 'Address')
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContactName')
  String? get contactName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContactPosition')
  String? get contactPosition => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContactPhone')
  String? get contactPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContactEmail')
  String? get contactEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'NeedDescription')
  String? get needDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductInterest')
  String? get productInterest => throw _privateConstructorUsedError;
  @JsonKey(name: 'EstimatedValue')
  double? get estimatedValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'Rating')
  int? get rating => throw _privateConstructorUsedError;
  @JsonKey(name: 'RatingName')
  String? get ratingName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Stage')
  int? get stage => throw _privateConstructorUsedError;
  @JsonKey(name: 'StageName')
  String? get stageName => throw _privateConstructorUsedError;
  @JsonKey(name: 'MarketingEmployeeID')
  int? get marketingEmployeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'MarketingEmployeeName')
  String? get marketingEmployeeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'QualifiedDate')
  String? get qualifiedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'HandoverDate')
  String? get handoverDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'HandoverBy')
  int? get handoverBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'HandoverLeaderID')
  int? get handoverLeaderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'HandoverLeaderName')
  String? get handoverLeaderName => throw _privateConstructorUsedError;
  @JsonKey(name: 'SaleEmployeeID')
  int? get saleEmployeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SaleEmployeeName')
  String? get saleEmployeeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'AssignedDate')
  String? get assignedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'AssignedBy')
  int? get assignedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'AssignedByName')
  String? get assignedByName => throw _privateConstructorUsedError;
  @JsonKey(name: 'NextFollowUpDate')
  String? get nextFollowUpDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsOverdue')
  bool? get isOverdue => throw _privateConstructorUsedError;
  @JsonKey(name: 'ClosedDate')
  String? get closedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerID')
  int? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerName')
  String? get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerCode')
  String? get customerCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'LostReason')
  String? get lostReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReturnReason')
  String? get returnReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'ActivityCount')
  int? get activityCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'LastActivityDate')
  String? get lastActivityDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  String? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  String? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'PoTypeName')
  String? get poTypeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerType')
  String? get customerType => throw _privateConstructorUsedError;
  @JsonKey(name: 'AdminSaleName')
  String? get adminSaleName => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalMoneyPO')
  double? get totalMoneyPo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadMarketingItemCopyWith<LeadMarketingItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadMarketingItemCopyWith<$Res> {
  factory $LeadMarketingItemCopyWith(
          LeadMarketingItem value, $Res Function(LeadMarketingItem) then) =
      _$LeadMarketingItemCopyWithImpl<$Res, LeadMarketingItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'LeadCode') String? leadCode,
      @JsonKey(name: 'LeadType') int? leadType,
      @JsonKey(name: 'LeadTypeName') String? leadTypeName,
      @JsonKey(name: 'LeadSourceID') int? leadSourceId,
      @JsonKey(name: 'LeadSourceName') String? leadSourceName,
      @JsonKey(name: 'CampaignName') String? campaignName,
      @JsonKey(name: 'CollectedDate') String? collectedDate,
      @JsonKey(name: 'CompanyName') String? companyName,
      @JsonKey(name: 'TaxCode') String? taxCode,
      @JsonKey(name: 'CustomerIndustriesID') int? customerIndustriesId,
      @JsonKey(name: 'IndustryName') String? industryName,
      @JsonKey(name: 'BusinessFieldID') int? businessFieldId,
      @JsonKey(name: 'BusinessFieldName') String? businessFieldName,
      @JsonKey(name: 'Website') String? website,
      @JsonKey(name: 'Province') String? province,
      @JsonKey(name: 'Address') String? address,
      @JsonKey(name: 'ContactName') String? contactName,
      @JsonKey(name: 'ContactPosition') String? contactPosition,
      @JsonKey(name: 'ContactPhone') String? contactPhone,
      @JsonKey(name: 'ContactEmail') String? contactEmail,
      @JsonKey(name: 'NeedDescription') String? needDescription,
      @JsonKey(name: 'ProductInterest') String? productInterest,
      @JsonKey(name: 'EstimatedValue') double? estimatedValue,
      @JsonKey(name: 'Rating') int? rating,
      @JsonKey(name: 'RatingName') String? ratingName,
      @JsonKey(name: 'Stage') int? stage,
      @JsonKey(name: 'StageName') String? stageName,
      @JsonKey(name: 'MarketingEmployeeID') int? marketingEmployeeId,
      @JsonKey(name: 'MarketingEmployeeName') String? marketingEmployeeName,
      @JsonKey(name: 'QualifiedDate') String? qualifiedDate,
      @JsonKey(name: 'HandoverDate') String? handoverDate,
      @JsonKey(name: 'HandoverBy') int? handoverBy,
      @JsonKey(name: 'HandoverLeaderID') int? handoverLeaderId,
      @JsonKey(name: 'HandoverLeaderName') String? handoverLeaderName,
      @JsonKey(name: 'SaleEmployeeID') int? saleEmployeeId,
      @JsonKey(name: 'SaleEmployeeName') String? saleEmployeeName,
      @JsonKey(name: 'AssignedDate') String? assignedDate,
      @JsonKey(name: 'AssignedBy') int? assignedBy,
      @JsonKey(name: 'AssignedByName') String? assignedByName,
      @JsonKey(name: 'NextFollowUpDate') String? nextFollowUpDate,
      @JsonKey(name: 'IsOverdue') bool? isOverdue,
      @JsonKey(name: 'ClosedDate') String? closedDate,
      @JsonKey(name: 'CustomerID') int? customerId,
      @JsonKey(name: 'CustomerName') String? customerName,
      @JsonKey(name: 'CustomerCode') String? customerCode,
      @JsonKey(name: 'LostReason') String? lostReason,
      @JsonKey(name: 'ReturnReason') String? returnReason,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'ActivityCount') int? activityCount,
      @JsonKey(name: 'LastActivityDate') String? lastActivityDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') String? updatedDate,
      @JsonKey(name: 'PoTypeName') String? poTypeName,
      @JsonKey(name: 'CustomerType') String? customerType,
      @JsonKey(name: 'AdminSaleName') String? adminSaleName,
      @JsonKey(name: 'TotalMoneyPO') double? totalMoneyPo});
}

/// @nodoc
class _$LeadMarketingItemCopyWithImpl<$Res, $Val extends LeadMarketingItem>
    implements $LeadMarketingItemCopyWith<$Res> {
  _$LeadMarketingItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? leadCode = freezed,
    Object? leadType = freezed,
    Object? leadTypeName = freezed,
    Object? leadSourceId = freezed,
    Object? leadSourceName = freezed,
    Object? campaignName = freezed,
    Object? collectedDate = freezed,
    Object? companyName = freezed,
    Object? taxCode = freezed,
    Object? customerIndustriesId = freezed,
    Object? industryName = freezed,
    Object? businessFieldId = freezed,
    Object? businessFieldName = freezed,
    Object? website = freezed,
    Object? province = freezed,
    Object? address = freezed,
    Object? contactName = freezed,
    Object? contactPosition = freezed,
    Object? contactPhone = freezed,
    Object? contactEmail = freezed,
    Object? needDescription = freezed,
    Object? productInterest = freezed,
    Object? estimatedValue = freezed,
    Object? rating = freezed,
    Object? ratingName = freezed,
    Object? stage = freezed,
    Object? stageName = freezed,
    Object? marketingEmployeeId = freezed,
    Object? marketingEmployeeName = freezed,
    Object? qualifiedDate = freezed,
    Object? handoverDate = freezed,
    Object? handoverBy = freezed,
    Object? handoverLeaderId = freezed,
    Object? handoverLeaderName = freezed,
    Object? saleEmployeeId = freezed,
    Object? saleEmployeeName = freezed,
    Object? assignedDate = freezed,
    Object? assignedBy = freezed,
    Object? assignedByName = freezed,
    Object? nextFollowUpDate = freezed,
    Object? isOverdue = freezed,
    Object? closedDate = freezed,
    Object? customerId = freezed,
    Object? customerName = freezed,
    Object? customerCode = freezed,
    Object? lostReason = freezed,
    Object? returnReason = freezed,
    Object? note = freezed,
    Object? activityCount = freezed,
    Object? lastActivityDate = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? poTypeName = freezed,
    Object? customerType = freezed,
    Object? adminSaleName = freezed,
    Object? totalMoneyPo = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      leadCode: freezed == leadCode
          ? _value.leadCode
          : leadCode // ignore: cast_nullable_to_non_nullable
              as String?,
      leadType: freezed == leadType
          ? _value.leadType
          : leadType // ignore: cast_nullable_to_non_nullable
              as int?,
      leadTypeName: freezed == leadTypeName
          ? _value.leadTypeName
          : leadTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      leadSourceId: freezed == leadSourceId
          ? _value.leadSourceId
          : leadSourceId // ignore: cast_nullable_to_non_nullable
              as int?,
      leadSourceName: freezed == leadSourceName
          ? _value.leadSourceName
          : leadSourceName // ignore: cast_nullable_to_non_nullable
              as String?,
      campaignName: freezed == campaignName
          ? _value.campaignName
          : campaignName // ignore: cast_nullable_to_non_nullable
              as String?,
      collectedDate: freezed == collectedDate
          ? _value.collectedDate
          : collectedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      taxCode: freezed == taxCode
          ? _value.taxCode
          : taxCode // ignore: cast_nullable_to_non_nullable
              as String?,
      customerIndustriesId: freezed == customerIndustriesId
          ? _value.customerIndustriesId
          : customerIndustriesId // ignore: cast_nullable_to_non_nullable
              as int?,
      industryName: freezed == industryName
          ? _value.industryName
          : industryName // ignore: cast_nullable_to_non_nullable
              as String?,
      businessFieldId: freezed == businessFieldId
          ? _value.businessFieldId
          : businessFieldId // ignore: cast_nullable_to_non_nullable
              as int?,
      businessFieldName: freezed == businessFieldName
          ? _value.businessFieldName
          : businessFieldName // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      contactName: freezed == contactName
          ? _value.contactName
          : contactName // ignore: cast_nullable_to_non_nullable
              as String?,
      contactPosition: freezed == contactPosition
          ? _value.contactPosition
          : contactPosition // ignore: cast_nullable_to_non_nullable
              as String?,
      contactPhone: freezed == contactPhone
          ? _value.contactPhone
          : contactPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      contactEmail: freezed == contactEmail
          ? _value.contactEmail
          : contactEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      needDescription: freezed == needDescription
          ? _value.needDescription
          : needDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      productInterest: freezed == productInterest
          ? _value.productInterest
          : productInterest // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedValue: freezed == estimatedValue
          ? _value.estimatedValue
          : estimatedValue // ignore: cast_nullable_to_non_nullable
              as double?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingName: freezed == ratingName
          ? _value.ratingName
          : ratingName // ignore: cast_nullable_to_non_nullable
              as String?,
      stage: freezed == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as int?,
      stageName: freezed == stageName
          ? _value.stageName
          : stageName // ignore: cast_nullable_to_non_nullable
              as String?,
      marketingEmployeeId: freezed == marketingEmployeeId
          ? _value.marketingEmployeeId
          : marketingEmployeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      marketingEmployeeName: freezed == marketingEmployeeName
          ? _value.marketingEmployeeName
          : marketingEmployeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      qualifiedDate: freezed == qualifiedDate
          ? _value.qualifiedDate
          : qualifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      handoverDate: freezed == handoverDate
          ? _value.handoverDate
          : handoverDate // ignore: cast_nullable_to_non_nullable
              as String?,
      handoverBy: freezed == handoverBy
          ? _value.handoverBy
          : handoverBy // ignore: cast_nullable_to_non_nullable
              as int?,
      handoverLeaderId: freezed == handoverLeaderId
          ? _value.handoverLeaderId
          : handoverLeaderId // ignore: cast_nullable_to_non_nullable
              as int?,
      handoverLeaderName: freezed == handoverLeaderName
          ? _value.handoverLeaderName
          : handoverLeaderName // ignore: cast_nullable_to_non_nullable
              as String?,
      saleEmployeeId: freezed == saleEmployeeId
          ? _value.saleEmployeeId
          : saleEmployeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      saleEmployeeName: freezed == saleEmployeeName
          ? _value.saleEmployeeName
          : saleEmployeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedDate: freezed == assignedDate
          ? _value.assignedDate
          : assignedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedBy: freezed == assignedBy
          ? _value.assignedBy
          : assignedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      assignedByName: freezed == assignedByName
          ? _value.assignedByName
          : assignedByName // ignore: cast_nullable_to_non_nullable
              as String?,
      nextFollowUpDate: freezed == nextFollowUpDate
          ? _value.nextFollowUpDate
          : nextFollowUpDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isOverdue: freezed == isOverdue
          ? _value.isOverdue
          : isOverdue // ignore: cast_nullable_to_non_nullable
              as bool?,
      closedDate: freezed == closedDate
          ? _value.closedDate
          : closedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerCode: freezed == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      lostReason: freezed == lostReason
          ? _value.lostReason
          : lostReason // ignore: cast_nullable_to_non_nullable
              as String?,
      returnReason: freezed == returnReason
          ? _value.returnReason
          : returnReason // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      activityCount: freezed == activityCount
          ? _value.activityCount
          : activityCount // ignore: cast_nullable_to_non_nullable
              as int?,
      lastActivityDate: freezed == lastActivityDate
          ? _value.lastActivityDate
          : lastActivityDate // ignore: cast_nullable_to_non_nullable
              as String?,
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
      poTypeName: freezed == poTypeName
          ? _value.poTypeName
          : poTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerType: freezed == customerType
          ? _value.customerType
          : customerType // ignore: cast_nullable_to_non_nullable
              as String?,
      adminSaleName: freezed == adminSaleName
          ? _value.adminSaleName
          : adminSaleName // ignore: cast_nullable_to_non_nullable
              as String?,
      totalMoneyPo: freezed == totalMoneyPo
          ? _value.totalMoneyPo
          : totalMoneyPo // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeadMarketingItemImplCopyWith<$Res>
    implements $LeadMarketingItemCopyWith<$Res> {
  factory _$$LeadMarketingItemImplCopyWith(_$LeadMarketingItemImpl value,
          $Res Function(_$LeadMarketingItemImpl) then) =
      __$$LeadMarketingItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'LeadCode') String? leadCode,
      @JsonKey(name: 'LeadType') int? leadType,
      @JsonKey(name: 'LeadTypeName') String? leadTypeName,
      @JsonKey(name: 'LeadSourceID') int? leadSourceId,
      @JsonKey(name: 'LeadSourceName') String? leadSourceName,
      @JsonKey(name: 'CampaignName') String? campaignName,
      @JsonKey(name: 'CollectedDate') String? collectedDate,
      @JsonKey(name: 'CompanyName') String? companyName,
      @JsonKey(name: 'TaxCode') String? taxCode,
      @JsonKey(name: 'CustomerIndustriesID') int? customerIndustriesId,
      @JsonKey(name: 'IndustryName') String? industryName,
      @JsonKey(name: 'BusinessFieldID') int? businessFieldId,
      @JsonKey(name: 'BusinessFieldName') String? businessFieldName,
      @JsonKey(name: 'Website') String? website,
      @JsonKey(name: 'Province') String? province,
      @JsonKey(name: 'Address') String? address,
      @JsonKey(name: 'ContactName') String? contactName,
      @JsonKey(name: 'ContactPosition') String? contactPosition,
      @JsonKey(name: 'ContactPhone') String? contactPhone,
      @JsonKey(name: 'ContactEmail') String? contactEmail,
      @JsonKey(name: 'NeedDescription') String? needDescription,
      @JsonKey(name: 'ProductInterest') String? productInterest,
      @JsonKey(name: 'EstimatedValue') double? estimatedValue,
      @JsonKey(name: 'Rating') int? rating,
      @JsonKey(name: 'RatingName') String? ratingName,
      @JsonKey(name: 'Stage') int? stage,
      @JsonKey(name: 'StageName') String? stageName,
      @JsonKey(name: 'MarketingEmployeeID') int? marketingEmployeeId,
      @JsonKey(name: 'MarketingEmployeeName') String? marketingEmployeeName,
      @JsonKey(name: 'QualifiedDate') String? qualifiedDate,
      @JsonKey(name: 'HandoverDate') String? handoverDate,
      @JsonKey(name: 'HandoverBy') int? handoverBy,
      @JsonKey(name: 'HandoverLeaderID') int? handoverLeaderId,
      @JsonKey(name: 'HandoverLeaderName') String? handoverLeaderName,
      @JsonKey(name: 'SaleEmployeeID') int? saleEmployeeId,
      @JsonKey(name: 'SaleEmployeeName') String? saleEmployeeName,
      @JsonKey(name: 'AssignedDate') String? assignedDate,
      @JsonKey(name: 'AssignedBy') int? assignedBy,
      @JsonKey(name: 'AssignedByName') String? assignedByName,
      @JsonKey(name: 'NextFollowUpDate') String? nextFollowUpDate,
      @JsonKey(name: 'IsOverdue') bool? isOverdue,
      @JsonKey(name: 'ClosedDate') String? closedDate,
      @JsonKey(name: 'CustomerID') int? customerId,
      @JsonKey(name: 'CustomerName') String? customerName,
      @JsonKey(name: 'CustomerCode') String? customerCode,
      @JsonKey(name: 'LostReason') String? lostReason,
      @JsonKey(name: 'ReturnReason') String? returnReason,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'ActivityCount') int? activityCount,
      @JsonKey(name: 'LastActivityDate') String? lastActivityDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') String? updatedDate,
      @JsonKey(name: 'PoTypeName') String? poTypeName,
      @JsonKey(name: 'CustomerType') String? customerType,
      @JsonKey(name: 'AdminSaleName') String? adminSaleName,
      @JsonKey(name: 'TotalMoneyPO') double? totalMoneyPo});
}

/// @nodoc
class __$$LeadMarketingItemImplCopyWithImpl<$Res>
    extends _$LeadMarketingItemCopyWithImpl<$Res, _$LeadMarketingItemImpl>
    implements _$$LeadMarketingItemImplCopyWith<$Res> {
  __$$LeadMarketingItemImplCopyWithImpl(_$LeadMarketingItemImpl _value,
      $Res Function(_$LeadMarketingItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? leadCode = freezed,
    Object? leadType = freezed,
    Object? leadTypeName = freezed,
    Object? leadSourceId = freezed,
    Object? leadSourceName = freezed,
    Object? campaignName = freezed,
    Object? collectedDate = freezed,
    Object? companyName = freezed,
    Object? taxCode = freezed,
    Object? customerIndustriesId = freezed,
    Object? industryName = freezed,
    Object? businessFieldId = freezed,
    Object? businessFieldName = freezed,
    Object? website = freezed,
    Object? province = freezed,
    Object? address = freezed,
    Object? contactName = freezed,
    Object? contactPosition = freezed,
    Object? contactPhone = freezed,
    Object? contactEmail = freezed,
    Object? needDescription = freezed,
    Object? productInterest = freezed,
    Object? estimatedValue = freezed,
    Object? rating = freezed,
    Object? ratingName = freezed,
    Object? stage = freezed,
    Object? stageName = freezed,
    Object? marketingEmployeeId = freezed,
    Object? marketingEmployeeName = freezed,
    Object? qualifiedDate = freezed,
    Object? handoverDate = freezed,
    Object? handoverBy = freezed,
    Object? handoverLeaderId = freezed,
    Object? handoverLeaderName = freezed,
    Object? saleEmployeeId = freezed,
    Object? saleEmployeeName = freezed,
    Object? assignedDate = freezed,
    Object? assignedBy = freezed,
    Object? assignedByName = freezed,
    Object? nextFollowUpDate = freezed,
    Object? isOverdue = freezed,
    Object? closedDate = freezed,
    Object? customerId = freezed,
    Object? customerName = freezed,
    Object? customerCode = freezed,
    Object? lostReason = freezed,
    Object? returnReason = freezed,
    Object? note = freezed,
    Object? activityCount = freezed,
    Object? lastActivityDate = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? poTypeName = freezed,
    Object? customerType = freezed,
    Object? adminSaleName = freezed,
    Object? totalMoneyPo = freezed,
  }) {
    return _then(_$LeadMarketingItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      leadCode: freezed == leadCode
          ? _value.leadCode
          : leadCode // ignore: cast_nullable_to_non_nullable
              as String?,
      leadType: freezed == leadType
          ? _value.leadType
          : leadType // ignore: cast_nullable_to_non_nullable
              as int?,
      leadTypeName: freezed == leadTypeName
          ? _value.leadTypeName
          : leadTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      leadSourceId: freezed == leadSourceId
          ? _value.leadSourceId
          : leadSourceId // ignore: cast_nullable_to_non_nullable
              as int?,
      leadSourceName: freezed == leadSourceName
          ? _value.leadSourceName
          : leadSourceName // ignore: cast_nullable_to_non_nullable
              as String?,
      campaignName: freezed == campaignName
          ? _value.campaignName
          : campaignName // ignore: cast_nullable_to_non_nullable
              as String?,
      collectedDate: freezed == collectedDate
          ? _value.collectedDate
          : collectedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      taxCode: freezed == taxCode
          ? _value.taxCode
          : taxCode // ignore: cast_nullable_to_non_nullable
              as String?,
      customerIndustriesId: freezed == customerIndustriesId
          ? _value.customerIndustriesId
          : customerIndustriesId // ignore: cast_nullable_to_non_nullable
              as int?,
      industryName: freezed == industryName
          ? _value.industryName
          : industryName // ignore: cast_nullable_to_non_nullable
              as String?,
      businessFieldId: freezed == businessFieldId
          ? _value.businessFieldId
          : businessFieldId // ignore: cast_nullable_to_non_nullable
              as int?,
      businessFieldName: freezed == businessFieldName
          ? _value.businessFieldName
          : businessFieldName // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      contactName: freezed == contactName
          ? _value.contactName
          : contactName // ignore: cast_nullable_to_non_nullable
              as String?,
      contactPosition: freezed == contactPosition
          ? _value.contactPosition
          : contactPosition // ignore: cast_nullable_to_non_nullable
              as String?,
      contactPhone: freezed == contactPhone
          ? _value.contactPhone
          : contactPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      contactEmail: freezed == contactEmail
          ? _value.contactEmail
          : contactEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      needDescription: freezed == needDescription
          ? _value.needDescription
          : needDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      productInterest: freezed == productInterest
          ? _value.productInterest
          : productInterest // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedValue: freezed == estimatedValue
          ? _value.estimatedValue
          : estimatedValue // ignore: cast_nullable_to_non_nullable
              as double?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingName: freezed == ratingName
          ? _value.ratingName
          : ratingName // ignore: cast_nullable_to_non_nullable
              as String?,
      stage: freezed == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as int?,
      stageName: freezed == stageName
          ? _value.stageName
          : stageName // ignore: cast_nullable_to_non_nullable
              as String?,
      marketingEmployeeId: freezed == marketingEmployeeId
          ? _value.marketingEmployeeId
          : marketingEmployeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      marketingEmployeeName: freezed == marketingEmployeeName
          ? _value.marketingEmployeeName
          : marketingEmployeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      qualifiedDate: freezed == qualifiedDate
          ? _value.qualifiedDate
          : qualifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      handoverDate: freezed == handoverDate
          ? _value.handoverDate
          : handoverDate // ignore: cast_nullable_to_non_nullable
              as String?,
      handoverBy: freezed == handoverBy
          ? _value.handoverBy
          : handoverBy // ignore: cast_nullable_to_non_nullable
              as int?,
      handoverLeaderId: freezed == handoverLeaderId
          ? _value.handoverLeaderId
          : handoverLeaderId // ignore: cast_nullable_to_non_nullable
              as int?,
      handoverLeaderName: freezed == handoverLeaderName
          ? _value.handoverLeaderName
          : handoverLeaderName // ignore: cast_nullable_to_non_nullable
              as String?,
      saleEmployeeId: freezed == saleEmployeeId
          ? _value.saleEmployeeId
          : saleEmployeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      saleEmployeeName: freezed == saleEmployeeName
          ? _value.saleEmployeeName
          : saleEmployeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedDate: freezed == assignedDate
          ? _value.assignedDate
          : assignedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedBy: freezed == assignedBy
          ? _value.assignedBy
          : assignedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      assignedByName: freezed == assignedByName
          ? _value.assignedByName
          : assignedByName // ignore: cast_nullable_to_non_nullable
              as String?,
      nextFollowUpDate: freezed == nextFollowUpDate
          ? _value.nextFollowUpDate
          : nextFollowUpDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isOverdue: freezed == isOverdue
          ? _value.isOverdue
          : isOverdue // ignore: cast_nullable_to_non_nullable
              as bool?,
      closedDate: freezed == closedDate
          ? _value.closedDate
          : closedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerCode: freezed == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      lostReason: freezed == lostReason
          ? _value.lostReason
          : lostReason // ignore: cast_nullable_to_non_nullable
              as String?,
      returnReason: freezed == returnReason
          ? _value.returnReason
          : returnReason // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      activityCount: freezed == activityCount
          ? _value.activityCount
          : activityCount // ignore: cast_nullable_to_non_nullable
              as int?,
      lastActivityDate: freezed == lastActivityDate
          ? _value.lastActivityDate
          : lastActivityDate // ignore: cast_nullable_to_non_nullable
              as String?,
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
      poTypeName: freezed == poTypeName
          ? _value.poTypeName
          : poTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerType: freezed == customerType
          ? _value.customerType
          : customerType // ignore: cast_nullable_to_non_nullable
              as String?,
      adminSaleName: freezed == adminSaleName
          ? _value.adminSaleName
          : adminSaleName // ignore: cast_nullable_to_non_nullable
              as String?,
      totalMoneyPo: freezed == totalMoneyPo
          ? _value.totalMoneyPo
          : totalMoneyPo // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadMarketingItemImpl implements _LeadMarketingItem {
  const _$LeadMarketingItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'LeadCode') this.leadCode,
      @JsonKey(name: 'LeadType') this.leadType,
      @JsonKey(name: 'LeadTypeName') this.leadTypeName,
      @JsonKey(name: 'LeadSourceID') this.leadSourceId,
      @JsonKey(name: 'LeadSourceName') this.leadSourceName,
      @JsonKey(name: 'CampaignName') this.campaignName,
      @JsonKey(name: 'CollectedDate') this.collectedDate,
      @JsonKey(name: 'CompanyName') this.companyName,
      @JsonKey(name: 'TaxCode') this.taxCode,
      @JsonKey(name: 'CustomerIndustriesID') this.customerIndustriesId,
      @JsonKey(name: 'IndustryName') this.industryName,
      @JsonKey(name: 'BusinessFieldID') this.businessFieldId,
      @JsonKey(name: 'BusinessFieldName') this.businessFieldName,
      @JsonKey(name: 'Website') this.website,
      @JsonKey(name: 'Province') this.province,
      @JsonKey(name: 'Address') this.address,
      @JsonKey(name: 'ContactName') this.contactName,
      @JsonKey(name: 'ContactPosition') this.contactPosition,
      @JsonKey(name: 'ContactPhone') this.contactPhone,
      @JsonKey(name: 'ContactEmail') this.contactEmail,
      @JsonKey(name: 'NeedDescription') this.needDescription,
      @JsonKey(name: 'ProductInterest') this.productInterest,
      @JsonKey(name: 'EstimatedValue') this.estimatedValue,
      @JsonKey(name: 'Rating') this.rating,
      @JsonKey(name: 'RatingName') this.ratingName,
      @JsonKey(name: 'Stage') this.stage,
      @JsonKey(name: 'StageName') this.stageName,
      @JsonKey(name: 'MarketingEmployeeID') this.marketingEmployeeId,
      @JsonKey(name: 'MarketingEmployeeName') this.marketingEmployeeName,
      @JsonKey(name: 'QualifiedDate') this.qualifiedDate,
      @JsonKey(name: 'HandoverDate') this.handoverDate,
      @JsonKey(name: 'HandoverBy') this.handoverBy,
      @JsonKey(name: 'HandoverLeaderID') this.handoverLeaderId,
      @JsonKey(name: 'HandoverLeaderName') this.handoverLeaderName,
      @JsonKey(name: 'SaleEmployeeID') this.saleEmployeeId,
      @JsonKey(name: 'SaleEmployeeName') this.saleEmployeeName,
      @JsonKey(name: 'AssignedDate') this.assignedDate,
      @JsonKey(name: 'AssignedBy') this.assignedBy,
      @JsonKey(name: 'AssignedByName') this.assignedByName,
      @JsonKey(name: 'NextFollowUpDate') this.nextFollowUpDate,
      @JsonKey(name: 'IsOverdue') this.isOverdue,
      @JsonKey(name: 'ClosedDate') this.closedDate,
      @JsonKey(name: 'CustomerID') this.customerId,
      @JsonKey(name: 'CustomerName') this.customerName,
      @JsonKey(name: 'CustomerCode') this.customerCode,
      @JsonKey(name: 'LostReason') this.lostReason,
      @JsonKey(name: 'ReturnReason') this.returnReason,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'ActivityCount') this.activityCount,
      @JsonKey(name: 'LastActivityDate') this.lastActivityDate,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'PoTypeName') this.poTypeName,
      @JsonKey(name: 'CustomerType') this.customerType,
      @JsonKey(name: 'AdminSaleName') this.adminSaleName,
      @JsonKey(name: 'TotalMoneyPO') this.totalMoneyPo});

  factory _$LeadMarketingItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadMarketingItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'LeadCode')
  final String? leadCode;
  @override
  @JsonKey(name: 'LeadType')
  final int? leadType;
  @override
  @JsonKey(name: 'LeadTypeName')
  final String? leadTypeName;
  @override
  @JsonKey(name: 'LeadSourceID')
  final int? leadSourceId;
  @override
  @JsonKey(name: 'LeadSourceName')
  final String? leadSourceName;
  @override
  @JsonKey(name: 'CampaignName')
  final String? campaignName;
  @override
  @JsonKey(name: 'CollectedDate')
  final String? collectedDate;
  @override
  @JsonKey(name: 'CompanyName')
  final String? companyName;
  @override
  @JsonKey(name: 'TaxCode')
  final String? taxCode;
  @override
  @JsonKey(name: 'CustomerIndustriesID')
  final int? customerIndustriesId;
  @override
  @JsonKey(name: 'IndustryName')
  final String? industryName;
  @override
  @JsonKey(name: 'BusinessFieldID')
  final int? businessFieldId;
  @override
  @JsonKey(name: 'BusinessFieldName')
  final String? businessFieldName;
  @override
  @JsonKey(name: 'Website')
  final String? website;
  @override
  @JsonKey(name: 'Province')
  final String? province;
  @override
  @JsonKey(name: 'Address')
  final String? address;
  @override
  @JsonKey(name: 'ContactName')
  final String? contactName;
  @override
  @JsonKey(name: 'ContactPosition')
  final String? contactPosition;
  @override
  @JsonKey(name: 'ContactPhone')
  final String? contactPhone;
  @override
  @JsonKey(name: 'ContactEmail')
  final String? contactEmail;
  @override
  @JsonKey(name: 'NeedDescription')
  final String? needDescription;
  @override
  @JsonKey(name: 'ProductInterest')
  final String? productInterest;
  @override
  @JsonKey(name: 'EstimatedValue')
  final double? estimatedValue;
  @override
  @JsonKey(name: 'Rating')
  final int? rating;
  @override
  @JsonKey(name: 'RatingName')
  final String? ratingName;
  @override
  @JsonKey(name: 'Stage')
  final int? stage;
  @override
  @JsonKey(name: 'StageName')
  final String? stageName;
  @override
  @JsonKey(name: 'MarketingEmployeeID')
  final int? marketingEmployeeId;
  @override
  @JsonKey(name: 'MarketingEmployeeName')
  final String? marketingEmployeeName;
  @override
  @JsonKey(name: 'QualifiedDate')
  final String? qualifiedDate;
  @override
  @JsonKey(name: 'HandoverDate')
  final String? handoverDate;
  @override
  @JsonKey(name: 'HandoverBy')
  final int? handoverBy;
  @override
  @JsonKey(name: 'HandoverLeaderID')
  final int? handoverLeaderId;
  @override
  @JsonKey(name: 'HandoverLeaderName')
  final String? handoverLeaderName;
  @override
  @JsonKey(name: 'SaleEmployeeID')
  final int? saleEmployeeId;
  @override
  @JsonKey(name: 'SaleEmployeeName')
  final String? saleEmployeeName;
  @override
  @JsonKey(name: 'AssignedDate')
  final String? assignedDate;
  @override
  @JsonKey(name: 'AssignedBy')
  final int? assignedBy;
  @override
  @JsonKey(name: 'AssignedByName')
  final String? assignedByName;
  @override
  @JsonKey(name: 'NextFollowUpDate')
  final String? nextFollowUpDate;
  @override
  @JsonKey(name: 'IsOverdue')
  final bool? isOverdue;
  @override
  @JsonKey(name: 'ClosedDate')
  final String? closedDate;
  @override
  @JsonKey(name: 'CustomerID')
  final int? customerId;
  @override
  @JsonKey(name: 'CustomerName')
  final String? customerName;
  @override
  @JsonKey(name: 'CustomerCode')
  final String? customerCode;
  @override
  @JsonKey(name: 'LostReason')
  final String? lostReason;
  @override
  @JsonKey(name: 'ReturnReason')
  final String? returnReason;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'ActivityCount')
  final int? activityCount;
  @override
  @JsonKey(name: 'LastActivityDate')
  final String? lastActivityDate;
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
  @JsonKey(name: 'PoTypeName')
  final String? poTypeName;
  @override
  @JsonKey(name: 'CustomerType')
  final String? customerType;
  @override
  @JsonKey(name: 'AdminSaleName')
  final String? adminSaleName;
  @override
  @JsonKey(name: 'TotalMoneyPO')
  final double? totalMoneyPo;

  @override
  String toString() {
    return 'LeadMarketingItem(id: $id, leadCode: $leadCode, leadType: $leadType, leadTypeName: $leadTypeName, leadSourceId: $leadSourceId, leadSourceName: $leadSourceName, campaignName: $campaignName, collectedDate: $collectedDate, companyName: $companyName, taxCode: $taxCode, customerIndustriesId: $customerIndustriesId, industryName: $industryName, businessFieldId: $businessFieldId, businessFieldName: $businessFieldName, website: $website, province: $province, address: $address, contactName: $contactName, contactPosition: $contactPosition, contactPhone: $contactPhone, contactEmail: $contactEmail, needDescription: $needDescription, productInterest: $productInterest, estimatedValue: $estimatedValue, rating: $rating, ratingName: $ratingName, stage: $stage, stageName: $stageName, marketingEmployeeId: $marketingEmployeeId, marketingEmployeeName: $marketingEmployeeName, qualifiedDate: $qualifiedDate, handoverDate: $handoverDate, handoverBy: $handoverBy, handoverLeaderId: $handoverLeaderId, handoverLeaderName: $handoverLeaderName, saleEmployeeId: $saleEmployeeId, saleEmployeeName: $saleEmployeeName, assignedDate: $assignedDate, assignedBy: $assignedBy, assignedByName: $assignedByName, nextFollowUpDate: $nextFollowUpDate, isOverdue: $isOverdue, closedDate: $closedDate, customerId: $customerId, customerName: $customerName, customerCode: $customerCode, lostReason: $lostReason, returnReason: $returnReason, note: $note, activityCount: $activityCount, lastActivityDate: $lastActivityDate, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate, poTypeName: $poTypeName, customerType: $customerType, adminSaleName: $adminSaleName, totalMoneyPo: $totalMoneyPo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadMarketingItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.leadCode, leadCode) ||
                other.leadCode == leadCode) &&
            (identical(other.leadType, leadType) ||
                other.leadType == leadType) &&
            (identical(other.leadTypeName, leadTypeName) ||
                other.leadTypeName == leadTypeName) &&
            (identical(other.leadSourceId, leadSourceId) ||
                other.leadSourceId == leadSourceId) &&
            (identical(other.leadSourceName, leadSourceName) ||
                other.leadSourceName == leadSourceName) &&
            (identical(other.campaignName, campaignName) ||
                other.campaignName == campaignName) &&
            (identical(other.collectedDate, collectedDate) ||
                other.collectedDate == collectedDate) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.taxCode, taxCode) || other.taxCode == taxCode) &&
            (identical(other.customerIndustriesId, customerIndustriesId) ||
                other.customerIndustriesId == customerIndustriesId) &&
            (identical(other.industryName, industryName) ||
                other.industryName == industryName) &&
            (identical(other.businessFieldId, businessFieldId) ||
                other.businessFieldId == businessFieldId) &&
            (identical(other.businessFieldName, businessFieldName) ||
                other.businessFieldName == businessFieldName) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.contactName, contactName) ||
                other.contactName == contactName) &&
            (identical(other.contactPosition, contactPosition) ||
                other.contactPosition == contactPosition) &&
            (identical(other.contactPhone, contactPhone) ||
                other.contactPhone == contactPhone) &&
            (identical(other.contactEmail, contactEmail) ||
                other.contactEmail == contactEmail) &&
            (identical(other.needDescription, needDescription) ||
                other.needDescription == needDescription) &&
            (identical(other.productInterest, productInterest) ||
                other.productInterest == productInterest) &&
            (identical(other.estimatedValue, estimatedValue) ||
                other.estimatedValue == estimatedValue) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.ratingName, ratingName) ||
                other.ratingName == ratingName) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.stageName, stageName) ||
                other.stageName == stageName) &&
            (identical(other.marketingEmployeeId, marketingEmployeeId) ||
                other.marketingEmployeeId == marketingEmployeeId) &&
            (identical(other.marketingEmployeeName, marketingEmployeeName) ||
                other.marketingEmployeeName == marketingEmployeeName) &&
            (identical(other.qualifiedDate, qualifiedDate) ||
                other.qualifiedDate == qualifiedDate) &&
            (identical(other.handoverDate, handoverDate) ||
                other.handoverDate == handoverDate) &&
            (identical(other.handoverBy, handoverBy) ||
                other.handoverBy == handoverBy) &&
            (identical(other.handoverLeaderId, handoverLeaderId) ||
                other.handoverLeaderId == handoverLeaderId) &&
            (identical(other.handoverLeaderName, handoverLeaderName) ||
                other.handoverLeaderName == handoverLeaderName) &&
            (identical(other.saleEmployeeId, saleEmployeeId) ||
                other.saleEmployeeId == saleEmployeeId) &&
            (identical(other.saleEmployeeName, saleEmployeeName) ||
                other.saleEmployeeName == saleEmployeeName) &&
            (identical(other.assignedDate, assignedDate) ||
                other.assignedDate == assignedDate) &&
            (identical(other.assignedBy, assignedBy) ||
                other.assignedBy == assignedBy) &&
            (identical(other.assignedByName, assignedByName) ||
                other.assignedByName == assignedByName) &&
            (identical(other.nextFollowUpDate, nextFollowUpDate) ||
                other.nextFollowUpDate == nextFollowUpDate) &&
            (identical(other.isOverdue, isOverdue) ||
                other.isOverdue == isOverdue) &&
            (identical(other.closedDate, closedDate) ||
                other.closedDate == closedDate) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.lostReason, lostReason) ||
                other.lostReason == lostReason) &&
            (identical(other.returnReason, returnReason) ||
                other.returnReason == returnReason) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.activityCount, activityCount) ||
                other.activityCount == activityCount) &&
            (identical(other.lastActivityDate, lastActivityDate) || other.lastActivityDate == lastActivityDate) &&
            (identical(other.createdBy, createdBy) || other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) || other.createdDate == createdDate) &&
            (identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy) &&
            (identical(other.updatedDate, updatedDate) || other.updatedDate == updatedDate) &&
            (identical(other.poTypeName, poTypeName) || other.poTypeName == poTypeName) &&
            (identical(other.customerType, customerType) || other.customerType == customerType) &&
            (identical(other.adminSaleName, adminSaleName) || other.adminSaleName == adminSaleName) &&
            (identical(other.totalMoneyPo, totalMoneyPo) || other.totalMoneyPo == totalMoneyPo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        leadCode,
        leadType,
        leadTypeName,
        leadSourceId,
        leadSourceName,
        campaignName,
        collectedDate,
        companyName,
        taxCode,
        customerIndustriesId,
        industryName,
        businessFieldId,
        businessFieldName,
        website,
        province,
        address,
        contactName,
        contactPosition,
        contactPhone,
        contactEmail,
        needDescription,
        productInterest,
        estimatedValue,
        rating,
        ratingName,
        stage,
        stageName,
        marketingEmployeeId,
        marketingEmployeeName,
        qualifiedDate,
        handoverDate,
        handoverBy,
        handoverLeaderId,
        handoverLeaderName,
        saleEmployeeId,
        saleEmployeeName,
        assignedDate,
        assignedBy,
        assignedByName,
        nextFollowUpDate,
        isOverdue,
        closedDate,
        customerId,
        customerName,
        customerCode,
        lostReason,
        returnReason,
        note,
        activityCount,
        lastActivityDate,
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        poTypeName,
        customerType,
        adminSaleName,
        totalMoneyPo
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadMarketingItemImplCopyWith<_$LeadMarketingItemImpl> get copyWith =>
      __$$LeadMarketingItemImplCopyWithImpl<_$LeadMarketingItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadMarketingItemImplToJson(
      this,
    );
  }
}

abstract class _LeadMarketingItem implements LeadMarketingItem {
  const factory _LeadMarketingItem(
      {@JsonKey(name: 'ID') final int? id,
      @JsonKey(name: 'LeadCode') final String? leadCode,
      @JsonKey(name: 'LeadType') final int? leadType,
      @JsonKey(name: 'LeadTypeName') final String? leadTypeName,
      @JsonKey(name: 'LeadSourceID') final int? leadSourceId,
      @JsonKey(name: 'LeadSourceName') final String? leadSourceName,
      @JsonKey(name: 'CampaignName') final String? campaignName,
      @JsonKey(name: 'CollectedDate') final String? collectedDate,
      @JsonKey(name: 'CompanyName') final String? companyName,
      @JsonKey(name: 'TaxCode') final String? taxCode,
      @JsonKey(name: 'CustomerIndustriesID') final int? customerIndustriesId,
      @JsonKey(name: 'IndustryName') final String? industryName,
      @JsonKey(name: 'BusinessFieldID') final int? businessFieldId,
      @JsonKey(name: 'BusinessFieldName') final String? businessFieldName,
      @JsonKey(name: 'Website') final String? website,
      @JsonKey(name: 'Province') final String? province,
      @JsonKey(name: 'Address') final String? address,
      @JsonKey(name: 'ContactName') final String? contactName,
      @JsonKey(name: 'ContactPosition') final String? contactPosition,
      @JsonKey(name: 'ContactPhone') final String? contactPhone,
      @JsonKey(name: 'ContactEmail') final String? contactEmail,
      @JsonKey(name: 'NeedDescription') final String? needDescription,
      @JsonKey(name: 'ProductInterest') final String? productInterest,
      @JsonKey(name: 'EstimatedValue') final double? estimatedValue,
      @JsonKey(name: 'Rating') final int? rating,
      @JsonKey(name: 'RatingName') final String? ratingName,
      @JsonKey(name: 'Stage') final int? stage,
      @JsonKey(name: 'StageName') final String? stageName,
      @JsonKey(name: 'MarketingEmployeeID') final int? marketingEmployeeId,
      @JsonKey(name: 'MarketingEmployeeName')
      final String? marketingEmployeeName,
      @JsonKey(name: 'QualifiedDate') final String? qualifiedDate,
      @JsonKey(name: 'HandoverDate') final String? handoverDate,
      @JsonKey(name: 'HandoverBy') final int? handoverBy,
      @JsonKey(name: 'HandoverLeaderID') final int? handoverLeaderId,
      @JsonKey(name: 'HandoverLeaderName') final String? handoverLeaderName,
      @JsonKey(name: 'SaleEmployeeID') final int? saleEmployeeId,
      @JsonKey(name: 'SaleEmployeeName') final String? saleEmployeeName,
      @JsonKey(name: 'AssignedDate') final String? assignedDate,
      @JsonKey(name: 'AssignedBy') final int? assignedBy,
      @JsonKey(name: 'AssignedByName') final String? assignedByName,
      @JsonKey(name: 'NextFollowUpDate') final String? nextFollowUpDate,
      @JsonKey(name: 'IsOverdue') final bool? isOverdue,
      @JsonKey(name: 'ClosedDate') final String? closedDate,
      @JsonKey(name: 'CustomerID') final int? customerId,
      @JsonKey(name: 'CustomerName') final String? customerName,
      @JsonKey(name: 'CustomerCode') final String? customerCode,
      @JsonKey(name: 'LostReason') final String? lostReason,
      @JsonKey(name: 'ReturnReason') final String? returnReason,
      @JsonKey(name: 'Note') final String? note,
      @JsonKey(name: 'ActivityCount') final int? activityCount,
      @JsonKey(name: 'LastActivityDate') final String? lastActivityDate,
      @JsonKey(name: 'CreatedBy') final String? createdBy,
      @JsonKey(name: 'CreatedDate') final String? createdDate,
      @JsonKey(name: 'UpdatedBy') final String? updatedBy,
      @JsonKey(name: 'UpdatedDate') final String? updatedDate,
      @JsonKey(name: 'PoTypeName') final String? poTypeName,
      @JsonKey(name: 'CustomerType') final String? customerType,
      @JsonKey(name: 'AdminSaleName') final String? adminSaleName,
      @JsonKey(name: 'TotalMoneyPO')
      final double? totalMoneyPo}) = _$LeadMarketingItemImpl;

  factory _LeadMarketingItem.fromJson(Map<String, dynamic> json) =
      _$LeadMarketingItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'LeadCode')
  String? get leadCode;
  @override
  @JsonKey(name: 'LeadType')
  int? get leadType;
  @override
  @JsonKey(name: 'LeadTypeName')
  String? get leadTypeName;
  @override
  @JsonKey(name: 'LeadSourceID')
  int? get leadSourceId;
  @override
  @JsonKey(name: 'LeadSourceName')
  String? get leadSourceName;
  @override
  @JsonKey(name: 'CampaignName')
  String? get campaignName;
  @override
  @JsonKey(name: 'CollectedDate')
  String? get collectedDate;
  @override
  @JsonKey(name: 'CompanyName')
  String? get companyName;
  @override
  @JsonKey(name: 'TaxCode')
  String? get taxCode;
  @override
  @JsonKey(name: 'CustomerIndustriesID')
  int? get customerIndustriesId;
  @override
  @JsonKey(name: 'IndustryName')
  String? get industryName;
  @override
  @JsonKey(name: 'BusinessFieldID')
  int? get businessFieldId;
  @override
  @JsonKey(name: 'BusinessFieldName')
  String? get businessFieldName;
  @override
  @JsonKey(name: 'Website')
  String? get website;
  @override
  @JsonKey(name: 'Province')
  String? get province;
  @override
  @JsonKey(name: 'Address')
  String? get address;
  @override
  @JsonKey(name: 'ContactName')
  String? get contactName;
  @override
  @JsonKey(name: 'ContactPosition')
  String? get contactPosition;
  @override
  @JsonKey(name: 'ContactPhone')
  String? get contactPhone;
  @override
  @JsonKey(name: 'ContactEmail')
  String? get contactEmail;
  @override
  @JsonKey(name: 'NeedDescription')
  String? get needDescription;
  @override
  @JsonKey(name: 'ProductInterest')
  String? get productInterest;
  @override
  @JsonKey(name: 'EstimatedValue')
  double? get estimatedValue;
  @override
  @JsonKey(name: 'Rating')
  int? get rating;
  @override
  @JsonKey(name: 'RatingName')
  String? get ratingName;
  @override
  @JsonKey(name: 'Stage')
  int? get stage;
  @override
  @JsonKey(name: 'StageName')
  String? get stageName;
  @override
  @JsonKey(name: 'MarketingEmployeeID')
  int? get marketingEmployeeId;
  @override
  @JsonKey(name: 'MarketingEmployeeName')
  String? get marketingEmployeeName;
  @override
  @JsonKey(name: 'QualifiedDate')
  String? get qualifiedDate;
  @override
  @JsonKey(name: 'HandoverDate')
  String? get handoverDate;
  @override
  @JsonKey(name: 'HandoverBy')
  int? get handoverBy;
  @override
  @JsonKey(name: 'HandoverLeaderID')
  int? get handoverLeaderId;
  @override
  @JsonKey(name: 'HandoverLeaderName')
  String? get handoverLeaderName;
  @override
  @JsonKey(name: 'SaleEmployeeID')
  int? get saleEmployeeId;
  @override
  @JsonKey(name: 'SaleEmployeeName')
  String? get saleEmployeeName;
  @override
  @JsonKey(name: 'AssignedDate')
  String? get assignedDate;
  @override
  @JsonKey(name: 'AssignedBy')
  int? get assignedBy;
  @override
  @JsonKey(name: 'AssignedByName')
  String? get assignedByName;
  @override
  @JsonKey(name: 'NextFollowUpDate')
  String? get nextFollowUpDate;
  @override
  @JsonKey(name: 'IsOverdue')
  bool? get isOverdue;
  @override
  @JsonKey(name: 'ClosedDate')
  String? get closedDate;
  @override
  @JsonKey(name: 'CustomerID')
  int? get customerId;
  @override
  @JsonKey(name: 'CustomerName')
  String? get customerName;
  @override
  @JsonKey(name: 'CustomerCode')
  String? get customerCode;
  @override
  @JsonKey(name: 'LostReason')
  String? get lostReason;
  @override
  @JsonKey(name: 'ReturnReason')
  String? get returnReason;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'ActivityCount')
  int? get activityCount;
  @override
  @JsonKey(name: 'LastActivityDate')
  String? get lastActivityDate;
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
  @JsonKey(name: 'PoTypeName')
  String? get poTypeName;
  @override
  @JsonKey(name: 'CustomerType')
  String? get customerType;
  @override
  @JsonKey(name: 'AdminSaleName')
  String? get adminSaleName;
  @override
  @JsonKey(name: 'TotalMoneyPO')
  double? get totalMoneyPo;
  @override
  @JsonKey(ignore: true)
  _$$LeadMarketingItemImplCopyWith<_$LeadMarketingItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadDetail _$LeadDetailFromJson(Map<String, dynamic> json) {
  return _LeadDetail.fromJson(json);
}

/// @nodoc
mixin _$LeadDetail {
  /// Thông tin phiếu lead.
  @JsonKey(name: 'lead')
  LeadDetailLead? get lead => throw _privateConstructorUsedError;

  /// Danh sách hoạt động đã ghi nhận trên phiếu.
  @JsonKey(name: 'activities')
  List<LeadActivity>? get activities => throw _privateConstructorUsedError;

  /// Lịch sử chuyển giai đoạn / phân công của phiếu.
  @JsonKey(name: 'logs')
  List<LeadLog>? get logs => throw _privateConstructorUsedError;

  /// Các hành động người dùng hiện tại được phép thực hiện.
  @JsonKey(name: 'actions')
  LeadActions? get actions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadDetailCopyWith<LeadDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadDetailCopyWith<$Res> {
  factory $LeadDetailCopyWith(
          LeadDetail value, $Res Function(LeadDetail) then) =
      _$LeadDetailCopyWithImpl<$Res, LeadDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'lead') LeadDetailLead? lead,
      @JsonKey(name: 'activities') List<LeadActivity>? activities,
      @JsonKey(name: 'logs') List<LeadLog>? logs,
      @JsonKey(name: 'actions') LeadActions? actions});

  $LeadDetailLeadCopyWith<$Res>? get lead;
  $LeadActionsCopyWith<$Res>? get actions;
}

/// @nodoc
class _$LeadDetailCopyWithImpl<$Res, $Val extends LeadDetail>
    implements $LeadDetailCopyWith<$Res> {
  _$LeadDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lead = freezed,
    Object? activities = freezed,
    Object? logs = freezed,
    Object? actions = freezed,
  }) {
    return _then(_value.copyWith(
      lead: freezed == lead
          ? _value.lead
          : lead // ignore: cast_nullable_to_non_nullable
              as LeadDetailLead?,
      activities: freezed == activities
          ? _value.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<LeadActivity>?,
      logs: freezed == logs
          ? _value.logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<LeadLog>?,
      actions: freezed == actions
          ? _value.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as LeadActions?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LeadDetailLeadCopyWith<$Res>? get lead {
    if (_value.lead == null) {
      return null;
    }

    return $LeadDetailLeadCopyWith<$Res>(_value.lead!, (value) {
      return _then(_value.copyWith(lead: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LeadActionsCopyWith<$Res>? get actions {
    if (_value.actions == null) {
      return null;
    }

    return $LeadActionsCopyWith<$Res>(_value.actions!, (value) {
      return _then(_value.copyWith(actions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LeadDetailImplCopyWith<$Res>
    implements $LeadDetailCopyWith<$Res> {
  factory _$$LeadDetailImplCopyWith(
          _$LeadDetailImpl value, $Res Function(_$LeadDetailImpl) then) =
      __$$LeadDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'lead') LeadDetailLead? lead,
      @JsonKey(name: 'activities') List<LeadActivity>? activities,
      @JsonKey(name: 'logs') List<LeadLog>? logs,
      @JsonKey(name: 'actions') LeadActions? actions});

  @override
  $LeadDetailLeadCopyWith<$Res>? get lead;
  @override
  $LeadActionsCopyWith<$Res>? get actions;
}

/// @nodoc
class __$$LeadDetailImplCopyWithImpl<$Res>
    extends _$LeadDetailCopyWithImpl<$Res, _$LeadDetailImpl>
    implements _$$LeadDetailImplCopyWith<$Res> {
  __$$LeadDetailImplCopyWithImpl(
      _$LeadDetailImpl _value, $Res Function(_$LeadDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lead = freezed,
    Object? activities = freezed,
    Object? logs = freezed,
    Object? actions = freezed,
  }) {
    return _then(_$LeadDetailImpl(
      lead: freezed == lead
          ? _value.lead
          : lead // ignore: cast_nullable_to_non_nullable
              as LeadDetailLead?,
      activities: freezed == activities
          ? _value._activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<LeadActivity>?,
      logs: freezed == logs
          ? _value._logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<LeadLog>?,
      actions: freezed == actions
          ? _value.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as LeadActions?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadDetailImpl implements _LeadDetail {
  const _$LeadDetailImpl(
      {@JsonKey(name: 'lead') this.lead,
      @JsonKey(name: 'activities') final List<LeadActivity>? activities,
      @JsonKey(name: 'logs') final List<LeadLog>? logs,
      @JsonKey(name: 'actions') this.actions})
      : _activities = activities,
        _logs = logs;

  factory _$LeadDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadDetailImplFromJson(json);

  /// Thông tin phiếu lead.
  @override
  @JsonKey(name: 'lead')
  final LeadDetailLead? lead;

  /// Danh sách hoạt động đã ghi nhận trên phiếu.
  final List<LeadActivity>? _activities;

  /// Danh sách hoạt động đã ghi nhận trên phiếu.
  @override
  @JsonKey(name: 'activities')
  List<LeadActivity>? get activities {
    final value = _activities;
    if (value == null) return null;
    if (_activities is EqualUnmodifiableListView) return _activities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Lịch sử chuyển giai đoạn / phân công của phiếu.
  final List<LeadLog>? _logs;

  /// Lịch sử chuyển giai đoạn / phân công của phiếu.
  @override
  @JsonKey(name: 'logs')
  List<LeadLog>? get logs {
    final value = _logs;
    if (value == null) return null;
    if (_logs is EqualUnmodifiableListView) return _logs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Các hành động người dùng hiện tại được phép thực hiện.
  @override
  @JsonKey(name: 'actions')
  final LeadActions? actions;

  @override
  String toString() {
    return 'LeadDetail(lead: $lead, activities: $activities, logs: $logs, actions: $actions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadDetailImpl &&
            (identical(other.lead, lead) || other.lead == lead) &&
            const DeepCollectionEquality()
                .equals(other._activities, _activities) &&
            const DeepCollectionEquality().equals(other._logs, _logs) &&
            (identical(other.actions, actions) || other.actions == actions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      lead,
      const DeepCollectionEquality().hash(_activities),
      const DeepCollectionEquality().hash(_logs),
      actions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadDetailImplCopyWith<_$LeadDetailImpl> get copyWith =>
      __$$LeadDetailImplCopyWithImpl<_$LeadDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadDetailImplToJson(
      this,
    );
  }
}

abstract class _LeadDetail implements LeadDetail {
  const factory _LeadDetail(
      {@JsonKey(name: 'lead') final LeadDetailLead? lead,
      @JsonKey(name: 'activities') final List<LeadActivity>? activities,
      @JsonKey(name: 'logs') final List<LeadLog>? logs,
      @JsonKey(name: 'actions') final LeadActions? actions}) = _$LeadDetailImpl;

  factory _LeadDetail.fromJson(Map<String, dynamic> json) =
      _$LeadDetailImpl.fromJson;

  @override

  /// Thông tin phiếu lead.
  @JsonKey(name: 'lead')
  LeadDetailLead? get lead;
  @override

  /// Danh sách hoạt động đã ghi nhận trên phiếu.
  @JsonKey(name: 'activities')
  List<LeadActivity>? get activities;
  @override

  /// Lịch sử chuyển giai đoạn / phân công của phiếu.
  @JsonKey(name: 'logs')
  List<LeadLog>? get logs;
  @override

  /// Các hành động người dùng hiện tại được phép thực hiện.
  @JsonKey(name: 'actions')
  LeadActions? get actions;
  @override
  @JsonKey(ignore: true)
  _$$LeadDetailImplCopyWith<_$LeadDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadDetailLead _$LeadDetailLeadFromJson(Map<String, dynamic> json) {
  return _LeadDetailLead.fromJson(json);
}

/// @nodoc
mixin _$LeadDetailLead {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'LeadCode')
  String? get leadCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'LeadType')
  int? get leadType => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerID')
  int? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerTeam')
  String? get customerTeam => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerPart')
  String? get customerPart => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerPosition')
  String? get customerPosition => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerType')
  int? get customerType => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContactName')
  String? get contactName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContactPosition')
  String? get contactPosition => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContactPhone')
  String? get contactPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContactEmail')
  String? get contactEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContactAppointmentDate')
  String? get contactAppointmentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  String? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CollectedDate')
  String? get collectedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'LeadSourceID')
  int? get leadSourceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CampaignName')
  String? get campaignName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Rating')
  int? get rating => throw _privateConstructorUsedError;
  @JsonKey(name: 'EstimatedValue')
  double? get estimatedValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductInterest')
  String? get productInterest => throw _privateConstructorUsedError;
  @JsonKey(name: 'NeedDescription')
  String? get needDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'Website')
  String? get website => throw _privateConstructorUsedError;
  @JsonKey(name: 'SaleEmployeeID')
  int? get saleEmployeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'MarketingEmployeeID')
  int? get marketingEmployeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Stage')
  int? get stage => throw _privateConstructorUsedError;
  @JsonKey(name: 'HandoverLeaderID')
  int? get handoverLeaderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'AdminSaleID')
  int? get adminSaleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'HandoverDate')
  String? get handoverDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'HandoverBy')
  int? get handoverBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'QualifiedDate')
  String? get qualifiedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'LostReason')
  String? get lostReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'ClosedDate')
  String? get closedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReturnReason')
  String? get returnReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'AssignedDate')
  String? get assignedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'AssignedBy')
  int? get assignedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'NextFollowUpDate')
  String? get nextFollowUpDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'PoReason')
  String? get poReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'PoDate')
  String? get poDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'PoTypeID')
  int? get poTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  String? get updatedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadDetailLeadCopyWith<LeadDetailLead> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadDetailLeadCopyWith<$Res> {
  factory $LeadDetailLeadCopyWith(
          LeadDetailLead value, $Res Function(LeadDetailLead) then) =
      _$LeadDetailLeadCopyWithImpl<$Res, LeadDetailLead>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'LeadCode') String? leadCode,
      @JsonKey(name: 'LeadType') int? leadType,
      @JsonKey(name: 'CustomerID') int? customerId,
      @JsonKey(name: 'CustomerTeam') String? customerTeam,
      @JsonKey(name: 'CustomerPart') String? customerPart,
      @JsonKey(name: 'CustomerPosition') String? customerPosition,
      @JsonKey(name: 'CustomerType') int? customerType,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'ContactName') String? contactName,
      @JsonKey(name: 'ContactPosition') String? contactPosition,
      @JsonKey(name: 'ContactPhone') String? contactPhone,
      @JsonKey(name: 'ContactEmail') String? contactEmail,
      @JsonKey(name: 'ContactAppointmentDate') String? contactAppointmentDate,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'CollectedDate') String? collectedDate,
      @JsonKey(name: 'LeadSourceID') int? leadSourceId,
      @JsonKey(name: 'CampaignName') String? campaignName,
      @JsonKey(name: 'Rating') int? rating,
      @JsonKey(name: 'EstimatedValue') double? estimatedValue,
      @JsonKey(name: 'ProductInterest') String? productInterest,
      @JsonKey(name: 'NeedDescription') String? needDescription,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'Website') String? website,
      @JsonKey(name: 'SaleEmployeeID') int? saleEmployeeId,
      @JsonKey(name: 'MarketingEmployeeID') int? marketingEmployeeId,
      @JsonKey(name: 'Stage') int? stage,
      @JsonKey(name: 'HandoverLeaderID') int? handoverLeaderId,
      @JsonKey(name: 'AdminSaleID') int? adminSaleId,
      @JsonKey(name: 'HandoverDate') String? handoverDate,
      @JsonKey(name: 'HandoverBy') int? handoverBy,
      @JsonKey(name: 'QualifiedDate') String? qualifiedDate,
      @JsonKey(name: 'LostReason') String? lostReason,
      @JsonKey(name: 'ClosedDate') String? closedDate,
      @JsonKey(name: 'ReturnReason') String? returnReason,
      @JsonKey(name: 'AssignedDate') String? assignedDate,
      @JsonKey(name: 'AssignedBy') int? assignedBy,
      @JsonKey(name: 'NextFollowUpDate') String? nextFollowUpDate,
      @JsonKey(name: 'PoReason') String? poReason,
      @JsonKey(name: 'PoDate') String? poDate,
      @JsonKey(name: 'PoTypeID') int? poTypeId,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') String? updatedDate});
}

/// @nodoc
class _$LeadDetailLeadCopyWithImpl<$Res, $Val extends LeadDetailLead>
    implements $LeadDetailLeadCopyWith<$Res> {
  _$LeadDetailLeadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? leadCode = freezed,
    Object? leadType = freezed,
    Object? customerId = freezed,
    Object? customerTeam = freezed,
    Object? customerPart = freezed,
    Object? customerPosition = freezed,
    Object? customerType = freezed,
    Object? isDeleted = freezed,
    Object? contactName = freezed,
    Object? contactPosition = freezed,
    Object? contactPhone = freezed,
    Object? contactEmail = freezed,
    Object? contactAppointmentDate = freezed,
    Object? createdDate = freezed,
    Object? collectedDate = freezed,
    Object? leadSourceId = freezed,
    Object? campaignName = freezed,
    Object? rating = freezed,
    Object? estimatedValue = freezed,
    Object? productInterest = freezed,
    Object? needDescription = freezed,
    Object? note = freezed,
    Object? website = freezed,
    Object? saleEmployeeId = freezed,
    Object? marketingEmployeeId = freezed,
    Object? stage = freezed,
    Object? handoverLeaderId = freezed,
    Object? adminSaleId = freezed,
    Object? handoverDate = freezed,
    Object? handoverBy = freezed,
    Object? qualifiedDate = freezed,
    Object? lostReason = freezed,
    Object? closedDate = freezed,
    Object? returnReason = freezed,
    Object? assignedDate = freezed,
    Object? assignedBy = freezed,
    Object? nextFollowUpDate = freezed,
    Object? poReason = freezed,
    Object? poDate = freezed,
    Object? poTypeId = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      leadCode: freezed == leadCode
          ? _value.leadCode
          : leadCode // ignore: cast_nullable_to_non_nullable
              as String?,
      leadType: freezed == leadType
          ? _value.leadType
          : leadType // ignore: cast_nullable_to_non_nullable
              as int?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      customerTeam: freezed == customerTeam
          ? _value.customerTeam
          : customerTeam // ignore: cast_nullable_to_non_nullable
              as String?,
      customerPart: freezed == customerPart
          ? _value.customerPart
          : customerPart // ignore: cast_nullable_to_non_nullable
              as String?,
      customerPosition: freezed == customerPosition
          ? _value.customerPosition
          : customerPosition // ignore: cast_nullable_to_non_nullable
              as String?,
      customerType: freezed == customerType
          ? _value.customerType
          : customerType // ignore: cast_nullable_to_non_nullable
              as int?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      contactName: freezed == contactName
          ? _value.contactName
          : contactName // ignore: cast_nullable_to_non_nullable
              as String?,
      contactPosition: freezed == contactPosition
          ? _value.contactPosition
          : contactPosition // ignore: cast_nullable_to_non_nullable
              as String?,
      contactPhone: freezed == contactPhone
          ? _value.contactPhone
          : contactPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      contactEmail: freezed == contactEmail
          ? _value.contactEmail
          : contactEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      contactAppointmentDate: freezed == contactAppointmentDate
          ? _value.contactAppointmentDate
          : contactAppointmentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      collectedDate: freezed == collectedDate
          ? _value.collectedDate
          : collectedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      leadSourceId: freezed == leadSourceId
          ? _value.leadSourceId
          : leadSourceId // ignore: cast_nullable_to_non_nullable
              as int?,
      campaignName: freezed == campaignName
          ? _value.campaignName
          : campaignName // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      estimatedValue: freezed == estimatedValue
          ? _value.estimatedValue
          : estimatedValue // ignore: cast_nullable_to_non_nullable
              as double?,
      productInterest: freezed == productInterest
          ? _value.productInterest
          : productInterest // ignore: cast_nullable_to_non_nullable
              as String?,
      needDescription: freezed == needDescription
          ? _value.needDescription
          : needDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      saleEmployeeId: freezed == saleEmployeeId
          ? _value.saleEmployeeId
          : saleEmployeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      marketingEmployeeId: freezed == marketingEmployeeId
          ? _value.marketingEmployeeId
          : marketingEmployeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      stage: freezed == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as int?,
      handoverLeaderId: freezed == handoverLeaderId
          ? _value.handoverLeaderId
          : handoverLeaderId // ignore: cast_nullable_to_non_nullable
              as int?,
      adminSaleId: freezed == adminSaleId
          ? _value.adminSaleId
          : adminSaleId // ignore: cast_nullable_to_non_nullable
              as int?,
      handoverDate: freezed == handoverDate
          ? _value.handoverDate
          : handoverDate // ignore: cast_nullable_to_non_nullable
              as String?,
      handoverBy: freezed == handoverBy
          ? _value.handoverBy
          : handoverBy // ignore: cast_nullable_to_non_nullable
              as int?,
      qualifiedDate: freezed == qualifiedDate
          ? _value.qualifiedDate
          : qualifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      lostReason: freezed == lostReason
          ? _value.lostReason
          : lostReason // ignore: cast_nullable_to_non_nullable
              as String?,
      closedDate: freezed == closedDate
          ? _value.closedDate
          : closedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      returnReason: freezed == returnReason
          ? _value.returnReason
          : returnReason // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedDate: freezed == assignedDate
          ? _value.assignedDate
          : assignedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedBy: freezed == assignedBy
          ? _value.assignedBy
          : assignedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      nextFollowUpDate: freezed == nextFollowUpDate
          ? _value.nextFollowUpDate
          : nextFollowUpDate // ignore: cast_nullable_to_non_nullable
              as String?,
      poReason: freezed == poReason
          ? _value.poReason
          : poReason // ignore: cast_nullable_to_non_nullable
              as String?,
      poDate: freezed == poDate
          ? _value.poDate
          : poDate // ignore: cast_nullable_to_non_nullable
              as String?,
      poTypeId: freezed == poTypeId
          ? _value.poTypeId
          : poTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
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
abstract class _$$LeadDetailLeadImplCopyWith<$Res>
    implements $LeadDetailLeadCopyWith<$Res> {
  factory _$$LeadDetailLeadImplCopyWith(_$LeadDetailLeadImpl value,
          $Res Function(_$LeadDetailLeadImpl) then) =
      __$$LeadDetailLeadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'LeadCode') String? leadCode,
      @JsonKey(name: 'LeadType') int? leadType,
      @JsonKey(name: 'CustomerID') int? customerId,
      @JsonKey(name: 'CustomerTeam') String? customerTeam,
      @JsonKey(name: 'CustomerPart') String? customerPart,
      @JsonKey(name: 'CustomerPosition') String? customerPosition,
      @JsonKey(name: 'CustomerType') int? customerType,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'ContactName') String? contactName,
      @JsonKey(name: 'ContactPosition') String? contactPosition,
      @JsonKey(name: 'ContactPhone') String? contactPhone,
      @JsonKey(name: 'ContactEmail') String? contactEmail,
      @JsonKey(name: 'ContactAppointmentDate') String? contactAppointmentDate,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'CollectedDate') String? collectedDate,
      @JsonKey(name: 'LeadSourceID') int? leadSourceId,
      @JsonKey(name: 'CampaignName') String? campaignName,
      @JsonKey(name: 'Rating') int? rating,
      @JsonKey(name: 'EstimatedValue') double? estimatedValue,
      @JsonKey(name: 'ProductInterest') String? productInterest,
      @JsonKey(name: 'NeedDescription') String? needDescription,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'Website') String? website,
      @JsonKey(name: 'SaleEmployeeID') int? saleEmployeeId,
      @JsonKey(name: 'MarketingEmployeeID') int? marketingEmployeeId,
      @JsonKey(name: 'Stage') int? stage,
      @JsonKey(name: 'HandoverLeaderID') int? handoverLeaderId,
      @JsonKey(name: 'AdminSaleID') int? adminSaleId,
      @JsonKey(name: 'HandoverDate') String? handoverDate,
      @JsonKey(name: 'HandoverBy') int? handoverBy,
      @JsonKey(name: 'QualifiedDate') String? qualifiedDate,
      @JsonKey(name: 'LostReason') String? lostReason,
      @JsonKey(name: 'ClosedDate') String? closedDate,
      @JsonKey(name: 'ReturnReason') String? returnReason,
      @JsonKey(name: 'AssignedDate') String? assignedDate,
      @JsonKey(name: 'AssignedBy') int? assignedBy,
      @JsonKey(name: 'NextFollowUpDate') String? nextFollowUpDate,
      @JsonKey(name: 'PoReason') String? poReason,
      @JsonKey(name: 'PoDate') String? poDate,
      @JsonKey(name: 'PoTypeID') int? poTypeId,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') String? updatedDate});
}

/// @nodoc
class __$$LeadDetailLeadImplCopyWithImpl<$Res>
    extends _$LeadDetailLeadCopyWithImpl<$Res, _$LeadDetailLeadImpl>
    implements _$$LeadDetailLeadImplCopyWith<$Res> {
  __$$LeadDetailLeadImplCopyWithImpl(
      _$LeadDetailLeadImpl _value, $Res Function(_$LeadDetailLeadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? leadCode = freezed,
    Object? leadType = freezed,
    Object? customerId = freezed,
    Object? customerTeam = freezed,
    Object? customerPart = freezed,
    Object? customerPosition = freezed,
    Object? customerType = freezed,
    Object? isDeleted = freezed,
    Object? contactName = freezed,
    Object? contactPosition = freezed,
    Object? contactPhone = freezed,
    Object? contactEmail = freezed,
    Object? contactAppointmentDate = freezed,
    Object? createdDate = freezed,
    Object? collectedDate = freezed,
    Object? leadSourceId = freezed,
    Object? campaignName = freezed,
    Object? rating = freezed,
    Object? estimatedValue = freezed,
    Object? productInterest = freezed,
    Object? needDescription = freezed,
    Object? note = freezed,
    Object? website = freezed,
    Object? saleEmployeeId = freezed,
    Object? marketingEmployeeId = freezed,
    Object? stage = freezed,
    Object? handoverLeaderId = freezed,
    Object? adminSaleId = freezed,
    Object? handoverDate = freezed,
    Object? handoverBy = freezed,
    Object? qualifiedDate = freezed,
    Object? lostReason = freezed,
    Object? closedDate = freezed,
    Object? returnReason = freezed,
    Object? assignedDate = freezed,
    Object? assignedBy = freezed,
    Object? nextFollowUpDate = freezed,
    Object? poReason = freezed,
    Object? poDate = freezed,
    Object? poTypeId = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
  }) {
    return _then(_$LeadDetailLeadImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      leadCode: freezed == leadCode
          ? _value.leadCode
          : leadCode // ignore: cast_nullable_to_non_nullable
              as String?,
      leadType: freezed == leadType
          ? _value.leadType
          : leadType // ignore: cast_nullable_to_non_nullable
              as int?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      customerTeam: freezed == customerTeam
          ? _value.customerTeam
          : customerTeam // ignore: cast_nullable_to_non_nullable
              as String?,
      customerPart: freezed == customerPart
          ? _value.customerPart
          : customerPart // ignore: cast_nullable_to_non_nullable
              as String?,
      customerPosition: freezed == customerPosition
          ? _value.customerPosition
          : customerPosition // ignore: cast_nullable_to_non_nullable
              as String?,
      customerType: freezed == customerType
          ? _value.customerType
          : customerType // ignore: cast_nullable_to_non_nullable
              as int?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      contactName: freezed == contactName
          ? _value.contactName
          : contactName // ignore: cast_nullable_to_non_nullable
              as String?,
      contactPosition: freezed == contactPosition
          ? _value.contactPosition
          : contactPosition // ignore: cast_nullable_to_non_nullable
              as String?,
      contactPhone: freezed == contactPhone
          ? _value.contactPhone
          : contactPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      contactEmail: freezed == contactEmail
          ? _value.contactEmail
          : contactEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      contactAppointmentDate: freezed == contactAppointmentDate
          ? _value.contactAppointmentDate
          : contactAppointmentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      collectedDate: freezed == collectedDate
          ? _value.collectedDate
          : collectedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      leadSourceId: freezed == leadSourceId
          ? _value.leadSourceId
          : leadSourceId // ignore: cast_nullable_to_non_nullable
              as int?,
      campaignName: freezed == campaignName
          ? _value.campaignName
          : campaignName // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      estimatedValue: freezed == estimatedValue
          ? _value.estimatedValue
          : estimatedValue // ignore: cast_nullable_to_non_nullable
              as double?,
      productInterest: freezed == productInterest
          ? _value.productInterest
          : productInterest // ignore: cast_nullable_to_non_nullable
              as String?,
      needDescription: freezed == needDescription
          ? _value.needDescription
          : needDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      saleEmployeeId: freezed == saleEmployeeId
          ? _value.saleEmployeeId
          : saleEmployeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      marketingEmployeeId: freezed == marketingEmployeeId
          ? _value.marketingEmployeeId
          : marketingEmployeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      stage: freezed == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as int?,
      handoverLeaderId: freezed == handoverLeaderId
          ? _value.handoverLeaderId
          : handoverLeaderId // ignore: cast_nullable_to_non_nullable
              as int?,
      adminSaleId: freezed == adminSaleId
          ? _value.adminSaleId
          : adminSaleId // ignore: cast_nullable_to_non_nullable
              as int?,
      handoverDate: freezed == handoverDate
          ? _value.handoverDate
          : handoverDate // ignore: cast_nullable_to_non_nullable
              as String?,
      handoverBy: freezed == handoverBy
          ? _value.handoverBy
          : handoverBy // ignore: cast_nullable_to_non_nullable
              as int?,
      qualifiedDate: freezed == qualifiedDate
          ? _value.qualifiedDate
          : qualifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      lostReason: freezed == lostReason
          ? _value.lostReason
          : lostReason // ignore: cast_nullable_to_non_nullable
              as String?,
      closedDate: freezed == closedDate
          ? _value.closedDate
          : closedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      returnReason: freezed == returnReason
          ? _value.returnReason
          : returnReason // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedDate: freezed == assignedDate
          ? _value.assignedDate
          : assignedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedBy: freezed == assignedBy
          ? _value.assignedBy
          : assignedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      nextFollowUpDate: freezed == nextFollowUpDate
          ? _value.nextFollowUpDate
          : nextFollowUpDate // ignore: cast_nullable_to_non_nullable
              as String?,
      poReason: freezed == poReason
          ? _value.poReason
          : poReason // ignore: cast_nullable_to_non_nullable
              as String?,
      poDate: freezed == poDate
          ? _value.poDate
          : poDate // ignore: cast_nullable_to_non_nullable
              as String?,
      poTypeId: freezed == poTypeId
          ? _value.poTypeId
          : poTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
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
class _$LeadDetailLeadImpl implements _LeadDetailLead {
  const _$LeadDetailLeadImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'LeadCode') this.leadCode,
      @JsonKey(name: 'LeadType') this.leadType,
      @JsonKey(name: 'CustomerID') this.customerId,
      @JsonKey(name: 'CustomerTeam') this.customerTeam,
      @JsonKey(name: 'CustomerPart') this.customerPart,
      @JsonKey(name: 'CustomerPosition') this.customerPosition,
      @JsonKey(name: 'CustomerType') this.customerType,
      @JsonKey(name: 'IsDeleted') this.isDeleted,
      @JsonKey(name: 'ContactName') this.contactName,
      @JsonKey(name: 'ContactPosition') this.contactPosition,
      @JsonKey(name: 'ContactPhone') this.contactPhone,
      @JsonKey(name: 'ContactEmail') this.contactEmail,
      @JsonKey(name: 'ContactAppointmentDate') this.contactAppointmentDate,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'CollectedDate') this.collectedDate,
      @JsonKey(name: 'LeadSourceID') this.leadSourceId,
      @JsonKey(name: 'CampaignName') this.campaignName,
      @JsonKey(name: 'Rating') this.rating,
      @JsonKey(name: 'EstimatedValue') this.estimatedValue,
      @JsonKey(name: 'ProductInterest') this.productInterest,
      @JsonKey(name: 'NeedDescription') this.needDescription,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'Website') this.website,
      @JsonKey(name: 'SaleEmployeeID') this.saleEmployeeId,
      @JsonKey(name: 'MarketingEmployeeID') this.marketingEmployeeId,
      @JsonKey(name: 'Stage') this.stage,
      @JsonKey(name: 'HandoverLeaderID') this.handoverLeaderId,
      @JsonKey(name: 'AdminSaleID') this.adminSaleId,
      @JsonKey(name: 'HandoverDate') this.handoverDate,
      @JsonKey(name: 'HandoverBy') this.handoverBy,
      @JsonKey(name: 'QualifiedDate') this.qualifiedDate,
      @JsonKey(name: 'LostReason') this.lostReason,
      @JsonKey(name: 'ClosedDate') this.closedDate,
      @JsonKey(name: 'ReturnReason') this.returnReason,
      @JsonKey(name: 'AssignedDate') this.assignedDate,
      @JsonKey(name: 'AssignedBy') this.assignedBy,
      @JsonKey(name: 'NextFollowUpDate') this.nextFollowUpDate,
      @JsonKey(name: 'PoReason') this.poReason,
      @JsonKey(name: 'PoDate') this.poDate,
      @JsonKey(name: 'PoTypeID') this.poTypeId,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate});

  factory _$LeadDetailLeadImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadDetailLeadImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'LeadCode')
  final String? leadCode;
  @override
  @JsonKey(name: 'LeadType')
  final int? leadType;
  @override
  @JsonKey(name: 'CustomerID')
  final int? customerId;
  @override
  @JsonKey(name: 'CustomerTeam')
  final String? customerTeam;
  @override
  @JsonKey(name: 'CustomerPart')
  final String? customerPart;
  @override
  @JsonKey(name: 'CustomerPosition')
  final String? customerPosition;
  @override
  @JsonKey(name: 'CustomerType')
  final int? customerType;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;
  @override
  @JsonKey(name: 'ContactName')
  final String? contactName;
  @override
  @JsonKey(name: 'ContactPosition')
  final String? contactPosition;
  @override
  @JsonKey(name: 'ContactPhone')
  final String? contactPhone;
  @override
  @JsonKey(name: 'ContactEmail')
  final String? contactEmail;
  @override
  @JsonKey(name: 'ContactAppointmentDate')
  final String? contactAppointmentDate;
  @override
  @JsonKey(name: 'CreatedDate')
  final String? createdDate;
  @override
  @JsonKey(name: 'CollectedDate')
  final String? collectedDate;
  @override
  @JsonKey(name: 'LeadSourceID')
  final int? leadSourceId;
  @override
  @JsonKey(name: 'CampaignName')
  final String? campaignName;
  @override
  @JsonKey(name: 'Rating')
  final int? rating;
  @override
  @JsonKey(name: 'EstimatedValue')
  final double? estimatedValue;
  @override
  @JsonKey(name: 'ProductInterest')
  final String? productInterest;
  @override
  @JsonKey(name: 'NeedDescription')
  final String? needDescription;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'Website')
  final String? website;
  @override
  @JsonKey(name: 'SaleEmployeeID')
  final int? saleEmployeeId;
  @override
  @JsonKey(name: 'MarketingEmployeeID')
  final int? marketingEmployeeId;
  @override
  @JsonKey(name: 'Stage')
  final int? stage;
  @override
  @JsonKey(name: 'HandoverLeaderID')
  final int? handoverLeaderId;
  @override
  @JsonKey(name: 'AdminSaleID')
  final int? adminSaleId;
  @override
  @JsonKey(name: 'HandoverDate')
  final String? handoverDate;
  @override
  @JsonKey(name: 'HandoverBy')
  final int? handoverBy;
  @override
  @JsonKey(name: 'QualifiedDate')
  final String? qualifiedDate;
  @override
  @JsonKey(name: 'LostReason')
  final String? lostReason;
  @override
  @JsonKey(name: 'ClosedDate')
  final String? closedDate;
  @override
  @JsonKey(name: 'ReturnReason')
  final String? returnReason;
  @override
  @JsonKey(name: 'AssignedDate')
  final String? assignedDate;
  @override
  @JsonKey(name: 'AssignedBy')
  final int? assignedBy;
  @override
  @JsonKey(name: 'NextFollowUpDate')
  final String? nextFollowUpDate;
  @override
  @JsonKey(name: 'PoReason')
  final String? poReason;
  @override
  @JsonKey(name: 'PoDate')
  final String? poDate;
  @override
  @JsonKey(name: 'PoTypeID')
  final int? poTypeId;
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'UpdatedBy')
  final String? updatedBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  final String? updatedDate;

  @override
  String toString() {
    return 'LeadDetailLead(id: $id, leadCode: $leadCode, leadType: $leadType, customerId: $customerId, customerTeam: $customerTeam, customerPart: $customerPart, customerPosition: $customerPosition, customerType: $customerType, isDeleted: $isDeleted, contactName: $contactName, contactPosition: $contactPosition, contactPhone: $contactPhone, contactEmail: $contactEmail, contactAppointmentDate: $contactAppointmentDate, createdDate: $createdDate, collectedDate: $collectedDate, leadSourceId: $leadSourceId, campaignName: $campaignName, rating: $rating, estimatedValue: $estimatedValue, productInterest: $productInterest, needDescription: $needDescription, note: $note, website: $website, saleEmployeeId: $saleEmployeeId, marketingEmployeeId: $marketingEmployeeId, stage: $stage, handoverLeaderId: $handoverLeaderId, adminSaleId: $adminSaleId, handoverDate: $handoverDate, handoverBy: $handoverBy, qualifiedDate: $qualifiedDate, lostReason: $lostReason, closedDate: $closedDate, returnReason: $returnReason, assignedDate: $assignedDate, assignedBy: $assignedBy, nextFollowUpDate: $nextFollowUpDate, poReason: $poReason, poDate: $poDate, poTypeId: $poTypeId, createdBy: $createdBy, updatedBy: $updatedBy, updatedDate: $updatedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadDetailLeadImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.leadCode, leadCode) ||
                other.leadCode == leadCode) &&
            (identical(other.leadType, leadType) ||
                other.leadType == leadType) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerTeam, customerTeam) ||
                other.customerTeam == customerTeam) &&
            (identical(other.customerPart, customerPart) ||
                other.customerPart == customerPart) &&
            (identical(other.customerPosition, customerPosition) ||
                other.customerPosition == customerPosition) &&
            (identical(other.customerType, customerType) ||
                other.customerType == customerType) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.contactName, contactName) ||
                other.contactName == contactName) &&
            (identical(other.contactPosition, contactPosition) ||
                other.contactPosition == contactPosition) &&
            (identical(other.contactPhone, contactPhone) ||
                other.contactPhone == contactPhone) &&
            (identical(other.contactEmail, contactEmail) ||
                other.contactEmail == contactEmail) &&
            (identical(other.contactAppointmentDate, contactAppointmentDate) ||
                other.contactAppointmentDate == contactAppointmentDate) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.collectedDate, collectedDate) ||
                other.collectedDate == collectedDate) &&
            (identical(other.leadSourceId, leadSourceId) ||
                other.leadSourceId == leadSourceId) &&
            (identical(other.campaignName, campaignName) ||
                other.campaignName == campaignName) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.estimatedValue, estimatedValue) ||
                other.estimatedValue == estimatedValue) &&
            (identical(other.productInterest, productInterest) ||
                other.productInterest == productInterest) &&
            (identical(other.needDescription, needDescription) ||
                other.needDescription == needDescription) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.saleEmployeeId, saleEmployeeId) ||
                other.saleEmployeeId == saleEmployeeId) &&
            (identical(other.marketingEmployeeId, marketingEmployeeId) ||
                other.marketingEmployeeId == marketingEmployeeId) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.handoverLeaderId, handoverLeaderId) ||
                other.handoverLeaderId == handoverLeaderId) &&
            (identical(other.adminSaleId, adminSaleId) ||
                other.adminSaleId == adminSaleId) &&
            (identical(other.handoverDate, handoverDate) ||
                other.handoverDate == handoverDate) &&
            (identical(other.handoverBy, handoverBy) ||
                other.handoverBy == handoverBy) &&
            (identical(other.qualifiedDate, qualifiedDate) ||
                other.qualifiedDate == qualifiedDate) &&
            (identical(other.lostReason, lostReason) ||
                other.lostReason == lostReason) &&
            (identical(other.closedDate, closedDate) ||
                other.closedDate == closedDate) &&
            (identical(other.returnReason, returnReason) ||
                other.returnReason == returnReason) &&
            (identical(other.assignedDate, assignedDate) ||
                other.assignedDate == assignedDate) &&
            (identical(other.assignedBy, assignedBy) ||
                other.assignedBy == assignedBy) &&
            (identical(other.nextFollowUpDate, nextFollowUpDate) ||
                other.nextFollowUpDate == nextFollowUpDate) &&
            (identical(other.poReason, poReason) ||
                other.poReason == poReason) &&
            (identical(other.poDate, poDate) || other.poDate == poDate) &&
            (identical(other.poTypeId, poTypeId) ||
                other.poTypeId == poTypeId) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
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
        leadCode,
        leadType,
        customerId,
        customerTeam,
        customerPart,
        customerPosition,
        customerType,
        isDeleted,
        contactName,
        contactPosition,
        contactPhone,
        contactEmail,
        contactAppointmentDate,
        createdDate,
        collectedDate,
        leadSourceId,
        campaignName,
        rating,
        estimatedValue,
        productInterest,
        needDescription,
        note,
        website,
        saleEmployeeId,
        marketingEmployeeId,
        stage,
        handoverLeaderId,
        adminSaleId,
        handoverDate,
        handoverBy,
        qualifiedDate,
        lostReason,
        closedDate,
        returnReason,
        assignedDate,
        assignedBy,
        nextFollowUpDate,
        poReason,
        poDate,
        poTypeId,
        createdBy,
        updatedBy,
        updatedDate
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadDetailLeadImplCopyWith<_$LeadDetailLeadImpl> get copyWith =>
      __$$LeadDetailLeadImplCopyWithImpl<_$LeadDetailLeadImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadDetailLeadImplToJson(
      this,
    );
  }
}

abstract class _LeadDetailLead implements LeadDetailLead {
  const factory _LeadDetailLead(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'LeadCode') final String? leadCode,
          @JsonKey(name: 'LeadType') final int? leadType,
          @JsonKey(name: 'CustomerID') final int? customerId,
          @JsonKey(name: 'CustomerTeam') final String? customerTeam,
          @JsonKey(name: 'CustomerPart') final String? customerPart,
          @JsonKey(name: 'CustomerPosition') final String? customerPosition,
          @JsonKey(name: 'CustomerType') final int? customerType,
          @JsonKey(name: 'IsDeleted') final bool? isDeleted,
          @JsonKey(name: 'ContactName') final String? contactName,
          @JsonKey(name: 'ContactPosition') final String? contactPosition,
          @JsonKey(name: 'ContactPhone') final String? contactPhone,
          @JsonKey(name: 'ContactEmail') final String? contactEmail,
          @JsonKey(name: 'ContactAppointmentDate')
          final String? contactAppointmentDate,
          @JsonKey(name: 'CreatedDate') final String? createdDate,
          @JsonKey(name: 'CollectedDate') final String? collectedDate,
          @JsonKey(name: 'LeadSourceID') final int? leadSourceId,
          @JsonKey(name: 'CampaignName') final String? campaignName,
          @JsonKey(name: 'Rating') final int? rating,
          @JsonKey(name: 'EstimatedValue') final double? estimatedValue,
          @JsonKey(name: 'ProductInterest') final String? productInterest,
          @JsonKey(name: 'NeedDescription') final String? needDescription,
          @JsonKey(name: 'Note') final String? note,
          @JsonKey(name: 'Website') final String? website,
          @JsonKey(name: 'SaleEmployeeID') final int? saleEmployeeId,
          @JsonKey(name: 'MarketingEmployeeID') final int? marketingEmployeeId,
          @JsonKey(name: 'Stage') final int? stage,
          @JsonKey(name: 'HandoverLeaderID') final int? handoverLeaderId,
          @JsonKey(name: 'AdminSaleID') final int? adminSaleId,
          @JsonKey(name: 'HandoverDate') final String? handoverDate,
          @JsonKey(name: 'HandoverBy') final int? handoverBy,
          @JsonKey(name: 'QualifiedDate') final String? qualifiedDate,
          @JsonKey(name: 'LostReason') final String? lostReason,
          @JsonKey(name: 'ClosedDate') final String? closedDate,
          @JsonKey(name: 'ReturnReason') final String? returnReason,
          @JsonKey(name: 'AssignedDate') final String? assignedDate,
          @JsonKey(name: 'AssignedBy') final int? assignedBy,
          @JsonKey(name: 'NextFollowUpDate') final String? nextFollowUpDate,
          @JsonKey(name: 'PoReason') final String? poReason,
          @JsonKey(name: 'PoDate') final String? poDate,
          @JsonKey(name: 'PoTypeID') final int? poTypeId,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy,
          @JsonKey(name: 'UpdatedDate') final String? updatedDate}) =
      _$LeadDetailLeadImpl;

  factory _LeadDetailLead.fromJson(Map<String, dynamic> json) =
      _$LeadDetailLeadImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'LeadCode')
  String? get leadCode;
  @override
  @JsonKey(name: 'LeadType')
  int? get leadType;
  @override
  @JsonKey(name: 'CustomerID')
  int? get customerId;
  @override
  @JsonKey(name: 'CustomerTeam')
  String? get customerTeam;
  @override
  @JsonKey(name: 'CustomerPart')
  String? get customerPart;
  @override
  @JsonKey(name: 'CustomerPosition')
  String? get customerPosition;
  @override
  @JsonKey(name: 'CustomerType')
  int? get customerType;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(name: 'ContactName')
  String? get contactName;
  @override
  @JsonKey(name: 'ContactPosition')
  String? get contactPosition;
  @override
  @JsonKey(name: 'ContactPhone')
  String? get contactPhone;
  @override
  @JsonKey(name: 'ContactEmail')
  String? get contactEmail;
  @override
  @JsonKey(name: 'ContactAppointmentDate')
  String? get contactAppointmentDate;
  @override
  @JsonKey(name: 'CreatedDate')
  String? get createdDate;
  @override
  @JsonKey(name: 'CollectedDate')
  String? get collectedDate;
  @override
  @JsonKey(name: 'LeadSourceID')
  int? get leadSourceId;
  @override
  @JsonKey(name: 'CampaignName')
  String? get campaignName;
  @override
  @JsonKey(name: 'Rating')
  int? get rating;
  @override
  @JsonKey(name: 'EstimatedValue')
  double? get estimatedValue;
  @override
  @JsonKey(name: 'ProductInterest')
  String? get productInterest;
  @override
  @JsonKey(name: 'NeedDescription')
  String? get needDescription;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'Website')
  String? get website;
  @override
  @JsonKey(name: 'SaleEmployeeID')
  int? get saleEmployeeId;
  @override
  @JsonKey(name: 'MarketingEmployeeID')
  int? get marketingEmployeeId;
  @override
  @JsonKey(name: 'Stage')
  int? get stage;
  @override
  @JsonKey(name: 'HandoverLeaderID')
  int? get handoverLeaderId;
  @override
  @JsonKey(name: 'AdminSaleID')
  int? get adminSaleId;
  @override
  @JsonKey(name: 'HandoverDate')
  String? get handoverDate;
  @override
  @JsonKey(name: 'HandoverBy')
  int? get handoverBy;
  @override
  @JsonKey(name: 'QualifiedDate')
  String? get qualifiedDate;
  @override
  @JsonKey(name: 'LostReason')
  String? get lostReason;
  @override
  @JsonKey(name: 'ClosedDate')
  String? get closedDate;
  @override
  @JsonKey(name: 'ReturnReason')
  String? get returnReason;
  @override
  @JsonKey(name: 'AssignedDate')
  String? get assignedDate;
  @override
  @JsonKey(name: 'AssignedBy')
  int? get assignedBy;
  @override
  @JsonKey(name: 'NextFollowUpDate')
  String? get nextFollowUpDate;
  @override
  @JsonKey(name: 'PoReason')
  String? get poReason;
  @override
  @JsonKey(name: 'PoDate')
  String? get poDate;
  @override
  @JsonKey(name: 'PoTypeID')
  int? get poTypeId;
  @override
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  String? get updatedDate;
  @override
  @JsonKey(ignore: true)
  _$$LeadDetailLeadImplCopyWith<_$LeadDetailLeadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadActivity _$LeadActivityFromJson(Map<String, dynamic> json) {
  return _LeadActivity.fromJson(json);
}

/// @nodoc
mixin _$LeadActivity {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'LeadID')
  int? get leadId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ActivityType')
  int? get activityType => throw _privateConstructorUsedError;
  @JsonKey(name: 'ActivityTypeName')
  String? get activityTypeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ActivityDate')
  String? get activityDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'Content')
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'Result')
  String? get result => throw _privateConstructorUsedError;
  @JsonKey(name: 'NextAction')
  String? get nextAction => throw _privateConstructorUsedError;
  @JsonKey(name: 'NextActionDate')
  String? get nextActionDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeName')
  String? get employeeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  String? get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadActivityCopyWith<LeadActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadActivityCopyWith<$Res> {
  factory $LeadActivityCopyWith(
          LeadActivity value, $Res Function(LeadActivity) then) =
      _$LeadActivityCopyWithImpl<$Res, LeadActivity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'LeadID') int? leadId,
      @JsonKey(name: 'ActivityType') int? activityType,
      @JsonKey(name: 'ActivityTypeName') String? activityTypeName,
      @JsonKey(name: 'ActivityDate') String? activityDate,
      @JsonKey(name: 'Content') String? content,
      @JsonKey(name: 'Result') String? result,
      @JsonKey(name: 'NextAction') String? nextAction,
      @JsonKey(name: 'NextActionDate') String? nextActionDate,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'EmployeeName') String? employeeName,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') String? createdDate});
}

/// @nodoc
class _$LeadActivityCopyWithImpl<$Res, $Val extends LeadActivity>
    implements $LeadActivityCopyWith<$Res> {
  _$LeadActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? leadId = freezed,
    Object? activityType = freezed,
    Object? activityTypeName = freezed,
    Object? activityDate = freezed,
    Object? content = freezed,
    Object? result = freezed,
    Object? nextAction = freezed,
    Object? nextActionDate = freezed,
    Object? employeeId = freezed,
    Object? employeeName = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      leadId: freezed == leadId
          ? _value.leadId
          : leadId // ignore: cast_nullable_to_non_nullable
              as int?,
      activityType: freezed == activityType
          ? _value.activityType
          : activityType // ignore: cast_nullable_to_non_nullable
              as int?,
      activityTypeName: freezed == activityTypeName
          ? _value.activityTypeName
          : activityTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      activityDate: freezed == activityDate
          ? _value.activityDate
          : activityDate // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String?,
      nextAction: freezed == nextAction
          ? _value.nextAction
          : nextAction // ignore: cast_nullable_to_non_nullable
              as String?,
      nextActionDate: freezed == nextActionDate
          ? _value.nextActionDate
          : nextActionDate // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeadActivityImplCopyWith<$Res>
    implements $LeadActivityCopyWith<$Res> {
  factory _$$LeadActivityImplCopyWith(
          _$LeadActivityImpl value, $Res Function(_$LeadActivityImpl) then) =
      __$$LeadActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'LeadID') int? leadId,
      @JsonKey(name: 'ActivityType') int? activityType,
      @JsonKey(name: 'ActivityTypeName') String? activityTypeName,
      @JsonKey(name: 'ActivityDate') String? activityDate,
      @JsonKey(name: 'Content') String? content,
      @JsonKey(name: 'Result') String? result,
      @JsonKey(name: 'NextAction') String? nextAction,
      @JsonKey(name: 'NextActionDate') String? nextActionDate,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'EmployeeName') String? employeeName,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') String? createdDate});
}

/// @nodoc
class __$$LeadActivityImplCopyWithImpl<$Res>
    extends _$LeadActivityCopyWithImpl<$Res, _$LeadActivityImpl>
    implements _$$LeadActivityImplCopyWith<$Res> {
  __$$LeadActivityImplCopyWithImpl(
      _$LeadActivityImpl _value, $Res Function(_$LeadActivityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? leadId = freezed,
    Object? activityType = freezed,
    Object? activityTypeName = freezed,
    Object? activityDate = freezed,
    Object? content = freezed,
    Object? result = freezed,
    Object? nextAction = freezed,
    Object? nextActionDate = freezed,
    Object? employeeId = freezed,
    Object? employeeName = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_$LeadActivityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      leadId: freezed == leadId
          ? _value.leadId
          : leadId // ignore: cast_nullable_to_non_nullable
              as int?,
      activityType: freezed == activityType
          ? _value.activityType
          : activityType // ignore: cast_nullable_to_non_nullable
              as int?,
      activityTypeName: freezed == activityTypeName
          ? _value.activityTypeName
          : activityTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      activityDate: freezed == activityDate
          ? _value.activityDate
          : activityDate // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String?,
      nextAction: freezed == nextAction
          ? _value.nextAction
          : nextAction // ignore: cast_nullable_to_non_nullable
              as String?,
      nextActionDate: freezed == nextActionDate
          ? _value.nextActionDate
          : nextActionDate // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadActivityImpl implements _LeadActivity {
  const _$LeadActivityImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'LeadID') this.leadId,
      @JsonKey(name: 'ActivityType') this.activityType,
      @JsonKey(name: 'ActivityTypeName') this.activityTypeName,
      @JsonKey(name: 'ActivityDate') this.activityDate,
      @JsonKey(name: 'Content') this.content,
      @JsonKey(name: 'Result') this.result,
      @JsonKey(name: 'NextAction') this.nextAction,
      @JsonKey(name: 'NextActionDate') this.nextActionDate,
      @JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'EmployeeName') this.employeeName,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate});

  factory _$LeadActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadActivityImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'LeadID')
  final int? leadId;
  @override
  @JsonKey(name: 'ActivityType')
  final int? activityType;
  @override
  @JsonKey(name: 'ActivityTypeName')
  final String? activityTypeName;
  @override
  @JsonKey(name: 'ActivityDate')
  final String? activityDate;
  @override
  @JsonKey(name: 'Content')
  final String? content;
  @override
  @JsonKey(name: 'Result')
  final String? result;
  @override
  @JsonKey(name: 'NextAction')
  final String? nextAction;
  @override
  @JsonKey(name: 'NextActionDate')
  final String? nextActionDate;
  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;
  @override
  @JsonKey(name: 'EmployeeName')
  final String? employeeName;
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'CreatedDate')
  final String? createdDate;

  @override
  String toString() {
    return 'LeadActivity(id: $id, leadId: $leadId, activityType: $activityType, activityTypeName: $activityTypeName, activityDate: $activityDate, content: $content, result: $result, nextAction: $nextAction, nextActionDate: $nextActionDate, employeeId: $employeeId, employeeName: $employeeName, createdBy: $createdBy, createdDate: $createdDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadActivityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.leadId, leadId) || other.leadId == leadId) &&
            (identical(other.activityType, activityType) ||
                other.activityType == activityType) &&
            (identical(other.activityTypeName, activityTypeName) ||
                other.activityTypeName == activityTypeName) &&
            (identical(other.activityDate, activityDate) ||
                other.activityDate == activityDate) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.nextAction, nextAction) ||
                other.nextAction == nextAction) &&
            (identical(other.nextActionDate, nextActionDate) ||
                other.nextActionDate == nextActionDate) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      leadId,
      activityType,
      activityTypeName,
      activityDate,
      content,
      result,
      nextAction,
      nextActionDate,
      employeeId,
      employeeName,
      createdBy,
      createdDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadActivityImplCopyWith<_$LeadActivityImpl> get copyWith =>
      __$$LeadActivityImplCopyWithImpl<_$LeadActivityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadActivityImplToJson(
      this,
    );
  }
}

abstract class _LeadActivity implements LeadActivity {
  const factory _LeadActivity(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'LeadID') final int? leadId,
          @JsonKey(name: 'ActivityType') final int? activityType,
          @JsonKey(name: 'ActivityTypeName') final String? activityTypeName,
          @JsonKey(name: 'ActivityDate') final String? activityDate,
          @JsonKey(name: 'Content') final String? content,
          @JsonKey(name: 'Result') final String? result,
          @JsonKey(name: 'NextAction') final String? nextAction,
          @JsonKey(name: 'NextActionDate') final String? nextActionDate,
          @JsonKey(name: 'EmployeeID') final int? employeeId,
          @JsonKey(name: 'EmployeeName') final String? employeeName,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'CreatedDate') final String? createdDate}) =
      _$LeadActivityImpl;

  factory _LeadActivity.fromJson(Map<String, dynamic> json) =
      _$LeadActivityImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'LeadID')
  int? get leadId;
  @override
  @JsonKey(name: 'ActivityType')
  int? get activityType;
  @override
  @JsonKey(name: 'ActivityTypeName')
  String? get activityTypeName;
  @override
  @JsonKey(name: 'ActivityDate')
  String? get activityDate;
  @override
  @JsonKey(name: 'Content')
  String? get content;
  @override
  @JsonKey(name: 'Result')
  String? get result;
  @override
  @JsonKey(name: 'NextAction')
  String? get nextAction;
  @override
  @JsonKey(name: 'NextActionDate')
  String? get nextActionDate;
  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(name: 'EmployeeName')
  String? get employeeName;
  @override
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'CreatedDate')
  String? get createdDate;
  @override
  @JsonKey(ignore: true)
  _$$LeadActivityImplCopyWith<_$LeadActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadLog _$LeadLogFromJson(Map<String, dynamic> json) {
  return _LeadLog.fromJson(json);
}

/// @nodoc
mixin _$LeadLog {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'LeadID')
  int? get leadId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeLog')
  int? get typeLog => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeLogName')
  String? get typeLogName => throw _privateConstructorUsedError;
  @JsonKey(name: 'FromStage')
  int? get fromStage => throw _privateConstructorUsedError;
  @JsonKey(name: 'ToStage')
  int? get toStage => throw _privateConstructorUsedError;
  @JsonKey(name: 'FromEmployeeID')
  int? get fromEmployeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'FromEmployeeName')
  String? get fromEmployeeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ToEmployeeID')
  int? get toEmployeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ToEmployeeName')
  String? get toEmployeeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContentLog')
  String? get contentLog => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  String? get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadLogCopyWith<LeadLog> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadLogCopyWith<$Res> {
  factory $LeadLogCopyWith(LeadLog value, $Res Function(LeadLog) then) =
      _$LeadLogCopyWithImpl<$Res, LeadLog>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'LeadID') int? leadId,
      @JsonKey(name: 'TypeLog') int? typeLog,
      @JsonKey(name: 'TypeLogName') String? typeLogName,
      @JsonKey(name: 'FromStage') int? fromStage,
      @JsonKey(name: 'ToStage') int? toStage,
      @JsonKey(name: 'FromEmployeeID') int? fromEmployeeId,
      @JsonKey(name: 'FromEmployeeName') String? fromEmployeeName,
      @JsonKey(name: 'ToEmployeeID') int? toEmployeeId,
      @JsonKey(name: 'ToEmployeeName') String? toEmployeeName,
      @JsonKey(name: 'ContentLog') String? contentLog,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') String? createdDate});
}

/// @nodoc
class _$LeadLogCopyWithImpl<$Res, $Val extends LeadLog>
    implements $LeadLogCopyWith<$Res> {
  _$LeadLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? leadId = freezed,
    Object? typeLog = freezed,
    Object? typeLogName = freezed,
    Object? fromStage = freezed,
    Object? toStage = freezed,
    Object? fromEmployeeId = freezed,
    Object? fromEmployeeName = freezed,
    Object? toEmployeeId = freezed,
    Object? toEmployeeName = freezed,
    Object? contentLog = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      leadId: freezed == leadId
          ? _value.leadId
          : leadId // ignore: cast_nullable_to_non_nullable
              as int?,
      typeLog: freezed == typeLog
          ? _value.typeLog
          : typeLog // ignore: cast_nullable_to_non_nullable
              as int?,
      typeLogName: freezed == typeLogName
          ? _value.typeLogName
          : typeLogName // ignore: cast_nullable_to_non_nullable
              as String?,
      fromStage: freezed == fromStage
          ? _value.fromStage
          : fromStage // ignore: cast_nullable_to_non_nullable
              as int?,
      toStage: freezed == toStage
          ? _value.toStage
          : toStage // ignore: cast_nullable_to_non_nullable
              as int?,
      fromEmployeeId: freezed == fromEmployeeId
          ? _value.fromEmployeeId
          : fromEmployeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      fromEmployeeName: freezed == fromEmployeeName
          ? _value.fromEmployeeName
          : fromEmployeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      toEmployeeId: freezed == toEmployeeId
          ? _value.toEmployeeId
          : toEmployeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      toEmployeeName: freezed == toEmployeeName
          ? _value.toEmployeeName
          : toEmployeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      contentLog: freezed == contentLog
          ? _value.contentLog
          : contentLog // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeadLogImplCopyWith<$Res> implements $LeadLogCopyWith<$Res> {
  factory _$$LeadLogImplCopyWith(
          _$LeadLogImpl value, $Res Function(_$LeadLogImpl) then) =
      __$$LeadLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'LeadID') int? leadId,
      @JsonKey(name: 'TypeLog') int? typeLog,
      @JsonKey(name: 'TypeLogName') String? typeLogName,
      @JsonKey(name: 'FromStage') int? fromStage,
      @JsonKey(name: 'ToStage') int? toStage,
      @JsonKey(name: 'FromEmployeeID') int? fromEmployeeId,
      @JsonKey(name: 'FromEmployeeName') String? fromEmployeeName,
      @JsonKey(name: 'ToEmployeeID') int? toEmployeeId,
      @JsonKey(name: 'ToEmployeeName') String? toEmployeeName,
      @JsonKey(name: 'ContentLog') String? contentLog,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') String? createdDate});
}

/// @nodoc
class __$$LeadLogImplCopyWithImpl<$Res>
    extends _$LeadLogCopyWithImpl<$Res, _$LeadLogImpl>
    implements _$$LeadLogImplCopyWith<$Res> {
  __$$LeadLogImplCopyWithImpl(
      _$LeadLogImpl _value, $Res Function(_$LeadLogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? leadId = freezed,
    Object? typeLog = freezed,
    Object? typeLogName = freezed,
    Object? fromStage = freezed,
    Object? toStage = freezed,
    Object? fromEmployeeId = freezed,
    Object? fromEmployeeName = freezed,
    Object? toEmployeeId = freezed,
    Object? toEmployeeName = freezed,
    Object? contentLog = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_$LeadLogImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      leadId: freezed == leadId
          ? _value.leadId
          : leadId // ignore: cast_nullable_to_non_nullable
              as int?,
      typeLog: freezed == typeLog
          ? _value.typeLog
          : typeLog // ignore: cast_nullable_to_non_nullable
              as int?,
      typeLogName: freezed == typeLogName
          ? _value.typeLogName
          : typeLogName // ignore: cast_nullable_to_non_nullable
              as String?,
      fromStage: freezed == fromStage
          ? _value.fromStage
          : fromStage // ignore: cast_nullable_to_non_nullable
              as int?,
      toStage: freezed == toStage
          ? _value.toStage
          : toStage // ignore: cast_nullable_to_non_nullable
              as int?,
      fromEmployeeId: freezed == fromEmployeeId
          ? _value.fromEmployeeId
          : fromEmployeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      fromEmployeeName: freezed == fromEmployeeName
          ? _value.fromEmployeeName
          : fromEmployeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      toEmployeeId: freezed == toEmployeeId
          ? _value.toEmployeeId
          : toEmployeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      toEmployeeName: freezed == toEmployeeName
          ? _value.toEmployeeName
          : toEmployeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      contentLog: freezed == contentLog
          ? _value.contentLog
          : contentLog // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadLogImpl implements _LeadLog {
  const _$LeadLogImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'LeadID') this.leadId,
      @JsonKey(name: 'TypeLog') this.typeLog,
      @JsonKey(name: 'TypeLogName') this.typeLogName,
      @JsonKey(name: 'FromStage') this.fromStage,
      @JsonKey(name: 'ToStage') this.toStage,
      @JsonKey(name: 'FromEmployeeID') this.fromEmployeeId,
      @JsonKey(name: 'FromEmployeeName') this.fromEmployeeName,
      @JsonKey(name: 'ToEmployeeID') this.toEmployeeId,
      @JsonKey(name: 'ToEmployeeName') this.toEmployeeName,
      @JsonKey(name: 'ContentLog') this.contentLog,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate});

  factory _$LeadLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadLogImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'LeadID')
  final int? leadId;
  @override
  @JsonKey(name: 'TypeLog')
  final int? typeLog;
  @override
  @JsonKey(name: 'TypeLogName')
  final String? typeLogName;
  @override
  @JsonKey(name: 'FromStage')
  final int? fromStage;
  @override
  @JsonKey(name: 'ToStage')
  final int? toStage;
  @override
  @JsonKey(name: 'FromEmployeeID')
  final int? fromEmployeeId;
  @override
  @JsonKey(name: 'FromEmployeeName')
  final String? fromEmployeeName;
  @override
  @JsonKey(name: 'ToEmployeeID')
  final int? toEmployeeId;
  @override
  @JsonKey(name: 'ToEmployeeName')
  final String? toEmployeeName;
  @override
  @JsonKey(name: 'ContentLog')
  final String? contentLog;
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'CreatedDate')
  final String? createdDate;

  @override
  String toString() {
    return 'LeadLog(id: $id, leadId: $leadId, typeLog: $typeLog, typeLogName: $typeLogName, fromStage: $fromStage, toStage: $toStage, fromEmployeeId: $fromEmployeeId, fromEmployeeName: $fromEmployeeName, toEmployeeId: $toEmployeeId, toEmployeeName: $toEmployeeName, contentLog: $contentLog, createdBy: $createdBy, createdDate: $createdDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.leadId, leadId) || other.leadId == leadId) &&
            (identical(other.typeLog, typeLog) || other.typeLog == typeLog) &&
            (identical(other.typeLogName, typeLogName) ||
                other.typeLogName == typeLogName) &&
            (identical(other.fromStage, fromStage) ||
                other.fromStage == fromStage) &&
            (identical(other.toStage, toStage) || other.toStage == toStage) &&
            (identical(other.fromEmployeeId, fromEmployeeId) ||
                other.fromEmployeeId == fromEmployeeId) &&
            (identical(other.fromEmployeeName, fromEmployeeName) ||
                other.fromEmployeeName == fromEmployeeName) &&
            (identical(other.toEmployeeId, toEmployeeId) ||
                other.toEmployeeId == toEmployeeId) &&
            (identical(other.toEmployeeName, toEmployeeName) ||
                other.toEmployeeName == toEmployeeName) &&
            (identical(other.contentLog, contentLog) ||
                other.contentLog == contentLog) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      leadId,
      typeLog,
      typeLogName,
      fromStage,
      toStage,
      fromEmployeeId,
      fromEmployeeName,
      toEmployeeId,
      toEmployeeName,
      contentLog,
      createdBy,
      createdDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadLogImplCopyWith<_$LeadLogImpl> get copyWith =>
      __$$LeadLogImplCopyWithImpl<_$LeadLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadLogImplToJson(
      this,
    );
  }
}

abstract class _LeadLog implements LeadLog {
  const factory _LeadLog(
      {@JsonKey(name: 'ID') final int? id,
      @JsonKey(name: 'LeadID') final int? leadId,
      @JsonKey(name: 'TypeLog') final int? typeLog,
      @JsonKey(name: 'TypeLogName') final String? typeLogName,
      @JsonKey(name: 'FromStage') final int? fromStage,
      @JsonKey(name: 'ToStage') final int? toStage,
      @JsonKey(name: 'FromEmployeeID') final int? fromEmployeeId,
      @JsonKey(name: 'FromEmployeeName') final String? fromEmployeeName,
      @JsonKey(name: 'ToEmployeeID') final int? toEmployeeId,
      @JsonKey(name: 'ToEmployeeName') final String? toEmployeeName,
      @JsonKey(name: 'ContentLog') final String? contentLog,
      @JsonKey(name: 'CreatedBy') final String? createdBy,
      @JsonKey(name: 'CreatedDate') final String? createdDate}) = _$LeadLogImpl;

  factory _LeadLog.fromJson(Map<String, dynamic> json) = _$LeadLogImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'LeadID')
  int? get leadId;
  @override
  @JsonKey(name: 'TypeLog')
  int? get typeLog;
  @override
  @JsonKey(name: 'TypeLogName')
  String? get typeLogName;
  @override
  @JsonKey(name: 'FromStage')
  int? get fromStage;
  @override
  @JsonKey(name: 'ToStage')
  int? get toStage;
  @override
  @JsonKey(name: 'FromEmployeeID')
  int? get fromEmployeeId;
  @override
  @JsonKey(name: 'FromEmployeeName')
  String? get fromEmployeeName;
  @override
  @JsonKey(name: 'ToEmployeeID')
  int? get toEmployeeId;
  @override
  @JsonKey(name: 'ToEmployeeName')
  String? get toEmployeeName;
  @override
  @JsonKey(name: 'ContentLog')
  String? get contentLog;
  @override
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'CreatedDate')
  String? get createdDate;
  @override
  @JsonKey(ignore: true)
  _$$LeadLogImplCopyWith<_$LeadLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadFile _$LeadFileFromJson(Map<String, dynamic> json) {
  return _LeadFile.fromJson(json);
}

/// @nodoc
mixin _$LeadFile {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'FileName')
  String? get fileName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ServerPath')
  String? get serverPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'OriginPath')
  String? get originPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerContactID')
  int? get customerContactId => throw _privateConstructorUsedError;
  @JsonKey(name: 'FileType')
  int? get fileType => throw _privateConstructorUsedError;

  /// Người tạo file (mã nhân viên) — dùng để so khớp quyền xoá.
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;

  /// Ngày tạo file.
  @JsonKey(name: 'CreatedDate')
  String? get createdDate => throw _privateConstructorUsedError;

  /// File đã bị xoá hay chưa.
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadFileCopyWith<LeadFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadFileCopyWith<$Res> {
  factory $LeadFileCopyWith(LeadFile value, $Res Function(LeadFile) then) =
      _$LeadFileCopyWithImpl<$Res, LeadFile>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'FileName') String? fileName,
      @JsonKey(name: 'ServerPath') String? serverPath,
      @JsonKey(name: 'OriginPath') String? originPath,
      @JsonKey(name: 'CustomerContactID') int? customerContactId,
      @JsonKey(name: 'FileType') int? fileType,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'IsDeleted') bool? isDeleted});
}

/// @nodoc
class _$LeadFileCopyWithImpl<$Res, $Val extends LeadFile>
    implements $LeadFileCopyWith<$Res> {
  _$LeadFileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fileName = freezed,
    Object? serverPath = freezed,
    Object? originPath = freezed,
    Object? customerContactId = freezed,
    Object? fileType = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      serverPath: freezed == serverPath
          ? _value.serverPath
          : serverPath // ignore: cast_nullable_to_non_nullable
              as String?,
      originPath: freezed == originPath
          ? _value.originPath
          : originPath // ignore: cast_nullable_to_non_nullable
              as String?,
      customerContactId: freezed == customerContactId
          ? _value.customerContactId
          : customerContactId // ignore: cast_nullable_to_non_nullable
              as int?,
      fileType: freezed == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as int?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeadFileImplCopyWith<$Res>
    implements $LeadFileCopyWith<$Res> {
  factory _$$LeadFileImplCopyWith(
          _$LeadFileImpl value, $Res Function(_$LeadFileImpl) then) =
      __$$LeadFileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'FileName') String? fileName,
      @JsonKey(name: 'ServerPath') String? serverPath,
      @JsonKey(name: 'OriginPath') String? originPath,
      @JsonKey(name: 'CustomerContactID') int? customerContactId,
      @JsonKey(name: 'FileType') int? fileType,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'IsDeleted') bool? isDeleted});
}

/// @nodoc
class __$$LeadFileImplCopyWithImpl<$Res>
    extends _$LeadFileCopyWithImpl<$Res, _$LeadFileImpl>
    implements _$$LeadFileImplCopyWith<$Res> {
  __$$LeadFileImplCopyWithImpl(
      _$LeadFileImpl _value, $Res Function(_$LeadFileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fileName = freezed,
    Object? serverPath = freezed,
    Object? originPath = freezed,
    Object? customerContactId = freezed,
    Object? fileType = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_$LeadFileImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      serverPath: freezed == serverPath
          ? _value.serverPath
          : serverPath // ignore: cast_nullable_to_non_nullable
              as String?,
      originPath: freezed == originPath
          ? _value.originPath
          : originPath // ignore: cast_nullable_to_non_nullable
              as String?,
      customerContactId: freezed == customerContactId
          ? _value.customerContactId
          : customerContactId // ignore: cast_nullable_to_non_nullable
              as int?,
      fileType: freezed == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as int?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadFileImpl implements _LeadFile {
  const _$LeadFileImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'FileName') this.fileName,
      @JsonKey(name: 'ServerPath') this.serverPath,
      @JsonKey(name: 'OriginPath') this.originPath,
      @JsonKey(name: 'CustomerContactID') this.customerContactId,
      @JsonKey(name: 'FileType') this.fileType,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'IsDeleted') this.isDeleted});

  factory _$LeadFileImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadFileImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'FileName')
  final String? fileName;
  @override
  @JsonKey(name: 'ServerPath')
  final String? serverPath;
  @override
  @JsonKey(name: 'OriginPath')
  final String? originPath;
  @override
  @JsonKey(name: 'CustomerContactID')
  final int? customerContactId;
  @override
  @JsonKey(name: 'FileType')
  final int? fileType;

  /// Người tạo file (mã nhân viên) — dùng để so khớp quyền xoá.
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;

  /// Ngày tạo file.
  @override
  @JsonKey(name: 'CreatedDate')
  final String? createdDate;

  /// File đã bị xoá hay chưa.
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;

  @override
  String toString() {
    return 'LeadFile(id: $id, fileName: $fileName, serverPath: $serverPath, originPath: $originPath, customerContactId: $customerContactId, fileType: $fileType, createdBy: $createdBy, createdDate: $createdDate, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadFileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.serverPath, serverPath) ||
                other.serverPath == serverPath) &&
            (identical(other.originPath, originPath) ||
                other.originPath == originPath) &&
            (identical(other.customerContactId, customerContactId) ||
                other.customerContactId == customerContactId) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      fileName,
      serverPath,
      originPath,
      customerContactId,
      fileType,
      createdBy,
      createdDate,
      isDeleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadFileImplCopyWith<_$LeadFileImpl> get copyWith =>
      __$$LeadFileImplCopyWithImpl<_$LeadFileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadFileImplToJson(
      this,
    );
  }
}

abstract class _LeadFile implements LeadFile {
  const factory _LeadFile(
      {@JsonKey(name: 'ID') final int? id,
      @JsonKey(name: 'FileName') final String? fileName,
      @JsonKey(name: 'ServerPath') final String? serverPath,
      @JsonKey(name: 'OriginPath') final String? originPath,
      @JsonKey(name: 'CustomerContactID') final int? customerContactId,
      @JsonKey(name: 'FileType') final int? fileType,
      @JsonKey(name: 'CreatedBy') final String? createdBy,
      @JsonKey(name: 'CreatedDate') final String? createdDate,
      @JsonKey(name: 'IsDeleted') final bool? isDeleted}) = _$LeadFileImpl;

  factory _LeadFile.fromJson(Map<String, dynamic> json) =
      _$LeadFileImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'FileName')
  String? get fileName;
  @override
  @JsonKey(name: 'ServerPath')
  String? get serverPath;
  @override
  @JsonKey(name: 'OriginPath')
  String? get originPath;
  @override
  @JsonKey(name: 'CustomerContactID')
  int? get customerContactId;
  @override
  @JsonKey(name: 'FileType')
  int? get fileType;
  @override

  /// Người tạo file (mã nhân viên) — dùng để so khớp quyền xoá.
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override

  /// Ngày tạo file.
  @JsonKey(name: 'CreatedDate')
  String? get createdDate;
  @override

  /// File đã bị xoá hay chưa.
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(ignore: true)
  _$$LeadFileImplCopyWith<_$LeadFileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadActions _$LeadActionsFromJson(Map<String, dynamic> json) {
  return _LeadActions.fromJson(json);
}

/// @nodoc
mixin _$LeadActions {
  @JsonKey(name: 'CanView')
  bool? get canView => throw _privateConstructorUsedError;
  @JsonKey(name: 'CanEdit')
  bool? get canEdit => throw _privateConstructorUsedError;
  @JsonKey(name: 'CanQualify')
  bool? get canQualify => throw _privateConstructorUsedError;
  @JsonKey(name: 'CanDisqualify')
  bool? get canDisqualify => throw _privateConstructorUsedError;
  @JsonKey(name: 'CanHandover')
  bool? get canHandover => throw _privateConstructorUsedError;
  @JsonKey(name: 'CanAssign')
  bool? get canAssign => throw _privateConstructorUsedError;
  @JsonKey(name: 'CanReturn')
  bool? get canReturn => throw _privateConstructorUsedError;
  @JsonKey(name: 'CanClose')
  bool? get canClose => throw _privateConstructorUsedError;
  @JsonKey(name: 'CanLinkCustomer')
  bool? get canLinkCustomer => throw _privateConstructorUsedError;
  @JsonKey(name: 'CanReopen')
  bool? get canReopen => throw _privateConstructorUsedError;
  @JsonKey(name: 'CanAddActivity')
  bool? get canAddActivity => throw _privateConstructorUsedError;
  @JsonKey(name: 'CanDelete')
  bool? get canDelete => throw _privateConstructorUsedError;
  @JsonKey(name: 'CanPO')
  bool? get canPo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadActionsCopyWith<LeadActions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadActionsCopyWith<$Res> {
  factory $LeadActionsCopyWith(
          LeadActions value, $Res Function(LeadActions) then) =
      _$LeadActionsCopyWithImpl<$Res, LeadActions>;
  @useResult
  $Res call(
      {@JsonKey(name: 'CanView') bool? canView,
      @JsonKey(name: 'CanEdit') bool? canEdit,
      @JsonKey(name: 'CanQualify') bool? canQualify,
      @JsonKey(name: 'CanDisqualify') bool? canDisqualify,
      @JsonKey(name: 'CanHandover') bool? canHandover,
      @JsonKey(name: 'CanAssign') bool? canAssign,
      @JsonKey(name: 'CanReturn') bool? canReturn,
      @JsonKey(name: 'CanClose') bool? canClose,
      @JsonKey(name: 'CanLinkCustomer') bool? canLinkCustomer,
      @JsonKey(name: 'CanReopen') bool? canReopen,
      @JsonKey(name: 'CanAddActivity') bool? canAddActivity,
      @JsonKey(name: 'CanDelete') bool? canDelete,
      @JsonKey(name: 'CanPO') bool? canPo});
}

/// @nodoc
class _$LeadActionsCopyWithImpl<$Res, $Val extends LeadActions>
    implements $LeadActionsCopyWith<$Res> {
  _$LeadActionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canView = freezed,
    Object? canEdit = freezed,
    Object? canQualify = freezed,
    Object? canDisqualify = freezed,
    Object? canHandover = freezed,
    Object? canAssign = freezed,
    Object? canReturn = freezed,
    Object? canClose = freezed,
    Object? canLinkCustomer = freezed,
    Object? canReopen = freezed,
    Object? canAddActivity = freezed,
    Object? canDelete = freezed,
    Object? canPo = freezed,
  }) {
    return _then(_value.copyWith(
      canView: freezed == canView
          ? _value.canView
          : canView // ignore: cast_nullable_to_non_nullable
              as bool?,
      canEdit: freezed == canEdit
          ? _value.canEdit
          : canEdit // ignore: cast_nullable_to_non_nullable
              as bool?,
      canQualify: freezed == canQualify
          ? _value.canQualify
          : canQualify // ignore: cast_nullable_to_non_nullable
              as bool?,
      canDisqualify: freezed == canDisqualify
          ? _value.canDisqualify
          : canDisqualify // ignore: cast_nullable_to_non_nullable
              as bool?,
      canHandover: freezed == canHandover
          ? _value.canHandover
          : canHandover // ignore: cast_nullable_to_non_nullable
              as bool?,
      canAssign: freezed == canAssign
          ? _value.canAssign
          : canAssign // ignore: cast_nullable_to_non_nullable
              as bool?,
      canReturn: freezed == canReturn
          ? _value.canReturn
          : canReturn // ignore: cast_nullable_to_non_nullable
              as bool?,
      canClose: freezed == canClose
          ? _value.canClose
          : canClose // ignore: cast_nullable_to_non_nullable
              as bool?,
      canLinkCustomer: freezed == canLinkCustomer
          ? _value.canLinkCustomer
          : canLinkCustomer // ignore: cast_nullable_to_non_nullable
              as bool?,
      canReopen: freezed == canReopen
          ? _value.canReopen
          : canReopen // ignore: cast_nullable_to_non_nullable
              as bool?,
      canAddActivity: freezed == canAddActivity
          ? _value.canAddActivity
          : canAddActivity // ignore: cast_nullable_to_non_nullable
              as bool?,
      canDelete: freezed == canDelete
          ? _value.canDelete
          : canDelete // ignore: cast_nullable_to_non_nullable
              as bool?,
      canPo: freezed == canPo
          ? _value.canPo
          : canPo // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeadActionsImplCopyWith<$Res>
    implements $LeadActionsCopyWith<$Res> {
  factory _$$LeadActionsImplCopyWith(
          _$LeadActionsImpl value, $Res Function(_$LeadActionsImpl) then) =
      __$$LeadActionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CanView') bool? canView,
      @JsonKey(name: 'CanEdit') bool? canEdit,
      @JsonKey(name: 'CanQualify') bool? canQualify,
      @JsonKey(name: 'CanDisqualify') bool? canDisqualify,
      @JsonKey(name: 'CanHandover') bool? canHandover,
      @JsonKey(name: 'CanAssign') bool? canAssign,
      @JsonKey(name: 'CanReturn') bool? canReturn,
      @JsonKey(name: 'CanClose') bool? canClose,
      @JsonKey(name: 'CanLinkCustomer') bool? canLinkCustomer,
      @JsonKey(name: 'CanReopen') bool? canReopen,
      @JsonKey(name: 'CanAddActivity') bool? canAddActivity,
      @JsonKey(name: 'CanDelete') bool? canDelete,
      @JsonKey(name: 'CanPO') bool? canPo});
}

/// @nodoc
class __$$LeadActionsImplCopyWithImpl<$Res>
    extends _$LeadActionsCopyWithImpl<$Res, _$LeadActionsImpl>
    implements _$$LeadActionsImplCopyWith<$Res> {
  __$$LeadActionsImplCopyWithImpl(
      _$LeadActionsImpl _value, $Res Function(_$LeadActionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canView = freezed,
    Object? canEdit = freezed,
    Object? canQualify = freezed,
    Object? canDisqualify = freezed,
    Object? canHandover = freezed,
    Object? canAssign = freezed,
    Object? canReturn = freezed,
    Object? canClose = freezed,
    Object? canLinkCustomer = freezed,
    Object? canReopen = freezed,
    Object? canAddActivity = freezed,
    Object? canDelete = freezed,
    Object? canPo = freezed,
  }) {
    return _then(_$LeadActionsImpl(
      canView: freezed == canView
          ? _value.canView
          : canView // ignore: cast_nullable_to_non_nullable
              as bool?,
      canEdit: freezed == canEdit
          ? _value.canEdit
          : canEdit // ignore: cast_nullable_to_non_nullable
              as bool?,
      canQualify: freezed == canQualify
          ? _value.canQualify
          : canQualify // ignore: cast_nullable_to_non_nullable
              as bool?,
      canDisqualify: freezed == canDisqualify
          ? _value.canDisqualify
          : canDisqualify // ignore: cast_nullable_to_non_nullable
              as bool?,
      canHandover: freezed == canHandover
          ? _value.canHandover
          : canHandover // ignore: cast_nullable_to_non_nullable
              as bool?,
      canAssign: freezed == canAssign
          ? _value.canAssign
          : canAssign // ignore: cast_nullable_to_non_nullable
              as bool?,
      canReturn: freezed == canReturn
          ? _value.canReturn
          : canReturn // ignore: cast_nullable_to_non_nullable
              as bool?,
      canClose: freezed == canClose
          ? _value.canClose
          : canClose // ignore: cast_nullable_to_non_nullable
              as bool?,
      canLinkCustomer: freezed == canLinkCustomer
          ? _value.canLinkCustomer
          : canLinkCustomer // ignore: cast_nullable_to_non_nullable
              as bool?,
      canReopen: freezed == canReopen
          ? _value.canReopen
          : canReopen // ignore: cast_nullable_to_non_nullable
              as bool?,
      canAddActivity: freezed == canAddActivity
          ? _value.canAddActivity
          : canAddActivity // ignore: cast_nullable_to_non_nullable
              as bool?,
      canDelete: freezed == canDelete
          ? _value.canDelete
          : canDelete // ignore: cast_nullable_to_non_nullable
              as bool?,
      canPo: freezed == canPo
          ? _value.canPo
          : canPo // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadActionsImpl implements _LeadActions {
  const _$LeadActionsImpl(
      {@JsonKey(name: 'CanView') this.canView,
      @JsonKey(name: 'CanEdit') this.canEdit,
      @JsonKey(name: 'CanQualify') this.canQualify,
      @JsonKey(name: 'CanDisqualify') this.canDisqualify,
      @JsonKey(name: 'CanHandover') this.canHandover,
      @JsonKey(name: 'CanAssign') this.canAssign,
      @JsonKey(name: 'CanReturn') this.canReturn,
      @JsonKey(name: 'CanClose') this.canClose,
      @JsonKey(name: 'CanLinkCustomer') this.canLinkCustomer,
      @JsonKey(name: 'CanReopen') this.canReopen,
      @JsonKey(name: 'CanAddActivity') this.canAddActivity,
      @JsonKey(name: 'CanDelete') this.canDelete,
      @JsonKey(name: 'CanPO') this.canPo});

  factory _$LeadActionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadActionsImplFromJson(json);

  @override
  @JsonKey(name: 'CanView')
  final bool? canView;
  @override
  @JsonKey(name: 'CanEdit')
  final bool? canEdit;
  @override
  @JsonKey(name: 'CanQualify')
  final bool? canQualify;
  @override
  @JsonKey(name: 'CanDisqualify')
  final bool? canDisqualify;
  @override
  @JsonKey(name: 'CanHandover')
  final bool? canHandover;
  @override
  @JsonKey(name: 'CanAssign')
  final bool? canAssign;
  @override
  @JsonKey(name: 'CanReturn')
  final bool? canReturn;
  @override
  @JsonKey(name: 'CanClose')
  final bool? canClose;
  @override
  @JsonKey(name: 'CanLinkCustomer')
  final bool? canLinkCustomer;
  @override
  @JsonKey(name: 'CanReopen')
  final bool? canReopen;
  @override
  @JsonKey(name: 'CanAddActivity')
  final bool? canAddActivity;
  @override
  @JsonKey(name: 'CanDelete')
  final bool? canDelete;
  @override
  @JsonKey(name: 'CanPO')
  final bool? canPo;

  @override
  String toString() {
    return 'LeadActions(canView: $canView, canEdit: $canEdit, canQualify: $canQualify, canDisqualify: $canDisqualify, canHandover: $canHandover, canAssign: $canAssign, canReturn: $canReturn, canClose: $canClose, canLinkCustomer: $canLinkCustomer, canReopen: $canReopen, canAddActivity: $canAddActivity, canDelete: $canDelete, canPo: $canPo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadActionsImpl &&
            (identical(other.canView, canView) || other.canView == canView) &&
            (identical(other.canEdit, canEdit) || other.canEdit == canEdit) &&
            (identical(other.canQualify, canQualify) ||
                other.canQualify == canQualify) &&
            (identical(other.canDisqualify, canDisqualify) ||
                other.canDisqualify == canDisqualify) &&
            (identical(other.canHandover, canHandover) ||
                other.canHandover == canHandover) &&
            (identical(other.canAssign, canAssign) ||
                other.canAssign == canAssign) &&
            (identical(other.canReturn, canReturn) ||
                other.canReturn == canReturn) &&
            (identical(other.canClose, canClose) ||
                other.canClose == canClose) &&
            (identical(other.canLinkCustomer, canLinkCustomer) ||
                other.canLinkCustomer == canLinkCustomer) &&
            (identical(other.canReopen, canReopen) ||
                other.canReopen == canReopen) &&
            (identical(other.canAddActivity, canAddActivity) ||
                other.canAddActivity == canAddActivity) &&
            (identical(other.canDelete, canDelete) ||
                other.canDelete == canDelete) &&
            (identical(other.canPo, canPo) || other.canPo == canPo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      canView,
      canEdit,
      canQualify,
      canDisqualify,
      canHandover,
      canAssign,
      canReturn,
      canClose,
      canLinkCustomer,
      canReopen,
      canAddActivity,
      canDelete,
      canPo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadActionsImplCopyWith<_$LeadActionsImpl> get copyWith =>
      __$$LeadActionsImplCopyWithImpl<_$LeadActionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadActionsImplToJson(
      this,
    );
  }
}

abstract class _LeadActions implements LeadActions {
  const factory _LeadActions(
      {@JsonKey(name: 'CanView') final bool? canView,
      @JsonKey(name: 'CanEdit') final bool? canEdit,
      @JsonKey(name: 'CanQualify') final bool? canQualify,
      @JsonKey(name: 'CanDisqualify') final bool? canDisqualify,
      @JsonKey(name: 'CanHandover') final bool? canHandover,
      @JsonKey(name: 'CanAssign') final bool? canAssign,
      @JsonKey(name: 'CanReturn') final bool? canReturn,
      @JsonKey(name: 'CanClose') final bool? canClose,
      @JsonKey(name: 'CanLinkCustomer') final bool? canLinkCustomer,
      @JsonKey(name: 'CanReopen') final bool? canReopen,
      @JsonKey(name: 'CanAddActivity') final bool? canAddActivity,
      @JsonKey(name: 'CanDelete') final bool? canDelete,
      @JsonKey(name: 'CanPO') final bool? canPo}) = _$LeadActionsImpl;

  factory _LeadActions.fromJson(Map<String, dynamic> json) =
      _$LeadActionsImpl.fromJson;

  @override
  @JsonKey(name: 'CanView')
  bool? get canView;
  @override
  @JsonKey(name: 'CanEdit')
  bool? get canEdit;
  @override
  @JsonKey(name: 'CanQualify')
  bool? get canQualify;
  @override
  @JsonKey(name: 'CanDisqualify')
  bool? get canDisqualify;
  @override
  @JsonKey(name: 'CanHandover')
  bool? get canHandover;
  @override
  @JsonKey(name: 'CanAssign')
  bool? get canAssign;
  @override
  @JsonKey(name: 'CanReturn')
  bool? get canReturn;
  @override
  @JsonKey(name: 'CanClose')
  bool? get canClose;
  @override
  @JsonKey(name: 'CanLinkCustomer')
  bool? get canLinkCustomer;
  @override
  @JsonKey(name: 'CanReopen')
  bool? get canReopen;
  @override
  @JsonKey(name: 'CanAddActivity')
  bool? get canAddActivity;
  @override
  @JsonKey(name: 'CanDelete')
  bool? get canDelete;
  @override
  @JsonKey(name: 'CanPO')
  bool? get canPo;
  @override
  @JsonKey(ignore: true)
  _$$LeadActionsImplCopyWith<_$LeadActionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
