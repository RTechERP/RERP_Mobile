// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'idea_registration_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IdeaCatalogItem _$IdeaCatalogItemFromJson(Map<String, dynamic> json) {
  return _IdeaCatalogItem.fromJson(json);
}

/// @nodoc
mixin _$IdeaCatalogItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdeaCatalogItemCopyWith<IdeaCatalogItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdeaCatalogItemCopyWith<$Res> {
  factory $IdeaCatalogItemCopyWith(
          IdeaCatalogItem value, $Res Function(IdeaCatalogItem) then) =
      _$IdeaCatalogItemCopyWithImpl<$Res, IdeaCatalogItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id, @JsonKey(name: 'Name') String? name});
}

/// @nodoc
class _$IdeaCatalogItemCopyWithImpl<$Res, $Val extends IdeaCatalogItem>
    implements $IdeaCatalogItemCopyWith<$Res> {
  _$IdeaCatalogItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IdeaCatalogItemImplCopyWith<$Res>
    implements $IdeaCatalogItemCopyWith<$Res> {
  factory _$$IdeaCatalogItemImplCopyWith(_$IdeaCatalogItemImpl value,
          $Res Function(_$IdeaCatalogItemImpl) then) =
      __$$IdeaCatalogItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id, @JsonKey(name: 'Name') String? name});
}

/// @nodoc
class __$$IdeaCatalogItemImplCopyWithImpl<$Res>
    extends _$IdeaCatalogItemCopyWithImpl<$Res, _$IdeaCatalogItemImpl>
    implements _$$IdeaCatalogItemImplCopyWith<$Res> {
  __$$IdeaCatalogItemImplCopyWithImpl(
      _$IdeaCatalogItemImpl _value, $Res Function(_$IdeaCatalogItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$IdeaCatalogItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IdeaCatalogItemImpl implements _IdeaCatalogItem {
  const _$IdeaCatalogItemImpl(
      {@JsonKey(name: 'ID') this.id, @JsonKey(name: 'Name') this.name});

  factory _$IdeaCatalogItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdeaCatalogItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'Name')
  final String? name;

  @override
  String toString() {
    return 'IdeaCatalogItem(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdeaCatalogItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdeaCatalogItemImplCopyWith<_$IdeaCatalogItemImpl> get copyWith =>
      __$$IdeaCatalogItemImplCopyWithImpl<_$IdeaCatalogItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdeaCatalogItemImplToJson(
      this,
    );
  }
}

abstract class _IdeaCatalogItem implements IdeaCatalogItem {
  const factory _IdeaCatalogItem(
      {@JsonKey(name: 'ID') final int? id,
      @JsonKey(name: 'Name') final String? name}) = _$IdeaCatalogItemImpl;

  factory _IdeaCatalogItem.fromJson(Map<String, dynamic> json) =
      _$IdeaCatalogItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'Name')
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$IdeaCatalogItemImplCopyWith<_$IdeaCatalogItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IdeaItem _$IdeaItemFromJson(Map<String, dynamic> json) {
  return _IdeaItem.fromJson(json);
}

/// @nodoc
mixin _$IdeaItem {
  @JsonKey(name: 'TotalPage')
  int? get totalPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateRegister')
  DateTime? get dateRegister => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedTBP')
  bool? get isApprovedTBP => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateApprovedTBP')
  DateTime? get dateApprovedTBP => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedTBPID')
  int? get approvedTBPID => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApproved')
  bool? get isApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateApproved')
  DateTime? get dateApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedID')
  int? get approvedID => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'RegisterIdeaTypeID')
  int? get registerIdeaTypeID => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentOrganizationID')
  int? get departmentOrganizationID => throw _privateConstructorUsedError;
  @JsonKey(name: 'CourseID')
  int? get courseID => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeName')
  String? get employeeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'TBPName')
  String? get tbpName => throw _privateConstructorUsedError;
  @JsonKey(name: 'BGDName')
  String? get bgdName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentScore')
  double? get departmentScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'TBPScore')
  double? get tbpScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'BGDScore')
  double? get bgdScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'AvgScore')
  double? get avgScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'RowNum')
  int? get rowNum => throw _privateConstructorUsedError;
  @JsonKey(name: 'BGDScoreNew')
  String? get bgdScoreNew => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentOrganization')
  String? get departmentOrganization => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateStart')
  DateTime? get dateStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateEnd')
  DateTime? get dateEnd => throw _privateConstructorUsedError;
  @JsonKey(name: 'Description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'STT')
  int? get stt => throw _privateConstructorUsedError;
  @JsonKey(name: 'RegisterTypeName')
  String? get registerTypeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'RegisterTypeCode')
  String? get registerTypeCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'RegisterTypeDepartmentName')
  String? get registerTypeDepartmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentName')
  String? get departmentName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdeaItemCopyWith<IdeaItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdeaItemCopyWith<$Res> {
  factory $IdeaItemCopyWith(IdeaItem value, $Res Function(IdeaItem) then) =
      _$IdeaItemCopyWithImpl<$Res, IdeaItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TotalPage') int? totalPage,
      @JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'DateRegister') DateTime? dateRegister,
      @JsonKey(name: 'IsApprovedTBP') bool? isApprovedTBP,
      @JsonKey(name: 'DateApprovedTBP') DateTime? dateApprovedTBP,
      @JsonKey(name: 'ApprovedTBPID') int? approvedTBPID,
      @JsonKey(name: 'IsApproved') bool? isApproved,
      @JsonKey(name: 'DateApproved') DateTime? dateApproved,
      @JsonKey(name: 'ApprovedID') int? approvedID,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'RegisterIdeaTypeID') int? registerIdeaTypeID,
      @JsonKey(name: 'DepartmentOrganizationID') int? departmentOrganizationID,
      @JsonKey(name: 'CourseID') int? courseID,
      @JsonKey(name: 'EmployeeName') String? employeeName,
      @JsonKey(name: 'TBPName') String? tbpName,
      @JsonKey(name: 'BGDName') String? bgdName,
      @JsonKey(name: 'DepartmentScore') double? departmentScore,
      @JsonKey(name: 'TBPScore') double? tbpScore,
      @JsonKey(name: 'BGDScore') double? bgdScore,
      @JsonKey(name: 'AvgScore') double? avgScore,
      @JsonKey(name: 'RowNum') int? rowNum,
      @JsonKey(name: 'BGDScoreNew') String? bgdScoreNew,
      @JsonKey(name: 'DepartmentOrganization') String? departmentOrganization,
      @JsonKey(name: 'DateStart') DateTime? dateStart,
      @JsonKey(name: 'DateEnd') DateTime? dateEnd,
      @JsonKey(name: 'Description') String? description,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'RegisterTypeName') String? registerTypeName,
      @JsonKey(name: 'RegisterTypeCode') String? registerTypeCode,
      @JsonKey(name: 'RegisterTypeDepartmentName')
      String? registerTypeDepartmentName,
      @JsonKey(name: 'DepartmentName') String? departmentName});
}

/// @nodoc
class _$IdeaItemCopyWithImpl<$Res, $Val extends IdeaItem>
    implements $IdeaItemCopyWith<$Res> {
  _$IdeaItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPage = freezed,
    Object? id = freezed,
    Object? employeeId = freezed,
    Object? dateRegister = freezed,
    Object? isApprovedTBP = freezed,
    Object? dateApprovedTBP = freezed,
    Object? approvedTBPID = freezed,
    Object? isApproved = freezed,
    Object? dateApproved = freezed,
    Object? approvedID = freezed,
    Object? note = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? isDeleted = freezed,
    Object? registerIdeaTypeID = freezed,
    Object? departmentOrganizationID = freezed,
    Object? courseID = freezed,
    Object? employeeName = freezed,
    Object? tbpName = freezed,
    Object? bgdName = freezed,
    Object? departmentScore = freezed,
    Object? tbpScore = freezed,
    Object? bgdScore = freezed,
    Object? avgScore = freezed,
    Object? rowNum = freezed,
    Object? bgdScoreNew = freezed,
    Object? departmentOrganization = freezed,
    Object? dateStart = freezed,
    Object? dateEnd = freezed,
    Object? description = freezed,
    Object? stt = freezed,
    Object? registerTypeName = freezed,
    Object? registerTypeCode = freezed,
    Object? registerTypeDepartmentName = freezed,
    Object? departmentName = freezed,
  }) {
    return _then(_value.copyWith(
      totalPage: freezed == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      dateRegister: freezed == dateRegister
          ? _value.dateRegister
          : dateRegister // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isApprovedTBP: freezed == isApprovedTBP
          ? _value.isApprovedTBP
          : isApprovedTBP // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateApprovedTBP: freezed == dateApprovedTBP
          ? _value.dateApprovedTBP
          : dateApprovedTBP // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      approvedTBPID: freezed == approvedTBPID
          ? _value.approvedTBPID
          : approvedTBPID // ignore: cast_nullable_to_non_nullable
              as int?,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateApproved: freezed == dateApproved
          ? _value.dateApproved
          : dateApproved // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      approvedID: freezed == approvedID
          ? _value.approvedID
          : approvedID // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      registerIdeaTypeID: freezed == registerIdeaTypeID
          ? _value.registerIdeaTypeID
          : registerIdeaTypeID // ignore: cast_nullable_to_non_nullable
              as int?,
      departmentOrganizationID: freezed == departmentOrganizationID
          ? _value.departmentOrganizationID
          : departmentOrganizationID // ignore: cast_nullable_to_non_nullable
              as int?,
      courseID: freezed == courseID
          ? _value.courseID
          : courseID // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      tbpName: freezed == tbpName
          ? _value.tbpName
          : tbpName // ignore: cast_nullable_to_non_nullable
              as String?,
      bgdName: freezed == bgdName
          ? _value.bgdName
          : bgdName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentScore: freezed == departmentScore
          ? _value.departmentScore
          : departmentScore // ignore: cast_nullable_to_non_nullable
              as double?,
      tbpScore: freezed == tbpScore
          ? _value.tbpScore
          : tbpScore // ignore: cast_nullable_to_non_nullable
              as double?,
      bgdScore: freezed == bgdScore
          ? _value.bgdScore
          : bgdScore // ignore: cast_nullable_to_non_nullable
              as double?,
      avgScore: freezed == avgScore
          ? _value.avgScore
          : avgScore // ignore: cast_nullable_to_non_nullable
              as double?,
      rowNum: freezed == rowNum
          ? _value.rowNum
          : rowNum // ignore: cast_nullable_to_non_nullable
              as int?,
      bgdScoreNew: freezed == bgdScoreNew
          ? _value.bgdScoreNew
          : bgdScoreNew // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentOrganization: freezed == departmentOrganization
          ? _value.departmentOrganization
          : departmentOrganization // ignore: cast_nullable_to_non_nullable
              as String?,
      dateStart: freezed == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateEnd: freezed == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
      registerTypeName: freezed == registerTypeName
          ? _value.registerTypeName
          : registerTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      registerTypeCode: freezed == registerTypeCode
          ? _value.registerTypeCode
          : registerTypeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      registerTypeDepartmentName: freezed == registerTypeDepartmentName
          ? _value.registerTypeDepartmentName
          : registerTypeDepartmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IdeaItemImplCopyWith<$Res>
    implements $IdeaItemCopyWith<$Res> {
  factory _$$IdeaItemImplCopyWith(
          _$IdeaItemImpl value, $Res Function(_$IdeaItemImpl) then) =
      __$$IdeaItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TotalPage') int? totalPage,
      @JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'DateRegister') DateTime? dateRegister,
      @JsonKey(name: 'IsApprovedTBP') bool? isApprovedTBP,
      @JsonKey(name: 'DateApprovedTBP') DateTime? dateApprovedTBP,
      @JsonKey(name: 'ApprovedTBPID') int? approvedTBPID,
      @JsonKey(name: 'IsApproved') bool? isApproved,
      @JsonKey(name: 'DateApproved') DateTime? dateApproved,
      @JsonKey(name: 'ApprovedID') int? approvedID,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'RegisterIdeaTypeID') int? registerIdeaTypeID,
      @JsonKey(name: 'DepartmentOrganizationID') int? departmentOrganizationID,
      @JsonKey(name: 'CourseID') int? courseID,
      @JsonKey(name: 'EmployeeName') String? employeeName,
      @JsonKey(name: 'TBPName') String? tbpName,
      @JsonKey(name: 'BGDName') String? bgdName,
      @JsonKey(name: 'DepartmentScore') double? departmentScore,
      @JsonKey(name: 'TBPScore') double? tbpScore,
      @JsonKey(name: 'BGDScore') double? bgdScore,
      @JsonKey(name: 'AvgScore') double? avgScore,
      @JsonKey(name: 'RowNum') int? rowNum,
      @JsonKey(name: 'BGDScoreNew') String? bgdScoreNew,
      @JsonKey(name: 'DepartmentOrganization') String? departmentOrganization,
      @JsonKey(name: 'DateStart') DateTime? dateStart,
      @JsonKey(name: 'DateEnd') DateTime? dateEnd,
      @JsonKey(name: 'Description') String? description,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'RegisterTypeName') String? registerTypeName,
      @JsonKey(name: 'RegisterTypeCode') String? registerTypeCode,
      @JsonKey(name: 'RegisterTypeDepartmentName')
      String? registerTypeDepartmentName,
      @JsonKey(name: 'DepartmentName') String? departmentName});
}

/// @nodoc
class __$$IdeaItemImplCopyWithImpl<$Res>
    extends _$IdeaItemCopyWithImpl<$Res, _$IdeaItemImpl>
    implements _$$IdeaItemImplCopyWith<$Res> {
  __$$IdeaItemImplCopyWithImpl(
      _$IdeaItemImpl _value, $Res Function(_$IdeaItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPage = freezed,
    Object? id = freezed,
    Object? employeeId = freezed,
    Object? dateRegister = freezed,
    Object? isApprovedTBP = freezed,
    Object? dateApprovedTBP = freezed,
    Object? approvedTBPID = freezed,
    Object? isApproved = freezed,
    Object? dateApproved = freezed,
    Object? approvedID = freezed,
    Object? note = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? isDeleted = freezed,
    Object? registerIdeaTypeID = freezed,
    Object? departmentOrganizationID = freezed,
    Object? courseID = freezed,
    Object? employeeName = freezed,
    Object? tbpName = freezed,
    Object? bgdName = freezed,
    Object? departmentScore = freezed,
    Object? tbpScore = freezed,
    Object? bgdScore = freezed,
    Object? avgScore = freezed,
    Object? rowNum = freezed,
    Object? bgdScoreNew = freezed,
    Object? departmentOrganization = freezed,
    Object? dateStart = freezed,
    Object? dateEnd = freezed,
    Object? description = freezed,
    Object? stt = freezed,
    Object? registerTypeName = freezed,
    Object? registerTypeCode = freezed,
    Object? registerTypeDepartmentName = freezed,
    Object? departmentName = freezed,
  }) {
    return _then(_$IdeaItemImpl(
      totalPage: freezed == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      dateRegister: freezed == dateRegister
          ? _value.dateRegister
          : dateRegister // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isApprovedTBP: freezed == isApprovedTBP
          ? _value.isApprovedTBP
          : isApprovedTBP // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateApprovedTBP: freezed == dateApprovedTBP
          ? _value.dateApprovedTBP
          : dateApprovedTBP // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      approvedTBPID: freezed == approvedTBPID
          ? _value.approvedTBPID
          : approvedTBPID // ignore: cast_nullable_to_non_nullable
              as int?,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateApproved: freezed == dateApproved
          ? _value.dateApproved
          : dateApproved // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      approvedID: freezed == approvedID
          ? _value.approvedID
          : approvedID // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      registerIdeaTypeID: freezed == registerIdeaTypeID
          ? _value.registerIdeaTypeID
          : registerIdeaTypeID // ignore: cast_nullable_to_non_nullable
              as int?,
      departmentOrganizationID: freezed == departmentOrganizationID
          ? _value.departmentOrganizationID
          : departmentOrganizationID // ignore: cast_nullable_to_non_nullable
              as int?,
      courseID: freezed == courseID
          ? _value.courseID
          : courseID // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      tbpName: freezed == tbpName
          ? _value.tbpName
          : tbpName // ignore: cast_nullable_to_non_nullable
              as String?,
      bgdName: freezed == bgdName
          ? _value.bgdName
          : bgdName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentScore: freezed == departmentScore
          ? _value.departmentScore
          : departmentScore // ignore: cast_nullable_to_non_nullable
              as double?,
      tbpScore: freezed == tbpScore
          ? _value.tbpScore
          : tbpScore // ignore: cast_nullable_to_non_nullable
              as double?,
      bgdScore: freezed == bgdScore
          ? _value.bgdScore
          : bgdScore // ignore: cast_nullable_to_non_nullable
              as double?,
      avgScore: freezed == avgScore
          ? _value.avgScore
          : avgScore // ignore: cast_nullable_to_non_nullable
              as double?,
      rowNum: freezed == rowNum
          ? _value.rowNum
          : rowNum // ignore: cast_nullable_to_non_nullable
              as int?,
      bgdScoreNew: freezed == bgdScoreNew
          ? _value.bgdScoreNew
          : bgdScoreNew // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentOrganization: freezed == departmentOrganization
          ? _value.departmentOrganization
          : departmentOrganization // ignore: cast_nullable_to_non_nullable
              as String?,
      dateStart: freezed == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateEnd: freezed == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
      registerTypeName: freezed == registerTypeName
          ? _value.registerTypeName
          : registerTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      registerTypeCode: freezed == registerTypeCode
          ? _value.registerTypeCode
          : registerTypeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      registerTypeDepartmentName: freezed == registerTypeDepartmentName
          ? _value.registerTypeDepartmentName
          : registerTypeDepartmentName // ignore: cast_nullable_to_non_nullable
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
class _$IdeaItemImpl implements _IdeaItem {
  const _$IdeaItemImpl(
      {@JsonKey(name: 'TotalPage') this.totalPage,
      @JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'DateRegister') this.dateRegister,
      @JsonKey(name: 'IsApprovedTBP') this.isApprovedTBP,
      @JsonKey(name: 'DateApprovedTBP') this.dateApprovedTBP,
      @JsonKey(name: 'ApprovedTBPID') this.approvedTBPID,
      @JsonKey(name: 'IsApproved') this.isApproved,
      @JsonKey(name: 'DateApproved') this.dateApproved,
      @JsonKey(name: 'ApprovedID') this.approvedID,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'IsDeleted') this.isDeleted,
      @JsonKey(name: 'RegisterIdeaTypeID') this.registerIdeaTypeID,
      @JsonKey(name: 'DepartmentOrganizationID') this.departmentOrganizationID,
      @JsonKey(name: 'CourseID') this.courseID,
      @JsonKey(name: 'EmployeeName') this.employeeName,
      @JsonKey(name: 'TBPName') this.tbpName,
      @JsonKey(name: 'BGDName') this.bgdName,
      @JsonKey(name: 'DepartmentScore') this.departmentScore,
      @JsonKey(name: 'TBPScore') this.tbpScore,
      @JsonKey(name: 'BGDScore') this.bgdScore,
      @JsonKey(name: 'AvgScore') this.avgScore,
      @JsonKey(name: 'RowNum') this.rowNum,
      @JsonKey(name: 'BGDScoreNew') this.bgdScoreNew,
      @JsonKey(name: 'DepartmentOrganization') this.departmentOrganization,
      @JsonKey(name: 'DateStart') this.dateStart,
      @JsonKey(name: 'DateEnd') this.dateEnd,
      @JsonKey(name: 'Description') this.description,
      @JsonKey(name: 'STT') this.stt,
      @JsonKey(name: 'RegisterTypeName') this.registerTypeName,
      @JsonKey(name: 'RegisterTypeCode') this.registerTypeCode,
      @JsonKey(name: 'RegisterTypeDepartmentName')
      this.registerTypeDepartmentName,
      @JsonKey(name: 'DepartmentName') this.departmentName});

  factory _$IdeaItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdeaItemImplFromJson(json);

  @override
  @JsonKey(name: 'TotalPage')
  final int? totalPage;
  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;
  @override
  @JsonKey(name: 'DateRegister')
  final DateTime? dateRegister;
  @override
  @JsonKey(name: 'IsApprovedTBP')
  final bool? isApprovedTBP;
  @override
  @JsonKey(name: 'DateApprovedTBP')
  final DateTime? dateApprovedTBP;
  @override
  @JsonKey(name: 'ApprovedTBPID')
  final int? approvedTBPID;
  @override
  @JsonKey(name: 'IsApproved')
  final bool? isApproved;
  @override
  @JsonKey(name: 'DateApproved')
  final DateTime? dateApproved;
  @override
  @JsonKey(name: 'ApprovedID')
  final int? approvedID;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'CreatedDate')
  final DateTime? createdDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  final String? updatedBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  final DateTime? updatedDate;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;
  @override
  @JsonKey(name: 'RegisterIdeaTypeID')
  final int? registerIdeaTypeID;
  @override
  @JsonKey(name: 'DepartmentOrganizationID')
  final int? departmentOrganizationID;
  @override
  @JsonKey(name: 'CourseID')
  final int? courseID;
  @override
  @JsonKey(name: 'EmployeeName')
  final String? employeeName;
  @override
  @JsonKey(name: 'TBPName')
  final String? tbpName;
  @override
  @JsonKey(name: 'BGDName')
  final String? bgdName;
  @override
  @JsonKey(name: 'DepartmentScore')
  final double? departmentScore;
  @override
  @JsonKey(name: 'TBPScore')
  final double? tbpScore;
  @override
  @JsonKey(name: 'BGDScore')
  final double? bgdScore;
  @override
  @JsonKey(name: 'AvgScore')
  final double? avgScore;
  @override
  @JsonKey(name: 'RowNum')
  final int? rowNum;
  @override
  @JsonKey(name: 'BGDScoreNew')
  final String? bgdScoreNew;
  @override
  @JsonKey(name: 'DepartmentOrganization')
  final String? departmentOrganization;
  @override
  @JsonKey(name: 'DateStart')
  final DateTime? dateStart;
  @override
  @JsonKey(name: 'DateEnd')
  final DateTime? dateEnd;
  @override
  @JsonKey(name: 'Description')
  final String? description;
  @override
  @JsonKey(name: 'STT')
  final int? stt;
  @override
  @JsonKey(name: 'RegisterTypeName')
  final String? registerTypeName;
  @override
  @JsonKey(name: 'RegisterTypeCode')
  final String? registerTypeCode;
  @override
  @JsonKey(name: 'RegisterTypeDepartmentName')
  final String? registerTypeDepartmentName;
  @override
  @JsonKey(name: 'DepartmentName')
  final String? departmentName;

  @override
  String toString() {
    return 'IdeaItem(totalPage: $totalPage, id: $id, employeeId: $employeeId, dateRegister: $dateRegister, isApprovedTBP: $isApprovedTBP, dateApprovedTBP: $dateApprovedTBP, approvedTBPID: $approvedTBPID, isApproved: $isApproved, dateApproved: $dateApproved, approvedID: $approvedID, note: $note, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate, isDeleted: $isDeleted, registerIdeaTypeID: $registerIdeaTypeID, departmentOrganizationID: $departmentOrganizationID, courseID: $courseID, employeeName: $employeeName, tbpName: $tbpName, bgdName: $bgdName, departmentScore: $departmentScore, tbpScore: $tbpScore, bgdScore: $bgdScore, avgScore: $avgScore, rowNum: $rowNum, bgdScoreNew: $bgdScoreNew, departmentOrganization: $departmentOrganization, dateStart: $dateStart, dateEnd: $dateEnd, description: $description, stt: $stt, registerTypeName: $registerTypeName, registerTypeCode: $registerTypeCode, registerTypeDepartmentName: $registerTypeDepartmentName, departmentName: $departmentName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdeaItemImpl &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.dateRegister, dateRegister) ||
                other.dateRegister == dateRegister) &&
            (identical(other.isApprovedTBP, isApprovedTBP) ||
                other.isApprovedTBP == isApprovedTBP) &&
            (identical(other.dateApprovedTBP, dateApprovedTBP) ||
                other.dateApprovedTBP == dateApprovedTBP) &&
            (identical(other.approvedTBPID, approvedTBPID) ||
                other.approvedTBPID == approvedTBPID) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved) &&
            (identical(other.dateApproved, dateApproved) ||
                other.dateApproved == dateApproved) &&
            (identical(other.approvedID, approvedID) ||
                other.approvedID == approvedID) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.registerIdeaTypeID, registerIdeaTypeID) ||
                other.registerIdeaTypeID == registerIdeaTypeID) &&
            (identical(
                    other.departmentOrganizationID, departmentOrganizationID) ||
                other.departmentOrganizationID == departmentOrganizationID) &&
            (identical(other.courseID, courseID) ||
                other.courseID == courseID) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.tbpName, tbpName) || other.tbpName == tbpName) &&
            (identical(other.bgdName, bgdName) || other.bgdName == bgdName) &&
            (identical(other.departmentScore, departmentScore) ||
                other.departmentScore == departmentScore) &&
            (identical(other.tbpScore, tbpScore) ||
                other.tbpScore == tbpScore) &&
            (identical(other.bgdScore, bgdScore) ||
                other.bgdScore == bgdScore) &&
            (identical(other.avgScore, avgScore) ||
                other.avgScore == avgScore) &&
            (identical(other.rowNum, rowNum) || other.rowNum == rowNum) &&
            (identical(other.bgdScoreNew, bgdScoreNew) ||
                other.bgdScoreNew == bgdScoreNew) &&
            (identical(other.departmentOrganization, departmentOrganization) ||
                other.departmentOrganization == departmentOrganization) &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.dateEnd, dateEnd) || other.dateEnd == dateEnd) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.stt, stt) || other.stt == stt) &&
            (identical(other.registerTypeName, registerTypeName) ||
                other.registerTypeName == registerTypeName) &&
            (identical(other.registerTypeCode, registerTypeCode) ||
                other.registerTypeCode == registerTypeCode) &&
            (identical(other.registerTypeDepartmentName,
                    registerTypeDepartmentName) ||
                other.registerTypeDepartmentName ==
                    registerTypeDepartmentName) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        totalPage,
        id,
        employeeId,
        dateRegister,
        isApprovedTBP,
        dateApprovedTBP,
        approvedTBPID,
        isApproved,
        dateApproved,
        approvedID,
        note,
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        isDeleted,
        registerIdeaTypeID,
        departmentOrganizationID,
        courseID,
        employeeName,
        tbpName,
        bgdName,
        departmentScore,
        tbpScore,
        bgdScore,
        avgScore,
        rowNum,
        bgdScoreNew,
        departmentOrganization,
        dateStart,
        dateEnd,
        description,
        stt,
        registerTypeName,
        registerTypeCode,
        registerTypeDepartmentName,
        departmentName
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdeaItemImplCopyWith<_$IdeaItemImpl> get copyWith =>
      __$$IdeaItemImplCopyWithImpl<_$IdeaItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdeaItemImplToJson(
      this,
    );
  }
}

abstract class _IdeaItem implements IdeaItem {
  const factory _IdeaItem(
          {@JsonKey(name: 'TotalPage') final int? totalPage,
          @JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'EmployeeID') final int? employeeId,
          @JsonKey(name: 'DateRegister') final DateTime? dateRegister,
          @JsonKey(name: 'IsApprovedTBP') final bool? isApprovedTBP,
          @JsonKey(name: 'DateApprovedTBP') final DateTime? dateApprovedTBP,
          @JsonKey(name: 'ApprovedTBPID') final int? approvedTBPID,
          @JsonKey(name: 'IsApproved') final bool? isApproved,
          @JsonKey(name: 'DateApproved') final DateTime? dateApproved,
          @JsonKey(name: 'ApprovedID') final int? approvedID,
          @JsonKey(name: 'Note') final String? note,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy,
          @JsonKey(name: 'UpdatedDate') final DateTime? updatedDate,
          @JsonKey(name: 'IsDeleted') final bool? isDeleted,
          @JsonKey(name: 'RegisterIdeaTypeID') final int? registerIdeaTypeID,
          @JsonKey(name: 'DepartmentOrganizationID')
          final int? departmentOrganizationID,
          @JsonKey(name: 'CourseID') final int? courseID,
          @JsonKey(name: 'EmployeeName') final String? employeeName,
          @JsonKey(name: 'TBPName') final String? tbpName,
          @JsonKey(name: 'BGDName') final String? bgdName,
          @JsonKey(name: 'DepartmentScore') final double? departmentScore,
          @JsonKey(name: 'TBPScore') final double? tbpScore,
          @JsonKey(name: 'BGDScore') final double? bgdScore,
          @JsonKey(name: 'AvgScore') final double? avgScore,
          @JsonKey(name: 'RowNum') final int? rowNum,
          @JsonKey(name: 'BGDScoreNew') final String? bgdScoreNew,
          @JsonKey(name: 'DepartmentOrganization')
          final String? departmentOrganization,
          @JsonKey(name: 'DateStart') final DateTime? dateStart,
          @JsonKey(name: 'DateEnd') final DateTime? dateEnd,
          @JsonKey(name: 'Description') final String? description,
          @JsonKey(name: 'STT') final int? stt,
          @JsonKey(name: 'RegisterTypeName') final String? registerTypeName,
          @JsonKey(name: 'RegisterTypeCode') final String? registerTypeCode,
          @JsonKey(name: 'RegisterTypeDepartmentName')
          final String? registerTypeDepartmentName,
          @JsonKey(name: 'DepartmentName') final String? departmentName}) =
      _$IdeaItemImpl;

  factory _IdeaItem.fromJson(Map<String, dynamic> json) =
      _$IdeaItemImpl.fromJson;

  @override
  @JsonKey(name: 'TotalPage')
  int? get totalPage;
  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(name: 'DateRegister')
  DateTime? get dateRegister;
  @override
  @JsonKey(name: 'IsApprovedTBP')
  bool? get isApprovedTBP;
  @override
  @JsonKey(name: 'DateApprovedTBP')
  DateTime? get dateApprovedTBP;
  @override
  @JsonKey(name: 'ApprovedTBPID')
  int? get approvedTBPID;
  @override
  @JsonKey(name: 'IsApproved')
  bool? get isApproved;
  @override
  @JsonKey(name: 'DateApproved')
  DateTime? get dateApproved;
  @override
  @JsonKey(name: 'ApprovedID')
  int? get approvedID;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(name: 'RegisterIdeaTypeID')
  int? get registerIdeaTypeID;
  @override
  @JsonKey(name: 'DepartmentOrganizationID')
  int? get departmentOrganizationID;
  @override
  @JsonKey(name: 'CourseID')
  int? get courseID;
  @override
  @JsonKey(name: 'EmployeeName')
  String? get employeeName;
  @override
  @JsonKey(name: 'TBPName')
  String? get tbpName;
  @override
  @JsonKey(name: 'BGDName')
  String? get bgdName;
  @override
  @JsonKey(name: 'DepartmentScore')
  double? get departmentScore;
  @override
  @JsonKey(name: 'TBPScore')
  double? get tbpScore;
  @override
  @JsonKey(name: 'BGDScore')
  double? get bgdScore;
  @override
  @JsonKey(name: 'AvgScore')
  double? get avgScore;
  @override
  @JsonKey(name: 'RowNum')
  int? get rowNum;
  @override
  @JsonKey(name: 'BGDScoreNew')
  String? get bgdScoreNew;
  @override
  @JsonKey(name: 'DepartmentOrganization')
  String? get departmentOrganization;
  @override
  @JsonKey(name: 'DateStart')
  DateTime? get dateStart;
  @override
  @JsonKey(name: 'DateEnd')
  DateTime? get dateEnd;
  @override
  @JsonKey(name: 'Description')
  String? get description;
  @override
  @JsonKey(name: 'STT')
  int? get stt;
  @override
  @JsonKey(name: 'RegisterTypeName')
  String? get registerTypeName;
  @override
  @JsonKey(name: 'RegisterTypeCode')
  String? get registerTypeCode;
  @override
  @JsonKey(name: 'RegisterTypeDepartmentName')
  String? get registerTypeDepartmentName;
  @override
  @JsonKey(name: 'DepartmentName')
  String? get departmentName;
  @override
  @JsonKey(ignore: true)
  _$$IdeaItemImplCopyWith<_$IdeaItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
