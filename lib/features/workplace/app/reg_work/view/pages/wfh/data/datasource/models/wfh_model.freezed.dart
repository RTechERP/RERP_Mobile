// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wfh_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WfhItem _$WfhItemFromJson(Map<String, dynamic> json) {
  return _WfhItem.fromJson(json);
}

/// @nodoc
mixin _$WfhItem {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedID')
  int? get approvedId => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApproved')
  bool? get isApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'Reason')
  String? get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateWFH')
  DateTime? get dateWFH => throw _privateConstructorUsedError;
  @JsonKey(name: 'TimeWFH')
  int? get timeWFH => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalDay')
  double? get totalDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedHR')
  int? get approvedHR => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedHR')
  bool? get isApprovedHR => throw _privateConstructorUsedError;
  @JsonKey(name: 'DecilineApprove')
  int? get decilineApprove => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReasonDeciline')
  String? get reasonDeciline => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReasonHREdit')
  String? get reasonHREdit => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsProblem')
  bool? get isProblem => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContentWork')
  String? get contentWork => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedBGD')
  bool? get isApprovedBGD => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedBGDID')
  int? get approvedBGDID => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateApprovedBGD')
  DateTime? get dateApprovedBGD => throw _privateConstructorUsedError;
  @JsonKey(name: 'EvaluateResults')
  String? get evaluateResults => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsSeniorApproved')
  int? get isSeniorApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedSeniorID')
  int? get approvedSeniorID => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateApprovedSenior')
  DateTime? get dateApprovedSenior => throw _privateConstructorUsedError;
  @JsonKey(name: 'DecilineApproveSenior')
  int? get decilineApproveSenior => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReasonDecilineSenior')
  String? get reasonDecilineSenior => throw _privateConstructorUsedError;
  @JsonKey(name: 'RowNumber')
  int? get rowNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatDay')
  DateTime? get creatDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeName')
  String? get employeeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentID')
  int? get departmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedName')
  String? get approvedName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentName')
  String? get departmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'TimeWFHText')
  String? get timeWFHText => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusNumber')
  int? get statusNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusHRNumber')
  int? get statusHRNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullNameBGD')
  String? get fullNameBGD => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusText')
  String? get statusText => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusHRText')
  String? get statusHRText => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedBGDText')
  String? get isApprovedBGDText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WfhItemCopyWith<WfhItem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WfhItemCopyWith<$Res> {
  factory $WfhItemCopyWith(WfhItem value, $Res Function(WfhItem) then) =
      _$WfhItemCopyWithImpl<$Res, WfhItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'ApprovedID') int? approvedId,
      @JsonKey(name: 'IsApproved') bool? isApproved,
      @JsonKey(name: 'Reason') String? reason,
      @JsonKey(name: 'DateWFH') DateTime? dateWFH,
      @JsonKey(name: 'TimeWFH') int? timeWFH,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'TotalDay') double? totalDay,
      @JsonKey(name: 'ApprovedHR') int? approvedHR,
      @JsonKey(name: 'IsApprovedHR') bool? isApprovedHR,
      @JsonKey(name: 'DecilineApprove') int? decilineApprove,
      @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
      @JsonKey(name: 'ReasonHREdit') String? reasonHREdit,
      @JsonKey(name: 'IsProblem') bool? isProblem,
      @JsonKey(name: 'ContentWork') String? contentWork,
      @JsonKey(name: 'IsApprovedBGD') bool? isApprovedBGD,
      @JsonKey(name: 'ApprovedBGDID') int? approvedBGDID,
      @JsonKey(name: 'DateApprovedBGD') DateTime? dateApprovedBGD,
      @JsonKey(name: 'EvaluateResults') String? evaluateResults,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'IsSeniorApproved') int? isSeniorApproved,
      @JsonKey(name: 'ApprovedSeniorID') int? approvedSeniorID,
      @JsonKey(name: 'DateApprovedSenior') DateTime? dateApprovedSenior,
      @JsonKey(name: 'DecilineApproveSenior') int? decilineApproveSenior,
      @JsonKey(name: 'ReasonDecilineSenior') String? reasonDecilineSenior,
      @JsonKey(name: 'RowNumber') int? rowNumber,
      @JsonKey(name: 'CreatDay') DateTime? creatDay,
      @JsonKey(name: 'EmployeeName') String? employeeName,
      @JsonKey(name: 'DepartmentID') int? departmentId,
      @JsonKey(name: 'ApprovedName') String? approvedName,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'TimeWFHText') String? timeWFHText,
      @JsonKey(name: 'StatusNumber') int? statusNumber,
      @JsonKey(name: 'StatusHRNumber') int? statusHRNumber,
      @JsonKey(name: 'FullNameBGD') String? fullNameBGD,
      @JsonKey(name: 'StatusText') String? statusText,
      @JsonKey(name: 'StatusHRText') String? statusHRText,
      @JsonKey(name: 'IsApprovedBGDText') String? isApprovedBGDText});
}

/// @nodoc
class _$WfhItemCopyWithImpl<$Res, $Val extends WfhItem>
    implements $WfhItemCopyWith<$Res> {
  _$WfhItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? employeeId = freezed,
    Object? approvedId = freezed,
    Object? isApproved = freezed,
    Object? reason = freezed,
    Object? dateWFH = freezed,
    Object? timeWFH = freezed,
    Object? note = freezed,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? updatedDate = freezed,
    Object? updatedBy = freezed,
    Object? totalDay = freezed,
    Object? approvedHR = freezed,
    Object? isApprovedHR = freezed,
    Object? decilineApprove = freezed,
    Object? reasonDeciline = freezed,
    Object? reasonHREdit = freezed,
    Object? isProblem = freezed,
    Object? contentWork = freezed,
    Object? isApprovedBGD = freezed,
    Object? approvedBGDID = freezed,
    Object? dateApprovedBGD = freezed,
    Object? evaluateResults = freezed,
    Object? isDeleted = freezed,
    Object? isSeniorApproved = freezed,
    Object? approvedSeniorID = freezed,
    Object? dateApprovedSenior = freezed,
    Object? decilineApproveSenior = freezed,
    Object? reasonDecilineSenior = freezed,
    Object? rowNumber = freezed,
    Object? creatDay = freezed,
    Object? employeeName = freezed,
    Object? departmentId = freezed,
    Object? approvedName = freezed,
    Object? departmentName = freezed,
    Object? timeWFHText = freezed,
    Object? statusNumber = freezed,
    Object? statusHRNumber = freezed,
    Object? fullNameBGD = freezed,
    Object? statusText = freezed,
    Object? statusHRText = freezed,
    Object? isApprovedBGDText = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      approvedId: freezed == approvedId
          ? _value.approvedId
          : approvedId // ignore: cast_nullable_to_non_nullable
              as int?,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      dateWFH: freezed == dateWFH
          ? _value.dateWFH
          : dateWFH // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeWFH: freezed == timeWFH
          ? _value.timeWFH
          : timeWFH // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      totalDay: freezed == totalDay
          ? _value.totalDay
          : totalDay // ignore: cast_nullable_to_non_nullable
              as double?,
      approvedHR: freezed == approvedHR
          ? _value.approvedHR
          : approvedHR // ignore: cast_nullable_to_non_nullable
              as int?,
      isApprovedHR: freezed == isApprovedHR
          ? _value.isApprovedHR
          : isApprovedHR // ignore: cast_nullable_to_non_nullable
              as bool?,
      decilineApprove: freezed == decilineApprove
          ? _value.decilineApprove
          : decilineApprove // ignore: cast_nullable_to_non_nullable
              as int?,
      reasonDeciline: freezed == reasonDeciline
          ? _value.reasonDeciline
          : reasonDeciline // ignore: cast_nullable_to_non_nullable
              as String?,
      reasonHREdit: freezed == reasonHREdit
          ? _value.reasonHREdit
          : reasonHREdit // ignore: cast_nullable_to_non_nullable
              as String?,
      isProblem: freezed == isProblem
          ? _value.isProblem
          : isProblem // ignore: cast_nullable_to_non_nullable
              as bool?,
      contentWork: freezed == contentWork
          ? _value.contentWork
          : contentWork // ignore: cast_nullable_to_non_nullable
              as String?,
      isApprovedBGD: freezed == isApprovedBGD
          ? _value.isApprovedBGD
          : isApprovedBGD // ignore: cast_nullable_to_non_nullable
              as bool?,
      approvedBGDID: freezed == approvedBGDID
          ? _value.approvedBGDID
          : approvedBGDID // ignore: cast_nullable_to_non_nullable
              as int?,
      dateApprovedBGD: freezed == dateApprovedBGD
          ? _value.dateApprovedBGD
          : dateApprovedBGD // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      evaluateResults: freezed == evaluateResults
          ? _value.evaluateResults
          : evaluateResults // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSeniorApproved: freezed == isSeniorApproved
          ? _value.isSeniorApproved
          : isSeniorApproved // ignore: cast_nullable_to_non_nullable
              as int?,
      approvedSeniorID: freezed == approvedSeniorID
          ? _value.approvedSeniorID
          : approvedSeniorID // ignore: cast_nullable_to_non_nullable
              as int?,
      dateApprovedSenior: freezed == dateApprovedSenior
          ? _value.dateApprovedSenior
          : dateApprovedSenior // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      decilineApproveSenior: freezed == decilineApproveSenior
          ? _value.decilineApproveSenior
          : decilineApproveSenior // ignore: cast_nullable_to_non_nullable
              as int?,
      reasonDecilineSenior: freezed == reasonDecilineSenior
          ? _value.reasonDecilineSenior
          : reasonDecilineSenior // ignore: cast_nullable_to_non_nullable
              as String?,
      rowNumber: freezed == rowNumber
          ? _value.rowNumber
          : rowNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      creatDay: freezed == creatDay
          ? _value.creatDay
          : creatDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      approvedName: freezed == approvedName
          ? _value.approvedName
          : approvedName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      timeWFHText: freezed == timeWFHText
          ? _value.timeWFHText
          : timeWFHText // ignore: cast_nullable_to_non_nullable
              as String?,
      statusNumber: freezed == statusNumber
          ? _value.statusNumber
          : statusNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      statusHRNumber: freezed == statusHRNumber
          ? _value.statusHRNumber
          : statusHRNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      fullNameBGD: freezed == fullNameBGD
          ? _value.fullNameBGD
          : fullNameBGD // ignore: cast_nullable_to_non_nullable
              as String?,
      statusText: freezed == statusText
          ? _value.statusText
          : statusText // ignore: cast_nullable_to_non_nullable
              as String?,
      statusHRText: freezed == statusHRText
          ? _value.statusHRText
          : statusHRText // ignore: cast_nullable_to_non_nullable
              as String?,
      isApprovedBGDText: freezed == isApprovedBGDText
          ? _value.isApprovedBGDText
          : isApprovedBGDText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WfhItemImplCopyWith<$Res> implements $WfhItemCopyWith<$Res> {
  factory _$$WfhItemImplCopyWith(
          _$WfhItemImpl value, $Res Function(_$WfhItemImpl) then) =
      __$$WfhItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'ApprovedID') int? approvedId,
      @JsonKey(name: 'IsApproved') bool? isApproved,
      @JsonKey(name: 'Reason') String? reason,
      @JsonKey(name: 'DateWFH') DateTime? dateWFH,
      @JsonKey(name: 'TimeWFH') int? timeWFH,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'TotalDay') double? totalDay,
      @JsonKey(name: 'ApprovedHR') int? approvedHR,
      @JsonKey(name: 'IsApprovedHR') bool? isApprovedHR,
      @JsonKey(name: 'DecilineApprove') int? decilineApprove,
      @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
      @JsonKey(name: 'ReasonHREdit') String? reasonHREdit,
      @JsonKey(name: 'IsProblem') bool? isProblem,
      @JsonKey(name: 'ContentWork') String? contentWork,
      @JsonKey(name: 'IsApprovedBGD') bool? isApprovedBGD,
      @JsonKey(name: 'ApprovedBGDID') int? approvedBGDID,
      @JsonKey(name: 'DateApprovedBGD') DateTime? dateApprovedBGD,
      @JsonKey(name: 'EvaluateResults') String? evaluateResults,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'IsSeniorApproved') int? isSeniorApproved,
      @JsonKey(name: 'ApprovedSeniorID') int? approvedSeniorID,
      @JsonKey(name: 'DateApprovedSenior') DateTime? dateApprovedSenior,
      @JsonKey(name: 'DecilineApproveSenior') int? decilineApproveSenior,
      @JsonKey(name: 'ReasonDecilineSenior') String? reasonDecilineSenior,
      @JsonKey(name: 'RowNumber') int? rowNumber,
      @JsonKey(name: 'CreatDay') DateTime? creatDay,
      @JsonKey(name: 'EmployeeName') String? employeeName,
      @JsonKey(name: 'DepartmentID') int? departmentId,
      @JsonKey(name: 'ApprovedName') String? approvedName,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'TimeWFHText') String? timeWFHText,
      @JsonKey(name: 'StatusNumber') int? statusNumber,
      @JsonKey(name: 'StatusHRNumber') int? statusHRNumber,
      @JsonKey(name: 'FullNameBGD') String? fullNameBGD,
      @JsonKey(name: 'StatusText') String? statusText,
      @JsonKey(name: 'StatusHRText') String? statusHRText,
      @JsonKey(name: 'IsApprovedBGDText') String? isApprovedBGDText});
}

/// @nodoc
class __$$WfhItemImplCopyWithImpl<$Res>
    extends _$WfhItemCopyWithImpl<$Res, _$WfhItemImpl>
    implements _$$WfhItemImplCopyWith<$Res> {
  __$$WfhItemImplCopyWithImpl(
      _$WfhItemImpl _value, $Res Function(_$WfhItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? employeeId = freezed,
    Object? approvedId = freezed,
    Object? isApproved = freezed,
    Object? reason = freezed,
    Object? dateWFH = freezed,
    Object? timeWFH = freezed,
    Object? note = freezed,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? updatedDate = freezed,
    Object? updatedBy = freezed,
    Object? totalDay = freezed,
    Object? approvedHR = freezed,
    Object? isApprovedHR = freezed,
    Object? decilineApprove = freezed,
    Object? reasonDeciline = freezed,
    Object? reasonHREdit = freezed,
    Object? isProblem = freezed,
    Object? contentWork = freezed,
    Object? isApprovedBGD = freezed,
    Object? approvedBGDID = freezed,
    Object? dateApprovedBGD = freezed,
    Object? evaluateResults = freezed,
    Object? isDeleted = freezed,
    Object? isSeniorApproved = freezed,
    Object? approvedSeniorID = freezed,
    Object? dateApprovedSenior = freezed,
    Object? decilineApproveSenior = freezed,
    Object? reasonDecilineSenior = freezed,
    Object? rowNumber = freezed,
    Object? creatDay = freezed,
    Object? employeeName = freezed,
    Object? departmentId = freezed,
    Object? approvedName = freezed,
    Object? departmentName = freezed,
    Object? timeWFHText = freezed,
    Object? statusNumber = freezed,
    Object? statusHRNumber = freezed,
    Object? fullNameBGD = freezed,
    Object? statusText = freezed,
    Object? statusHRText = freezed,
    Object? isApprovedBGDText = freezed,
  }) {
    return _then(_$WfhItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      approvedId: freezed == approvedId
          ? _value.approvedId
          : approvedId // ignore: cast_nullable_to_non_nullable
              as int?,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      dateWFH: freezed == dateWFH
          ? _value.dateWFH
          : dateWFH // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeWFH: freezed == timeWFH
          ? _value.timeWFH
          : timeWFH // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      totalDay: freezed == totalDay
          ? _value.totalDay
          : totalDay // ignore: cast_nullable_to_non_nullable
              as double?,
      approvedHR: freezed == approvedHR
          ? _value.approvedHR
          : approvedHR // ignore: cast_nullable_to_non_nullable
              as int?,
      isApprovedHR: freezed == isApprovedHR
          ? _value.isApprovedHR
          : isApprovedHR // ignore: cast_nullable_to_non_nullable
              as bool?,
      decilineApprove: freezed == decilineApprove
          ? _value.decilineApprove
          : decilineApprove // ignore: cast_nullable_to_non_nullable
              as int?,
      reasonDeciline: freezed == reasonDeciline
          ? _value.reasonDeciline
          : reasonDeciline // ignore: cast_nullable_to_non_nullable
              as String?,
      reasonHREdit: freezed == reasonHREdit
          ? _value.reasonHREdit
          : reasonHREdit // ignore: cast_nullable_to_non_nullable
              as String?,
      isProblem: freezed == isProblem
          ? _value.isProblem
          : isProblem // ignore: cast_nullable_to_non_nullable
              as bool?,
      contentWork: freezed == contentWork
          ? _value.contentWork
          : contentWork // ignore: cast_nullable_to_non_nullable
              as String?,
      isApprovedBGD: freezed == isApprovedBGD
          ? _value.isApprovedBGD
          : isApprovedBGD // ignore: cast_nullable_to_non_nullable
              as bool?,
      approvedBGDID: freezed == approvedBGDID
          ? _value.approvedBGDID
          : approvedBGDID // ignore: cast_nullable_to_non_nullable
              as int?,
      dateApprovedBGD: freezed == dateApprovedBGD
          ? _value.dateApprovedBGD
          : dateApprovedBGD // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      evaluateResults: freezed == evaluateResults
          ? _value.evaluateResults
          : evaluateResults // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSeniorApproved: freezed == isSeniorApproved
          ? _value.isSeniorApproved
          : isSeniorApproved // ignore: cast_nullable_to_non_nullable
              as int?,
      approvedSeniorID: freezed == approvedSeniorID
          ? _value.approvedSeniorID
          : approvedSeniorID // ignore: cast_nullable_to_non_nullable
              as int?,
      dateApprovedSenior: freezed == dateApprovedSenior
          ? _value.dateApprovedSenior
          : dateApprovedSenior // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      decilineApproveSenior: freezed == decilineApproveSenior
          ? _value.decilineApproveSenior
          : decilineApproveSenior // ignore: cast_nullable_to_non_nullable
              as int?,
      reasonDecilineSenior: freezed == reasonDecilineSenior
          ? _value.reasonDecilineSenior
          : reasonDecilineSenior // ignore: cast_nullable_to_non_nullable
              as String?,
      rowNumber: freezed == rowNumber
          ? _value.rowNumber
          : rowNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      creatDay: freezed == creatDay
          ? _value.creatDay
          : creatDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      approvedName: freezed == approvedName
          ? _value.approvedName
          : approvedName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      timeWFHText: freezed == timeWFHText
          ? _value.timeWFHText
          : timeWFHText // ignore: cast_nullable_to_non_nullable
              as String?,
      statusNumber: freezed == statusNumber
          ? _value.statusNumber
          : statusNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      statusHRNumber: freezed == statusHRNumber
          ? _value.statusHRNumber
          : statusHRNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      fullNameBGD: freezed == fullNameBGD
          ? _value.fullNameBGD
          : fullNameBGD // ignore: cast_nullable_to_non_nullable
              as String?,
      statusText: freezed == statusText
          ? _value.statusText
          : statusText // ignore: cast_nullable_to_non_nullable
              as String?,
      statusHRText: freezed == statusHRText
          ? _value.statusHRText
          : statusHRText // ignore: cast_nullable_to_non_nullable
              as String?,
      isApprovedBGDText: freezed == isApprovedBGDText
          ? _value.isApprovedBGDText
          : isApprovedBGDText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WfhItemImpl implements _WfhItem {
  const _$WfhItemImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'ApprovedID') this.approvedId,
      @JsonKey(name: 'IsApproved') this.isApproved,
      @JsonKey(name: 'Reason') this.reason,
      @JsonKey(name: 'DateWFH') this.dateWFH,
      @JsonKey(name: 'TimeWFH') this.timeWFH,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'TotalDay') this.totalDay,
      @JsonKey(name: 'ApprovedHR') this.approvedHR,
      @JsonKey(name: 'IsApprovedHR') this.isApprovedHR,
      @JsonKey(name: 'DecilineApprove') this.decilineApprove,
      @JsonKey(name: 'ReasonDeciline') this.reasonDeciline,
      @JsonKey(name: 'ReasonHREdit') this.reasonHREdit,
      @JsonKey(name: 'IsProblem') this.isProblem,
      @JsonKey(name: 'ContentWork') this.contentWork,
      @JsonKey(name: 'IsApprovedBGD') this.isApprovedBGD,
      @JsonKey(name: 'ApprovedBGDID') this.approvedBGDID,
      @JsonKey(name: 'DateApprovedBGD') this.dateApprovedBGD,
      @JsonKey(name: 'EvaluateResults') this.evaluateResults,
      @JsonKey(name: 'IsDeleted') this.isDeleted,
      @JsonKey(name: 'IsSeniorApproved') this.isSeniorApproved,
      @JsonKey(name: 'ApprovedSeniorID') this.approvedSeniorID,
      @JsonKey(name: 'DateApprovedSenior') this.dateApprovedSenior,
      @JsonKey(name: 'DecilineApproveSenior') this.decilineApproveSenior,
      @JsonKey(name: 'ReasonDecilineSenior') this.reasonDecilineSenior,
      @JsonKey(name: 'RowNumber') this.rowNumber,
      @JsonKey(name: 'CreatDay') this.creatDay,
      @JsonKey(name: 'EmployeeName') this.employeeName,
      @JsonKey(name: 'DepartmentID') this.departmentId,
      @JsonKey(name: 'ApprovedName') this.approvedName,
      @JsonKey(name: 'DepartmentName') this.departmentName,
      @JsonKey(name: 'TimeWFHText') this.timeWFHText,
      @JsonKey(name: 'StatusNumber') this.statusNumber,
      @JsonKey(name: 'StatusHRNumber') this.statusHRNumber,
      @JsonKey(name: 'FullNameBGD') this.fullNameBGD,
      @JsonKey(name: 'StatusText') this.statusText,
      @JsonKey(name: 'StatusHRText') this.statusHRText,
      @JsonKey(name: 'IsApprovedBGDText') this.isApprovedBGDText});

  factory _$WfhItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$WfhItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;
  @override
  @JsonKey(name: 'ApprovedID')
  final int? approvedId;
  @override
  @JsonKey(name: 'IsApproved')
  final bool? isApproved;
  @override
  @JsonKey(name: 'Reason')
  final String? reason;
  @override
  @JsonKey(name: 'DateWFH')
  final DateTime? dateWFH;
  @override
  @JsonKey(name: 'TimeWFH')
  final int? timeWFH;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'CreatedDate')
  final DateTime? createdDate;
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  final DateTime? updatedDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  final String? updatedBy;
  @override
  @JsonKey(name: 'TotalDay')
  final double? totalDay;
  @override
  @JsonKey(name: 'ApprovedHR')
  final int? approvedHR;
  @override
  @JsonKey(name: 'IsApprovedHR')
  final bool? isApprovedHR;
  @override
  @JsonKey(name: 'DecilineApprove')
  final int? decilineApprove;
  @override
  @JsonKey(name: 'ReasonDeciline')
  final String? reasonDeciline;
  @override
  @JsonKey(name: 'ReasonHREdit')
  final String? reasonHREdit;
  @override
  @JsonKey(name: 'IsProblem')
  final bool? isProblem;
  @override
  @JsonKey(name: 'ContentWork')
  final String? contentWork;
  @override
  @JsonKey(name: 'IsApprovedBGD')
  final bool? isApprovedBGD;
  @override
  @JsonKey(name: 'ApprovedBGDID')
  final int? approvedBGDID;
  @override
  @JsonKey(name: 'DateApprovedBGD')
  final DateTime? dateApprovedBGD;
  @override
  @JsonKey(name: 'EvaluateResults')
  final String? evaluateResults;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;
  @override
  @JsonKey(name: 'IsSeniorApproved')
  final int? isSeniorApproved;
  @override
  @JsonKey(name: 'ApprovedSeniorID')
  final int? approvedSeniorID;
  @override
  @JsonKey(name: 'DateApprovedSenior')
  final DateTime? dateApprovedSenior;
  @override
  @JsonKey(name: 'DecilineApproveSenior')
  final int? decilineApproveSenior;
  @override
  @JsonKey(name: 'ReasonDecilineSenior')
  final String? reasonDecilineSenior;
  @override
  @JsonKey(name: 'RowNumber')
  final int? rowNumber;
  @override
  @JsonKey(name: 'CreatDay')
  final DateTime? creatDay;
  @override
  @JsonKey(name: 'EmployeeName')
  final String? employeeName;
  @override
  @JsonKey(name: 'DepartmentID')
  final int? departmentId;
  @override
  @JsonKey(name: 'ApprovedName')
  final String? approvedName;
  @override
  @JsonKey(name: 'DepartmentName')
  final String? departmentName;
  @override
  @JsonKey(name: 'TimeWFHText')
  final String? timeWFHText;
  @override
  @JsonKey(name: 'StatusNumber')
  final int? statusNumber;
  @override
  @JsonKey(name: 'StatusHRNumber')
  final int? statusHRNumber;
  @override
  @JsonKey(name: 'FullNameBGD')
  final String? fullNameBGD;
  @override
  @JsonKey(name: 'StatusText')
  final String? statusText;
  @override
  @JsonKey(name: 'StatusHRText')
  final String? statusHRText;
  @override
  @JsonKey(name: 'IsApprovedBGDText')
  final String? isApprovedBGDText;

  @override
  String toString() {
    return 'WfhItem(id: $id, employeeId: $employeeId, approvedId: $approvedId, isApproved: $isApproved, reason: $reason, dateWFH: $dateWFH, timeWFH: $timeWFH, note: $note, createdDate: $createdDate, createdBy: $createdBy, updatedDate: $updatedDate, updatedBy: $updatedBy, totalDay: $totalDay, approvedHR: $approvedHR, isApprovedHR: $isApprovedHR, decilineApprove: $decilineApprove, reasonDeciline: $reasonDeciline, reasonHREdit: $reasonHREdit, isProblem: $isProblem, contentWork: $contentWork, isApprovedBGD: $isApprovedBGD, approvedBGDID: $approvedBGDID, dateApprovedBGD: $dateApprovedBGD, evaluateResults: $evaluateResults, isDeleted: $isDeleted, isSeniorApproved: $isSeniorApproved, approvedSeniorID: $approvedSeniorID, dateApprovedSenior: $dateApprovedSenior, decilineApproveSenior: $decilineApproveSenior, reasonDecilineSenior: $reasonDecilineSenior, rowNumber: $rowNumber, creatDay: $creatDay, employeeName: $employeeName, departmentId: $departmentId, approvedName: $approvedName, departmentName: $departmentName, timeWFHText: $timeWFHText, statusNumber: $statusNumber, statusHRNumber: $statusHRNumber, fullNameBGD: $fullNameBGD, statusText: $statusText, statusHRText: $statusHRText, isApprovedBGDText: $isApprovedBGDText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WfhItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.approvedId, approvedId) ||
                other.approvedId == approvedId) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.dateWFH, dateWFH) || other.dateWFH == dateWFH) &&
            (identical(other.timeWFH, timeWFH) || other.timeWFH == timeWFH) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.totalDay, totalDay) ||
                other.totalDay == totalDay) &&
            (identical(other.approvedHR, approvedHR) ||
                other.approvedHR == approvedHR) &&
            (identical(other.isApprovedHR, isApprovedHR) ||
                other.isApprovedHR == isApprovedHR) &&
            (identical(other.decilineApprove, decilineApprove) ||
                other.decilineApprove == decilineApprove) &&
            (identical(other.reasonDeciline, reasonDeciline) ||
                other.reasonDeciline == reasonDeciline) &&
            (identical(other.reasonHREdit, reasonHREdit) ||
                other.reasonHREdit == reasonHREdit) &&
            (identical(other.isProblem, isProblem) ||
                other.isProblem == isProblem) &&
            (identical(other.contentWork, contentWork) ||
                other.contentWork == contentWork) &&
            (identical(other.isApprovedBGD, isApprovedBGD) ||
                other.isApprovedBGD == isApprovedBGD) &&
            (identical(other.approvedBGDID, approvedBGDID) ||
                other.approvedBGDID == approvedBGDID) &&
            (identical(other.dateApprovedBGD, dateApprovedBGD) ||
                other.dateApprovedBGD == dateApprovedBGD) &&
            (identical(other.evaluateResults, evaluateResults) ||
                other.evaluateResults == evaluateResults) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.isSeniorApproved, isSeniorApproved) ||
                other.isSeniorApproved == isSeniorApproved) &&
            (identical(other.approvedSeniorID, approvedSeniorID) ||
                other.approvedSeniorID == approvedSeniorID) &&
            (identical(other.dateApprovedSenior, dateApprovedSenior) ||
                other.dateApprovedSenior == dateApprovedSenior) &&
            (identical(other.decilineApproveSenior, decilineApproveSenior) ||
                other.decilineApproveSenior == decilineApproveSenior) &&
            (identical(other.reasonDecilineSenior, reasonDecilineSenior) ||
                other.reasonDecilineSenior == reasonDecilineSenior) &&
            (identical(other.rowNumber, rowNumber) ||
                other.rowNumber == rowNumber) &&
            (identical(other.creatDay, creatDay) ||
                other.creatDay == creatDay) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.approvedName, approvedName) ||
                other.approvedName == approvedName) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.timeWFHText, timeWFHText) ||
                other.timeWFHText == timeWFHText) &&
            (identical(other.statusNumber, statusNumber) ||
                other.statusNumber == statusNumber) &&
            (identical(other.statusHRNumber, statusHRNumber) ||
                other.statusHRNumber == statusHRNumber) &&
            (identical(other.fullNameBGD, fullNameBGD) ||
                other.fullNameBGD == fullNameBGD) &&
            (identical(other.statusText, statusText) ||
                other.statusText == statusText) &&
            (identical(other.statusHRText, statusHRText) ||
                other.statusHRText == statusHRText) &&
            (identical(other.isApprovedBGDText, isApprovedBGDText) ||
                other.isApprovedBGDText == isApprovedBGDText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        employeeId,
        approvedId,
        isApproved,
        reason,
        dateWFH,
        timeWFH,
        note,
        createdDate,
        createdBy,
        updatedDate,
        updatedBy,
        totalDay,
        approvedHR,
        isApprovedHR,
        decilineApprove,
        reasonDeciline,
        reasonHREdit,
        isProblem,
        contentWork,
        isApprovedBGD,
        approvedBGDID,
        dateApprovedBGD,
        evaluateResults,
        isDeleted,
        isSeniorApproved,
        approvedSeniorID,
        dateApprovedSenior,
        decilineApproveSenior,
        reasonDecilineSenior,
        rowNumber,
        creatDay,
        employeeName,
        departmentId,
        approvedName,
        departmentName,
        timeWFHText,
        statusNumber,
        statusHRNumber,
        fullNameBGD,
        statusText,
        statusHRText,
        isApprovedBGDText
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WfhItemImplCopyWith<_$WfhItemImpl> get copyWith =>
      __$$WfhItemImplCopyWithImpl<_$WfhItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WfhItemImplToJson(
      this,
    );
  }
}

abstract class _WfhItem implements WfhItem {
  const factory _WfhItem(
      {@JsonKey(name: 'ID') required final int id,
      @JsonKey(name: 'EmployeeID') final int? employeeId,
      @JsonKey(name: 'ApprovedID') final int? approvedId,
      @JsonKey(name: 'IsApproved') final bool? isApproved,
      @JsonKey(name: 'Reason') final String? reason,
      @JsonKey(name: 'DateWFH') final DateTime? dateWFH,
      @JsonKey(name: 'TimeWFH') final int? timeWFH,
      @JsonKey(name: 'Note') final String? note,
      @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
      @JsonKey(name: 'CreatedBy') final String? createdBy,
      @JsonKey(name: 'UpdatedDate') final DateTime? updatedDate,
      @JsonKey(name: 'UpdatedBy') final String? updatedBy,
      @JsonKey(name: 'TotalDay') final double? totalDay,
      @JsonKey(name: 'ApprovedHR') final int? approvedHR,
      @JsonKey(name: 'IsApprovedHR') final bool? isApprovedHR,
      @JsonKey(name: 'DecilineApprove') final int? decilineApprove,
      @JsonKey(name: 'ReasonDeciline') final String? reasonDeciline,
      @JsonKey(name: 'ReasonHREdit') final String? reasonHREdit,
      @JsonKey(name: 'IsProblem') final bool? isProblem,
      @JsonKey(name: 'ContentWork') final String? contentWork,
      @JsonKey(name: 'IsApprovedBGD') final bool? isApprovedBGD,
      @JsonKey(name: 'ApprovedBGDID') final int? approvedBGDID,
      @JsonKey(name: 'DateApprovedBGD') final DateTime? dateApprovedBGD,
      @JsonKey(name: 'EvaluateResults') final String? evaluateResults,
      @JsonKey(name: 'IsDeleted') final bool? isDeleted,
      @JsonKey(name: 'IsSeniorApproved') final int? isSeniorApproved,
      @JsonKey(name: 'ApprovedSeniorID') final int? approvedSeniorID,
      @JsonKey(name: 'DateApprovedSenior') final DateTime? dateApprovedSenior,
      @JsonKey(name: 'DecilineApproveSenior') final int? decilineApproveSenior,
      @JsonKey(name: 'ReasonDecilineSenior') final String? reasonDecilineSenior,
      @JsonKey(name: 'RowNumber') final int? rowNumber,
      @JsonKey(name: 'CreatDay') final DateTime? creatDay,
      @JsonKey(name: 'EmployeeName') final String? employeeName,
      @JsonKey(name: 'DepartmentID') final int? departmentId,
      @JsonKey(name: 'ApprovedName') final String? approvedName,
      @JsonKey(name: 'DepartmentName') final String? departmentName,
      @JsonKey(name: 'TimeWFHText') final String? timeWFHText,
      @JsonKey(name: 'StatusNumber') final int? statusNumber,
      @JsonKey(name: 'StatusHRNumber') final int? statusHRNumber,
      @JsonKey(name: 'FullNameBGD') final String? fullNameBGD,
      @JsonKey(name: 'StatusText') final String? statusText,
      @JsonKey(name: 'StatusHRText') final String? statusHRText,
      @JsonKey(name: 'IsApprovedBGDText')
      final String? isApprovedBGDText}) = _$WfhItemImpl;

  factory _WfhItem.fromJson(Map<String, dynamic> json) = _$WfhItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(name: 'ApprovedID')
  int? get approvedId;
  @override
  @JsonKey(name: 'IsApproved')
  bool? get isApproved;
  @override
  @JsonKey(name: 'Reason')
  String? get reason;
  @override
  @JsonKey(name: 'DateWFH')
  DateTime? get dateWFH;
  @override
  @JsonKey(name: 'TimeWFH')
  int? get timeWFH;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate;
  @override
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy;
  @override
  @JsonKey(name: 'TotalDay')
  double? get totalDay;
  @override
  @JsonKey(name: 'ApprovedHR')
  int? get approvedHR;
  @override
  @JsonKey(name: 'IsApprovedHR')
  bool? get isApprovedHR;
  @override
  @JsonKey(name: 'DecilineApprove')
  int? get decilineApprove;
  @override
  @JsonKey(name: 'ReasonDeciline')
  String? get reasonDeciline;
  @override
  @JsonKey(name: 'ReasonHREdit')
  String? get reasonHREdit;
  @override
  @JsonKey(name: 'IsProblem')
  bool? get isProblem;
  @override
  @JsonKey(name: 'ContentWork')
  String? get contentWork;
  @override
  @JsonKey(name: 'IsApprovedBGD')
  bool? get isApprovedBGD;
  @override
  @JsonKey(name: 'ApprovedBGDID')
  int? get approvedBGDID;
  @override
  @JsonKey(name: 'DateApprovedBGD')
  DateTime? get dateApprovedBGD;
  @override
  @JsonKey(name: 'EvaluateResults')
  String? get evaluateResults;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(name: 'IsSeniorApproved')
  int? get isSeniorApproved;
  @override
  @JsonKey(name: 'ApprovedSeniorID')
  int? get approvedSeniorID;
  @override
  @JsonKey(name: 'DateApprovedSenior')
  DateTime? get dateApprovedSenior;
  @override
  @JsonKey(name: 'DecilineApproveSenior')
  int? get decilineApproveSenior;
  @override
  @JsonKey(name: 'ReasonDecilineSenior')
  String? get reasonDecilineSenior;
  @override
  @JsonKey(name: 'RowNumber')
  int? get rowNumber;
  @override
  @JsonKey(name: 'CreatDay')
  DateTime? get creatDay;
  @override
  @JsonKey(name: 'EmployeeName')
  String? get employeeName;
  @override
  @JsonKey(name: 'DepartmentID')
  int? get departmentId;
  @override
  @JsonKey(name: 'ApprovedName')
  String? get approvedName;
  @override
  @JsonKey(name: 'DepartmentName')
  String? get departmentName;
  @override
  @JsonKey(name: 'TimeWFHText')
  String? get timeWFHText;
  @override
  @JsonKey(name: 'StatusNumber')
  int? get statusNumber;
  @override
  @JsonKey(name: 'StatusHRNumber')
  int? get statusHRNumber;
  @override
  @JsonKey(name: 'FullNameBGD')
  String? get fullNameBGD;
  @override
  @JsonKey(name: 'StatusText')
  String? get statusText;
  @override
  @JsonKey(name: 'StatusHRText')
  String? get statusHRText;
  @override
  @JsonKey(name: 'IsApprovedBGDText')
  String? get isApprovedBGDText;
  @override
  @JsonKey(ignore: true)
  _$$WfhItemImplCopyWith<_$WfhItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ApproverItem _$ApproverItemFromJson(Map<String, dynamic> json) {
  return _ApproverItem.fromJson(json);
}

/// @nodoc
mixin _$ApproverItem {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullName')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Type')
  int? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UsersID')
  int? get usersId => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsPassed')
  bool? get isPassed => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApproverItemCopyWith<ApproverItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApproverItemCopyWith<$Res> {
  factory $ApproverItemCopyWith(
          ApproverItem value, $Res Function(ApproverItem) then) =
      _$ApproverItemCopyWithImpl<$Res, ApproverItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'Type') int? type,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'UsersID') int? usersId,
      @JsonKey(name: 'IsPassed') bool? isPassed,
      @JsonKey(name: 'IsDeleted') bool? isDeleted});
}

/// @nodoc
class _$ApproverItemCopyWithImpl<$Res, $Val extends ApproverItem>
    implements $ApproverItemCopyWith<$Res> {
  _$ApproverItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? employeeId = freezed,
    Object? code = freezed,
    Object? fullName = freezed,
    Object? type = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? usersId = freezed,
    Object? isPassed = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
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
      usersId: freezed == usersId
          ? _value.usersId
          : usersId // ignore: cast_nullable_to_non_nullable
              as int?,
      isPassed: freezed == isPassed
          ? _value.isPassed
          : isPassed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApproverItemImplCopyWith<$Res>
    implements $ApproverItemCopyWith<$Res> {
  factory _$$ApproverItemImplCopyWith(
          _$ApproverItemImpl value, $Res Function(_$ApproverItemImpl) then) =
      __$$ApproverItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'Type') int? type,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'UsersID') int? usersId,
      @JsonKey(name: 'IsPassed') bool? isPassed,
      @JsonKey(name: 'IsDeleted') bool? isDeleted});
}

/// @nodoc
class __$$ApproverItemImplCopyWithImpl<$Res>
    extends _$ApproverItemCopyWithImpl<$Res, _$ApproverItemImpl>
    implements _$$ApproverItemImplCopyWith<$Res> {
  __$$ApproverItemImplCopyWithImpl(
      _$ApproverItemImpl _value, $Res Function(_$ApproverItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? employeeId = freezed,
    Object? code = freezed,
    Object? fullName = freezed,
    Object? type = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? usersId = freezed,
    Object? isPassed = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_$ApproverItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
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
      usersId: freezed == usersId
          ? _value.usersId
          : usersId // ignore: cast_nullable_to_non_nullable
              as int?,
      isPassed: freezed == isPassed
          ? _value.isPassed
          : isPassed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApproverItemImpl implements _ApproverItem {
  const _$ApproverItemImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'FullName') this.fullName,
      @JsonKey(name: 'Type') this.type,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'UsersID') this.usersId,
      @JsonKey(name: 'IsPassed') this.isPassed,
      @JsonKey(name: 'IsDeleted') this.isDeleted});

  factory _$ApproverItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApproverItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
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
  @JsonKey(name: 'Type')
  final int? type;
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
  @JsonKey(name: 'UsersID')
  final int? usersId;
  @override
  @JsonKey(name: 'IsPassed')
  final bool? isPassed;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;

  @override
  String toString() {
    return 'ApproverItem(id: $id, employeeId: $employeeId, code: $code, fullName: $fullName, type: $type, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate, usersId: $usersId, isPassed: $isPassed, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproverItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.usersId, usersId) || other.usersId == usersId) &&
            (identical(other.isPassed, isPassed) ||
                other.isPassed == isPassed) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      employeeId,
      code,
      fullName,
      type,
      createdBy,
      createdDate,
      updatedBy,
      updatedDate,
      usersId,
      isPassed,
      isDeleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproverItemImplCopyWith<_$ApproverItemImpl> get copyWith =>
      __$$ApproverItemImplCopyWithImpl<_$ApproverItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApproverItemImplToJson(
      this,
    );
  }
}

abstract class _ApproverItem implements ApproverItem {
  const factory _ApproverItem(
      {@JsonKey(name: 'ID') required final int id,
      @JsonKey(name: 'EmployeeID') final int? employeeId,
      @JsonKey(name: 'Code') final String? code,
      @JsonKey(name: 'FullName') final String? fullName,
      @JsonKey(name: 'Type') final int? type,
      @JsonKey(name: 'CreatedBy') final String? createdBy,
      @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') final String? updatedBy,
      @JsonKey(name: 'UpdatedDate') final DateTime? updatedDate,
      @JsonKey(name: 'UsersID') final int? usersId,
      @JsonKey(name: 'IsPassed') final bool? isPassed,
      @JsonKey(name: 'IsDeleted') final bool? isDeleted}) = _$ApproverItemImpl;

  factory _ApproverItem.fromJson(Map<String, dynamic> json) =
      _$ApproverItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
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
  @JsonKey(name: 'Type')
  int? get type;
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
  @JsonKey(name: 'UsersID')
  int? get usersId;
  @override
  @JsonKey(name: 'IsPassed')
  bool? get isPassed;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(ignore: true)
  _$$ApproverItemImplCopyWith<_$ApproverItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
