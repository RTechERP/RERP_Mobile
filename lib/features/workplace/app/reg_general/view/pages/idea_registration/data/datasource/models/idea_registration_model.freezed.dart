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

IdeaDetailMember _$IdeaDetailMemberFromJson(Map<String, dynamic> json) {
  return _IdeaDetailMember.fromJson(json);
}

/// @nodoc
mixin _$IdeaDetailMember {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullName')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentID')
  int? get departmentId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdeaDetailMemberCopyWith<IdeaDetailMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdeaDetailMemberCopyWith<$Res> {
  factory $IdeaDetailMemberCopyWith(
          IdeaDetailMember value, $Res Function(IdeaDetailMember) then) =
      _$IdeaDetailMemberCopyWithImpl<$Res, IdeaDetailMember>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'DepartmentID') int? departmentId});
}

/// @nodoc
class _$IdeaDetailMemberCopyWithImpl<$Res, $Val extends IdeaDetailMember>
    implements $IdeaDetailMemberCopyWith<$Res> {
  _$IdeaDetailMemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = freezed,
    Object? departmentId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$IdeaDetailMemberImplCopyWith<$Res>
    implements $IdeaDetailMemberCopyWith<$Res> {
  factory _$$IdeaDetailMemberImplCopyWith(_$IdeaDetailMemberImpl value,
          $Res Function(_$IdeaDetailMemberImpl) then) =
      __$$IdeaDetailMemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'DepartmentID') int? departmentId});
}

/// @nodoc
class __$$IdeaDetailMemberImplCopyWithImpl<$Res>
    extends _$IdeaDetailMemberCopyWithImpl<$Res, _$IdeaDetailMemberImpl>
    implements _$$IdeaDetailMemberImplCopyWith<$Res> {
  __$$IdeaDetailMemberImplCopyWithImpl(_$IdeaDetailMemberImpl _value,
      $Res Function(_$IdeaDetailMemberImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = freezed,
    Object? departmentId = freezed,
  }) {
    return _then(_$IdeaDetailMemberImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$IdeaDetailMemberImpl implements _IdeaDetailMember {
  const _$IdeaDetailMemberImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'FullName') this.fullName,
      @JsonKey(name: 'DepartmentID') this.departmentId});

  factory _$IdeaDetailMemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdeaDetailMemberImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'FullName')
  final String? fullName;
  @override
  @JsonKey(name: 'DepartmentID')
  final int? departmentId;

  @override
  String toString() {
    return 'IdeaDetailMember(id: $id, fullName: $fullName, departmentId: $departmentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdeaDetailMemberImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, fullName, departmentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdeaDetailMemberImplCopyWith<_$IdeaDetailMemberImpl> get copyWith =>
      __$$IdeaDetailMemberImplCopyWithImpl<_$IdeaDetailMemberImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdeaDetailMemberImplToJson(
      this,
    );
  }
}

abstract class _IdeaDetailMember implements IdeaDetailMember {
  const factory _IdeaDetailMember(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'FullName') final String? fullName,
          @JsonKey(name: 'DepartmentID') final int? departmentId}) =
      _$IdeaDetailMemberImpl;

  factory _IdeaDetailMember.fromJson(Map<String, dynamic> json) =
      _$IdeaDetailMemberImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'FullName')
  String? get fullName;
  @override
  @JsonKey(name: 'DepartmentID')
  int? get departmentId;
  @override
  @JsonKey(ignore: true)
  _$$IdeaDetailMemberImplCopyWith<_$IdeaDetailMemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IdeaDetailDepartment _$IdeaDetailDepartmentFromJson(Map<String, dynamic> json) {
  return _IdeaDetailDepartment.fromJson(json);
}

/// @nodoc
mixin _$IdeaDetailDepartment {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'Description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'Status')
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'Email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'HeadofDepartment')
  int? get headofDepartment => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsShowHotline')
  bool? get isShowHotline => throw _privateConstructorUsedError;
  @JsonKey(name: 'PId')
  String? get pid => throw _privateConstructorUsedError;
  @JsonKey(name: 'STT')
  int? get stt => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'ParentID')
  int? get parentId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdeaDetailDepartmentCopyWith<IdeaDetailDepartment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdeaDetailDepartmentCopyWith<$Res> {
  factory $IdeaDetailDepartmentCopyWith(IdeaDetailDepartment value,
          $Res Function(IdeaDetailDepartment) then) =
      _$IdeaDetailDepartmentCopyWithImpl<$Res, IdeaDetailDepartment>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'Description') String? description,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'Status') int? status,
      @JsonKey(name: 'Email') String? email,
      @JsonKey(name: 'HeadofDepartment') int? headofDepartment,
      @JsonKey(name: 'IsShowHotline') bool? isShowHotline,
      @JsonKey(name: 'PId') String? pid,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'ParentID') int? parentId});
}

/// @nodoc
class _$IdeaDetailDepartmentCopyWithImpl<$Res,
        $Val extends IdeaDetailDepartment>
    implements $IdeaDetailDepartmentCopyWith<$Res> {
  _$IdeaDetailDepartmentCopyWithImpl(this._value, this._then);

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
    Object? description = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? status = freezed,
    Object? email = freezed,
    Object? headofDepartment = freezed,
    Object? isShowHotline = freezed,
    Object? pid = freezed,
    Object? stt = freezed,
    Object? isDeleted = freezed,
    Object? parentId = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
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
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      headofDepartment: freezed == headofDepartment
          ? _value.headofDepartment
          : headofDepartment // ignore: cast_nullable_to_non_nullable
              as int?,
      isShowHotline: freezed == isShowHotline
          ? _value.isShowHotline
          : isShowHotline // ignore: cast_nullable_to_non_nullable
              as bool?,
      pid: freezed == pid
          ? _value.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as String?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IdeaDetailDepartmentImplCopyWith<$Res>
    implements $IdeaDetailDepartmentCopyWith<$Res> {
  factory _$$IdeaDetailDepartmentImplCopyWith(_$IdeaDetailDepartmentImpl value,
          $Res Function(_$IdeaDetailDepartmentImpl) then) =
      __$$IdeaDetailDepartmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'Description') String? description,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'Status') int? status,
      @JsonKey(name: 'Email') String? email,
      @JsonKey(name: 'HeadofDepartment') int? headofDepartment,
      @JsonKey(name: 'IsShowHotline') bool? isShowHotline,
      @JsonKey(name: 'PId') String? pid,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'ParentID') int? parentId});
}

/// @nodoc
class __$$IdeaDetailDepartmentImplCopyWithImpl<$Res>
    extends _$IdeaDetailDepartmentCopyWithImpl<$Res, _$IdeaDetailDepartmentImpl>
    implements _$$IdeaDetailDepartmentImplCopyWith<$Res> {
  __$$IdeaDetailDepartmentImplCopyWithImpl(_$IdeaDetailDepartmentImpl _value,
      $Res Function(_$IdeaDetailDepartmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? status = freezed,
    Object? email = freezed,
    Object? headofDepartment = freezed,
    Object? isShowHotline = freezed,
    Object? pid = freezed,
    Object? stt = freezed,
    Object? isDeleted = freezed,
    Object? parentId = freezed,
  }) {
    return _then(_$IdeaDetailDepartmentImpl(
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
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
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      headofDepartment: freezed == headofDepartment
          ? _value.headofDepartment
          : headofDepartment // ignore: cast_nullable_to_non_nullable
              as int?,
      isShowHotline: freezed == isShowHotline
          ? _value.isShowHotline
          : isShowHotline // ignore: cast_nullable_to_non_nullable
              as bool?,
      pid: freezed == pid
          ? _value.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as String?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IdeaDetailDepartmentImpl implements _IdeaDetailDepartment {
  const _$IdeaDetailDepartmentImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'Name') this.name,
      @JsonKey(name: 'Description') this.description,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'Status') this.status,
      @JsonKey(name: 'Email') this.email,
      @JsonKey(name: 'HeadofDepartment') this.headofDepartment,
      @JsonKey(name: 'IsShowHotline') this.isShowHotline,
      @JsonKey(name: 'PId') this.pid,
      @JsonKey(name: 'STT') this.stt,
      @JsonKey(name: 'IsDeleted') this.isDeleted,
      @JsonKey(name: 'ParentID') this.parentId});

  factory _$IdeaDetailDepartmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdeaDetailDepartmentImplFromJson(json);

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
  @JsonKey(name: 'Description')
  final String? description;
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
  @JsonKey(name: 'Status')
  final int? status;
  @override
  @JsonKey(name: 'Email')
  final String? email;
  @override
  @JsonKey(name: 'HeadofDepartment')
  final int? headofDepartment;
  @override
  @JsonKey(name: 'IsShowHotline')
  final bool? isShowHotline;
  @override
  @JsonKey(name: 'PId')
  final String? pid;
  @override
  @JsonKey(name: 'STT')
  final int? stt;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;
  @override
  @JsonKey(name: 'ParentID')
  final int? parentId;

  @override
  String toString() {
    return 'IdeaDetailDepartment(id: $id, code: $code, name: $name, description: $description, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate, status: $status, email: $email, headofDepartment: $headofDepartment, isShowHotline: $isShowHotline, pid: $pid, stt: $stt, isDeleted: $isDeleted, parentId: $parentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdeaDetailDepartmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.headofDepartment, headofDepartment) ||
                other.headofDepartment == headofDepartment) &&
            (identical(other.isShowHotline, isShowHotline) ||
                other.isShowHotline == isShowHotline) &&
            (identical(other.pid, pid) || other.pid == pid) &&
            (identical(other.stt, stt) || other.stt == stt) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      code,
      name,
      description,
      createdBy,
      createdDate,
      updatedBy,
      updatedDate,
      status,
      email,
      headofDepartment,
      isShowHotline,
      pid,
      stt,
      isDeleted,
      parentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdeaDetailDepartmentImplCopyWith<_$IdeaDetailDepartmentImpl>
      get copyWith =>
          __$$IdeaDetailDepartmentImplCopyWithImpl<_$IdeaDetailDepartmentImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdeaDetailDepartmentImplToJson(
      this,
    );
  }
}

abstract class _IdeaDetailDepartment implements IdeaDetailDepartment {
  const factory _IdeaDetailDepartment(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'Code') final String? code,
          @JsonKey(name: 'Name') final String? name,
          @JsonKey(name: 'Description') final String? description,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy,
          @JsonKey(name: 'UpdatedDate') final DateTime? updatedDate,
          @JsonKey(name: 'Status') final int? status,
          @JsonKey(name: 'Email') final String? email,
          @JsonKey(name: 'HeadofDepartment') final int? headofDepartment,
          @JsonKey(name: 'IsShowHotline') final bool? isShowHotline,
          @JsonKey(name: 'PId') final String? pid,
          @JsonKey(name: 'STT') final int? stt,
          @JsonKey(name: 'IsDeleted') final bool? isDeleted,
          @JsonKey(name: 'ParentID') final int? parentId}) =
      _$IdeaDetailDepartmentImpl;

  factory _IdeaDetailDepartment.fromJson(Map<String, dynamic> json) =
      _$IdeaDetailDepartmentImpl.fromJson;

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
  @JsonKey(name: 'Description')
  String? get description;
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
  @JsonKey(name: 'Status')
  int? get status;
  @override
  @JsonKey(name: 'Email')
  String? get email;
  @override
  @JsonKey(name: 'HeadofDepartment')
  int? get headofDepartment;
  @override
  @JsonKey(name: 'IsShowHotline')
  bool? get isShowHotline;
  @override
  @JsonKey(name: 'PId')
  String? get pid;
  @override
  @JsonKey(name: 'STT')
  int? get stt;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(name: 'ParentID')
  int? get parentId;
  @override
  @JsonKey(ignore: true)
  _$$IdeaDetailDepartmentImplCopyWith<_$IdeaDetailDepartmentImpl>
      get copyWith => throw _privateConstructorUsedError;
}

IdeaDetailMain _$IdeaDetailMainFromJson(Map<String, dynamic> json) {
  return _IdeaDetailMain.fromJson(json);
}

/// @nodoc
mixin _$IdeaDetailMain {
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdeaDetailMainCopyWith<IdeaDetailMain> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdeaDetailMainCopyWith<$Res> {
  factory $IdeaDetailMainCopyWith(
          IdeaDetailMain value, $Res Function(IdeaDetailMain) then) =
      _$IdeaDetailMainCopyWithImpl<$Res, IdeaDetailMain>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
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
      @JsonKey(name: 'CourseID') int? courseID});
}

/// @nodoc
class _$IdeaDetailMainCopyWithImpl<$Res, $Val extends IdeaDetailMain>
    implements $IdeaDetailMainCopyWith<$Res> {
  _$IdeaDetailMainCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IdeaDetailMainImplCopyWith<$Res>
    implements $IdeaDetailMainCopyWith<$Res> {
  factory _$$IdeaDetailMainImplCopyWith(_$IdeaDetailMainImpl value,
          $Res Function(_$IdeaDetailMainImpl) then) =
      __$$IdeaDetailMainImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
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
      @JsonKey(name: 'CourseID') int? courseID});
}

/// @nodoc
class __$$IdeaDetailMainImplCopyWithImpl<$Res>
    extends _$IdeaDetailMainCopyWithImpl<$Res, _$IdeaDetailMainImpl>
    implements _$$IdeaDetailMainImplCopyWith<$Res> {
  __$$IdeaDetailMainImplCopyWithImpl(
      _$IdeaDetailMainImpl _value, $Res Function(_$IdeaDetailMainImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
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
  }) {
    return _then(_$IdeaDetailMainImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IdeaDetailMainImpl implements _IdeaDetailMain {
  const _$IdeaDetailMainImpl(
      {@JsonKey(name: 'ID') this.id,
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
      @JsonKey(name: 'CourseID') this.courseID});

  factory _$IdeaDetailMainImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdeaDetailMainImplFromJson(json);

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
  String toString() {
    return 'IdeaDetailMain(id: $id, employeeId: $employeeId, dateRegister: $dateRegister, isApprovedTBP: $isApprovedTBP, dateApprovedTBP: $dateApprovedTBP, approvedTBPID: $approvedTBPID, isApproved: $isApproved, dateApproved: $dateApproved, approvedID: $approvedID, note: $note, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate, isDeleted: $isDeleted, registerIdeaTypeID: $registerIdeaTypeID, departmentOrganizationID: $departmentOrganizationID, courseID: $courseID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdeaDetailMainImpl &&
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
                other.courseID == courseID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
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
      courseID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdeaDetailMainImplCopyWith<_$IdeaDetailMainImpl> get copyWith =>
      __$$IdeaDetailMainImplCopyWithImpl<_$IdeaDetailMainImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdeaDetailMainImplToJson(
      this,
    );
  }
}

abstract class _IdeaDetailMain implements IdeaDetailMain {
  const factory _IdeaDetailMain(
      {@JsonKey(name: 'ID') final int? id,
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
      @JsonKey(name: 'CourseID') final int? courseID}) = _$IdeaDetailMainImpl;

  factory _IdeaDetailMain.fromJson(Map<String, dynamic> json) =
      _$IdeaDetailMainImpl.fromJson;

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
  @JsonKey(ignore: true)
  _$$IdeaDetailMainImplCopyWith<_$IdeaDetailMainImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IdeaDetailItem _$IdeaDetailItemFromJson(Map<String, dynamic> json) {
  return _IdeaDetailItem.fromJson(json);
}

/// @nodoc
mixin _$IdeaDetailItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'RegisterIdeaID')
  int? get registerIdeaId => throw _privateConstructorUsedError;
  @JsonKey(name: 'STT')
  int? get stt => throw _privateConstructorUsedError;
  @JsonKey(name: 'Category')
  String? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'Description')
  String? get description => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'DateStart')
  DateTime? get dateStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateEnd')
  DateTime? get dateEnd => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdeaDetailItemCopyWith<IdeaDetailItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdeaDetailItemCopyWith<$Res> {
  factory $IdeaDetailItemCopyWith(
          IdeaDetailItem value, $Res Function(IdeaDetailItem) then) =
      _$IdeaDetailItemCopyWithImpl<$Res, IdeaDetailItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'RegisterIdeaID') int? registerIdeaId,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'Category') String? category,
      @JsonKey(name: 'Description') String? description,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'DateStart') DateTime? dateStart,
      @JsonKey(name: 'DateEnd') DateTime? dateEnd});
}

/// @nodoc
class _$IdeaDetailItemCopyWithImpl<$Res, $Val extends IdeaDetailItem>
    implements $IdeaDetailItemCopyWith<$Res> {
  _$IdeaDetailItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? registerIdeaId = freezed,
    Object? stt = freezed,
    Object? category = freezed,
    Object? description = freezed,
    Object? note = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? dateStart = freezed,
    Object? dateEnd = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      registerIdeaId: freezed == registerIdeaId
          ? _value.registerIdeaId
          : registerIdeaId // ignore: cast_nullable_to_non_nullable
              as int?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
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
      dateStart: freezed == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateEnd: freezed == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IdeaDetailItemImplCopyWith<$Res>
    implements $IdeaDetailItemCopyWith<$Res> {
  factory _$$IdeaDetailItemImplCopyWith(_$IdeaDetailItemImpl value,
          $Res Function(_$IdeaDetailItemImpl) then) =
      __$$IdeaDetailItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'RegisterIdeaID') int? registerIdeaId,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'Category') String? category,
      @JsonKey(name: 'Description') String? description,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'DateStart') DateTime? dateStart,
      @JsonKey(name: 'DateEnd') DateTime? dateEnd});
}

/// @nodoc
class __$$IdeaDetailItemImplCopyWithImpl<$Res>
    extends _$IdeaDetailItemCopyWithImpl<$Res, _$IdeaDetailItemImpl>
    implements _$$IdeaDetailItemImplCopyWith<$Res> {
  __$$IdeaDetailItemImplCopyWithImpl(
      _$IdeaDetailItemImpl _value, $Res Function(_$IdeaDetailItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? registerIdeaId = freezed,
    Object? stt = freezed,
    Object? category = freezed,
    Object? description = freezed,
    Object? note = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? dateStart = freezed,
    Object? dateEnd = freezed,
  }) {
    return _then(_$IdeaDetailItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      registerIdeaId: freezed == registerIdeaId
          ? _value.registerIdeaId
          : registerIdeaId // ignore: cast_nullable_to_non_nullable
              as int?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
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
      dateStart: freezed == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateEnd: freezed == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IdeaDetailItemImpl implements _IdeaDetailItem {
  const _$IdeaDetailItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'RegisterIdeaID') this.registerIdeaId,
      @JsonKey(name: 'STT') this.stt,
      @JsonKey(name: 'Category') this.category,
      @JsonKey(name: 'Description') this.description,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'DateStart') this.dateStart,
      @JsonKey(name: 'DateEnd') this.dateEnd});

  factory _$IdeaDetailItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdeaDetailItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'RegisterIdeaID')
  final int? registerIdeaId;
  @override
  @JsonKey(name: 'STT')
  final int? stt;
  @override
  @JsonKey(name: 'Category')
  final String? category;
  @override
  @JsonKey(name: 'Description')
  final String? description;
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
  @JsonKey(name: 'DateStart')
  final DateTime? dateStart;
  @override
  @JsonKey(name: 'DateEnd')
  final DateTime? dateEnd;

  @override
  String toString() {
    return 'IdeaDetailItem(id: $id, registerIdeaId: $registerIdeaId, stt: $stt, category: $category, description: $description, note: $note, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate, dateStart: $dateStart, dateEnd: $dateEnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdeaDetailItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.registerIdeaId, registerIdeaId) ||
                other.registerIdeaId == registerIdeaId) &&
            (identical(other.stt, stt) || other.stt == stt) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.dateEnd, dateEnd) || other.dateEnd == dateEnd));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      registerIdeaId,
      stt,
      category,
      description,
      note,
      createdBy,
      createdDate,
      updatedBy,
      updatedDate,
      dateStart,
      dateEnd);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdeaDetailItemImplCopyWith<_$IdeaDetailItemImpl> get copyWith =>
      __$$IdeaDetailItemImplCopyWithImpl<_$IdeaDetailItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdeaDetailItemImplToJson(
      this,
    );
  }
}

abstract class _IdeaDetailItem implements IdeaDetailItem {
  const factory _IdeaDetailItem(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'RegisterIdeaID') final int? registerIdeaId,
          @JsonKey(name: 'STT') final int? stt,
          @JsonKey(name: 'Category') final String? category,
          @JsonKey(name: 'Description') final String? description,
          @JsonKey(name: 'Note') final String? note,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy,
          @JsonKey(name: 'UpdatedDate') final DateTime? updatedDate,
          @JsonKey(name: 'DateStart') final DateTime? dateStart,
          @JsonKey(name: 'DateEnd') final DateTime? dateEnd}) =
      _$IdeaDetailItemImpl;

  factory _IdeaDetailItem.fromJson(Map<String, dynamic> json) =
      _$IdeaDetailItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'RegisterIdeaID')
  int? get registerIdeaId;
  @override
  @JsonKey(name: 'STT')
  int? get stt;
  @override
  @JsonKey(name: 'Category')
  String? get category;
  @override
  @JsonKey(name: 'Description')
  String? get description;
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
  @JsonKey(name: 'DateStart')
  DateTime? get dateStart;
  @override
  @JsonKey(name: 'DateEnd')
  DateTime? get dateEnd;
  @override
  @JsonKey(ignore: true)
  _$$IdeaDetailItemImplCopyWith<_$IdeaDetailItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IdeaDetail _$IdeaDetailFromJson(Map<String, dynamic> json) {
  return _IdeaDetail.fromJson(json);
}

/// @nodoc
mixin _$IdeaDetail {
  @JsonKey(name: 'em')
  List<IdeaDetailMember>? get members => throw _privateConstructorUsedError;
  @JsonKey(name: 'de')
  List<IdeaDetailDepartment>? get departments =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'rgt')
  IdeaDetailMain? get main => throw _privateConstructorUsedError;
  @JsonKey(name: 'rgtd')
  List<IdeaDetailItem>? get details => throw _privateConstructorUsedError;
  @JsonKey(name: 'rgtf')
  List<IdeaDetailFile>? get files => throw _privateConstructorUsedError;
  @JsonKey(name: 'rgts')
  List<IdeaDetailScore>? get scores => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdeaDetailCopyWith<IdeaDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdeaDetailCopyWith<$Res> {
  factory $IdeaDetailCopyWith(
          IdeaDetail value, $Res Function(IdeaDetail) then) =
      _$IdeaDetailCopyWithImpl<$Res, IdeaDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'em') List<IdeaDetailMember>? members,
      @JsonKey(name: 'de') List<IdeaDetailDepartment>? departments,
      @JsonKey(name: 'rgt') IdeaDetailMain? main,
      @JsonKey(name: 'rgtd') List<IdeaDetailItem>? details,
      @JsonKey(name: 'rgtf') List<IdeaDetailFile>? files,
      @JsonKey(name: 'rgts') List<IdeaDetailScore>? scores});

  $IdeaDetailMainCopyWith<$Res>? get main;
}

/// @nodoc
class _$IdeaDetailCopyWithImpl<$Res, $Val extends IdeaDetail>
    implements $IdeaDetailCopyWith<$Res> {
  _$IdeaDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? members = freezed,
    Object? departments = freezed,
    Object? main = freezed,
    Object? details = freezed,
    Object? files = freezed,
    Object? scores = freezed,
  }) {
    return _then(_value.copyWith(
      members: freezed == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<IdeaDetailMember>?,
      departments: freezed == departments
          ? _value.departments
          : departments // ignore: cast_nullable_to_non_nullable
              as List<IdeaDetailDepartment>?,
      main: freezed == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as IdeaDetailMain?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<IdeaDetailItem>?,
      files: freezed == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<IdeaDetailFile>?,
      scores: freezed == scores
          ? _value.scores
          : scores // ignore: cast_nullable_to_non_nullable
              as List<IdeaDetailScore>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IdeaDetailMainCopyWith<$Res>? get main {
    if (_value.main == null) {
      return null;
    }

    return $IdeaDetailMainCopyWith<$Res>(_value.main!, (value) {
      return _then(_value.copyWith(main: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$IdeaDetailImplCopyWith<$Res>
    implements $IdeaDetailCopyWith<$Res> {
  factory _$$IdeaDetailImplCopyWith(
          _$IdeaDetailImpl value, $Res Function(_$IdeaDetailImpl) then) =
      __$$IdeaDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'em') List<IdeaDetailMember>? members,
      @JsonKey(name: 'de') List<IdeaDetailDepartment>? departments,
      @JsonKey(name: 'rgt') IdeaDetailMain? main,
      @JsonKey(name: 'rgtd') List<IdeaDetailItem>? details,
      @JsonKey(name: 'rgtf') List<IdeaDetailFile>? files,
      @JsonKey(name: 'rgts') List<IdeaDetailScore>? scores});

  @override
  $IdeaDetailMainCopyWith<$Res>? get main;
}

/// @nodoc
class __$$IdeaDetailImplCopyWithImpl<$Res>
    extends _$IdeaDetailCopyWithImpl<$Res, _$IdeaDetailImpl>
    implements _$$IdeaDetailImplCopyWith<$Res> {
  __$$IdeaDetailImplCopyWithImpl(
      _$IdeaDetailImpl _value, $Res Function(_$IdeaDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? members = freezed,
    Object? departments = freezed,
    Object? main = freezed,
    Object? details = freezed,
    Object? files = freezed,
    Object? scores = freezed,
  }) {
    return _then(_$IdeaDetailImpl(
      members: freezed == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<IdeaDetailMember>?,
      departments: freezed == departments
          ? _value._departments
          : departments // ignore: cast_nullable_to_non_nullable
              as List<IdeaDetailDepartment>?,
      main: freezed == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as IdeaDetailMain?,
      details: freezed == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<IdeaDetailItem>?,
      files: freezed == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<IdeaDetailFile>?,
      scores: freezed == scores
          ? _value._scores
          : scores // ignore: cast_nullable_to_non_nullable
              as List<IdeaDetailScore>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IdeaDetailImpl implements _IdeaDetail {
  const _$IdeaDetailImpl(
      {@JsonKey(name: 'em') final List<IdeaDetailMember>? members,
      @JsonKey(name: 'de') final List<IdeaDetailDepartment>? departments,
      @JsonKey(name: 'rgt') this.main,
      @JsonKey(name: 'rgtd') final List<IdeaDetailItem>? details,
      @JsonKey(name: 'rgtf') final List<IdeaDetailFile>? files,
      @JsonKey(name: 'rgts') final List<IdeaDetailScore>? scores})
      : _members = members,
        _departments = departments,
        _details = details,
        _files = files,
        _scores = scores;

  factory _$IdeaDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdeaDetailImplFromJson(json);

  final List<IdeaDetailMember>? _members;
  @override
  @JsonKey(name: 'em')
  List<IdeaDetailMember>? get members {
    final value = _members;
    if (value == null) return null;
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<IdeaDetailDepartment>? _departments;
  @override
  @JsonKey(name: 'de')
  List<IdeaDetailDepartment>? get departments {
    final value = _departments;
    if (value == null) return null;
    if (_departments is EqualUnmodifiableListView) return _departments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'rgt')
  final IdeaDetailMain? main;
  final List<IdeaDetailItem>? _details;
  @override
  @JsonKey(name: 'rgtd')
  List<IdeaDetailItem>? get details {
    final value = _details;
    if (value == null) return null;
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<IdeaDetailFile>? _files;
  @override
  @JsonKey(name: 'rgtf')
  List<IdeaDetailFile>? get files {
    final value = _files;
    if (value == null) return null;
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<IdeaDetailScore>? _scores;
  @override
  @JsonKey(name: 'rgts')
  List<IdeaDetailScore>? get scores {
    final value = _scores;
    if (value == null) return null;
    if (_scores is EqualUnmodifiableListView) return _scores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'IdeaDetail(members: $members, departments: $departments, main: $main, details: $details, files: $files, scores: $scores)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdeaDetailImpl &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            const DeepCollectionEquality()
                .equals(other._departments, _departments) &&
            (identical(other.main, main) || other.main == main) &&
            const DeepCollectionEquality().equals(other._details, _details) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            const DeepCollectionEquality().equals(other._scores, _scores));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_members),
      const DeepCollectionEquality().hash(_departments),
      main,
      const DeepCollectionEquality().hash(_details),
      const DeepCollectionEquality().hash(_files),
      const DeepCollectionEquality().hash(_scores));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdeaDetailImplCopyWith<_$IdeaDetailImpl> get copyWith =>
      __$$IdeaDetailImplCopyWithImpl<_$IdeaDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdeaDetailImplToJson(
      this,
    );
  }
}

abstract class _IdeaDetail implements IdeaDetail {
  const factory _IdeaDetail(
          {@JsonKey(name: 'em') final List<IdeaDetailMember>? members,
          @JsonKey(name: 'de') final List<IdeaDetailDepartment>? departments,
          @JsonKey(name: 'rgt') final IdeaDetailMain? main,
          @JsonKey(name: 'rgtd') final List<IdeaDetailItem>? details,
          @JsonKey(name: 'rgtf') final List<IdeaDetailFile>? files,
          @JsonKey(name: 'rgts') final List<IdeaDetailScore>? scores}) =
      _$IdeaDetailImpl;

  factory _IdeaDetail.fromJson(Map<String, dynamic> json) =
      _$IdeaDetailImpl.fromJson;

  @override
  @JsonKey(name: 'em')
  List<IdeaDetailMember>? get members;
  @override
  @JsonKey(name: 'de')
  List<IdeaDetailDepartment>? get departments;
  @override
  @JsonKey(name: 'rgt')
  IdeaDetailMain? get main;
  @override
  @JsonKey(name: 'rgtd')
  List<IdeaDetailItem>? get details;
  @override
  @JsonKey(name: 'rgtf')
  List<IdeaDetailFile>? get files;
  @override
  @JsonKey(name: 'rgts')
  List<IdeaDetailScore>? get scores;
  @override
  @JsonKey(ignore: true)
  _$$IdeaDetailImplCopyWith<_$IdeaDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IdeaDetailFile _$IdeaDetailFileFromJson(Map<String, dynamic> json) {
  return _IdeaDetailFile.fromJson(json);
}

/// @nodoc
mixin _$IdeaDetailFile {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'RegisterIdeaID')
  int? get registerIdeaId => throw _privateConstructorUsedError;
  @JsonKey(name: 'FileName')
  String? get fileName => throw _privateConstructorUsedError;
  @JsonKey(name: 'FilePath')
  String? get filePath => throw _privateConstructorUsedError;
  @JsonKey(name: 'FileType')
  String? get fileType => throw _privateConstructorUsedError;
  @JsonKey(name: 'FileSize')
  int? get fileSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdeaDetailFileCopyWith<IdeaDetailFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdeaDetailFileCopyWith<$Res> {
  factory $IdeaDetailFileCopyWith(
          IdeaDetailFile value, $Res Function(IdeaDetailFile) then) =
      _$IdeaDetailFileCopyWithImpl<$Res, IdeaDetailFile>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'RegisterIdeaID') int? registerIdeaId,
      @JsonKey(name: 'FileName') String? fileName,
      @JsonKey(name: 'FilePath') String? filePath,
      @JsonKey(name: 'FileType') String? fileType,
      @JsonKey(name: 'FileSize') int? fileSize,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate});
}

/// @nodoc
class _$IdeaDetailFileCopyWithImpl<$Res, $Val extends IdeaDetailFile>
    implements $IdeaDetailFileCopyWith<$Res> {
  _$IdeaDetailFileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? registerIdeaId = freezed,
    Object? fileName = freezed,
    Object? filePath = freezed,
    Object? fileType = freezed,
    Object? fileSize = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      registerIdeaId: freezed == registerIdeaId
          ? _value.registerIdeaId
          : registerIdeaId // ignore: cast_nullable_to_non_nullable
              as int?,
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      filePath: freezed == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
      fileType: freezed == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String?,
      fileSize: freezed == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IdeaDetailFileImplCopyWith<$Res>
    implements $IdeaDetailFileCopyWith<$Res> {
  factory _$$IdeaDetailFileImplCopyWith(_$IdeaDetailFileImpl value,
          $Res Function(_$IdeaDetailFileImpl) then) =
      __$$IdeaDetailFileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'RegisterIdeaID') int? registerIdeaId,
      @JsonKey(name: 'FileName') String? fileName,
      @JsonKey(name: 'FilePath') String? filePath,
      @JsonKey(name: 'FileType') String? fileType,
      @JsonKey(name: 'FileSize') int? fileSize,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate});
}

/// @nodoc
class __$$IdeaDetailFileImplCopyWithImpl<$Res>
    extends _$IdeaDetailFileCopyWithImpl<$Res, _$IdeaDetailFileImpl>
    implements _$$IdeaDetailFileImplCopyWith<$Res> {
  __$$IdeaDetailFileImplCopyWithImpl(
      _$IdeaDetailFileImpl _value, $Res Function(_$IdeaDetailFileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? registerIdeaId = freezed,
    Object? fileName = freezed,
    Object? filePath = freezed,
    Object? fileType = freezed,
    Object? fileSize = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_$IdeaDetailFileImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      registerIdeaId: freezed == registerIdeaId
          ? _value.registerIdeaId
          : registerIdeaId // ignore: cast_nullable_to_non_nullable
              as int?,
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      filePath: freezed == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
      fileType: freezed == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String?,
      fileSize: freezed == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IdeaDetailFileImpl implements _IdeaDetailFile {
  const _$IdeaDetailFileImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'RegisterIdeaID') this.registerIdeaId,
      @JsonKey(name: 'FileName') this.fileName,
      @JsonKey(name: 'FilePath') this.filePath,
      @JsonKey(name: 'FileType') this.fileType,
      @JsonKey(name: 'FileSize') this.fileSize,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate});

  factory _$IdeaDetailFileImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdeaDetailFileImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'RegisterIdeaID')
  final int? registerIdeaId;
  @override
  @JsonKey(name: 'FileName')
  final String? fileName;
  @override
  @JsonKey(name: 'FilePath')
  final String? filePath;
  @override
  @JsonKey(name: 'FileType')
  final String? fileType;
  @override
  @JsonKey(name: 'FileSize')
  final int? fileSize;
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'CreatedDate')
  final DateTime? createdDate;

  @override
  String toString() {
    return 'IdeaDetailFile(id: $id, registerIdeaId: $registerIdeaId, fileName: $fileName, filePath: $filePath, fileType: $fileType, fileSize: $fileSize, createdBy: $createdBy, createdDate: $createdDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdeaDetailFileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.registerIdeaId, registerIdeaId) ||
                other.registerIdeaId == registerIdeaId) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, registerIdeaId, fileName,
      filePath, fileType, fileSize, createdBy, createdDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdeaDetailFileImplCopyWith<_$IdeaDetailFileImpl> get copyWith =>
      __$$IdeaDetailFileImplCopyWithImpl<_$IdeaDetailFileImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdeaDetailFileImplToJson(
      this,
    );
  }
}

abstract class _IdeaDetailFile implements IdeaDetailFile {
  const factory _IdeaDetailFile(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'RegisterIdeaID') final int? registerIdeaId,
          @JsonKey(name: 'FileName') final String? fileName,
          @JsonKey(name: 'FilePath') final String? filePath,
          @JsonKey(name: 'FileType') final String? fileType,
          @JsonKey(name: 'FileSize') final int? fileSize,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'CreatedDate') final DateTime? createdDate}) =
      _$IdeaDetailFileImpl;

  factory _IdeaDetailFile.fromJson(Map<String, dynamic> json) =
      _$IdeaDetailFileImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'RegisterIdeaID')
  int? get registerIdeaId;
  @override
  @JsonKey(name: 'FileName')
  String? get fileName;
  @override
  @JsonKey(name: 'FilePath')
  String? get filePath;
  @override
  @JsonKey(name: 'FileType')
  String? get fileType;
  @override
  @JsonKey(name: 'FileSize')
  int? get fileSize;
  @override
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate;
  @override
  @JsonKey(ignore: true)
  _$$IdeaDetailFileImplCopyWith<_$IdeaDetailFileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IdeaDetailScore _$IdeaDetailScoreFromJson(Map<String, dynamic> json) {
  return _IdeaDetailScore.fromJson(json);
}

/// @nodoc
mixin _$IdeaDetailScore {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'RegisterIdeaID')
  int? get registerIdeaId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Score')
  double? get score => throw _privateConstructorUsedError;
  @JsonKey(name: 'ScoredBy')
  String? get scoredBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'ScoredDate')
  DateTime? get scoredDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdeaDetailScoreCopyWith<IdeaDetailScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdeaDetailScoreCopyWith<$Res> {
  factory $IdeaDetailScoreCopyWith(
          IdeaDetailScore value, $Res Function(IdeaDetailScore) then) =
      _$IdeaDetailScoreCopyWithImpl<$Res, IdeaDetailScore>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'RegisterIdeaID') int? registerIdeaId,
      @JsonKey(name: 'Score') double? score,
      @JsonKey(name: 'ScoredBy') String? scoredBy,
      @JsonKey(name: 'ScoredDate') DateTime? scoredDate,
      @JsonKey(name: 'Note') String? note});
}

/// @nodoc
class _$IdeaDetailScoreCopyWithImpl<$Res, $Val extends IdeaDetailScore>
    implements $IdeaDetailScoreCopyWith<$Res> {
  _$IdeaDetailScoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? registerIdeaId = freezed,
    Object? score = freezed,
    Object? scoredBy = freezed,
    Object? scoredDate = freezed,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      registerIdeaId: freezed == registerIdeaId
          ? _value.registerIdeaId
          : registerIdeaId // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      scoredBy: freezed == scoredBy
          ? _value.scoredBy
          : scoredBy // ignore: cast_nullable_to_non_nullable
              as String?,
      scoredDate: freezed == scoredDate
          ? _value.scoredDate
          : scoredDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IdeaDetailScoreImplCopyWith<$Res>
    implements $IdeaDetailScoreCopyWith<$Res> {
  factory _$$IdeaDetailScoreImplCopyWith(_$IdeaDetailScoreImpl value,
          $Res Function(_$IdeaDetailScoreImpl) then) =
      __$$IdeaDetailScoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'RegisterIdeaID') int? registerIdeaId,
      @JsonKey(name: 'Score') double? score,
      @JsonKey(name: 'ScoredBy') String? scoredBy,
      @JsonKey(name: 'ScoredDate') DateTime? scoredDate,
      @JsonKey(name: 'Note') String? note});
}

/// @nodoc
class __$$IdeaDetailScoreImplCopyWithImpl<$Res>
    extends _$IdeaDetailScoreCopyWithImpl<$Res, _$IdeaDetailScoreImpl>
    implements _$$IdeaDetailScoreImplCopyWith<$Res> {
  __$$IdeaDetailScoreImplCopyWithImpl(
      _$IdeaDetailScoreImpl _value, $Res Function(_$IdeaDetailScoreImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? registerIdeaId = freezed,
    Object? score = freezed,
    Object? scoredBy = freezed,
    Object? scoredDate = freezed,
    Object? note = freezed,
  }) {
    return _then(_$IdeaDetailScoreImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      registerIdeaId: freezed == registerIdeaId
          ? _value.registerIdeaId
          : registerIdeaId // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      scoredBy: freezed == scoredBy
          ? _value.scoredBy
          : scoredBy // ignore: cast_nullable_to_non_nullable
              as String?,
      scoredDate: freezed == scoredDate
          ? _value.scoredDate
          : scoredDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IdeaDetailScoreImpl implements _IdeaDetailScore {
  const _$IdeaDetailScoreImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'RegisterIdeaID') this.registerIdeaId,
      @JsonKey(name: 'Score') this.score,
      @JsonKey(name: 'ScoredBy') this.scoredBy,
      @JsonKey(name: 'ScoredDate') this.scoredDate,
      @JsonKey(name: 'Note') this.note});

  factory _$IdeaDetailScoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdeaDetailScoreImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'RegisterIdeaID')
  final int? registerIdeaId;
  @override
  @JsonKey(name: 'Score')
  final double? score;
  @override
  @JsonKey(name: 'ScoredBy')
  final String? scoredBy;
  @override
  @JsonKey(name: 'ScoredDate')
  final DateTime? scoredDate;
  @override
  @JsonKey(name: 'Note')
  final String? note;

  @override
  String toString() {
    return 'IdeaDetailScore(id: $id, registerIdeaId: $registerIdeaId, score: $score, scoredBy: $scoredBy, scoredDate: $scoredDate, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdeaDetailScoreImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.registerIdeaId, registerIdeaId) ||
                other.registerIdeaId == registerIdeaId) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.scoredBy, scoredBy) ||
                other.scoredBy == scoredBy) &&
            (identical(other.scoredDate, scoredDate) ||
                other.scoredDate == scoredDate) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, registerIdeaId, score, scoredBy, scoredDate, note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdeaDetailScoreImplCopyWith<_$IdeaDetailScoreImpl> get copyWith =>
      __$$IdeaDetailScoreImplCopyWithImpl<_$IdeaDetailScoreImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdeaDetailScoreImplToJson(
      this,
    );
  }
}

abstract class _IdeaDetailScore implements IdeaDetailScore {
  const factory _IdeaDetailScore(
      {@JsonKey(name: 'ID') final int? id,
      @JsonKey(name: 'RegisterIdeaID') final int? registerIdeaId,
      @JsonKey(name: 'Score') final double? score,
      @JsonKey(name: 'ScoredBy') final String? scoredBy,
      @JsonKey(name: 'ScoredDate') final DateTime? scoredDate,
      @JsonKey(name: 'Note') final String? note}) = _$IdeaDetailScoreImpl;

  factory _IdeaDetailScore.fromJson(Map<String, dynamic> json) =
      _$IdeaDetailScoreImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'RegisterIdeaID')
  int? get registerIdeaId;
  @override
  @JsonKey(name: 'Score')
  double? get score;
  @override
  @JsonKey(name: 'ScoredBy')
  String? get scoredBy;
  @override
  @JsonKey(name: 'ScoredDate')
  DateTime? get scoredDate;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(ignore: true)
  _$$IdeaDetailScoreImplCopyWith<_$IdeaDetailScoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
