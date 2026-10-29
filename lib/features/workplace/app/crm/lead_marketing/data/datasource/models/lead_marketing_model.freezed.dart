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
