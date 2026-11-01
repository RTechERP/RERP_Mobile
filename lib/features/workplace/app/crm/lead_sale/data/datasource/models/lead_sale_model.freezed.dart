// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lead_sale_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LeadSaleEmployee _$LeadSaleEmployeeFromJson(Map<String, dynamic> json) {
  return _LeadSaleEmployee.fromJson(json);
}

/// @nodoc
mixin _$LeadSaleEmployee {
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
  $LeadSaleEmployeeCopyWith<LeadSaleEmployee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadSaleEmployeeCopyWith<$Res> {
  factory $LeadSaleEmployeeCopyWith(
    LeadSaleEmployee value,
    $Res Function(LeadSaleEmployee) then,
  ) = _$LeadSaleEmployeeCopyWithImpl<$Res, LeadSaleEmployee>;
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'DepartmentID') int? departmentId,
  });
}

/// @nodoc
class _$LeadSaleEmployeeCopyWithImpl<$Res, $Val extends LeadSaleEmployee>
    implements $LeadSaleEmployeeCopyWith<$Res> {
  _$LeadSaleEmployeeCopyWithImpl(this._value, this._then);

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
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadSaleEmployeeImplCopyWith<$Res>
    implements $LeadSaleEmployeeCopyWith<$Res> {
  factory _$$LeadSaleEmployeeImplCopyWith(
    _$LeadSaleEmployeeImpl value,
    $Res Function(_$LeadSaleEmployeeImpl) then,
  ) = __$$LeadSaleEmployeeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'DepartmentID') int? departmentId,
  });
}

/// @nodoc
class __$$LeadSaleEmployeeImplCopyWithImpl<$Res>
    extends _$LeadSaleEmployeeCopyWithImpl<$Res, _$LeadSaleEmployeeImpl>
    implements _$$LeadSaleEmployeeImplCopyWith<$Res> {
  __$$LeadSaleEmployeeImplCopyWithImpl(
    _$LeadSaleEmployeeImpl _value,
    $Res Function(_$LeadSaleEmployeeImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? fullName = freezed,
    Object? departmentId = freezed,
  }) {
    return _then(
      _$LeadSaleEmployeeImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadSaleEmployeeImpl implements _LeadSaleEmployee {
  const _$LeadSaleEmployeeImpl({
    @JsonKey(name: 'ID') this.id,
    @JsonKey(name: 'Code') this.code,
    @JsonKey(name: 'FullName') this.fullName,
    @JsonKey(name: 'DepartmentID') this.departmentId,
  });

  factory _$LeadSaleEmployeeImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadSaleEmployeeImplFromJson(json);

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
    return 'LeadSaleEmployee(id: $id, code: $code, fullName: $fullName, departmentId: $departmentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadSaleEmployeeImpl &&
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
  _$$LeadSaleEmployeeImplCopyWith<_$LeadSaleEmployeeImpl> get copyWith =>
      __$$LeadSaleEmployeeImplCopyWithImpl<_$LeadSaleEmployeeImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadSaleEmployeeImplToJson(this);
  }
}

abstract class _LeadSaleEmployee implements LeadSaleEmployee {
  const factory _LeadSaleEmployee({
    @JsonKey(name: 'ID') final int? id,
    @JsonKey(name: 'Code') final String? code,
    @JsonKey(name: 'FullName') final String? fullName,
    @JsonKey(name: 'DepartmentID') final int? departmentId,
  }) = _$LeadSaleEmployeeImpl;

  factory _LeadSaleEmployee.fromJson(Map<String, dynamic> json) =
      _$LeadSaleEmployeeImpl.fromJson;

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
  _$$LeadSaleEmployeeImplCopyWith<_$LeadSaleEmployeeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadSaleSource _$LeadSaleSourceFromJson(Map<String, dynamic> json) {
  return _LeadSaleSource.fromJson(json);
}

/// @nodoc
mixin _$LeadSaleSource {
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
  $LeadSaleSourceCopyWith<LeadSaleSource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadSaleSourceCopyWith<$Res> {
  factory $LeadSaleSourceCopyWith(
    LeadSaleSource value,
    $Res Function(LeadSaleSource) then,
  ) = _$LeadSaleSourceCopyWithImpl<$Res, LeadSaleSource>;
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'SourceGroup') int? sourceGroup,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  });
}

/// @nodoc
class _$LeadSaleSourceCopyWithImpl<$Res, $Val extends LeadSaleSource>
    implements $LeadSaleSourceCopyWith<$Res> {
  _$LeadSaleSourceCopyWithImpl(this._value, this._then);

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
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadSaleSourceImplCopyWith<$Res>
    implements $LeadSaleSourceCopyWith<$Res> {
  factory _$$LeadSaleSourceImplCopyWith(
    _$LeadSaleSourceImpl value,
    $Res Function(_$LeadSaleSourceImpl) then,
  ) = __$$LeadSaleSourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'SourceGroup') int? sourceGroup,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  });
}

/// @nodoc
class __$$LeadSaleSourceImplCopyWithImpl<$Res>
    extends _$LeadSaleSourceCopyWithImpl<$Res, _$LeadSaleSourceImpl>
    implements _$$LeadSaleSourceImplCopyWith<$Res> {
  __$$LeadSaleSourceImplCopyWithImpl(
    _$LeadSaleSourceImpl _value,
    $Res Function(_$LeadSaleSourceImpl) _then,
  ) : super(_value, _then);

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
    return _then(
      _$LeadSaleSourceImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadSaleSourceImpl implements _LeadSaleSource {
  const _$LeadSaleSourceImpl({
    @JsonKey(name: 'ID') this.id,
    @JsonKey(name: 'Code') this.code,
    @JsonKey(name: 'Name') this.name,
    @JsonKey(name: 'SourceGroup') this.sourceGroup,
    @JsonKey(name: 'STT') this.stt,
    @JsonKey(name: 'Note') this.note,
    @JsonKey(name: 'IsDeleted') this.isDeleted,
  });

  factory _$LeadSaleSourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadSaleSourceImplFromJson(json);

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
    return 'LeadSaleSource(id: $id, code: $code, name: $name, sourceGroup: $sourceGroup, stt: $stt, note: $note, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadSaleSourceImpl &&
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
    runtimeType,
    id,
    code,
    name,
    sourceGroup,
    stt,
    note,
    isDeleted,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadSaleSourceImplCopyWith<_$LeadSaleSourceImpl> get copyWith =>
      __$$LeadSaleSourceImplCopyWithImpl<_$LeadSaleSourceImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadSaleSourceImplToJson(this);
  }
}

abstract class _LeadSaleSource implements LeadSaleSource {
  const factory _LeadSaleSource({
    @JsonKey(name: 'ID') final int? id,
    @JsonKey(name: 'Code') final String? code,
    @JsonKey(name: 'Name') final String? name,
    @JsonKey(name: 'SourceGroup') final int? sourceGroup,
    @JsonKey(name: 'STT') final int? stt,
    @JsonKey(name: 'Note') final String? note,
    @JsonKey(name: 'IsDeleted') final bool? isDeleted,
  }) = _$LeadSaleSourceImpl;

  factory _LeadSaleSource.fromJson(Map<String, dynamic> json) =
      _$LeadSaleSourceImpl.fromJson;

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
  _$$LeadSaleSourceImplCopyWith<_$LeadSaleSourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadSaleRoleContext _$LeadSaleRoleContextFromJson(Map<String, dynamic> json) {
  return _LeadSaleRoleContext.fromJson(json);
}

/// @nodoc
mixin _$LeadSaleRoleContext {
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
  $LeadSaleRoleContextCopyWith<LeadSaleRoleContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadSaleRoleContextCopyWith<$Res> {
  factory $LeadSaleRoleContextCopyWith(
    LeadSaleRoleContext value,
    $Res Function(LeadSaleRoleContext) then,
  ) = _$LeadSaleRoleContextCopyWithImpl<$Res, LeadSaleRoleContext>;
  @useResult
  $Res call({
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'IsAdmin') bool? isAdmin,
    @JsonKey(name: 'IsMarketing') bool? isMarketing,
    @JsonKey(name: 'IsSale') bool? isSale,
    @JsonKey(name: 'IsSaleLeader') bool? isSaleLeader,
    @JsonKey(name: 'IsSaleAdmin') bool? isSaleAdmin,
    @JsonKey(name: 'IsBod') bool? isBod,
    @JsonKey(name: 'TeamEmployeeIDs') List<int>? teamEmployeeIds,
    @JsonKey(name: 'CanViewMarketing') bool? canViewMarketing,
    @JsonKey(name: 'CanViewSale') bool? canViewSale,
    @JsonKey(name: 'CanAssign') bool? canAssign,
  });
}

/// @nodoc
class _$LeadSaleRoleContextCopyWithImpl<$Res, $Val extends LeadSaleRoleContext>
    implements $LeadSaleRoleContextCopyWith<$Res> {
  _$LeadSaleRoleContextCopyWithImpl(this._value, this._then);

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
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadSaleRoleContextImplCopyWith<$Res>
    implements $LeadSaleRoleContextCopyWith<$Res> {
  factory _$$LeadSaleRoleContextImplCopyWith(
    _$LeadSaleRoleContextImpl value,
    $Res Function(_$LeadSaleRoleContextImpl) then,
  ) = __$$LeadSaleRoleContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'IsAdmin') bool? isAdmin,
    @JsonKey(name: 'IsMarketing') bool? isMarketing,
    @JsonKey(name: 'IsSale') bool? isSale,
    @JsonKey(name: 'IsSaleLeader') bool? isSaleLeader,
    @JsonKey(name: 'IsSaleAdmin') bool? isSaleAdmin,
    @JsonKey(name: 'IsBod') bool? isBod,
    @JsonKey(name: 'TeamEmployeeIDs') List<int>? teamEmployeeIds,
    @JsonKey(name: 'CanViewMarketing') bool? canViewMarketing,
    @JsonKey(name: 'CanViewSale') bool? canViewSale,
    @JsonKey(name: 'CanAssign') bool? canAssign,
  });
}

/// @nodoc
class __$$LeadSaleRoleContextImplCopyWithImpl<$Res>
    extends _$LeadSaleRoleContextCopyWithImpl<$Res, _$LeadSaleRoleContextImpl>
    implements _$$LeadSaleRoleContextImplCopyWith<$Res> {
  __$$LeadSaleRoleContextImplCopyWithImpl(
    _$LeadSaleRoleContextImpl _value,
    $Res Function(_$LeadSaleRoleContextImpl) _then,
  ) : super(_value, _then);

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
    return _then(
      _$LeadSaleRoleContextImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadSaleRoleContextImpl implements _LeadSaleRoleContext {
  const _$LeadSaleRoleContextImpl({
    @JsonKey(name: 'EmployeeID') this.employeeId,
    @JsonKey(name: 'IsAdmin') this.isAdmin,
    @JsonKey(name: 'IsMarketing') this.isMarketing,
    @JsonKey(name: 'IsSale') this.isSale,
    @JsonKey(name: 'IsSaleLeader') this.isSaleLeader,
    @JsonKey(name: 'IsSaleAdmin') this.isSaleAdmin,
    @JsonKey(name: 'IsBod') this.isBod,
    @JsonKey(name: 'TeamEmployeeIDs') final List<int>? teamEmployeeIds,
    @JsonKey(name: 'CanViewMarketing') this.canViewMarketing,
    @JsonKey(name: 'CanViewSale') this.canViewSale,
    @JsonKey(name: 'CanAssign') this.canAssign,
  }) : _teamEmployeeIds = teamEmployeeIds;

  factory _$LeadSaleRoleContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadSaleRoleContextImplFromJson(json);

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
    return 'LeadSaleRoleContext(employeeId: $employeeId, isAdmin: $isAdmin, isMarketing: $isMarketing, isSale: $isSale, isSaleLeader: $isSaleLeader, isSaleAdmin: $isSaleAdmin, isBod: $isBod, teamEmployeeIds: $teamEmployeeIds, canViewMarketing: $canViewMarketing, canViewSale: $canViewSale, canAssign: $canAssign)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadSaleRoleContextImpl &&
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
            const DeepCollectionEquality().equals(
              other._teamEmployeeIds,
              _teamEmployeeIds,
            ) &&
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
    canAssign,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadSaleRoleContextImplCopyWith<_$LeadSaleRoleContextImpl> get copyWith =>
      __$$LeadSaleRoleContextImplCopyWithImpl<_$LeadSaleRoleContextImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadSaleRoleContextImplToJson(this);
  }
}

abstract class _LeadSaleRoleContext implements LeadSaleRoleContext {
  const factory _LeadSaleRoleContext({
    @JsonKey(name: 'EmployeeID') final int? employeeId,
    @JsonKey(name: 'IsAdmin') final bool? isAdmin,
    @JsonKey(name: 'IsMarketing') final bool? isMarketing,
    @JsonKey(name: 'IsSale') final bool? isSale,
    @JsonKey(name: 'IsSaleLeader') final bool? isSaleLeader,
    @JsonKey(name: 'IsSaleAdmin') final bool? isSaleAdmin,
    @JsonKey(name: 'IsBod') final bool? isBod,
    @JsonKey(name: 'TeamEmployeeIDs') final List<int>? teamEmployeeIds,
    @JsonKey(name: 'CanViewMarketing') final bool? canViewMarketing,
    @JsonKey(name: 'CanViewSale') final bool? canViewSale,
    @JsonKey(name: 'CanAssign') final bool? canAssign,
  }) = _$LeadSaleRoleContextImpl;

  factory _LeadSaleRoleContext.fromJson(Map<String, dynamic> json) =
      _$LeadSaleRoleContextImpl.fromJson;

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
  _$$LeadSaleRoleContextImplCopyWith<_$LeadSaleRoleContextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadSalePoType _$LeadSalePoTypeFromJson(Map<String, dynamic> json) {
  return _LeadSalePoType.fromJson(json);
}

/// @nodoc
mixin _$LeadSalePoType {
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
  $LeadSalePoTypeCopyWith<LeadSalePoType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadSalePoTypeCopyWith<$Res> {
  factory $LeadSalePoTypeCopyWith(
    LeadSalePoType value,
    $Res Function(LeadSalePoType) then,
  ) = _$LeadSalePoTypeCopyWithImpl<$Res, LeadSalePoType>;
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'MainIndex') String? mainIndex,
    @JsonKey(name: 'MainGroup') int? mainGroup,
    @JsonKey(name: 'MainIndex1') String? mainIndex1,
  });
}

/// @nodoc
class _$LeadSalePoTypeCopyWithImpl<$Res, $Val extends LeadSalePoType>
    implements $LeadSalePoTypeCopyWith<$Res> {
  _$LeadSalePoTypeCopyWithImpl(this._value, this._then);

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
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadSalePoTypeImplCopyWith<$Res>
    implements $LeadSalePoTypeCopyWith<$Res> {
  factory _$$LeadSalePoTypeImplCopyWith(
    _$LeadSalePoTypeImpl value,
    $Res Function(_$LeadSalePoTypeImpl) then,
  ) = __$$LeadSalePoTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'MainIndex') String? mainIndex,
    @JsonKey(name: 'MainGroup') int? mainGroup,
    @JsonKey(name: 'MainIndex1') String? mainIndex1,
  });
}

/// @nodoc
class __$$LeadSalePoTypeImplCopyWithImpl<$Res>
    extends _$LeadSalePoTypeCopyWithImpl<$Res, _$LeadSalePoTypeImpl>
    implements _$$LeadSalePoTypeImplCopyWith<$Res> {
  __$$LeadSalePoTypeImplCopyWithImpl(
    _$LeadSalePoTypeImpl _value,
    $Res Function(_$LeadSalePoTypeImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? mainIndex = freezed,
    Object? mainGroup = freezed,
    Object? mainIndex1 = freezed,
  }) {
    return _then(
      _$LeadSalePoTypeImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadSalePoTypeImpl implements _LeadSalePoType {
  const _$LeadSalePoTypeImpl({
    @JsonKey(name: 'ID') this.id,
    @JsonKey(name: 'MainIndex') this.mainIndex,
    @JsonKey(name: 'MainGroup') this.mainGroup,
    @JsonKey(name: 'MainIndex1') this.mainIndex1,
  });

  factory _$LeadSalePoTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadSalePoTypeImplFromJson(json);

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
    return 'LeadSalePoType(id: $id, mainIndex: $mainIndex, mainGroup: $mainGroup, mainIndex1: $mainIndex1)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadSalePoTypeImpl &&
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
  _$$LeadSalePoTypeImplCopyWith<_$LeadSalePoTypeImpl> get copyWith =>
      __$$LeadSalePoTypeImplCopyWithImpl<_$LeadSalePoTypeImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadSalePoTypeImplToJson(this);
  }
}

abstract class _LeadSalePoType implements LeadSalePoType {
  const factory _LeadSalePoType({
    @JsonKey(name: 'ID') final int? id,
    @JsonKey(name: 'MainIndex') final String? mainIndex,
    @JsonKey(name: 'MainGroup') final int? mainGroup,
    @JsonKey(name: 'MainIndex1') final String? mainIndex1,
  }) = _$LeadSalePoTypeImpl;

  factory _LeadSalePoType.fromJson(Map<String, dynamic> json) =
      _$LeadSalePoTypeImpl.fromJson;

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
  _$$LeadSalePoTypeImplCopyWith<_$LeadSalePoTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadSaleCustomerIndustry _$LeadSaleCustomerIndustryFromJson(
  Map<String, dynamic> json,
) {
  return _LeadSaleCustomerIndustry.fromJson(json);
}

/// @nodoc
mixin _$LeadSaleCustomerIndustry {
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
  $LeadSaleCustomerIndustryCopyWith<LeadSaleCustomerIndustry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadSaleCustomerIndustryCopyWith<$Res> {
  factory $LeadSaleCustomerIndustryCopyWith(
    LeadSaleCustomerIndustry value,
    $Res Function(LeadSaleCustomerIndustry) then,
  ) = _$LeadSaleCustomerIndustryCopyWithImpl<$Res, LeadSaleCustomerIndustry>;
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'IndustriesNameVI') String? industriesNameVi,
    @JsonKey(name: 'IndustriesNameEN') String? industriesNameEn,
    @JsonKey(name: 'NumberOrder') int? numberOrder,
  });
}

/// @nodoc
class _$LeadSaleCustomerIndustryCopyWithImpl<
  $Res,
  $Val extends LeadSaleCustomerIndustry
>
    implements $LeadSaleCustomerIndustryCopyWith<$Res> {
  _$LeadSaleCustomerIndustryCopyWithImpl(this._value, this._then);

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
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadSaleCustomerIndustryImplCopyWith<$Res>
    implements $LeadSaleCustomerIndustryCopyWith<$Res> {
  factory _$$LeadSaleCustomerIndustryImplCopyWith(
    _$LeadSaleCustomerIndustryImpl value,
    $Res Function(_$LeadSaleCustomerIndustryImpl) then,
  ) = __$$LeadSaleCustomerIndustryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'IndustriesNameVI') String? industriesNameVi,
    @JsonKey(name: 'IndustriesNameEN') String? industriesNameEn,
    @JsonKey(name: 'NumberOrder') int? numberOrder,
  });
}

/// @nodoc
class __$$LeadSaleCustomerIndustryImplCopyWithImpl<$Res>
    extends
        _$LeadSaleCustomerIndustryCopyWithImpl<
          $Res,
          _$LeadSaleCustomerIndustryImpl
        >
    implements _$$LeadSaleCustomerIndustryImplCopyWith<$Res> {
  __$$LeadSaleCustomerIndustryImplCopyWithImpl(
    _$LeadSaleCustomerIndustryImpl _value,
    $Res Function(_$LeadSaleCustomerIndustryImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? industriesNameVi = freezed,
    Object? industriesNameEn = freezed,
    Object? numberOrder = freezed,
  }) {
    return _then(
      _$LeadSaleCustomerIndustryImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadSaleCustomerIndustryImpl implements _LeadSaleCustomerIndustry {
  const _$LeadSaleCustomerIndustryImpl({
    @JsonKey(name: 'ID') this.id,
    @JsonKey(name: 'IndustriesNameVI') this.industriesNameVi,
    @JsonKey(name: 'IndustriesNameEN') this.industriesNameEn,
    @JsonKey(name: 'NumberOrder') this.numberOrder,
  });

  factory _$LeadSaleCustomerIndustryImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadSaleCustomerIndustryImplFromJson(json);

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
    return 'LeadSaleCustomerIndustry(id: $id, industriesNameVi: $industriesNameVi, industriesNameEn: $industriesNameEn, numberOrder: $numberOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadSaleCustomerIndustryImpl &&
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
    runtimeType,
    id,
    industriesNameVi,
    industriesNameEn,
    numberOrder,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadSaleCustomerIndustryImplCopyWith<_$LeadSaleCustomerIndustryImpl>
  get copyWith =>
      __$$LeadSaleCustomerIndustryImplCopyWithImpl<
        _$LeadSaleCustomerIndustryImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadSaleCustomerIndustryImplToJson(this);
  }
}

abstract class _LeadSaleCustomerIndustry implements LeadSaleCustomerIndustry {
  const factory _LeadSaleCustomerIndustry({
    @JsonKey(name: 'ID') final int? id,
    @JsonKey(name: 'IndustriesNameVI') final String? industriesNameVi,
    @JsonKey(name: 'IndustriesNameEN') final String? industriesNameEn,
    @JsonKey(name: 'NumberOrder') final int? numberOrder,
  }) = _$LeadSaleCustomerIndustryImpl;

  factory _LeadSaleCustomerIndustry.fromJson(Map<String, dynamic> json) =
      _$LeadSaleCustomerIndustryImpl.fromJson;

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
  _$$LeadSaleCustomerIndustryImplCopyWith<_$LeadSaleCustomerIndustryImpl>
  get copyWith => throw _privateConstructorUsedError;
}

LeadSaleCustomerSpecialization _$LeadSaleCustomerSpecializationFromJson(
  Map<String, dynamic> json,
) {
  return _LeadSaleCustomerSpecialization.fromJson(json);
}

/// @nodoc
mixin _$LeadSaleCustomerSpecialization {
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
  $LeadSaleCustomerSpecializationCopyWith<LeadSaleCustomerSpecialization>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadSaleCustomerSpecializationCopyWith<$Res> {
  factory $LeadSaleCustomerSpecializationCopyWith(
    LeadSaleCustomerSpecialization value,
    $Res Function(LeadSaleCustomerSpecialization) then,
  ) =
      _$LeadSaleCustomerSpecializationCopyWithImpl<
        $Res,
        LeadSaleCustomerSpecialization
      >;
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'Name') String? name,
  });
}

/// @nodoc
class _$LeadSaleCustomerSpecializationCopyWithImpl<
  $Res,
  $Val extends LeadSaleCustomerSpecialization
>
    implements $LeadSaleCustomerSpecializationCopyWith<$Res> {
  _$LeadSaleCustomerSpecializationCopyWithImpl(this._value, this._then);

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
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadSaleCustomerSpecializationImplCopyWith<$Res>
    implements $LeadSaleCustomerSpecializationCopyWith<$Res> {
  factory _$$LeadSaleCustomerSpecializationImplCopyWith(
    _$LeadSaleCustomerSpecializationImpl value,
    $Res Function(_$LeadSaleCustomerSpecializationImpl) then,
  ) = __$$LeadSaleCustomerSpecializationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'Name') String? name,
  });
}

/// @nodoc
class __$$LeadSaleCustomerSpecializationImplCopyWithImpl<$Res>
    extends
        _$LeadSaleCustomerSpecializationCopyWithImpl<
          $Res,
          _$LeadSaleCustomerSpecializationImpl
        >
    implements _$$LeadSaleCustomerSpecializationImplCopyWith<$Res> {
  __$$LeadSaleCustomerSpecializationImplCopyWithImpl(
    _$LeadSaleCustomerSpecializationImpl _value,
    $Res Function(_$LeadSaleCustomerSpecializationImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? stt = freezed,
    Object? code = freezed,
    Object? name = freezed,
  }) {
    return _then(
      _$LeadSaleCustomerSpecializationImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadSaleCustomerSpecializationImpl
    implements _LeadSaleCustomerSpecialization {
  const _$LeadSaleCustomerSpecializationImpl({
    @JsonKey(name: 'ID') this.id,
    @JsonKey(name: 'STT') this.stt,
    @JsonKey(name: 'Code') this.code,
    @JsonKey(name: 'Name') this.name,
  });

  factory _$LeadSaleCustomerSpecializationImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$LeadSaleCustomerSpecializationImplFromJson(json);

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
    return 'LeadSaleCustomerSpecialization(id: $id, stt: $stt, code: $code, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadSaleCustomerSpecializationImpl &&
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
  _$$LeadSaleCustomerSpecializationImplCopyWith<
    _$LeadSaleCustomerSpecializationImpl
  >
  get copyWith =>
      __$$LeadSaleCustomerSpecializationImplCopyWithImpl<
        _$LeadSaleCustomerSpecializationImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadSaleCustomerSpecializationImplToJson(this);
  }
}

abstract class _LeadSaleCustomerSpecialization
    implements LeadSaleCustomerSpecialization {
  const factory _LeadSaleCustomerSpecialization({
    @JsonKey(name: 'ID') final int? id,
    @JsonKey(name: 'STT') final int? stt,
    @JsonKey(name: 'Code') final String? code,
    @JsonKey(name: 'Name') final String? name,
  }) = _$LeadSaleCustomerSpecializationImpl;

  factory _LeadSaleCustomerSpecialization.fromJson(Map<String, dynamic> json) =
      _$LeadSaleCustomerSpecializationImpl.fromJson;

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
  _$$LeadSaleCustomerSpecializationImplCopyWith<
    _$LeadSaleCustomerSpecializationImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

LeadSaleBusinessField _$LeadSaleBusinessFieldFromJson(
  Map<String, dynamic> json,
) {
  return _LeadSaleBusinessField.fromJson(json);
}

/// @nodoc
mixin _$LeadSaleBusinessField {
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
  $LeadSaleBusinessFieldCopyWith<LeadSaleBusinessField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadSaleBusinessFieldCopyWith<$Res> {
  factory $LeadSaleBusinessFieldCopyWith(
    LeadSaleBusinessField value,
    $Res Function(LeadSaleBusinessField) then,
  ) = _$LeadSaleBusinessFieldCopyWithImpl<$Res, LeadSaleBusinessField>;
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'Name') String? name,
  });
}

/// @nodoc
class _$LeadSaleBusinessFieldCopyWithImpl<
  $Res,
  $Val extends LeadSaleBusinessField
>
    implements $LeadSaleBusinessFieldCopyWith<$Res> {
  _$LeadSaleBusinessFieldCopyWithImpl(this._value, this._then);

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
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadSaleBusinessFieldImplCopyWith<$Res>
    implements $LeadSaleBusinessFieldCopyWith<$Res> {
  factory _$$LeadSaleBusinessFieldImplCopyWith(
    _$LeadSaleBusinessFieldImpl value,
    $Res Function(_$LeadSaleBusinessFieldImpl) then,
  ) = __$$LeadSaleBusinessFieldImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'Name') String? name,
  });
}

/// @nodoc
class __$$LeadSaleBusinessFieldImplCopyWithImpl<$Res>
    extends
        _$LeadSaleBusinessFieldCopyWithImpl<$Res, _$LeadSaleBusinessFieldImpl>
    implements _$$LeadSaleBusinessFieldImplCopyWith<$Res> {
  __$$LeadSaleBusinessFieldImplCopyWithImpl(
    _$LeadSaleBusinessFieldImpl _value,
    $Res Function(_$LeadSaleBusinessFieldImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? stt = freezed,
    Object? code = freezed,
    Object? name = freezed,
  }) {
    return _then(
      _$LeadSaleBusinessFieldImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadSaleBusinessFieldImpl implements _LeadSaleBusinessField {
  const _$LeadSaleBusinessFieldImpl({
    @JsonKey(name: 'ID') this.id,
    @JsonKey(name: 'STT') this.stt,
    @JsonKey(name: 'Code') this.code,
    @JsonKey(name: 'Name') this.name,
  });

  factory _$LeadSaleBusinessFieldImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadSaleBusinessFieldImplFromJson(json);

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
    return 'LeadSaleBusinessField(id: $id, stt: $stt, code: $code, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadSaleBusinessFieldImpl &&
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
  _$$LeadSaleBusinessFieldImplCopyWith<_$LeadSaleBusinessFieldImpl>
  get copyWith =>
      __$$LeadSaleBusinessFieldImplCopyWithImpl<_$LeadSaleBusinessFieldImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadSaleBusinessFieldImplToJson(this);
  }
}

abstract class _LeadSaleBusinessField implements LeadSaleBusinessField {
  const factory _LeadSaleBusinessField({
    @JsonKey(name: 'ID') final int? id,
    @JsonKey(name: 'STT') final int? stt,
    @JsonKey(name: 'Code') final String? code,
    @JsonKey(name: 'Name') final String? name,
  }) = _$LeadSaleBusinessFieldImpl;

  factory _LeadSaleBusinessField.fromJson(Map<String, dynamic> json) =
      _$LeadSaleBusinessFieldImpl.fromJson;

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
  _$$LeadSaleBusinessFieldImplCopyWith<_$LeadSaleBusinessFieldImpl>
  get copyWith => throw _privateConstructorUsedError;
}

LeadSaleProvince _$LeadSaleProvinceFromJson(Map<String, dynamic> json) {
  return _LeadSaleProvince.fromJson(json);
}

/// @nodoc
mixin _$LeadSaleProvince {
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
  $LeadSaleProvinceCopyWith<LeadSaleProvince> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadSaleProvinceCopyWith<$Res> {
  factory $LeadSaleProvinceCopyWith(
    LeadSaleProvince value,
    $Res Function(LeadSaleProvince) then,
  ) = _$LeadSaleProvinceCopyWithImpl<$Res, LeadSaleProvince>;
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'ProvinceCode') String? provinceCode,
    @JsonKey(name: 'ProvinceName') String? provinceName,
  });
}

/// @nodoc
class _$LeadSaleProvinceCopyWithImpl<$Res, $Val extends LeadSaleProvince>
    implements $LeadSaleProvinceCopyWith<$Res> {
  _$LeadSaleProvinceCopyWithImpl(this._value, this._then);

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
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadSaleProvinceImplCopyWith<$Res>
    implements $LeadSaleProvinceCopyWith<$Res> {
  factory _$$LeadSaleProvinceImplCopyWith(
    _$LeadSaleProvinceImpl value,
    $Res Function(_$LeadSaleProvinceImpl) then,
  ) = __$$LeadSaleProvinceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'ProvinceCode') String? provinceCode,
    @JsonKey(name: 'ProvinceName') String? provinceName,
  });
}

/// @nodoc
class __$$LeadSaleProvinceImplCopyWithImpl<$Res>
    extends _$LeadSaleProvinceCopyWithImpl<$Res, _$LeadSaleProvinceImpl>
    implements _$$LeadSaleProvinceImplCopyWith<$Res> {
  __$$LeadSaleProvinceImplCopyWithImpl(
    _$LeadSaleProvinceImpl _value,
    $Res Function(_$LeadSaleProvinceImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? stt = freezed,
    Object? provinceCode = freezed,
    Object? provinceName = freezed,
  }) {
    return _then(
      _$LeadSaleProvinceImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadSaleProvinceImpl implements _LeadSaleProvince {
  const _$LeadSaleProvinceImpl({
    @JsonKey(name: 'ID') this.id,
    @JsonKey(name: 'STT') this.stt,
    @JsonKey(name: 'ProvinceCode') this.provinceCode,
    @JsonKey(name: 'ProvinceName') this.provinceName,
  });

  factory _$LeadSaleProvinceImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadSaleProvinceImplFromJson(json);

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
    return 'LeadSaleProvince(id: $id, stt: $stt, provinceCode: $provinceCode, provinceName: $provinceName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadSaleProvinceImpl &&
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
  _$$LeadSaleProvinceImplCopyWith<_$LeadSaleProvinceImpl> get copyWith =>
      __$$LeadSaleProvinceImplCopyWithImpl<_$LeadSaleProvinceImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadSaleProvinceImplToJson(this);
  }
}

abstract class _LeadSaleProvince implements LeadSaleProvince {
  const factory _LeadSaleProvince({
    @JsonKey(name: 'ID') final int? id,
    @JsonKey(name: 'STT') final int? stt,
    @JsonKey(name: 'ProvinceCode') final String? provinceCode,
    @JsonKey(name: 'ProvinceName') final String? provinceName,
  }) = _$LeadSaleProvinceImpl;

  factory _LeadSaleProvince.fromJson(Map<String, dynamic> json) =
      _$LeadSaleProvinceImpl.fromJson;

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
  _$$LeadSaleProvinceImplCopyWith<_$LeadSaleProvinceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadSaleCustomer _$LeadSaleCustomerFromJson(Map<String, dynamic> json) {
  return _LeadSaleCustomer.fromJson(json);
}

/// @nodoc
mixin _$LeadSaleCustomer {
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
  $LeadSaleCustomerCopyWith<LeadSaleCustomer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadSaleCustomerCopyWith<$Res> {
  factory $LeadSaleCustomerCopyWith(
    LeadSaleCustomer value,
    $Res Function(LeadSaleCustomer) then,
  ) = _$LeadSaleCustomerCopyWithImpl<$Res, LeadSaleCustomer>;
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
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
    @JsonKey(name: 'TaxCode') String? taxCode,
  });
}

/// @nodoc
class _$LeadSaleCustomerCopyWithImpl<$Res, $Val extends LeadSaleCustomer>
    implements $LeadSaleCustomerCopyWith<$Res> {
  _$LeadSaleCustomerCopyWithImpl(this._value, this._then);

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
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadSaleCustomerImplCopyWith<$Res>
    implements $LeadSaleCustomerCopyWith<$Res> {
  factory _$$LeadSaleCustomerImplCopyWith(
    _$LeadSaleCustomerImpl value,
    $Res Function(_$LeadSaleCustomerImpl) then,
  ) = __$$LeadSaleCustomerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
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
    @JsonKey(name: 'TaxCode') String? taxCode,
  });
}

/// @nodoc
class __$$LeadSaleCustomerImplCopyWithImpl<$Res>
    extends _$LeadSaleCustomerCopyWithImpl<$Res, _$LeadSaleCustomerImpl>
    implements _$$LeadSaleCustomerImplCopyWith<$Res> {
  __$$LeadSaleCustomerImplCopyWithImpl(
    _$LeadSaleCustomerImpl _value,
    $Res Function(_$LeadSaleCustomerImpl) _then,
  ) : super(_value, _then);

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
    return _then(
      _$LeadSaleCustomerImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadSaleCustomerImpl implements _LeadSaleCustomer {
  const _$LeadSaleCustomerImpl({
    @JsonKey(name: 'ID') this.id,
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
    @JsonKey(name: 'TaxCode') this.taxCode,
  });

  factory _$LeadSaleCustomerImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadSaleCustomerImplFromJson(json);

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
    return 'LeadSaleCustomer(id: $id, customerName: $customerName, customerCode: $customerCode, customerShortName: $customerShortName, address: $address, phone: $phone, email: $email, contactName: $contactName, contactPhone: $contactPhone, contactEmail: $contactEmail, province: $province, customerType: $customerType, customerIndustriesId: $customerIndustriesId, customerSpecializationId: $customerSpecializationId, businessFieldId: $businessFieldId, website: $website, taxCode: $taxCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadSaleCustomerImpl &&
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
                  other.customerSpecializationId,
                  customerSpecializationId,
                ) ||
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
    taxCode,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadSaleCustomerImplCopyWith<_$LeadSaleCustomerImpl> get copyWith =>
      __$$LeadSaleCustomerImplCopyWithImpl<_$LeadSaleCustomerImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadSaleCustomerImplToJson(this);
  }
}

abstract class _LeadSaleCustomer implements LeadSaleCustomer {
  const factory _LeadSaleCustomer({
    @JsonKey(name: 'ID') final int? id,
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
    @JsonKey(name: 'TaxCode') final String? taxCode,
  }) = _$LeadSaleCustomerImpl;

  factory _LeadSaleCustomer.fromJson(Map<String, dynamic> json) =
      _$LeadSaleCustomerImpl.fromJson;

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
  _$$LeadSaleCustomerImplCopyWith<_$LeadSaleCustomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadSaleDuplicateInfo _$LeadSaleDuplicateInfoFromJson(
  Map<String, dynamic> json,
) {
  return _LeadSaleDuplicateInfo.fromJson(json);
}

/// @nodoc
mixin _$LeadSaleDuplicateInfo {
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
  $LeadSaleDuplicateInfoCopyWith<LeadSaleDuplicateInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadSaleDuplicateInfoCopyWith<$Res> {
  factory $LeadSaleDuplicateInfoCopyWith(
    LeadSaleDuplicateInfo value,
    $Res Function(LeadSaleDuplicateInfo) then,
  ) = _$LeadSaleDuplicateInfoCopyWithImpl<$Res, LeadSaleDuplicateInfo>;
  @useResult
  $Res call({
    @JsonKey(name: 'SourceTable') String? sourceTable,
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'ContactName') String? contactName,
    @JsonKey(name: 'ContactPhone') String? contactPhone,
    @JsonKey(name: 'ContactEmail') String? contactEmail,
    @JsonKey(name: 'Stage') int? stage,
    @JsonKey(name: 'MatchField') String? matchField,
    @JsonKey(name: 'OwnerName') String? ownerName,
    @JsonKey(name: 'OwnerSide') String? ownerSide,
  });
}

/// @nodoc
class _$LeadSaleDuplicateInfoCopyWithImpl<
  $Res,
  $Val extends LeadSaleDuplicateInfo
>
    implements $LeadSaleDuplicateInfoCopyWith<$Res> {
  _$LeadSaleDuplicateInfoCopyWithImpl(this._value, this._then);

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
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadSaleDuplicateInfoImplCopyWith<$Res>
    implements $LeadSaleDuplicateInfoCopyWith<$Res> {
  factory _$$LeadSaleDuplicateInfoImplCopyWith(
    _$LeadSaleDuplicateInfoImpl value,
    $Res Function(_$LeadSaleDuplicateInfoImpl) then,
  ) = __$$LeadSaleDuplicateInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'SourceTable') String? sourceTable,
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'ContactName') String? contactName,
    @JsonKey(name: 'ContactPhone') String? contactPhone,
    @JsonKey(name: 'ContactEmail') String? contactEmail,
    @JsonKey(name: 'Stage') int? stage,
    @JsonKey(name: 'MatchField') String? matchField,
    @JsonKey(name: 'OwnerName') String? ownerName,
    @JsonKey(name: 'OwnerSide') String? ownerSide,
  });
}

/// @nodoc
class __$$LeadSaleDuplicateInfoImplCopyWithImpl<$Res>
    extends
        _$LeadSaleDuplicateInfoCopyWithImpl<$Res, _$LeadSaleDuplicateInfoImpl>
    implements _$$LeadSaleDuplicateInfoImplCopyWith<$Res> {
  __$$LeadSaleDuplicateInfoImplCopyWithImpl(
    _$LeadSaleDuplicateInfoImpl _value,
    $Res Function(_$LeadSaleDuplicateInfoImpl) _then,
  ) : super(_value, _then);

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
    return _then(
      _$LeadSaleDuplicateInfoImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadSaleDuplicateInfoImpl implements _LeadSaleDuplicateInfo {
  const _$LeadSaleDuplicateInfoImpl({
    @JsonKey(name: 'SourceTable') this.sourceTable,
    @JsonKey(name: 'ID') this.id,
    @JsonKey(name: 'Code') this.code,
    @JsonKey(name: 'Name') this.name,
    @JsonKey(name: 'ContactName') this.contactName,
    @JsonKey(name: 'ContactPhone') this.contactPhone,
    @JsonKey(name: 'ContactEmail') this.contactEmail,
    @JsonKey(name: 'Stage') this.stage,
    @JsonKey(name: 'MatchField') this.matchField,
    @JsonKey(name: 'OwnerName') this.ownerName,
    @JsonKey(name: 'OwnerSide') this.ownerSide,
  });

  factory _$LeadSaleDuplicateInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadSaleDuplicateInfoImplFromJson(json);

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
    return 'LeadSaleDuplicateInfo(sourceTable: $sourceTable, id: $id, code: $code, name: $name, contactName: $contactName, contactPhone: $contactPhone, contactEmail: $contactEmail, stage: $stage, matchField: $matchField, ownerName: $ownerName, ownerSide: $ownerSide)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadSaleDuplicateInfoImpl &&
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
    ownerSide,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadSaleDuplicateInfoImplCopyWith<_$LeadSaleDuplicateInfoImpl>
  get copyWith =>
      __$$LeadSaleDuplicateInfoImplCopyWithImpl<_$LeadSaleDuplicateInfoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadSaleDuplicateInfoImplToJson(this);
  }
}

abstract class _LeadSaleDuplicateInfo implements LeadSaleDuplicateInfo {
  const factory _LeadSaleDuplicateInfo({
    @JsonKey(name: 'SourceTable') final String? sourceTable,
    @JsonKey(name: 'ID') final int? id,
    @JsonKey(name: 'Code') final String? code,
    @JsonKey(name: 'Name') final String? name,
    @JsonKey(name: 'ContactName') final String? contactName,
    @JsonKey(name: 'ContactPhone') final String? contactPhone,
    @JsonKey(name: 'ContactEmail') final String? contactEmail,
    @JsonKey(name: 'Stage') final int? stage,
    @JsonKey(name: 'MatchField') final String? matchField,
    @JsonKey(name: 'OwnerName') final String? ownerName,
    @JsonKey(name: 'OwnerSide') final String? ownerSide,
  }) = _$LeadSaleDuplicateInfoImpl;

  factory _LeadSaleDuplicateInfo.fromJson(Map<String, dynamic> json) =
      _$LeadSaleDuplicateInfoImpl.fromJson;

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
  _$$LeadSaleDuplicateInfoImplCopyWith<_$LeadSaleDuplicateInfoImpl>
  get copyWith => throw _privateConstructorUsedError;
}

LeadSaleDuplicateCheckResult _$LeadSaleDuplicateCheckResultFromJson(
  Map<String, dynamic> json,
) {
  return _LeadSaleDuplicateCheckResult.fromJson(json);
}

/// @nodoc
mixin _$LeadSaleDuplicateCheckResult {
  /// Thông báo từ API.
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;

  /// Danh sách bản ghi bị trùng.
  @JsonKey(name: 'data')
  List<LeadSaleDuplicateInfo>? get duplicates =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadSaleDuplicateCheckResultCopyWith<LeadSaleDuplicateCheckResult>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadSaleDuplicateCheckResultCopyWith<$Res> {
  factory $LeadSaleDuplicateCheckResultCopyWith(
    LeadSaleDuplicateCheckResult value,
    $Res Function(LeadSaleDuplicateCheckResult) then,
  ) =
      _$LeadSaleDuplicateCheckResultCopyWithImpl<
        $Res,
        LeadSaleDuplicateCheckResult
      >;
  @useResult
  $Res call({
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') List<LeadSaleDuplicateInfo>? duplicates,
  });
}

/// @nodoc
class _$LeadSaleDuplicateCheckResultCopyWithImpl<
  $Res,
  $Val extends LeadSaleDuplicateCheckResult
>
    implements $LeadSaleDuplicateCheckResultCopyWith<$Res> {
  _$LeadSaleDuplicateCheckResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = freezed, Object? duplicates = freezed}) {
    return _then(
      _value.copyWith(
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            duplicates: freezed == duplicates
                ? _value.duplicates
                : duplicates // ignore: cast_nullable_to_non_nullable
                      as List<LeadSaleDuplicateInfo>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadSaleDuplicateCheckResultImplCopyWith<$Res>
    implements $LeadSaleDuplicateCheckResultCopyWith<$Res> {
  factory _$$LeadSaleDuplicateCheckResultImplCopyWith(
    _$LeadSaleDuplicateCheckResultImpl value,
    $Res Function(_$LeadSaleDuplicateCheckResultImpl) then,
  ) = __$$LeadSaleDuplicateCheckResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') List<LeadSaleDuplicateInfo>? duplicates,
  });
}

/// @nodoc
class __$$LeadSaleDuplicateCheckResultImplCopyWithImpl<$Res>
    extends
        _$LeadSaleDuplicateCheckResultCopyWithImpl<
          $Res,
          _$LeadSaleDuplicateCheckResultImpl
        >
    implements _$$LeadSaleDuplicateCheckResultImplCopyWith<$Res> {
  __$$LeadSaleDuplicateCheckResultImplCopyWithImpl(
    _$LeadSaleDuplicateCheckResultImpl _value,
    $Res Function(_$LeadSaleDuplicateCheckResultImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = freezed, Object? duplicates = freezed}) {
    return _then(
      _$LeadSaleDuplicateCheckResultImpl(
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        duplicates: freezed == duplicates
            ? _value._duplicates
            : duplicates // ignore: cast_nullable_to_non_nullable
                  as List<LeadSaleDuplicateInfo>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadSaleDuplicateCheckResultImpl
    implements _LeadSaleDuplicateCheckResult {
  const _$LeadSaleDuplicateCheckResultImpl({
    @JsonKey(name: 'message') this.message,
    @JsonKey(name: 'data') final List<LeadSaleDuplicateInfo>? duplicates,
  }) : _duplicates = duplicates;

  factory _$LeadSaleDuplicateCheckResultImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$LeadSaleDuplicateCheckResultImplFromJson(json);

  /// Thông báo từ API.
  @override
  @JsonKey(name: 'message')
  final String? message;

  /// Danh sách bản ghi bị trùng.
  final List<LeadSaleDuplicateInfo>? _duplicates;

  /// Danh sách bản ghi bị trùng.
  @override
  @JsonKey(name: 'data')
  List<LeadSaleDuplicateInfo>? get duplicates {
    final value = _duplicates;
    if (value == null) return null;
    if (_duplicates is EqualUnmodifiableListView) return _duplicates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'LeadSaleDuplicateCheckResult(message: $message, duplicates: $duplicates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadSaleDuplicateCheckResultImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(
              other._duplicates,
              _duplicates,
            ));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    const DeepCollectionEquality().hash(_duplicates),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadSaleDuplicateCheckResultImplCopyWith<
    _$LeadSaleDuplicateCheckResultImpl
  >
  get copyWith =>
      __$$LeadSaleDuplicateCheckResultImplCopyWithImpl<
        _$LeadSaleDuplicateCheckResultImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadSaleDuplicateCheckResultImplToJson(this);
  }
}

abstract class _LeadSaleDuplicateCheckResult
    implements LeadSaleDuplicateCheckResult {
  const factory _LeadSaleDuplicateCheckResult({
    @JsonKey(name: 'message') final String? message,
    @JsonKey(name: 'data') final List<LeadSaleDuplicateInfo>? duplicates,
  }) = _$LeadSaleDuplicateCheckResultImpl;

  factory _LeadSaleDuplicateCheckResult.fromJson(Map<String, dynamic> json) =
      _$LeadSaleDuplicateCheckResultImpl.fromJson;

  @override
  /// Thông báo từ API.
  @JsonKey(name: 'message')
  String? get message;
  @override
  /// Danh sách bản ghi bị trùng.
  @JsonKey(name: 'data')
  List<LeadSaleDuplicateInfo>? get duplicates;
  @override
  @JsonKey(ignore: true)
  _$$LeadSaleDuplicateCheckResultImplCopyWith<
    _$LeadSaleDuplicateCheckResultImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

LeadSaleSaveResult _$LeadSaleSaveResultFromJson(Map<String, dynamic> json) {
  return _LeadSaleSaveResult.fromJson(json);
}

/// @nodoc
mixin _$LeadSaleSaveResult {
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
  $LeadSaleSaveResultCopyWith<LeadSaleSaveResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadSaleSaveResultCopyWith<$Res> {
  factory $LeadSaleSaveResultCopyWith(
    LeadSaleSaveResult value,
    $Res Function(LeadSaleSaveResult) then,
  ) = _$LeadSaleSaveResultCopyWithImpl<$Res, LeadSaleSaveResult>;
  @useResult
  $Res call({
    @JsonKey(name: 'message') String? message,
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
    @JsonKey(name: 'idConCus') int? idConCus,
  });
}

/// @nodoc
class _$LeadSaleSaveResultCopyWithImpl<$Res, $Val extends LeadSaleSaveResult>
    implements $LeadSaleSaveResultCopyWith<$Res> {
  _$LeadSaleSaveResultCopyWithImpl(this._value, this._then);

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
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadSaleSaveResultImplCopyWith<$Res>
    implements $LeadSaleSaveResultCopyWith<$Res> {
  factory _$$LeadSaleSaveResultImplCopyWith(
    _$LeadSaleSaveResultImpl value,
    $Res Function(_$LeadSaleSaveResultImpl) then,
  ) = __$$LeadSaleSaveResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'message') String? message,
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
    @JsonKey(name: 'idConCus') int? idConCus,
  });
}

/// @nodoc
class __$$LeadSaleSaveResultImplCopyWithImpl<$Res>
    extends _$LeadSaleSaveResultCopyWithImpl<$Res, _$LeadSaleSaveResultImpl>
    implements _$$LeadSaleSaveResultImplCopyWith<$Res> {
  __$$LeadSaleSaveResultImplCopyWithImpl(
    _$LeadSaleSaveResultImpl _value,
    $Res Function(_$LeadSaleSaveResultImpl) _then,
  ) : super(_value, _then);

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
    return _then(
      _$LeadSaleSaveResultImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadSaleSaveResultImpl implements _LeadSaleSaveResult {
  const _$LeadSaleSaveResultImpl({
    @JsonKey(name: 'message') this.message,
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
    @JsonKey(name: 'idConCus') this.idConCus,
  });

  factory _$LeadSaleSaveResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadSaleSaveResultImplFromJson(json);

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
    return 'LeadSaleSaveResult(message: $message, id: $id, leadCode: $leadCode, customerId: $customerId, poTypeId: $poTypeId, leadSourceId: $leadSourceId, contactName: $contactName, contactPhone: $contactPhone, contactEmail: $contactEmail, marketingEmployeeId: $marketingEmployeeId, stage: $stage, idConCus: $idConCus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadSaleSaveResultImpl &&
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
    idConCus,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadSaleSaveResultImplCopyWith<_$LeadSaleSaveResultImpl> get copyWith =>
      __$$LeadSaleSaveResultImplCopyWithImpl<_$LeadSaleSaveResultImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadSaleSaveResultImplToJson(this);
  }
}

abstract class _LeadSaleSaveResult implements LeadSaleSaveResult {
  const factory _LeadSaleSaveResult({
    @JsonKey(name: 'message') final String? message,
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
    @JsonKey(name: 'idConCus') final int? idConCus,
  }) = _$LeadSaleSaveResultImpl;

  factory _LeadSaleSaveResult.fromJson(Map<String, dynamic> json) =
      _$LeadSaleSaveResultImpl.fromJson;

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
  _$$LeadSaleSaveResultImplCopyWith<_$LeadSaleSaveResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadSaleHandoverResult _$LeadSaleHandoverResultFromJson(
  Map<String, dynamic> json,
) {
  return _LeadSaleHandoverResult.fromJson(json);
}

/// @nodoc
mixin _$LeadSaleHandoverResult {
  /// Thông báo từ API (vd "Đã bàn giao 1 lead cho Leader Lê Thị Hải!").
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;

  /// Danh sách ID phiếu lead đã bàn giao thành công.
  @JsonKey(name: 'data')
  List<int>? get ids => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadSaleHandoverResultCopyWith<LeadSaleHandoverResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadSaleHandoverResultCopyWith<$Res> {
  factory $LeadSaleHandoverResultCopyWith(
    LeadSaleHandoverResult value,
    $Res Function(LeadSaleHandoverResult) then,
  ) = _$LeadSaleHandoverResultCopyWithImpl<$Res, LeadSaleHandoverResult>;
  @useResult
  $Res call({
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') List<int>? ids,
  });
}

/// @nodoc
class _$LeadSaleHandoverResultCopyWithImpl<
  $Res,
  $Val extends LeadSaleHandoverResult
>
    implements $LeadSaleHandoverResultCopyWith<$Res> {
  _$LeadSaleHandoverResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = freezed, Object? ids = freezed}) {
    return _then(
      _value.copyWith(
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            ids: freezed == ids
                ? _value.ids
                : ids // ignore: cast_nullable_to_non_nullable
                      as List<int>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadSaleHandoverResultImplCopyWith<$Res>
    implements $LeadSaleHandoverResultCopyWith<$Res> {
  factory _$$LeadSaleHandoverResultImplCopyWith(
    _$LeadSaleHandoverResultImpl value,
    $Res Function(_$LeadSaleHandoverResultImpl) then,
  ) = __$$LeadSaleHandoverResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') List<int>? ids,
  });
}

/// @nodoc
class __$$LeadSaleHandoverResultImplCopyWithImpl<$Res>
    extends
        _$LeadSaleHandoverResultCopyWithImpl<$Res, _$LeadSaleHandoverResultImpl>
    implements _$$LeadSaleHandoverResultImplCopyWith<$Res> {
  __$$LeadSaleHandoverResultImplCopyWithImpl(
    _$LeadSaleHandoverResultImpl _value,
    $Res Function(_$LeadSaleHandoverResultImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = freezed, Object? ids = freezed}) {
    return _then(
      _$LeadSaleHandoverResultImpl(
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        ids: freezed == ids
            ? _value._ids
            : ids // ignore: cast_nullable_to_non_nullable
                  as List<int>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadSaleHandoverResultImpl implements _LeadSaleHandoverResult {
  const _$LeadSaleHandoverResultImpl({
    @JsonKey(name: 'message') this.message,
    @JsonKey(name: 'data') final List<int>? ids,
  }) : _ids = ids;

  factory _$LeadSaleHandoverResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadSaleHandoverResultImplFromJson(json);

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
    return 'LeadSaleHandoverResult(message: $message, ids: $ids)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadSaleHandoverResultImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._ids, _ids));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    const DeepCollectionEquality().hash(_ids),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadSaleHandoverResultImplCopyWith<_$LeadSaleHandoverResultImpl>
  get copyWith =>
      __$$LeadSaleHandoverResultImplCopyWithImpl<_$LeadSaleHandoverResultImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadSaleHandoverResultImplToJson(this);
  }
}

abstract class _LeadSaleHandoverResult implements LeadSaleHandoverResult {
  const factory _LeadSaleHandoverResult({
    @JsonKey(name: 'message') final String? message,
    @JsonKey(name: 'data') final List<int>? ids,
  }) = _$LeadSaleHandoverResultImpl;

  factory _LeadSaleHandoverResult.fromJson(Map<String, dynamic> json) =
      _$LeadSaleHandoverResultImpl.fromJson;

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
  _$$LeadSaleHandoverResultImplCopyWith<_$LeadSaleHandoverResultImpl>
  get copyWith => throw _privateConstructorUsedError;
}

LeadSaleActivitySaveResult _$LeadSaleActivitySaveResultFromJson(
  Map<String, dynamic> json,
) {
  return _LeadSaleActivitySaveResult.fromJson(json);
}

/// @nodoc
mixin _$LeadSaleActivitySaveResult {
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
  $LeadSaleActivitySaveResultCopyWith<LeadSaleActivitySaveResult>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadSaleActivitySaveResultCopyWith<$Res> {
  factory $LeadSaleActivitySaveResultCopyWith(
    LeadSaleActivitySaveResult value,
    $Res Function(LeadSaleActivitySaveResult) then,
  ) =
      _$LeadSaleActivitySaveResultCopyWithImpl<
        $Res,
        LeadSaleActivitySaveResult
      >;
  @useResult
  $Res call({
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'LeadID') int? leadId,
  });
}

/// @nodoc
class _$LeadSaleActivitySaveResultCopyWithImpl<
  $Res,
  $Val extends LeadSaleActivitySaveResult
>
    implements $LeadSaleActivitySaveResultCopyWith<$Res> {
  _$LeadSaleActivitySaveResultCopyWithImpl(this._value, this._then);

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
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadSaleActivitySaveResultImplCopyWith<$Res>
    implements $LeadSaleActivitySaveResultCopyWith<$Res> {
  factory _$$LeadSaleActivitySaveResultImplCopyWith(
    _$LeadSaleActivitySaveResultImpl value,
    $Res Function(_$LeadSaleActivitySaveResultImpl) then,
  ) = __$$LeadSaleActivitySaveResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'LeadID') int? leadId,
  });
}

/// @nodoc
class __$$LeadSaleActivitySaveResultImplCopyWithImpl<$Res>
    extends
        _$LeadSaleActivitySaveResultCopyWithImpl<
          $Res,
          _$LeadSaleActivitySaveResultImpl
        >
    implements _$$LeadSaleActivitySaveResultImplCopyWith<$Res> {
  __$$LeadSaleActivitySaveResultImplCopyWithImpl(
    _$LeadSaleActivitySaveResultImpl _value,
    $Res Function(_$LeadSaleActivitySaveResultImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? id = freezed,
    Object? leadId = freezed,
  }) {
    return _then(
      _$LeadSaleActivitySaveResultImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadSaleActivitySaveResultImpl implements _LeadSaleActivitySaveResult {
  const _$LeadSaleActivitySaveResultImpl({
    @JsonKey(name: 'message') this.message,
    @JsonKey(name: 'ID') this.id,
    @JsonKey(name: 'LeadID') this.leadId,
  });

  factory _$LeadSaleActivitySaveResultImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$LeadSaleActivitySaveResultImplFromJson(json);

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
    return 'LeadSaleActivitySaveResult(message: $message, id: $id, leadId: $leadId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadSaleActivitySaveResultImpl &&
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
  _$$LeadSaleActivitySaveResultImplCopyWith<_$LeadSaleActivitySaveResultImpl>
  get copyWith =>
      __$$LeadSaleActivitySaveResultImplCopyWithImpl<
        _$LeadSaleActivitySaveResultImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadSaleActivitySaveResultImplToJson(this);
  }
}

abstract class _LeadSaleActivitySaveResult
    implements LeadSaleActivitySaveResult {
  const factory _LeadSaleActivitySaveResult({
    @JsonKey(name: 'message') final String? message,
    @JsonKey(name: 'ID') final int? id,
    @JsonKey(name: 'LeadID') final int? leadId,
  }) = _$LeadSaleActivitySaveResultImpl;

  factory _LeadSaleActivitySaveResult.fromJson(Map<String, dynamic> json) =
      _$LeadSaleActivitySaveResultImpl.fromJson;

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
  _$$LeadSaleActivitySaveResultImplCopyWith<_$LeadSaleActivitySaveResultImpl>
  get copyWith => throw _privateConstructorUsedError;
}

LeadSaleActivityType _$LeadSaleActivityTypeFromJson(Map<String, dynamic> json) {
  return _LeadSaleActivityType.fromJson(json);
}

/// @nodoc
mixin _$LeadSaleActivityType {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;

  /// Tên loại nhóm hiển thị cho người dùng.
  @JsonKey(name: 'MainIndex')
  String? get mainIndex => throw _privateConstructorUsedError;
  @JsonKey(name: 'MainGroup')
  int? get mainGroup => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadSaleActivityTypeCopyWith<LeadSaleActivityType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadSaleActivityTypeCopyWith<$Res> {
  factory $LeadSaleActivityTypeCopyWith(
    LeadSaleActivityType value,
    $Res Function(LeadSaleActivityType) then,
  ) = _$LeadSaleActivityTypeCopyWithImpl<$Res, LeadSaleActivityType>;
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'MainIndex') String? mainIndex,
    @JsonKey(name: 'MainGroup') int? mainGroup,
  });
}

/// @nodoc
class _$LeadSaleActivityTypeCopyWithImpl<
  $Res,
  $Val extends LeadSaleActivityType
>
    implements $LeadSaleActivityTypeCopyWith<$Res> {
  _$LeadSaleActivityTypeCopyWithImpl(this._value, this._then);

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
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadSaleActivityTypeImplCopyWith<$Res>
    implements $LeadSaleActivityTypeCopyWith<$Res> {
  factory _$$LeadSaleActivityTypeImplCopyWith(
    _$LeadSaleActivityTypeImpl value,
    $Res Function(_$LeadSaleActivityTypeImpl) then,
  ) = __$$LeadSaleActivityTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'MainIndex') String? mainIndex,
    @JsonKey(name: 'MainGroup') int? mainGroup,
  });
}

/// @nodoc
class __$$LeadSaleActivityTypeImplCopyWithImpl<$Res>
    extends _$LeadSaleActivityTypeCopyWithImpl<$Res, _$LeadSaleActivityTypeImpl>
    implements _$$LeadSaleActivityTypeImplCopyWith<$Res> {
  __$$LeadSaleActivityTypeImplCopyWithImpl(
    _$LeadSaleActivityTypeImpl _value,
    $Res Function(_$LeadSaleActivityTypeImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? mainIndex = freezed,
    Object? mainGroup = freezed,
  }) {
    return _then(
      _$LeadSaleActivityTypeImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadSaleActivityTypeImpl implements _LeadSaleActivityType {
  const _$LeadSaleActivityTypeImpl({
    @JsonKey(name: 'ID') this.id,
    @JsonKey(name: 'MainIndex') this.mainIndex,
    @JsonKey(name: 'MainGroup') this.mainGroup,
  });

  factory _$LeadSaleActivityTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadSaleActivityTypeImplFromJson(json);

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
    return 'LeadSaleActivityType(id: $id, mainIndex: $mainIndex, mainGroup: $mainGroup)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadSaleActivityTypeImpl &&
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
  _$$LeadSaleActivityTypeImplCopyWith<_$LeadSaleActivityTypeImpl>
  get copyWith =>
      __$$LeadSaleActivityTypeImplCopyWithImpl<_$LeadSaleActivityTypeImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadSaleActivityTypeImplToJson(this);
  }
}

abstract class _LeadSaleActivityType implements LeadSaleActivityType {
  const factory _LeadSaleActivityType({
    @JsonKey(name: 'ID') final int? id,
    @JsonKey(name: 'MainIndex') final String? mainIndex,
    @JsonKey(name: 'MainGroup') final int? mainGroup,
  }) = _$LeadSaleActivityTypeImpl;

  factory _LeadSaleActivityType.fromJson(Map<String, dynamic> json) =
      _$LeadSaleActivityTypeImpl.fromJson;

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
  _$$LeadSaleActivityTypeImplCopyWith<_$LeadSaleActivityTypeImpl>
  get copyWith => throw _privateConstructorUsedError;
}

LeadSaleItem _$LeadSaleItemFromJson(Map<String, dynamic> json) {
  return _LeadSaleItem.fromJson(json);
}

/// @nodoc
mixin _$LeadSaleItem {
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
  $LeadSaleItemCopyWith<LeadSaleItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadSaleItemCopyWith<$Res> {
  factory $LeadSaleItemCopyWith(
    LeadSaleItem value,
    $Res Function(LeadSaleItem) then,
  ) = _$LeadSaleItemCopyWithImpl<$Res, LeadSaleItem>;
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
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
    @JsonKey(name: 'TotalMoneyPO') double? totalMoneyPo,
  });
}

/// @nodoc
class _$LeadSaleItemCopyWithImpl<$Res, $Val extends LeadSaleItem>
    implements $LeadSaleItemCopyWith<$Res> {
  _$LeadSaleItemCopyWithImpl(this._value, this._then);

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
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadSaleItemImplCopyWith<$Res>
    implements $LeadSaleItemCopyWith<$Res> {
  factory _$$LeadSaleItemImplCopyWith(
    _$LeadSaleItemImpl value,
    $Res Function(_$LeadSaleItemImpl) then,
  ) = __$$LeadSaleItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
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
    @JsonKey(name: 'TotalMoneyPO') double? totalMoneyPo,
  });
}

/// @nodoc
class __$$LeadSaleItemImplCopyWithImpl<$Res>
    extends _$LeadSaleItemCopyWithImpl<$Res, _$LeadSaleItemImpl>
    implements _$$LeadSaleItemImplCopyWith<$Res> {
  __$$LeadSaleItemImplCopyWithImpl(
    _$LeadSaleItemImpl _value,
    $Res Function(_$LeadSaleItemImpl) _then,
  ) : super(_value, _then);

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
    return _then(
      _$LeadSaleItemImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadSaleItemImpl implements _LeadSaleItem {
  const _$LeadSaleItemImpl({
    @JsonKey(name: 'ID') this.id,
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
    @JsonKey(name: 'TotalMoneyPO') this.totalMoneyPo,
  });

  factory _$LeadSaleItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadSaleItemImplFromJson(json);

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
    return 'LeadSaleItem(id: $id, leadCode: $leadCode, leadType: $leadType, leadTypeName: $leadTypeName, leadSourceId: $leadSourceId, leadSourceName: $leadSourceName, campaignName: $campaignName, collectedDate: $collectedDate, companyName: $companyName, taxCode: $taxCode, customerIndustriesId: $customerIndustriesId, industryName: $industryName, businessFieldId: $businessFieldId, businessFieldName: $businessFieldName, website: $website, province: $province, address: $address, contactName: $contactName, contactPosition: $contactPosition, contactPhone: $contactPhone, contactEmail: $contactEmail, needDescription: $needDescription, productInterest: $productInterest, estimatedValue: $estimatedValue, rating: $rating, ratingName: $ratingName, stage: $stage, stageName: $stageName, marketingEmployeeId: $marketingEmployeeId, marketingEmployeeName: $marketingEmployeeName, qualifiedDate: $qualifiedDate, handoverDate: $handoverDate, handoverBy: $handoverBy, handoverLeaderId: $handoverLeaderId, handoverLeaderName: $handoverLeaderName, saleEmployeeId: $saleEmployeeId, saleEmployeeName: $saleEmployeeName, assignedDate: $assignedDate, assignedBy: $assignedBy, assignedByName: $assignedByName, nextFollowUpDate: $nextFollowUpDate, isOverdue: $isOverdue, closedDate: $closedDate, customerId: $customerId, customerName: $customerName, customerCode: $customerCode, lostReason: $lostReason, returnReason: $returnReason, note: $note, activityCount: $activityCount, lastActivityDate: $lastActivityDate, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate, poTypeName: $poTypeName, customerType: $customerType, adminSaleName: $adminSaleName, totalMoneyPo: $totalMoneyPo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadSaleItemImpl &&
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
            (identical(other.lastActivityDate, lastActivityDate) ||
                other.lastActivityDate == lastActivityDate) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.poTypeName, poTypeName) ||
                other.poTypeName == poTypeName) &&
            (identical(other.customerType, customerType) ||
                other.customerType == customerType) &&
            (identical(other.adminSaleName, adminSaleName) ||
                other.adminSaleName == adminSaleName) &&
            (identical(other.totalMoneyPo, totalMoneyPo) ||
                other.totalMoneyPo == totalMoneyPo));
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
    totalMoneyPo,
  ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadSaleItemImplCopyWith<_$LeadSaleItemImpl> get copyWith =>
      __$$LeadSaleItemImplCopyWithImpl<_$LeadSaleItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadSaleItemImplToJson(this);
  }
}

abstract class _LeadSaleItem implements LeadSaleItem {
  const factory _LeadSaleItem({
    @JsonKey(name: 'ID') final int? id,
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
    @JsonKey(name: 'MarketingEmployeeName') final String? marketingEmployeeName,
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
    @JsonKey(name: 'TotalMoneyPO') final double? totalMoneyPo,
  }) = _$LeadSaleItemImpl;

  factory _LeadSaleItem.fromJson(Map<String, dynamic> json) =
      _$LeadSaleItemImpl.fromJson;

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
  _$$LeadSaleItemImplCopyWith<_$LeadSaleItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadSaleDetail _$LeadSaleDetailFromJson(Map<String, dynamic> json) {
  return _LeadSaleDetail.fromJson(json);
}

/// @nodoc
mixin _$LeadSaleDetail {
  /// Thông tin phiếu lead.
  @JsonKey(name: 'lead')
  LeadSaleDetailLead? get lead => throw _privateConstructorUsedError;

  /// Danh sách hoạt động đã ghi nhận trên phiếu.
  @JsonKey(name: 'activities')
  List<LeadSaleActivity>? get activities => throw _privateConstructorUsedError;

  /// Lịch sử chuyển giai đoạn / phân công của phiếu.
  @JsonKey(name: 'logs')
  List<LeadSaleLog>? get logs => throw _privateConstructorUsedError;

  /// Các hành động người dùng hiện tại được phép thực hiện.
  @JsonKey(name: 'actions')
  LeadSaleActions? get actions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadSaleDetailCopyWith<LeadSaleDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadSaleDetailCopyWith<$Res> {
  factory $LeadSaleDetailCopyWith(
    LeadSaleDetail value,
    $Res Function(LeadSaleDetail) then,
  ) = _$LeadSaleDetailCopyWithImpl<$Res, LeadSaleDetail>;
  @useResult
  $Res call({
    @JsonKey(name: 'lead') LeadSaleDetailLead? lead,
    @JsonKey(name: 'activities') List<LeadSaleActivity>? activities,
    @JsonKey(name: 'logs') List<LeadSaleLog>? logs,
    @JsonKey(name: 'actions') LeadSaleActions? actions,
  });

  $LeadSaleDetailLeadCopyWith<$Res>? get lead;
  $LeadSaleActionsCopyWith<$Res>? get actions;
}

/// @nodoc
class _$LeadSaleDetailCopyWithImpl<$Res, $Val extends LeadSaleDetail>
    implements $LeadSaleDetailCopyWith<$Res> {
  _$LeadSaleDetailCopyWithImpl(this._value, this._then);

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
    return _then(
      _value.copyWith(
            lead: freezed == lead
                ? _value.lead
                : lead // ignore: cast_nullable_to_non_nullable
                      as LeadSaleDetailLead?,
            activities: freezed == activities
                ? _value.activities
                : activities // ignore: cast_nullable_to_non_nullable
                      as List<LeadSaleActivity>?,
            logs: freezed == logs
                ? _value.logs
                : logs // ignore: cast_nullable_to_non_nullable
                      as List<LeadSaleLog>?,
            actions: freezed == actions
                ? _value.actions
                : actions // ignore: cast_nullable_to_non_nullable
                      as LeadSaleActions?,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $LeadSaleDetailLeadCopyWith<$Res>? get lead {
    if (_value.lead == null) {
      return null;
    }

    return $LeadSaleDetailLeadCopyWith<$Res>(_value.lead!, (value) {
      return _then(_value.copyWith(lead: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LeadSaleActionsCopyWith<$Res>? get actions {
    if (_value.actions == null) {
      return null;
    }

    return $LeadSaleActionsCopyWith<$Res>(_value.actions!, (value) {
      return _then(_value.copyWith(actions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LeadSaleDetailImplCopyWith<$Res>
    implements $LeadSaleDetailCopyWith<$Res> {
  factory _$$LeadSaleDetailImplCopyWith(
    _$LeadSaleDetailImpl value,
    $Res Function(_$LeadSaleDetailImpl) then,
  ) = __$$LeadSaleDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'lead') LeadSaleDetailLead? lead,
    @JsonKey(name: 'activities') List<LeadSaleActivity>? activities,
    @JsonKey(name: 'logs') List<LeadSaleLog>? logs,
    @JsonKey(name: 'actions') LeadSaleActions? actions,
  });

  @override
  $LeadSaleDetailLeadCopyWith<$Res>? get lead;
  @override
  $LeadSaleActionsCopyWith<$Res>? get actions;
}

/// @nodoc
class __$$LeadSaleDetailImplCopyWithImpl<$Res>
    extends _$LeadSaleDetailCopyWithImpl<$Res, _$LeadSaleDetailImpl>
    implements _$$LeadSaleDetailImplCopyWith<$Res> {
  __$$LeadSaleDetailImplCopyWithImpl(
    _$LeadSaleDetailImpl _value,
    $Res Function(_$LeadSaleDetailImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lead = freezed,
    Object? activities = freezed,
    Object? logs = freezed,
    Object? actions = freezed,
  }) {
    return _then(
      _$LeadSaleDetailImpl(
        lead: freezed == lead
            ? _value.lead
            : lead // ignore: cast_nullable_to_non_nullable
                  as LeadSaleDetailLead?,
        activities: freezed == activities
            ? _value._activities
            : activities // ignore: cast_nullable_to_non_nullable
                  as List<LeadSaleActivity>?,
        logs: freezed == logs
            ? _value._logs
            : logs // ignore: cast_nullable_to_non_nullable
                  as List<LeadSaleLog>?,
        actions: freezed == actions
            ? _value.actions
            : actions // ignore: cast_nullable_to_non_nullable
                  as LeadSaleActions?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadSaleDetailImpl implements _LeadSaleDetail {
  const _$LeadSaleDetailImpl({
    @JsonKey(name: 'lead') this.lead,
    @JsonKey(name: 'activities') final List<LeadSaleActivity>? activities,
    @JsonKey(name: 'logs') final List<LeadSaleLog>? logs,
    @JsonKey(name: 'actions') this.actions,
  }) : _activities = activities,
       _logs = logs;

  factory _$LeadSaleDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadSaleDetailImplFromJson(json);

  /// Thông tin phiếu lead.
  @override
  @JsonKey(name: 'lead')
  final LeadSaleDetailLead? lead;

  /// Danh sách hoạt động đã ghi nhận trên phiếu.
  final List<LeadSaleActivity>? _activities;

  /// Danh sách hoạt động đã ghi nhận trên phiếu.
  @override
  @JsonKey(name: 'activities')
  List<LeadSaleActivity>? get activities {
    final value = _activities;
    if (value == null) return null;
    if (_activities is EqualUnmodifiableListView) return _activities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Lịch sử chuyển giai đoạn / phân công của phiếu.
  final List<LeadSaleLog>? _logs;

  /// Lịch sử chuyển giai đoạn / phân công của phiếu.
  @override
  @JsonKey(name: 'logs')
  List<LeadSaleLog>? get logs {
    final value = _logs;
    if (value == null) return null;
    if (_logs is EqualUnmodifiableListView) return _logs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Các hành động người dùng hiện tại được phép thực hiện.
  @override
  @JsonKey(name: 'actions')
  final LeadSaleActions? actions;

  @override
  String toString() {
    return 'LeadSaleDetail(lead: $lead, activities: $activities, logs: $logs, actions: $actions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadSaleDetailImpl &&
            (identical(other.lead, lead) || other.lead == lead) &&
            const DeepCollectionEquality().equals(
              other._activities,
              _activities,
            ) &&
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
    actions,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadSaleDetailImplCopyWith<_$LeadSaleDetailImpl> get copyWith =>
      __$$LeadSaleDetailImplCopyWithImpl<_$LeadSaleDetailImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadSaleDetailImplToJson(this);
  }
}

abstract class _LeadSaleDetail implements LeadSaleDetail {
  const factory _LeadSaleDetail({
    @JsonKey(name: 'lead') final LeadSaleDetailLead? lead,
    @JsonKey(name: 'activities') final List<LeadSaleActivity>? activities,
    @JsonKey(name: 'logs') final List<LeadSaleLog>? logs,
    @JsonKey(name: 'actions') final LeadSaleActions? actions,
  }) = _$LeadSaleDetailImpl;

  factory _LeadSaleDetail.fromJson(Map<String, dynamic> json) =
      _$LeadSaleDetailImpl.fromJson;

  @override
  /// Thông tin phiếu lead.
  @JsonKey(name: 'lead')
  LeadSaleDetailLead? get lead;
  @override
  /// Danh sách hoạt động đã ghi nhận trên phiếu.
  @JsonKey(name: 'activities')
  List<LeadSaleActivity>? get activities;
  @override
  /// Lịch sử chuyển giai đoạn / phân công của phiếu.
  @JsonKey(name: 'logs')
  List<LeadSaleLog>? get logs;
  @override
  /// Các hành động người dùng hiện tại được phép thực hiện.
  @JsonKey(name: 'actions')
  LeadSaleActions? get actions;
  @override
  @JsonKey(ignore: true)
  _$$LeadSaleDetailImplCopyWith<_$LeadSaleDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadSaleDetailLead _$LeadSaleDetailLeadFromJson(Map<String, dynamic> json) {
  return _LeadSaleDetailLead.fromJson(json);
}

/// @nodoc
mixin _$LeadSaleDetailLead {
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
  $LeadSaleDetailLeadCopyWith<LeadSaleDetailLead> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadSaleDetailLeadCopyWith<$Res> {
  factory $LeadSaleDetailLeadCopyWith(
    LeadSaleDetailLead value,
    $Res Function(LeadSaleDetailLead) then,
  ) = _$LeadSaleDetailLeadCopyWithImpl<$Res, LeadSaleDetailLead>;
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
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
    @JsonKey(name: 'UpdatedDate') String? updatedDate,
  });
}

/// @nodoc
class _$LeadSaleDetailLeadCopyWithImpl<$Res, $Val extends LeadSaleDetailLead>
    implements $LeadSaleDetailLeadCopyWith<$Res> {
  _$LeadSaleDetailLeadCopyWithImpl(this._value, this._then);

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
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadSaleDetailLeadImplCopyWith<$Res>
    implements $LeadSaleDetailLeadCopyWith<$Res> {
  factory _$$LeadSaleDetailLeadImplCopyWith(
    _$LeadSaleDetailLeadImpl value,
    $Res Function(_$LeadSaleDetailLeadImpl) then,
  ) = __$$LeadSaleDetailLeadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
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
    @JsonKey(name: 'UpdatedDate') String? updatedDate,
  });
}

/// @nodoc
class __$$LeadSaleDetailLeadImplCopyWithImpl<$Res>
    extends _$LeadSaleDetailLeadCopyWithImpl<$Res, _$LeadSaleDetailLeadImpl>
    implements _$$LeadSaleDetailLeadImplCopyWith<$Res> {
  __$$LeadSaleDetailLeadImplCopyWithImpl(
    _$LeadSaleDetailLeadImpl _value,
    $Res Function(_$LeadSaleDetailLeadImpl) _then,
  ) : super(_value, _then);

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
    return _then(
      _$LeadSaleDetailLeadImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadSaleDetailLeadImpl implements _LeadSaleDetailLead {
  const _$LeadSaleDetailLeadImpl({
    @JsonKey(name: 'ID') this.id,
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
    @JsonKey(name: 'UpdatedDate') this.updatedDate,
  });

  factory _$LeadSaleDetailLeadImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadSaleDetailLeadImplFromJson(json);

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
    return 'LeadSaleDetailLead(id: $id, leadCode: $leadCode, leadType: $leadType, customerId: $customerId, customerTeam: $customerTeam, customerPart: $customerPart, customerPosition: $customerPosition, customerType: $customerType, isDeleted: $isDeleted, contactName: $contactName, contactPosition: $contactPosition, contactPhone: $contactPhone, contactEmail: $contactEmail, contactAppointmentDate: $contactAppointmentDate, createdDate: $createdDate, collectedDate: $collectedDate, leadSourceId: $leadSourceId, campaignName: $campaignName, rating: $rating, estimatedValue: $estimatedValue, productInterest: $productInterest, needDescription: $needDescription, note: $note, website: $website, saleEmployeeId: $saleEmployeeId, marketingEmployeeId: $marketingEmployeeId, stage: $stage, handoverLeaderId: $handoverLeaderId, adminSaleId: $adminSaleId, handoverDate: $handoverDate, handoverBy: $handoverBy, qualifiedDate: $qualifiedDate, lostReason: $lostReason, closedDate: $closedDate, returnReason: $returnReason, assignedDate: $assignedDate, assignedBy: $assignedBy, nextFollowUpDate: $nextFollowUpDate, poReason: $poReason, poDate: $poDate, poTypeId: $poTypeId, createdBy: $createdBy, updatedBy: $updatedBy, updatedDate: $updatedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadSaleDetailLeadImpl &&
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
    updatedDate,
  ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadSaleDetailLeadImplCopyWith<_$LeadSaleDetailLeadImpl> get copyWith =>
      __$$LeadSaleDetailLeadImplCopyWithImpl<_$LeadSaleDetailLeadImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadSaleDetailLeadImplToJson(this);
  }
}

abstract class _LeadSaleDetailLead implements LeadSaleDetailLead {
  const factory _LeadSaleDetailLead({
    @JsonKey(name: 'ID') final int? id,
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
    @JsonKey(name: 'UpdatedDate') final String? updatedDate,
  }) = _$LeadSaleDetailLeadImpl;

  factory _LeadSaleDetailLead.fromJson(Map<String, dynamic> json) =
      _$LeadSaleDetailLeadImpl.fromJson;

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
  _$$LeadSaleDetailLeadImplCopyWith<_$LeadSaleDetailLeadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadSaleActivity _$LeadSaleActivityFromJson(Map<String, dynamic> json) {
  return _LeadSaleActivity.fromJson(json);
}

/// @nodoc
mixin _$LeadSaleActivity {
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
  $LeadSaleActivityCopyWith<LeadSaleActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadSaleActivityCopyWith<$Res> {
  factory $LeadSaleActivityCopyWith(
    LeadSaleActivity value,
    $Res Function(LeadSaleActivity) then,
  ) = _$LeadSaleActivityCopyWithImpl<$Res, LeadSaleActivity>;
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
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
    @JsonKey(name: 'CreatedDate') String? createdDate,
  });
}

/// @nodoc
class _$LeadSaleActivityCopyWithImpl<$Res, $Val extends LeadSaleActivity>
    implements $LeadSaleActivityCopyWith<$Res> {
  _$LeadSaleActivityCopyWithImpl(this._value, this._then);

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
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadSaleActivityImplCopyWith<$Res>
    implements $LeadSaleActivityCopyWith<$Res> {
  factory _$$LeadSaleActivityImplCopyWith(
    _$LeadSaleActivityImpl value,
    $Res Function(_$LeadSaleActivityImpl) then,
  ) = __$$LeadSaleActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
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
    @JsonKey(name: 'CreatedDate') String? createdDate,
  });
}

/// @nodoc
class __$$LeadSaleActivityImplCopyWithImpl<$Res>
    extends _$LeadSaleActivityCopyWithImpl<$Res, _$LeadSaleActivityImpl>
    implements _$$LeadSaleActivityImplCopyWith<$Res> {
  __$$LeadSaleActivityImplCopyWithImpl(
    _$LeadSaleActivityImpl _value,
    $Res Function(_$LeadSaleActivityImpl) _then,
  ) : super(_value, _then);

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
    return _then(
      _$LeadSaleActivityImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadSaleActivityImpl implements _LeadSaleActivity {
  const _$LeadSaleActivityImpl({
    @JsonKey(name: 'ID') this.id,
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
    @JsonKey(name: 'CreatedDate') this.createdDate,
  });

  factory _$LeadSaleActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadSaleActivityImplFromJson(json);

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
    return 'LeadSaleActivity(id: $id, leadId: $leadId, activityType: $activityType, activityTypeName: $activityTypeName, activityDate: $activityDate, content: $content, result: $result, nextAction: $nextAction, nextActionDate: $nextActionDate, employeeId: $employeeId, employeeName: $employeeName, createdBy: $createdBy, createdDate: $createdDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadSaleActivityImpl &&
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
    createdDate,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadSaleActivityImplCopyWith<_$LeadSaleActivityImpl> get copyWith =>
      __$$LeadSaleActivityImplCopyWithImpl<_$LeadSaleActivityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadSaleActivityImplToJson(this);
  }
}

abstract class _LeadSaleActivity implements LeadSaleActivity {
  const factory _LeadSaleActivity({
    @JsonKey(name: 'ID') final int? id,
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
    @JsonKey(name: 'CreatedDate') final String? createdDate,
  }) = _$LeadSaleActivityImpl;

  factory _LeadSaleActivity.fromJson(Map<String, dynamic> json) =
      _$LeadSaleActivityImpl.fromJson;

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
  _$$LeadSaleActivityImplCopyWith<_$LeadSaleActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadSaleLog _$LeadSaleLogFromJson(Map<String, dynamic> json) {
  return _LeadSaleLog.fromJson(json);
}

/// @nodoc
mixin _$LeadSaleLog {
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
  $LeadSaleLogCopyWith<LeadSaleLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadSaleLogCopyWith<$Res> {
  factory $LeadSaleLogCopyWith(
    LeadSaleLog value,
    $Res Function(LeadSaleLog) then,
  ) = _$LeadSaleLogCopyWithImpl<$Res, LeadSaleLog>;
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
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
    @JsonKey(name: 'CreatedDate') String? createdDate,
  });
}

/// @nodoc
class _$LeadSaleLogCopyWithImpl<$Res, $Val extends LeadSaleLog>
    implements $LeadSaleLogCopyWith<$Res> {
  _$LeadSaleLogCopyWithImpl(this._value, this._then);

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
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadSaleLogImplCopyWith<$Res>
    implements $LeadSaleLogCopyWith<$Res> {
  factory _$$LeadSaleLogImplCopyWith(
    _$LeadSaleLogImpl value,
    $Res Function(_$LeadSaleLogImpl) then,
  ) = __$$LeadSaleLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
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
    @JsonKey(name: 'CreatedDate') String? createdDate,
  });
}

/// @nodoc
class __$$LeadSaleLogImplCopyWithImpl<$Res>
    extends _$LeadSaleLogCopyWithImpl<$Res, _$LeadSaleLogImpl>
    implements _$$LeadSaleLogImplCopyWith<$Res> {
  __$$LeadSaleLogImplCopyWithImpl(
    _$LeadSaleLogImpl _value,
    $Res Function(_$LeadSaleLogImpl) _then,
  ) : super(_value, _then);

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
    return _then(
      _$LeadSaleLogImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadSaleLogImpl implements _LeadSaleLog {
  const _$LeadSaleLogImpl({
    @JsonKey(name: 'ID') this.id,
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
    @JsonKey(name: 'CreatedDate') this.createdDate,
  });

  factory _$LeadSaleLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadSaleLogImplFromJson(json);

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
    return 'LeadSaleLog(id: $id, leadId: $leadId, typeLog: $typeLog, typeLogName: $typeLogName, fromStage: $fromStage, toStage: $toStage, fromEmployeeId: $fromEmployeeId, fromEmployeeName: $fromEmployeeName, toEmployeeId: $toEmployeeId, toEmployeeName: $toEmployeeName, contentLog: $contentLog, createdBy: $createdBy, createdDate: $createdDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadSaleLogImpl &&
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
    createdDate,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadSaleLogImplCopyWith<_$LeadSaleLogImpl> get copyWith =>
      __$$LeadSaleLogImplCopyWithImpl<_$LeadSaleLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadSaleLogImplToJson(this);
  }
}

abstract class _LeadSaleLog implements LeadSaleLog {
  const factory _LeadSaleLog({
    @JsonKey(name: 'ID') final int? id,
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
    @JsonKey(name: 'CreatedDate') final String? createdDate,
  }) = _$LeadSaleLogImpl;

  factory _LeadSaleLog.fromJson(Map<String, dynamic> json) =
      _$LeadSaleLogImpl.fromJson;

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
  _$$LeadSaleLogImplCopyWith<_$LeadSaleLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadSaleFile _$LeadSaleFileFromJson(Map<String, dynamic> json) {
  return _LeadSaleFile.fromJson(json);
}

/// @nodoc
mixin _$LeadSaleFile {
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
  $LeadSaleFileCopyWith<LeadSaleFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadSaleFileCopyWith<$Res> {
  factory $LeadSaleFileCopyWith(
    LeadSaleFile value,
    $Res Function(LeadSaleFile) then,
  ) = _$LeadSaleFileCopyWithImpl<$Res, LeadSaleFile>;
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'FileName') String? fileName,
    @JsonKey(name: 'ServerPath') String? serverPath,
    @JsonKey(name: 'OriginPath') String? originPath,
    @JsonKey(name: 'CustomerContactID') int? customerContactId,
    @JsonKey(name: 'FileType') int? fileType,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') String? createdDate,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  });
}

/// @nodoc
class _$LeadSaleFileCopyWithImpl<$Res, $Val extends LeadSaleFile>
    implements $LeadSaleFileCopyWith<$Res> {
  _$LeadSaleFileCopyWithImpl(this._value, this._then);

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
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadSaleFileImplCopyWith<$Res>
    implements $LeadSaleFileCopyWith<$Res> {
  factory _$$LeadSaleFileImplCopyWith(
    _$LeadSaleFileImpl value,
    $Res Function(_$LeadSaleFileImpl) then,
  ) = __$$LeadSaleFileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'FileName') String? fileName,
    @JsonKey(name: 'ServerPath') String? serverPath,
    @JsonKey(name: 'OriginPath') String? originPath,
    @JsonKey(name: 'CustomerContactID') int? customerContactId,
    @JsonKey(name: 'FileType') int? fileType,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') String? createdDate,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  });
}

/// @nodoc
class __$$LeadSaleFileImplCopyWithImpl<$Res>
    extends _$LeadSaleFileCopyWithImpl<$Res, _$LeadSaleFileImpl>
    implements _$$LeadSaleFileImplCopyWith<$Res> {
  __$$LeadSaleFileImplCopyWithImpl(
    _$LeadSaleFileImpl _value,
    $Res Function(_$LeadSaleFileImpl) _then,
  ) : super(_value, _then);

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
    return _then(
      _$LeadSaleFileImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadSaleFileImpl implements _LeadSaleFile {
  const _$LeadSaleFileImpl({
    @JsonKey(name: 'ID') this.id,
    @JsonKey(name: 'FileName') this.fileName,
    @JsonKey(name: 'ServerPath') this.serverPath,
    @JsonKey(name: 'OriginPath') this.originPath,
    @JsonKey(name: 'CustomerContactID') this.customerContactId,
    @JsonKey(name: 'FileType') this.fileType,
    @JsonKey(name: 'CreatedBy') this.createdBy,
    @JsonKey(name: 'CreatedDate') this.createdDate,
    @JsonKey(name: 'IsDeleted') this.isDeleted,
  });

  factory _$LeadSaleFileImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadSaleFileImplFromJson(json);

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
    return 'LeadSaleFile(id: $id, fileName: $fileName, serverPath: $serverPath, originPath: $originPath, customerContactId: $customerContactId, fileType: $fileType, createdBy: $createdBy, createdDate: $createdDate, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadSaleFileImpl &&
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
    isDeleted,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadSaleFileImplCopyWith<_$LeadSaleFileImpl> get copyWith =>
      __$$LeadSaleFileImplCopyWithImpl<_$LeadSaleFileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadSaleFileImplToJson(this);
  }
}

abstract class _LeadSaleFile implements LeadSaleFile {
  const factory _LeadSaleFile({
    @JsonKey(name: 'ID') final int? id,
    @JsonKey(name: 'FileName') final String? fileName,
    @JsonKey(name: 'ServerPath') final String? serverPath,
    @JsonKey(name: 'OriginPath') final String? originPath,
    @JsonKey(name: 'CustomerContactID') final int? customerContactId,
    @JsonKey(name: 'FileType') final int? fileType,
    @JsonKey(name: 'CreatedBy') final String? createdBy,
    @JsonKey(name: 'CreatedDate') final String? createdDate,
    @JsonKey(name: 'IsDeleted') final bool? isDeleted,
  }) = _$LeadSaleFileImpl;

  factory _LeadSaleFile.fromJson(Map<String, dynamic> json) =
      _$LeadSaleFileImpl.fromJson;

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
  _$$LeadSaleFileImplCopyWith<_$LeadSaleFileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadSaleActions _$LeadSaleActionsFromJson(Map<String, dynamic> json) {
  return _LeadSaleActions.fromJson(json);
}

/// @nodoc
mixin _$LeadSaleActions {
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
  $LeadSaleActionsCopyWith<LeadSaleActions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadSaleActionsCopyWith<$Res> {
  factory $LeadSaleActionsCopyWith(
    LeadSaleActions value,
    $Res Function(LeadSaleActions) then,
  ) = _$LeadSaleActionsCopyWithImpl<$Res, LeadSaleActions>;
  @useResult
  $Res call({
    @JsonKey(name: 'CanView') bool? canView,
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
    @JsonKey(name: 'CanPO') bool? canPo,
  });
}

/// @nodoc
class _$LeadSaleActionsCopyWithImpl<$Res, $Val extends LeadSaleActions>
    implements $LeadSaleActionsCopyWith<$Res> {
  _$LeadSaleActionsCopyWithImpl(this._value, this._then);

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
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadSaleActionsImplCopyWith<$Res>
    implements $LeadSaleActionsCopyWith<$Res> {
  factory _$$LeadSaleActionsImplCopyWith(
    _$LeadSaleActionsImpl value,
    $Res Function(_$LeadSaleActionsImpl) then,
  ) = __$$LeadSaleActionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'CanView') bool? canView,
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
    @JsonKey(name: 'CanPO') bool? canPo,
  });
}

/// @nodoc
class __$$LeadSaleActionsImplCopyWithImpl<$Res>
    extends _$LeadSaleActionsCopyWithImpl<$Res, _$LeadSaleActionsImpl>
    implements _$$LeadSaleActionsImplCopyWith<$Res> {
  __$$LeadSaleActionsImplCopyWithImpl(
    _$LeadSaleActionsImpl _value,
    $Res Function(_$LeadSaleActionsImpl) _then,
  ) : super(_value, _then);

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
    return _then(
      _$LeadSaleActionsImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadSaleActionsImpl implements _LeadSaleActions {
  const _$LeadSaleActionsImpl({
    @JsonKey(name: 'CanView') this.canView,
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
    @JsonKey(name: 'CanPO') this.canPo,
  });

  factory _$LeadSaleActionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadSaleActionsImplFromJson(json);

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
    return 'LeadSaleActions(canView: $canView, canEdit: $canEdit, canQualify: $canQualify, canDisqualify: $canDisqualify, canHandover: $canHandover, canAssign: $canAssign, canReturn: $canReturn, canClose: $canClose, canLinkCustomer: $canLinkCustomer, canReopen: $canReopen, canAddActivity: $canAddActivity, canDelete: $canDelete, canPo: $canPo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadSaleActionsImpl &&
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
    canPo,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadSaleActionsImplCopyWith<_$LeadSaleActionsImpl> get copyWith =>
      __$$LeadSaleActionsImplCopyWithImpl<_$LeadSaleActionsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadSaleActionsImplToJson(this);
  }
}

abstract class _LeadSaleActions implements LeadSaleActions {
  const factory _LeadSaleActions({
    @JsonKey(name: 'CanView') final bool? canView,
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
    @JsonKey(name: 'CanPO') final bool? canPo,
  }) = _$LeadSaleActionsImpl;

  factory _LeadSaleActions.fromJson(Map<String, dynamic> json) =
      _$LeadSaleActionsImpl.fromJson;

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
  _$$LeadSaleActionsImplCopyWith<_$LeadSaleActionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
