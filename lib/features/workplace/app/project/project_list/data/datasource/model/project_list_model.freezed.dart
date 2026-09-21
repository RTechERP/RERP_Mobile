// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProjectListData _$ProjectListDataFromJson(Map<String, dynamic> json) {
  return _ProjectListData.fromJson(json);
}

/// @nodoc
mixin _$ProjectListData {
  @JsonKey(name: 'project')
  List<ProjectItem>? get project => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalPage')
  int? get totalPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectListDataCopyWith<ProjectListData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectListDataCopyWith<$Res> {
  factory $ProjectListDataCopyWith(
          ProjectListData value, $Res Function(ProjectListData) then) =
      _$ProjectListDataCopyWithImpl<$Res, ProjectListData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'project') List<ProjectItem>? project,
      @JsonKey(name: 'totalPage') int? totalPage});
}

/// @nodoc
class _$ProjectListDataCopyWithImpl<$Res, $Val extends ProjectListData>
    implements $ProjectListDataCopyWith<$Res> {
  _$ProjectListDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? project = freezed,
    Object? totalPage = freezed,
  }) {
    return _then(_value.copyWith(
      project: freezed == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as List<ProjectItem>?,
      totalPage: freezed == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectListDataImplCopyWith<$Res>
    implements $ProjectListDataCopyWith<$Res> {
  factory _$$ProjectListDataImplCopyWith(_$ProjectListDataImpl value,
          $Res Function(_$ProjectListDataImpl) then) =
      __$$ProjectListDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'project') List<ProjectItem>? project,
      @JsonKey(name: 'totalPage') int? totalPage});
}

/// @nodoc
class __$$ProjectListDataImplCopyWithImpl<$Res>
    extends _$ProjectListDataCopyWithImpl<$Res, _$ProjectListDataImpl>
    implements _$$ProjectListDataImplCopyWith<$Res> {
  __$$ProjectListDataImplCopyWithImpl(
      _$ProjectListDataImpl _value, $Res Function(_$ProjectListDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? project = freezed,
    Object? totalPage = freezed,
  }) {
    return _then(_$ProjectListDataImpl(
      project: freezed == project
          ? _value._project
          : project // ignore: cast_nullable_to_non_nullable
              as List<ProjectItem>?,
      totalPage: freezed == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectListDataImpl implements _ProjectListData {
  const _$ProjectListDataImpl(
      {@JsonKey(name: 'project') final List<ProjectItem>? project,
      @JsonKey(name: 'totalPage') this.totalPage})
      : _project = project;

  factory _$ProjectListDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectListDataImplFromJson(json);

  final List<ProjectItem>? _project;
  @override
  @JsonKey(name: 'project')
  List<ProjectItem>? get project {
    final value = _project;
    if (value == null) return null;
    if (_project is EqualUnmodifiableListView) return _project;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'totalPage')
  final int? totalPage;

  @override
  String toString() {
    return 'ProjectListData(project: $project, totalPage: $totalPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectListDataImpl &&
            const DeepCollectionEquality().equals(other._project, _project) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_project), totalPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectListDataImplCopyWith<_$ProjectListDataImpl> get copyWith =>
      __$$ProjectListDataImplCopyWithImpl<_$ProjectListDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectListDataImplToJson(
      this,
    );
  }
}

abstract class _ProjectListData implements ProjectListData {
  const factory _ProjectListData(
          {@JsonKey(name: 'project') final List<ProjectItem>? project,
          @JsonKey(name: 'totalPage') final int? totalPage}) =
      _$ProjectListDataImpl;

  factory _ProjectListData.fromJson(Map<String, dynamic> json) =
      _$ProjectListDataImpl.fromJson;

  @override
  @JsonKey(name: 'project')
  List<ProjectItem>? get project;
  @override
  @JsonKey(name: 'totalPage')
  int? get totalPage;
  @override
  @JsonKey(ignore: true)
  _$$ProjectListDataImplCopyWith<_$ProjectListDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectItem _$ProjectItemFromJson(Map<String, dynamic> json) {
  return _ProjectItem.fromJson(json);
}

/// @nodoc
mixin _$ProjectItem {
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
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApproved')
  dynamic get isApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContactID')
  dynamic get contactId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PO')
  dynamic get po => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectType')
  dynamic get projectType => throw _privateConstructorUsedError;
  @JsonKey(name: 'ListCostID')
  dynamic get listCostId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PlanDateStart')
  dynamic get planDateStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'PlanDateEnd')
  dynamic get planDateEnd => throw _privateConstructorUsedError;
  @JsonKey(name: 'ActualDateStart')
  dynamic get actualDateStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'ActualDateEnd')
  dynamic get actualDateEnd => throw _privateConstructorUsedError;
  @JsonKey(name: 'EU')
  dynamic get eu => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectManager')
  int? get projectManager => throw _privateConstructorUsedError;
  @JsonKey(name: 'CurrentState')
  String? get currentState => throw _privateConstructorUsedError;
  @JsonKey(name: 'Priotity')
  double? get priotity => throw _privateConstructorUsedError;
  @JsonKey(name: 'PODate')
  dynamic get poDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'EndUser')
  int? get endUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  String? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  String? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'BusinessFieldID')
  int? get businessFieldId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeProject')
  int? get typeProject => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerCode')
  String? get customerCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerName')
  String? get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullNameSale')
  String? get fullNameSale => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContactName')
  dynamic get contactName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContactPhone')
  dynamic get contactPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContactEmail')
  dynamic get contactEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullNameTech')
  String? get fullNameTech => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectStatusText')
  String? get projectStatusText => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullNamePM')
  String? get fullNamePM => throw _privateConstructorUsedError;
  @JsonKey(name: 'PersonalPriotity')
  int? get personalPriotity => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectStatusName')
  String? get projectStatusName => throw _privateConstructorUsedError;
  @JsonKey(name: 'PMID')
  int? get pmId => throw _privateConstructorUsedError;
  @JsonKey(name: 'EndUserName')
  String? get endUserName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateLog')
  dynamic get dateLog => throw _privateConstructorUsedError;
  @JsonKey(name: 'ExpectedPlanDate')
  String? get expectedPlanDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'ExpectedQuotationDate')
  String? get expectedQuotationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'RealityPlanDate')
  dynamic get realityPlanDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'RealityProjectEndDate')
  dynamic get realityProjectEndDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'RowNum')
  int? get rowNum => throw _privateConstructorUsedError;
  @JsonKey(name: 'PriotityText')
  double? get priotityText => throw _privateConstructorUsedError;

  /// ID của yêu cầu dự án - dùng để gọi API giải pháp.
  @JsonKey(name: 'ProjectRequestID')
  int? get projectRequestId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectItemCopyWith<ProjectItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectItemCopyWith<$Res> {
  factory $ProjectItemCopyWith(
          ProjectItem value, $Res Function(ProjectItem) then) =
      _$ProjectItemCopyWithImpl<$Res, ProjectItem>;
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
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'IsApproved') dynamic isApproved,
      @JsonKey(name: 'ContactID') dynamic contactId,
      @JsonKey(name: 'PO') dynamic po,
      @JsonKey(name: 'ProjectType') dynamic projectType,
      @JsonKey(name: 'ListCostID') dynamic listCostId,
      @JsonKey(name: 'PlanDateStart') dynamic planDateStart,
      @JsonKey(name: 'PlanDateEnd') dynamic planDateEnd,
      @JsonKey(name: 'ActualDateStart') dynamic actualDateStart,
      @JsonKey(name: 'ActualDateEnd') dynamic actualDateEnd,
      @JsonKey(name: 'EU') dynamic eu,
      @JsonKey(name: 'ProjectManager') int? projectManager,
      @JsonKey(name: 'CurrentState') String? currentState,
      @JsonKey(name: 'Priotity') double? priotity,
      @JsonKey(name: 'PODate') dynamic poDate,
      @JsonKey(name: 'EndUser') int? endUser,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') String? updatedDate,
      @JsonKey(name: 'BusinessFieldID') int? businessFieldId,
      @JsonKey(name: 'TypeProject') int? typeProject,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'CustomerCode') String? customerCode,
      @JsonKey(name: 'CustomerName') String? customerName,
      @JsonKey(name: 'FullNameSale') String? fullNameSale,
      @JsonKey(name: 'ContactName') dynamic contactName,
      @JsonKey(name: 'ContactPhone') dynamic contactPhone,
      @JsonKey(name: 'ContactEmail') dynamic contactEmail,
      @JsonKey(name: 'FullNameTech') String? fullNameTech,
      @JsonKey(name: 'ProjectStatusText') String? projectStatusText,
      @JsonKey(name: 'FullNamePM') String? fullNamePM,
      @JsonKey(name: 'PersonalPriotity') int? personalPriotity,
      @JsonKey(name: 'ProjectStatusName') String? projectStatusName,
      @JsonKey(name: 'PMID') int? pmId,
      @JsonKey(name: 'EndUserName') String? endUserName,
      @JsonKey(name: 'DateLog') dynamic dateLog,
      @JsonKey(name: 'ExpectedPlanDate') String? expectedPlanDate,
      @JsonKey(name: 'ExpectedQuotationDate') String? expectedQuotationDate,
      @JsonKey(name: 'RealityPlanDate') dynamic realityPlanDate,
      @JsonKey(name: 'RealityProjectEndDate') dynamic realityProjectEndDate,
      @JsonKey(name: 'RowNum') int? rowNum,
      @JsonKey(name: 'PriotityText') double? priotityText,
      @JsonKey(name: 'ProjectRequestID') int? projectRequestId});
}

/// @nodoc
class _$ProjectItemCopyWithImpl<$Res, $Val extends ProjectItem>
    implements $ProjectItemCopyWith<$Res> {
  _$ProjectItemCopyWithImpl(this._value, this._then);

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
    Object? note = freezed,
    Object? isApproved = freezed,
    Object? contactId = freezed,
    Object? po = freezed,
    Object? projectType = freezed,
    Object? listCostId = freezed,
    Object? planDateStart = freezed,
    Object? planDateEnd = freezed,
    Object? actualDateStart = freezed,
    Object? actualDateEnd = freezed,
    Object? eu = freezed,
    Object? projectManager = freezed,
    Object? currentState = freezed,
    Object? priotity = freezed,
    Object? poDate = freezed,
    Object? endUser = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? businessFieldId = freezed,
    Object? typeProject = freezed,
    Object? isDeleted = freezed,
    Object? customerCode = freezed,
    Object? customerName = freezed,
    Object? fullNameSale = freezed,
    Object? contactName = freezed,
    Object? contactPhone = freezed,
    Object? contactEmail = freezed,
    Object? fullNameTech = freezed,
    Object? projectStatusText = freezed,
    Object? fullNamePM = freezed,
    Object? personalPriotity = freezed,
    Object? projectStatusName = freezed,
    Object? pmId = freezed,
    Object? endUserName = freezed,
    Object? dateLog = freezed,
    Object? expectedPlanDate = freezed,
    Object? expectedQuotationDate = freezed,
    Object? realityPlanDate = freezed,
    Object? realityProjectEndDate = freezed,
    Object? rowNum = freezed,
    Object? priotityText = freezed,
    Object? projectRequestId = freezed,
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
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as dynamic,
      contactId: freezed == contactId
          ? _value.contactId
          : contactId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      po: freezed == po
          ? _value.po
          : po // ignore: cast_nullable_to_non_nullable
              as dynamic,
      projectType: freezed == projectType
          ? _value.projectType
          : projectType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      listCostId: freezed == listCostId
          ? _value.listCostId
          : listCostId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      planDateStart: freezed == planDateStart
          ? _value.planDateStart
          : planDateStart // ignore: cast_nullable_to_non_nullable
              as dynamic,
      planDateEnd: freezed == planDateEnd
          ? _value.planDateEnd
          : planDateEnd // ignore: cast_nullable_to_non_nullable
              as dynamic,
      actualDateStart: freezed == actualDateStart
          ? _value.actualDateStart
          : actualDateStart // ignore: cast_nullable_to_non_nullable
              as dynamic,
      actualDateEnd: freezed == actualDateEnd
          ? _value.actualDateEnd
          : actualDateEnd // ignore: cast_nullable_to_non_nullable
              as dynamic,
      eu: freezed == eu
          ? _value.eu
          : eu // ignore: cast_nullable_to_non_nullable
              as dynamic,
      projectManager: freezed == projectManager
          ? _value.projectManager
          : projectManager // ignore: cast_nullable_to_non_nullable
              as int?,
      currentState: freezed == currentState
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as String?,
      priotity: freezed == priotity
          ? _value.priotity
          : priotity // ignore: cast_nullable_to_non_nullable
              as double?,
      poDate: freezed == poDate
          ? _value.poDate
          : poDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      endUser: freezed == endUser
          ? _value.endUser
          : endUser // ignore: cast_nullable_to_non_nullable
              as int?,
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
      customerCode: freezed == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      fullNameSale: freezed == fullNameSale
          ? _value.fullNameSale
          : fullNameSale // ignore: cast_nullable_to_non_nullable
              as String?,
      contactName: freezed == contactName
          ? _value.contactName
          : contactName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      contactPhone: freezed == contactPhone
          ? _value.contactPhone
          : contactPhone // ignore: cast_nullable_to_non_nullable
              as dynamic,
      contactEmail: freezed == contactEmail
          ? _value.contactEmail
          : contactEmail // ignore: cast_nullable_to_non_nullable
              as dynamic,
      fullNameTech: freezed == fullNameTech
          ? _value.fullNameTech
          : fullNameTech // ignore: cast_nullable_to_non_nullable
              as String?,
      projectStatusText: freezed == projectStatusText
          ? _value.projectStatusText
          : projectStatusText // ignore: cast_nullable_to_non_nullable
              as String?,
      fullNamePM: freezed == fullNamePM
          ? _value.fullNamePM
          : fullNamePM // ignore: cast_nullable_to_non_nullable
              as String?,
      personalPriotity: freezed == personalPriotity
          ? _value.personalPriotity
          : personalPriotity // ignore: cast_nullable_to_non_nullable
              as int?,
      projectStatusName: freezed == projectStatusName
          ? _value.projectStatusName
          : projectStatusName // ignore: cast_nullable_to_non_nullable
              as String?,
      pmId: freezed == pmId
          ? _value.pmId
          : pmId // ignore: cast_nullable_to_non_nullable
              as int?,
      endUserName: freezed == endUserName
          ? _value.endUserName
          : endUserName // ignore: cast_nullable_to_non_nullable
              as String?,
      dateLog: freezed == dateLog
          ? _value.dateLog
          : dateLog // ignore: cast_nullable_to_non_nullable
              as dynamic,
      expectedPlanDate: freezed == expectedPlanDate
          ? _value.expectedPlanDate
          : expectedPlanDate // ignore: cast_nullable_to_non_nullable
              as String?,
      expectedQuotationDate: freezed == expectedQuotationDate
          ? _value.expectedQuotationDate
          : expectedQuotationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      realityPlanDate: freezed == realityPlanDate
          ? _value.realityPlanDate
          : realityPlanDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      realityProjectEndDate: freezed == realityProjectEndDate
          ? _value.realityProjectEndDate
          : realityProjectEndDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rowNum: freezed == rowNum
          ? _value.rowNum
          : rowNum // ignore: cast_nullable_to_non_nullable
              as int?,
      priotityText: freezed == priotityText
          ? _value.priotityText
          : priotityText // ignore: cast_nullable_to_non_nullable
              as double?,
      projectRequestId: freezed == projectRequestId
          ? _value.projectRequestId
          : projectRequestId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectItemImplCopyWith<$Res>
    implements $ProjectItemCopyWith<$Res> {
  factory _$$ProjectItemImplCopyWith(
          _$ProjectItemImpl value, $Res Function(_$ProjectItemImpl) then) =
      __$$ProjectItemImplCopyWithImpl<$Res>;
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
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'IsApproved') dynamic isApproved,
      @JsonKey(name: 'ContactID') dynamic contactId,
      @JsonKey(name: 'PO') dynamic po,
      @JsonKey(name: 'ProjectType') dynamic projectType,
      @JsonKey(name: 'ListCostID') dynamic listCostId,
      @JsonKey(name: 'PlanDateStart') dynamic planDateStart,
      @JsonKey(name: 'PlanDateEnd') dynamic planDateEnd,
      @JsonKey(name: 'ActualDateStart') dynamic actualDateStart,
      @JsonKey(name: 'ActualDateEnd') dynamic actualDateEnd,
      @JsonKey(name: 'EU') dynamic eu,
      @JsonKey(name: 'ProjectManager') int? projectManager,
      @JsonKey(name: 'CurrentState') String? currentState,
      @JsonKey(name: 'Priotity') double? priotity,
      @JsonKey(name: 'PODate') dynamic poDate,
      @JsonKey(name: 'EndUser') int? endUser,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') String? updatedDate,
      @JsonKey(name: 'BusinessFieldID') int? businessFieldId,
      @JsonKey(name: 'TypeProject') int? typeProject,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'CustomerCode') String? customerCode,
      @JsonKey(name: 'CustomerName') String? customerName,
      @JsonKey(name: 'FullNameSale') String? fullNameSale,
      @JsonKey(name: 'ContactName') dynamic contactName,
      @JsonKey(name: 'ContactPhone') dynamic contactPhone,
      @JsonKey(name: 'ContactEmail') dynamic contactEmail,
      @JsonKey(name: 'FullNameTech') String? fullNameTech,
      @JsonKey(name: 'ProjectStatusText') String? projectStatusText,
      @JsonKey(name: 'FullNamePM') String? fullNamePM,
      @JsonKey(name: 'PersonalPriotity') int? personalPriotity,
      @JsonKey(name: 'ProjectStatusName') String? projectStatusName,
      @JsonKey(name: 'PMID') int? pmId,
      @JsonKey(name: 'EndUserName') String? endUserName,
      @JsonKey(name: 'DateLog') dynamic dateLog,
      @JsonKey(name: 'ExpectedPlanDate') String? expectedPlanDate,
      @JsonKey(name: 'ExpectedQuotationDate') String? expectedQuotationDate,
      @JsonKey(name: 'RealityPlanDate') dynamic realityPlanDate,
      @JsonKey(name: 'RealityProjectEndDate') dynamic realityProjectEndDate,
      @JsonKey(name: 'RowNum') int? rowNum,
      @JsonKey(name: 'PriotityText') double? priotityText,
      @JsonKey(name: 'ProjectRequestID') int? projectRequestId});
}

/// @nodoc
class __$$ProjectItemImplCopyWithImpl<$Res>
    extends _$ProjectItemCopyWithImpl<$Res, _$ProjectItemImpl>
    implements _$$ProjectItemImplCopyWith<$Res> {
  __$$ProjectItemImplCopyWithImpl(
      _$ProjectItemImpl _value, $Res Function(_$ProjectItemImpl) _then)
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
    Object? note = freezed,
    Object? isApproved = freezed,
    Object? contactId = freezed,
    Object? po = freezed,
    Object? projectType = freezed,
    Object? listCostId = freezed,
    Object? planDateStart = freezed,
    Object? planDateEnd = freezed,
    Object? actualDateStart = freezed,
    Object? actualDateEnd = freezed,
    Object? eu = freezed,
    Object? projectManager = freezed,
    Object? currentState = freezed,
    Object? priotity = freezed,
    Object? poDate = freezed,
    Object? endUser = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? businessFieldId = freezed,
    Object? typeProject = freezed,
    Object? isDeleted = freezed,
    Object? customerCode = freezed,
    Object? customerName = freezed,
    Object? fullNameSale = freezed,
    Object? contactName = freezed,
    Object? contactPhone = freezed,
    Object? contactEmail = freezed,
    Object? fullNameTech = freezed,
    Object? projectStatusText = freezed,
    Object? fullNamePM = freezed,
    Object? personalPriotity = freezed,
    Object? projectStatusName = freezed,
    Object? pmId = freezed,
    Object? endUserName = freezed,
    Object? dateLog = freezed,
    Object? expectedPlanDate = freezed,
    Object? expectedQuotationDate = freezed,
    Object? realityPlanDate = freezed,
    Object? realityProjectEndDate = freezed,
    Object? rowNum = freezed,
    Object? priotityText = freezed,
    Object? projectRequestId = freezed,
  }) {
    return _then(_$ProjectItemImpl(
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
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as dynamic,
      contactId: freezed == contactId
          ? _value.contactId
          : contactId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      po: freezed == po
          ? _value.po
          : po // ignore: cast_nullable_to_non_nullable
              as dynamic,
      projectType: freezed == projectType
          ? _value.projectType
          : projectType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      listCostId: freezed == listCostId
          ? _value.listCostId
          : listCostId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      planDateStart: freezed == planDateStart
          ? _value.planDateStart
          : planDateStart // ignore: cast_nullable_to_non_nullable
              as dynamic,
      planDateEnd: freezed == planDateEnd
          ? _value.planDateEnd
          : planDateEnd // ignore: cast_nullable_to_non_nullable
              as dynamic,
      actualDateStart: freezed == actualDateStart
          ? _value.actualDateStart
          : actualDateStart // ignore: cast_nullable_to_non_nullable
              as dynamic,
      actualDateEnd: freezed == actualDateEnd
          ? _value.actualDateEnd
          : actualDateEnd // ignore: cast_nullable_to_non_nullable
              as dynamic,
      eu: freezed == eu
          ? _value.eu
          : eu // ignore: cast_nullable_to_non_nullable
              as dynamic,
      projectManager: freezed == projectManager
          ? _value.projectManager
          : projectManager // ignore: cast_nullable_to_non_nullable
              as int?,
      currentState: freezed == currentState
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as String?,
      priotity: freezed == priotity
          ? _value.priotity
          : priotity // ignore: cast_nullable_to_non_nullable
              as double?,
      poDate: freezed == poDate
          ? _value.poDate
          : poDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      endUser: freezed == endUser
          ? _value.endUser
          : endUser // ignore: cast_nullable_to_non_nullable
              as int?,
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
      customerCode: freezed == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      fullNameSale: freezed == fullNameSale
          ? _value.fullNameSale
          : fullNameSale // ignore: cast_nullable_to_non_nullable
              as String?,
      contactName: freezed == contactName
          ? _value.contactName
          : contactName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      contactPhone: freezed == contactPhone
          ? _value.contactPhone
          : contactPhone // ignore: cast_nullable_to_non_nullable
              as dynamic,
      contactEmail: freezed == contactEmail
          ? _value.contactEmail
          : contactEmail // ignore: cast_nullable_to_non_nullable
              as dynamic,
      fullNameTech: freezed == fullNameTech
          ? _value.fullNameTech
          : fullNameTech // ignore: cast_nullable_to_non_nullable
              as String?,
      projectStatusText: freezed == projectStatusText
          ? _value.projectStatusText
          : projectStatusText // ignore: cast_nullable_to_non_nullable
              as String?,
      fullNamePM: freezed == fullNamePM
          ? _value.fullNamePM
          : fullNamePM // ignore: cast_nullable_to_non_nullable
              as String?,
      personalPriotity: freezed == personalPriotity
          ? _value.personalPriotity
          : personalPriotity // ignore: cast_nullable_to_non_nullable
              as int?,
      projectStatusName: freezed == projectStatusName
          ? _value.projectStatusName
          : projectStatusName // ignore: cast_nullable_to_non_nullable
              as String?,
      pmId: freezed == pmId
          ? _value.pmId
          : pmId // ignore: cast_nullable_to_non_nullable
              as int?,
      endUserName: freezed == endUserName
          ? _value.endUserName
          : endUserName // ignore: cast_nullable_to_non_nullable
              as String?,
      dateLog: freezed == dateLog
          ? _value.dateLog
          : dateLog // ignore: cast_nullable_to_non_nullable
              as dynamic,
      expectedPlanDate: freezed == expectedPlanDate
          ? _value.expectedPlanDate
          : expectedPlanDate // ignore: cast_nullable_to_non_nullable
              as String?,
      expectedQuotationDate: freezed == expectedQuotationDate
          ? _value.expectedQuotationDate
          : expectedQuotationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      realityPlanDate: freezed == realityPlanDate
          ? _value.realityPlanDate
          : realityPlanDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      realityProjectEndDate: freezed == realityProjectEndDate
          ? _value.realityProjectEndDate
          : realityProjectEndDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rowNum: freezed == rowNum
          ? _value.rowNum
          : rowNum // ignore: cast_nullable_to_non_nullable
              as int?,
      priotityText: freezed == priotityText
          ? _value.priotityText
          : priotityText // ignore: cast_nullable_to_non_nullable
              as double?,
      projectRequestId: freezed == projectRequestId
          ? _value.projectRequestId
          : projectRequestId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectItemImpl implements _ProjectItem {
  const _$ProjectItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'CustomerID') this.customerId,
      @JsonKey(name: 'ProjectCode') this.projectCode,
      @JsonKey(name: 'ProjectName') this.projectName,
      @JsonKey(name: 'ProjectShortName') this.projectShortName,
      @JsonKey(name: 'ProjectStatus') this.projectStatus,
      @JsonKey(name: 'UserID') this.userId,
      @JsonKey(name: 'UserTechnicalID') this.userTechnicalId,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'IsApproved') this.isApproved,
      @JsonKey(name: 'ContactID') this.contactId,
      @JsonKey(name: 'PO') this.po,
      @JsonKey(name: 'ProjectType') this.projectType,
      @JsonKey(name: 'ListCostID') this.listCostId,
      @JsonKey(name: 'PlanDateStart') this.planDateStart,
      @JsonKey(name: 'PlanDateEnd') this.planDateEnd,
      @JsonKey(name: 'ActualDateStart') this.actualDateStart,
      @JsonKey(name: 'ActualDateEnd') this.actualDateEnd,
      @JsonKey(name: 'EU') this.eu,
      @JsonKey(name: 'ProjectManager') this.projectManager,
      @JsonKey(name: 'CurrentState') this.currentState,
      @JsonKey(name: 'Priotity') this.priotity,
      @JsonKey(name: 'PODate') this.poDate,
      @JsonKey(name: 'EndUser') this.endUser,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'BusinessFieldID') this.businessFieldId,
      @JsonKey(name: 'TypeProject') this.typeProject,
      @JsonKey(name: 'IsDeleted') this.isDeleted,
      @JsonKey(name: 'CustomerCode') this.customerCode,
      @JsonKey(name: 'CustomerName') this.customerName,
      @JsonKey(name: 'FullNameSale') this.fullNameSale,
      @JsonKey(name: 'ContactName') this.contactName,
      @JsonKey(name: 'ContactPhone') this.contactPhone,
      @JsonKey(name: 'ContactEmail') this.contactEmail,
      @JsonKey(name: 'FullNameTech') this.fullNameTech,
      @JsonKey(name: 'ProjectStatusText') this.projectStatusText,
      @JsonKey(name: 'FullNamePM') this.fullNamePM,
      @JsonKey(name: 'PersonalPriotity') this.personalPriotity,
      @JsonKey(name: 'ProjectStatusName') this.projectStatusName,
      @JsonKey(name: 'PMID') this.pmId,
      @JsonKey(name: 'EndUserName') this.endUserName,
      @JsonKey(name: 'DateLog') this.dateLog,
      @JsonKey(name: 'ExpectedPlanDate') this.expectedPlanDate,
      @JsonKey(name: 'ExpectedQuotationDate') this.expectedQuotationDate,
      @JsonKey(name: 'RealityPlanDate') this.realityPlanDate,
      @JsonKey(name: 'RealityProjectEndDate') this.realityProjectEndDate,
      @JsonKey(name: 'RowNum') this.rowNum,
      @JsonKey(name: 'PriotityText') this.priotityText,
      @JsonKey(name: 'ProjectRequestID') this.projectRequestId});

  factory _$ProjectItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectItemImplFromJson(json);

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
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'IsApproved')
  final dynamic isApproved;
  @override
  @JsonKey(name: 'ContactID')
  final dynamic contactId;
  @override
  @JsonKey(name: 'PO')
  final dynamic po;
  @override
  @JsonKey(name: 'ProjectType')
  final dynamic projectType;
  @override
  @JsonKey(name: 'ListCostID')
  final dynamic listCostId;
  @override
  @JsonKey(name: 'PlanDateStart')
  final dynamic planDateStart;
  @override
  @JsonKey(name: 'PlanDateEnd')
  final dynamic planDateEnd;
  @override
  @JsonKey(name: 'ActualDateStart')
  final dynamic actualDateStart;
  @override
  @JsonKey(name: 'ActualDateEnd')
  final dynamic actualDateEnd;
  @override
  @JsonKey(name: 'EU')
  final dynamic eu;
  @override
  @JsonKey(name: 'ProjectManager')
  final int? projectManager;
  @override
  @JsonKey(name: 'CurrentState')
  final String? currentState;
  @override
  @JsonKey(name: 'Priotity')
  final double? priotity;
  @override
  @JsonKey(name: 'PODate')
  final dynamic poDate;
  @override
  @JsonKey(name: 'EndUser')
  final int? endUser;
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
  @JsonKey(name: 'BusinessFieldID')
  final int? businessFieldId;
  @override
  @JsonKey(name: 'TypeProject')
  final int? typeProject;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;
  @override
  @JsonKey(name: 'CustomerCode')
  final String? customerCode;
  @override
  @JsonKey(name: 'CustomerName')
  final String? customerName;
  @override
  @JsonKey(name: 'FullNameSale')
  final String? fullNameSale;
  @override
  @JsonKey(name: 'ContactName')
  final dynamic contactName;
  @override
  @JsonKey(name: 'ContactPhone')
  final dynamic contactPhone;
  @override
  @JsonKey(name: 'ContactEmail')
  final dynamic contactEmail;
  @override
  @JsonKey(name: 'FullNameTech')
  final String? fullNameTech;
  @override
  @JsonKey(name: 'ProjectStatusText')
  final String? projectStatusText;
  @override
  @JsonKey(name: 'FullNamePM')
  final String? fullNamePM;
  @override
  @JsonKey(name: 'PersonalPriotity')
  final int? personalPriotity;
  @override
  @JsonKey(name: 'ProjectStatusName')
  final String? projectStatusName;
  @override
  @JsonKey(name: 'PMID')
  final int? pmId;
  @override
  @JsonKey(name: 'EndUserName')
  final String? endUserName;
  @override
  @JsonKey(name: 'DateLog')
  final dynamic dateLog;
  @override
  @JsonKey(name: 'ExpectedPlanDate')
  final String? expectedPlanDate;
  @override
  @JsonKey(name: 'ExpectedQuotationDate')
  final String? expectedQuotationDate;
  @override
  @JsonKey(name: 'RealityPlanDate')
  final dynamic realityPlanDate;
  @override
  @JsonKey(name: 'RealityProjectEndDate')
  final dynamic realityProjectEndDate;
  @override
  @JsonKey(name: 'RowNum')
  final int? rowNum;
  @override
  @JsonKey(name: 'PriotityText')
  final double? priotityText;

  /// ID của yêu cầu dự án - dùng để gọi API giải pháp.
  @override
  @JsonKey(name: 'ProjectRequestID')
  final int? projectRequestId;

  @override
  String toString() {
    return 'ProjectItem(id: $id, customerId: $customerId, projectCode: $projectCode, projectName: $projectName, projectShortName: $projectShortName, projectStatus: $projectStatus, userId: $userId, userTechnicalId: $userTechnicalId, note: $note, isApproved: $isApproved, contactId: $contactId, po: $po, projectType: $projectType, listCostId: $listCostId, planDateStart: $planDateStart, planDateEnd: $planDateEnd, actualDateStart: $actualDateStart, actualDateEnd: $actualDateEnd, eu: $eu, projectManager: $projectManager, currentState: $currentState, priotity: $priotity, poDate: $poDate, endUser: $endUser, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate, businessFieldId: $businessFieldId, typeProject: $typeProject, isDeleted: $isDeleted, customerCode: $customerCode, customerName: $customerName, fullNameSale: $fullNameSale, contactName: $contactName, contactPhone: $contactPhone, contactEmail: $contactEmail, fullNameTech: $fullNameTech, projectStatusText: $projectStatusText, fullNamePM: $fullNamePM, personalPriotity: $personalPriotity, projectStatusName: $projectStatusName, pmId: $pmId, endUserName: $endUserName, dateLog: $dateLog, expectedPlanDate: $expectedPlanDate, expectedQuotationDate: $expectedQuotationDate, realityPlanDate: $realityPlanDate, realityProjectEndDate: $realityProjectEndDate, rowNum: $rowNum, priotityText: $priotityText, projectRequestId: $projectRequestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectItemImpl &&
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
            (identical(other.note, note) || other.note == note) &&
            const DeepCollectionEquality()
                .equals(other.isApproved, isApproved) &&
            const DeepCollectionEquality().equals(other.contactId, contactId) &&
            const DeepCollectionEquality().equals(other.po, po) &&
            const DeepCollectionEquality()
                .equals(other.projectType, projectType) &&
            const DeepCollectionEquality()
                .equals(other.listCostId, listCostId) &&
            const DeepCollectionEquality()
                .equals(other.planDateStart, planDateStart) &&
            const DeepCollectionEquality()
                .equals(other.planDateEnd, planDateEnd) &&
            const DeepCollectionEquality()
                .equals(other.actualDateStart, actualDateStart) &&
            const DeepCollectionEquality()
                .equals(other.actualDateEnd, actualDateEnd) &&
            const DeepCollectionEquality().equals(other.eu, eu) &&
            (identical(other.projectManager, projectManager) ||
                other.projectManager == projectManager) &&
            (identical(other.currentState, currentState) ||
                other.currentState == currentState) &&
            (identical(other.priotity, priotity) ||
                other.priotity == priotity) &&
            const DeepCollectionEquality().equals(other.poDate, poDate) &&
            (identical(other.endUser, endUser) || other.endUser == endUser) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.businessFieldId, businessFieldId) ||
                other.businessFieldId == businessFieldId) &&
            (identical(other.typeProject, typeProject) ||
                other.typeProject == typeProject) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.fullNameSale, fullNameSale) ||
                other.fullNameSale == fullNameSale) &&
            const DeepCollectionEquality()
                .equals(other.contactName, contactName) &&
            const DeepCollectionEquality()
                .equals(other.contactPhone, contactPhone) &&
            const DeepCollectionEquality()
                .equals(other.contactEmail, contactEmail) &&
            (identical(other.fullNameTech, fullNameTech) ||
                other.fullNameTech == fullNameTech) &&
            (identical(other.projectStatusText, projectStatusText) ||
                other.projectStatusText == projectStatusText) &&
            (identical(other.fullNamePM, fullNamePM) ||
                other.fullNamePM == fullNamePM) &&
            (identical(other.personalPriotity, personalPriotity) ||
                other.personalPriotity == personalPriotity) &&
            (identical(other.projectStatusName, projectStatusName) ||
                other.projectStatusName == projectStatusName) &&
            (identical(other.pmId, pmId) || other.pmId == pmId) &&
            (identical(other.endUserName, endUserName) ||
                other.endUserName == endUserName) &&
            const DeepCollectionEquality().equals(other.dateLog, dateLog) &&
            (identical(other.expectedPlanDate, expectedPlanDate) ||
                other.expectedPlanDate == expectedPlanDate) &&
            (identical(other.expectedQuotationDate, expectedQuotationDate) ||
                other.expectedQuotationDate == expectedQuotationDate) &&
            const DeepCollectionEquality()
                .equals(other.realityPlanDate, realityPlanDate) &&
            const DeepCollectionEquality()
                .equals(other.realityProjectEndDate, realityProjectEndDate) &&
            (identical(other.rowNum, rowNum) || other.rowNum == rowNum) &&
            (identical(other.priotityText, priotityText) ||
                other.priotityText == priotityText) &&
            (identical(other.projectRequestId, projectRequestId) ||
                other.projectRequestId == projectRequestId));
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
        note,
        const DeepCollectionEquality().hash(isApproved),
        const DeepCollectionEquality().hash(contactId),
        const DeepCollectionEquality().hash(po),
        const DeepCollectionEquality().hash(projectType),
        const DeepCollectionEquality().hash(listCostId),
        const DeepCollectionEquality().hash(planDateStart),
        const DeepCollectionEquality().hash(planDateEnd),
        const DeepCollectionEquality().hash(actualDateStart),
        const DeepCollectionEquality().hash(actualDateEnd),
        const DeepCollectionEquality().hash(eu),
        projectManager,
        currentState,
        priotity,
        const DeepCollectionEquality().hash(poDate),
        endUser,
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        businessFieldId,
        typeProject,
        isDeleted,
        customerCode,
        customerName,
        fullNameSale,
        const DeepCollectionEquality().hash(contactName),
        const DeepCollectionEquality().hash(contactPhone),
        const DeepCollectionEquality().hash(contactEmail),
        fullNameTech,
        projectStatusText,
        fullNamePM,
        personalPriotity,
        projectStatusName,
        pmId,
        endUserName,
        const DeepCollectionEquality().hash(dateLog),
        expectedPlanDate,
        expectedQuotationDate,
        const DeepCollectionEquality().hash(realityPlanDate),
        const DeepCollectionEquality().hash(realityProjectEndDate),
        rowNum,
        priotityText,
        projectRequestId
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectItemImplCopyWith<_$ProjectItemImpl> get copyWith =>
      __$$ProjectItemImplCopyWithImpl<_$ProjectItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectItemImplToJson(
      this,
    );
  }
}

abstract class _ProjectItem implements ProjectItem {
  const factory _ProjectItem(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'CustomerID') final int? customerId,
          @JsonKey(name: 'ProjectCode') final String? projectCode,
          @JsonKey(name: 'ProjectName') final String? projectName,
          @JsonKey(name: 'ProjectShortName') final String? projectShortName,
          @JsonKey(name: 'ProjectStatus') final int? projectStatus,
          @JsonKey(name: 'UserID') final int? userId,
          @JsonKey(name: 'UserTechnicalID') final int? userTechnicalId,
          @JsonKey(name: 'Note') final String? note,
          @JsonKey(name: 'IsApproved') final dynamic isApproved,
          @JsonKey(name: 'ContactID') final dynamic contactId,
          @JsonKey(name: 'PO') final dynamic po,
          @JsonKey(name: 'ProjectType') final dynamic projectType,
          @JsonKey(name: 'ListCostID') final dynamic listCostId,
          @JsonKey(name: 'PlanDateStart') final dynamic planDateStart,
          @JsonKey(name: 'PlanDateEnd') final dynamic planDateEnd,
          @JsonKey(name: 'ActualDateStart') final dynamic actualDateStart,
          @JsonKey(name: 'ActualDateEnd') final dynamic actualDateEnd,
          @JsonKey(name: 'EU') final dynamic eu,
          @JsonKey(name: 'ProjectManager') final int? projectManager,
          @JsonKey(name: 'CurrentState') final String? currentState,
          @JsonKey(name: 'Priotity') final double? priotity,
          @JsonKey(name: 'PODate') final dynamic poDate,
          @JsonKey(name: 'EndUser') final int? endUser,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'CreatedDate') final String? createdDate,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy,
          @JsonKey(name: 'UpdatedDate') final String? updatedDate,
          @JsonKey(name: 'BusinessFieldID') final int? businessFieldId,
          @JsonKey(name: 'TypeProject') final int? typeProject,
          @JsonKey(name: 'IsDeleted') final bool? isDeleted,
          @JsonKey(name: 'CustomerCode') final String? customerCode,
          @JsonKey(name: 'CustomerName') final String? customerName,
          @JsonKey(name: 'FullNameSale') final String? fullNameSale,
          @JsonKey(name: 'ContactName') final dynamic contactName,
          @JsonKey(name: 'ContactPhone') final dynamic contactPhone,
          @JsonKey(name: 'ContactEmail') final dynamic contactEmail,
          @JsonKey(name: 'FullNameTech') final String? fullNameTech,
          @JsonKey(name: 'ProjectStatusText') final String? projectStatusText,
          @JsonKey(name: 'FullNamePM') final String? fullNamePM,
          @JsonKey(name: 'PersonalPriotity') final int? personalPriotity,
          @JsonKey(name: 'ProjectStatusName') final String? projectStatusName,
          @JsonKey(name: 'PMID') final int? pmId,
          @JsonKey(name: 'EndUserName') final String? endUserName,
          @JsonKey(name: 'DateLog') final dynamic dateLog,
          @JsonKey(name: 'ExpectedPlanDate') final String? expectedPlanDate,
          @JsonKey(name: 'ExpectedQuotationDate')
          final String? expectedQuotationDate,
          @JsonKey(name: 'RealityPlanDate') final dynamic realityPlanDate,
          @JsonKey(name: 'RealityProjectEndDate')
          final dynamic realityProjectEndDate,
          @JsonKey(name: 'RowNum') final int? rowNum,
          @JsonKey(name: 'PriotityText') final double? priotityText,
          @JsonKey(name: 'ProjectRequestID') final int? projectRequestId}) =
      _$ProjectItemImpl;

  factory _ProjectItem.fromJson(Map<String, dynamic> json) =
      _$ProjectItemImpl.fromJson;

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
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'IsApproved')
  dynamic get isApproved;
  @override
  @JsonKey(name: 'ContactID')
  dynamic get contactId;
  @override
  @JsonKey(name: 'PO')
  dynamic get po;
  @override
  @JsonKey(name: 'ProjectType')
  dynamic get projectType;
  @override
  @JsonKey(name: 'ListCostID')
  dynamic get listCostId;
  @override
  @JsonKey(name: 'PlanDateStart')
  dynamic get planDateStart;
  @override
  @JsonKey(name: 'PlanDateEnd')
  dynamic get planDateEnd;
  @override
  @JsonKey(name: 'ActualDateStart')
  dynamic get actualDateStart;
  @override
  @JsonKey(name: 'ActualDateEnd')
  dynamic get actualDateEnd;
  @override
  @JsonKey(name: 'EU')
  dynamic get eu;
  @override
  @JsonKey(name: 'ProjectManager')
  int? get projectManager;
  @override
  @JsonKey(name: 'CurrentState')
  String? get currentState;
  @override
  @JsonKey(name: 'Priotity')
  double? get priotity;
  @override
  @JsonKey(name: 'PODate')
  dynamic get poDate;
  @override
  @JsonKey(name: 'EndUser')
  int? get endUser;
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
  @JsonKey(name: 'BusinessFieldID')
  int? get businessFieldId;
  @override
  @JsonKey(name: 'TypeProject')
  int? get typeProject;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(name: 'CustomerCode')
  String? get customerCode;
  @override
  @JsonKey(name: 'CustomerName')
  String? get customerName;
  @override
  @JsonKey(name: 'FullNameSale')
  String? get fullNameSale;
  @override
  @JsonKey(name: 'ContactName')
  dynamic get contactName;
  @override
  @JsonKey(name: 'ContactPhone')
  dynamic get contactPhone;
  @override
  @JsonKey(name: 'ContactEmail')
  dynamic get contactEmail;
  @override
  @JsonKey(name: 'FullNameTech')
  String? get fullNameTech;
  @override
  @JsonKey(name: 'ProjectStatusText')
  String? get projectStatusText;
  @override
  @JsonKey(name: 'FullNamePM')
  String? get fullNamePM;
  @override
  @JsonKey(name: 'PersonalPriotity')
  int? get personalPriotity;
  @override
  @JsonKey(name: 'ProjectStatusName')
  String? get projectStatusName;
  @override
  @JsonKey(name: 'PMID')
  int? get pmId;
  @override
  @JsonKey(name: 'EndUserName')
  String? get endUserName;
  @override
  @JsonKey(name: 'DateLog')
  dynamic get dateLog;
  @override
  @JsonKey(name: 'ExpectedPlanDate')
  String? get expectedPlanDate;
  @override
  @JsonKey(name: 'ExpectedQuotationDate')
  String? get expectedQuotationDate;
  @override
  @JsonKey(name: 'RealityPlanDate')
  dynamic get realityPlanDate;
  @override
  @JsonKey(name: 'RealityProjectEndDate')
  dynamic get realityProjectEndDate;
  @override
  @JsonKey(name: 'RowNum')
  int? get rowNum;
  @override
  @JsonKey(name: 'PriotityText')
  double? get priotityText;
  @override

  /// ID của yêu cầu dự án - dùng để gọi API giải pháp.
  @JsonKey(name: 'ProjectRequestID')
  int? get projectRequestId;
  @override
  @JsonKey(ignore: true)
  _$$ProjectItemImplCopyWith<_$ProjectItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
