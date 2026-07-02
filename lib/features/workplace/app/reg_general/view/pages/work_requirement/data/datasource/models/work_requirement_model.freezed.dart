// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_requirement_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkRequirementItem _$WorkRequirementItemFromJson(Map<String, dynamic> json) {
  return _WorkRequirementItem.fromJson(json);
}

/// @nodoc
mixin _$WorkRequirementItem {
  @JsonKey(name: 'RowIndex')
  int? get rowIndex => throw _privateConstructorUsedError;
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'NumberRequest')
  String? get numberRequest => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateRequest')
  DateTime? get dateRequest => throw _privateConstructorUsedError;
  @JsonKey(name: 'DeadlineRequest')
  DateTime? get deadlineRequest => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CoordinationDepartmentID')
  int? get coordinationDepartmentID => throw _privateConstructorUsedError;
  @JsonKey(name: 'RequiredDepartmentID')
  int? get requiredDepartmentID => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedTBP')
  bool? get isApprovedTBP => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateApprovedTBP')
  DateTime? get dateApprovedTBP => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedTBPID')
  int? get approvedTBPID => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedHR')
  bool? get isApprovedHR => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateApprovedHR')
  DateTime? get dateApprovedHR => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedHRID')
  int? get approvedHRID => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedBGD')
  bool? get isApprovedBGD => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateApprovedBGD')
  DateTime? get dateApprovedBGD => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedBGDID')
  int? get approvedBGDID => throw _privateConstructorUsedError;
  @JsonKey(name: 'EvaluateCompletion')
  String? get evaluateCompletion => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsRequestBuy')
  bool? get isRequestBuy => throw _privateConstructorUsedError;
  @JsonKey(name: 'Status')
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsRequestBGDApproved')
  bool? get isRequestBGDApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'CoordinationDepartment')
  String? get coordinationDepartment => throw _privateConstructorUsedError;
  @JsonKey(name: 'RequiredDepartment')
  String? get requiredDepartment => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeName')
  String? get employeeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeDepartment')
  String? get employeeDepartment => throw _privateConstructorUsedError;
  @JsonKey(name: 'Step')
  int? get step => throw _privateConstructorUsedError;
  @JsonKey(name: 'StepApproved')
  int? get stepApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApproved')
  int? get isApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedText')
  String? get isApprovedText => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusText')
  String? get statusText => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullNameApprovedTBP')
  String? get fullNameApprovedTBP => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReasonCancel')
  String? get reasonCancel => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsRequestPriceQuote')
  bool? get isRequestPriceQuote => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentID')
  int? get departmentID => throw _privateConstructorUsedError;
  @JsonKey(name: 'ChucVuHDID')
  int? get chucVuHDID => throw _privateConstructorUsedError;
  @JsonKey(name: 'ChucVu')
  String? get chucVu => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkRequirementItemCopyWith<WorkRequirementItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkRequirementItemCopyWith<$Res> {
  factory $WorkRequirementItemCopyWith(
          WorkRequirementItem value, $Res Function(WorkRequirementItem) then) =
      _$WorkRequirementItemCopyWithImpl<$Res, WorkRequirementItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'RowIndex') int? rowIndex,
      @JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'NumberRequest') String? numberRequest,
      @JsonKey(name: 'DateRequest') DateTime? dateRequest,
      @JsonKey(name: 'DeadlineRequest') DateTime? deadlineRequest,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'CoordinationDepartmentID') int? coordinationDepartmentID,
      @JsonKey(name: 'RequiredDepartmentID') int? requiredDepartmentID,
      @JsonKey(name: 'IsApprovedTBP') bool? isApprovedTBP,
      @JsonKey(name: 'DateApprovedTBP') DateTime? dateApprovedTBP,
      @JsonKey(name: 'ApprovedTBPID') int? approvedTBPID,
      @JsonKey(name: 'IsApprovedHR') bool? isApprovedHR,
      @JsonKey(name: 'DateApprovedHR') DateTime? dateApprovedHR,
      @JsonKey(name: 'ApprovedHRID') int? approvedHRID,
      @JsonKey(name: 'IsApprovedBGD') bool? isApprovedBGD,
      @JsonKey(name: 'DateApprovedBGD') DateTime? dateApprovedBGD,
      @JsonKey(name: 'ApprovedBGDID') int? approvedBGDID,
      @JsonKey(name: 'EvaluateCompletion') String? evaluateCompletion,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'IsRequestBuy') bool? isRequestBuy,
      @JsonKey(name: 'Status') int? status,
      @JsonKey(name: 'IsRequestBGDApproved') bool? isRequestBGDApproved,
      @JsonKey(name: 'CoordinationDepartment') String? coordinationDepartment,
      @JsonKey(name: 'RequiredDepartment') String? requiredDepartment,
      @JsonKey(name: 'EmployeeName') String? employeeName,
      @JsonKey(name: 'EmployeeDepartment') String? employeeDepartment,
      @JsonKey(name: 'Step') int? step,
      @JsonKey(name: 'StepApproved') int? stepApproved,
      @JsonKey(name: 'IsApproved') int? isApproved,
      @JsonKey(name: 'IsApprovedText') String? isApprovedText,
      @JsonKey(name: 'StatusText') String? statusText,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'FullNameApprovedTBP') String? fullNameApprovedTBP,
      @JsonKey(name: 'ReasonCancel') String? reasonCancel,
      @JsonKey(name: 'IsRequestPriceQuote') bool? isRequestPriceQuote,
      @JsonKey(name: 'DepartmentID') int? departmentID,
      @JsonKey(name: 'ChucVuHDID') int? chucVuHDID,
      @JsonKey(name: 'ChucVu') String? chucVu});
}

/// @nodoc
class _$WorkRequirementItemCopyWithImpl<$Res, $Val extends WorkRequirementItem>
    implements $WorkRequirementItemCopyWith<$Res> {
  _$WorkRequirementItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rowIndex = freezed,
    Object? id = freezed,
    Object? numberRequest = freezed,
    Object? dateRequest = freezed,
    Object? deadlineRequest = freezed,
    Object? employeeId = freezed,
    Object? coordinationDepartmentID = freezed,
    Object? requiredDepartmentID = freezed,
    Object? isApprovedTBP = freezed,
    Object? dateApprovedTBP = freezed,
    Object? approvedTBPID = freezed,
    Object? isApprovedHR = freezed,
    Object? dateApprovedHR = freezed,
    Object? approvedHRID = freezed,
    Object? isApprovedBGD = freezed,
    Object? dateApprovedBGD = freezed,
    Object? approvedBGDID = freezed,
    Object? evaluateCompletion = freezed,
    Object? isDeleted = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? isRequestBuy = freezed,
    Object? status = freezed,
    Object? isRequestBGDApproved = freezed,
    Object? coordinationDepartment = freezed,
    Object? requiredDepartment = freezed,
    Object? employeeName = freezed,
    Object? employeeDepartment = freezed,
    Object? step = freezed,
    Object? stepApproved = freezed,
    Object? isApproved = freezed,
    Object? isApprovedText = freezed,
    Object? statusText = freezed,
    Object? note = freezed,
    Object? fullNameApprovedTBP = freezed,
    Object? reasonCancel = freezed,
    Object? isRequestPriceQuote = freezed,
    Object? departmentID = freezed,
    Object? chucVuHDID = freezed,
    Object? chucVu = freezed,
  }) {
    return _then(_value.copyWith(
      rowIndex: freezed == rowIndex
          ? _value.rowIndex
          : rowIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      numberRequest: freezed == numberRequest
          ? _value.numberRequest
          : numberRequest // ignore: cast_nullable_to_non_nullable
              as String?,
      dateRequest: freezed == dateRequest
          ? _value.dateRequest
          : dateRequest // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deadlineRequest: freezed == deadlineRequest
          ? _value.deadlineRequest
          : deadlineRequest // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      coordinationDepartmentID: freezed == coordinationDepartmentID
          ? _value.coordinationDepartmentID
          : coordinationDepartmentID // ignore: cast_nullable_to_non_nullable
              as int?,
      requiredDepartmentID: freezed == requiredDepartmentID
          ? _value.requiredDepartmentID
          : requiredDepartmentID // ignore: cast_nullable_to_non_nullable
              as int?,
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
      isApprovedHR: freezed == isApprovedHR
          ? _value.isApprovedHR
          : isApprovedHR // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateApprovedHR: freezed == dateApprovedHR
          ? _value.dateApprovedHR
          : dateApprovedHR // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      approvedHRID: freezed == approvedHRID
          ? _value.approvedHRID
          : approvedHRID // ignore: cast_nullable_to_non_nullable
              as int?,
      isApprovedBGD: freezed == isApprovedBGD
          ? _value.isApprovedBGD
          : isApprovedBGD // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateApprovedBGD: freezed == dateApprovedBGD
          ? _value.dateApprovedBGD
          : dateApprovedBGD // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      approvedBGDID: freezed == approvedBGDID
          ? _value.approvedBGDID
          : approvedBGDID // ignore: cast_nullable_to_non_nullable
              as int?,
      evaluateCompletion: freezed == evaluateCompletion
          ? _value.evaluateCompletion
          : evaluateCompletion // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isRequestBuy: freezed == isRequestBuy
          ? _value.isRequestBuy
          : isRequestBuy // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      isRequestBGDApproved: freezed == isRequestBGDApproved
          ? _value.isRequestBGDApproved
          : isRequestBGDApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      coordinationDepartment: freezed == coordinationDepartment
          ? _value.coordinationDepartment
          : coordinationDepartment // ignore: cast_nullable_to_non_nullable
              as String?,
      requiredDepartment: freezed == requiredDepartment
          ? _value.requiredDepartment
          : requiredDepartment // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeDepartment: freezed == employeeDepartment
          ? _value.employeeDepartment
          : employeeDepartment // ignore: cast_nullable_to_non_nullable
              as String?,
      step: freezed == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int?,
      stepApproved: freezed == stepApproved
          ? _value.stepApproved
          : stepApproved // ignore: cast_nullable_to_non_nullable
              as int?,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as int?,
      isApprovedText: freezed == isApprovedText
          ? _value.isApprovedText
          : isApprovedText // ignore: cast_nullable_to_non_nullable
              as String?,
      statusText: freezed == statusText
          ? _value.statusText
          : statusText // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      fullNameApprovedTBP: freezed == fullNameApprovedTBP
          ? _value.fullNameApprovedTBP
          : fullNameApprovedTBP // ignore: cast_nullable_to_non_nullable
              as String?,
      reasonCancel: freezed == reasonCancel
          ? _value.reasonCancel
          : reasonCancel // ignore: cast_nullable_to_non_nullable
              as String?,
      isRequestPriceQuote: freezed == isRequestPriceQuote
          ? _value.isRequestPriceQuote
          : isRequestPriceQuote // ignore: cast_nullable_to_non_nullable
              as bool?,
      departmentID: freezed == departmentID
          ? _value.departmentID
          : departmentID // ignore: cast_nullable_to_non_nullable
              as int?,
      chucVuHDID: freezed == chucVuHDID
          ? _value.chucVuHDID
          : chucVuHDID // ignore: cast_nullable_to_non_nullable
              as int?,
      chucVu: freezed == chucVu
          ? _value.chucVu
          : chucVu // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkRequirementItemImplCopyWith<$Res>
    implements $WorkRequirementItemCopyWith<$Res> {
  factory _$$WorkRequirementItemImplCopyWith(_$WorkRequirementItemImpl value,
          $Res Function(_$WorkRequirementItemImpl) then) =
      __$$WorkRequirementItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'RowIndex') int? rowIndex,
      @JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'NumberRequest') String? numberRequest,
      @JsonKey(name: 'DateRequest') DateTime? dateRequest,
      @JsonKey(name: 'DeadlineRequest') DateTime? deadlineRequest,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'CoordinationDepartmentID') int? coordinationDepartmentID,
      @JsonKey(name: 'RequiredDepartmentID') int? requiredDepartmentID,
      @JsonKey(name: 'IsApprovedTBP') bool? isApprovedTBP,
      @JsonKey(name: 'DateApprovedTBP') DateTime? dateApprovedTBP,
      @JsonKey(name: 'ApprovedTBPID') int? approvedTBPID,
      @JsonKey(name: 'IsApprovedHR') bool? isApprovedHR,
      @JsonKey(name: 'DateApprovedHR') DateTime? dateApprovedHR,
      @JsonKey(name: 'ApprovedHRID') int? approvedHRID,
      @JsonKey(name: 'IsApprovedBGD') bool? isApprovedBGD,
      @JsonKey(name: 'DateApprovedBGD') DateTime? dateApprovedBGD,
      @JsonKey(name: 'ApprovedBGDID') int? approvedBGDID,
      @JsonKey(name: 'EvaluateCompletion') String? evaluateCompletion,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'IsRequestBuy') bool? isRequestBuy,
      @JsonKey(name: 'Status') int? status,
      @JsonKey(name: 'IsRequestBGDApproved') bool? isRequestBGDApproved,
      @JsonKey(name: 'CoordinationDepartment') String? coordinationDepartment,
      @JsonKey(name: 'RequiredDepartment') String? requiredDepartment,
      @JsonKey(name: 'EmployeeName') String? employeeName,
      @JsonKey(name: 'EmployeeDepartment') String? employeeDepartment,
      @JsonKey(name: 'Step') int? step,
      @JsonKey(name: 'StepApproved') int? stepApproved,
      @JsonKey(name: 'IsApproved') int? isApproved,
      @JsonKey(name: 'IsApprovedText') String? isApprovedText,
      @JsonKey(name: 'StatusText') String? statusText,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'FullNameApprovedTBP') String? fullNameApprovedTBP,
      @JsonKey(name: 'ReasonCancel') String? reasonCancel,
      @JsonKey(name: 'IsRequestPriceQuote') bool? isRequestPriceQuote,
      @JsonKey(name: 'DepartmentID') int? departmentID,
      @JsonKey(name: 'ChucVuHDID') int? chucVuHDID,
      @JsonKey(name: 'ChucVu') String? chucVu});
}

/// @nodoc
class __$$WorkRequirementItemImplCopyWithImpl<$Res>
    extends _$WorkRequirementItemCopyWithImpl<$Res, _$WorkRequirementItemImpl>
    implements _$$WorkRequirementItemImplCopyWith<$Res> {
  __$$WorkRequirementItemImplCopyWithImpl(_$WorkRequirementItemImpl _value,
      $Res Function(_$WorkRequirementItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rowIndex = freezed,
    Object? id = freezed,
    Object? numberRequest = freezed,
    Object? dateRequest = freezed,
    Object? deadlineRequest = freezed,
    Object? employeeId = freezed,
    Object? coordinationDepartmentID = freezed,
    Object? requiredDepartmentID = freezed,
    Object? isApprovedTBP = freezed,
    Object? dateApprovedTBP = freezed,
    Object? approvedTBPID = freezed,
    Object? isApprovedHR = freezed,
    Object? dateApprovedHR = freezed,
    Object? approvedHRID = freezed,
    Object? isApprovedBGD = freezed,
    Object? dateApprovedBGD = freezed,
    Object? approvedBGDID = freezed,
    Object? evaluateCompletion = freezed,
    Object? isDeleted = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? isRequestBuy = freezed,
    Object? status = freezed,
    Object? isRequestBGDApproved = freezed,
    Object? coordinationDepartment = freezed,
    Object? requiredDepartment = freezed,
    Object? employeeName = freezed,
    Object? employeeDepartment = freezed,
    Object? step = freezed,
    Object? stepApproved = freezed,
    Object? isApproved = freezed,
    Object? isApprovedText = freezed,
    Object? statusText = freezed,
    Object? note = freezed,
    Object? fullNameApprovedTBP = freezed,
    Object? reasonCancel = freezed,
    Object? isRequestPriceQuote = freezed,
    Object? departmentID = freezed,
    Object? chucVuHDID = freezed,
    Object? chucVu = freezed,
  }) {
    return _then(_$WorkRequirementItemImpl(
      rowIndex: freezed == rowIndex
          ? _value.rowIndex
          : rowIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      numberRequest: freezed == numberRequest
          ? _value.numberRequest
          : numberRequest // ignore: cast_nullable_to_non_nullable
              as String?,
      dateRequest: freezed == dateRequest
          ? _value.dateRequest
          : dateRequest // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deadlineRequest: freezed == deadlineRequest
          ? _value.deadlineRequest
          : deadlineRequest // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      coordinationDepartmentID: freezed == coordinationDepartmentID
          ? _value.coordinationDepartmentID
          : coordinationDepartmentID // ignore: cast_nullable_to_non_nullable
              as int?,
      requiredDepartmentID: freezed == requiredDepartmentID
          ? _value.requiredDepartmentID
          : requiredDepartmentID // ignore: cast_nullable_to_non_nullable
              as int?,
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
      isApprovedHR: freezed == isApprovedHR
          ? _value.isApprovedHR
          : isApprovedHR // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateApprovedHR: freezed == dateApprovedHR
          ? _value.dateApprovedHR
          : dateApprovedHR // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      approvedHRID: freezed == approvedHRID
          ? _value.approvedHRID
          : approvedHRID // ignore: cast_nullable_to_non_nullable
              as int?,
      isApprovedBGD: freezed == isApprovedBGD
          ? _value.isApprovedBGD
          : isApprovedBGD // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateApprovedBGD: freezed == dateApprovedBGD
          ? _value.dateApprovedBGD
          : dateApprovedBGD // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      approvedBGDID: freezed == approvedBGDID
          ? _value.approvedBGDID
          : approvedBGDID // ignore: cast_nullable_to_non_nullable
              as int?,
      evaluateCompletion: freezed == evaluateCompletion
          ? _value.evaluateCompletion
          : evaluateCompletion // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isRequestBuy: freezed == isRequestBuy
          ? _value.isRequestBuy
          : isRequestBuy // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      isRequestBGDApproved: freezed == isRequestBGDApproved
          ? _value.isRequestBGDApproved
          : isRequestBGDApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      coordinationDepartment: freezed == coordinationDepartment
          ? _value.coordinationDepartment
          : coordinationDepartment // ignore: cast_nullable_to_non_nullable
              as String?,
      requiredDepartment: freezed == requiredDepartment
          ? _value.requiredDepartment
          : requiredDepartment // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeDepartment: freezed == employeeDepartment
          ? _value.employeeDepartment
          : employeeDepartment // ignore: cast_nullable_to_non_nullable
              as String?,
      step: freezed == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int?,
      stepApproved: freezed == stepApproved
          ? _value.stepApproved
          : stepApproved // ignore: cast_nullable_to_non_nullable
              as int?,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as int?,
      isApprovedText: freezed == isApprovedText
          ? _value.isApprovedText
          : isApprovedText // ignore: cast_nullable_to_non_nullable
              as String?,
      statusText: freezed == statusText
          ? _value.statusText
          : statusText // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      fullNameApprovedTBP: freezed == fullNameApprovedTBP
          ? _value.fullNameApprovedTBP
          : fullNameApprovedTBP // ignore: cast_nullable_to_non_nullable
              as String?,
      reasonCancel: freezed == reasonCancel
          ? _value.reasonCancel
          : reasonCancel // ignore: cast_nullable_to_non_nullable
              as String?,
      isRequestPriceQuote: freezed == isRequestPriceQuote
          ? _value.isRequestPriceQuote
          : isRequestPriceQuote // ignore: cast_nullable_to_non_nullable
              as bool?,
      departmentID: freezed == departmentID
          ? _value.departmentID
          : departmentID // ignore: cast_nullable_to_non_nullable
              as int?,
      chucVuHDID: freezed == chucVuHDID
          ? _value.chucVuHDID
          : chucVuHDID // ignore: cast_nullable_to_non_nullable
              as int?,
      chucVu: freezed == chucVu
          ? _value.chucVu
          : chucVu // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkRequirementItemImpl implements _WorkRequirementItem {
  const _$WorkRequirementItemImpl(
      {@JsonKey(name: 'RowIndex') this.rowIndex,
      @JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'NumberRequest') this.numberRequest,
      @JsonKey(name: 'DateRequest') this.dateRequest,
      @JsonKey(name: 'DeadlineRequest') this.deadlineRequest,
      @JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'CoordinationDepartmentID') this.coordinationDepartmentID,
      @JsonKey(name: 'RequiredDepartmentID') this.requiredDepartmentID,
      @JsonKey(name: 'IsApprovedTBP') this.isApprovedTBP,
      @JsonKey(name: 'DateApprovedTBP') this.dateApprovedTBP,
      @JsonKey(name: 'ApprovedTBPID') this.approvedTBPID,
      @JsonKey(name: 'IsApprovedHR') this.isApprovedHR,
      @JsonKey(name: 'DateApprovedHR') this.dateApprovedHR,
      @JsonKey(name: 'ApprovedHRID') this.approvedHRID,
      @JsonKey(name: 'IsApprovedBGD') this.isApprovedBGD,
      @JsonKey(name: 'DateApprovedBGD') this.dateApprovedBGD,
      @JsonKey(name: 'ApprovedBGDID') this.approvedBGDID,
      @JsonKey(name: 'EvaluateCompletion') this.evaluateCompletion,
      @JsonKey(name: 'IsDeleted') this.isDeleted,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'IsRequestBuy') this.isRequestBuy,
      @JsonKey(name: 'Status') this.status,
      @JsonKey(name: 'IsRequestBGDApproved') this.isRequestBGDApproved,
      @JsonKey(name: 'CoordinationDepartment') this.coordinationDepartment,
      @JsonKey(name: 'RequiredDepartment') this.requiredDepartment,
      @JsonKey(name: 'EmployeeName') this.employeeName,
      @JsonKey(name: 'EmployeeDepartment') this.employeeDepartment,
      @JsonKey(name: 'Step') this.step,
      @JsonKey(name: 'StepApproved') this.stepApproved,
      @JsonKey(name: 'IsApproved') this.isApproved,
      @JsonKey(name: 'IsApprovedText') this.isApprovedText,
      @JsonKey(name: 'StatusText') this.statusText,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'FullNameApprovedTBP') this.fullNameApprovedTBP,
      @JsonKey(name: 'ReasonCancel') this.reasonCancel,
      @JsonKey(name: 'IsRequestPriceQuote') this.isRequestPriceQuote,
      @JsonKey(name: 'DepartmentID') this.departmentID,
      @JsonKey(name: 'ChucVuHDID') this.chucVuHDID,
      @JsonKey(name: 'ChucVu') this.chucVu});

  factory _$WorkRequirementItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkRequirementItemImplFromJson(json);

  @override
  @JsonKey(name: 'RowIndex')
  final int? rowIndex;
  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'NumberRequest')
  final String? numberRequest;
  @override
  @JsonKey(name: 'DateRequest')
  final DateTime? dateRequest;
  @override
  @JsonKey(name: 'DeadlineRequest')
  final DateTime? deadlineRequest;
  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;
  @override
  @JsonKey(name: 'CoordinationDepartmentID')
  final int? coordinationDepartmentID;
  @override
  @JsonKey(name: 'RequiredDepartmentID')
  final int? requiredDepartmentID;
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
  @JsonKey(name: 'IsApprovedHR')
  final bool? isApprovedHR;
  @override
  @JsonKey(name: 'DateApprovedHR')
  final DateTime? dateApprovedHR;
  @override
  @JsonKey(name: 'ApprovedHRID')
  final int? approvedHRID;
  @override
  @JsonKey(name: 'IsApprovedBGD')
  final bool? isApprovedBGD;
  @override
  @JsonKey(name: 'DateApprovedBGD')
  final DateTime? dateApprovedBGD;
  @override
  @JsonKey(name: 'ApprovedBGDID')
  final int? approvedBGDID;
  @override
  @JsonKey(name: 'EvaluateCompletion')
  final String? evaluateCompletion;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;
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
  @JsonKey(name: 'IsRequestBuy')
  final bool? isRequestBuy;
  @override
  @JsonKey(name: 'Status')
  final int? status;
  @override
  @JsonKey(name: 'IsRequestBGDApproved')
  final bool? isRequestBGDApproved;
  @override
  @JsonKey(name: 'CoordinationDepartment')
  final String? coordinationDepartment;
  @override
  @JsonKey(name: 'RequiredDepartment')
  final String? requiredDepartment;
  @override
  @JsonKey(name: 'EmployeeName')
  final String? employeeName;
  @override
  @JsonKey(name: 'EmployeeDepartment')
  final String? employeeDepartment;
  @override
  @JsonKey(name: 'Step')
  final int? step;
  @override
  @JsonKey(name: 'StepApproved')
  final int? stepApproved;
  @override
  @JsonKey(name: 'IsApproved')
  final int? isApproved;
  @override
  @JsonKey(name: 'IsApprovedText')
  final String? isApprovedText;
  @override
  @JsonKey(name: 'StatusText')
  final String? statusText;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'FullNameApprovedTBP')
  final String? fullNameApprovedTBP;
  @override
  @JsonKey(name: 'ReasonCancel')
  final String? reasonCancel;
  @override
  @JsonKey(name: 'IsRequestPriceQuote')
  final bool? isRequestPriceQuote;
  @override
  @JsonKey(name: 'DepartmentID')
  final int? departmentID;
  @override
  @JsonKey(name: 'ChucVuHDID')
  final int? chucVuHDID;
  @override
  @JsonKey(name: 'ChucVu')
  final String? chucVu;

  @override
  String toString() {
    return 'WorkRequirementItem(rowIndex: $rowIndex, id: $id, numberRequest: $numberRequest, dateRequest: $dateRequest, deadlineRequest: $deadlineRequest, employeeId: $employeeId, coordinationDepartmentID: $coordinationDepartmentID, requiredDepartmentID: $requiredDepartmentID, isApprovedTBP: $isApprovedTBP, dateApprovedTBP: $dateApprovedTBP, approvedTBPID: $approvedTBPID, isApprovedHR: $isApprovedHR, dateApprovedHR: $dateApprovedHR, approvedHRID: $approvedHRID, isApprovedBGD: $isApprovedBGD, dateApprovedBGD: $dateApprovedBGD, approvedBGDID: $approvedBGDID, evaluateCompletion: $evaluateCompletion, isDeleted: $isDeleted, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate, isRequestBuy: $isRequestBuy, status: $status, isRequestBGDApproved: $isRequestBGDApproved, coordinationDepartment: $coordinationDepartment, requiredDepartment: $requiredDepartment, employeeName: $employeeName, employeeDepartment: $employeeDepartment, step: $step, stepApproved: $stepApproved, isApproved: $isApproved, isApprovedText: $isApprovedText, statusText: $statusText, note: $note, fullNameApprovedTBP: $fullNameApprovedTBP, reasonCancel: $reasonCancel, isRequestPriceQuote: $isRequestPriceQuote, departmentID: $departmentID, chucVuHDID: $chucVuHDID, chucVu: $chucVu)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkRequirementItemImpl &&
            (identical(other.rowIndex, rowIndex) ||
                other.rowIndex == rowIndex) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.numberRequest, numberRequest) ||
                other.numberRequest == numberRequest) &&
            (identical(other.dateRequest, dateRequest) ||
                other.dateRequest == dateRequest) &&
            (identical(other.deadlineRequest, deadlineRequest) ||
                other.deadlineRequest == deadlineRequest) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.coordinationDepartmentID, coordinationDepartmentID) ||
                other.coordinationDepartmentID == coordinationDepartmentID) &&
            (identical(other.requiredDepartmentID, requiredDepartmentID) ||
                other.requiredDepartmentID == requiredDepartmentID) &&
            (identical(other.isApprovedTBP, isApprovedTBP) ||
                other.isApprovedTBP == isApprovedTBP) &&
            (identical(other.dateApprovedTBP, dateApprovedTBP) ||
                other.dateApprovedTBP == dateApprovedTBP) &&
            (identical(other.approvedTBPID, approvedTBPID) ||
                other.approvedTBPID == approvedTBPID) &&
            (identical(other.isApprovedHR, isApprovedHR) ||
                other.isApprovedHR == isApprovedHR) &&
            (identical(other.dateApprovedHR, dateApprovedHR) ||
                other.dateApprovedHR == dateApprovedHR) &&
            (identical(other.approvedHRID, approvedHRID) ||
                other.approvedHRID == approvedHRID) &&
            (identical(other.isApprovedBGD, isApprovedBGD) ||
                other.isApprovedBGD == isApprovedBGD) &&
            (identical(other.dateApprovedBGD, dateApprovedBGD) ||
                other.dateApprovedBGD == dateApprovedBGD) &&
            (identical(other.approvedBGDID, approvedBGDID) ||
                other.approvedBGDID == approvedBGDID) &&
            (identical(other.evaluateCompletion, evaluateCompletion) ||
                other.evaluateCompletion == evaluateCompletion) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.isRequestBuy, isRequestBuy) ||
                other.isRequestBuy == isRequestBuy) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isRequestBGDApproved, isRequestBGDApproved) ||
                other.isRequestBGDApproved == isRequestBGDApproved) &&
            (identical(other.coordinationDepartment, coordinationDepartment) ||
                other.coordinationDepartment == coordinationDepartment) &&
            (identical(other.requiredDepartment, requiredDepartment) ||
                other.requiredDepartment == requiredDepartment) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.employeeDepartment, employeeDepartment) ||
                other.employeeDepartment == employeeDepartment) &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.stepApproved, stepApproved) ||
                other.stepApproved == stepApproved) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved) &&
            (identical(other.isApprovedText, isApprovedText) ||
                other.isApprovedText == isApprovedText) &&
            (identical(other.statusText, statusText) ||
                other.statusText == statusText) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.fullNameApprovedTBP, fullNameApprovedTBP) ||
                other.fullNameApprovedTBP == fullNameApprovedTBP) &&
            (identical(other.reasonCancel, reasonCancel) || other.reasonCancel == reasonCancel) &&
            (identical(other.isRequestPriceQuote, isRequestPriceQuote) || other.isRequestPriceQuote == isRequestPriceQuote) &&
            (identical(other.departmentID, departmentID) || other.departmentID == departmentID) &&
            (identical(other.chucVuHDID, chucVuHDID) || other.chucVuHDID == chucVuHDID) &&
            (identical(other.chucVu, chucVu) || other.chucVu == chucVu));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        rowIndex,
        id,
        numberRequest,
        dateRequest,
        deadlineRequest,
        employeeId,
        coordinationDepartmentID,
        requiredDepartmentID,
        isApprovedTBP,
        dateApprovedTBP,
        approvedTBPID,
        isApprovedHR,
        dateApprovedHR,
        approvedHRID,
        isApprovedBGD,
        dateApprovedBGD,
        approvedBGDID,
        evaluateCompletion,
        isDeleted,
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        isRequestBuy,
        status,
        isRequestBGDApproved,
        coordinationDepartment,
        requiredDepartment,
        employeeName,
        employeeDepartment,
        step,
        stepApproved,
        isApproved,
        isApprovedText,
        statusText,
        note,
        fullNameApprovedTBP,
        reasonCancel,
        isRequestPriceQuote,
        departmentID,
        chucVuHDID,
        chucVu
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkRequirementItemImplCopyWith<_$WorkRequirementItemImpl> get copyWith =>
      __$$WorkRequirementItemImplCopyWithImpl<_$WorkRequirementItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkRequirementItemImplToJson(
      this,
    );
  }
}

abstract class _WorkRequirementItem implements WorkRequirementItem {
  const factory _WorkRequirementItem(
      {@JsonKey(name: 'RowIndex') final int? rowIndex,
      @JsonKey(name: 'ID') final int? id,
      @JsonKey(name: 'NumberRequest') final String? numberRequest,
      @JsonKey(name: 'DateRequest') final DateTime? dateRequest,
      @JsonKey(name: 'DeadlineRequest') final DateTime? deadlineRequest,
      @JsonKey(name: 'EmployeeID') final int? employeeId,
      @JsonKey(name: 'CoordinationDepartmentID')
      final int? coordinationDepartmentID,
      @JsonKey(name: 'RequiredDepartmentID') final int? requiredDepartmentID,
      @JsonKey(name: 'IsApprovedTBP') final bool? isApprovedTBP,
      @JsonKey(name: 'DateApprovedTBP') final DateTime? dateApprovedTBP,
      @JsonKey(name: 'ApprovedTBPID') final int? approvedTBPID,
      @JsonKey(name: 'IsApprovedHR') final bool? isApprovedHR,
      @JsonKey(name: 'DateApprovedHR') final DateTime? dateApprovedHR,
      @JsonKey(name: 'ApprovedHRID') final int? approvedHRID,
      @JsonKey(name: 'IsApprovedBGD') final bool? isApprovedBGD,
      @JsonKey(name: 'DateApprovedBGD') final DateTime? dateApprovedBGD,
      @JsonKey(name: 'ApprovedBGDID') final int? approvedBGDID,
      @JsonKey(name: 'EvaluateCompletion') final String? evaluateCompletion,
      @JsonKey(name: 'IsDeleted') final bool? isDeleted,
      @JsonKey(name: 'CreatedBy') final String? createdBy,
      @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') final String? updatedBy,
      @JsonKey(name: 'UpdatedDate') final DateTime? updatedDate,
      @JsonKey(name: 'IsRequestBuy') final bool? isRequestBuy,
      @JsonKey(name: 'Status') final int? status,
      @JsonKey(name: 'IsRequestBGDApproved') final bool? isRequestBGDApproved,
      @JsonKey(name: 'CoordinationDepartment')
      final String? coordinationDepartment,
      @JsonKey(name: 'RequiredDepartment') final String? requiredDepartment,
      @JsonKey(name: 'EmployeeName') final String? employeeName,
      @JsonKey(name: 'EmployeeDepartment') final String? employeeDepartment,
      @JsonKey(name: 'Step') final int? step,
      @JsonKey(name: 'StepApproved') final int? stepApproved,
      @JsonKey(name: 'IsApproved') final int? isApproved,
      @JsonKey(name: 'IsApprovedText') final String? isApprovedText,
      @JsonKey(name: 'StatusText') final String? statusText,
      @JsonKey(name: 'Note') final String? note,
      @JsonKey(name: 'FullNameApprovedTBP') final String? fullNameApprovedTBP,
      @JsonKey(name: 'ReasonCancel') final String? reasonCancel,
      @JsonKey(name: 'IsRequestPriceQuote') final bool? isRequestPriceQuote,
      @JsonKey(name: 'DepartmentID') final int? departmentID,
      @JsonKey(name: 'ChucVuHDID') final int? chucVuHDID,
      @JsonKey(name: 'ChucVu')
      final String? chucVu}) = _$WorkRequirementItemImpl;

  factory _WorkRequirementItem.fromJson(Map<String, dynamic> json) =
      _$WorkRequirementItemImpl.fromJson;

  @override
  @JsonKey(name: 'RowIndex')
  int? get rowIndex;
  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'NumberRequest')
  String? get numberRequest;
  @override
  @JsonKey(name: 'DateRequest')
  DateTime? get dateRequest;
  @override
  @JsonKey(name: 'DeadlineRequest')
  DateTime? get deadlineRequest;
  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(name: 'CoordinationDepartmentID')
  int? get coordinationDepartmentID;
  @override
  @JsonKey(name: 'RequiredDepartmentID')
  int? get requiredDepartmentID;
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
  @JsonKey(name: 'IsApprovedHR')
  bool? get isApprovedHR;
  @override
  @JsonKey(name: 'DateApprovedHR')
  DateTime? get dateApprovedHR;
  @override
  @JsonKey(name: 'ApprovedHRID')
  int? get approvedHRID;
  @override
  @JsonKey(name: 'IsApprovedBGD')
  bool? get isApprovedBGD;
  @override
  @JsonKey(name: 'DateApprovedBGD')
  DateTime? get dateApprovedBGD;
  @override
  @JsonKey(name: 'ApprovedBGDID')
  int? get approvedBGDID;
  @override
  @JsonKey(name: 'EvaluateCompletion')
  String? get evaluateCompletion;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
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
  @JsonKey(name: 'IsRequestBuy')
  bool? get isRequestBuy;
  @override
  @JsonKey(name: 'Status')
  int? get status;
  @override
  @JsonKey(name: 'IsRequestBGDApproved')
  bool? get isRequestBGDApproved;
  @override
  @JsonKey(name: 'CoordinationDepartment')
  String? get coordinationDepartment;
  @override
  @JsonKey(name: 'RequiredDepartment')
  String? get requiredDepartment;
  @override
  @JsonKey(name: 'EmployeeName')
  String? get employeeName;
  @override
  @JsonKey(name: 'EmployeeDepartment')
  String? get employeeDepartment;
  @override
  @JsonKey(name: 'Step')
  int? get step;
  @override
  @JsonKey(name: 'StepApproved')
  int? get stepApproved;
  @override
  @JsonKey(name: 'IsApproved')
  int? get isApproved;
  @override
  @JsonKey(name: 'IsApprovedText')
  String? get isApprovedText;
  @override
  @JsonKey(name: 'StatusText')
  String? get statusText;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'FullNameApprovedTBP')
  String? get fullNameApprovedTBP;
  @override
  @JsonKey(name: 'ReasonCancel')
  String? get reasonCancel;
  @override
  @JsonKey(name: 'IsRequestPriceQuote')
  bool? get isRequestPriceQuote;
  @override
  @JsonKey(name: 'DepartmentID')
  int? get departmentID;
  @override
  @JsonKey(name: 'ChucVuHDID')
  int? get chucVuHDID;
  @override
  @JsonKey(name: 'ChucVu')
  String? get chucVu;
  @override
  @JsonKey(ignore: true)
  _$$WorkRequirementItemImplCopyWith<_$WorkRequirementItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WorkRequirementDepartmentItem _$WorkRequirementDepartmentItemFromJson(
    Map<String, dynamic> json) {
  return _WorkRequirementDepartmentItem.fromJson(json);
}

/// @nodoc
mixin _$WorkRequirementDepartmentItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkRequirementDepartmentItemCopyWith<WorkRequirementDepartmentItem>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkRequirementDepartmentItemCopyWith<$Res> {
  factory $WorkRequirementDepartmentItemCopyWith(
          WorkRequirementDepartmentItem value,
          $Res Function(WorkRequirementDepartmentItem) then) =
      _$WorkRequirementDepartmentItemCopyWithImpl<$Res,
          WorkRequirementDepartmentItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'Code') String? code});
}

/// @nodoc
class _$WorkRequirementDepartmentItemCopyWithImpl<$Res,
        $Val extends WorkRequirementDepartmentItem>
    implements $WorkRequirementDepartmentItemCopyWith<$Res> {
  _$WorkRequirementDepartmentItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? code = freezed,
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
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkRequirementDepartmentItemImplCopyWith<$Res>
    implements $WorkRequirementDepartmentItemCopyWith<$Res> {
  factory _$$WorkRequirementDepartmentItemImplCopyWith(
          _$WorkRequirementDepartmentItemImpl value,
          $Res Function(_$WorkRequirementDepartmentItemImpl) then) =
      __$$WorkRequirementDepartmentItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'Code') String? code});
}

/// @nodoc
class __$$WorkRequirementDepartmentItemImplCopyWithImpl<$Res>
    extends _$WorkRequirementDepartmentItemCopyWithImpl<$Res,
        _$WorkRequirementDepartmentItemImpl>
    implements _$$WorkRequirementDepartmentItemImplCopyWith<$Res> {
  __$$WorkRequirementDepartmentItemImplCopyWithImpl(
      _$WorkRequirementDepartmentItemImpl _value,
      $Res Function(_$WorkRequirementDepartmentItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? code = freezed,
  }) {
    return _then(_$WorkRequirementDepartmentItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkRequirementDepartmentItemImpl
    implements _WorkRequirementDepartmentItem {
  const _$WorkRequirementDepartmentItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Name') this.name,
      @JsonKey(name: 'Code') this.code});

  factory _$WorkRequirementDepartmentItemImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$WorkRequirementDepartmentItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'Name')
  final String? name;
  @override
  @JsonKey(name: 'Code')
  final String? code;

  @override
  String toString() {
    return 'WorkRequirementDepartmentItem(id: $id, name: $name, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkRequirementDepartmentItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkRequirementDepartmentItemImplCopyWith<
          _$WorkRequirementDepartmentItemImpl>
      get copyWith => __$$WorkRequirementDepartmentItemImplCopyWithImpl<
          _$WorkRequirementDepartmentItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkRequirementDepartmentItemImplToJson(
      this,
    );
  }
}

abstract class _WorkRequirementDepartmentItem
    implements WorkRequirementDepartmentItem {
  const factory _WorkRequirementDepartmentItem(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'Name') final String? name,
          @JsonKey(name: 'Code') final String? code}) =
      _$WorkRequirementDepartmentItemImpl;

  factory _WorkRequirementDepartmentItem.fromJson(Map<String, dynamic> json) =
      _$WorkRequirementDepartmentItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'Name')
  String? get name;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$WorkRequirementDepartmentItemImplCopyWith<
          _$WorkRequirementDepartmentItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WorkRequirementApproverItem _$WorkRequirementApproverItemFromJson(
    Map<String, dynamic> json) {
  return _WorkRequirementApproverItem.fromJson(json);
}

/// @nodoc
mixin _$WorkRequirementApproverItem {
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentName')
  String? get departmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullName')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkRequirementApproverItemCopyWith<WorkRequirementApproverItem>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkRequirementApproverItemCopyWith<$Res> {
  factory $WorkRequirementApproverItemCopyWith(
          WorkRequirementApproverItem value,
          $Res Function(WorkRequirementApproverItem) then) =
      _$WorkRequirementApproverItemCopyWithImpl<$Res,
          WorkRequirementApproverItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'Code') String? code});
}

/// @nodoc
class _$WorkRequirementApproverItemCopyWithImpl<$Res,
        $Val extends WorkRequirementApproverItem>
    implements $WorkRequirementApproverItemCopyWith<$Res> {
  _$WorkRequirementApproverItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeId = freezed,
    Object? departmentName = freezed,
    Object? fullName = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkRequirementApproverItemImplCopyWith<$Res>
    implements $WorkRequirementApproverItemCopyWith<$Res> {
  factory _$$WorkRequirementApproverItemImplCopyWith(
          _$WorkRequirementApproverItemImpl value,
          $Res Function(_$WorkRequirementApproverItemImpl) then) =
      __$$WorkRequirementApproverItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'Code') String? code});
}

/// @nodoc
class __$$WorkRequirementApproverItemImplCopyWithImpl<$Res>
    extends _$WorkRequirementApproverItemCopyWithImpl<$Res,
        _$WorkRequirementApproverItemImpl>
    implements _$$WorkRequirementApproverItemImplCopyWith<$Res> {
  __$$WorkRequirementApproverItemImplCopyWithImpl(
      _$WorkRequirementApproverItemImpl _value,
      $Res Function(_$WorkRequirementApproverItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeId = freezed,
    Object? departmentName = freezed,
    Object? fullName = freezed,
    Object? code = freezed,
  }) {
    return _then(_$WorkRequirementApproverItemImpl(
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkRequirementApproverItemImpl
    implements _WorkRequirementApproverItem {
  const _$WorkRequirementApproverItemImpl(
      {@JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'DepartmentName') this.departmentName,
      @JsonKey(name: 'FullName') this.fullName,
      @JsonKey(name: 'Code') this.code});

  factory _$WorkRequirementApproverItemImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$WorkRequirementApproverItemImplFromJson(json);

  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;
  @override
  @JsonKey(name: 'DepartmentName')
  final String? departmentName;
  @override
  @JsonKey(name: 'FullName')
  final String? fullName;
  @override
  @JsonKey(name: 'Code')
  final String? code;

  @override
  String toString() {
    return 'WorkRequirementApproverItem(employeeId: $employeeId, departmentName: $departmentName, fullName: $fullName, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkRequirementApproverItemImpl &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, employeeId, departmentName, fullName, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkRequirementApproverItemImplCopyWith<_$WorkRequirementApproverItemImpl>
      get copyWith => __$$WorkRequirementApproverItemImplCopyWithImpl<
          _$WorkRequirementApproverItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkRequirementApproverItemImplToJson(
      this,
    );
  }
}

abstract class _WorkRequirementApproverItem
    implements WorkRequirementApproverItem {
  const factory _WorkRequirementApproverItem(
          {@JsonKey(name: 'EmployeeID') final int? employeeId,
          @JsonKey(name: 'DepartmentName') final String? departmentName,
          @JsonKey(name: 'FullName') final String? fullName,
          @JsonKey(name: 'Code') final String? code}) =
      _$WorkRequirementApproverItemImpl;

  factory _WorkRequirementApproverItem.fromJson(Map<String, dynamic> json) =
      _$WorkRequirementApproverItemImpl.fromJson;

  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(name: 'DepartmentName')
  String? get departmentName;
  @override
  @JsonKey(name: 'FullName')
  String? get fullName;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$WorkRequirementApproverItemImplCopyWith<_$WorkRequirementApproverItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WorkRequirementApproveItem _$WorkRequirementApproveItemFromJson(
    Map<String, dynamic> json) {
  return _WorkRequirementApproveItem.fromJson(json);
}

/// @nodoc
mixin _$WorkRequirementApproveItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'JobRequirementID')
  int? get jobRequirementId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Step')
  int? get step => throw _privateConstructorUsedError;
  @JsonKey(name: 'StepName')
  String? get stepName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApproved')
  int? get isApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateApproved')
  DateTime? get dateApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedID')
  int? get approvedId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedActualID')
  int? get approvedActualId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReasonCancel')
  String? get reasonCancel => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContentLog')
  String? get contentLog => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedText')
  String? get isApprovedText => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeActualName')
  String? get employeeActualName => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeName')
  String? get employeeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkRequirementApproveItemCopyWith<WorkRequirementApproveItem>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkRequirementApproveItemCopyWith<$Res> {
  factory $WorkRequirementApproveItemCopyWith(WorkRequirementApproveItem value,
          $Res Function(WorkRequirementApproveItem) then) =
      _$WorkRequirementApproveItemCopyWithImpl<$Res,
          WorkRequirementApproveItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'JobRequirementID') int? jobRequirementId,
      @JsonKey(name: 'Step') int? step,
      @JsonKey(name: 'StepName') String? stepName,
      @JsonKey(name: 'IsApproved') int? isApproved,
      @JsonKey(name: 'DateApproved') DateTime? dateApproved,
      @JsonKey(name: 'ApprovedID') int? approvedId,
      @JsonKey(name: 'ApprovedActualID') int? approvedActualId,
      @JsonKey(name: 'ReasonCancel') String? reasonCancel,
      @JsonKey(name: 'ContentLog') String? contentLog,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'IsApprovedText') String? isApprovedText,
      @JsonKey(name: 'EmployeeActualName') String? employeeActualName,
      @JsonKey(name: 'EmployeeName') String? employeeName});
}

/// @nodoc
class _$WorkRequirementApproveItemCopyWithImpl<$Res,
        $Val extends WorkRequirementApproveItem>
    implements $WorkRequirementApproveItemCopyWith<$Res> {
  _$WorkRequirementApproveItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? jobRequirementId = freezed,
    Object? step = freezed,
    Object? stepName = freezed,
    Object? isApproved = freezed,
    Object? dateApproved = freezed,
    Object? approvedId = freezed,
    Object? approvedActualId = freezed,
    Object? reasonCancel = freezed,
    Object? contentLog = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? isApprovedText = freezed,
    Object? employeeActualName = freezed,
    Object? employeeName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      jobRequirementId: freezed == jobRequirementId
          ? _value.jobRequirementId
          : jobRequirementId // ignore: cast_nullable_to_non_nullable
              as int?,
      step: freezed == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int?,
      stepName: freezed == stepName
          ? _value.stepName
          : stepName // ignore: cast_nullable_to_non_nullable
              as String?,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as int?,
      dateApproved: freezed == dateApproved
          ? _value.dateApproved
          : dateApproved // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      approvedId: freezed == approvedId
          ? _value.approvedId
          : approvedId // ignore: cast_nullable_to_non_nullable
              as int?,
      approvedActualId: freezed == approvedActualId
          ? _value.approvedActualId
          : approvedActualId // ignore: cast_nullable_to_non_nullable
              as int?,
      reasonCancel: freezed == reasonCancel
          ? _value.reasonCancel
          : reasonCancel // ignore: cast_nullable_to_non_nullable
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
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isApprovedText: freezed == isApprovedText
          ? _value.isApprovedText
          : isApprovedText // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeActualName: freezed == employeeActualName
          ? _value.employeeActualName
          : employeeActualName // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkRequirementApproveItemImplCopyWith<$Res>
    implements $WorkRequirementApproveItemCopyWith<$Res> {
  factory _$$WorkRequirementApproveItemImplCopyWith(
          _$WorkRequirementApproveItemImpl value,
          $Res Function(_$WorkRequirementApproveItemImpl) then) =
      __$$WorkRequirementApproveItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'JobRequirementID') int? jobRequirementId,
      @JsonKey(name: 'Step') int? step,
      @JsonKey(name: 'StepName') String? stepName,
      @JsonKey(name: 'IsApproved') int? isApproved,
      @JsonKey(name: 'DateApproved') DateTime? dateApproved,
      @JsonKey(name: 'ApprovedID') int? approvedId,
      @JsonKey(name: 'ApprovedActualID') int? approvedActualId,
      @JsonKey(name: 'ReasonCancel') String? reasonCancel,
      @JsonKey(name: 'ContentLog') String? contentLog,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'IsApprovedText') String? isApprovedText,
      @JsonKey(name: 'EmployeeActualName') String? employeeActualName,
      @JsonKey(name: 'EmployeeName') String? employeeName});
}

/// @nodoc
class __$$WorkRequirementApproveItemImplCopyWithImpl<$Res>
    extends _$WorkRequirementApproveItemCopyWithImpl<$Res,
        _$WorkRequirementApproveItemImpl>
    implements _$$WorkRequirementApproveItemImplCopyWith<$Res> {
  __$$WorkRequirementApproveItemImplCopyWithImpl(
      _$WorkRequirementApproveItemImpl _value,
      $Res Function(_$WorkRequirementApproveItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? jobRequirementId = freezed,
    Object? step = freezed,
    Object? stepName = freezed,
    Object? isApproved = freezed,
    Object? dateApproved = freezed,
    Object? approvedId = freezed,
    Object? approvedActualId = freezed,
    Object? reasonCancel = freezed,
    Object? contentLog = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? isApprovedText = freezed,
    Object? employeeActualName = freezed,
    Object? employeeName = freezed,
  }) {
    return _then(_$WorkRequirementApproveItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      jobRequirementId: freezed == jobRequirementId
          ? _value.jobRequirementId
          : jobRequirementId // ignore: cast_nullable_to_non_nullable
              as int?,
      step: freezed == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int?,
      stepName: freezed == stepName
          ? _value.stepName
          : stepName // ignore: cast_nullable_to_non_nullable
              as String?,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as int?,
      dateApproved: freezed == dateApproved
          ? _value.dateApproved
          : dateApproved // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      approvedId: freezed == approvedId
          ? _value.approvedId
          : approvedId // ignore: cast_nullable_to_non_nullable
              as int?,
      approvedActualId: freezed == approvedActualId
          ? _value.approvedActualId
          : approvedActualId // ignore: cast_nullable_to_non_nullable
              as int?,
      reasonCancel: freezed == reasonCancel
          ? _value.reasonCancel
          : reasonCancel // ignore: cast_nullable_to_non_nullable
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
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isApprovedText: freezed == isApprovedText
          ? _value.isApprovedText
          : isApprovedText // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeActualName: freezed == employeeActualName
          ? _value.employeeActualName
          : employeeActualName // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkRequirementApproveItemImpl implements _WorkRequirementApproveItem {
  const _$WorkRequirementApproveItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'JobRequirementID') this.jobRequirementId,
      @JsonKey(name: 'Step') this.step,
      @JsonKey(name: 'StepName') this.stepName,
      @JsonKey(name: 'IsApproved') this.isApproved,
      @JsonKey(name: 'DateApproved') this.dateApproved,
      @JsonKey(name: 'ApprovedID') this.approvedId,
      @JsonKey(name: 'ApprovedActualID') this.approvedActualId,
      @JsonKey(name: 'ReasonCancel') this.reasonCancel,
      @JsonKey(name: 'ContentLog') this.contentLog,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'IsApprovedText') this.isApprovedText,
      @JsonKey(name: 'EmployeeActualName') this.employeeActualName,
      @JsonKey(name: 'EmployeeName') this.employeeName});

  factory _$WorkRequirementApproveItemImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$WorkRequirementApproveItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'JobRequirementID')
  final int? jobRequirementId;
  @override
  @JsonKey(name: 'Step')
  final int? step;
  @override
  @JsonKey(name: 'StepName')
  final String? stepName;
  @override
  @JsonKey(name: 'IsApproved')
  final int? isApproved;
  @override
  @JsonKey(name: 'DateApproved')
  final DateTime? dateApproved;
  @override
  @JsonKey(name: 'ApprovedID')
  final int? approvedId;
  @override
  @JsonKey(name: 'ApprovedActualID')
  final int? approvedActualId;
  @override
  @JsonKey(name: 'ReasonCancel')
  final String? reasonCancel;
  @override
  @JsonKey(name: 'ContentLog')
  final String? contentLog;
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
  @JsonKey(name: 'IsApprovedText')
  final String? isApprovedText;
  @override
  @JsonKey(name: 'EmployeeActualName')
  final String? employeeActualName;
  @override
  @JsonKey(name: 'EmployeeName')
  final String? employeeName;

  @override
  String toString() {
    return 'WorkRequirementApproveItem(id: $id, jobRequirementId: $jobRequirementId, step: $step, stepName: $stepName, isApproved: $isApproved, dateApproved: $dateApproved, approvedId: $approvedId, approvedActualId: $approvedActualId, reasonCancel: $reasonCancel, contentLog: $contentLog, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate, isApprovedText: $isApprovedText, employeeActualName: $employeeActualName, employeeName: $employeeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkRequirementApproveItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.jobRequirementId, jobRequirementId) ||
                other.jobRequirementId == jobRequirementId) &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.stepName, stepName) ||
                other.stepName == stepName) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved) &&
            (identical(other.dateApproved, dateApproved) ||
                other.dateApproved == dateApproved) &&
            (identical(other.approvedId, approvedId) ||
                other.approvedId == approvedId) &&
            (identical(other.approvedActualId, approvedActualId) ||
                other.approvedActualId == approvedActualId) &&
            (identical(other.reasonCancel, reasonCancel) ||
                other.reasonCancel == reasonCancel) &&
            (identical(other.contentLog, contentLog) ||
                other.contentLog == contentLog) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.isApprovedText, isApprovedText) ||
                other.isApprovedText == isApprovedText) &&
            (identical(other.employeeActualName, employeeActualName) ||
                other.employeeActualName == employeeActualName) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      jobRequirementId,
      step,
      stepName,
      isApproved,
      dateApproved,
      approvedId,
      approvedActualId,
      reasonCancel,
      contentLog,
      createdBy,
      createdDate,
      updatedBy,
      updatedDate,
      isApprovedText,
      employeeActualName,
      employeeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkRequirementApproveItemImplCopyWith<_$WorkRequirementApproveItemImpl>
      get copyWith => __$$WorkRequirementApproveItemImplCopyWithImpl<
          _$WorkRequirementApproveItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkRequirementApproveItemImplToJson(
      this,
    );
  }
}

abstract class _WorkRequirementApproveItem
    implements WorkRequirementApproveItem {
  const factory _WorkRequirementApproveItem(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'JobRequirementID') final int? jobRequirementId,
          @JsonKey(name: 'Step') final int? step,
          @JsonKey(name: 'StepName') final String? stepName,
          @JsonKey(name: 'IsApproved') final int? isApproved,
          @JsonKey(name: 'DateApproved') final DateTime? dateApproved,
          @JsonKey(name: 'ApprovedID') final int? approvedId,
          @JsonKey(name: 'ApprovedActualID') final int? approvedActualId,
          @JsonKey(name: 'ReasonCancel') final String? reasonCancel,
          @JsonKey(name: 'ContentLog') final String? contentLog,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy,
          @JsonKey(name: 'UpdatedDate') final DateTime? updatedDate,
          @JsonKey(name: 'IsApprovedText') final String? isApprovedText,
          @JsonKey(name: 'EmployeeActualName') final String? employeeActualName,
          @JsonKey(name: 'EmployeeName') final String? employeeName}) =
      _$WorkRequirementApproveItemImpl;

  factory _WorkRequirementApproveItem.fromJson(Map<String, dynamic> json) =
      _$WorkRequirementApproveItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'JobRequirementID')
  int? get jobRequirementId;
  @override
  @JsonKey(name: 'Step')
  int? get step;
  @override
  @JsonKey(name: 'StepName')
  String? get stepName;
  @override
  @JsonKey(name: 'IsApproved')
  int? get isApproved;
  @override
  @JsonKey(name: 'DateApproved')
  DateTime? get dateApproved;
  @override
  @JsonKey(name: 'ApprovedID')
  int? get approvedId;
  @override
  @JsonKey(name: 'ApprovedActualID')
  int? get approvedActualId;
  @override
  @JsonKey(name: 'ReasonCancel')
  String? get reasonCancel;
  @override
  @JsonKey(name: 'ContentLog')
  String? get contentLog;
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
  @JsonKey(name: 'IsApprovedText')
  String? get isApprovedText;
  @override
  @JsonKey(name: 'EmployeeActualName')
  String? get employeeActualName;
  @override
  @JsonKey(name: 'EmployeeName')
  String? get employeeName;
  @override
  @JsonKey(ignore: true)
  _$$WorkRequirementApproveItemImplCopyWith<_$WorkRequirementApproveItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WorkRequirementFileItem _$WorkRequirementFileItemFromJson(
    Map<String, dynamic> json) {
  return _WorkRequirementFileItem.fromJson(json);
}

/// @nodoc
mixin _$WorkRequirementFileItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'JobRequirementID')
  int? get jobRequirementId => throw _privateConstructorUsedError;
  @JsonKey(name: 'FileName')
  String? get fileName => throw _privateConstructorUsedError;
  @JsonKey(name: 'FilePath')
  String? get filePath => throw _privateConstructorUsedError;
  @JsonKey(name: 'FileType')
  String? get fileType => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkRequirementFileItemCopyWith<WorkRequirementFileItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkRequirementFileItemCopyWith<$Res> {
  factory $WorkRequirementFileItemCopyWith(WorkRequirementFileItem value,
          $Res Function(WorkRequirementFileItem) then) =
      _$WorkRequirementFileItemCopyWithImpl<$Res, WorkRequirementFileItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'JobRequirementID') int? jobRequirementId,
      @JsonKey(name: 'FileName') String? fileName,
      @JsonKey(name: 'FilePath') String? filePath,
      @JsonKey(name: 'FileType') String? fileType,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate});
}

/// @nodoc
class _$WorkRequirementFileItemCopyWithImpl<$Res,
        $Val extends WorkRequirementFileItem>
    implements $WorkRequirementFileItemCopyWith<$Res> {
  _$WorkRequirementFileItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? jobRequirementId = freezed,
    Object? fileName = freezed,
    Object? filePath = freezed,
    Object? fileType = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      jobRequirementId: freezed == jobRequirementId
          ? _value.jobRequirementId
          : jobRequirementId // ignore: cast_nullable_to_non_nullable
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
abstract class _$$WorkRequirementFileItemImplCopyWith<$Res>
    implements $WorkRequirementFileItemCopyWith<$Res> {
  factory _$$WorkRequirementFileItemImplCopyWith(
          _$WorkRequirementFileItemImpl value,
          $Res Function(_$WorkRequirementFileItemImpl) then) =
      __$$WorkRequirementFileItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'JobRequirementID') int? jobRequirementId,
      @JsonKey(name: 'FileName') String? fileName,
      @JsonKey(name: 'FilePath') String? filePath,
      @JsonKey(name: 'FileType') String? fileType,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate});
}

/// @nodoc
class __$$WorkRequirementFileItemImplCopyWithImpl<$Res>
    extends _$WorkRequirementFileItemCopyWithImpl<$Res,
        _$WorkRequirementFileItemImpl>
    implements _$$WorkRequirementFileItemImplCopyWith<$Res> {
  __$$WorkRequirementFileItemImplCopyWithImpl(
      _$WorkRequirementFileItemImpl _value,
      $Res Function(_$WorkRequirementFileItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? jobRequirementId = freezed,
    Object? fileName = freezed,
    Object? filePath = freezed,
    Object? fileType = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_$WorkRequirementFileItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      jobRequirementId: freezed == jobRequirementId
          ? _value.jobRequirementId
          : jobRequirementId // ignore: cast_nullable_to_non_nullable
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
class _$WorkRequirementFileItemImpl implements _WorkRequirementFileItem {
  const _$WorkRequirementFileItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'JobRequirementID') this.jobRequirementId,
      @JsonKey(name: 'FileName') this.fileName,
      @JsonKey(name: 'FilePath') this.filePath,
      @JsonKey(name: 'FileType') this.fileType,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate});

  factory _$WorkRequirementFileItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkRequirementFileItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'JobRequirementID')
  final int? jobRequirementId;
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
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'CreatedDate')
  final DateTime? createdDate;

  @override
  String toString() {
    return 'WorkRequirementFileItem(id: $id, jobRequirementId: $jobRequirementId, fileName: $fileName, filePath: $filePath, fileType: $fileType, createdBy: $createdBy, createdDate: $createdDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkRequirementFileItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.jobRequirementId, jobRequirementId) ||
                other.jobRequirementId == jobRequirementId) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, jobRequirementId, fileName,
      filePath, fileType, createdBy, createdDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkRequirementFileItemImplCopyWith<_$WorkRequirementFileItemImpl>
      get copyWith => __$$WorkRequirementFileItemImplCopyWithImpl<
          _$WorkRequirementFileItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkRequirementFileItemImplToJson(
      this,
    );
  }
}

abstract class _WorkRequirementFileItem implements WorkRequirementFileItem {
  const factory _WorkRequirementFileItem(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'JobRequirementID') final int? jobRequirementId,
          @JsonKey(name: 'FileName') final String? fileName,
          @JsonKey(name: 'FilePath') final String? filePath,
          @JsonKey(name: 'FileType') final String? fileType,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'CreatedDate') final DateTime? createdDate}) =
      _$WorkRequirementFileItemImpl;

  factory _WorkRequirementFileItem.fromJson(Map<String, dynamic> json) =
      _$WorkRequirementFileItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'JobRequirementID')
  int? get jobRequirementId;
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
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate;
  @override
  @JsonKey(ignore: true)
  _$$WorkRequirementFileItemImplCopyWith<_$WorkRequirementFileItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WorkRequirementDetailCategory _$WorkRequirementDetailCategoryFromJson(
    Map<String, dynamic> json) {
  return _WorkRequirementDetailCategory.fromJson(json);
}

/// @nodoc
mixin _$WorkRequirementDetailCategory {
  @JsonKey(name: 'JobRequirementID')
  int? get jobRequirementId => throw _privateConstructorUsedError;
  @JsonKey(name: 'RequestContent')
  String? get requestContent => throw _privateConstructorUsedError;
  @JsonKey(name: 'RequestedBy')
  String? get requestedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'Reason')
  String? get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'Quantity')
  String? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'Quality')
  String? get quality => throw _privateConstructorUsedError;
  @JsonKey(name: 'Location')
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'DeadlineDate')
  String? get deadlineDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'Unit')
  String? get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'RequestContentNote')
  String? get requestContentNote => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkRequirementDetailCategoryCopyWith<WorkRequirementDetailCategory>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkRequirementDetailCategoryCopyWith<$Res> {
  factory $WorkRequirementDetailCategoryCopyWith(
          WorkRequirementDetailCategory value,
          $Res Function(WorkRequirementDetailCategory) then) =
      _$WorkRequirementDetailCategoryCopyWithImpl<$Res,
          WorkRequirementDetailCategory>;
  @useResult
  $Res call(
      {@JsonKey(name: 'JobRequirementID') int? jobRequirementId,
      @JsonKey(name: 'RequestContent') String? requestContent,
      @JsonKey(name: 'RequestedBy') String? requestedBy,
      @JsonKey(name: 'Reason') String? reason,
      @JsonKey(name: 'Quantity') String? quantity,
      @JsonKey(name: 'Quality') String? quality,
      @JsonKey(name: 'Location') String? location,
      @JsonKey(name: 'DeadlineDate') String? deadlineDate,
      @JsonKey(name: 'Unit') String? unit,
      @JsonKey(name: 'RequestContentNote') String? requestContentNote});
}

/// @nodoc
class _$WorkRequirementDetailCategoryCopyWithImpl<$Res,
        $Val extends WorkRequirementDetailCategory>
    implements $WorkRequirementDetailCategoryCopyWith<$Res> {
  _$WorkRequirementDetailCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobRequirementId = freezed,
    Object? requestContent = freezed,
    Object? requestedBy = freezed,
    Object? reason = freezed,
    Object? quantity = freezed,
    Object? quality = freezed,
    Object? location = freezed,
    Object? deadlineDate = freezed,
    Object? unit = freezed,
    Object? requestContentNote = freezed,
  }) {
    return _then(_value.copyWith(
      jobRequirementId: freezed == jobRequirementId
          ? _value.jobRequirementId
          : jobRequirementId // ignore: cast_nullable_to_non_nullable
              as int?,
      requestContent: freezed == requestContent
          ? _value.requestContent
          : requestContent // ignore: cast_nullable_to_non_nullable
              as String?,
      requestedBy: freezed == requestedBy
          ? _value.requestedBy
          : requestedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String?,
      quality: freezed == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      deadlineDate: freezed == deadlineDate
          ? _value.deadlineDate
          : deadlineDate // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      requestContentNote: freezed == requestContentNote
          ? _value.requestContentNote
          : requestContentNote // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkRequirementDetailCategoryImplCopyWith<$Res>
    implements $WorkRequirementDetailCategoryCopyWith<$Res> {
  factory _$$WorkRequirementDetailCategoryImplCopyWith(
          _$WorkRequirementDetailCategoryImpl value,
          $Res Function(_$WorkRequirementDetailCategoryImpl) then) =
      __$$WorkRequirementDetailCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'JobRequirementID') int? jobRequirementId,
      @JsonKey(name: 'RequestContent') String? requestContent,
      @JsonKey(name: 'RequestedBy') String? requestedBy,
      @JsonKey(name: 'Reason') String? reason,
      @JsonKey(name: 'Quantity') String? quantity,
      @JsonKey(name: 'Quality') String? quality,
      @JsonKey(name: 'Location') String? location,
      @JsonKey(name: 'DeadlineDate') String? deadlineDate,
      @JsonKey(name: 'Unit') String? unit,
      @JsonKey(name: 'RequestContentNote') String? requestContentNote});
}

/// @nodoc
class __$$WorkRequirementDetailCategoryImplCopyWithImpl<$Res>
    extends _$WorkRequirementDetailCategoryCopyWithImpl<$Res,
        _$WorkRequirementDetailCategoryImpl>
    implements _$$WorkRequirementDetailCategoryImplCopyWith<$Res> {
  __$$WorkRequirementDetailCategoryImplCopyWithImpl(
      _$WorkRequirementDetailCategoryImpl _value,
      $Res Function(_$WorkRequirementDetailCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobRequirementId = freezed,
    Object? requestContent = freezed,
    Object? requestedBy = freezed,
    Object? reason = freezed,
    Object? quantity = freezed,
    Object? quality = freezed,
    Object? location = freezed,
    Object? deadlineDate = freezed,
    Object? unit = freezed,
    Object? requestContentNote = freezed,
  }) {
    return _then(_$WorkRequirementDetailCategoryImpl(
      jobRequirementId: freezed == jobRequirementId
          ? _value.jobRequirementId
          : jobRequirementId // ignore: cast_nullable_to_non_nullable
              as int?,
      requestContent: freezed == requestContent
          ? _value.requestContent
          : requestContent // ignore: cast_nullable_to_non_nullable
              as String?,
      requestedBy: freezed == requestedBy
          ? _value.requestedBy
          : requestedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String?,
      quality: freezed == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      deadlineDate: freezed == deadlineDate
          ? _value.deadlineDate
          : deadlineDate // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      requestContentNote: freezed == requestContentNote
          ? _value.requestContentNote
          : requestContentNote // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkRequirementDetailCategoryImpl
    implements _WorkRequirementDetailCategory {
  const _$WorkRequirementDetailCategoryImpl(
      {@JsonKey(name: 'JobRequirementID') this.jobRequirementId,
      @JsonKey(name: 'RequestContent') this.requestContent,
      @JsonKey(name: 'RequestedBy') this.requestedBy,
      @JsonKey(name: 'Reason') this.reason,
      @JsonKey(name: 'Quantity') this.quantity,
      @JsonKey(name: 'Quality') this.quality,
      @JsonKey(name: 'Location') this.location,
      @JsonKey(name: 'DeadlineDate') this.deadlineDate,
      @JsonKey(name: 'Unit') this.unit,
      @JsonKey(name: 'RequestContentNote') this.requestContentNote});

  factory _$WorkRequirementDetailCategoryImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$WorkRequirementDetailCategoryImplFromJson(json);

  @override
  @JsonKey(name: 'JobRequirementID')
  final int? jobRequirementId;
  @override
  @JsonKey(name: 'RequestContent')
  final String? requestContent;
  @override
  @JsonKey(name: 'RequestedBy')
  final String? requestedBy;
  @override
  @JsonKey(name: 'Reason')
  final String? reason;
  @override
  @JsonKey(name: 'Quantity')
  final String? quantity;
  @override
  @JsonKey(name: 'Quality')
  final String? quality;
  @override
  @JsonKey(name: 'Location')
  final String? location;
  @override
  @JsonKey(name: 'DeadlineDate')
  final String? deadlineDate;
  @override
  @JsonKey(name: 'Unit')
  final String? unit;
  @override
  @JsonKey(name: 'RequestContentNote')
  final String? requestContentNote;

  @override
  String toString() {
    return 'WorkRequirementDetailCategory(jobRequirementId: $jobRequirementId, requestContent: $requestContent, requestedBy: $requestedBy, reason: $reason, quantity: $quantity, quality: $quality, location: $location, deadlineDate: $deadlineDate, unit: $unit, requestContentNote: $requestContentNote)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkRequirementDetailCategoryImpl &&
            (identical(other.jobRequirementId, jobRequirementId) ||
                other.jobRequirementId == jobRequirementId) &&
            (identical(other.requestContent, requestContent) ||
                other.requestContent == requestContent) &&
            (identical(other.requestedBy, requestedBy) ||
                other.requestedBy == requestedBy) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.quality, quality) || other.quality == quality) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.deadlineDate, deadlineDate) ||
                other.deadlineDate == deadlineDate) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.requestContentNote, requestContentNote) ||
                other.requestContentNote == requestContentNote));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      jobRequirementId,
      requestContent,
      requestedBy,
      reason,
      quantity,
      quality,
      location,
      deadlineDate,
      unit,
      requestContentNote);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkRequirementDetailCategoryImplCopyWith<
          _$WorkRequirementDetailCategoryImpl>
      get copyWith => __$$WorkRequirementDetailCategoryImplCopyWithImpl<
          _$WorkRequirementDetailCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkRequirementDetailCategoryImplToJson(
      this,
    );
  }
}

abstract class _WorkRequirementDetailCategory
    implements WorkRequirementDetailCategory {
  const factory _WorkRequirementDetailCategory(
      {@JsonKey(name: 'JobRequirementID') final int? jobRequirementId,
      @JsonKey(name: 'RequestContent') final String? requestContent,
      @JsonKey(name: 'RequestedBy') final String? requestedBy,
      @JsonKey(name: 'Reason') final String? reason,
      @JsonKey(name: 'Quantity') final String? quantity,
      @JsonKey(name: 'Quality') final String? quality,
      @JsonKey(name: 'Location') final String? location,
      @JsonKey(name: 'DeadlineDate') final String? deadlineDate,
      @JsonKey(name: 'Unit') final String? unit,
      @JsonKey(name: 'RequestContentNote')
      final String? requestContentNote}) = _$WorkRequirementDetailCategoryImpl;

  factory _WorkRequirementDetailCategory.fromJson(Map<String, dynamic> json) =
      _$WorkRequirementDetailCategoryImpl.fromJson;

  @override
  @JsonKey(name: 'JobRequirementID')
  int? get jobRequirementId;
  @override
  @JsonKey(name: 'RequestContent')
  String? get requestContent;
  @override
  @JsonKey(name: 'RequestedBy')
  String? get requestedBy;
  @override
  @JsonKey(name: 'Reason')
  String? get reason;
  @override
  @JsonKey(name: 'Quantity')
  String? get quantity;
  @override
  @JsonKey(name: 'Quality')
  String? get quality;
  @override
  @JsonKey(name: 'Location')
  String? get location;
  @override
  @JsonKey(name: 'DeadlineDate')
  String? get deadlineDate;
  @override
  @JsonKey(name: 'Unit')
  String? get unit;
  @override
  @JsonKey(name: 'RequestContentNote')
  String? get requestContentNote;
  @override
  @JsonKey(ignore: true)
  _$$WorkRequirementDetailCategoryImplCopyWith<
          _$WorkRequirementDetailCategoryImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WorkRequirementDetailData _$WorkRequirementDetailDataFromJson(
    Map<String, dynamic> json) {
  return _WorkRequirementDetailData.fromJson(json);
}

/// @nodoc
mixin _$WorkRequirementDetailData {
  @JsonKey(name: 'details')
  List<WorkRequirementDetailResponse>? get details =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'approves')
  List<WorkRequirementApproveItem>? get approves =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'files')
  List<WorkRequirementFileItem>? get files =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'detailsCategory')
  List<WorkRequirementDetailCategory>? get detailsCategory =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkRequirementDetailDataCopyWith<WorkRequirementDetailData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkRequirementDetailDataCopyWith<$Res> {
  factory $WorkRequirementDetailDataCopyWith(WorkRequirementDetailData value,
          $Res Function(WorkRequirementDetailData) then) =
      _$WorkRequirementDetailDataCopyWithImpl<$Res, WorkRequirementDetailData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'details') List<WorkRequirementDetailResponse>? details,
      @JsonKey(name: 'approves') List<WorkRequirementApproveItem>? approves,
      @JsonKey(name: 'files') List<WorkRequirementFileItem>? files,
      @JsonKey(name: 'detailsCategory')
      List<WorkRequirementDetailCategory>? detailsCategory});
}

/// @nodoc
class _$WorkRequirementDetailDataCopyWithImpl<$Res,
        $Val extends WorkRequirementDetailData>
    implements $WorkRequirementDetailDataCopyWith<$Res> {
  _$WorkRequirementDetailDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = freezed,
    Object? approves = freezed,
    Object? files = freezed,
    Object? detailsCategory = freezed,
  }) {
    return _then(_value.copyWith(
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<WorkRequirementDetailResponse>?,
      approves: freezed == approves
          ? _value.approves
          : approves // ignore: cast_nullable_to_non_nullable
              as List<WorkRequirementApproveItem>?,
      files: freezed == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<WorkRequirementFileItem>?,
      detailsCategory: freezed == detailsCategory
          ? _value.detailsCategory
          : detailsCategory // ignore: cast_nullable_to_non_nullable
              as List<WorkRequirementDetailCategory>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkRequirementDetailDataImplCopyWith<$Res>
    implements $WorkRequirementDetailDataCopyWith<$Res> {
  factory _$$WorkRequirementDetailDataImplCopyWith(
          _$WorkRequirementDetailDataImpl value,
          $Res Function(_$WorkRequirementDetailDataImpl) then) =
      __$$WorkRequirementDetailDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'details') List<WorkRequirementDetailResponse>? details,
      @JsonKey(name: 'approves') List<WorkRequirementApproveItem>? approves,
      @JsonKey(name: 'files') List<WorkRequirementFileItem>? files,
      @JsonKey(name: 'detailsCategory')
      List<WorkRequirementDetailCategory>? detailsCategory});
}

/// @nodoc
class __$$WorkRequirementDetailDataImplCopyWithImpl<$Res>
    extends _$WorkRequirementDetailDataCopyWithImpl<$Res,
        _$WorkRequirementDetailDataImpl>
    implements _$$WorkRequirementDetailDataImplCopyWith<$Res> {
  __$$WorkRequirementDetailDataImplCopyWithImpl(
      _$WorkRequirementDetailDataImpl _value,
      $Res Function(_$WorkRequirementDetailDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = freezed,
    Object? approves = freezed,
    Object? files = freezed,
    Object? detailsCategory = freezed,
  }) {
    return _then(_$WorkRequirementDetailDataImpl(
      details: freezed == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<WorkRequirementDetailResponse>?,
      approves: freezed == approves
          ? _value._approves
          : approves // ignore: cast_nullable_to_non_nullable
              as List<WorkRequirementApproveItem>?,
      files: freezed == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<WorkRequirementFileItem>?,
      detailsCategory: freezed == detailsCategory
          ? _value._detailsCategory
          : detailsCategory // ignore: cast_nullable_to_non_nullable
              as List<WorkRequirementDetailCategory>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkRequirementDetailDataImpl implements _WorkRequirementDetailData {
  const _$WorkRequirementDetailDataImpl(
      {@JsonKey(name: 'details')
      final List<WorkRequirementDetailResponse>? details,
      @JsonKey(name: 'approves')
      final List<WorkRequirementApproveItem>? approves,
      @JsonKey(name: 'files') final List<WorkRequirementFileItem>? files,
      @JsonKey(name: 'detailsCategory')
      final List<WorkRequirementDetailCategory>? detailsCategory})
      : _details = details,
        _approves = approves,
        _files = files,
        _detailsCategory = detailsCategory;

  factory _$WorkRequirementDetailDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkRequirementDetailDataImplFromJson(json);

  final List<WorkRequirementDetailResponse>? _details;
  @override
  @JsonKey(name: 'details')
  List<WorkRequirementDetailResponse>? get details {
    final value = _details;
    if (value == null) return null;
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<WorkRequirementApproveItem>? _approves;
  @override
  @JsonKey(name: 'approves')
  List<WorkRequirementApproveItem>? get approves {
    final value = _approves;
    if (value == null) return null;
    if (_approves is EqualUnmodifiableListView) return _approves;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<WorkRequirementFileItem>? _files;
  @override
  @JsonKey(name: 'files')
  List<WorkRequirementFileItem>? get files {
    final value = _files;
    if (value == null) return null;
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<WorkRequirementDetailCategory>? _detailsCategory;
  @override
  @JsonKey(name: 'detailsCategory')
  List<WorkRequirementDetailCategory>? get detailsCategory {
    final value = _detailsCategory;
    if (value == null) return null;
    if (_detailsCategory is EqualUnmodifiableListView) return _detailsCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WorkRequirementDetailData(details: $details, approves: $approves, files: $files, detailsCategory: $detailsCategory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkRequirementDetailDataImpl &&
            const DeepCollectionEquality().equals(other._details, _details) &&
            const DeepCollectionEquality().equals(other._approves, _approves) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            const DeepCollectionEquality()
                .equals(other._detailsCategory, _detailsCategory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_details),
      const DeepCollectionEquality().hash(_approves),
      const DeepCollectionEquality().hash(_files),
      const DeepCollectionEquality().hash(_detailsCategory));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkRequirementDetailDataImplCopyWith<_$WorkRequirementDetailDataImpl>
      get copyWith => __$$WorkRequirementDetailDataImplCopyWithImpl<
          _$WorkRequirementDetailDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkRequirementDetailDataImplToJson(
      this,
    );
  }
}

abstract class _WorkRequirementDetailData implements WorkRequirementDetailData {
  const factory _WorkRequirementDetailData(
          {@JsonKey(name: 'details')
          final List<WorkRequirementDetailResponse>? details,
          @JsonKey(name: 'approves')
          final List<WorkRequirementApproveItem>? approves,
          @JsonKey(name: 'files') final List<WorkRequirementFileItem>? files,
          @JsonKey(name: 'detailsCategory')
          final List<WorkRequirementDetailCategory>? detailsCategory}) =
      _$WorkRequirementDetailDataImpl;

  factory _WorkRequirementDetailData.fromJson(Map<String, dynamic> json) =
      _$WorkRequirementDetailDataImpl.fromJson;

  @override
  @JsonKey(name: 'details')
  List<WorkRequirementDetailResponse>? get details;
  @override
  @JsonKey(name: 'approves')
  List<WorkRequirementApproveItem>? get approves;
  @override
  @JsonKey(name: 'files')
  List<WorkRequirementFileItem>? get files;
  @override
  @JsonKey(name: 'detailsCategory')
  List<WorkRequirementDetailCategory>? get detailsCategory;
  @override
  @JsonKey(ignore: true)
  _$$WorkRequirementDetailDataImplCopyWith<_$WorkRequirementDetailDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WorkRequirementDetailResponse _$WorkRequirementDetailResponseFromJson(
    Map<String, dynamic> json) {
  return _WorkRequirementDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$WorkRequirementDetailResponse {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'JobRequirementID')
  int? get jobRequirementId => throw _privateConstructorUsedError;
  @JsonKey(name: 'STT')
  int? get stt => throw _privateConstructorUsedError;
  @JsonKey(name: 'Category')
  String? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'Description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'Target')
  String? get target => throw _privateConstructorUsedError;
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkRequirementDetailResponseCopyWith<WorkRequirementDetailResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkRequirementDetailResponseCopyWith<$Res> {
  factory $WorkRequirementDetailResponseCopyWith(
          WorkRequirementDetailResponse value,
          $Res Function(WorkRequirementDetailResponse) then) =
      _$WorkRequirementDetailResponseCopyWithImpl<$Res,
          WorkRequirementDetailResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'JobRequirementID') int? jobRequirementId,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'Category') String? category,
      @JsonKey(name: 'Description') String? description,
      @JsonKey(name: 'Target') String? target,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'IsDeleted') bool? isDeleted});
}

/// @nodoc
class _$WorkRequirementDetailResponseCopyWithImpl<$Res,
        $Val extends WorkRequirementDetailResponse>
    implements $WorkRequirementDetailResponseCopyWith<$Res> {
  _$WorkRequirementDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? jobRequirementId = freezed,
    Object? stt = freezed,
    Object? category = freezed,
    Object? description = freezed,
    Object? target = freezed,
    Object? note = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      jobRequirementId: freezed == jobRequirementId
          ? _value.jobRequirementId
          : jobRequirementId // ignore: cast_nullable_to_non_nullable
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
      target: freezed == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
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
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkRequirementDetailResponseImplCopyWith<$Res>
    implements $WorkRequirementDetailResponseCopyWith<$Res> {
  factory _$$WorkRequirementDetailResponseImplCopyWith(
          _$WorkRequirementDetailResponseImpl value,
          $Res Function(_$WorkRequirementDetailResponseImpl) then) =
      __$$WorkRequirementDetailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'JobRequirementID') int? jobRequirementId,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'Category') String? category,
      @JsonKey(name: 'Description') String? description,
      @JsonKey(name: 'Target') String? target,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'IsDeleted') bool? isDeleted});
}

/// @nodoc
class __$$WorkRequirementDetailResponseImplCopyWithImpl<$Res>
    extends _$WorkRequirementDetailResponseCopyWithImpl<$Res,
        _$WorkRequirementDetailResponseImpl>
    implements _$$WorkRequirementDetailResponseImplCopyWith<$Res> {
  __$$WorkRequirementDetailResponseImplCopyWithImpl(
      _$WorkRequirementDetailResponseImpl _value,
      $Res Function(_$WorkRequirementDetailResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? jobRequirementId = freezed,
    Object? stt = freezed,
    Object? category = freezed,
    Object? description = freezed,
    Object? target = freezed,
    Object? note = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_$WorkRequirementDetailResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      jobRequirementId: freezed == jobRequirementId
          ? _value.jobRequirementId
          : jobRequirementId // ignore: cast_nullable_to_non_nullable
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
      target: freezed == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
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
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkRequirementDetailResponseImpl
    implements _WorkRequirementDetailResponse {
  const _$WorkRequirementDetailResponseImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'JobRequirementID') this.jobRequirementId,
      @JsonKey(name: 'STT') this.stt,
      @JsonKey(name: 'Category') this.category,
      @JsonKey(name: 'Description') this.description,
      @JsonKey(name: 'Target') this.target,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'IsDeleted') this.isDeleted});

  factory _$WorkRequirementDetailResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$WorkRequirementDetailResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'JobRequirementID')
  final int? jobRequirementId;
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
  @JsonKey(name: 'Target')
  final String? target;
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
  String toString() {
    return 'WorkRequirementDetailResponse(id: $id, jobRequirementId: $jobRequirementId, stt: $stt, category: $category, description: $description, target: $target, note: $note, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkRequirementDetailResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.jobRequirementId, jobRequirementId) ||
                other.jobRequirementId == jobRequirementId) &&
            (identical(other.stt, stt) || other.stt == stt) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.target, target) || other.target == target) &&
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
                other.isDeleted == isDeleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      jobRequirementId,
      stt,
      category,
      description,
      target,
      note,
      createdBy,
      createdDate,
      updatedBy,
      updatedDate,
      isDeleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkRequirementDetailResponseImplCopyWith<
          _$WorkRequirementDetailResponseImpl>
      get copyWith => __$$WorkRequirementDetailResponseImplCopyWithImpl<
          _$WorkRequirementDetailResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkRequirementDetailResponseImplToJson(
      this,
    );
  }
}

abstract class _WorkRequirementDetailResponse
    implements WorkRequirementDetailResponse {
  const factory _WorkRequirementDetailResponse(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'JobRequirementID') final int? jobRequirementId,
          @JsonKey(name: 'STT') final int? stt,
          @JsonKey(name: 'Category') final String? category,
          @JsonKey(name: 'Description') final String? description,
          @JsonKey(name: 'Target') final String? target,
          @JsonKey(name: 'Note') final String? note,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy,
          @JsonKey(name: 'UpdatedDate') final DateTime? updatedDate,
          @JsonKey(name: 'IsDeleted') final bool? isDeleted}) =
      _$WorkRequirementDetailResponseImpl;

  factory _WorkRequirementDetailResponse.fromJson(Map<String, dynamic> json) =
      _$WorkRequirementDetailResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'JobRequirementID')
  int? get jobRequirementId;
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
  @JsonKey(name: 'Target')
  String? get target;
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
  @JsonKey(ignore: true)
  _$$WorkRequirementDetailResponseImplCopyWith<
          _$WorkRequirementDetailResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WorkRequirementSaveResponse _$WorkRequirementSaveResponseFromJson(
    Map<String, dynamic> json) {
  return _WorkRequirementSaveResponse.fromJson(json);
}

/// @nodoc
mixin _$WorkRequirementSaveResponse {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'NumberRequest')
  String? get numberRequest => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateRequest')
  DateTime? get dateRequest => throw _privateConstructorUsedError;
  @JsonKey(name: 'DeadlineRequest')
  DateTime? get deadlineRequest => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CoordinationDepartmentID')
  int? get coordinationDepartmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'RequiredDepartmentID')
  int? get requiredDepartmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedTBPID')
  int? get approvedTBPId => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedTBP')
  bool? get isApprovedTBP => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateApprovedTBP')
  DateTime? get dateApprovedTBP => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedHR')
  bool? get isApprovedHR => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateApprovedHR')
  DateTime? get dateApprovedHR => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedHRID')
  int? get approvedHRId => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedBGD')
  bool? get isApprovedBGD => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateApprovedBGD')
  DateTime? get dateApprovedBGD => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedBGDID')
  int? get approvedBGDId => throw _privateConstructorUsedError;
  @JsonKey(name: 'EvaluateCompletion')
  String? get evaluateCompletion => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsRequestBuy')
  bool? get isRequestBuy => throw _privateConstructorUsedError;
  @JsonKey(name: 'Status')
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsRequestBGDApproved')
  bool? get isRequestBGDApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsRequestPriceQuote')
  bool? get isRequestPriceQuote => throw _privateConstructorUsedError;
  @JsonKey(name: 'JobRequirementDetails')
  List<WorkRequirementDetailResponse>? get jobRequirementDetails =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'JobRequirementFiles')
  List<dynamic>? get jobRequirementFiles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkRequirementSaveResponseCopyWith<WorkRequirementSaveResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkRequirementSaveResponseCopyWith<$Res> {
  factory $WorkRequirementSaveResponseCopyWith(
          WorkRequirementSaveResponse value,
          $Res Function(WorkRequirementSaveResponse) then) =
      _$WorkRequirementSaveResponseCopyWithImpl<$Res,
          WorkRequirementSaveResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'NumberRequest') String? numberRequest,
      @JsonKey(name: 'DateRequest') DateTime? dateRequest,
      @JsonKey(name: 'DeadlineRequest') DateTime? deadlineRequest,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'CoordinationDepartmentID') int? coordinationDepartmentId,
      @JsonKey(name: 'RequiredDepartmentID') int? requiredDepartmentId,
      @JsonKey(name: 'ApprovedTBPID') int? approvedTBPId,
      @JsonKey(name: 'IsApprovedTBP') bool? isApprovedTBP,
      @JsonKey(name: 'DateApprovedTBP') DateTime? dateApprovedTBP,
      @JsonKey(name: 'IsApprovedHR') bool? isApprovedHR,
      @JsonKey(name: 'DateApprovedHR') DateTime? dateApprovedHR,
      @JsonKey(name: 'ApprovedHRID') int? approvedHRId,
      @JsonKey(name: 'IsApprovedBGD') bool? isApprovedBGD,
      @JsonKey(name: 'DateApprovedBGD') DateTime? dateApprovedBGD,
      @JsonKey(name: 'ApprovedBGDID') int? approvedBGDId,
      @JsonKey(name: 'EvaluateCompletion') String? evaluateCompletion,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'IsRequestBuy') bool? isRequestBuy,
      @JsonKey(name: 'Status') int? status,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'IsRequestBGDApproved') bool? isRequestBGDApproved,
      @JsonKey(name: 'IsRequestPriceQuote') bool? isRequestPriceQuote,
      @JsonKey(name: 'JobRequirementDetails')
      List<WorkRequirementDetailResponse>? jobRequirementDetails,
      @JsonKey(name: 'JobRequirementFiles')
      List<dynamic>? jobRequirementFiles});
}

/// @nodoc
class _$WorkRequirementSaveResponseCopyWithImpl<$Res,
        $Val extends WorkRequirementSaveResponse>
    implements $WorkRequirementSaveResponseCopyWith<$Res> {
  _$WorkRequirementSaveResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? numberRequest = freezed,
    Object? dateRequest = freezed,
    Object? deadlineRequest = freezed,
    Object? employeeId = freezed,
    Object? coordinationDepartmentId = freezed,
    Object? requiredDepartmentId = freezed,
    Object? approvedTBPId = freezed,
    Object? isApprovedTBP = freezed,
    Object? dateApprovedTBP = freezed,
    Object? isApprovedHR = freezed,
    Object? dateApprovedHR = freezed,
    Object? approvedHRId = freezed,
    Object? isApprovedBGD = freezed,
    Object? dateApprovedBGD = freezed,
    Object? approvedBGDId = freezed,
    Object? evaluateCompletion = freezed,
    Object? isDeleted = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? isRequestBuy = freezed,
    Object? status = freezed,
    Object? note = freezed,
    Object? isRequestBGDApproved = freezed,
    Object? isRequestPriceQuote = freezed,
    Object? jobRequirementDetails = freezed,
    Object? jobRequirementFiles = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      numberRequest: freezed == numberRequest
          ? _value.numberRequest
          : numberRequest // ignore: cast_nullable_to_non_nullable
              as String?,
      dateRequest: freezed == dateRequest
          ? _value.dateRequest
          : dateRequest // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deadlineRequest: freezed == deadlineRequest
          ? _value.deadlineRequest
          : deadlineRequest // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      coordinationDepartmentId: freezed == coordinationDepartmentId
          ? _value.coordinationDepartmentId
          : coordinationDepartmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      requiredDepartmentId: freezed == requiredDepartmentId
          ? _value.requiredDepartmentId
          : requiredDepartmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      approvedTBPId: freezed == approvedTBPId
          ? _value.approvedTBPId
          : approvedTBPId // ignore: cast_nullable_to_non_nullable
              as int?,
      isApprovedTBP: freezed == isApprovedTBP
          ? _value.isApprovedTBP
          : isApprovedTBP // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateApprovedTBP: freezed == dateApprovedTBP
          ? _value.dateApprovedTBP
          : dateApprovedTBP // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isApprovedHR: freezed == isApprovedHR
          ? _value.isApprovedHR
          : isApprovedHR // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateApprovedHR: freezed == dateApprovedHR
          ? _value.dateApprovedHR
          : dateApprovedHR // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      approvedHRId: freezed == approvedHRId
          ? _value.approvedHRId
          : approvedHRId // ignore: cast_nullable_to_non_nullable
              as int?,
      isApprovedBGD: freezed == isApprovedBGD
          ? _value.isApprovedBGD
          : isApprovedBGD // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateApprovedBGD: freezed == dateApprovedBGD
          ? _value.dateApprovedBGD
          : dateApprovedBGD // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      approvedBGDId: freezed == approvedBGDId
          ? _value.approvedBGDId
          : approvedBGDId // ignore: cast_nullable_to_non_nullable
              as int?,
      evaluateCompletion: freezed == evaluateCompletion
          ? _value.evaluateCompletion
          : evaluateCompletion // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isRequestBuy: freezed == isRequestBuy
          ? _value.isRequestBuy
          : isRequestBuy // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isRequestBGDApproved: freezed == isRequestBGDApproved
          ? _value.isRequestBGDApproved
          : isRequestBGDApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      isRequestPriceQuote: freezed == isRequestPriceQuote
          ? _value.isRequestPriceQuote
          : isRequestPriceQuote // ignore: cast_nullable_to_non_nullable
              as bool?,
      jobRequirementDetails: freezed == jobRequirementDetails
          ? _value.jobRequirementDetails
          : jobRequirementDetails // ignore: cast_nullable_to_non_nullable
              as List<WorkRequirementDetailResponse>?,
      jobRequirementFiles: freezed == jobRequirementFiles
          ? _value.jobRequirementFiles
          : jobRequirementFiles // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkRequirementSaveResponseImplCopyWith<$Res>
    implements $WorkRequirementSaveResponseCopyWith<$Res> {
  factory _$$WorkRequirementSaveResponseImplCopyWith(
          _$WorkRequirementSaveResponseImpl value,
          $Res Function(_$WorkRequirementSaveResponseImpl) then) =
      __$$WorkRequirementSaveResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'NumberRequest') String? numberRequest,
      @JsonKey(name: 'DateRequest') DateTime? dateRequest,
      @JsonKey(name: 'DeadlineRequest') DateTime? deadlineRequest,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'CoordinationDepartmentID') int? coordinationDepartmentId,
      @JsonKey(name: 'RequiredDepartmentID') int? requiredDepartmentId,
      @JsonKey(name: 'ApprovedTBPID') int? approvedTBPId,
      @JsonKey(name: 'IsApprovedTBP') bool? isApprovedTBP,
      @JsonKey(name: 'DateApprovedTBP') DateTime? dateApprovedTBP,
      @JsonKey(name: 'IsApprovedHR') bool? isApprovedHR,
      @JsonKey(name: 'DateApprovedHR') DateTime? dateApprovedHR,
      @JsonKey(name: 'ApprovedHRID') int? approvedHRId,
      @JsonKey(name: 'IsApprovedBGD') bool? isApprovedBGD,
      @JsonKey(name: 'DateApprovedBGD') DateTime? dateApprovedBGD,
      @JsonKey(name: 'ApprovedBGDID') int? approvedBGDId,
      @JsonKey(name: 'EvaluateCompletion') String? evaluateCompletion,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'IsRequestBuy') bool? isRequestBuy,
      @JsonKey(name: 'Status') int? status,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'IsRequestBGDApproved') bool? isRequestBGDApproved,
      @JsonKey(name: 'IsRequestPriceQuote') bool? isRequestPriceQuote,
      @JsonKey(name: 'JobRequirementDetails')
      List<WorkRequirementDetailResponse>? jobRequirementDetails,
      @JsonKey(name: 'JobRequirementFiles')
      List<dynamic>? jobRequirementFiles});
}

/// @nodoc
class __$$WorkRequirementSaveResponseImplCopyWithImpl<$Res>
    extends _$WorkRequirementSaveResponseCopyWithImpl<$Res,
        _$WorkRequirementSaveResponseImpl>
    implements _$$WorkRequirementSaveResponseImplCopyWith<$Res> {
  __$$WorkRequirementSaveResponseImplCopyWithImpl(
      _$WorkRequirementSaveResponseImpl _value,
      $Res Function(_$WorkRequirementSaveResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? numberRequest = freezed,
    Object? dateRequest = freezed,
    Object? deadlineRequest = freezed,
    Object? employeeId = freezed,
    Object? coordinationDepartmentId = freezed,
    Object? requiredDepartmentId = freezed,
    Object? approvedTBPId = freezed,
    Object? isApprovedTBP = freezed,
    Object? dateApprovedTBP = freezed,
    Object? isApprovedHR = freezed,
    Object? dateApprovedHR = freezed,
    Object? approvedHRId = freezed,
    Object? isApprovedBGD = freezed,
    Object? dateApprovedBGD = freezed,
    Object? approvedBGDId = freezed,
    Object? evaluateCompletion = freezed,
    Object? isDeleted = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? isRequestBuy = freezed,
    Object? status = freezed,
    Object? note = freezed,
    Object? isRequestBGDApproved = freezed,
    Object? isRequestPriceQuote = freezed,
    Object? jobRequirementDetails = freezed,
    Object? jobRequirementFiles = freezed,
  }) {
    return _then(_$WorkRequirementSaveResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      numberRequest: freezed == numberRequest
          ? _value.numberRequest
          : numberRequest // ignore: cast_nullable_to_non_nullable
              as String?,
      dateRequest: freezed == dateRequest
          ? _value.dateRequest
          : dateRequest // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deadlineRequest: freezed == deadlineRequest
          ? _value.deadlineRequest
          : deadlineRequest // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      coordinationDepartmentId: freezed == coordinationDepartmentId
          ? _value.coordinationDepartmentId
          : coordinationDepartmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      requiredDepartmentId: freezed == requiredDepartmentId
          ? _value.requiredDepartmentId
          : requiredDepartmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      approvedTBPId: freezed == approvedTBPId
          ? _value.approvedTBPId
          : approvedTBPId // ignore: cast_nullable_to_non_nullable
              as int?,
      isApprovedTBP: freezed == isApprovedTBP
          ? _value.isApprovedTBP
          : isApprovedTBP // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateApprovedTBP: freezed == dateApprovedTBP
          ? _value.dateApprovedTBP
          : dateApprovedTBP // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isApprovedHR: freezed == isApprovedHR
          ? _value.isApprovedHR
          : isApprovedHR // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateApprovedHR: freezed == dateApprovedHR
          ? _value.dateApprovedHR
          : dateApprovedHR // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      approvedHRId: freezed == approvedHRId
          ? _value.approvedHRId
          : approvedHRId // ignore: cast_nullable_to_non_nullable
              as int?,
      isApprovedBGD: freezed == isApprovedBGD
          ? _value.isApprovedBGD
          : isApprovedBGD // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateApprovedBGD: freezed == dateApprovedBGD
          ? _value.dateApprovedBGD
          : dateApprovedBGD // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      approvedBGDId: freezed == approvedBGDId
          ? _value.approvedBGDId
          : approvedBGDId // ignore: cast_nullable_to_non_nullable
              as int?,
      evaluateCompletion: freezed == evaluateCompletion
          ? _value.evaluateCompletion
          : evaluateCompletion // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isRequestBuy: freezed == isRequestBuy
          ? _value.isRequestBuy
          : isRequestBuy // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isRequestBGDApproved: freezed == isRequestBGDApproved
          ? _value.isRequestBGDApproved
          : isRequestBGDApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      isRequestPriceQuote: freezed == isRequestPriceQuote
          ? _value.isRequestPriceQuote
          : isRequestPriceQuote // ignore: cast_nullable_to_non_nullable
              as bool?,
      jobRequirementDetails: freezed == jobRequirementDetails
          ? _value._jobRequirementDetails
          : jobRequirementDetails // ignore: cast_nullable_to_non_nullable
              as List<WorkRequirementDetailResponse>?,
      jobRequirementFiles: freezed == jobRequirementFiles
          ? _value._jobRequirementFiles
          : jobRequirementFiles // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkRequirementSaveResponseImpl
    implements _WorkRequirementSaveResponse {
  const _$WorkRequirementSaveResponseImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'NumberRequest') this.numberRequest,
      @JsonKey(name: 'DateRequest') this.dateRequest,
      @JsonKey(name: 'DeadlineRequest') this.deadlineRequest,
      @JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'CoordinationDepartmentID') this.coordinationDepartmentId,
      @JsonKey(name: 'RequiredDepartmentID') this.requiredDepartmentId,
      @JsonKey(name: 'ApprovedTBPID') this.approvedTBPId,
      @JsonKey(name: 'IsApprovedTBP') this.isApprovedTBP,
      @JsonKey(name: 'DateApprovedTBP') this.dateApprovedTBP,
      @JsonKey(name: 'IsApprovedHR') this.isApprovedHR,
      @JsonKey(name: 'DateApprovedHR') this.dateApprovedHR,
      @JsonKey(name: 'ApprovedHRID') this.approvedHRId,
      @JsonKey(name: 'IsApprovedBGD') this.isApprovedBGD,
      @JsonKey(name: 'DateApprovedBGD') this.dateApprovedBGD,
      @JsonKey(name: 'ApprovedBGDID') this.approvedBGDId,
      @JsonKey(name: 'EvaluateCompletion') this.evaluateCompletion,
      @JsonKey(name: 'IsDeleted') this.isDeleted,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'IsRequestBuy') this.isRequestBuy,
      @JsonKey(name: 'Status') this.status,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'IsRequestBGDApproved') this.isRequestBGDApproved,
      @JsonKey(name: 'IsRequestPriceQuote') this.isRequestPriceQuote,
      @JsonKey(name: 'JobRequirementDetails')
      final List<WorkRequirementDetailResponse>? jobRequirementDetails,
      @JsonKey(name: 'JobRequirementFiles')
      final List<dynamic>? jobRequirementFiles})
      : _jobRequirementDetails = jobRequirementDetails,
        _jobRequirementFiles = jobRequirementFiles;

  factory _$WorkRequirementSaveResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$WorkRequirementSaveResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'NumberRequest')
  final String? numberRequest;
  @override
  @JsonKey(name: 'DateRequest')
  final DateTime? dateRequest;
  @override
  @JsonKey(name: 'DeadlineRequest')
  final DateTime? deadlineRequest;
  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;
  @override
  @JsonKey(name: 'CoordinationDepartmentID')
  final int? coordinationDepartmentId;
  @override
  @JsonKey(name: 'RequiredDepartmentID')
  final int? requiredDepartmentId;
  @override
  @JsonKey(name: 'ApprovedTBPID')
  final int? approvedTBPId;
  @override
  @JsonKey(name: 'IsApprovedTBP')
  final bool? isApprovedTBP;
  @override
  @JsonKey(name: 'DateApprovedTBP')
  final DateTime? dateApprovedTBP;
  @override
  @JsonKey(name: 'IsApprovedHR')
  final bool? isApprovedHR;
  @override
  @JsonKey(name: 'DateApprovedHR')
  final DateTime? dateApprovedHR;
  @override
  @JsonKey(name: 'ApprovedHRID')
  final int? approvedHRId;
  @override
  @JsonKey(name: 'IsApprovedBGD')
  final bool? isApprovedBGD;
  @override
  @JsonKey(name: 'DateApprovedBGD')
  final DateTime? dateApprovedBGD;
  @override
  @JsonKey(name: 'ApprovedBGDID')
  final int? approvedBGDId;
  @override
  @JsonKey(name: 'EvaluateCompletion')
  final String? evaluateCompletion;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;
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
  @JsonKey(name: 'IsRequestBuy')
  final bool? isRequestBuy;
  @override
  @JsonKey(name: 'Status')
  final int? status;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'IsRequestBGDApproved')
  final bool? isRequestBGDApproved;
  @override
  @JsonKey(name: 'IsRequestPriceQuote')
  final bool? isRequestPriceQuote;
  final List<WorkRequirementDetailResponse>? _jobRequirementDetails;
  @override
  @JsonKey(name: 'JobRequirementDetails')
  List<WorkRequirementDetailResponse>? get jobRequirementDetails {
    final value = _jobRequirementDetails;
    if (value == null) return null;
    if (_jobRequirementDetails is EqualUnmodifiableListView)
      return _jobRequirementDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _jobRequirementFiles;
  @override
  @JsonKey(name: 'JobRequirementFiles')
  List<dynamic>? get jobRequirementFiles {
    final value = _jobRequirementFiles;
    if (value == null) return null;
    if (_jobRequirementFiles is EqualUnmodifiableListView)
      return _jobRequirementFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WorkRequirementSaveResponse(id: $id, numberRequest: $numberRequest, dateRequest: $dateRequest, deadlineRequest: $deadlineRequest, employeeId: $employeeId, coordinationDepartmentId: $coordinationDepartmentId, requiredDepartmentId: $requiredDepartmentId, approvedTBPId: $approvedTBPId, isApprovedTBP: $isApprovedTBP, dateApprovedTBP: $dateApprovedTBP, isApprovedHR: $isApprovedHR, dateApprovedHR: $dateApprovedHR, approvedHRId: $approvedHRId, isApprovedBGD: $isApprovedBGD, dateApprovedBGD: $dateApprovedBGD, approvedBGDId: $approvedBGDId, evaluateCompletion: $evaluateCompletion, isDeleted: $isDeleted, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate, isRequestBuy: $isRequestBuy, status: $status, note: $note, isRequestBGDApproved: $isRequestBGDApproved, isRequestPriceQuote: $isRequestPriceQuote, jobRequirementDetails: $jobRequirementDetails, jobRequirementFiles: $jobRequirementFiles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkRequirementSaveResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.numberRequest, numberRequest) ||
                other.numberRequest == numberRequest) &&
            (identical(other.dateRequest, dateRequest) ||
                other.dateRequest == dateRequest) &&
            (identical(other.deadlineRequest, deadlineRequest) ||
                other.deadlineRequest == deadlineRequest) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(
                    other.coordinationDepartmentId, coordinationDepartmentId) ||
                other.coordinationDepartmentId == coordinationDepartmentId) &&
            (identical(other.requiredDepartmentId, requiredDepartmentId) ||
                other.requiredDepartmentId == requiredDepartmentId) &&
            (identical(other.approvedTBPId, approvedTBPId) ||
                other.approvedTBPId == approvedTBPId) &&
            (identical(other.isApprovedTBP, isApprovedTBP) ||
                other.isApprovedTBP == isApprovedTBP) &&
            (identical(other.dateApprovedTBP, dateApprovedTBP) ||
                other.dateApprovedTBP == dateApprovedTBP) &&
            (identical(other.isApprovedHR, isApprovedHR) ||
                other.isApprovedHR == isApprovedHR) &&
            (identical(other.dateApprovedHR, dateApprovedHR) ||
                other.dateApprovedHR == dateApprovedHR) &&
            (identical(other.approvedHRId, approvedHRId) ||
                other.approvedHRId == approvedHRId) &&
            (identical(other.isApprovedBGD, isApprovedBGD) ||
                other.isApprovedBGD == isApprovedBGD) &&
            (identical(other.dateApprovedBGD, dateApprovedBGD) ||
                other.dateApprovedBGD == dateApprovedBGD) &&
            (identical(other.approvedBGDId, approvedBGDId) ||
                other.approvedBGDId == approvedBGDId) &&
            (identical(other.evaluateCompletion, evaluateCompletion) ||
                other.evaluateCompletion == evaluateCompletion) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.isRequestBuy, isRequestBuy) ||
                other.isRequestBuy == isRequestBuy) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.isRequestBGDApproved, isRequestBGDApproved) ||
                other.isRequestBGDApproved == isRequestBGDApproved) &&
            (identical(other.isRequestPriceQuote, isRequestPriceQuote) ||
                other.isRequestPriceQuote == isRequestPriceQuote) &&
            const DeepCollectionEquality()
                .equals(other._jobRequirementDetails, _jobRequirementDetails) &&
            const DeepCollectionEquality()
                .equals(other._jobRequirementFiles, _jobRequirementFiles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        numberRequest,
        dateRequest,
        deadlineRequest,
        employeeId,
        coordinationDepartmentId,
        requiredDepartmentId,
        approvedTBPId,
        isApprovedTBP,
        dateApprovedTBP,
        isApprovedHR,
        dateApprovedHR,
        approvedHRId,
        isApprovedBGD,
        dateApprovedBGD,
        approvedBGDId,
        evaluateCompletion,
        isDeleted,
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        isRequestBuy,
        status,
        note,
        isRequestBGDApproved,
        isRequestPriceQuote,
        const DeepCollectionEquality().hash(_jobRequirementDetails),
        const DeepCollectionEquality().hash(_jobRequirementFiles)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkRequirementSaveResponseImplCopyWith<_$WorkRequirementSaveResponseImpl>
      get copyWith => __$$WorkRequirementSaveResponseImplCopyWithImpl<
          _$WorkRequirementSaveResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkRequirementSaveResponseImplToJson(
      this,
    );
  }
}

abstract class _WorkRequirementSaveResponse
    implements WorkRequirementSaveResponse {
  const factory _WorkRequirementSaveResponse(
      {@JsonKey(name: 'ID') final int? id,
      @JsonKey(name: 'NumberRequest') final String? numberRequest,
      @JsonKey(name: 'DateRequest') final DateTime? dateRequest,
      @JsonKey(name: 'DeadlineRequest') final DateTime? deadlineRequest,
      @JsonKey(name: 'EmployeeID') final int? employeeId,
      @JsonKey(name: 'CoordinationDepartmentID')
      final int? coordinationDepartmentId,
      @JsonKey(name: 'RequiredDepartmentID') final int? requiredDepartmentId,
      @JsonKey(name: 'ApprovedTBPID') final int? approvedTBPId,
      @JsonKey(name: 'IsApprovedTBP') final bool? isApprovedTBP,
      @JsonKey(name: 'DateApprovedTBP') final DateTime? dateApprovedTBP,
      @JsonKey(name: 'IsApprovedHR') final bool? isApprovedHR,
      @JsonKey(name: 'DateApprovedHR') final DateTime? dateApprovedHR,
      @JsonKey(name: 'ApprovedHRID') final int? approvedHRId,
      @JsonKey(name: 'IsApprovedBGD') final bool? isApprovedBGD,
      @JsonKey(name: 'DateApprovedBGD') final DateTime? dateApprovedBGD,
      @JsonKey(name: 'ApprovedBGDID') final int? approvedBGDId,
      @JsonKey(name: 'EvaluateCompletion') final String? evaluateCompletion,
      @JsonKey(name: 'IsDeleted') final bool? isDeleted,
      @JsonKey(name: 'CreatedBy') final String? createdBy,
      @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') final String? updatedBy,
      @JsonKey(name: 'UpdatedDate') final DateTime? updatedDate,
      @JsonKey(name: 'IsRequestBuy') final bool? isRequestBuy,
      @JsonKey(name: 'Status') final int? status,
      @JsonKey(name: 'Note') final String? note,
      @JsonKey(name: 'IsRequestBGDApproved') final bool? isRequestBGDApproved,
      @JsonKey(name: 'IsRequestPriceQuote') final bool? isRequestPriceQuote,
      @JsonKey(name: 'JobRequirementDetails')
      final List<WorkRequirementDetailResponse>? jobRequirementDetails,
      @JsonKey(name: 'JobRequirementFiles')
      final List<dynamic>?
          jobRequirementFiles}) = _$WorkRequirementSaveResponseImpl;

  factory _WorkRequirementSaveResponse.fromJson(Map<String, dynamic> json) =
      _$WorkRequirementSaveResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'NumberRequest')
  String? get numberRequest;
  @override
  @JsonKey(name: 'DateRequest')
  DateTime? get dateRequest;
  @override
  @JsonKey(name: 'DeadlineRequest')
  DateTime? get deadlineRequest;
  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(name: 'CoordinationDepartmentID')
  int? get coordinationDepartmentId;
  @override
  @JsonKey(name: 'RequiredDepartmentID')
  int? get requiredDepartmentId;
  @override
  @JsonKey(name: 'ApprovedTBPID')
  int? get approvedTBPId;
  @override
  @JsonKey(name: 'IsApprovedTBP')
  bool? get isApprovedTBP;
  @override
  @JsonKey(name: 'DateApprovedTBP')
  DateTime? get dateApprovedTBP;
  @override
  @JsonKey(name: 'IsApprovedHR')
  bool? get isApprovedHR;
  @override
  @JsonKey(name: 'DateApprovedHR')
  DateTime? get dateApprovedHR;
  @override
  @JsonKey(name: 'ApprovedHRID')
  int? get approvedHRId;
  @override
  @JsonKey(name: 'IsApprovedBGD')
  bool? get isApprovedBGD;
  @override
  @JsonKey(name: 'DateApprovedBGD')
  DateTime? get dateApprovedBGD;
  @override
  @JsonKey(name: 'ApprovedBGDID')
  int? get approvedBGDId;
  @override
  @JsonKey(name: 'EvaluateCompletion')
  String? get evaluateCompletion;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
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
  @JsonKey(name: 'IsRequestBuy')
  bool? get isRequestBuy;
  @override
  @JsonKey(name: 'Status')
  int? get status;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'IsRequestBGDApproved')
  bool? get isRequestBGDApproved;
  @override
  @JsonKey(name: 'IsRequestPriceQuote')
  bool? get isRequestPriceQuote;
  @override
  @JsonKey(name: 'JobRequirementDetails')
  List<WorkRequirementDetailResponse>? get jobRequirementDetails;
  @override
  @JsonKey(name: 'JobRequirementFiles')
  List<dynamic>? get jobRequirementFiles;
  @override
  @JsonKey(ignore: true)
  _$$WorkRequirementSaveResponseImplCopyWith<_$WorkRequirementSaveResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

IdeaDetailItem _$IdeaDetailItemFromJson(Map<String, dynamic> json) {
  return _IdeaDetailItem.fromJson(json);
}

/// @nodoc
mixin _$IdeaDetailItem {
  @JsonKey(name: 'em')
  List<IdeaEmployeeItem>? get employees => throw _privateConstructorUsedError;
  @JsonKey(name: 'de')
  List<IdeaDepartmentItem>? get departments =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'rgt')
  IdeaRegisterItem? get register => throw _privateConstructorUsedError;
  @JsonKey(name: 'rgtd')
  List<IdeaRegisterDetailItem>? get registerDetails =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'rgts')
  List<IdeaScoreItem>? get registerScores => throw _privateConstructorUsedError;
  @JsonKey(name: 'rgtf')
  List<IdeaFileItem>? get registerFiles => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'em') List<IdeaEmployeeItem>? employees,
      @JsonKey(name: 'de') List<IdeaDepartmentItem>? departments,
      @JsonKey(name: 'rgt') IdeaRegisterItem? register,
      @JsonKey(name: 'rgtd') List<IdeaRegisterDetailItem>? registerDetails,
      @JsonKey(name: 'rgts') List<IdeaScoreItem>? registerScores,
      @JsonKey(name: 'rgtf') List<IdeaFileItem>? registerFiles});

  $IdeaRegisterItemCopyWith<$Res>? get register;
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
    Object? employees = freezed,
    Object? departments = freezed,
    Object? register = freezed,
    Object? registerDetails = freezed,
    Object? registerScores = freezed,
    Object? registerFiles = freezed,
  }) {
    return _then(_value.copyWith(
      employees: freezed == employees
          ? _value.employees
          : employees // ignore: cast_nullable_to_non_nullable
              as List<IdeaEmployeeItem>?,
      departments: freezed == departments
          ? _value.departments
          : departments // ignore: cast_nullable_to_non_nullable
              as List<IdeaDepartmentItem>?,
      register: freezed == register
          ? _value.register
          : register // ignore: cast_nullable_to_non_nullable
              as IdeaRegisterItem?,
      registerDetails: freezed == registerDetails
          ? _value.registerDetails
          : registerDetails // ignore: cast_nullable_to_non_nullable
              as List<IdeaRegisterDetailItem>?,
      registerScores: freezed == registerScores
          ? _value.registerScores
          : registerScores // ignore: cast_nullable_to_non_nullable
              as List<IdeaScoreItem>?,
      registerFiles: freezed == registerFiles
          ? _value.registerFiles
          : registerFiles // ignore: cast_nullable_to_non_nullable
              as List<IdeaFileItem>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IdeaRegisterItemCopyWith<$Res>? get register {
    if (_value.register == null) {
      return null;
    }

    return $IdeaRegisterItemCopyWith<$Res>(_value.register!, (value) {
      return _then(_value.copyWith(register: value) as $Val);
    });
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
      {@JsonKey(name: 'em') List<IdeaEmployeeItem>? employees,
      @JsonKey(name: 'de') List<IdeaDepartmentItem>? departments,
      @JsonKey(name: 'rgt') IdeaRegisterItem? register,
      @JsonKey(name: 'rgtd') List<IdeaRegisterDetailItem>? registerDetails,
      @JsonKey(name: 'rgts') List<IdeaScoreItem>? registerScores,
      @JsonKey(name: 'rgtf') List<IdeaFileItem>? registerFiles});

  @override
  $IdeaRegisterItemCopyWith<$Res>? get register;
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
    Object? employees = freezed,
    Object? departments = freezed,
    Object? register = freezed,
    Object? registerDetails = freezed,
    Object? registerScores = freezed,
    Object? registerFiles = freezed,
  }) {
    return _then(_$IdeaDetailItemImpl(
      employees: freezed == employees
          ? _value._employees
          : employees // ignore: cast_nullable_to_non_nullable
              as List<IdeaEmployeeItem>?,
      departments: freezed == departments
          ? _value._departments
          : departments // ignore: cast_nullable_to_non_nullable
              as List<IdeaDepartmentItem>?,
      register: freezed == register
          ? _value.register
          : register // ignore: cast_nullable_to_non_nullable
              as IdeaRegisterItem?,
      registerDetails: freezed == registerDetails
          ? _value._registerDetails
          : registerDetails // ignore: cast_nullable_to_non_nullable
              as List<IdeaRegisterDetailItem>?,
      registerScores: freezed == registerScores
          ? _value._registerScores
          : registerScores // ignore: cast_nullable_to_non_nullable
              as List<IdeaScoreItem>?,
      registerFiles: freezed == registerFiles
          ? _value._registerFiles
          : registerFiles // ignore: cast_nullable_to_non_nullable
              as List<IdeaFileItem>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IdeaDetailItemImpl implements _IdeaDetailItem {
  const _$IdeaDetailItemImpl(
      {@JsonKey(name: 'em') final List<IdeaEmployeeItem>? employees,
      @JsonKey(name: 'de') final List<IdeaDepartmentItem>? departments,
      @JsonKey(name: 'rgt') this.register,
      @JsonKey(name: 'rgtd')
      final List<IdeaRegisterDetailItem>? registerDetails,
      @JsonKey(name: 'rgts') final List<IdeaScoreItem>? registerScores,
      @JsonKey(name: 'rgtf') final List<IdeaFileItem>? registerFiles})
      : _employees = employees,
        _departments = departments,
        _registerDetails = registerDetails,
        _registerScores = registerScores,
        _registerFiles = registerFiles;

  factory _$IdeaDetailItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdeaDetailItemImplFromJson(json);

  final List<IdeaEmployeeItem>? _employees;
  @override
  @JsonKey(name: 'em')
  List<IdeaEmployeeItem>? get employees {
    final value = _employees;
    if (value == null) return null;
    if (_employees is EqualUnmodifiableListView) return _employees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<IdeaDepartmentItem>? _departments;
  @override
  @JsonKey(name: 'de')
  List<IdeaDepartmentItem>? get departments {
    final value = _departments;
    if (value == null) return null;
    if (_departments is EqualUnmodifiableListView) return _departments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'rgt')
  final IdeaRegisterItem? register;
  final List<IdeaRegisterDetailItem>? _registerDetails;
  @override
  @JsonKey(name: 'rgtd')
  List<IdeaRegisterDetailItem>? get registerDetails {
    final value = _registerDetails;
    if (value == null) return null;
    if (_registerDetails is EqualUnmodifiableListView) return _registerDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<IdeaScoreItem>? _registerScores;
  @override
  @JsonKey(name: 'rgts')
  List<IdeaScoreItem>? get registerScores {
    final value = _registerScores;
    if (value == null) return null;
    if (_registerScores is EqualUnmodifiableListView) return _registerScores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<IdeaFileItem>? _registerFiles;
  @override
  @JsonKey(name: 'rgtf')
  List<IdeaFileItem>? get registerFiles {
    final value = _registerFiles;
    if (value == null) return null;
    if (_registerFiles is EqualUnmodifiableListView) return _registerFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'IdeaDetailItem(employees: $employees, departments: $departments, register: $register, registerDetails: $registerDetails, registerScores: $registerScores, registerFiles: $registerFiles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdeaDetailItemImpl &&
            const DeepCollectionEquality()
                .equals(other._employees, _employees) &&
            const DeepCollectionEquality()
                .equals(other._departments, _departments) &&
            (identical(other.register, register) ||
                other.register == register) &&
            const DeepCollectionEquality()
                .equals(other._registerDetails, _registerDetails) &&
            const DeepCollectionEquality()
                .equals(other._registerScores, _registerScores) &&
            const DeepCollectionEquality()
                .equals(other._registerFiles, _registerFiles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_employees),
      const DeepCollectionEquality().hash(_departments),
      register,
      const DeepCollectionEquality().hash(_registerDetails),
      const DeepCollectionEquality().hash(_registerScores),
      const DeepCollectionEquality().hash(_registerFiles));

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
          {@JsonKey(name: 'em') final List<IdeaEmployeeItem>? employees,
          @JsonKey(name: 'de') final List<IdeaDepartmentItem>? departments,
          @JsonKey(name: 'rgt') final IdeaRegisterItem? register,
          @JsonKey(name: 'rgtd')
          final List<IdeaRegisterDetailItem>? registerDetails,
          @JsonKey(name: 'rgts') final List<IdeaScoreItem>? registerScores,
          @JsonKey(name: 'rgtf') final List<IdeaFileItem>? registerFiles}) =
      _$IdeaDetailItemImpl;

  factory _IdeaDetailItem.fromJson(Map<String, dynamic> json) =
      _$IdeaDetailItemImpl.fromJson;

  @override
  @JsonKey(name: 'em')
  List<IdeaEmployeeItem>? get employees;
  @override
  @JsonKey(name: 'de')
  List<IdeaDepartmentItem>? get departments;
  @override
  @JsonKey(name: 'rgt')
  IdeaRegisterItem? get register;
  @override
  @JsonKey(name: 'rgtd')
  List<IdeaRegisterDetailItem>? get registerDetails;
  @override
  @JsonKey(name: 'rgts')
  List<IdeaScoreItem>? get registerScores;
  @override
  @JsonKey(name: 'rgtf')
  List<IdeaFileItem>? get registerFiles;
  @override
  @JsonKey(ignore: true)
  _$$IdeaDetailItemImplCopyWith<_$IdeaDetailItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IdeaEmployeeItem _$IdeaEmployeeItemFromJson(Map<String, dynamic> json) {
  return _IdeaEmployeeItem.fromJson(json);
}

/// @nodoc
mixin _$IdeaEmployeeItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullName')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentID')
  int? get departmentId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdeaEmployeeItemCopyWith<IdeaEmployeeItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdeaEmployeeItemCopyWith<$Res> {
  factory $IdeaEmployeeItemCopyWith(
          IdeaEmployeeItem value, $Res Function(IdeaEmployeeItem) then) =
      _$IdeaEmployeeItemCopyWithImpl<$Res, IdeaEmployeeItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'DepartmentID') int? departmentId});
}

/// @nodoc
class _$IdeaEmployeeItemCopyWithImpl<$Res, $Val extends IdeaEmployeeItem>
    implements $IdeaEmployeeItemCopyWith<$Res> {
  _$IdeaEmployeeItemCopyWithImpl(this._value, this._then);

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
abstract class _$$IdeaEmployeeItemImplCopyWith<$Res>
    implements $IdeaEmployeeItemCopyWith<$Res> {
  factory _$$IdeaEmployeeItemImplCopyWith(_$IdeaEmployeeItemImpl value,
          $Res Function(_$IdeaEmployeeItemImpl) then) =
      __$$IdeaEmployeeItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'DepartmentID') int? departmentId});
}

/// @nodoc
class __$$IdeaEmployeeItemImplCopyWithImpl<$Res>
    extends _$IdeaEmployeeItemCopyWithImpl<$Res, _$IdeaEmployeeItemImpl>
    implements _$$IdeaEmployeeItemImplCopyWith<$Res> {
  __$$IdeaEmployeeItemImplCopyWithImpl(_$IdeaEmployeeItemImpl _value,
      $Res Function(_$IdeaEmployeeItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = freezed,
    Object? departmentId = freezed,
  }) {
    return _then(_$IdeaEmployeeItemImpl(
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
class _$IdeaEmployeeItemImpl implements _IdeaEmployeeItem {
  const _$IdeaEmployeeItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'FullName') this.fullName,
      @JsonKey(name: 'DepartmentID') this.departmentId});

  factory _$IdeaEmployeeItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdeaEmployeeItemImplFromJson(json);

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
    return 'IdeaEmployeeItem(id: $id, fullName: $fullName, departmentId: $departmentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdeaEmployeeItemImpl &&
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
  _$$IdeaEmployeeItemImplCopyWith<_$IdeaEmployeeItemImpl> get copyWith =>
      __$$IdeaEmployeeItemImplCopyWithImpl<_$IdeaEmployeeItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdeaEmployeeItemImplToJson(
      this,
    );
  }
}

abstract class _IdeaEmployeeItem implements IdeaEmployeeItem {
  const factory _IdeaEmployeeItem(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'FullName') final String? fullName,
          @JsonKey(name: 'DepartmentID') final int? departmentId}) =
      _$IdeaEmployeeItemImpl;

  factory _IdeaEmployeeItem.fromJson(Map<String, dynamic> json) =
      _$IdeaEmployeeItemImpl.fromJson;

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
  _$$IdeaEmployeeItemImplCopyWith<_$IdeaEmployeeItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IdeaDepartmentItem _$IdeaDepartmentItemFromJson(Map<String, dynamic> json) {
  return _IdeaDepartmentItem.fromJson(json);
}

/// @nodoc
mixin _$IdeaDepartmentItem {
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
  String? get pId => throw _privateConstructorUsedError;
  @JsonKey(name: 'STT')
  int? get stt => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'ParentID')
  int? get parentId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdeaDepartmentItemCopyWith<IdeaDepartmentItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdeaDepartmentItemCopyWith<$Res> {
  factory $IdeaDepartmentItemCopyWith(
          IdeaDepartmentItem value, $Res Function(IdeaDepartmentItem) then) =
      _$IdeaDepartmentItemCopyWithImpl<$Res, IdeaDepartmentItem>;
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
      @JsonKey(name: 'PId') String? pId,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'ParentID') int? parentId});
}

/// @nodoc
class _$IdeaDepartmentItemCopyWithImpl<$Res, $Val extends IdeaDepartmentItem>
    implements $IdeaDepartmentItemCopyWith<$Res> {
  _$IdeaDepartmentItemCopyWithImpl(this._value, this._then);

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
    Object? pId = freezed,
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
      pId: freezed == pId
          ? _value.pId
          : pId // ignore: cast_nullable_to_non_nullable
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
abstract class _$$IdeaDepartmentItemImplCopyWith<$Res>
    implements $IdeaDepartmentItemCopyWith<$Res> {
  factory _$$IdeaDepartmentItemImplCopyWith(_$IdeaDepartmentItemImpl value,
          $Res Function(_$IdeaDepartmentItemImpl) then) =
      __$$IdeaDepartmentItemImplCopyWithImpl<$Res>;
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
      @JsonKey(name: 'PId') String? pId,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'ParentID') int? parentId});
}

/// @nodoc
class __$$IdeaDepartmentItemImplCopyWithImpl<$Res>
    extends _$IdeaDepartmentItemCopyWithImpl<$Res, _$IdeaDepartmentItemImpl>
    implements _$$IdeaDepartmentItemImplCopyWith<$Res> {
  __$$IdeaDepartmentItemImplCopyWithImpl(_$IdeaDepartmentItemImpl _value,
      $Res Function(_$IdeaDepartmentItemImpl) _then)
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
    Object? pId = freezed,
    Object? stt = freezed,
    Object? isDeleted = freezed,
    Object? parentId = freezed,
  }) {
    return _then(_$IdeaDepartmentItemImpl(
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
      pId: freezed == pId
          ? _value.pId
          : pId // ignore: cast_nullable_to_non_nullable
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
class _$IdeaDepartmentItemImpl implements _IdeaDepartmentItem {
  const _$IdeaDepartmentItemImpl(
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
      @JsonKey(name: 'PId') this.pId,
      @JsonKey(name: 'STT') this.stt,
      @JsonKey(name: 'IsDeleted') this.isDeleted,
      @JsonKey(name: 'ParentID') this.parentId});

  factory _$IdeaDepartmentItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdeaDepartmentItemImplFromJson(json);

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
  final String? pId;
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
    return 'IdeaDepartmentItem(id: $id, code: $code, name: $name, description: $description, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate, status: $status, email: $email, headofDepartment: $headofDepartment, isShowHotline: $isShowHotline, pId: $pId, stt: $stt, isDeleted: $isDeleted, parentId: $parentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdeaDepartmentItemImpl &&
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
            (identical(other.pId, pId) || other.pId == pId) &&
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
      pId,
      stt,
      isDeleted,
      parentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdeaDepartmentItemImplCopyWith<_$IdeaDepartmentItemImpl> get copyWith =>
      __$$IdeaDepartmentItemImplCopyWithImpl<_$IdeaDepartmentItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdeaDepartmentItemImplToJson(
      this,
    );
  }
}

abstract class _IdeaDepartmentItem implements IdeaDepartmentItem {
  const factory _IdeaDepartmentItem(
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
          @JsonKey(name: 'PId') final String? pId,
          @JsonKey(name: 'STT') final int? stt,
          @JsonKey(name: 'IsDeleted') final bool? isDeleted,
          @JsonKey(name: 'ParentID') final int? parentId}) =
      _$IdeaDepartmentItemImpl;

  factory _IdeaDepartmentItem.fromJson(Map<String, dynamic> json) =
      _$IdeaDepartmentItemImpl.fromJson;

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
  String? get pId;
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
  _$$IdeaDepartmentItemImplCopyWith<_$IdeaDepartmentItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IdeaRegisterItem _$IdeaRegisterItemFromJson(Map<String, dynamic> json) {
  return _IdeaRegisterItem.fromJson(json);
}

/// @nodoc
mixin _$IdeaRegisterItem {
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
  $IdeaRegisterItemCopyWith<IdeaRegisterItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdeaRegisterItemCopyWith<$Res> {
  factory $IdeaRegisterItemCopyWith(
          IdeaRegisterItem value, $Res Function(IdeaRegisterItem) then) =
      _$IdeaRegisterItemCopyWithImpl<$Res, IdeaRegisterItem>;
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
class _$IdeaRegisterItemCopyWithImpl<$Res, $Val extends IdeaRegisterItem>
    implements $IdeaRegisterItemCopyWith<$Res> {
  _$IdeaRegisterItemCopyWithImpl(this._value, this._then);

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
abstract class _$$IdeaRegisterItemImplCopyWith<$Res>
    implements $IdeaRegisterItemCopyWith<$Res> {
  factory _$$IdeaRegisterItemImplCopyWith(_$IdeaRegisterItemImpl value,
          $Res Function(_$IdeaRegisterItemImpl) then) =
      __$$IdeaRegisterItemImplCopyWithImpl<$Res>;
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
class __$$IdeaRegisterItemImplCopyWithImpl<$Res>
    extends _$IdeaRegisterItemCopyWithImpl<$Res, _$IdeaRegisterItemImpl>
    implements _$$IdeaRegisterItemImplCopyWith<$Res> {
  __$$IdeaRegisterItemImplCopyWithImpl(_$IdeaRegisterItemImpl _value,
      $Res Function(_$IdeaRegisterItemImpl) _then)
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
    return _then(_$IdeaRegisterItemImpl(
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
class _$IdeaRegisterItemImpl implements _IdeaRegisterItem {
  const _$IdeaRegisterItemImpl(
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

  factory _$IdeaRegisterItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdeaRegisterItemImplFromJson(json);

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
    return 'IdeaRegisterItem(id: $id, employeeId: $employeeId, dateRegister: $dateRegister, isApprovedTBP: $isApprovedTBP, dateApprovedTBP: $dateApprovedTBP, approvedTBPID: $approvedTBPID, isApproved: $isApproved, dateApproved: $dateApproved, approvedID: $approvedID, note: $note, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate, isDeleted: $isDeleted, registerIdeaTypeID: $registerIdeaTypeID, departmentOrganizationID: $departmentOrganizationID, courseID: $courseID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdeaRegisterItemImpl &&
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
  _$$IdeaRegisterItemImplCopyWith<_$IdeaRegisterItemImpl> get copyWith =>
      __$$IdeaRegisterItemImplCopyWithImpl<_$IdeaRegisterItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdeaRegisterItemImplToJson(
      this,
    );
  }
}

abstract class _IdeaRegisterItem implements IdeaRegisterItem {
  const factory _IdeaRegisterItem(
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
      @JsonKey(name: 'CourseID') final int? courseID}) = _$IdeaRegisterItemImpl;

  factory _IdeaRegisterItem.fromJson(Map<String, dynamic> json) =
      _$IdeaRegisterItemImpl.fromJson;

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
  _$$IdeaRegisterItemImplCopyWith<_$IdeaRegisterItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IdeaRegisterDetailItem _$IdeaRegisterDetailItemFromJson(
    Map<String, dynamic> json) {
  return _IdeaRegisterDetailItem.fromJson(json);
}

/// @nodoc
mixin _$IdeaRegisterDetailItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'RegisterIdeaID')
  int? get registerIdeaID => throw _privateConstructorUsedError;
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
  $IdeaRegisterDetailItemCopyWith<IdeaRegisterDetailItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdeaRegisterDetailItemCopyWith<$Res> {
  factory $IdeaRegisterDetailItemCopyWith(IdeaRegisterDetailItem value,
          $Res Function(IdeaRegisterDetailItem) then) =
      _$IdeaRegisterDetailItemCopyWithImpl<$Res, IdeaRegisterDetailItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'RegisterIdeaID') int? registerIdeaID,
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
class _$IdeaRegisterDetailItemCopyWithImpl<$Res,
        $Val extends IdeaRegisterDetailItem>
    implements $IdeaRegisterDetailItemCopyWith<$Res> {
  _$IdeaRegisterDetailItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? registerIdeaID = freezed,
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
      registerIdeaID: freezed == registerIdeaID
          ? _value.registerIdeaID
          : registerIdeaID // ignore: cast_nullable_to_non_nullable
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
abstract class _$$IdeaRegisterDetailItemImplCopyWith<$Res>
    implements $IdeaRegisterDetailItemCopyWith<$Res> {
  factory _$$IdeaRegisterDetailItemImplCopyWith(
          _$IdeaRegisterDetailItemImpl value,
          $Res Function(_$IdeaRegisterDetailItemImpl) then) =
      __$$IdeaRegisterDetailItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'RegisterIdeaID') int? registerIdeaID,
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
class __$$IdeaRegisterDetailItemImplCopyWithImpl<$Res>
    extends _$IdeaRegisterDetailItemCopyWithImpl<$Res,
        _$IdeaRegisterDetailItemImpl>
    implements _$$IdeaRegisterDetailItemImplCopyWith<$Res> {
  __$$IdeaRegisterDetailItemImplCopyWithImpl(
      _$IdeaRegisterDetailItemImpl _value,
      $Res Function(_$IdeaRegisterDetailItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? registerIdeaID = freezed,
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
    return _then(_$IdeaRegisterDetailItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      registerIdeaID: freezed == registerIdeaID
          ? _value.registerIdeaID
          : registerIdeaID // ignore: cast_nullable_to_non_nullable
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
class _$IdeaRegisterDetailItemImpl implements _IdeaRegisterDetailItem {
  const _$IdeaRegisterDetailItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'RegisterIdeaID') this.registerIdeaID,
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

  factory _$IdeaRegisterDetailItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdeaRegisterDetailItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'RegisterIdeaID')
  final int? registerIdeaID;
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
    return 'IdeaRegisterDetailItem(id: $id, registerIdeaID: $registerIdeaID, stt: $stt, category: $category, description: $description, note: $note, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate, dateStart: $dateStart, dateEnd: $dateEnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdeaRegisterDetailItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.registerIdeaID, registerIdeaID) ||
                other.registerIdeaID == registerIdeaID) &&
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
      registerIdeaID,
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
  _$$IdeaRegisterDetailItemImplCopyWith<_$IdeaRegisterDetailItemImpl>
      get copyWith => __$$IdeaRegisterDetailItemImplCopyWithImpl<
          _$IdeaRegisterDetailItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdeaRegisterDetailItemImplToJson(
      this,
    );
  }
}

abstract class _IdeaRegisterDetailItem implements IdeaRegisterDetailItem {
  const factory _IdeaRegisterDetailItem(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'RegisterIdeaID') final int? registerIdeaID,
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
      _$IdeaRegisterDetailItemImpl;

  factory _IdeaRegisterDetailItem.fromJson(Map<String, dynamic> json) =
      _$IdeaRegisterDetailItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'RegisterIdeaID')
  int? get registerIdeaID;
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
  _$$IdeaRegisterDetailItemImplCopyWith<_$IdeaRegisterDetailItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

IdeaScoreItem _$IdeaScoreItemFromJson(Map<String, dynamic> json) {
  return _IdeaScoreItem.fromJson(json);
}

/// @nodoc
mixin _$IdeaScoreItem {
  @JsonKey(name: 'DepartmentName')
  String? get departmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'TBPName')
  String? get tbpName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ScoreNew')
  String? get scoreNew => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeId')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'LsDepartmentId')
  int? get lsDepartmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'tbpCheck')
  bool? get tbpCheck => throw _privateConstructorUsedError;
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'RegisterIdeaID')
  int? get registerIdeaID => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentID')
  int? get departmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Score')
  double? get score => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsTBP')
  bool? get isTBP => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsBGD')
  bool? get isBGD => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'IsApprovedBGD')
  bool? get isApprovedBGD => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateApprovedBGD')
  DateTime? get dateApprovedBGD => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedBGDID')
  int? get approvedBGDID => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'ScoreRating')
  String? get scoreRating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdeaScoreItemCopyWith<IdeaScoreItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdeaScoreItemCopyWith<$Res> {
  factory $IdeaScoreItemCopyWith(
          IdeaScoreItem value, $Res Function(IdeaScoreItem) then) =
      _$IdeaScoreItemCopyWithImpl<$Res, IdeaScoreItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'TBPName') String? tbpName,
      @JsonKey(name: 'ScoreNew') String? scoreNew,
      @JsonKey(name: 'EmployeeId') int? employeeId,
      @JsonKey(name: 'LsDepartmentId') int? lsDepartmentId,
      @JsonKey(name: 'tbpCheck') bool? tbpCheck,
      @JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'RegisterIdeaID') int? registerIdeaID,
      @JsonKey(name: 'DepartmentID') int? departmentId,
      @JsonKey(name: 'Score') double? score,
      @JsonKey(name: 'IsTBP') bool? isTBP,
      @JsonKey(name: 'IsBGD') bool? isBGD,
      @JsonKey(name: 'IsApprovedTBP') bool? isApprovedTBP,
      @JsonKey(name: 'DateApprovedTBP') DateTime? dateApprovedTBP,
      @JsonKey(name: 'ApprovedTBPID') int? approvedTBPID,
      @JsonKey(name: 'IsApproved') bool? isApproved,
      @JsonKey(name: 'DateApproved') DateTime? dateApproved,
      @JsonKey(name: 'ApprovedID') int? approvedID,
      @JsonKey(name: 'IsApprovedBGD') bool? isApprovedBGD,
      @JsonKey(name: 'DateApprovedBGD') DateTime? dateApprovedBGD,
      @JsonKey(name: 'ApprovedBGDID') int? approvedBGDID,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'ScoreRating') String? scoreRating});
}

/// @nodoc
class _$IdeaScoreItemCopyWithImpl<$Res, $Val extends IdeaScoreItem>
    implements $IdeaScoreItemCopyWith<$Res> {
  _$IdeaScoreItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? departmentName = freezed,
    Object? tbpName = freezed,
    Object? scoreNew = freezed,
    Object? employeeId = freezed,
    Object? lsDepartmentId = freezed,
    Object? tbpCheck = freezed,
    Object? id = freezed,
    Object? registerIdeaID = freezed,
    Object? departmentId = freezed,
    Object? score = freezed,
    Object? isTBP = freezed,
    Object? isBGD = freezed,
    Object? isApprovedTBP = freezed,
    Object? dateApprovedTBP = freezed,
    Object? approvedTBPID = freezed,
    Object? isApproved = freezed,
    Object? dateApproved = freezed,
    Object? approvedID = freezed,
    Object? isApprovedBGD = freezed,
    Object? dateApprovedBGD = freezed,
    Object? approvedBGDID = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? scoreRating = freezed,
  }) {
    return _then(_value.copyWith(
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      tbpName: freezed == tbpName
          ? _value.tbpName
          : tbpName // ignore: cast_nullable_to_non_nullable
              as String?,
      scoreNew: freezed == scoreNew
          ? _value.scoreNew
          : scoreNew // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      lsDepartmentId: freezed == lsDepartmentId
          ? _value.lsDepartmentId
          : lsDepartmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      tbpCheck: freezed == tbpCheck
          ? _value.tbpCheck
          : tbpCheck // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      registerIdeaID: freezed == registerIdeaID
          ? _value.registerIdeaID
          : registerIdeaID // ignore: cast_nullable_to_non_nullable
              as int?,
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      isTBP: freezed == isTBP
          ? _value.isTBP
          : isTBP // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBGD: freezed == isBGD
          ? _value.isBGD
          : isBGD // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      isApprovedBGD: freezed == isApprovedBGD
          ? _value.isApprovedBGD
          : isApprovedBGD // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateApprovedBGD: freezed == dateApprovedBGD
          ? _value.dateApprovedBGD
          : dateApprovedBGD // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      approvedBGDID: freezed == approvedBGDID
          ? _value.approvedBGDID
          : approvedBGDID // ignore: cast_nullable_to_non_nullable
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
      scoreRating: freezed == scoreRating
          ? _value.scoreRating
          : scoreRating // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IdeaScoreItemImplCopyWith<$Res>
    implements $IdeaScoreItemCopyWith<$Res> {
  factory _$$IdeaScoreItemImplCopyWith(
          _$IdeaScoreItemImpl value, $Res Function(_$IdeaScoreItemImpl) then) =
      __$$IdeaScoreItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'TBPName') String? tbpName,
      @JsonKey(name: 'ScoreNew') String? scoreNew,
      @JsonKey(name: 'EmployeeId') int? employeeId,
      @JsonKey(name: 'LsDepartmentId') int? lsDepartmentId,
      @JsonKey(name: 'tbpCheck') bool? tbpCheck,
      @JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'RegisterIdeaID') int? registerIdeaID,
      @JsonKey(name: 'DepartmentID') int? departmentId,
      @JsonKey(name: 'Score') double? score,
      @JsonKey(name: 'IsTBP') bool? isTBP,
      @JsonKey(name: 'IsBGD') bool? isBGD,
      @JsonKey(name: 'IsApprovedTBP') bool? isApprovedTBP,
      @JsonKey(name: 'DateApprovedTBP') DateTime? dateApprovedTBP,
      @JsonKey(name: 'ApprovedTBPID') int? approvedTBPID,
      @JsonKey(name: 'IsApproved') bool? isApproved,
      @JsonKey(name: 'DateApproved') DateTime? dateApproved,
      @JsonKey(name: 'ApprovedID') int? approvedID,
      @JsonKey(name: 'IsApprovedBGD') bool? isApprovedBGD,
      @JsonKey(name: 'DateApprovedBGD') DateTime? dateApprovedBGD,
      @JsonKey(name: 'ApprovedBGDID') int? approvedBGDID,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'ScoreRating') String? scoreRating});
}

/// @nodoc
class __$$IdeaScoreItemImplCopyWithImpl<$Res>
    extends _$IdeaScoreItemCopyWithImpl<$Res, _$IdeaScoreItemImpl>
    implements _$$IdeaScoreItemImplCopyWith<$Res> {
  __$$IdeaScoreItemImplCopyWithImpl(
      _$IdeaScoreItemImpl _value, $Res Function(_$IdeaScoreItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? departmentName = freezed,
    Object? tbpName = freezed,
    Object? scoreNew = freezed,
    Object? employeeId = freezed,
    Object? lsDepartmentId = freezed,
    Object? tbpCheck = freezed,
    Object? id = freezed,
    Object? registerIdeaID = freezed,
    Object? departmentId = freezed,
    Object? score = freezed,
    Object? isTBP = freezed,
    Object? isBGD = freezed,
    Object? isApprovedTBP = freezed,
    Object? dateApprovedTBP = freezed,
    Object? approvedTBPID = freezed,
    Object? isApproved = freezed,
    Object? dateApproved = freezed,
    Object? approvedID = freezed,
    Object? isApprovedBGD = freezed,
    Object? dateApprovedBGD = freezed,
    Object? approvedBGDID = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? scoreRating = freezed,
  }) {
    return _then(_$IdeaScoreItemImpl(
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      tbpName: freezed == tbpName
          ? _value.tbpName
          : tbpName // ignore: cast_nullable_to_non_nullable
              as String?,
      scoreNew: freezed == scoreNew
          ? _value.scoreNew
          : scoreNew // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      lsDepartmentId: freezed == lsDepartmentId
          ? _value.lsDepartmentId
          : lsDepartmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      tbpCheck: freezed == tbpCheck
          ? _value.tbpCheck
          : tbpCheck // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      registerIdeaID: freezed == registerIdeaID
          ? _value.registerIdeaID
          : registerIdeaID // ignore: cast_nullable_to_non_nullable
              as int?,
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      isTBP: freezed == isTBP
          ? _value.isTBP
          : isTBP // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBGD: freezed == isBGD
          ? _value.isBGD
          : isBGD // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      isApprovedBGD: freezed == isApprovedBGD
          ? _value.isApprovedBGD
          : isApprovedBGD // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateApprovedBGD: freezed == dateApprovedBGD
          ? _value.dateApprovedBGD
          : dateApprovedBGD // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      approvedBGDID: freezed == approvedBGDID
          ? _value.approvedBGDID
          : approvedBGDID // ignore: cast_nullable_to_non_nullable
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
      scoreRating: freezed == scoreRating
          ? _value.scoreRating
          : scoreRating // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IdeaScoreItemImpl implements _IdeaScoreItem {
  const _$IdeaScoreItemImpl(
      {@JsonKey(name: 'DepartmentName') this.departmentName,
      @JsonKey(name: 'TBPName') this.tbpName,
      @JsonKey(name: 'ScoreNew') this.scoreNew,
      @JsonKey(name: 'EmployeeId') this.employeeId,
      @JsonKey(name: 'LsDepartmentId') this.lsDepartmentId,
      @JsonKey(name: 'tbpCheck') this.tbpCheck,
      @JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'RegisterIdeaID') this.registerIdeaID,
      @JsonKey(name: 'DepartmentID') this.departmentId,
      @JsonKey(name: 'Score') this.score,
      @JsonKey(name: 'IsTBP') this.isTBP,
      @JsonKey(name: 'IsBGD') this.isBGD,
      @JsonKey(name: 'IsApprovedTBP') this.isApprovedTBP,
      @JsonKey(name: 'DateApprovedTBP') this.dateApprovedTBP,
      @JsonKey(name: 'ApprovedTBPID') this.approvedTBPID,
      @JsonKey(name: 'IsApproved') this.isApproved,
      @JsonKey(name: 'DateApproved') this.dateApproved,
      @JsonKey(name: 'ApprovedID') this.approvedID,
      @JsonKey(name: 'IsApprovedBGD') this.isApprovedBGD,
      @JsonKey(name: 'DateApprovedBGD') this.dateApprovedBGD,
      @JsonKey(name: 'ApprovedBGDID') this.approvedBGDID,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'ScoreRating') this.scoreRating});

  factory _$IdeaScoreItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdeaScoreItemImplFromJson(json);

  @override
  @JsonKey(name: 'DepartmentName')
  final String? departmentName;
  @override
  @JsonKey(name: 'TBPName')
  final String? tbpName;
  @override
  @JsonKey(name: 'ScoreNew')
  final String? scoreNew;
  @override
  @JsonKey(name: 'EmployeeId')
  final int? employeeId;
  @override
  @JsonKey(name: 'LsDepartmentId')
  final int? lsDepartmentId;
  @override
  @JsonKey(name: 'tbpCheck')
  final bool? tbpCheck;
  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'RegisterIdeaID')
  final int? registerIdeaID;
  @override
  @JsonKey(name: 'DepartmentID')
  final int? departmentId;
  @override
  @JsonKey(name: 'Score')
  final double? score;
  @override
  @JsonKey(name: 'IsTBP')
  final bool? isTBP;
  @override
  @JsonKey(name: 'IsBGD')
  final bool? isBGD;
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
  @JsonKey(name: 'IsApprovedBGD')
  final bool? isApprovedBGD;
  @override
  @JsonKey(name: 'DateApprovedBGD')
  final DateTime? dateApprovedBGD;
  @override
  @JsonKey(name: 'ApprovedBGDID')
  final int? approvedBGDID;
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
  @JsonKey(name: 'ScoreRating')
  final String? scoreRating;

  @override
  String toString() {
    return 'IdeaScoreItem(departmentName: $departmentName, tbpName: $tbpName, scoreNew: $scoreNew, employeeId: $employeeId, lsDepartmentId: $lsDepartmentId, tbpCheck: $tbpCheck, id: $id, registerIdeaID: $registerIdeaID, departmentId: $departmentId, score: $score, isTBP: $isTBP, isBGD: $isBGD, isApprovedTBP: $isApprovedTBP, dateApprovedTBP: $dateApprovedTBP, approvedTBPID: $approvedTBPID, isApproved: $isApproved, dateApproved: $dateApproved, approvedID: $approvedID, isApprovedBGD: $isApprovedBGD, dateApprovedBGD: $dateApprovedBGD, approvedBGDID: $approvedBGDID, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate, scoreRating: $scoreRating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdeaScoreItemImpl &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.tbpName, tbpName) || other.tbpName == tbpName) &&
            (identical(other.scoreNew, scoreNew) ||
                other.scoreNew == scoreNew) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.lsDepartmentId, lsDepartmentId) ||
                other.lsDepartmentId == lsDepartmentId) &&
            (identical(other.tbpCheck, tbpCheck) ||
                other.tbpCheck == tbpCheck) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.registerIdeaID, registerIdeaID) ||
                other.registerIdeaID == registerIdeaID) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.isTBP, isTBP) || other.isTBP == isTBP) &&
            (identical(other.isBGD, isBGD) || other.isBGD == isBGD) &&
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
            (identical(other.isApprovedBGD, isApprovedBGD) ||
                other.isApprovedBGD == isApprovedBGD) &&
            (identical(other.dateApprovedBGD, dateApprovedBGD) ||
                other.dateApprovedBGD == dateApprovedBGD) &&
            (identical(other.approvedBGDID, approvedBGDID) ||
                other.approvedBGDID == approvedBGDID) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.scoreRating, scoreRating) ||
                other.scoreRating == scoreRating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        departmentName,
        tbpName,
        scoreNew,
        employeeId,
        lsDepartmentId,
        tbpCheck,
        id,
        registerIdeaID,
        departmentId,
        score,
        isTBP,
        isBGD,
        isApprovedTBP,
        dateApprovedTBP,
        approvedTBPID,
        isApproved,
        dateApproved,
        approvedID,
        isApprovedBGD,
        dateApprovedBGD,
        approvedBGDID,
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        scoreRating
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdeaScoreItemImplCopyWith<_$IdeaScoreItemImpl> get copyWith =>
      __$$IdeaScoreItemImplCopyWithImpl<_$IdeaScoreItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdeaScoreItemImplToJson(
      this,
    );
  }
}

abstract class _IdeaScoreItem implements IdeaScoreItem {
  const factory _IdeaScoreItem(
          {@JsonKey(name: 'DepartmentName') final String? departmentName,
          @JsonKey(name: 'TBPName') final String? tbpName,
          @JsonKey(name: 'ScoreNew') final String? scoreNew,
          @JsonKey(name: 'EmployeeId') final int? employeeId,
          @JsonKey(name: 'LsDepartmentId') final int? lsDepartmentId,
          @JsonKey(name: 'tbpCheck') final bool? tbpCheck,
          @JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'RegisterIdeaID') final int? registerIdeaID,
          @JsonKey(name: 'DepartmentID') final int? departmentId,
          @JsonKey(name: 'Score') final double? score,
          @JsonKey(name: 'IsTBP') final bool? isTBP,
          @JsonKey(name: 'IsBGD') final bool? isBGD,
          @JsonKey(name: 'IsApprovedTBP') final bool? isApprovedTBP,
          @JsonKey(name: 'DateApprovedTBP') final DateTime? dateApprovedTBP,
          @JsonKey(name: 'ApprovedTBPID') final int? approvedTBPID,
          @JsonKey(name: 'IsApproved') final bool? isApproved,
          @JsonKey(name: 'DateApproved') final DateTime? dateApproved,
          @JsonKey(name: 'ApprovedID') final int? approvedID,
          @JsonKey(name: 'IsApprovedBGD') final bool? isApprovedBGD,
          @JsonKey(name: 'DateApprovedBGD') final DateTime? dateApprovedBGD,
          @JsonKey(name: 'ApprovedBGDID') final int? approvedBGDID,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy,
          @JsonKey(name: 'UpdatedDate') final DateTime? updatedDate,
          @JsonKey(name: 'ScoreRating') final String? scoreRating}) =
      _$IdeaScoreItemImpl;

  factory _IdeaScoreItem.fromJson(Map<String, dynamic> json) =
      _$IdeaScoreItemImpl.fromJson;

  @override
  @JsonKey(name: 'DepartmentName')
  String? get departmentName;
  @override
  @JsonKey(name: 'TBPName')
  String? get tbpName;
  @override
  @JsonKey(name: 'ScoreNew')
  String? get scoreNew;
  @override
  @JsonKey(name: 'EmployeeId')
  int? get employeeId;
  @override
  @JsonKey(name: 'LsDepartmentId')
  int? get lsDepartmentId;
  @override
  @JsonKey(name: 'tbpCheck')
  bool? get tbpCheck;
  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'RegisterIdeaID')
  int? get registerIdeaID;
  @override
  @JsonKey(name: 'DepartmentID')
  int? get departmentId;
  @override
  @JsonKey(name: 'Score')
  double? get score;
  @override
  @JsonKey(name: 'IsTBP')
  bool? get isTBP;
  @override
  @JsonKey(name: 'IsBGD')
  bool? get isBGD;
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
  @JsonKey(name: 'IsApprovedBGD')
  bool? get isApprovedBGD;
  @override
  @JsonKey(name: 'DateApprovedBGD')
  DateTime? get dateApprovedBGD;
  @override
  @JsonKey(name: 'ApprovedBGDID')
  int? get approvedBGDID;
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
  @JsonKey(name: 'ScoreRating')
  String? get scoreRating;
  @override
  @JsonKey(ignore: true)
  _$$IdeaScoreItemImplCopyWith<_$IdeaScoreItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IdeaFileItem _$IdeaFileItemFromJson(Map<String, dynamic> json) {
  return _IdeaFileItem.fromJson(json);
}

/// @nodoc
mixin _$IdeaFileItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'RegisterIdeaID')
  int? get registerIdeaID => throw _privateConstructorUsedError;
  @JsonKey(name: 'FileName')
  String? get fileName => throw _privateConstructorUsedError;
  @JsonKey(name: 'OriginPath')
  String? get originPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'ServerPath')
  String? get serverPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdeaFileItemCopyWith<IdeaFileItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdeaFileItemCopyWith<$Res> {
  factory $IdeaFileItemCopyWith(
          IdeaFileItem value, $Res Function(IdeaFileItem) then) =
      _$IdeaFileItemCopyWithImpl<$Res, IdeaFileItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'RegisterIdeaID') int? registerIdeaID,
      @JsonKey(name: 'FileName') String? fileName,
      @JsonKey(name: 'OriginPath') String? originPath,
      @JsonKey(name: 'ServerPath') String? serverPath,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate});
}

/// @nodoc
class _$IdeaFileItemCopyWithImpl<$Res, $Val extends IdeaFileItem>
    implements $IdeaFileItemCopyWith<$Res> {
  _$IdeaFileItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? registerIdeaID = freezed,
    Object? fileName = freezed,
    Object? originPath = freezed,
    Object? serverPath = freezed,
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
      registerIdeaID: freezed == registerIdeaID
          ? _value.registerIdeaID
          : registerIdeaID // ignore: cast_nullable_to_non_nullable
              as int?,
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      originPath: freezed == originPath
          ? _value.originPath
          : originPath // ignore: cast_nullable_to_non_nullable
              as String?,
      serverPath: freezed == serverPath
          ? _value.serverPath
          : serverPath // ignore: cast_nullable_to_non_nullable
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IdeaFileItemImplCopyWith<$Res>
    implements $IdeaFileItemCopyWith<$Res> {
  factory _$$IdeaFileItemImplCopyWith(
          _$IdeaFileItemImpl value, $Res Function(_$IdeaFileItemImpl) then) =
      __$$IdeaFileItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'RegisterIdeaID') int? registerIdeaID,
      @JsonKey(name: 'FileName') String? fileName,
      @JsonKey(name: 'OriginPath') String? originPath,
      @JsonKey(name: 'ServerPath') String? serverPath,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate});
}

/// @nodoc
class __$$IdeaFileItemImplCopyWithImpl<$Res>
    extends _$IdeaFileItemCopyWithImpl<$Res, _$IdeaFileItemImpl>
    implements _$$IdeaFileItemImplCopyWith<$Res> {
  __$$IdeaFileItemImplCopyWithImpl(
      _$IdeaFileItemImpl _value, $Res Function(_$IdeaFileItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? registerIdeaID = freezed,
    Object? fileName = freezed,
    Object? originPath = freezed,
    Object? serverPath = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
  }) {
    return _then(_$IdeaFileItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      registerIdeaID: freezed == registerIdeaID
          ? _value.registerIdeaID
          : registerIdeaID // ignore: cast_nullable_to_non_nullable
              as int?,
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      originPath: freezed == originPath
          ? _value.originPath
          : originPath // ignore: cast_nullable_to_non_nullable
              as String?,
      serverPath: freezed == serverPath
          ? _value.serverPath
          : serverPath // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IdeaFileItemImpl implements _IdeaFileItem {
  const _$IdeaFileItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'RegisterIdeaID') this.registerIdeaID,
      @JsonKey(name: 'FileName') this.fileName,
      @JsonKey(name: 'OriginPath') this.originPath,
      @JsonKey(name: 'ServerPath') this.serverPath,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate});

  factory _$IdeaFileItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdeaFileItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'RegisterIdeaID')
  final int? registerIdeaID;
  @override
  @JsonKey(name: 'FileName')
  final String? fileName;
  @override
  @JsonKey(name: 'OriginPath')
  final String? originPath;
  @override
  @JsonKey(name: 'ServerPath')
  final String? serverPath;
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
  String toString() {
    return 'IdeaFileItem(id: $id, registerIdeaID: $registerIdeaID, fileName: $fileName, originPath: $originPath, serverPath: $serverPath, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdeaFileItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.registerIdeaID, registerIdeaID) ||
                other.registerIdeaID == registerIdeaID) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.originPath, originPath) ||
                other.originPath == originPath) &&
            (identical(other.serverPath, serverPath) ||
                other.serverPath == serverPath) &&
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
  int get hashCode => Object.hash(runtimeType, id, registerIdeaID, fileName,
      originPath, serverPath, createdBy, createdDate, updatedBy, updatedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdeaFileItemImplCopyWith<_$IdeaFileItemImpl> get copyWith =>
      __$$IdeaFileItemImplCopyWithImpl<_$IdeaFileItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdeaFileItemImplToJson(
      this,
    );
  }
}

abstract class _IdeaFileItem implements IdeaFileItem {
  const factory _IdeaFileItem(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'RegisterIdeaID') final int? registerIdeaID,
          @JsonKey(name: 'FileName') final String? fileName,
          @JsonKey(name: 'OriginPath') final String? originPath,
          @JsonKey(name: 'ServerPath') final String? serverPath,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy,
          @JsonKey(name: 'UpdatedDate') final DateTime? updatedDate}) =
      _$IdeaFileItemImpl;

  factory _IdeaFileItem.fromJson(Map<String, dynamic> json) =
      _$IdeaFileItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'RegisterIdeaID')
  int? get registerIdeaID;
  @override
  @JsonKey(name: 'FileName')
  String? get fileName;
  @override
  @JsonKey(name: 'OriginPath')
  String? get originPath;
  @override
  @JsonKey(name: 'ServerPath')
  String? get serverPath;
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
  @JsonKey(ignore: true)
  _$$IdeaFileItemImplCopyWith<_$IdeaFileItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
