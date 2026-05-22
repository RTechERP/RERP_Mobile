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
